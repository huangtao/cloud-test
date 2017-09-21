
--[[
	底部头像背景层
]]
local layerBase = require("games/common2/module/layerBase");

local HeadToolbarLayer = class(layerBase, false);

HeadToolbarLayer.ctor = function(self)
	super(self, nil);
	self:init();
end

HeadToolbarLayer.init = function(self)
	local localseat = PlayerSeat.getInstance():getMyLocalSeat();
	if self.m_viewConfig[localseat] then
		self:addView(localseat,self.m_viewConfig[localseat]);
	end
end

-- 初始化layer的配置
HeadToolbarLayer.initViewConfig = function(self)
	self.m_viewConfig = {
		[1] = {
			path = "games/common2/module/headToolbar/headToolbarView";
			pos = {};
			viewLayer = "view/kScreen_1280_800/games/common2/headToolbar/headToolbarLayout";
			viewConfig = "headToolbarLayout";
		};
		[2] = {};
		[3] = {};
	};
end

HeadToolbarLayer.dtor = function(self)
end

return HeadToolbarLayer;

--[[
	底部头像的背景层
]]