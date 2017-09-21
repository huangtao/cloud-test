require("isolater/common/commonController");
require("hall/gameData/secrecyData");
require("hall/common/commonJumpLogic");
local SettingScene = require("hall/setting/settingScene");

SettingController = class(CommonController);

SettingController.s_cmds =
{
	goBack = 1,
    OpenFeedback = 2,
	OpenSecrecy = 3,
	OpenService = 4,
	OpenH5Agency = 5,
}

SettingController.ctor = function(self, state, viewClass, viewConfig)
	self.m_state = state;
end

SettingController.resume = function(self)
	CommonController.resume(self);
	require("hall/floatBall/data/floatBallDataInterface");
    FloatBallDataInterface:getInstance():setSceneName("set");
end

SettingController.pause = function(self)
	CommonController.pause(self);
end

SettingController.dtor = function(self)
end

SettingController.onGoBack = function(self)
	self.m_state:popState();
end

--意见反馈
SettingController.onOpenFeedback = function(self)	
	self.m_state:pushState(States.Suggestion,nil,true);
end

-- aboutus
SettingController.onOpenService = function(self)
	kSecrecyData:setCurView("service");
	self.m_state:pushState(States.AboutUs);
end

--gamehelp
SettingController.onOpenSecrecy = function(self)
	kSecrecyData:setCurView("secrecy");
	self.m_state:pushState(States.GameHelp);
end

SettingController.onOpenH5Agency = function(self)
   	self.m_state:pushState(States.AgencyH5);
end

SettingController.onGoBackWebViewUrl = function (self, status, jsonTable)
	self:updateView(SettingScene.s_cmds.GoBackWebViewUrl);
end

SettingController.onWebviewCall = function(self, status, jsonTable, jsonStr)
	if table.isEmpty(jsonTable) then 
		return; 
	end
	Log.v("SettingController.onWebviewCall","---------js回调充值-------data:", jsonTable);
	if status and jsonTable then
		local jsonData = json.decode(jsonStr);
		CommonJumpLogic.getInstance():executeJsCall(jsonData);
	end 
end

SettingController.checkIsRefuseBack = function(self)
	return self:updateView(SettingScene.s_cmds.checkIsRefuseBack);
end

SettingController.s_cmdConfig = 
{
	[SettingController.s_cmds.goBack] = SettingController.onGoBack,
    [SettingController.s_cmds.OpenFeedback] = SettingController.onOpenFeedback;
	[SettingController.s_cmds.OpenService] = SettingController.onOpenService; -- aboutus
	[SettingController.s_cmds.OpenSecrecy] = SettingController.onOpenSecrecy; --gamehelp
	[SettingController.s_cmds.OpenH5Agency]  = SettingController.onOpenH5Agency;
};


SettingController.s_nativeEventFuncMap = {
	["GoBackWebViewUrl"] = SettingController.onGoBackWebViewUrl;
	["OnWebViewCall"] = SettingController.onWebviewCall;
}