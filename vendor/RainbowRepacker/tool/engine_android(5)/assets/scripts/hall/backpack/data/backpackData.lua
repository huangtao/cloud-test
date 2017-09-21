require("gameData/gameData");
require("core/dict");
require("hall/backpack/data/typeAdapter");
require("hall/php/phpManager");

local BackpackData = class(GameData);

local h_index = 0;
local getIndex = function(self)
    h_index = h_index + 1;
    return h_index;
end

local _orderNum = 0;

local getOrder = function(self)
    _orderNum = _orderNum - 1;
    return _orderNum;
end

-- 背包数据最大拉取次数
BackpackData.s_defaultMaxCount = 3;
BackpackData.s_serverUnitsNumForPage = 12;--背包每一页显示最多数量3*4
BackpackData.s_clientUnitsNumForPage = 12;--服务器分页是传输限制，客户端分页是设计需求，
                                                --此分页非彼分页，应该分开。
BackpackData.s_goldBoxId = 0                
BackpackData.s_diamondBoxId = 2
BackpackData.s_crystalBoxId = 1

BackpackData.Delegate = {
    onGetBagListCallBack = "onGetBagListCallBack",
    setIconRed = "setIconRed",
    dataUpdated = "dataUpdated",
};

BackpackData.ctor = function(self)
    self.m_getedAllPage = false;
    self.m_connectTimeAndPage = {};
    self.isFirst = true;
    self.m_tmpDataFromServer = {};
end

BackpackData.dtor = function(self)
   
end

BackpackData.initData = function(self)
    
end

--根据物品ID得到得到相关属形
BackpackData.getPropInfoByType = function(self,p_boxId,p_gatherId)  --如果没有gatherId则为nil
    for k1,v1 in pairs(self.m_bagList) do
        for k2,v2 in pairs(v1) do
            if tonumber(p_boxId) == tonumber(v2.boxItemID) and tonumber(p_gatherId) == tonumber(v2.gatherId) then
                return v2;
            end
        end
    end
    return nil;
end

--得到社交的物品
BackpackData.getSocialProps = function (self)
	local props = {};

     for k1,v1 in pairs(self.m_bagList) do
        for k2,v2 in pairs(v1) do
            if tonumber(v2.boxItemID) >= 200 and tonumber(v2.boxItemID) <= 249 then 
			    table.insert(props, table.copyTab(v2));
		    end
        end
    end

    return props;
end

--用变化了的数据和之前的数据进行合成
BackpackData.refreshData = function(self, data,isPush) --isPush:如果是后台推送，同时又增加物品则刷新红点，否则不刷新
    
    if table.isEmpty(data) then
        return;
    end

    local isHaveAdd = false;

    local addObject = {};
    for k,v in pairs(data) do

        local _isMoney = self:isMoney(v);
        if _isMoney then

        else
            --判断是否有增加东西
            local _tmpNum = tonumber(v.changeNum) or 0;
            if _tmpNum > 0 then
                isHaveAdd = true;
            end

            --防止服务传一个空表过来
            if not table.isEmpty(v) then
                --定位到页
                local isFinded = false;
                for k1,v1 in pairs(self.m_bagList) do
                    --定位到具体物品
                    for k2,v2 in pairs(v1) do
                        --之前的物品列表有改物品
                        if tonumber(v.boxItemID) == tonumber(v2.boxItemID) and tonumber(v.gatherId) == tonumber(v2.gatherId) then
                            isFinded = true;
                            v2.itemNum = tonumber(v.changeNum) + tonumber(v2.itemNum);
                            --物品增加顺序改变
                            if tonumber(v.changeNum) > 0 then
                                v2.sort = getOrder();
                            end
                            --没有了移掉该物品
                            if v2.itemNum <= 0 then
                                v1[k2] = nil;
                            end
                            break;
                        end
                    end

                    if isFinded then
                        break;
                    end
           
                end
                --之前没有的物品集中放在一个表里
                if not isFinded then
                    if tonumber(v.changeNum) > 0 then  --容错处理
                        v.itemNum = v.changeNum;
                        v.sort = getOrder();
                        table.insert(addObject,v);
                    end
                end
            else
                Log.v("BackpackData.refreshData", data);
            end

        end
        
    end

    --把加的物品作为一个页加入原来的数据
    if not table.isEmpty(addObject) then
        table.insert(self.m_bagList,addObject);
    end

    if isPush and isHaveAdd then
         --显示红点
        self:execDelegate(BackpackData.Delegate.setIconRed, true);
    end

    self:saveData();

    self:execDelegate(BackpackData.Delegate.dataUpdated);
