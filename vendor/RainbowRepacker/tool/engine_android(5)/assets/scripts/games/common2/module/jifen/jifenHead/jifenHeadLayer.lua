local layerBase = require("games/common2/module/layerBase");

local JiFenHeadLayer = class(layerBase);

JiFenHeadLayer.ctor = function(self)
	self:init();
end

JiFenHeadLayer.dtor = function(self)
end

JiFenHeadLayer.init = function (self)
	local config = table.verify(GameProcessManager2.getInstance():getGameConfig());
	local playerNumer = number.valueOf(config.playerNumer,3);
	for seat = 2, playerNumer do
		if not self.m_views[seat] then
			self:addView(seat,self.m_viewConfig[seat]);
		end
	end
end

JiFenHeadLayer.onHideChangeSeate = function(self,seat,uid,info,isFast)
	for _,view in pairs(self.m_views) do 
		view:onHideChangeSeate();
	end 
end

JiFenHeadLayer.onMyReLogin = function(self,seat,uid,info,isFast)
	for _,view in pairs(self.m_views) do 
		view:onJiFenFinished();
	end 
end

JiFenHeadLayer.parseViewConfig = function(self)
	local viewConfig = {
        ["onlooker"] = {};
    };

    return viewConfig;
end

-- 初始化layer的配置
JiFenHeadLayer.initViewConfig = function(self)
	self.m_viewConfig = {};

	local config = table.verify(GameProcessManager2.getInstance():getGameConfig());
	local headPos = table.verify(config.jifenHeadPos);
	local playerNumer = number.valueOf(config.playerNumer,3);
	for seat = 2, playerNumer do
		local info = {};
		info.path = "games/common2/module/jifen/jifenHead/jifenHeadView";
		info.viewLayer = "view/kScreen_1280_800/games/common2/jifen/jifenHead_layout";
		if not table.isEmpty(headPos[seat]) then 
			info.align = headPos[seat].align;
			local pos = {};
			pos.x = headPos[seat].x;
			pos.y = headPos[seat].y;
			info.pos = pos;
		end  
		info.config = {
			isNeedChangeSeate = table.verify(headPos[seat]).isNeedChangeSeate;
		};

		self.m_viewConfig[seat] = info;
	end
end

JiFenHeadLayer.s_actionFuncMap = {	
	[GameMechineConfig.ACTION_NS_JIFEN_HIDE_CHANGE_SEATE] 	= "onHideChangeSeate";
	[GameMechineConfig.ACTION_NS_RELOGIN_FOR_RECONNECT]		= "onMyReLogin";
};

return JiFenHeadLayer;
