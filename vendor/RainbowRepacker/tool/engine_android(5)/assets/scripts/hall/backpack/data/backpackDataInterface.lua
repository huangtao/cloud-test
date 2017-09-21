require("gameData/dataInterfaceBase");
require("hall/backpack/data/typeAdapter");
require("common/loadingView");

BackpackDataInterface = class(DataInterfaceBase);

BackpackDataInterface.Delegate = {
    onSellCallBack       = "onSellCallBack",
    onGetBagListCallBack = "onGetBagListCallBack",
    onGetRecordCallBack  = "onGetRecordListInfoCallBack" ,
    onUseCallBack        = "onUseCallBack",
    onOffLineCallBack    = "onOffLineCallBack",
    changeCheckState     = "changeCheckState",
    onChangeRecordToRed  = "onChangeRecordToRed",
    ----------------------------------------------------------
    toChangeNewObjectCaseRedState = "toChangeNewObjectCaseRedState";
    onGoToMatch                   = "onMatchBtnClick";
    dataUpdated                   = "dataUpdated";
    onExchangeApplyExamine        = "onExchangeApplyExamine",
};

BackpackDataInterface.getInstance = function()
    if not BackpackDataInterface.s_instance then
        BackpackDataInterface.s_instance = new(BackpackDataInterface);
    end

    return BackpackDataInterface.s_instance;
end

BackpackDataInterface.releaseInstance = function()
    delete(BackpackDataInterface.s_instance);
    BackpackDataInterface.s_instance = nil;
end

BackpackDataInterface.ctor = function(self)
    local BackpackData = require("hall/backpack/data/backpackData");
    self.m_data = new(BackpackData,self);                 --背包列表

    local BackpackRecordData = require("hall/backpack/data/backRecordData");
    self.m_dataRecord = new(BackpackRecordData,self);  --历史纪录
    self.m_bagPos = {x=0,y=0};                                 --大厅背包ICON在世界坐标中的位置
    self.m_isCompounding = false;                              --是否正在进行合成操作   
    self.m_needFreshPropIds = {};      
end 

BackpackDataInterface.dtor = function(self)
    delete(self.m_data);
    self.m_data = nil;

    delete(self.m_dataRecord);
    self.m_dataRecord = nil;

    delete(self.m_localData);
    self.m_localData = nil;
end

BackpackDataInterface.cleanup = function()
    local lastObserverMap = BackpackDataInterface.getInstance():getObserverMap();
    delete(BackpackDataInterface.s_instance);
    BackpackDataInterface.s_instance = nil;
    BackpackDataInterface.getInstance():setObserverMap(lastObserverMap);
end

--刷新物品信息
BackpackDataInterface.refreshBagData = function(self,data,isPush)
                                                          --isPush客户端调用时直接为nil
    self.m_data:refreshData(data,isPush);
    self:getBagList(false);
end

--老接口专用
BackpackDataInterface.oldUpdatePropNum = function(self,p_boxId,p_totalNum)
    --防呆，数据校验

    if not p_boxId then
        return;
    end

    if not tonumber(p_boxId) then
        return;
    end

    if not tonumber(p_totalNum) then
        return;
    end

    if number.valueOf(p_totalNum, -1) < 0 then
        return;
    end

    p_totalNum = tonumber(p_totalNum);

    local _proInfo = self.m_data:getPropInfoByType(p_boxId,nil);
    self:updatePropNum(p_boxId,nil,p_totalNum);

    if not _proInfo then
        --请求刷新属性。
        self:__addToRequireProp(p_boxId);
    end

end

--申请属性
BackpackDataInterface.__addToRequireProp = function(self,p_boxId)
    if type(p_boxId) ~= 'number' then
        return;
    end 

    table.insert(self.m_needFreshPropIds,p_boxId);

    --加定时器的目的是防止一帧内频繁对PHP进行请求
    if #self.m_needFreshPropIds == 1 then
        Clock.instance():schedule_once(function()
            self:__requireProp();
            self.m_needFreshPropIds = {};
        end,0.01);
    end
end