end

--刷新指定道具属性
BackpackData.refreshSomePropForOld = function(self,p_data)

    if table.isEmpty(p_data) then
        return ;
    end

    for k,v in pairs(p_data) do
        local __isFinded = false;
        for k2,v2 in pairs(self.m_bagList) do
            for k3,v3 in pairs(v2) do
                if tonumber(v.boxItemID) == tonumber(v3.boxItemID) and tonumber(v.gatherId) == tonumber(v3.gatherId) then
                    --使用原来的数量
                    v.itemNum = v3.itemNum;
                    v2[k3] = v;
                    __isFinded = true;
                    break;
                end
            end 
            if __isFinded then
                break;
            end
        end
    end

    self:saveData();
end

--刷新普通物品数目
BackpackData.refreshNormalPropNum = function(self, propId, num)
    if not propId or number.valueOf(num, -1) < 0 then
        return;
    end

    for _, pageList in pairs(self.m_bagList) do
        for k, v in pairs(pageList) do
            if number.valueOf(v.boxItemID) == number.valueOf(propId) then
                v.itemNum = number.valueOf(num);

                if v.itemNum <= 0 then
                    pageList[k] = nil;
                end
                return;
            end
        end
    end
end

BackpackData.isMoney = function(self, data)

    local _isMoney = false;

    local _moneyIdTables = {
        {
            id = BackpackData.s_goldBoxId,
            propertyId = RechargeDataInterface.getInstance():getPropertySilverCoinID();
        },

        {
            id = BackpackData.s_diamondBoxId,
            propertyId = RechargeDataInterface.getInstance():getPropertyDiamondID();
        },

        {
            id = BackpackData.s_crystalBoxId,
            propertyId = RechargeDataInterface.getInstance():getPropertyGoldBarID();
        },
    }

    for k,v in pairs(_moneyIdTables) do
        if v.id == tonumber(data.boxItemID) then

            local lastNum = kUserInfoData:getMoneyById(v.propertyId);
            kUserInfoData:setMoneyById(v.propertyId,lastNum + number.valueOf(data.changeNum));

            _isMoney = true;
            break;
        end
    end
   
    return _isMoney
end

BackpackData.getBagList = function(self, updateLater)
    if self.m_bagList then
        self:formatDataAndHandleDelegate(true, self.m_bagList);
    end

    --进入游戏只拉取一次数据
    if self.isFirst then
        self.m_connectCounts = {};
        self:getBagListByPageAndInit(1);
        self.isFirst = false;
    end

end

BackpackData.getBagListByPageAndInit = function(self, page)
    self.m_connectCounts[page] = BackpackData.s_defaultMaxCount;
    self:getBagListByPage(page);
end 

BackpackData.getBagListByPage = function(self, page)
    if not page then
        return;
    end

    if self.m_connectCounts[page] <= 0 then
        self:_getPageError();
        return;
    end

    if not self.m_connectTimeAndPage or page == 1 then
        self.m_connectTimeAndPage = {};
        self.m_getedAllPage = false;
    end

    local param = {
        page = page,
        pagenum = BackpackData.s_serverUnitsNumForPage,
        hall_version = kGameManager:getGameVersion(GameType.HALL),
        seqIndex = getIndex(),
    };

    OnlineSocketManager.getInstance():sendMsg(PHP_PACKAGE_BAGLIST, param, 6000);
    self.m_connectTimeAndPage[param.seqIndex] = page;
    self.m_connectCounts[page] = self.m_connectCounts[page] - 1;
