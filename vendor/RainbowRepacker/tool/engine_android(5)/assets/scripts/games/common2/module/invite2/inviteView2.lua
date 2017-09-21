
local inviteView2 = require(ViewPath .. "games/common2/inviteView2");
require("games/common2/module/invite2/data/inviteConfig");
require("games/common2/module/logic/communityLogic");
require("games/common2/module/invite2/data/inviteConfig");

local ViewBase = require("games/common2/module/viewBase");

-- 邀请好友弹框
local InviteView2 = class(ViewBase, false);

InviteView2.s_controls = 
{
};

InviteView2.Delegate = {
    
}


InviteView2.s_cmds = 
{

};

InviteView2.ctor = function(self)
    super(self, inviteView2);
   
    self:setFillParent(true, true);
    self:setAlign(kAlignCenter);
    self:_initView();

    self:setVisible(false);
end

InviteView2.dtor = function(self)
    self:_removeTimer();

    if self:getVisible() then
        DialogLogic.getInstance():popDialog();
    end
end

InviteView2.onShowDialog = function(self,seat,uid,info,isFast)
    local inviteType = number.valueOf(info);
    self:showDialog(inviteType);
end

InviteView2.onHideDialog = function(self,seat,uid,info,isFast)
    if self.m_inviteViewOperate and self.m_inviteViewOperate:getVisible() then
        self.m_inviteViewOperate:hide();
    else
        DialogLogic.getInstance():popDialog();
    end
end

InviteView2.onInitDialog = function(self,seat,uid,info,isFast)
    local inviteType = number.valueOf(info);
    if not self.m_data then
        self:_initData(inviteType);
        self:_showData();
    end
end

InviteView2.showDialog = function(self, type)
    DialogLogic.getInstance():pushDialogStack(self,self.hideDialog);

    if not self.m_data then
        self:_initData(type);
        self:_showData();
    end

    self.m_inviteViewOperate:show(self.m_data);

    self:setVisible(true);
end

InviteView2.hideDialog = function(self)
    self:setVisible(false);
end

InviteView2.onBgTouch = function(self, finger_action, x, y, drawing_id_first, drawing_id_current, event_time)
    if finger_action == kFingerUp then
        DialogLogic.getInstance():popDialog();
    end
end

InviteView2.onEmptyFunc = function(self) 
end

InviteView2.onInviteViewOperateHideEnd = function(self)
    DialogLogic.getInstance():popDialog();
end
-------------------------------------------------------------------------
InviteView2._initData = function(self, type)
    self.m_data = PasswordIsolater.getInstance():generateData(type)

    CommunityLogic.getInstance():resetInvitedData();
end

InviteView2._showData = function(self)
    if table.isEmpty(self.m_data) then
        return;
    end

    if not self.m_inviteViewOperate then
        self.m_inviteViewOperate = new(require("games/common2/module/invite2/widget/inviteViewOperate"));
        self.m_inviteViewOperate:setDelegate(self);
        self:addChild(self.m_inviteViewOperate);
    end

    self:getPasswordByInfo(self.m_data);
end

-----------------------请求口令--------------------------------
InviteView2.getPasswordByInfo = function(self, data)
    if not table.isEmpty(data) then
        PasswordIsolater.getInstance():getPasswordByInfo(data);
    end
end

-- interface回调
InviteView2.onGetPasswordByInfo = function(self,seat,uid,info,isFast)
    if self.m_data and info then
        self:_updatePassword(info);
        self:_updateData();
    end
end

InviteView2._updatePassword = function(self, password)
    self.m_data.password = password;
end

InviteView2._updateData = function(self)
    if self.m_inviteViewOperate then
        self.m_inviteViewOperate:updateData(self.m_data);
    end
end

InviteView2._initView = function(self)
    self:setEventTouch(self, self.onBgTouch)
    self:setEventDrag(self, self.onEmptyFunc);
end

InviteView2.showToast = function(self,msg)
    if not string.isEmpty(msg) then
        Toast.getInstance():showText(msg,50,30,kAlignLeft,"",24,200,175,110);
    end
end

--------------------------------------------------------------------------------
InviteView2.onLoginGame = function(self,seat,uid,info,isFast)
    if (not isFast) and (not self.m_hasCheckInvite) then
        self.m_hasCheckInvite = true;
        CommunityLogic.getInstance():checkInviteViewState();
    end
end

InviteView2.onPlayerReady = function(self)
    self:_removeTimer();
    self.m_hasCheckInvite = false;
end

InviteView2.onLogoutSuccess = function(self)
    self:_removeTimer();
    self.m_hasCheckInvite = false;
end

InviteView2.onReceivePrivateRoomInfo = function(self,seat,uid,info,isFast)
    info = table.verify(info);
    local time = number.valueOf(info.time);
    if time > 0 and PrivateRoomIsolater.getInstance():isInPrivateRoom() then
        local privateRoomInfo = PrivateRoomIsolater.getInstance():getCurPrivateRoomInfo();
        if table.isEmpty(privateRoomInfo) then
            return;
        end
        if not privateRoomInfo.autoReady then
            self:_createTimer(time);
        end
    end
end

InviteView2._createTimer = function(self, time)
    self:_removeTimer();

    time = number.valueOf(time);

    self:_showTimeTips(time);

    self.m_timeTotal = time;
    self.m_timeCount = time;
    self.m_timer = AnimFactory.createAnimInt(kAnimRepeat, 0, 1, 1 * 1000, 0);
    self.m_timer:setDebugName("AnimInt|kAnimRepeat|InviteView2.m_timer");
    self.m_timer:setEvent(self, self.onTimer);
end

InviteView2._removeTimer = function(self)
    if self.m_timer then
        delete(self.m_timer);
        self.m_timer = nil;
    end
end

InviteView2._showTimeTips = function(self, time)
    local str = string.format("若%s秒后未准备，将会被请离该房间", time);
    self:showToast(str);
end

InviteView2._onTimer = function(self)
    self.m_timeCount = self.m_timeCount - 1;

    if self.m_timeCount < 0 then
        self:_removeTimer();
        return;
    end

    if self.m_timeCount == self.m_timeTotal / 2 then
        self:_showTimeTips(self.m_timeCount);
        self:_removeTimer();
    end
end

InviteView2.s_controlConfig =
{   
};

InviteView2.s_controlFuncMap =
{
    
};
InviteView2.s_cmdConfig =
{
};

InviteView2.s_stateFuncMap = {
    [GameMechineConfig.STATUS_LOGIN]            = "onLoginGame";
    [GameMechineConfig.STATUS_LOGOUT]           = "onLogoutSuccess";
    [GameMechineConfig.STATUS_READY]            = "onPlayerReady";
};


-- 监听游戏动作
InviteView2.s_actionFuncMap = {
    [GameMechineConfig.ACTION_NS_REQUESTINVITELIST]             = "onShowDialog";
    [GameMechineConfig.ACTION_NS_RECEIVE_PRIVATEROOMINFO]       = "onReceivePrivateRoomInfo";
    [GameMechineConfig.ACTION_NS_GET_PASSWORD_BY_INFO]          = "onGetPasswordByInfo";
    [GameMechineConfig.ACTION_NS_HIDEINVITE]                    = "onHideDialog";
    [GameMechineConfig.ACTION_NS_INITINVITE]                    = "onInitDialog";
};

return InviteView2;