BackpackDataInterface.__requireProp = function(self)
     local param = {
        hall_version = kGameManager:getGameVersion(GameType.HALL),
        boxItemIDs = self.m_needFreshPropIds;
    };

    OnlineSocketManager.getInstance():sendMsg(PHP_PACKAGE_REFRESH_PROP, param, 6000);
end

BackpackDataInterface.onRequirePropCallBack = function(self,isSuccess, data, sendParam)
    
    if isSuccess and data then
        if not table.isEmpty(data.data) then
            self.m_data:refreshSomePropForOld(data.data);
        end
    end

end


--专门刷新数据总量
BackpackDataInterface.updatePropNum = function(self,p_boxId,p_gatherId,p_totalNum)
    
    --防呆，数据校验

    if not p_boxId then
        return;
    end

    if not tonumber(p_boxId) then
        return;
    end

    if not tonumber(p_totalNum) then
        return;
    end

    if number.valueOf(p_totalNum, -1) < 0 then
        return;
    end

    p_totalNum = tonumber(p_totalNum);

    local _proInfo = self.m_data:getPropInfoByType(p_boxId,p_gatherId);
    local _addNum = 0;
    if _proInfo and _proInfo.itemNum then
        _addNum = p_totalNum - (tonumber(_proInfo.itemNum) or 0);
    else
        _addNum = p_totalNum;
    end

    local _freshData = {{boxItemID = p_boxId,gatherId = p_gatherId,changeNum = _addNum}};
    self.m_data:refreshData(_freshData,true);
    self:getBagList(false);
end

--专门刷新数据增量
BackpackDataInterface.updatePropaddNum = function(self,p_boxId,p_gatherId,p_addNum)
    local _freshData = {{boxItemID = p_boxId,gatherId = p_gatherId,changeNum = p_addNum}};
    self.m_data:refreshData(_freshData,true);
    self:getBagList(false);
end

--根据物品ID得到物品属性
BackpackDataInterface.getPropInfoByType = function(self,p_boxId,p_gatherId)
    return self.m_data:getPropInfoByType(p_boxId,p_gatherId);
end

--得到物品数量
BackpackDataInterface.getPropNumByPropType = function(self,p_boxId,p_gatherId)
    local _proInfo = self.m_data:getPropInfoByType(p_boxId,p_gatherId);
    local _num = 0;
    if _proInfo and _proInfo.itemNum then
        _num = _proInfo.itemNum;
    end
    return _num;
end

--得到社交道具
BackpackDataInterface.getSocialProps = function(self)
    return self.m_data:getSocialProps();
end


--用时再创建
BackpackDataInterface.getLocalDataInstance = function(self)
    if self.m_localData == nil then
        self.m_localData = new(LocalPlayerInfoDict,self);          --本地玩家发货信息，本地记录
    end
    return self.m_localData;
end
--是否正在合成物品操作
BackpackDataInterface.getIsCompounding = function(self)
    return self.m_isCompounding;
end

--设置是否正在进行物品合成操作
BackpackDataInterface.setIsCompounding = function(self,p_isCompounding)
    self.m_isCompounding = p_isCompounding;
end

--去比赛
BackpackDataInterface.onGoToMatch = function(self)
   self:notify(BackpackDataInterface.Delegate.onGoToMatch);
end

--设置保存背包在大厅的世界位置
BackpackDataInterface.getBagPos = function(self)
    return self.m_bagPos;
end

--获得客服电话
BackpackDataInterface.setBagPos = function(self,p_pos)
    self.m_bagPos = p_pos;
end

--获得客服电话
BackpackDataInterface.getHotline = function(self)
    return HallDataInterface.getInstance():getHotline() or "";
end
--拨打客服电话
BackpackDataInterface.callHotline = function(self)
    HallDataInterface.getInstance():callHotline();
end

--线下物品兑换成功推送消息
BackpackDataInterface.onPushOffline = function(self, isSuccess, data)
    self:onOfflineGiveObjectSuccess(isSuccess, data);
end

