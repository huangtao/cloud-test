require("isolater/common/commonController");

GameHelpController = class(CommonController);

GameHelpController.ctor = function(self, state, viewClass, viewConfig)
	self.m_state = state;
end

GameHelpController.resume = function(self)
	CommonController.resume(self);
end

GameHelpController.pause = function(self)
	CommonController.pause(self);
end

GameHelpController.dtor = function(self)
end

GameHelpController.initViewData =function(self)
	self:updateView(GameHelpScene.s_cmds.initViewData);
end

GameHelpController.openSecrecy = function(self, viewName, htmlfileName)
	local info={};
	local x,y = kSecrecyData:getWebViewPos();
	local w,h = kSecrecyData:getWebViewSize();
	Log.d("rightContent x,y: ", x,y);
	Log.d("rightContent w,h: ", w,h);
	info.x = x * System.getLayoutScale()  + 6;
	info.y = y * System.getLayoutScale();
	info.w = w;
	info.h = h;
	info.forwhat = "gameHelp";
	info.htmlfileName = htmlfileName;
	local json_data = json.encode(info);
	NativeEvent.getInstance():openSecrecy(json_data);
end

GameHelpController.onGoBack = function(self)
	self.m_state:popState();
end

GameHelpController.s_cmds =
{
	goBack = 1,
	open_secrecy = 2,
}

GameHelpController.s_cmdConfig = 
{
	[GameHelpController.s_cmds.goBack] = GameHelpController.onGoBack,
	[GameHelpController.s_cmds.open_secrecy] = GameHelpController.openSecrecy,
};