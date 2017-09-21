
local room_more_info_test = require("view/kScreen_1280_800/games/common2/room_more_info_test");
--[[
	重连测试、查看子游戏的版本号信息
]]

local RoomMoreInfoTest = class(CommonGameLayer, false);

RoomMoreInfoTest.s_controls = 
{
	bg 					= ToolKit.getIndex();
	moreView 			= ToolKit.getIndex();
	reconnect_btn 		= ToolKit.getIndex();
	version_btn 		= ToolKit.getIndex();
	version_bg 			= ToolKit.getIndex();
	version 			= ToolKit.getIndex();
};

RoomMoreInfoTest.ctor = function(self)
	super(self, room_more_info_test);
	self.m_ctrls = RoomMoreInfoTest.s_controls;
	self.m_versionbg = self:findViewById(self.m_ctrls.version_bg);
	self.m_versionInfo = self:findViewById(self.m_ctrls.version);
	self:setViewVisible(false);
end 

RoomMoreInfoTest.dtor = function(self)
	self:stopTimer();
end

RoomMoreInfoTest.showView = function(self)
	local visible = self:getVisible();
	self:setViewVisible(not visible);
end

RoomMoreInfoTest.onTouchBg = function(self)
	self:setViewVisible(false);
	self.m_versionbg:setVisible(false);
end

-- 请求重连
RoomMoreInfoTest.onTestReconnect = function(self)
	
	self.m_reconnectTime = self.m_reconnectTime or (os.time() - 7);
	if os.time() - self.m_reconnectTime < 5 then
		Toast.getInstance():showText("亲，您的操作太频繁了，先休息一下吧",50,30,kAlignLeft,"",24,200,175,110);
		return;
	end
	self.m_reconnectTime = os.time();
	SocketIsolater.getInstance():reopenSocket();
end

-- 查看游戏的版本号
RoomMoreInfoTest.showGameVerion = function(self)
	local visible = self.m_versionbg:getVisible();
	local gameId = GameInfoIsolater.getInstance():getCurGameId() or "";
	local levelId = GameInfoIsolater.getInstance():getCurRoomLevelId() or "";
	local hallVersion = GameInfoIsolater.getInstance():getHallVersion() or 0;
	local gameVersion = GameInfoIsolater.getInstance():getGameVersion(gameId) or 0;
	local msgnum = MsgProcessTools.getInstance():getSurplusMsgNum();
	local isDuring = GameInfoIsolater.getInstance():checkIsDuringDefenseCheatTime() and "true" or "false";

	local str = " 游戏ID：%s\n 游戏版本号：%s\n 场次ID：%s\n 大厅版本号：%s\n 防作弊开关：%s\n";
	local info = string.format(str,gameId,gameVersion,levelId,hallVersion,isDuring);
	self.m_msg = info;
	local msg = self.m_msg .. "\n 堆栈消息数量：" .. msgnum
	self.m_versionInfo:setText(msg);
	self.m_versionbg:setVisible(not visible);
end

RoomMoreInfoTest.startTimer = function(self)
	self:stopTimer();
	self.m_timer = new(AnimInt, kAnimRepeat, 0, 1, 10, 0);
	self.m_timer:setDebugName("RoomMoreInfoTest.startTimer");
	self.m_timer:setEvent(self, RoomMoreInfoTest.onTimer);
end

RoomMoreInfoTest.stopTimer = function(self)
	if self.m_timer then
		delete(self.m_timer);
		self.m_timer = nil;
	end
end

RoomMoreInfoTest.onTimer = function(self)
	if self.m_msg then
		local msgnum = MsgProcessTools.getInstance():getSurplusMsgNum();
		local msg = self.m_msg .. "\n 堆栈消息数量：" .. msgnum
		self.m_versionInfo:setText(msg);
	end
end

RoomMoreInfoTest.setViewVisible = function(self,isvisible)
	self:setVisible(isvisible);
	if not isvisible then
		self:stopTimer();
	else
		self:startTimer();
	end
end

RoomMoreInfoTest.refreshPos = function ( self, x, y )
	local btnReconnect = self:findViewById(RoomMoreInfoTest.s_controls.reconnect_btn);
	local btnVersionInfo = self:findViewById(RoomMoreInfoTest.s_controls.version_btn);
	local w, h = btnReconnect:getSize();
	btnReconnect:setPos(x - w / 2 - 10, y );
	btnVersionInfo:setPos(x + w / 2 + 10, y);
	self.m_versionbg:setPos(x + w / 2, y + h + 10);
end

RoomMoreInfoTest.s_controlConfig =
{   
    [RoomMoreInfoTest.s_controls.bg] 					= {"bg"};
    [RoomMoreInfoTest.s_controls.moreView] 				= {"moreView"};
    [RoomMoreInfoTest.s_controls.reconnect_btn] 		= {"moreView","reconnect_btn"};
    [RoomMoreInfoTest.s_controls.version_btn] 			= {"moreView","version_btn"};
    [RoomMoreInfoTest.s_controls.version_bg] 			= {"moreView","version_bg"};
    [RoomMoreInfoTest.s_controls.version] 				= {"moreView","version_bg","version"};
};

RoomMoreInfoTest.s_controlFuncMap = 
{
	[RoomMoreInfoTest.s_controls.bg] 					= RoomMoreInfoTest.onTouchBg;
	[RoomMoreInfoTest.s_controls.reconnect_btn] 		= RoomMoreInfoTest.onTestReconnect;
	[RoomMoreInfoTest.s_controls.version_btn] 			= RoomMoreInfoTest.showGameVerion;
};

return RoomMoreInfoTest;