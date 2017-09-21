require("hall/main/data/hallDataInterface");

local ACTIVITYCENTER = 1;		-- 活动中心页
local ACTIVITYRECOMMED = 2;	-- 应用推荐页

GroupGameScene = class(CommonScene);

GroupGameScene.s_controls = {
	["backBtn"] = 1;
	["contentView"] = 2;
	errorInfo = 3;
	contentLayer = 4;
}

GroupGameScene.s_cmds = 
{
	Back = 1,
	LoadWebView = 2;
}

GroupGameScene.ctor = function(self, viewConfig, controller)
	self.m_controller = controller;
	self.m_ctrl = GroupGameScene.s_controls;
	self:findViews();
	self:addListeners();
end

GroupGameScene.dtor = function(self)
	delete(self.m_activityCenterWebView);
	self.m_activityCenterWebView = nil;
	delete(self.m_activityRecommedWebView);
	self.m_activityRecommedWebView = nil;
end

GroupGameScene.stop = function(self)
	CommonScene.stop(self);
	delete(self.m_activityCenterWebView);
	self.m_activityCenterWebView = nil;
end

GroupGameScene.resume = function(self)
	CommonScene.resume(self);
	local groupurl = GroupGameInterface.getInstance():getGroupGameUrl();
	if not groupurl or groupurl == "" then
		self:onLoadWebView(false);
	else
		self:onLoadWebView(true);
	end

	HallDataInterface.getInstance():setWebViewShowing(true);
end

GroupGameScene.pause = function(self)
	CommonScene.pause(self);
	HallDataInterface.getInstance():setWebViewShowing(false);
end

-- 按下手机按下返回键时调用
GroupGameScene.onBackKeyDown = function(self)
	if self.m_activityCenterWebView then
		return self.m_activityCenterWebView:goBackWebView();
	end
	return false;
end

------------------------ 以下为内部调方法 外部请不要调用 ------------------------
GroupGameScene.findViews = function(self)
	self.m_backBtn=self:findViewById(self.m_ctrl.backBtn);				-- 顶部返回按扭
	self.m_contentView = self:findViewById(self.m_ctrl.contentView);			-- 页面内容view
	self.m_errorInfo = self:findViewById(self.m_ctrl.errorInfo);

	local contentLayer = self:findViewById(self.m_ctrl.contentLayer);
	local screenScaleHeight = System.getScreenScaleHeight();
	contentLayer:setSize(nil, screenScaleHeight-90-20);
end

GroupGameScene.addListeners = function(self)
	self.m_backBtn:setOnClick(self, self.onBackBtnClick);
end

GroupGameScene.init = function(self)
	self.m_curPage = nil;
	self.m_activityCenterWebView  = nil;
	self:showCenterWebView();
end

GroupGameScene.onBackBtnClick = function(self)
    self:requestCtrlCmd(GroupGameController.s_cmds.Back);
end


GroupGameScene.showCenterWebView = function(self)
	Log.v("GroupGameScene.showCenterWebView")
	if not self.m_activityCenterWebView then
		self.m_activityCenterWebView = new( require("hall/widget/webView") );
		local x,y = self.m_contentView:getAbsolutePos();
		local w,h = self.m_contentView:getSize();
		self.m_activityCenterWebView:create(self:getUrl(), x*System.getLayoutScale(), y*System.getLayoutScale(), w*System.getLayoutScale(), h*System.getLayoutScale());		
		self.m_contentView:addChild(self.m_activityCenterWebView);
	end
end

GroupGameScene.getUrl = function(self)
	local url = GroupGameInterface.getInstance():getGroupGameUrl();
	if not url or url =="" then
		 url = string.format("http://mvsnspus01.ifere.com/dfqp/?app=%s&ssid=%s&action=activity_groupgame.android_index",kUserInfoData:getAppId(),kUserInfoData:getSsid());
	end

	return url;
end

GroupGameScene.onLoadWebView = function(self, isSuccess)
	if isSuccess then
		self:init();
	else
		self.m_errorInfo:setVisible(true);
	end
end

GroupGameScene.s_controlConfig = 
{
	[GroupGameScene.s_controls.backBtn] = {"bg","topView" , "returnBtn"},
	[GroupGameScene.s_controls.contentLayer] = {"bg","contentLayer"};
	[GroupGameScene.s_controls.contentView] = {"bg","contentLayer", "contentView"},
	[GroupGameScene.s_controls.errorInfo] = {"bg","contentLayer","errorInfo"},
}

GroupGameScene.s_cmdConfig = 
{
	[GroupGameScene.s_cmds.Back] = GroupGameScene.onBackBtnClick;
	[GroupGameScene.s_cmds.LoadWebView] = GroupGameScene.onLoadWebView;
}