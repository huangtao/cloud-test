local iosPayWebView = require(ViewPath.."hall/shortCutRecharge/iosPayWebView");

local IosPayWebView = class(CommonGameLayer, false);

IosPayWebView.Delegate = {
	onIosPayWebViewClose = "onIosPayWebViewClose";
}

IosPayWebView.s_controls = 
{
	groundBg		= 1;
	returnBtn 		= 2;
	content			= 3;
	bg 				= 4;
};

IosPayWebView.ctor = function(self)
	super(self,iosPayWebView);

    self:getControl(IosPayWebView.s_controls.bg):setEventTouch(nil , function()
    end);
    self:getControl(IosPayWebView.s_controls.bg):setEventDrag(nil , function()
    end);
end

IosPayWebView.getWebFrame = function (self)
	local contentView = self:findViewById(IosPayWebView.s_controls.groundBg);
	local x,y = contentView:getAbsolutePos();
	local w,h = contentView:getSize();
	return x*System.getLayoutScale(), y*System.getLayoutScale(), w*System.getLayoutScale(), h*System.getLayoutScale();
end

--关闭界面
IosPayWebView.onReturnBtnClick = function(self)
	NativeEvent.getInstance():closeIosWebPay();
	self:execDelegate(IosPayWebView.Delegate.onIosPayWebViewClose, true);
end

IosPayWebView.s_controlConfig =
{
	[IosPayWebView.s_controls.groundBg] 		= {"ground_bg"};
	[IosPayWebView.s_controls.returnBtn] 		= {"topView","returnBtn"};
	[IosPayWebView.s_controls.content] 			= {"content"};
	[IosPayWebView.s_controls.bg] 				= {"bg"};
	
};

IosPayWebView.s_controlFuncMap = 
{
	[IosPayWebView.s_controls.returnBtn] 			= IosPayWebView.onReturnBtnClick;
}

IosPayWebView.s_nativeEventFuncMap = {
	["closeLuaIosWebPayView"]		= IosPayWebView.onReturnBtnClick;
};

return IosPayWebView;
