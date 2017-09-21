require("hall/agency/widget/agencyPayConfirmDialog");
require("hall/agency/widget/agencyPayingDialog");
require("hall/agency/widget/agencyPayFailedDialog");
require("hall/agency/widget/agencyWebView");
require("hall/agency/data/agencyDataInterface");
require("hall/main/data/hallDataInterface");

AgencyScene = class(CommonScene);

local h_index = 0;
local getIndex = function(self)
	h_index = h_index + 1;
	return h_index;
end

AgencyScene.s_controls = 
{
	contentView = getIndex();
	htmlView = getIndex();
	returnBtn = getIndex();
};

AgencyScene.s_cmds = 
{
	GoBackWebViewUrl = getIndex();
	checkGoBack = getIndex();
	ShowPayConfirmDialog = getIndex();
	onPaySuccessed = getIndex();
};

AgencyScene.s_pageType = {
	None = 0;
	WebView = 1;
	PayConfirm = 2;
	PayingDialog = 3;
	PayFailed = 4;	
};

AgencyScene.ctor = function(self,viewConfig, controller)
	self.m_controller = controller;
	self.m_ctrl = AgencyScene.s_controls;

	self.m_curShowPageType = AgencyScene.s_pageType.None;

	EventDispatcher.getInstance():register(Event.Call,self,self.onNativeEvent);

	AgencyDataInterface.getInstance():setObserver(self);
end

AgencyScene.resume = function(self)
	CommonScene.resume(self);

	if not self.m_isPaying then 
		self:showLoginAgency();
	else
		self.m_isPaying = nil;
	end 

	HallDataInterface.getInstance():setWebViewShowing(true);
end

AgencyScene.pause = function(self)
	CommonScene.pause(self);

	HallDataInterface.getInstance():setWebViewShowing(false);
end

AgencyScene.dtor = function(self)
	delete(self.m_agencyWebView);
	self.m_agencyWebView = nil;
	AgencyDataInterface.getInstance():clearObserver(self);
	EventDispatcher.getInstance():unregister(Event.Call,self,self.onNativeEvent);
end

AgencyScene.onReturnBtnClick = function(self)
	self:requestCtrlCmd(AgencyController.s_cmds.goBack);
end
----------------------------------------------------------------
AgencyScene.onGoBackWebViewUrl = function (self)
	self.m_curShowPageType = AgencyScene.s_pageType.None;

	if self.m_agencyWebView then 
		self.m_agencyWebView:hideWebView();
	end 
end

AgencyScene.checkGoBack = function(self)
	local curShowPageType = self.m_curShowPageType or AgencyScene.s_pageType.None;
	if curShowPageType == AgencyScene.s_pageType.PayConfirm then
		if self.m_payConfirmDialog then 
			self.m_payConfirmDialog:hide();
		end
	 	self:showLastAgencyView();
	 	return false;
	 	
	elseif curShowPageType == AgencyScene.s_pageType.PayFailed then 
		if self.m_payFailedDialog then 
			self.m_payFailedDialog:hide();
		end
		self:showLastAgencyView();
		return false;

	elseif curShowPageType == AgencyScene.s_pageType.WebView then
		if self.m_agencyWebView then
			return self.m_agencyWebView:goBackWebView();
		end
	 	
	elseif curShowPageType == AgencyScene.s_pageType.PayingDialog then 
		return false;

	else 
		return true;
	end
end

AgencyScene.onPaySuccessed = function(self)
	if self.m_payingDialog then 
		self.m_payingDialog:hide();
	end 
	self:showAgencyPaySuccess();
end
-----------------------------------------------------------------
AgencyScene.showLoginAgency = function(self)
	local x,y,w,h = self:_getAgencyWebView();
	local isSuccess = self.m_agencyWebView:showLoginAgency(x, y, w, h, 0, 0, 0, 0);
	if not isSuccess then 
		self.m_curShowPageType = AgencyScene.s_pageType.None;
	end 
end

AgencyScene.showLastAgencyView = function(self)
	if self.m_agencyWebView then 
		self.m_curShowPageType = AgencyScene.s_pageType.WebView;
		self.m_agencyWebView:showWebView();
	else 
		self:showLoginAgency();
	end 
end

AgencyScene.showAgencyPaySuccess = function(self)
	delete(self.m_agencyWebView);
	self.m_agencyWebView = nil;
	
	local x,y,w,h = self:_getAgencyWebView();
	local isSuccess = self.m_agencyWebView:showAgencyPaySuccess(x, y, w, h, 0, 0, 0, 0);
	if not isSuccess then 
		self.m_curShowPageType = AgencyScene.s_pageType.None;
	end 
end

