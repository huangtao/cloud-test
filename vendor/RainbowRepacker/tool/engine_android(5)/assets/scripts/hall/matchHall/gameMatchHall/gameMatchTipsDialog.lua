--[[
	定时赛入场提醒弹框
]]

require("common/commonGameLayer");
local match_signup_tips = require(ViewPath .. "hall/matchHall/widget/match_signup_tips");
require("isolater/interface/privateRoomIsolater");
require("isolater/interface/gameInfoIsolater");
require("common/IPopDialogManager");

GameMatchTipsDialog = class(CommonGameLayer, false);

local h_index = 0;
local getIndex = function(self)
    h_index = h_index + 1;
    return h_index;
end

GameMatchTipsDialog.s_controls = {
	background 		= getIndex(),
	txtTitle 		= getIndex(),
	btnClose 		= getIndex(),

	--开赛提示页
	startView 				= getIndex(),
	startViewBtnOK 			= getIndex(),
	startViewTimeStr 		= getIndex(),
	startViewTimeVal 		= getIndex(),
	startViewContentView 	= getIndex(),

	--报名提示页
	tipsView 				= getIndex(),
	tipsViewTxtTips 		= getIndex(),
	tipsViewNotNow 			= getIndex(),
	tipsViewContinue 		= getIndex(),
	tipsViewBtnOK 			= getIndex(),

	--报名成功页
	successView 			= getIndex(),
	successViewTimeStr 		= getIndex(),
	successViewTimeVal 		= getIndex(),
	successViewTips 		= getIndex(),
	successViewOtherTips	= getIndex(),
	successViewBtnOK 		= getIndex(),
}


GameMatchTipsDialog.s_cmds = {
	
}

GameMatchTipsDialog.s_delegate = {
	
}

--title 标题
GameMatchTipsDialog.show = function(title)
	GameMatchTipsDialog.hide()
	GameMatchTipsDialog.s_instance = new(GameMatchTipsDialog, title)
	GameMatchTipsDialog.s_instance:setLevel(198)
	GameMatchTipsDialog.s_instance:setFillParent(true, true)
	GameMatchTipsDialog.s_instance:addToRoot()
	return GameMatchTipsDialog.s_instance
end
 
GameMatchTipsDialog.hide = function ()
	if GameMatchTipsDialog.s_instance then 
		delete(GameMatchTipsDialog.s_instance);
		GameMatchTipsDialog.s_instance = nil;
	end
end

GameMatchTipsDialog.ctor = function (self, title)
	super(self, match_signup_tips)

	self.m_ctrls = GameMatchTipsDialog.s_controls
	self.m_btnClose = self:findViewById(self.m_ctrls.btnClose)
	self.m_title = self:findViewById(self.m_ctrls.txtTitle)
	self.m_title:setText(title)
	self.m_background = self:findViewById(self.m_ctrls.background);
    self.m_background:setEventDrag(self, self.onBackgroundTouch);
	IPopDialogManager.getInstance():addPopDialog(self, 100, GameMatchTipsDialog.hide);

	self.m_successView = self:findViewById(self.m_ctrls.successView)
	self.m_successViewTimeStr = self:findViewById(self.m_ctrls.successViewTimeStr)
	self.m_successViewTimeVal = self:findViewById(self.m_ctrls.successViewTimeVal)
	self.m_successViewTips = self:findViewById(self.m_ctrls.successViewTips)
	self.m_successViewOtherTips = self:findViewById(self.m_ctrls.successViewOtherTips)
	self.m_successViewBtnOK = self:findViewById(self.m_ctrls.successViewBtnOK)

	self.m_tipsView = self:findViewById(self.m_ctrls.tipsView)
	self.m_tipsViewTxtTips = self:findViewById(self.m_ctrls.tipsViewTxtTips)
	self.m_tipsViewNotNow = self:findViewById(self.m_ctrls.tipsViewNotNow)
	self.m_tipsViewContinue = self:findViewById(self.m_ctrls.tipsViewContinue)
	self.m_tipsViewBtnOK = self:findViewById(self.m_ctrls.tipsViewBtnOK)

	self.m_startView = self:findViewById(self.m_ctrls.startView)
	self.m_startViewBtnOK = self:findViewById(self.m_ctrls.startViewBtnOK)
	self.m_startViewTimeStr = self:findViewById(self.m_ctrls.startViewTimeStr)
	self.m_startViewTimeVal = self:findViewById(self.m_ctrls.startViewTimeVal)
	self.m_startViewContentView = self:findViewById(self.m_ctrls.startViewContentView)
end

GameMatchTipsDialog.dtor = function (self)
	IPopDialogManager.getInstance():removePopDialog(self);
	if self.m_startViewHandle then
		self.m_startViewHandle:cancel()
	end
end

GameMatchTipsDialog.initSuccessView = function(self, time, tips, cb_obj, btn_ok_cb)
	self.m_successView:setVisible(true)
	self.m_successViewTimeVal:setText(time)
	self.m_successViewTips:setText(tips)
	self.m_successViewBtnOK:setOnClick(cb_obj or self, btn_ok_cb or self.onBtnCloseClick)
end

