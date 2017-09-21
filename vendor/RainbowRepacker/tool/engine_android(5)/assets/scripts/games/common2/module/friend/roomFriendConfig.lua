RoomFriendConfig = {};

RoomFriendConfig.s_pathPrefix = "games/common2/module/friend/";

----------------------------------------------------------------------------------------------
--进入游戏前一定要调用，重置配置
RoomFriendConfig.initData = function()
	RoomFriendConfig.m_callFuncMap = {};
end 

--退出游戏前一定要调用，重置配置
RoomFriendConfig.clear = function()
	RoomFriendConfig.initData();
end 
----------------------------------------------------------------------------------------------
--获取邀请好友弹框
RoomFriendConfig.setFriendInviteWndGetFunc = function(obj,func)
	RoomFriendConfig._setCallFunc("friendInviteWndGainer",obj,func);
end

RoomFriendConfig.getFriendInviteWnd = function()
	local config = RoomFriendConfig._getCallFunc("friendInviteWndGainer");
	if config.func then 
		return config.func(config.obj);
	else 
		require(RoomFriendConfig.s_pathPrefix.."widget/roomFriendInviteWnd");
		local popupWnd = new(RoomFriendInviteWnd);
		return popupWnd;
	end 
end

--设置加好友动画
RoomFriendConfig.setFriendApplyAnimFunc = function(obj,func,startX,startY,endX,endY)
	RoomFriendConfig._setCallFunc("friendApplyAnim",obj,func);
end


--获取加好友弹框
RoomFriendConfig.setFriendApplyWndGetFunc = function(obj,func)
	RoomFriendConfig._setCallFunc("friendApplyWndGainer",obj,func);
end

RoomFriendConfig.getFriendApplyWnd = function()
	local config = RoomFriendConfig._getCallFunc("friendApplyWndGainer");
	if config.func then 
		return config.func(config.obj);
	else 
		local friendApplyWnd = require(RoomFriendConfig.s_pathPrefix.."widget/roomFriendApplyWnd");
		local roomFriendApplyPop2 = require(ViewPath.."games/common2/roomFriendApplyPop2");
		local popupWnd = new(friendApplyWnd,roomFriendApplyPop2);
		return popupWnd;
	end 
end
----------------------------------------------------------------------------------------------
--存储回调函数
--从中获取的为table
RoomFriendConfig._setCallFunc = function(name,obj,func,...)
	if not(name and func) then 
		return;
	end 

	local config = {};
	config.obj = obj;
	config.func = func;
	config.arg = {...};

	RoomFriendConfig.m_callFuncMap = table.verify(RoomFriendConfig.m_callFuncMap);
	RoomFriendConfig.m_callFuncMap[name] = config;
end 

RoomFriendConfig._getCallFunc = function(name)
	if not name then 
		return {};
	end

	RoomFriendConfig.m_callFuncMap = table.verify(RoomFriendConfig.m_callFuncMap);
	return table.verify(RoomFriendConfig.m_callFuncMap[name]);
end 