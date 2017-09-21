require("isolater/common/commonController");

AboutUsController = class(CommonController);

AboutUsController.ctor = function(self, state, viewClass, viewConfig)
	self.m_state = state;
end

AboutUsController.resume = function(self)
	CommonController.resume(self);
end

AboutUsController.pause = function(self)
	CommonController.pause(self);
end

AboutUsController.dtor = function(self)
	NativeEvent.getInstance():closeSecrecy();
end

AboutUsController.initViewData =function(self)
	local AboutUsScene = require("hall/aboutus/aboutUsScene");
	self:updateView(AboutUsScene.s_cmds.initViewData);
end

AboutUsController.openSecrecy = function(self, viewName)
	local info={};
	local x,y = kSecrecyData:getWebViewPos();
	local w,h = kSecrecyData:getWebViewSize();
	Log.d("rightContent x,y: ", x,y);
	Log.d("rightContent w,h: ", w,h);
	info.x = x * System.getLayoutScale() + 15;
	info.y = y * System.getLayoutScale();
	info.w = w;
	info.h = h;

	local platform =sys_get_string("platform") or "";

	if viewName == "secrecy" then
		info.html="gamePolicy";
		info.htmlfileName = "gamePolicy";

	elseif viewName == "service" then
		info.html="gameServiceAgreement";
		info.htmlfileName = "gameServiceAgreement";
	end
	info.forwhat = "aboutus";
	local json_data = json.encode(info);
	NativeEvent.getInstance():openSecrecy(json_data);
end

AboutUsController.onGoBack = function(self)
	self.m_state:popState();
end

AboutUsController.s_cmds =
{
	goBack = 1,
	open_secrecy = 2,
}

AboutUsController.s_cmdConfig = 
{
	[AboutUsController.s_cmds.goBack] = AboutUsController.onGoBack,
	[AboutUsController.s_cmds.open_secrecy] = AboutUsController.openSecrecy,
};