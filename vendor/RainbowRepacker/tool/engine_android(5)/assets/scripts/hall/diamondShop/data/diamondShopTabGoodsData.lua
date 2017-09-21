require("gameData/gameData")

local DiamondShopTabGoodsData = class(GameData);

DiamondShopTabGoodsData.Delegate = {
	onGetTabGoodsDataCallBack = "onGetTabGoodsDataCallBack";
}

DiamondShopTabGoodsData.initData = function(self)
	self.m_tabGoodsData = {};
    self.m_loadTabGoodsData = {};
end

DiamondShopTabGoodsData.getTabGoodsData = function(self,id,showtype)
    if not(id or showtype) then 
        return {};
    end 
    
    id = tostring(id);
    showtype = tostring(showtype);
	local isExist,goodsList = self:_getGoodsList(id,showtype);
	if not isExist then
		self:requestData(id,showtype);
	end 
	return table.isEmpty(goodsList) and self:__getLoadGoodsList(id,showtype) or Copy(goodsList);
end

DiamondShopTabGoodsData.__getLoadGoodsList = function(self,id,showtype)
	local temp = table.verify(self.m_loadTabGoodsData[id]);
	local loadGoodsList = table.verify(temp[showtype]);
	return loadGoodsList;
end


DiamondShopTabGoodsData.requestData = function(self,id,showtype)
	local param = {};
	param.dmdtabid = id;
	param.showtype = showtype;

	Log.i("DiamondShopTabGoodsData.requestData","param = ",param);
	OnlineSocketManager.getInstance():sendMsg(PHP_DIAMOND_DMDTABGOODS,param);
end

DiamondShopTabGoodsData.onGetTabGoodsData = function(self,isSuccess,info,requestData)
	Log.i("DiamondShopTabGoodsData.onGetTabGoodsData","isSuccess = ",isSuccess,"info = ",info,"requestData = ",requestData);
	if isSuccess then
		self:updateData(true,info,requestData);
	end

	local id = requestData.dmdtabid;
	local showtype = requestData.showtype;
	local isExist,goodsList = self:_getGoodsList(id,showtype);

	isSuccess = isSuccess and isExist;

	self:execDelegate(DiamondShopTabGoodsData.Delegate.onGetTabGoodsDataCallBack,isSuccess, Copy(goodsList) );
end

DiamondShopTabGoodsData.updateMemData = function(self,data,requestData)
	if not (table.isTable(data) and table.isTable(requestData)) then
		return;
	end
	local goods = {};
	for k,v in pairs(data) do
		if type(v) == "table" then 		
			v.gid = tonumber(v.gid) or 0;			--商品id
			v.gname = v.gname or ""; 				--商品名称
			v.type = tonumber(v.type) or 0; 		--商品类型(商品类型:1为银币物品，2为话费，3为实物)
			v.gnum = tonumber(v.gnum) or 0; 		--商品剩余数量
			v.diamond = tonumber(v.diamond) or 0;	--需要钻石数量
			v.url = v.url or "";					--商品图片地址
			v.showtype = tonumber(v.showtype) or 1;	--展示类型(1 =>普通,2=>显示促销)(普通商品无下面两个字段)
			v.flag = tonumber(v.flag) or 0;			--限时商品过期与否（1=>下期，0=>本期，-1=>上期）
			v.scantimes = tonumber(v.scantimes) or 0;--浏览次数
			
			if v.gid > 0 then
				table.insert(goods,v);
			end
		end
	end	

	table.sort(goods,function(a,b)
		if not (a and b) then
			return true;
		end
		return tonumber(a.diamond) < tonumber(b.diamond);
	end);

	local id = requestData.dmdtabid or "1";
	local showtype = requestData.showtype or "1";
	local list = table.verify(self.m_tabGoodsData[id]);
	list[showtype] = goods;
	self.m_tabGoodsData[id] = list;

	self.m_loadTabGoodsData = table.verify(self.m_loadTabGoodsData);
    self.m_loadTabGoodsData[id] = list;
end

--@param changedNum:改变的商品数量
DiamondShopTabGoodsData.updateGoodsNumWithGid = function(self, gid, changedNum)
	local changedNum = tonumber(changedNum);
	if not changedNum then
		return;
	end

	for k, tabGoodsData in pairs(self.m_tabGoodsData) do
		for showtype, goodsList in pairs(tabGoodsData) do
			for _, data in pairs( table.verify(goodsList) ) do
				if gid == data.gid then
					data.gnum = data.gnum + changedNum;
				end
			end
		end
	end
end

DiamondShopTabGoodsData._getGoodsList = function(self,id,showtype)
	local temp = table.verify(self.m_tabGoodsData[id]);
	local goodsList = table.verify(temp[showtype]);
	local isExist = table.getSize(goodsList) > 0;
	return isExist,goodsList;
end

DiamondShopTabGoodsData.loadDictData = function(self, dict)
	local strTabGoodsData = dict:getString("tabGoodsData");
	local tabGoodsData = json.decode(strTabGoodsData);
	if table.isTable(tabGoodsData) then
		self.m_loadTabGoodsData = tabGoodsData;
	end
end

DiamondShopTabGoodsData.saveDictData = function(self, dict)
	dict:setString("tabGoodsData", json.encode(self.m_loadTabGoodsData) or "");
end

DiamondShopTabGoodsData.getLocalDictName = function(self)
	self.m_userCid = self.m_userCid or kUserInfoData:getUserCid();
	return "DiamondShopTabGoodsData" .. self.m_userCid;
end

DiamondShopTabGoodsData.s_socketCmdFuncMap = {
	[PHP_DIAMOND_DMDTABGOODS] 		     = DiamondShopTabGoodsData.onGetTabGoodsData;
};

return DiamondShopTabGoodsData;