--改变兑奖记录红色状态 
BackpackDataInterface.setRecordTabRed = function(self,isRed,isOnlyChangeData)  
    local _lastState = false;

    if type(isRed) == "nil" then
        local _recordFlagText = self:getLocalDataInstance():getValue("record_addFlag");
        if tonumber(_recordFlagText) and tonumber(_recordFlagText) == 1 then
            _lastState = true;
        end
    end

    if type(isRed) == "boolean" then
        local _recordText = (isRed == true and "1" or "0"); 
        self:getLocalDataInstance():setValue("record_addFlag",_recordText);
        _lastState = isRed;
    end
    if not isOnlyChangeData then
        self:notify(BackpackDataInterface.Delegate.onChangeRecordToRed,_lastState);
    end
end

--改变外面新物品icon的红色状态 
BackpackDataInterface.setIconRed = function(self,isRed,isOnlyChangeData)
    local _lastState = false;

    if type(isRed) == "nil" then
        local _bagFlagText = self:getLocalDataInstance():getValue("bag_addFlag");
        if tonumber(_bagFlagText) and tonumber(_bagFlagText) == 1 then
            _lastState = true;
        end
    end

    if type(isRed) == "boolean" then
        local _flagText = (isRed == true and "1" or "0"); 
        self:getLocalDataInstance():setValue("bag_addFlag",_flagText);
        _lastState = isRed;
    end

    if not isOnlyChangeData then
        self:notify(BackpackDataInterface.Delegate.toChangeNewObjectCaseRedState,_lastState);
    end
end

--后台物品数量变化推送消息
BackpackDataInterface.onPushBagChange = function(self, isSuccess, data)
    if isSuccess then
        self:refreshBagData(data,true);
        self:getBagList(false);
    end
end

--后台物兑奖记录变化推送消息
BackpackDataInterface.onPushRecordChange = function(self, isSuccess, data)
    self:getRecordListInfo(true);
    self:setRecordTabRed(true);
end

--获取物品箱信息
BackpackDataInterface.getBagList = function(self, updateLater)
    self.m_data:getBagList(updateLater);
end

--获取物品箱信息成功回调
BackpackDataInterface.onGetBagListCallBack = function(self, isSuccess, data)
    self:notify(BackpackDataInterface.Delegate.onGetBagListCallBack, isSuccess, data);
end

--根据propId刷新物品数目
BackpackDataInterface.refreshNormalPropNum = function(self, propId, num)
    self.m_data:refreshNormalPropNum(propId, num);
end

--碎片合成
BackpackDataInterface.shardMerge = function(self,p_data,p_targetId)
    self:setIsCompounding(true);
    local param = {
        boxItemID = p_data.id,
        gatherId = p_data.gatherId,
        itemNum = p_data.number,
        target_id = p_targetId,
        hall_version = kGameManager:getGameVersion(GameType.HALL),

        --专有参数
        --name = self:getLocalDataInstance():getValue("entity_name");        --姓名
        --address = self:getLocalDataInstance():getValue("entity_addess");   --地址
        --phone = self:getLocalDataInstance():getValue("virtual_phone");     --充话费的手机号码
        --phone = self:getLocalDataInstance():getValue("entity_phone");      --线上实物发货时玩家的联系方式

        --客户端方便自己用的
        clientType = p_data.clientType                          --客户端自定义类型
    };
    self:_use(param);
end

--碎片合成回调
BackpackDataInterface.onShardMergeCallBack = function(self, isSuccess, data, sendParam )
    if isSuccess then
        self:refreshBagData(data.info);
        Clock.instance():schedule_once(function()
        require("isolater/widget/layerManagerIsolater");
        LayerManagerIsolater.getInstance():hide("case_shard_use");
        LayerManagerIsolater.getInstance():hide("case_detail_shard");
        local _instance = kCaseOperationInstance:getInterfaceByType(sendParam.clientType);
        _instance:successCallBack(data);
        end);
    else
        local msg = ""..data.errorTips;
        Toast.getInstance():showText(msg, 50, 30, kAlignLeft, "", 24, 200, 175, 110);  
        self:setIsCompounding(false);
    end
end

