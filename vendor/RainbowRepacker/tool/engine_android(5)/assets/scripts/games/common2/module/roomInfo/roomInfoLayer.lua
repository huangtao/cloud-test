--[[
	私人房房间id显示
]]

local layerBase = require("games/common2/module/layerBase");

local RoomInfoLayer = class(layerBase);

RoomInfoLayer.ctor = function ( self )
	local localseat = PlayerSeat.getInstance():getMyLocalSeat();
    if self.m_viewConfig[localseat] then
        self:addView(localseat,self.m_viewConfig[localseat]);
    end
end

RoomInfoLayer.initViewConfig = function ( self )
	-- body
	self.m_viewConfig = {
		[1] = {
			path = "games/common2/module/roomInfo/roomInfoView",
            viewLayer = "view/kScreen_1280_800/games/common2/room_info";
            viewConfig = "room_info";
		};
		[2] = {};
		[3] = {};
	};
end

RoomInfoLayer.s_stateFuncMap = {};

RoomInfoLayer.s_actionFuncMap = {

};

return RoomInfoLayer;

--[[
	显示私人房，房间号

	创建私人房成功后，STATUS_LOGIN，通知UI显示房间号。
	房间号，分长ID和短ID，UI上显示的是短ID。
]]