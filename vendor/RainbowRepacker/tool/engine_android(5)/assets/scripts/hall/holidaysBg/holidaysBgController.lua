require("common/httpModule")
require("isolater/common/commonController")

HolidaysBgController = class(CommonController)

HolidaysBgController.s_cmds =
{
	goBack = 1,
}

HolidaysBgController.ctor = function(self, state, viewClass, viewConfig)
	self.m_state = state
end

HolidaysBgController.dtor = function(self)

end

HolidaysBgController.onGoBack = function(self)
	mainHandle_toHall()
end

HolidaysBgController.resume = function(self)
	CommonController.resume(self)
	NativeEvent.getInstance():closeSecrecy()
  	NativeEvent.getInstance():DelView()
  	NativeEvent.getInstance():CloseStartScreen()
	NativeEvent.getInstance():HideLoadingDialog()
	NativeEvent.getInstance():HideLoadingScene()
end

HolidaysBgController.splashScreenFinish = function(self, flag, info)
    self:updateView(HolidaysBgScene.s_cmds.doInit)
end

HolidaysBgController.s_cmdConfig = 
{
	[HolidaysBgController.s_cmds.goBack] = HolidaysBgController.onGoBack,
}

HolidaysBgController.s_nativeEventFuncMap = {
    ["splashScreenFinish"] = HolidaysBgController.splashScreenFinish,
}