GameMatchTipsDialog.initTipsView = function(self, tips, cb_obj, continue_cb, not_now_cb, btn_ok_cb, close_cb)
	self.m_tipsView:setVisible(true)
	self.m_tipsViewTxtTips:setText(tips)
	self.m_tipsViewNotNow:setOnClick(cb_obj or self, not_now_cb or self.onBtnCloseClick)
	self.m_tipsViewContinue:setOnClick(cb_obj, continue_cb)
	self.m_tipsViewBtnOK:setOnClick(cb_obj or self, btn_ok_cb or self.onBtnCloseClick)
	self.m_btnClose:setOnClick(cb_obj or self, close_cb or self.onBtnCloseClick)
end

GameMatchTipsDialog.setSuccessOtherTipsVisible = function(self, state)
	self.m_successViewOtherTips:setVisible(state)
end

GameMatchTipsDialog.setTipsViewNotNowState = function(self, state)
	self.m_tipsViewNotNow:setVisible(state)
end

GameMatchTipsDialog.setTipsViewContinueState = function(self, state)
	self.m_tipsViewContinue:setVisible(state)
end

GameMatchTipsDialog.setTipsViewBtnOKState = function(self, state)
	self.m_tipsViewBtnOK:setVisible(state)
end

GameMatchTipsDialog.initStartView = function(self, tips, start_time, cb_obj, btn_ok_cb, close_cb)
	self.m_startView:setVisible(true)
	self.m_startViewBtnOK:setOnClick(cb_obj, btn_ok_cb)
	self.m_btnClose:setOnClick(cb_obj or self, close_cb or self.onBtnCloseClick)
	self.m_startViewContentView:removeAllChildren(true)
	local width, height = self.m_startViewContentView:getSize()
	local richText = new(RichText, tips, width, height, kAlignCenter, nil, 36, nil, nil, nil, true)
	richText:setAlign(kAlignCenter)
	self.m_startViewContentView:addChild(richText)
    if (start_time - GameInfoIsolater.getInstance():getRightTimeWithServer()) <= 0 then
        GameMatchTipsDialog.hide()
        return
    end
	local function event()
		local diff = start_time - GameInfoIsolater.getInstance():getRightTimeWithServer()
        if diff <= 0 then
        	GameMatchTipsDialog.hide()
        	return true
        else
        	local m = math.floor(diff / 60)
        	local s = math.floor(diff % 60)
            self.m_startViewTimeVal:setText(string.format("%.2d:%.2d", m, s))
        end
    end
    self.m_startViewHandle = Clock.instance():schedule(event, 1)
end

GameMatchTipsDialog.setTitle = function(self, text)
	self.m_title:setText(text)
end

GameMatchTipsDialog.onBtnCloseClick = function (self)
	GameMatchTipsDialog.hide()
end

GameMatchTipsDialog.onBackgroundTouch = function (self)
end


GameMatchTipsDialog.s_cmdConfig = {
	
}

GameMatchTipsDialog.s_controlConfig = {
	[GameMatchTipsDialog.s_controls.background]			= {"background"},
	[GameMatchTipsDialog.s_controls.txtTitle]			= {"tipsBg", "titleBg", "txtTitle"},
	[GameMatchTipsDialog.s_controls.btnClose]			= {"tipsBg", "btnClose"},

	[GameMatchTipsDialog.s_controls.startView]			= {"tipsBg", "startView"},
	[GameMatchTipsDialog.s_controls.startViewBtnOK]			= {"tipsBg", "startView", "btnOK"},
	[GameMatchTipsDialog.s_controls.startViewTimeStr]			= {"tipsBg", "startView", "timeStr"},
	[GameMatchTipsDialog.s_controls.startViewTimeVal]			= {"tipsBg", "startView", "timeVal"},
	[GameMatchTipsDialog.s_controls.startViewContentView]			= {"tipsBg", "startView", "contentView"},

	[GameMatchTipsDialog.s_controls.tipsView]			= {"tipsBg", "tipsView"},
	[GameMatchTipsDialog.s_controls.tipsViewTxtTips]			= {"tipsBg", "tipsView", "txtTips"},
	[GameMatchTipsDialog.s_controls.tipsViewNotNow]			= {"tipsBg", "tipsView", "notNow"},
	[GameMatchTipsDialog.s_controls.tipsViewContinue]			= {"tipsBg", "tipsView", "continue"},
	[GameMatchTipsDialog.s_controls.tipsViewBtnOK]			= {"tipsBg", "tipsView", "btnOK"},

	[GameMatchTipsDialog.s_controls.successView]			= {"tipsBg", "successView"},
	[GameMatchTipsDialog.s_controls.successViewTimeStr]			= {"tipsBg", "successView", "timeStr"},
	[GameMatchTipsDialog.s_controls.successViewTimeVal]			= {"tipsBg", "successView", "timeVal"},
	[GameMatchTipsDialog.s_controls.successViewTips]			= {"tipsBg", "successView", "tips"},
	[GameMatchTipsDialog.s_controls.successViewOtherTips]		= {"tipsBg", "successView", "tips2"},
	[GameMatchTipsDialog.s_controls.successViewBtnOK]			= {"tipsBg", "successView", "btnOK"},
}

GameMatchTipsDialog.s_controlFuncMap = {
	[GameMatchTipsDialog.s_controls.background]			= GameMatchTipsDialog.onBackgroundTouch;
	[GameMatchTipsDialog.s_controls.btnClose]			= GameMatchTipsDialog.onBtnCloseClick;
}