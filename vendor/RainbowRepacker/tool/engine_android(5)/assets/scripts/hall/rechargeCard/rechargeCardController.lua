require("isolater/common/commonController")
require("hall/common/commonJumpLogic")

RechargeCardController = class(CommonController)

RechargeCardController.s_cmds = 
{
	Back = 1,
};

RechargeCardController.s_timeOutTime = 6000;

RechargeCardController.ctor = function(self, state, viewClass, viewConfig)
	self.m_state = state;
end

RechargeCardController.dtor = function(self)	
	LoadingView.getInstance():hidden();
	self.m_state = nil;
end

RechargeCardController.onBack = function(self)
	if NativeEvent.s_platform ~= kPlatformAndroid then 
		self:onGoBackWebView();
	else
		NativeEvent.getInstance():GoBackWebView();
	end
end

RechargeCardController.onGoBackWebView = function(self, status, jsonTable)
	StateMachine.getInstance():popState();
end

RechargeCardController.onWebviewCall = function(self, status, jsonTable, jsonStr)
	Log.v("RechargeCardController.onWebviewCall", "status = ", status, "jsonTable = ", jsonTable, "jsonStr = ", jsonStr);
	if table.isEmpty(jsonTable) then return; end
	
	if status and jsonTable then
		local jsonData = json.decode(jsonStr);
		if table.isEmpty(jsonData) then
			return;
		end
		local isNeedBackToHall = CommonJumpLogic.getInstance():executeJsCall(jsonData);
		local cmd = number.valueOf(jsonData.cmd);
		if isNeedBackToHall then
			self:onGoBackWebView();		
		end
	end
end

RechargeCardController.s_nativeEventFuncMap = {
	["GoBackWebViewUrl"] 		= RechargeCardController.onGoBackWebView;
	["OnWebViewCall"] 			= RechargeCardController.onWebviewCall;
}

RechargeCardController.s_cmdConfig = 
{
	[RechargeCardController.s_cmds.Back] = RechargeCardController.onBack,
}