
local ViewBase = require("games/common2/module/viewBase");

local RoomChatLayer = class(ViewBase,false);

RoomChatLayer.s_controls = {
	baseLayer = ToolKit.getIndex();
	chatFaceBtn = ToolKit.getIndex();
	chatTextBtn = ToolKit.getIndex();
};

RoomChatLayer.ctor = function(self, seat, layoutConfig)
    super(self,layoutConfig);
	self.m_ctrls = RoomChatLayer.s_controls;
    self:setFillParent(true,true);
    self:_getBaseView();
    self:_initViews();
    self.m_seat = seat;

    self.m_chatFaceBtn:setVisible(false);
	self.m_chatTextBtn:setVisible(false);
end 

RoomChatLayer.dtor = function(self)
end
-----------------------------------------------------------------------------

RoomChatLayer.setAnimPos = function(self,x,y)

end

RoomChatLayer._getBaseView = function(self)
	self.m_baseLayer = self:findViewById(self.m_ctrls.baseLayer);
	self.m_chatFaceBtn = self:findViewById(self.m_ctrls.chatFaceBtn);
	self.m_chatTextBtn = self:findViewById(self.m_ctrls.chatTextBtn);
end

RoomChatLayer._initViews = function(self)
	local config = RoomChatConfig.getChatLayerConfig();
	self:_initBtns(self.m_chatFaceBtn,config.chatFace);
	self:_initBtns(self.m_chatTextBtn,config.chatText);
end

RoomChatLayer._initBtns = function(self,btn,config)
	config = table.verify(config);
	
	if btn and typeof(btn,DrawingBase) then
		if not string.isEmpty(config.file) then
			btn:setFile(config.file);

			local res = btn.m_res;
			if res then
				local width, height = res:getWidth(), res:getHeight();
				btn:setSize(width,height);
			end
		end 
		btn:setAlign(config.align);
		btn:setPos(config.x,config.y);
		btn:setVisible(config.visible);
	end 
end

-----------------------------------------------------------------------------
RoomChatLayer.onChatBtnClick = function(self)
	UBReport.getInstance():report(UBConfig.kChatClick1);
 	local action = GameMechineConfig.ACTION_NS_CLICKACHAT;
	MechineManage.getInstance():receiveAction(action);
end

RoomChatLayer.onChangeTable = function (self, seat, uid, info, isFast)
	Log.v("RoomChatLayer.onChangeTable", " ---<><><> ", self:isDuringDefenseCheatTime());
	if not self:isHidChat() then
		self.m_chatFaceBtn:setVisible(true);
	end
end

RoomChatLayer.onJoinGame = function(self, seat, uid, info, isFast)
	if not self:isHidChat() then
		self.m_chatFaceBtn:setVisible(true);
	end
end

RoomChatLayer.isHidChat = function(self)
	if self:isDuringDefenseCheatTime() then
		self.m_chatFaceBtn:setVisible(false);
		self.m_chatTextBtn:setVisible(false);
		return true;
	end
	return false;
end

RoomChatLayer.isDuringDefenseCheatTime = function(self)
	return GameInfoIsolater.getInstance():checkIsDuringDefenseCheatTime();
end

-----------------------------------------------------------------------------
RoomChatLayer.s_controlConfig = 
{	
	[RoomChatLayer.s_controls.baseLayer]			 	= {"baseLayer"};
	[RoomChatLayer.s_controls.chatFaceBtn]			 	= {"baseLayer","chatFaceBtn"};
	[RoomChatLayer.s_controls.chatTextBtn]			 	= {"baseLayer","chatTextBtn"};
};

RoomChatLayer.s_controlFuncMap =
{
	[RoomChatLayer.s_controls.chatFaceBtn]			 	= RoomChatLayer.onChatBtnClick;
	[RoomChatLayer.s_controls.chatTextBtn]			 	= RoomChatLayer.onChatBtnClick;
};

RoomChatLayer.s_actionFuncMap = {
	[GameMechineConfig.ACTION_NS_ROOMUPCHANGE]		 	= "onChangeTable";
};

RoomChatLayer.s_stateFuncMap = {
	[GameMechineConfig.STATUS_JOIN]					 	= "onJoinGame";
};

return RoomChatLayer;