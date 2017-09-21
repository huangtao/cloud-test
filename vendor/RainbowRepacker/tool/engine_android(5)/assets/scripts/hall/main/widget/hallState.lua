require("common/commonScene")
require("hall/hallConfig");
require("hall/main/widget/hallScene");
require("hall/main/widget/hallController");
require("common/messageBox");
local hall = require(HallViewPath .. "main/hall")
require("util/TableLib");
require("hall/update/updateData");
require("hall/update/updateMgr");
require("common/commonState");
require("hall/animation/hallAnimConfig");

HallState = class(CommonState)
HallState.fromTag = "start";
HallState.ctor = function(self)
	self.m_controller = nil;
	self.m_loadImagesRef = {};
end

HallState.getController = function(self)
	return self.m_controller;
end

HallState.load = function(self)
	CommonState.load(self);
	self:__preloadCommonImages();
	self.m_controller = new(HallController, self, HallScene, hall);
	return true;
end

HallState.unload = function(self)
	CommonState.unload(self);
	
	self:__releaseCommonImages();

	delete(self.m_controller);
	self.m_controller = nil;
	if MessageBox.isShowing() then --FIXME 先这样放着，返回键异步相应需要再梳理一下
		MessageBox.hide();
		return;
	end
end

--退出
HallState.onExit = function(self)
	if self.m_controller then
	end
	UpdateData.getInstance():save();
	sys_exit();
end

HallState.onContinue = function(self)
	if self.m_controller then
    	
    end
end

HallState.onClose = function(self)
	if self.m_controller then
	end
end

HallState.dtor = function(self)
end

--@预加载一些公共图片资源，为了让大厅各场景界面切换时更流畅
HallState.__preloadCommonImages = function(self)
	local loadImages = {
		"hall/common/btn_return.png",
		"hall/common/scene_bg.png",
		"hall/common/scene_top.png",
		"hall/common/tab_bg_sel.png",
		"hall/common/tab_line.png",
		"hall/common/gold.png",
		"hall/common/diamond.png",

		"hall/common/popupWindow/popupWindow_bg_55_55_55_55.png",
		"hall/common/popupWindow/popupWindow_Yellowtitle.png",
		"hall/common/popupWindow/popupWindow_close.png",

		"hall/community/freind_bg.png",

		"hall/matchHall/bg.jpg",
	}

	for k, v in pairs(loadImages) do
		table.insert(self.m_loadImagesRef, new(Image, v) );
	end
end

HallState.__releaseCommonImages = function(self)
	for k, v in pairs(self.m_loadImagesRef) do
		delete(v);
	end
	self.m_loadImagesRef = {};
end