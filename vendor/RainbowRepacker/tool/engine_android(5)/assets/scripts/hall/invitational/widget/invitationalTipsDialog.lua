require("common/commonGameLayer")
local invitational_tips = require(ViewPath .. "hall/invitational/invitational_tips")
require("common/IPopDialogManager")

local InvitationalTipsDialog = class(CommonGameLayer, false)

local h_index = 0
local getIndex = function(self)
    h_index = h_index + 1
    return h_index
end

InvitationalTipsDialog.s_controls = {
	background 		= getIndex(),
	btnClose 		= getIndex(),

	txtTips 		= getIndex(),
	notNow 			= getIndex(),
	continue 		= getIndex(),
	notNowText 		= getIndex(),
	continueText 	= getIndex(),
}


InvitationalTipsDialog.s_cmds = {
	
}

InvitationalTipsDialog.s_delegate = {
	
}

InvitationalTipsDialog.show = function()
	InvitationalTipsDialog.hide()
	InvitationalTipsDialog.s_instance = new(InvitationalTipsDialog)
	InvitationalTipsDialog.s_instance:setLevel(100)
	InvitationalTipsDialog.s_instance:setFillParent(true, true)
	InvitationalTipsDialog.s_instance:addToRoot()
	return InvitationalTipsDialog.s_instance
end
 
InvitationalTipsDialog.hide = function ()
	if InvitationalTipsDialog.s_instance then 
		delete(InvitationalTipsDialog.s_instance)
		InvitationalTipsDialog.s_instance = nil;
	end
end

InvitationalTipsDialog.ctor = function (self)
	super(self, invitational_tips)

	self.m_ctrls = InvitationalTipsDialog.s_controls
	self.m_btnClose = self:findViewById(self.m_ctrls.btnClose)
	self.m_background = self:findViewById(self.m_ctrls.background)
    self.m_background:setEventDrag(self, self.onBackgroundTouch)
	IPopDialogManager.getInstance():addPopDialog(self, 100, InvitationalTipsDialog.hide)

	self.m_txtTips = self:findViewById(self.m_ctrls.txtTips)
	self.m_notNow = self:findViewById(self.m_ctrls.notNow)
	self.m_continue = self:findViewById(self.m_ctrls.continue)
	self.m_notNowText = self:findViewById(self.m_ctrls.notNowText)
	self.m_continueText = self:findViewById(self.m_ctrls.continueText)
end

InvitationalTipsDialog.dtor = function (self)
	IPopDialogManager.getInstance():removePopDialog(self)
	if self.m_startViewHandle then
		self.m_startViewHandle:cancel()
	end
end

InvitationalTipsDialog.initTipsView = function(self, tips, cb_obj, continue_cb, not_now_cb, close_cb, not_now_text, continue_text)
	self.m_txtTips:setText(tips)
	self.m_notNow:setOnClick(cb_obj or self, not_now_cb or self.onBtnCloseClick)
	self.m_continue:setOnClick(cb_obj or self, continue_cb or self.onBtnCloseClick)
	self.m_btnClose:setOnClick(cb_obj or self, close_cb or self.onBtnCloseClick)
	if not_now_text then
		self:setNotNowText(not_now_text)
	end
	if continue_text then
		self:setContinueText(continue_text)
	end
end

InvitationalTipsDialog.setContinueText = function(self, text)
	self.m_continueText:setText(text)
end

InvitationalTipsDialog.setNotNowText = function(self, text)
	self.m_notNowText:setText(text)
end

InvitationalTipsDialog.onBtnCloseClick = function (self)
	InvitationalTipsDialog.hide()
end

InvitationalTipsDialog.onBackgroundTouch = function (self)
end

InvitationalTipsDialog.s_cmdConfig = {
	
}

InvitationalTipsDialog.s_controlConfig = {
	[InvitationalTipsDialog.s_controls.background]			= {"background"},
	[InvitationalTipsDialog.s_controls.btnClose]			= {"tipsBg", "btnClose"},

	[InvitationalTipsDialog.s_controls.txtTips]   	= {"tipsBg", "content", "txtTips"},
	[InvitationalTipsDialog.s_controls.notNow]			= {"tipsBg", "content", "notNow"},
	[InvitationalTipsDialog.s_controls.continue]			= {"tipsBg", "content", "continue"},
	[InvitationalTipsDialog.s_controls.notNowText]			= {"tipsBg", "content", "notNow", "text"},
	[InvitationalTipsDialog.s_controls.continueText]			= {"tipsBg", "content", "continue", "text"},
}

InvitationalTipsDialog.s_controlFuncMap = {
	[InvitationalTipsDialog.s_controls.background]			= InvitationalTipsDialog.onBackgroundTouch;
	[InvitationalTipsDialog.s_controls.btnClose]			= InvitationalTipsDialog.onBtnCloseClick;
}

return InvitationalTipsDialog