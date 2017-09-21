local layerBase = require("games/common2/module/layerBase");

local SilverLayer = class(layerBase);

SilverLayer.ctor = function ( self )

end

SilverLayer.dtor = function ( self )

end

SilverLayer.parseViewConfig = function(self)
	local viewConfig = {
		["onlooker"] = {};
	};

	return viewConfig;
end

SilverLayer.initViewConfig = function ( self )
	self.m_viewConfig = {
		[1] = {
			path = "games/common2/module/silver/silverView",
			viewLayer = "view/kScreen_1280_800/games/common2/silver/silverLayout",
			viewConfig = "silverLayout"
		}
	};
end

SilverLayer.s_stateFuncMap = {

};

SilverLayer.s_actionFuncMap = {

};

return SilverLayer;
