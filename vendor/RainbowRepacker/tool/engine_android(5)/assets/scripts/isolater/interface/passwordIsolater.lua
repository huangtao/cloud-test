require("gameData/dataInterfaceBase");
require("hall/password/data/passwordDataInterface");

--[[
	口令中间层
--]]

PasswordIsolater = class(DataInterfaceBase);

PasswordIsolater.TYPE_MATCH = 1; -- 比赛
PasswordIsolater.TYPE_PRIVATE_ROOM = 2; -- 私人房
PasswordIsolater.TYPE_ADD_FRIENDS = 3;  -- 加好友
PasswordIsolater.TYPE_MATCH_INVITE = 4; -- 邀请赛


PasswordIsolater.Delegate = {
	 onGetPasswordByInfoCallback = "onGetPasswordByInfoCallback";
};

PasswordIsolater.getInstance = function()
	if not PasswordIsolater.s_instance then
		PasswordIsolater.s_instance = new(PasswordIsolater); 
	end
	return PasswordIsolater.s_instance;
end

PasswordIsolater.ctor = function(self)
	PasswordDataInterface.getInstance():setObserver(self);
end

PasswordIsolater.dtor = function(self)
	PasswordDataInterface.getInstance():clearObserver(self);
end

--[[
	@brief 通过口令码获取口令
	@param type (number) 口令类型
		PasswordConstants.TYPE_PRIVATE_ROOM = 2		私人房
		PasswordConstants.TYPE_ADD_FRIENDS = 3		加好友
	@param code (string) 口令码
--]]
PasswordIsolater.getPasswordByCode = function(self, type, code)
    return PasswordDataInterface.getInstance():getPasswordByCode(type, code);
end

--[[
	@brief 请求口令
	@param info (table) 口令数据，口令内部逻辑会往口令数据插入region(地区id)，version(口令版本号)，mid(用户id)
	@param expired (number) 口令保存时间
--]]
PasswordIsolater.getPasswordByInfo = function(self, info, expired)
    PasswordDataInterface.getInstance():getPasswordByInfo(info, expired);
end


--[[
	@brief 请求口令回调
	@param isSuccess (boolean) 请求口令是否成功，true为请求成功，false为请求失败
	@param password (string) 生成的口令码
--]]
PasswordIsolater.onGetPasswordByInfoCallback = function(self, isSuccess, password)
    self:notify(PasswordDataInterface.Delegate.onGetPasswordByInfoCallback, isSuccess, password);
end

--[[
	@brief 已移除
--]]
PasswordIsolater.setTextToClipboard = function(self, text)
end

--[[
	@brief 已移除
--]]
PasswordIsolater.getTextFromClipboard = function(self)
end

--[[
	@brief 已移除
--]]
PasswordIsolater.getShareContent = function(self, type, password)
end

--[[
	@brief 已移除
--]]
PasswordIsolater.openSms = function(self, text)
end

--[[
	@brief 生成口令数据
	@param type (number) 口令类型
		PasswordConstants.TYPE_PRIVATE_ROOM = 2		私人房
		PasswordConstants.TYPE_ADD_FRIENDS = 3		加好友
	@return (table) 口令数据
		t = {			私人房
			type 			口令类型
			table_pw		私人房密码
	        requireMoney	私人房进场限制
	        baseChip		私人房底注
	        gameId			私人房游戏Id
	        gameName		私人房游戏名称
	        tableId			私人房桌子id
	        nick			玩家昵称
	        mid				玩家mid
	        cid				玩家cid
		}
		t = {			加好友
			type 			口令类型
	        nick			玩家昵称
	        mid				玩家mid
	        cid				玩家cid
		}
--]]
PasswordIsolater.generateData = function(self, type)
	return PasswordDataInterface.getInstance():generateData(type);
end

--[[
	@brief 微信分享
	@param type (number) 口令类型
		PasswordConstants.TYPE_PRIVATE_ROOM = 2		私人房
		PasswordConstants.TYPE_ADD_FRIENDS = 3		加好友
	@param isShareSwitchOpen (boolean) 微信分享开关
--]]
PasswordIsolater.shareByWechat = function(self, type, ...)
    return PasswordDataInterface.getInstance():shareByWechat(type, ...);
end

--[[
	@brief QQ分享
	@param type (number) 口令类型
		PasswordConstants.TYPE_PRIVATE_ROOM = 2		私人房
		PasswordConstants.TYPE_ADD_FRIENDS = 3		加好友
--]]
PasswordIsolater.shareByQQ = function(self, type, ...)
    return PasswordDataInterface.getInstance():shareByQQ(type, ...);
end

--[[
	@brief 短信分享
	@param type (number) 口令类型
		PasswordConstants.TYPE_PRIVATE_ROOM = 2		私人房
		PasswordConstants.TYPE_ADD_FRIENDS = 3		加好友
--]]
PasswordIsolater.shareByMessage = function(self, type, ...)
    return PasswordDataInterface.getInstance():shareByMessage(type, ...);
end

--[[
	@brief 二维码分享
	@param type (number) 口令类型
		PasswordConstants.TYPE_PRIVATE_ROOM = 2		私人房
		PasswordConstants.TYPE_ADD_FRIENDS = 3		加好友
--]]
PasswordIsolater.shareByQr = function(self, type, ...)
    return PasswordDataInterface.getInstance():shareByQr(type, ...);
end

--[[
	@brief 生成调起应用的url
	@param url (string) url链接
	@param password (string) 口令
--]]
PasswordIsolater.generateUrlWithPassword = function(self, url, password)
    return PasswordDataInterface.getInstance():generateUrlWithPassword(url, password);
end