--分解礼包
BackpackDataInterface.useGiftBag = function(self,p_data )
    local param = {
        boxItemID = p_data.id,
        gatherId = p_data.gatherId,
        itemNum = p_data.number,
        hall_version = kGameManager:getGameVersion(GameType.HALL),

        --专有参数
        --name = self:getLocalDataInstance():getValue("entity_name");        --姓名
        --address = self:getLocalDataInstance():getValue("entity_addess");   --地址
        --phone = self:getLocalDataInstance():getValue("virtual_phone");     --充话费的手机号码
        --phone = self:getLocalDataInstance():getValue("entity_phone");      --线上实物发货时玩家的联系方式

        --客户端方便自己用的
        clientType = p_data.clientType                          --客户端自定义类型
    };
    self:_use(param);
end

--分解礼包回调
BackpackDataInterface.onUseGiftBagCallBack = function(self, isSuccess, data, sendParam )
    if isSuccess then
        self:refreshBagData(data.info);
        require("isolater/widget/layerManagerIsolater");
        LayerManagerIsolater.getInstance():hide("case_giftBag_use");

        local temp = {};
        for k, v in pairs(table.verify(data.award)) do 
            local param = {};
            local goodsInfo = table.verify(RechargeDataInterface.getInstance():getGoodInfoByTypeId(v.itemId));
            param.icon = goodsInfo.item_icon;
            param.sort = goodsInfo.sort;
            param.name = goodsInfo.item_name;
            param.num =  v.num;
            table.insert(temp, param);
        end
        if not table.isEmpty(temp) then
            GetRewardAnimManager.getInstance():play(temp);
        end

    else
        local msg = ""..data.errorTips;
        Toast.getInstance():showText(msg, 50, 30, kAlignLeft, "", 24, 200, 175, 110);        
    end
    
end


--丢弃物品
BackpackDataInterface.abandon = function(self,p_data)
      local param = {
        boxItemID = p_data.id,
        gatherId = p_data.gatherId,
        itemNum = p_data.number,
        hall_version = kGameManager:getGameVersion(GameType.HALL),

        --专有参数
        --name = self:getLocalDataInstance():getValue("entity_name");        --姓名
        --address = self:getLocalDataInstance():getValue("entity_addess");   --地址
        --phone = self:getLocalDataInstance():getValue("virtual_phone");     --充话费的手机号码
        --phone = self:getLocalDataInstance():getValue("entity_phone");      --线上实物发货时玩家的联系方式

        --客户端方便自己用的
        clientType = p_data.clientType                          --客户端自定义类型
    };
    self:_use(param);
end


--丢弃物品回调
BackpackDataInterface.onAbandonCallBack = function(self, isSuccess, data, sendParam )

    if not isSuccess then
        local msg = ""..data.errorTips;
        Toast.getInstance():showText(msg, 50, 30, kAlignLeft, "", 24, 200, 175, 110);
        return;
    end
    
    self:refreshBagData(data.info);
    require("isolater/widget/layerManagerIsolater");
    LayerManagerIsolater.getInstance():hide("case_abandonTips");
end

--线下领取成功通知
BackpackDataInterface.onOfflineGiveObjectSuccess = function(self, isSuccess, data )
    if isSuccess then
        self:refreshBagData(data.info);
        self:resetBackpackRecordRequsetStaus();
    else
        return;
    end
    local sendParam = {};
    sendParam.clientType = BagTypeAdapter.s_offline;
    local __isExist,__wnd = LayerManagerIsolater.getInstance():isExist("case_list_ui");
    if __isExist then
        Clock.instance():schedule_once(function()
        require("isolater/widget/layerManagerIsolater");
        LayerManagerIsolater.getInstance():hide("case_offline_use");
        local _instance = kCaseOperationInstance:getInterfaceByType(sendParam.clientType);
        _instance:successCallBack(data);
        end);
    end
end

--商家物品兑换申请审核通知
BackpackDataInterface.onExchangeApplyExamine = function(self, isSuccess, data)
    self:notify(BackpackDataInterface.Delegate.onExchangeApplyExamine, isSuccess, data)
end

--线上手机领取话费
BackpackDataInterface.getPhoneCharge = function(self,p_data )

    local param = {
        boxItemID = p_data.id,
        gatherId = p_data.gatherId,
        itemNum = p_data.number,

        --专有参数
        name = self:getLocalDataInstance():getValue("entity_name");        --姓名
        address = self:getLocalDataInstance():getValue("entity_addess");   --地址
        phone = self:getLocalDataInstance():getValue("virtual_phone");     --充话费的手机号码
        hall_version = kGameManager:getGameVersion(GameType.HALL),
       --phone = self:getLocalDataInstance():getValue("entity_phone");      --线上实物发货时玩家的联系方式

        --客户端方便自己用的
        clientType = p_data.clientType                          --客户端自定义类型
    };
    self:_use(param);
