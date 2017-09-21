require("gameData/dataInterfaceBase");
require("util/NumberLib");

AgencyDataInterface = class(DataInterfaceBase);

AgencyDataInterface.s_maxTryCount = 5;

AgencyDataInterface.Delegate = {
    onGetAgencyConfigCallback = "onGetAgencyConfigCallback";
};

AgencyDataInterface.getInstance = function(self)
	if not AgencyDataInterface.s_instance then
		AgencyDataInterface.s_instance = new(AgencyDataInterface);
	end

	return AgencyDataInterface.s_instance;
end 

AgencyDataInterface.ctor = function(self)
	
end

AgencyDataInterface.dtor = function(self)

end

AgencyDataInterface.initData = function(self)
	self.m_agencyConfig = {};
    self.m_localVersion = -1;
end

AgencyDataInterface.loadDictData = function(self, dict)
    self.m_localVersion = dict:getInt("version", -1);
	local strData = dict:getString("agencyConfig");
	local tmpData = json.decode(strData);
	if not table.isEmpty(tmpData) then
		self.m_agencyConfig = tmpData;
	end
end

AgencyDataInterface.saveDictData = function(self, dict)
    dict:setInt("version", self:getLocalVersion());
	local strData = json.encode( self.m_agencyConfig or {} );
	if strData then
		dict:setString("agencyConfig", strData);
	end
end

AgencyDataInterface.getLocalDictName = function(self)
	return "agencyConfig";
end

AgencyDataInterface.getLoginUrl = function(self)
	local config = self:getConfig();
	return config.login_url or "";
end

AgencyDataInterface.getPaySuccessUrl = function(self)
	local config = self:getConfig();
	return config.success_url or "";
end

AgencyDataInterface.getAgentUrl = function(self)
	local config = self:getConfig();
	return config.agent_url or "";
end

AgencyDataInterface.isAgentEntranceOpen = function(self)
	local config = self:getConfig();
	return number.valueOf(config.agentEntrance) == 1;	
end

AgencyDataInterface.isAgentBindingOpen = function(self)
	local config = self:getConfig();
	return number.valueOf(config.agentBinding) == 1;	
end

AgencyDataInterface.isLuaAgencyOpen = function(self)
	local config = self:getConfig();
	return number.valueOf(config.luaAgent) == 1;	
end

AgencyDataInterface.getConfig = function(self)
	return Copy(table.verify(self.m_agencyConfig));
end

AgencyDataInterface.getLocalVersion = function(self)
    return self.m_localVersion or -1;
end

AgencyDataInterface.requestData = function(self, isForceUpdate)
	if (not self.m_isTouched) or isForceUpdate then
		local param = {
			["type"] = "allurl"; 
            ["cli_ver"] = self:getLocalVersion();
		};
		OnlineSocketManager.getInstance():sendMsg(PHP_AGENCY_CONFIG, param);
	end
end

AgencyDataInterface.onGetAgencyConfigCallback = function(self,isSuccess,info)
	if isSuccess and not table.isEmpty(info) then
        local svr_ver = tonumber(info.svr_ver) or -1;
		local isrefresh = tonumber(info.isrefresh) or 0;
        if svr_ver > self:getLocalVersion() or isrefresh == 1 then
            self.m_localVersion = info.svr_ver;
            self:analysisData(info);
        end
	else
		self.m_tryCount = number.valueOf(self.m_tryCount, 0) + 1;
		if self.m_tryCount <= AgencyDataInterface.s_maxTryCount then
			self:requestData();
		end
	end
	self:notify(AgencyDataInterface.Delegate.onGetAgencyConfigCallback,isSuccess,self.m_agencyConfig);
end

AgencyDataInterface.analysisData = function (self, data)
    if table.isEmpty(data) then
        return;
    end  
    data = table.verify(data);
	data.success_url = data.success_url or ""; --代理商支付成功页面
	data.agent_url = data.agent_url or ""; 
	data.login_url = data.login_url or ""; --代理商登录页面
	data.agentEntrance = number.valueOf(data.agentEntrance); --代理商入口（1：开启，0：关闭）
	data.agentBinding = number.valueOf(data.agentBinding);--绑定入口（1：开启，0：关闭）（就是领取推广礼包那个哈~）
	data.luaAgent = number.valueOf(data.luaAgent); --lua代理商入口（1：开启，0：关闭）（关闭时使用h5的代理商）
	self.m_agencyConfig = data;
    self:saveData();
end

AgencyDataInterface.s_socketCmdFuncMap = {
	[PHP_AGENCY_CONFIG] 		        = AgencyDataInterface.onGetAgencyConfigCallback;
};