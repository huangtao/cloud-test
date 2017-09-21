local ViewBase = require("games/common2/module/viewBase");

local HeadToolbarView = class(ViewBase,false);

HeadToolbarView.s_controls = {
	per_info_bg 	= ToolKit.getIndex();
};

HeadToolbarView.ctor = function ( self, seat, layoutConfig )
	super(self,layoutConfig);

	self:setFillParent(true,true);

	local info_bg = self:getControl(HeadToolbarView.s_controls.per_info_bg);
	local bg_w, bg_h = info_bg:getSize();
	local screenWidth = System.getScreenScaleWidth();
	info_bg:setSize(screenWidth-34,bg_h);
end

HeadToolbarView.dtor = function ( self )
end

HeadToolbarView.s_controlConfig = {
	[HeadToolbarView.s_controls.per_info_bg]	= {"per_info_bg"};
};

return HeadToolbarView;