end

BackpackData.handleServerDataByPage = function(self, data, sendParam) 
    if table.isEmpty(data) then
        return;
    end

    if not table.isEmpty(data) then
        local list = {};
        local tpage = tonumber(data.tpage);
        local page = tonumber(data.page);
        if page == 1 then
            self.m_tmpDataFromServer = {};
            if tpage > 1 then
                for i=2 ,tpage do
                    self:getBagListByPageAndInit(i);
                end
            end
        end
        self.m_connectTimeAndPage[sendParam.seqIndex] = nil;
    
        self.m_tmpDataFromServer[page] = data.box;

        if table.maxn(self.m_connectTimeAndPage) == 0 then
            self.m_bagList = table.verify(self.m_tmpDataFromServer);
            self:saveData();
            self:_allPageFinish(true);
        end
    else
        local page = self.m_connectTimeAndPage[sendParam.seqIndex];
        if page then
            self.m_connectTimeAndPage[sendParam.seqIndex] = nil;
            self:getBagListByPage(page);
        end
    end
end

BackpackData.onGetBagListByPageCallback = function(self, isSuccess, data, sendParam)
    if not sendParam or not sendParam.seqIndex then
        return;
    end

    if isSuccess then
        self:handleServerDataByPage(data, sendParam);
    else
        local page = self.m_connectTimeAndPage[sendParam.seqIndex];
        if page then
            self.m_connectTimeAndPage[sendParam.seqIndex] = nil;
            self:getBagListByPage(page);
        end
    end
end

BackpackData.formatDataAndHandleDelegate = function(self,isSuccess,data)
    local formatData = self:_analysisData(data);
    self:execDelegate(BackpackData.Delegate.onGetBagListCallBack, isSuccess, formatData);
end

-------------------------------------------------------------------
--virtual
BackpackData.loadDictData = function(self, dict)
    self.m_bagList = table.verify(json.decode(dict:getString("newObjectCase_data")));
end

--virtual
BackpackData.saveDictData = function(self, dict)
    local data = json.encode(self.m_bagList) or "";
    dict:setString("newObjectCase_data", data);
end

--virtual
BackpackData.getDictKeyVersion = function(self)
    return "900"; --差量更新配置
end

--virtual
BackpackData.getLocalDictName = function(self)
    self.m_userId = self.m_userId or kUserInfoData:getUserId();
    return "dic_newObjectCase_"..self.m_userId;
end

-------------------------------------------------------------------
BackpackData._analysisData = function(self, data)
    if type(data) ~= "table" then
        return;
    end 
    local tmpData = {};
    tmpData = self:mergeTable(data);
    tmpData = self:fillAndformatData(tmpData);
    tmpData = self:sort(tmpData);

    return tmpData;
end 

--合并分页数据
BackpackData.mergeTable = function(self,data)
    local megerTable = {}; 
    if not table.isEmpty(data) then
         if #data > 1 then
            for k,v in pairs(data) do
                if type(v) == "table" then
                    for k1,v1 in pairs(v) do
                        table.insert(megerTable,v1);
                    end
                end
            end   
        elseif #data == 1 then
            megerTable = data[1];
        else
                
        end 
    end 

    return megerTable;
end

