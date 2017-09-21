
--[[
	房间内设置弹框
]]
local layerBase = require("games/common2/module/layerBase");
local SettingLayer = class(layerBase);

SettingLayer.ctor = function ( self )
end

SettingLayer.dtor = function ( self )
end

SettingLayer.parseViewConfig = function(self)
	local viewConfig = {
		["onlooker"] = {};
	};

	return viewConfig;
end

SettingLayer.initViewConfig = function ( self )
	self.m_viewConfig = {
		[1] = {
			path = "games/common2/module/setting/settingView";
			pos = {};
			viewLayer = "view/kScreen_1280_800/games/common2/roomSetting_new";
			viewConfig = "roomSetting_new";
			config = {
				sliderDefaultImgs = { "isolater/progress_bg_l15_r15_t15_b15.png",
							"isolater/progress_fg2_l15_r15_t15_b15.png",
							"isolater/progress_btn2.png"
						 };
				checkBoxDefaultImgs = { "isolater/checkbox_uncheck.png",
									    "isolater/checkbox_checked.png"
									  };
			};
		};
		[2] = {};
		[3] = {};
	};
end

SettingLayer.addView = function(self,seat,viewConfig)
	if viewConfig and viewConfig.config then
		local config = table.verify(viewConfig.config);
		if not table.isEmpty(config.sliderDefaultImgs) then
			Slider.setDefaultImages(unpack(config.sliderDefaultImgs));
		end 
		if not table.isEmpty(config.checkBoxDefaultImgs) then 
			CheckBox.setDefaultImages(config.checkBoxDefaultImgs);
		end

		layerBase.addView(self,seat,viewConfig);

		if not table.isEmpty(config.sliderDefaultImgs) then
			Slider.setDefaultImages();
		end 
		if not table.isEmpty(config.checkBoxDefaultImgs) then 
			CheckBox.setDefaultImages();
		end
	else 
		layerBase.addView(self,seat,viewConfig);
	end 
end

SettingLayer.onCloseSettingView = function(self, seat, uid, info, isFast)
	self:removeView(seat);
end

SettingLayer.s_actionFuncMap = {
	[GameMechineConfig.ACTION_NS_CLOSE_SETTING]			= "onCloseSettingView";
}

SettingLayer.s_stateFuncMap = {
	[GameMechineConfig.STATUS_GAMEOVER]					= "onCloseSettingView";
};

return SettingLayer;

--[[
	设置模块
	调用方式：
		1、创建弹框
		local action = GameMechineConfig.ACTION_NS_CREATVIEW;
	 	local data = {viewName = GameMechineConfig.VIEW_SETTING}
		MechineManage.getInstance():receiveAction(action,data);
		2、显示弹框
		local action = GameMechineConfig.ACTION_NS_OPEN_SETTING;
		MechineManage.getInstance():receiveAction(action);

	状态监听：
	STATUS_GAMEOVER：结算时，关闭弹框

	动作监听：
	ACTION_NS_CLOSE_SETTING：关闭弹框
	ACTION_NS_OPEN_SETTING：显示弹框
]]