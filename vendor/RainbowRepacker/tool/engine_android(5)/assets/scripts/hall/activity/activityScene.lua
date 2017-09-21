require("hall/main/data/hallDataInterface");

local ACTIVITYCENTER = 1;		-- 活动中心页
local ACTIVITYRECOMMED = 2;	-- 应用推荐页

ActivityScene = class(CommonScene);

ActivityScene.s_controls = {
	backBtn = 1;
	contentView = 2;
	errorInfo = 3;
}

ActivityScene.s_cmds = 
{
	Back = 1,
	LoadWebView = 2;
	SetVisible = 3;
	GetWebViewSize = 4;
	DeleteActivityWebView = 5;
}

ActivityScene.ctor = function(self, viewConfig, controller)
	local __isExist,__wnd = LayerManagerIsolater.getInstance():isExist("redenvelope_reciever");
	if __isExist then
		__wnd:setVisible(false);
	end
	RedEnvelopDataInterface.getInstance():setActivityShowing(true);
	self.m_controller = controller;
	self.m_ctrl = ActivityScene.s_controls;
	self:findViews();
	self:addListeners();
end

ActivityScene.dtor = function(self)
	self:deleteActivityWebView();
	RedEnvelopDataInterface.getInstance():setActivityShowing(false);
	local __isExist,__wnd = LayerManagerIsolater.getInstance():isExist("redenvelope_reciever");
	if __isExist then
		__wnd:setVisible(true);
	end
end

ActivityScene.stop = function(self)
	CommonScene.stop(self);
	self:deleteActivityWebView();
end

ActivityScene.resume = function(self)
	CommonScene.resume(self);
	HallDataInterface.getInstance():setWebViewShowing(true);
end

ActivityScene.pause = function(self)
	CommonScene.pause(self);
	HallDataInterface.getInstance():setWebViewShowing(false);
end


------------------------ 以下为外部调方法  ------------------------
-- 按下手机按下返回键时调用
ActivityScene.onBackKeyDown = function(self)
	if self.m_activityCenterWebView then
		return self.m_activityCenterWebView:goBackWebView();
	end
	return false;
end

ActivityScene.deleteActivityWebView = function(self)
	delete(self.m_activityCenterWebView);
	self.m_activityCenterWebView = nil;	
end

------------------------ 以下为内部调方法 外部请不要调用 ------------------------
ActivityScene.findViews = function(self)
	self.m_backBtn=self:findViewById(self.m_ctrl.backBtn);				-- 顶部返回按扭
	self.m_contentView = self:findViewById(self.m_ctrl.contentView);			-- 页面内容view
	self.m_errorInfo = self:findViewById(self.m_ctrl.errorInfo);
	self.m_backBtn:setVisible(false);
end

ActivityScene.getWebViewSize = function(self)
	local w,h = self.m_contentView:getSize();
	local x,y = self.m_contentView:getAbsolutePos();
	return w*System.getLayoutScale(), h*System.getLayoutScale(), x*System.getLayoutScale(), y*System.getLayoutScale();
end

ActivityScene.getBackBtnSize = function(self)
	local w,h = self.m_backBtn:getSize();
	local x,y = self.m_backBtn:getAbsolutePos();
	return w*System.getLayoutScale(), h*System.getLayoutScale(), x*System.getLayoutScale(), y*System.getLayoutScale();
end

ActivityScene.addListeners = function(self)
	self.m_backBtn:setOnClick(self, self.onBackBtnClick);
end

ActivityScene.init = function(self)
	self.m_curPage = nil;
	self:deleteActivityWebView();
	self:showCenterWebView();
end

ActivityScene.onBackBtnClick = function(self)
    self:requestCtrlCmd(ActivityController.s_cmds.Back);
end

ActivityScene.showCenterWebView = function(self)
	if not self.m_activityCenterWebView then
		self.m_activityCenterWebView = new( require("hall/widget/webView") );
		local w, h, x, y = self:getWebViewSize();
		local bw, bh, bx, by = self:getBackBtnSize();
		self.m_activityCenterWebView:create(self:getUrl(), x, y, w, h, bx, by, bw, bh);		
		self.m_contentView:addChild(self.m_activityCenterWebView);
	end
end

ActivityScene.getUrl = function(self)
	local  url = ActivityDataInterface.getInstance():getActivityUrl();
	if string.isEmpty(url) then
		url = string.format("http://mvsnspus01.ifere.com/dfqp/?app=%s&ssid=%s&action=activity.lists",kUserInfoData:getAppId(),kUserInfoData:getSsid());
	end

	return url;
end

ActivityScene.onLoadWebView = function(self, isSuccess, errStr)
	if isSuccess then
		self:init();
	else
		self.m_errorInfo:setVisible(true);
        self.m_errorInfo:setText(errStr);
	end
end

ActivityScene.s_controlConfig = 
{
	[ActivityScene.s_controls.backBtn] = {"topView" , "returnBtn"},
	[ActivityScene.s_controls.contentView] = {"contentView"},
	[ActivityScene.s_controls.errorInfo] = {"errorInfo"},
}

ActivityScene.s_cmdConfig = 
{
	[ActivityScene.s_cmds.Back] = ActivityScene.onBackBtnClick;
	[ActivityScene.s_cmds.LoadWebView] = ActivityScene.onLoadWebView;
	[ActivityScene.s_cmds.SetVisible] = ActivityScene.setVisible;
	[ActivityScene.s_cmds.GetWebViewSize] = ActivityScene.getWebViewSize;
	[ActivityScene.s_cmds.DeleteActivityWebView] = ActivityScene.deleteActivityWebView;
}