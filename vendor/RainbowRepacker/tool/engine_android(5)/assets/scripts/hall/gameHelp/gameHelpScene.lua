require("common/commonScene")


local GameHelpScene = class(CommonScene);


GameHelpScene.s_controls = 
{	
	backBtn = 1,
	leftTabListView = 2,
	rightContent  = 3,
}

GameHelpScene.s_cmds = 
{
	initViewData = 1,
}

GameHelpScene.ctor = function(self,viewConfig, controller)
	self.m_controller = controller;
	self.m_ctrls = GameHelpScene.s_controls;
	HallDataInterface.getInstance():setWebViewShowing(true);
end

GameHelpScene.resume = function(self)
	CommonScene.resume(self);
	self:initView();
end

GameHelpScene.pause = function(self)
	CommonScene.pause(self);
end

GameHelpScene.dtor = function(self)
	NativeEvent.getInstance():closeSecrecy();
	HallDataInterface.getInstance():setWebViewShowing(false);
end

GameHelpScene.initView = function(self)
	local leftTabData = self:getLeftTabData();
	self.m_leftTabAdapter = new(require("hall/gameHelp/widget/gameHelpTabAdapter"), leftTabData, 1, self, self.onLeftTabAdapterItemClick);--(self, data, selectIndex, flag, scene, itemClickFunc)
	local tabListView = self:findViewById(self.m_ctrls.leftTabListView);
	tabListView:setAdapter(self.m_leftTabAdapter);
	tabListView:setScrollBarWidth(0);								
	tabListView:setMaxClickOffset(5);

	local rightContent = self:findViewById(self.m_ctrls.rightContent);
	local x,y = rightContent:getAbsolutePos();
	kSecrecyData:setWebViewPos(x, y);
	local w,h = rightContent:getSize();
	kSecrecyData:setWebViewSize(w*System.getLayoutScale(), h*System.getLayoutScale());
	self:showViews(1);
end

GameHelpScene.onLeftTabAdapterItemClick = function(self, index)  -- adapter button 点击回调函数
	self:showViews(index);
end

GameHelpScene.onReturnBtnClick = function(self)
	self:requestCtrlCmd(GameHelpController.s_cmds.goBack);
end

GameHelpScene.showViews = function(self,index)
	local htmlFileNames = self:getHtmlFileNames();
	self:requestCtrlCmd(GameHelpController.s_cmds.open_secrecy, "gameHelp", htmlFileNames[index]);
end

GameHelpScene.getLeftTabData = function(self)
	local tabs = {};
	for k, v in ipairs( RegionConfigDataInterface.getInstance():getGameHelpHtmlConfig()) do
		table.insert(tabs, v.name);
	end
	return tabs;
end

GameHelpScene.getHtmlFileNames = function(self)
	local filenames = {};
	for k, v in ipairs( RegionConfigDataInterface.getInstance():getGameHelpHtmlConfig() ) do
		table.insert(filenames, v.fileName);
	end
	return filenames;
end

GameHelpScene.s_controlConfig = 
{
	[GameHelpScene.s_controls.backBtn] = {"bg","topView","returnBtn"},
	[GameHelpScene.s_controls.leftTabListView] 	= {"bg" ,"contentView", "c_left" , "left_tab_list"},
	[GameHelpScene.s_controls.rightContent]  = {"bg","contentView", "c_right","c_listview"};
}

GameHelpScene.s_controlFuncMap = 
{
	[GameHelpScene.s_controls.backBtn] = GameHelpScene.onReturnBtnClick ;
}

GameHelpScene.s_cmdConfig = 
{
	[GameHelpScene.s_cmds.initViewData] = GameHelpScene.onInitViewData,
}

return GameHelpScene;