--补全适配服务器数据
BackpackData.fillAndformatData = function(self,data)
    if type(data) ~= "table" then
        return;
    end 

    local tmpTable = {};
    for k,v in pairs(data) do
        if type(v) == "table" then
            local item = {};
            item.id = tonumber(v.boxItemID) or 0;   --道具id 对应的props.propsCfg
            item.sort = tonumber(v.sort) or 10000;  --如果没有顺序的放到最后去。
            item.serverType1 = tonumber(v.boxType) or 0;
            item.serverType2 = tonumber(v.smallType) or -1;
            item.isCanUse = tonumber(v.isBoxUse) or 0;
            item.number = tonumber(v.itemNum) or 0;
            item.gatherId = tonumber(v.gatherId) or nil; --用于映射非普通道具的id
            ------------------------专有属性--------------------
            item.day = tonumber(v.expires) or -1;
            item.compoundNum = tonumber(v.compoundNum) or 0;   --compoundNum个物品“A”可合成1个"B"
            item.twoDimensionCodePath = v.qrcode or "";
            item.address = v.address or {};
            item.phone = v.phone or {};
            item.isGeted = tonumber(v.status) or 1;
            item.twoDimensionCodeText = v.conditionCode or "";
			item.matchName = v.matchName or "";
            item.starttime = v.starttime or 0;
            item.expiresSec = v.expiresSec or 0;
            item.prizeDesc = v.prizeDesc or "";
            --改变 item.compoundNum 的意义 
            if k_bagTypeAdapter:getClientType(item.serverType1,item.serverType2) == BagTypeAdapter.s_shard and item.compoundNum ~= 0 then
                local tmp;
                item.compoundNum,tmp= math.modf(item.number/item.compoundNum);
            end
            --900 版本新合成
            item.compoundTable = self:__formatCompoundData(v.compound);

            item.reverse = v.reverse or {};
            item.canExchange = true;
            if table.isEmpty(item.reverse) then
                item.canExchange = false;
            end
            ------------------------补全------------------------
            --补充客户类型
            item.clientType = k_bagTypeAdapter:getClientType(item.serverType1,item.serverType2);

            local propInfo = RechargeDataInterface.getInstance():getGoodInfoByTypeIdWithMap(item.id);
            propInfo = table.verify(propInfo); --后台很有可能没有配清所有的物品
            --icon补全
            item.iconPath = propInfo.item_icon or "";
            --描述补全
            item.desc =  propInfo.item_desc or "";
            item.typeDes =  propInfo.type_desc or "";
            item.name = propInfo.item_name or "";
            item.clientPhoneNunber = "" 
            
            --是否警告
            item.isWarn = false;
            if type(item.day) == "number" and item.day <= 1 then
                item.isWarn = true;
            end
            
            table.insert(tmpTable,item);
        end    
    end 

    return tmpTable;   
end

--格式化并补全合成数据
BackpackData.__formatCompoundData = function(self,p_original_data)
    p_original_data = table.verify(p_original_data);
    local __formatDataTable = {};
    for __kk,__vv in pairs(p_original_data) do
        local __tempTable = {}
        __tempTable.debris_num = tonumber(__vv.debris_num) or 0 ;
        __tempTable.target_id = tonumber(__vv.target_id) or 0 ;

        local propInfo = RechargeDataInterface.getInstance():getGoodInfoByTypeIdWithMap(__tempTable.target_id);
        propInfo = table.verify(propInfo); --后台很有可能没有配清所有的物品
        __tempTable.target_name= propInfo.item_name or "";
        table.insert(__formatDataTable,__tempTable);
    end
    return __formatDataTable;
end

--排序
BackpackData.sort = function(self,data)
    if type(data) ~= "table" then
        return;
    end

     table.sort(data,function(a,b)
            return number.valueOf(a.sort,0) < number.valueOf(b.sort,1);
        end)

     return data;
end


BackpackData._allPageFinish = function(self, flag)
    if flag ~= nil then
        self.m_getedAllPage = flag;
    end

    if self.m_bagList and self.m_getedAllPage then
        self:formatDataAndHandleDelegate(true, self.m_bagList);
    end
end

BackpackData._getPageError = function(self)
    self.m_bagList = {};
    self:saveData();
    self:formatDataAndHandleDelegate(false, self.m_bagList);
end

BackpackData.s_socketCmdFuncMap = {
    [PHP_PACKAGE_BAGLIST]                   = BackpackData.onGetBagListByPageCallback;

}

return BackpackData;