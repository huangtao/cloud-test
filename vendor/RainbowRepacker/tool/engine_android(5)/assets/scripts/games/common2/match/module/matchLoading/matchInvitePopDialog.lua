
local match_invite_layout = require(ViewPath .. "games/common2/match/match_invite_layout");

MatchInvitePopDialog = class(IBaseDialog, false);
----------------------------------------------
MatchInvitePopDialog.s_controls =
{
	contentBg = 1,
	momentBtn = 2,
	wechatBtn = 3,
	gameBtn = 4,
};

MatchInvitePopDialog.Delegate = 
{
	onInviteGameBtnClick = "onInviteGameBtnClick";
	onInviteMomentBtnClick = "onInviteMomentBtnClick";
	onInviteWeChatBtnClick = "onInviteWeChatBtnClick";
}

MatchInvitePopDialog.ctor = function(self, data)
	super(self, match_invite_layout);
	self:setLevel(198);

	self:_initView();
end

MatchInvitePopDialog.dtor = function(self)
	self.m_isShowing = false;
end

MatchInvitePopDialog.isShowing = function(self)
    return self.m_isShowing;
end

MatchInvitePopDialog.showDialog = function(self)
    self.m_isShowing = true;
    IBaseDialog.pushDialog(self);
end

MatchInvitePopDialog.hideDialog = function(self)
    self.m_isShowing = false;
    IBaseDialog.hide();
end

MatchInvitePopDialog.setContentPos = function(self, x, y)
	local width, height = self.m_contentBg:getSize();
	local localX = x and x - width / 2 or nil;
	local localY = y and y - height or nil;
	self.m_contentBg:setPos(localX, localY);
end

-- 分享微信朋友圈
MatchInvitePopDialog.onMomentBtnClick = function(self)
	self:hideDialog();
	self:execDelegate(MatchInvitePopDialog.Delegate.onInviteMomentBtnClick);
end

-- 分享微信好友
MatchInvitePopDialog.onWeChatBtnClick = function(self)
	self:hideDialog();
	self:execDelegate(MatchInvitePopDialog.Delegate.onInviteWeChatBtnClick);
end

-- 邀请游戏好友
MatchInvitePopDialog.onGameBtnClick = function(self)
	self:hideDialog();
	self:execDelegate(MatchInvitePopDialog.Delegate.onInviteGameBtnClick);
end

MatchInvitePopDialog.onBgTouch = function(self)
	self:hideDialog();
end


---------------------------------------------------------------------------------
MatchInvitePopDialog._initView = function(self)
	self.m_contentBg = self:findViewById(self.s_controls.contentBg);

	self:setEventTouch(self, self.onBgTouch);
	self:setEventDrag(self, function() end);
end

MatchInvitePopDialog.s_controlConfig =
{
	[MatchInvitePopDialog.s_controls.contentBg] = {"contentBg"};
	[MatchInvitePopDialog.s_controls.momentBtn] = {"contentBg", "momentBtn"};
	[MatchInvitePopDialog.s_controls.wechatBtn] = {"contentBg", "wechatBtn"};
	[MatchInvitePopDialog.s_controls.gameBtn] = {"contentBg", "gameBtn"};

};

MatchInvitePopDialog.s_controlFuncMap =
{
	[MatchInvitePopDialog.s_controls.momentBtn] = MatchInvitePopDialog.onMomentBtnClick;
	[MatchInvitePopDialog.s_controls.wechatBtn] = MatchInvitePopDialog.onWeChatBtnClick;
	[MatchInvitePopDialog.s_controls.gameBtn] = MatchInvitePopDialog.onGameBtnClick;
}