end

--线上手机领取话费回掉
BackpackDataInterface.onGetPhoneChargeCallBack = function(self, isSuccess, data, sendParam )
    if isSuccess then
        self:refreshBagData(data.info);
        Clock.instance():schedule_once(function()
        require("isolater/widget/layerManagerIsolater");
        LayerManagerIsolater.getInstance():hide("case_detail_online_virtual");
        local _instance = kCaseOperationInstance:getInterfaceByType(sendParam.clientType);
        _instance:successCallBack(data);
        end);
        self:resetBackpackRecordRequsetStaus();
    else
        local msg = ""..data.errorTips;
        Toast.getInstance():showText(msg, 50, 30, kAlignLeft, "", 24, 200, 175, 110);        
    end
end

--线上实物领取
BackpackDataInterface.getOnlineEntity = function(self, p_data )
    local param = {
        boxItemID = p_data.id,
        gatherId = p_data.gatherId,
        itemNum = p_data.number,

        --专有参数
        name = self:getLocalDataInstance():getValue("entity_name");        --姓名
        address = self:getLocalDataInstance():getValue("entity_addess");   --地址
        --phone = self:getLocalDataInstance():getValue("virtual_phone");     --充话费的手机号码
        phone = self:getLocalDataInstance():getValue("entity_phone");      --线上实物发货时玩家的联系方式
        hall_version = kGameManager:getGameVersion(GameType.HALL),

        --客户端方便自己用的
        clientType = p_data.clientType                          --客户端自定义类型
    };
    self:_use(param);
end

--线上实物领取回调
BackpackDataInterface.onGetOnlineEntityCallBack = function(self, isSuccess, data, sendParam )
   if isSuccess then
        self:refreshBagData(data.info);
        Clock.instance():schedule_once(function()
        require("isolater/widget/layerManagerIsolater");
        LayerManagerIsolater.getInstance():hide("case_detail_online_entity");
        local _instance = kCaseOperationInstance:getInterfaceByType(sendParam.clientType);
        _instance:successCallBack(data);
        end);
        self:resetBackpackRecordRequsetStaus();
    else
        local msg = ""..data.errorTips;
        Toast.getInstance():showText(msg, 50, 30, kAlignLeft, "", 24, 200, 175, 110);    
    end
end

--获取兑奖记录
BackpackDataInterface.getRecordListInfo = function(self,updateLater,isChangeCheck )
    
    if isChangeCheck then
        self:notify(BackpackDataInterface.Delegate.changeCheckState);
        return;
    end
    self.m_dataRecord:getRecordList(updateLater);
end

--重置背包记录刷新标识
BackpackDataInterface.resetBackpackRecordRequsetStaus = function(self)
    self.m_dataRecord:resetBackpackRecordRequsetStaus();
end

--获取兑奖记录回调
BackpackDataInterface.onGetRecordCallBack = function(self, isSuccess, data, sendParam )
    LoadingView.getInstance():hidden();
    self:notify(BackpackDataInterface.Delegate.onGetRecordCallBack, isSuccess, data,sendParam);
end

BackpackDataInterface.requestSell = function(self,p_data,p_num,p_moneyId)
    local _tmpText = "正在请求";
    LoadingView.getInstance():showText(_tmpText,283,0);
    local param = {
    boxItemID = p_data.id,
    gatherId = p_data.gatherId,
    itemNum = p_num,
    moneytype = p_moneyId
}
    OnlineSocketManager.getInstance():sendMsg(PHP_PACKAGE_SELL, param, 6000);
end

BackpackDataInterface.onSellCallBack = function(self,isSuccess,data,sendParam)
    LoadingView.getInstance():hidden();
    if isSuccess then
        self:refreshBagData(data);
       -- Toast.getInstance():showText("回兑成功", 50, 30, kAlignLeft, "", 24, 200, 175, 110);
    else
        local msg = ""..data.errorTips;
        Toast.getInstance():showText(msg, 50, 30, kAlignLeft, "", 24, 200, 175, 110);
    end
    self:notify(BackpackDataInterface.Delegate.onSellCallBack, isSuccess, data,sendParam);