AgencyScene._getAgencyWebView = function(self)
	self.m_curShowPageType = AgencyScene.s_pageType.WebView;
	Log.d("AgencyScene._getAgencyWebView");

	local htmlView = self:findViewById(self.m_ctrl.htmlView);	
	local w, h = htmlView:getSize();
	local x, y = htmlView:getAbsolutePos();
	x = x * System.getLayoutScale();
	y = y * System.getLayoutScale();
	w = w * System.getLayoutScale();
	h = h * System.getLayoutScale();

	if not self.m_agencyWebView then 
		self.m_agencyWebView = new(AgencyWebView);
		htmlView:addChild(self.m_agencyWebView);
	end 
	self.m_agencyWebView:showWebView();

	return x,y,w,h;
end
-----------------------------------------------------------------
AgencyScene.showPayConfirmDialog = function(self)
	self:onGoBackWebViewUrl();
	self.m_curShowPageType = AgencyScene.s_pageType.PayConfirm;
	
	if not self.m_payConfirmDialog then 
		self.m_payConfirmDialog = new(AgencyPayConfirmDialog);
		self.m_root:addChild(self.m_payConfirmDialog);
		self.m_payConfirmDialog:setDelegate(self);
	end 
	self.m_payConfirmDialog:show();
end

AgencyScene.onPayConfirmReturnBtnClick = function(self)
	self:showLastAgencyView();
end

AgencyScene.onPayConfirmBtnClick = function(self)
	self.m_isPaying = true;
	self:requestCtrlCmd(AgencyController.s_cmds.requestRecharge);
end
-------------------------------------------------------------------

AgencyScene.showPayingDialog = function(self)
	self.m_curShowPageType = AgencyScene.s_pageType.PayingDialog;

	if not self.m_payingDialog then 
		self.m_payingDialog = new(AgencyPayingDialog);
		self.m_root:addChild(self.m_payingDialog);
		self.m_payingDialog:setDelegate(self);
	end 
	self.m_payingDialog:show();
end

AgencyScene.onShowPayingDialogTimeOut = function(self)
	self:showPayFailedDialog();
end
---------------------------------------------------------------------
AgencyScene.showPayFailedDialog = function(self)
	self.m_curShowPageType = AgencyScene.s_pageType.PayFailed;

	if not self.m_payFailedDialog then 
		self.m_payFailedDialog = new(AgencyPayFailedDialog);
		self.m_root:addChild(self.m_payFailedDialog);
		self.m_payFailedDialog:setDelegate(self);
	end 
	self.m_payFailedDialog:show();
end

AgencyScene.onPayFailedReturnBtnClick = function(self)
	self:showLastAgencyView();
end

AgencyScene.onPayAgainBtnClick = function(self)
	self.m_isPaying = true;
	self:showPayConfirmDialog();
	self:requestCtrlCmd(AgencyController.s_cmds.requestRecharge);
end
---------------------------------------------------------------------------
AgencyScene.onGetAgencyConfigCallback = function(self,isSuccess,agencyConfig)
	if isSuccess and self.m_curShowPageType == AgencyScene.s_pageType.None then 
		self:showLoginAgency();
	end 
end
---------------------------------------------------------------------------
AgencyScene.onNativeEvent = function(self,param,...)
	if self.s_nativeEventFuncMap[param] then
		self.s_nativeEventFuncMap[param](self,...);
	end
end

AgencyScene.onPayResult = function(self, status, json_data)
	Log.d("AgencyScene.onPayResult","json_data = ",json_data);
	-- self.m_isPaying = nil;
	if not (status and json_data) then
		return;
	end
	if self.m_payConfirmDialog then 
		self.m_payConfirmDialog:hide();
	end
	local result = GetNumFromJsonTable(json_data,"ret",2);
	Log.d("AgencyScene.onPayResult","result = ",result);
	if result == 0 then --支付发送成功
		self:showPayingDialog();
	else --支付发送失败
		self:showPayFailedDialog();
	end
end

AgencyScene.s_nativeEventFuncMap = 
{
	["payResult"] 						    = AgencyScene.onPayResult;
}
---------------------------------------------------------------------------

AgencyScene.s_controlConfig = 
{	
	[AgencyScene.s_controls.contentView] = {"contentView"};
	[AgencyScene.s_controls.htmlView] = {"htmlView"};
	[AgencyScene.s_controls.returnBtn] = {"contentView","top","returnBtn"};	
};

AgencyScene.s_controlFuncMap = 
{
	[AgencyScene.s_controls.returnBtn] = AgencyScene.onReturnBtnClick;
};

AgencyScene.s_cmdConfig = 
{
	[AgencyScene.s_cmds.GoBackWebViewUrl] = AgencyScene.onGoBackWebViewUrl;
	[AgencyScene.s_cmds.checkGoBack] 	  = AgencyScene.checkGoBack;
	[AgencyScene.s_cmds.ShowPayConfirmDialog] = AgencyScene.showPayConfirmDialog;
	[AgencyScene.s_cmds.onPaySuccessed] = AgencyScene.onPaySuccessed;
}
