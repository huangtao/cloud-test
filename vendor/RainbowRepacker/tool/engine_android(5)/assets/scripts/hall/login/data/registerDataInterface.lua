require("gameData/dataInterfaceBase");

RegisterDataInterface = class(DataInterfaceBase);

RegisterDataInterface.Delegate = {
	onGetFillInfoConfigCallBack = "onGetFillInfoConfigCallBack";
	onFillInfoCallBack = "onFillInfoCallBack";
};

RegisterDataInterface.getInstance = function()
	if not RegisterDataInterface.s_instance then
		RegisterDataInterface.s_instance = new(RegisterDataInterface);
	end
	
	return RegisterDataInterface.s_instance;
end

RegisterDataInterface.releaseInstance = function()
	delete(RegisterDataInterface.s_instance);
	RegisterDataInterface.s_instance = nil;
end

RegisterDataInterface.ctor = function(self)
    self.m_fillInfoConfig = {};
end

RegisterDataInterface.dtor = function(self)
end
--------------------------------------------------------------------------
--首次设置资料奖励配置
RegisterDataInterface.getFillInfoConfig = function(self)
	self:_requestFillInfoConfig();
	return Copy(self.m_fillInfoConfig);
end

RegisterDataInterface.onGetFillInfoConfigCallBack = function(self,isSuccess,info)
    Log.d("RegisterDataInterface.onGetFillInfoConfigCallBack","isSuccess  = ",isSuccess,"info = ",info)
	self.m_isTouched = true;
	if isSuccess then
	   info.flag = number.valueOf(info.flag); --1成功，0为已经获得该奖励
	   info.award = number.valueOf(info.award);--奖励银币
	   info.prefix_url = info.prefix_url or "";--头像前缀url
	   info.file_suffix = info.file_suffix or "";--图片后缀地址
	   info.size = number.valueOf(info.size);--默认头像数量
	   self.m_fillInfoConfig = Copy(info);
	end 

	self:notify(RegisterDataInterface.Delegate.onGetFillInfoConfigCallBack,isSuccess,info);
end

RegisterDataInterface._requestFillInfoConfig = function(self)
	if not self.m_isTouched or table.isEmpty(self.m_fillInfoconfig) then
		OnlineSocketManager.getInstance():sendMsg(PHP_FILLINFO_CONFIG);
	end
end
--------------------------------------------------------------------------
--首次设置资料奖励领取
RegisterDataInterface.requestFillInfo = function(self,nick,avatarIndex)
	local data = {};
	data.icon = avatarIndex;
	data.nick = nick;
	OnlineSocketManager.getInstance():sendMsg(PHP_REGISTER_FILLINFO,data);
end

RegisterDataInterface.onFillInfoCallBack = function(self,isSuccess,info)
	if isSuccess then 
		info.flag = number.valueOf(info.flag);		--1成功，0为设置失败 -1已经获得过该奖励 -2 加银币失败
		info.award = number.valueOf(info.award); 	--奖励银币
		info.money = number.valueOf(info.money,kUserInfoData:getMoney()); --拥有银币数

		isSuccess = info.flag == 1;
		kUserInfoData:setMoney(info.money);
	end 
	self:notify(RegisterDataInterface.Delegate.onFillInfoCallBack,isSuccess,info);
end

RegisterDataInterface.s_socketCmdFuncMap = {
	[PHP_FILLINFO_CONFIG] = RegisterDataInterface.onGetFillInfoConfigCallBack;
	[PHP_REGISTER_FILLINFO] = RegisterDataInterface.onFillInfoCallBack;
};