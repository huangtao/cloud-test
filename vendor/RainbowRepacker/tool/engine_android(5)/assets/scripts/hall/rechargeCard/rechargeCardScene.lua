require("hall/main/data/hallDataInterface");

local RechargeCardScene = class(CommonScene);

RechargeCardScene.s_controls = {
	backBtn = 1;
	contentView = 2;
	errorInfo = 3;
}

RechargeCardScene.s_cmds = 
{
	Back = 1,
}

RechargeCardScene.ctor = function(self, viewConfig, controller)
	self.m_controller = controller;
	self.m_ctrl = RechargeCardScene.s_controls;
	self:findViews();
	self:addListeners();

	self:init();
end

RechargeCardScene.dtor = function(self)
	self:deleteWebView();
end

------------------------ 以下为外部调方法  ------------------------
-- 按下手机按下返回键时调用
RechargeCardScene.onBackKeyDown = function(self)
	if self.m_webView then
		return self.m_webView:goBackWebView();
	end
	return false;
end

RechargeCardScene.deleteWebView = function(self)
	delete(self.m_webView);
	self.m_webView = nil;	
end

------------------------ 以下为内部调方法 外部请不要调用 ------------------------
RechargeCardScene.findViews = function(self)
	self.m_backBtn=self:findViewById(self.m_ctrl.backBtn);				-- 顶部返回按扭
	self.m_contentView = self:findViewById(self.m_ctrl.contentView);			-- 页面内容view
	self.m_errorInfo = self:findViewById(self.m_ctrl.errorInfo);
	self.m_backBtn:setVisible(false);
end

RechargeCardScene.getWebViewSize = function(self)
	local w,h = self.m_contentView:getSize();
	local x,y = self.m_contentView:getAbsolutePos();
	return w*System.getLayoutScale(), h*System.getLayoutScale(), x*System.getLayoutScale(), y*System.getLayoutScale();
end

RechargeCardScene.getBackBtnSize = function(self)
	local w,h = self.m_backBtn:getSize();
	local x,y = self.m_backBtn:getAbsolutePos();
	return w*System.getLayoutScale(), h*System.getLayoutScale(), x*System.getLayoutScale(), y*System.getLayoutScale();
end

RechargeCardScene.addListeners = function(self)
	self.m_backBtn:setOnClick(self, self.onBackBtnClick);
end

RechargeCardScene.init = function(self)
	self:deleteWebView();
	self:showCenterWebView();
end

RechargeCardScene.onBackBtnClick = function(self)
    self:requestCtrlCmd(RechargeCardController.s_cmds.Back);
end

RechargeCardScene.showCenterWebView = function(self)
	if not self.m_webView then
		self.m_webView = new( require("hall/widget/webView") );
		local w, h, x, y = self:getWebViewSize();
		local bw, bh, bx, by = self:getBackBtnSize();
		self.m_webView:create(self:getUrl(), x, y, w, h, bx, by, bw, bh);		
		self.m_contentView:addChild(self.m_webView);
	end
end

RechargeCardScene.getUrl = function(self)
	local url = RechargeCardDataInterface.getInstance():getRechargeCardWebUrl();
	url = string.format("%s?cid=%s&mid=%s&regionid=%s", url, kUserInfoData:getUserCid(), kUserInfoData:getUserId(), kClientInfo:getRegionId() );
	return url;
end

RechargeCardScene.s_controlConfig = 
{
	[RechargeCardScene.s_controls.backBtn] = {"topView" , "returnBtn"},
	[RechargeCardScene.s_controls.contentView] = {"contentView"},
	[RechargeCardScene.s_controls.errorInfo] = {"errorInfo"},
}

RechargeCardScene.s_cmdConfig = 
{
	[RechargeCardScene.s_cmds.Back] = RechargeCardScene.onBackBtnClick;
}

return RechargeCardScene;