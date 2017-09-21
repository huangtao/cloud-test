require("hall/common/gameManager");
require("gameData/clientInfo");
require("gameData/dataInterfaceBase");

TxtMgr = class(DataInterfaceBase);

TxtMgr.Delegate = {
	onGetClientMsgCallBack = "onGetClientMsgCallBack";
};

TxtMgr.getInstance = function()
	if not TxtMgr.s_instance then
		TxtMgr.s_instance = new(TxtMgr);
	end
	return TxtMgr.s_instance;
end

TxtMgr.releaseInstance = function()
    delete(TxtMgr.s_instance);
    TxtMgr.s_instance = nil;
end

TxtMgr.ctor = function(self)
end

TxtMgr.dtor = function(self)
end 

TxtMgr.initData = function(self)
	self.m_config = {};
end
----------------------------------------------------------
TxtMgr.getTxtConfig = function(self)
	self:requestData();
	return self.m_config;
end	

TxtMgr.getDescByKey = function(self,key)
	if not key then 
		return;
	end 

	local config = self:getTxtConfig();
	return config[key];
end
--------------------------------------------------------------

TxtMgr.loadDictData = function(self, dict)
	local configTxt = dict:getString("key_txt");
	self.m_config = table.verify(json.decode(configTxt));
end

TxtMgr.saveDictData = function(self, dict)
	dict:setString("key_txt",json.encode(self.m_config));
end

TxtMgr.getLocalDictName = function(self)
	return "txtConfig";
end

TxtMgr.requestData = function(self)
	if self.m_isTouched then
		return;
	end 

	local apkVersion = kClientInfo:getApkVersion();
	local info = {};
	info.version = apkVersion;
	info.ver = number.valueOf(self.m_config.ver, -1);
	OnlineSocketManager.getInstance():sendMsg(PHP_clientMessages, info);
end

TxtMgr.onGetClientMsgCallBack = function(self,isSuccess,info)
	Log.d("TxtMgr","onGetClientMsgCallBack","isSuccess = ",isSuccess,"info = ",info);
	self.m_isTouched = true;

   	if isSuccess and not table.isEmpty(info) then 
   		local verClient = number.valueOf(self.m_config.ver, -1); -- 默认-1，后台可能没发ver
   		local verServer = number.valueOf(info.ver, 0); -- 默认0，后台可能没发ver

   		if verClient < verServer then
	   		self.m_config = info;
	   		self:saveData();
            self:notify(TxtMgr.Delegate.onGetClientMsgCallBack,isSuccess,self.m_config);
	   	end
   	end 
end

TxtMgr.s_socketCmdFuncMap = {
	[PHP_clientMessages] = TxtMgr.onGetClientMsgCallBack;
};