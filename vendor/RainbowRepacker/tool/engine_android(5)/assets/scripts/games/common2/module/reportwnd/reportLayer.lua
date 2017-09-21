
--[[
	房间举报弹框
]]
local layerBase = require("games/common2/module/layerBase");
local reportLayer = class(layerBase);

reportLayer.ctor = function ( self )
end

reportLayer.dtor = function ( self )
end

reportLayer.parseViewConfig = function(self)
    local viewConfig = {
        ["onlooker"] = {};
    };

    return viewConfig;
end

reportLayer.initViewConfig = function ( self )
	self.m_viewConfig = {
		[1] = {
				path = "games/common2/module/reportwnd/reportView";
				pos = {};
			};
		[2] = {};
		[3] = {};
	};
end

return reportLayer;

--[[
	举报模块
	
	调用方式：
	1、创建举报模块的layer
		local action = GameMechineConfig.ACTION_NS_CREATVIEW;
		local data = {viewName = GameMechineConfig.VIEW_REPORT}
	   	MechineManage.getInstance():receiveAction(action,data);
	2、显示举报模块
		action = GameMechineConfig.ACTION_NS_OPEN_REPORT;
		local data = {uid=self.m_player.m_id,whichItem = _whichItem};
		MechineManage.getInstance():receiveAction(action,data);
]]