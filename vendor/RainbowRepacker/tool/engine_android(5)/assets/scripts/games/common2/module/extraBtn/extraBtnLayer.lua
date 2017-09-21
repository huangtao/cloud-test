
local layerBase = require("games/common2/module/layerBase");
--[[
	扩展按钮
]]
local ExtraBtnLayer = class(layerBase);

ExtraBtnLayer.Delegate = 
{
};

ExtraBtnLayer.s_cmds = {
};


ExtraBtnLayer.ctor = function(self)
    local localseat = PlayerSeat.getInstance():getMyLocalSeat();
	if self.m_viewConfig[localseat] then
		self:addView(localseat,self.m_viewConfig[localseat]);
	end
end

ExtraBtnLayer.dtor = function(self)

end

-- 初始化layer的配置
ExtraBtnLayer.initViewConfig = function(self)
	self.m_viewConfig = {
		[1] = {
			path = "games/common2/module/extraBtn/extraBtnView";
			pos = {};
			config = table.verify(GameProcessManager2.getInstance():getGameConfig()).extraBtnConfig;
		};
		[2] = {};
		[3] = {};
	};
end

ExtraBtnLayer.s_cmdConfig = {
};

return ExtraBtnLayer;


--[[
	扩展按钮:
	支持游戏自定义,
	
	ep：配置
	DDZConfig.extraBtnConfig = {
		["direction"] = kVertical; -- kHorizontal,kVertical
		["x"] = -40;
		["y"] = 0;
		["align"] = kAlignRight;
		["config"] = {
			-- 需要配置的按钮，和当前支持的类型
			["chat"] = { index = 2 , isShow = false, file = "games/common/btn_face.png"};
			["help"] = { index = 3 , isShow = false, file = "" };
			["switch"] = { index = 4 , isShow = false, file = "" };
			["recharge"] = { index = 1 , isShow = false, file = "" };
			["share"] = { index = 2 , isShow = false, file = "" };
			["free_room_task"] = { index = 1 , isShow = false, file = "" };
		};
	};
]]