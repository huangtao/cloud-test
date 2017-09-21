require("gameData/gameData");

local DiamondShopRecordData = class(GameData);

DiamondShopRecordData.Delegate = {
	onGetRecordDataCallBack = "onGetRecordDataCallBack";
};

DiamondShopRecordData.ctor = function(self)
end

DiamondShopRecordData.dtor = function(self)
end

DiamondShopRecordData.initData = function(self)
	self.m_recordData = {};
    self.m_loadRecordData = {};
	self.m_totalPage = 0;
	self.m_curPage = 0;
end

DiamondShopRecordData.getRecordData = function(self)
	self:requestData();
	return table.isEmpty(self.m_recordData) and self.m_loadRecordData or self.m_recordData, self.m_isTouched;
end

DiamondShopRecordData.setRefreshRecord = function(self)
	self.m_isRefreshRecord = true;
end

DiamondShopRecordData.requestData = function(self)
	if (not self.m_isTouched) or self.m_isRefreshRecord then 
		if self.m_isRefreshRecord then 
			self.m_totalPage = 0;
			self.m_curPage = 0;
		end 

		if self.m_totalPage == 0 then 
			self.m_curPage = 1;
		elseif self.m_totalPage > 0 then
			if self.m_curPage < self.m_totalPage then
				self.m_curPage = self.m_curPage + 1;
			elseif self.m_curPage == self.m_totalPage then 
				return;
			end 
		end

		local param = {};
		param.page = self.m_curPage;

		Log.i("DiamondShopRecordData.requestData","param = ",param);
		OnlineSocketManager.getInstance():sendMsg(PHP_SHOP_DIAMOND_RECORD,param);
	end 
end 	

DiamondShopRecordData.onGetRecordData = function(self,isSuccess,info,requestData)
	Log.i("DiamondShopRecordData.onGetRecordData","isSuccess = ",isSuccess,"info = ",info,"requestData = ",requestData);
	if isSuccess then 
		self:updateData(true,info,requestData);
	end
	self:execDelegate(DiamondShopRecordData.Delegate.onGetRecordDataCallBack,isSuccess,self.m_recordData);
end

--TODO：让PHP返回当前第几页
DiamondShopRecordData.updateMemData = function(self,data,requestData)
	if not (table.isTable(data) and table.isTable(data.info)) then
		return;
	end
	if self.m_isRefreshRecord then 
		self.m_recordData = {};
	end 
	self.m_isRefreshRecord = nil;
	
	self.m_totalPage = tonumber(data.tp) or 0;
	for k, v in pairs(data.info) do		
		if type(v) == "table" then 
			v.orderid = v.orderid or ""; 			--订单ID
			v.gname = v.gname or "";			  	--商品名称 
			v.time = v.time or "";					--购买时间
			v.diamond = tonumber(v.diamond) or 1;	--钻石
			v.num = tonumber(v.num) or 1;			--商品数量
			v.type = tonumber(v.type) or 0;			--商品类型：1为银币，2为话费，3为实物
			v.status = tonumber(v.status) or 0;		--订单状态：0为失败，1为完成，2为未填写发货信息
			v.phone = v.phone or "";				--手机号码(type为2、3时返回)
			v.name = v.name or "";					--收货人(type为3时返回)
			v.addr = v.addr or "";					--收货地址(type为3时返回)

			if v.orderid ~= "" then 
				table.insert(self.m_recordData,v);
			end 
		end 		
	end	
    self.m_loadRecordData = self.m_recordData;
end 

DiamondShopRecordData.loadDictData = function(self, dict)
	local strRecordData = dict:getString("recordData");
	local recordData = json.decode(strRecordData);
	if table.isTable(recordData) then
		self.m_loadRecordData = recordData;
	end
end

DiamondShopRecordData.saveDictData = function(self, dict)
	dict:setString("recordData", json.encode(self.m_loadRecordData) or "");
end

DiamondShopRecordData.getLocalDictName = function(self)
	self.m_userCid = self.m_userCid or kUserInfoData:getUserCid();
	return "DiamondShopRecordData" .. self.m_userCid;
end

DiamondShopRecordData.s_socketCmdFuncMap = {
	[PHP_SHOP_DIAMOND_RECORD] 		     = DiamondShopRecordData.onGetRecordData;
};

return DiamondShopRecordData;