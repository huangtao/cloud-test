require("games/common2/match/module/matchLayerBase");

local MatchToolbarLayer = class(MatchLayerBase);

MatchToolbarLayer.init = function(self)
	local localseat = PlayerSeat.getInstance():getMyLocalSeat();
	if self.m_viewConfig[localseat] then
		self:addView(localseat,self.m_viewConfig[localseat]);
	end
end

MatchToolbarLayer.parseViewConfig = function(self)
    local viewConfig = {
        ["onlooker"] = {};
    };

    return viewConfig;
end

-- 初始化layer的配置
MatchToolbarLayer.initViewConfig = function(self)
	self.m_viewConfig = GameMatchConfig.matchToolbar;
	if not self.m_viewConfig then 
		self.m_viewConfig = {
			[1] = {
				path = "games/common2/match/module/matchToolbar/matchToolbarView";
				pos = {};
				viewLayer = "view/kScreen_1280_800/games/common2/match/match_toolbar_2";
				viewConfig = "match_toolbar_2";
				config = {
					menu_view = {
						["x"] = 10;
						["y"] = 0;
						["align"] = kAlignTopRight;
					};
					time_view = {
						["x"] = -10;
						["y"] = 0;
						["align"] = kAlignTopLeft;
						["isShow"] = true;
					};
					menu_btn_config = {
						["x"] = 0;
						["y"] = 0;
						["align"] = kAlignTopRight;
					};
				};
			};
		};
	end 
end

MatchToolbarLayer.initTimeView = function(self)
	local localseat = PlayerSeat.getInstance():getMyLocalSeat();
	if self.m_viewConfig[localseat] then
		local config = self.m_viewConfig[localseat].config;
		MechineManage.getInstance():receiveAction(GameMechineConfig.ACTION_NS_INITTIMEVIEW,config.time_view);
	end
end

MatchToolbarLayer.s_stateFuncMap = {
    [MatchMechineConfig.STATUS_PLAYING]   = "initTimeView";
};

return MatchToolbarLayer;

--[[
	比赛工具栏

	配置：
	config = {
					menu_view = { 		--菜单显示位置
						["x"] = 10;
						["y"] = 0;
						["align"] = kAlignTopRight;
					};
					time_view = {		--时间显示配置
						["x"] = -10;
						["y"] = 0;
						["align"] = kAlignTopLeft;
						["isShow"] = true; --是否显示时间
					};
				}
]]