require("common/IBaseDialog");
local inviteMessageViewLayout = require(ViewPath .. "hall/password/inviteMessageViewLayout");
require("hall/password/jump/jumpInterfacePrivateRoom");

-- 消息弹框
InviteMessageView = class(IBaseDialog, false);

local h_index = 0;
local getIndex = function(self)
    h_index = h_index + 1;
    return h_index;
end

InviteMessageView.s_controls = 
{
    closeBtn = getIndex(),
    message = getIndex(),
    confirmBtn = getIndex(),
    cancelBtn = getIndex(),
};

InviteMessageView.Delegate = {
    
}


InviteMessageView.s_cmds = 
{

};

InviteMessageView.showDialog = function(data, confirmObj, confirmFunc, cancelObj, cancelFunc)
	InviteMessageView.instance = new(InviteMessageView, data, confirmObj, confirmFunc, cancelObj, cancelFunc);
    IBaseDialog.pushDialog(InviteMessageView.instance);
end

InviteMessageView.hideDialog = function()
	IBaseDialog.hide();
end

InviteMessageView.ctor = function(self, data, confirmObj, confirmFunc, cancelObj, cancelFunc)
    super(self, inviteMessageViewLayout, "InviteMessageView", 1);
   
    self:setFillParent(true, true);
    self:setAlign(kAlignCenter);
    self:setEventTouch(self, self.onEmptyFunc)
    self:setEventDrag(self, self.onEmptyFunc);
    self:setCallback(confirmObj, confirmFunc, cancelObj, cancelFunc)
    self:_initView();
    self:_initData(data);
    self:_showData();
end

InviteMessageView.dtor = function(self)
    InviteMessageView.instance = nil;
end

InviteMessageView.setCallback = function(self, confirmObj, confirmFunc, cancelObj, cancelFunc)
    self.m_confirmObj = confirmObj;
    self.m_confirmFunc = confirmFunc;
    self.m_cancelObj = cancelObj;
    self.m_cancelFunc = cancelFunc;
end

InviteMessageView.onConfirmBtnClick = function(self)
    -- 根据类型进入房间
	if self.m_data.type == PasswordConstants.TYPE_PRIVATE_ROOM then
        JumpInterfacePrivateRoom.getInstance():enterPrivateRoom(self.m_data, self, self.onConfirmCallback, PrivateRoomConstant.ENTER_TYPE_ONLINE);
	JumpInterfacePrivateRoom.releaseInstance();
	end
end

InviteMessageView.onConfirmCallback = function(self)
    if self.m_confirmObj and self.m_confirmFunc then
        self.m_confirmFunc(self.m_confirmObj);
    end
    
    self:hideDialog();
end

InviteMessageView.onCancelBtnClick = function(self)
    if self.m_cancelObj and self.m_cancelFunc then
        self.m_cancelFunc(self.m_cancelObj);
    end

    self:hideDialog();
end

InviteMessageView.onEmptyFunc = function(self)
end

-----------------------------------------------------------------------------------
InviteMessageView._initData = function(self, data)
	self.m_data = data;
end

InviteMessageView._initView = function(self)
	self.m_message = self:findViewById(self.s_controls.message);
end

InviteMessageView._showData = function(self)
    -- 根据类型显示信息
	if self.m_data.type == PasswordConstants.TYPE_PRIVATE_ROOM then
		self:_showDataPrivateRoom();
	end
end
----------------------------------私人房-----------------------------------------
InviteMessageView._showDataPrivateRoom = function(self)
    local data = self.m_data;
    local gameName = data.gameName;
    local nick = data.nick or "";
	self.m_message:setText(string.concat("您的好友‘",nick,"’","邀请您进入",gameName,"一起玩游戏"));
end

--------------------------------------------------------------------------------
InviteMessageView.s_controlConfig =
{   
    [InviteMessageView.s_controls.closeBtn] = {"content", "closeBtn"};
    [InviteMessageView.s_controls.message] = {"content", "message"};
    [InviteMessageView.s_controls.confirmBtn] = {"content", "bottomView", "btnView", "confirm"};
    [InviteMessageView.s_controls.cancelBtn] = {"content", "bottomView", "btnView", "cancel"};
};

InviteMessageView.s_controlFuncMap =
{
    [InviteMessageView.s_controls.closeBtn] = InviteMessageView.onCancelBtnClick;
    [InviteMessageView.s_controls.confirmBtn] = InviteMessageView.onConfirmBtnClick;
    [InviteMessageView.s_controls.cancelBtn] = InviteMessageView.onCancelBtnClick;
};

InviteMessageView.s_cmdConfig =
{
};
