require("games/common2/module/layerShowTypeData");
require("games/common2/onlooker/data/onlookerPlayerManager");
local OnlookerSocketCmd = require("games/common2/onlooker/socket/onlookerSocketCmd");
local OnlookerController = class();

OnlookerController.initOnlookerRoom = function(self)
	Log.d("OnlookerController.initOnlookerRoom");	

	local showType = LayerShowTypeData.getInstance():getOnlookerType();
	LayerShowTypeData.getInstance():setCurShowType(showType);

	self:updateView(self.m_view.s_cmds.InitOnlookerRoom);
	self:_addOnlookerSocketTools();

	if GameInfoIsolater.getInstance():isInMatchRoom() then 
		self:initMatchRoom();
	end 
end

OnlookerController.releaseOnlookerRoom = function(self)
	Log.d("OnlookerController.releaseOnlookerRoom");
	self:_stopLoginOnlookerTimer();
	self:_removeOnlookerSocketTools(); 
end
--------------------------------------------------------------------------------------------
OnlookerController.resume = function(self)
	CommonController.resume(self);
	CommunityLogic.getInstance();
end

OnlookerController.requestEnterRoom = function(self)
	--请求进围观
	Log.d("OnlookerController.requestEnterRoom");

	local uid = UserBaseInfoIsolater.getInstance():getUserId();
	MechineManage.getInstance():receiveAction(GameMechineConfig.ACTION_ENTER_ONLOOKER,uid);

	if GameInfoIsolater.getInstance():isInMatchRoom() then
		local _,onlookerdId = self.m_state:getBundleData(); 
		local info = {};
		info.userId = onlookerdId;
		MatchMechine.getInstance():receiveAction(MatchMechineConfig.ACTION_ENTER_ONLOOKER,info);
	end 
	
	self:_startLoginOnlookerTimer();
	self:requestLoginOnlooker();
end

OnlookerController.onBackPressed = function(self)
	if DialogLogic.getInstance():popDialog() then
		return;
	end
	if IBaseDialog.isDialogShowing() then
		IBaseDialog.onBackHidden();
		return;
	end
	
	self:requestLogoutOnlooker();
end

OnlookerController.startReconnect = function(self)
	LoadingView.getInstance():showText("正在连接网络");
	self.m_isDuringReconnect = true;

	self:_startLoginOnlookerTimer();
	self:requestLoginOnlooker();
end 

OnlookerController.checkIsExitRoom = function(self)
end 
--------------------------------------------------------------------------------------------
OnlookerController.requestLoginOnlooker = function(self)
	local param,onlookerdId = self.m_state:getBundleData(); 
	param = table.verify(param);
	local curGameId = GameInfoIsolater.getInstance():getCurGameId();	

	local info = {};
	info.userInfo = CommonPlayerInfoHandler2.getInstance():getUserLoginJsonInfo(curGameId);
	info.tmid = onlookerdId;
	info.keepOnlooker = 0;--是否一直围观,1:持续围观,0:看完被围观者正在打的那桌就被server踢出
	info.extend = param.enterOnlookerExtendParam or "";--扩展字段(json)
	SocketIsolater.getInstance():sendMsg(OnlookerSocketCmd.C_REQUEST_LOGIN_ONLOOKER,info);	
end

OnlookerController.requestLogoutOnlooker = function(self)
	local _,onlookerdId = self.m_state:getBundleData(); 
	local info = {};
	info.tmid = onlookerdId;
	SocketIsolater.getInstance():sendMsg(OnlookerSocketCmd.C_REQUEST_LOGOUT_ONLOOKER,info);
end

OnlookerController.onEnterOnlookerSuc = function(self)
	self:_stopLoginOnlookerTimer();
	LoadingView.getInstance():hidden();

	OnlookerPlayerManager.getInstance():removeAllOnlooker();
	self.m_isDuringReconnect = nil;
end

OnlookerController.onExitOnlookerSuc = function(self)
	LayerShowTypeData.getInstance():setCurShowType(nil);
	OnlookerPlayerManager.getInstance():removeAllOnlooker();

	if GameInfoIsolater.getInstance():isInMatchRoom() then 
		self:releaseMatchRoom();
	end

	local info = self.m_state:getBundleData(); 
	info = table.verify(info);
	local hallGameType = GameInfoIsolater.getInstance():getHallGameType();
	local stateId = info.jumpStateId or hallGameType;

	local data = {};
	data.viewJumpParam = info.viewJumpParam;
	GameInfoIsolater.getInstance():startGame(stateId,nil,data);
end

--------------------------------------------------------------------------------------------
OnlookerController._startLoginOnlookerTimer = function(self)
	self.m_loginOnlookerTimer = Clock.instance():schedule_once(function()
		self:requestLogoutOnlooker();
		self:onExitOnlookerSuc();
		LoadingView.getInstance():hidden();
	end, 10);
end

OnlookerController._stopLoginOnlookerTimer = function(self)
	if self.m_loginOnlookerTimer then 
		self.m_loginOnlookerTimer:cancel();
	end 
	self.m_loginOnlookerTimer = nil;
end

OnlookerController._addOnlookerSocketTools = function(self)
    self.m_socket = SocketIsolater.getInstance();

    local OnlookerSocketReader = require("games/common2/onlooker/socket/onlookerSocketReader");
    self.m_onlookerSocketReader = new(OnlookerSocketReader); 
    self.m_socket:addSocketReader(self.m_onlookerSocketReader);

    local OnlookerSocketWriter = require("games/common2/onlooker/socket/onlookerSocketWriter");
    self.m_onlookerSocketWriter = new(OnlookerSocketWriter); 
    self.m_socket:addSocketWriter(self.m_onlookerSocketWriter);

    local OnlookerSocketProcesser = require("games/common2/onlooker/socket/onlookerSocketProcesser");
    self.m_onlookerSocketProcesser = new(OnlookerSocketProcesser,self);
end

OnlookerController._removeOnlookerSocketTools = function(self)
    self.m_socket:removeSocketReader(self.m_onlookerSocketReader);
    self.m_socket:removeSocketWriter(self.m_onlookerSocketWriter);

    delete(self.m_onlookerSocketReader);
    self.m_onlookerSocketReader = nil;
    delete(self.m_onlookerSocketWriter);
    self.m_onlookerSocketWriter = nil;
    delete(self.m_onlookerSocketProcesser);
    self.m_onlookerSocketProcesser = nil;
end
--------------------------------------------------------------------------------------------
OnlookerController._joinMatchRoom = function(self)
end
--------------------------------------------------------------------------------------------

OnlookerController.s_stateFuncMap = {};
OnlookerController.s_actionFuncMap = {

	[GameMechineConfig.ACTION_ENTER_ONLOOKER_SUC]        			= "onEnterOnlookerSuc";
	[GameMechineConfig.ACTION_EXIT_ONLOOKER_SUC]        			= "onExitOnlookerSuc";
	[GameMechineConfig.ACTION_REQUEST_EXIT_ONLOOKER]         		= "requestLogoutOnlooker";
};

return OnlookerController;