end
---------------------------------private-------------------------------------
--使用物品
--集合了合成，使用，丢弃等功能，用一条协议根据不同参数来获得不一样的功能
--太臃肿，以后尽量避免。
BackpackDataInterface._use = function(self,param)
    local _tmpText = "正在请求";
    LoadingView.getInstance():showText(_tmpText,283,0);
    OnlineSocketManager.getInstance():sendMsg(PHP_PACKAGE_USE, param, 6000);
    VipAnimManager.getInstance():setPauseAnim(true);
end

--根据参数类型调用不同的操作
BackpackDataInterface.onUseCallBack = function(self, isSuccess, data, sendParam )
    VipAnimManager.getInstance():setPauseAnim(false);
    LoadingView.getInstance():hidden();

    --直接用参数的客户端类型，sendParam可能会被覆盖，所以重新赋值 sendParam.clientType (后续只用到了 sendParam里的clientType)
    sendParam.clientType = k_bagTypeAdapter:getClientType(tonumber(data.boxType),tonumber(data.smallType)) or sendParam.clientType;

    local tmpCilentType = tonumber(sendParam.clientType);
    if tmpCilentType == BagTypeAdapter.s_shard then              --碎片
        self:onShardMergeCallBack(isSuccess, data, sendParam);
    elseif tmpCilentType == BagTypeAdapter.s_gitBag then         --礼包
        self:onUseGiftBagCallBack(isSuccess, data, sendParam);
    elseif tmpCilentType == BagTypeAdapter.s_general then        --普通道具
        self:onAbandonCallBack(isSuccess, data, sendParam);
    elseif tmpCilentType == BagTypeAdapter.s_offline then        --线下实物劵
        
    elseif tmpCilentType == BagTypeAdapter.s_onlineEntity then   --线上实物券
        self:onGetOnlineEntityCallBack(isSuccess, data, sendParam);
    elseif tmpCilentType == BagTypeAdapter.s_onlineVirtual then  --线上虚拟物品（话费充值）
        self:onGetPhoneChargeCallBack(isSuccess, data, sendParam);
    end

end

--数据有刷新
BackpackDataInterface.dataUpdated = function(self)
    self:notify(BackpackDataInterface.Delegate.dataUpdated)
end

BackpackDataInterface.s_socketCmdFuncMap = {
    [PHP_PACKAGE_USE]                           = BackpackDataInterface.onUseCallBack;
    [PHP_PACKAGE_SELL]                          = BackpackDataInterface.onSellCallBack;
    [PHP_PACKAGE_REFRESH_PROP]                  = BackpackDataInterface.onRequirePropCallBack;
};

--NativeEvent.getInstance():ShowLoadingDialog(msg or "登录中");

----------------------------------新物品箱的本地玩家信息保存------------------------------------
LocalPlayerInfoDict = class(Dict,false);

LocalPlayerInfoDict.ctor = function(self)
    --固定名字
    local name = "";
    self.m_userId = self.m_userId or kUserInfoData:getUserId();
    name = "dic_LocalPlayerInfoDict_"..self.m_userId;
    super(self,name);
end

LocalPlayerInfoDict.setValue = function(self,p_key,p_value)
    self:load();
    self:setString(p_key,p_value);
    self:save();
end

LocalPlayerInfoDict.getValue = function(self,p_key)

                                       ----------------物品箱发货信息-------------

                                       --"virtual_phone"   充话费是的手机号码
                                       --"entity_phone"    线上实物时的手机号码
                                       --"entity_name"     线上实物时的名字
                                       --"entity_addess"   线上实物发货地址

                                       ----------------物品箱警示状态--------------

                                       --"bag_addFlag"     物品箱增加物品提示
                                       --"record_addFlag"  物品箱增加记录提示

    self:load();
    local tmpString = self:getString(p_key);
    return tmpString;
end

LocalPlayerInfoDict.dtor = function(self)
    
end