local layerBase = require("games/common2/module/layerBase");

--[[
	弹幕
]]
local OnlookerBarrageLayer = class(layerBase);

OnlookerBarrageLayer.ctor = function(self)
	local seat = PlayerSeat.getInstance():getOnlookerSeat();
	if self.m_viewConfig[seat] then
		self:addView(seat,self.m_viewConfig[seat]);
	end
end

OnlookerBarrageLayer.dtor = function(self)
end

OnlookerBarrageLayer.parseViewConfig = function(self)
	local config = table.verify(GameProcessManager2.getInstance():getGameConfig());
	local onlookerBarrageConfig = table.verify(config.onlookerBarrageConfig);
	local seat = PlayerSeat.getInstance():getOnlookerSeat();
	local viewConfig = {
        ["onlooker"] = {
            [seat] = {
                path = "games/common2/onlooker/module/onlookerBarrage/onlookerBarrageView";
				viewLayer = "view/kScreen_1280_800/games/common2/onlooker/onlooker_barrage_layout";
				config = {
					switchConfig = onlookerBarrageConfig.switchConfig;
					msgDetailConfig = onlookerBarrageConfig.msgDetailConfig;
					colorsConfig = onlookerBarrageConfig.colorsConfig;
				};
            };
        };
        ["normal"] = {};
    };

    return viewConfig;
end

return OnlookerBarrageLayer;

--配置说明：
	-- local onlooker_barrage_pin_map = require("qnFiles/qnPlist/games/onlooker_barrage_pin");
	-- xxxConfig中添加 onlookerBarrageConfig ，配置格式如下：

	-- xxxConfig.onlookerBarrageConfig = {
	-- 	switchConfig = { --弹幕开关按钮配置，（示例为默认展示位置及图片）
	-- 		align = kAlignBottomRight; --对齐方式
	-- 		x = 15; --位置
	-- 		y = 320; --位置		
	-- 		visible = true; --是否显示，不配默认为显示
	-- 		file = { --弹幕开关图片配置，可不配
	-- 				onlooker_barrage_pin_map["btn_barrage_off.png"],--弹幕关闭时显示的图片
	-- 				onlooker_barrage_pin_map["btn_barrage_on.png"],--弹幕开启时显示的图片
	-- 				};
	-- 	};

	-- 	msgDetailConfig = { --打开发送弹幕页面的按钮配置，（示例为默认展示位置及图片）
	-- 		align = kAlignBottomRight; --对齐方式
	-- 		x = 15;  --位置
	-- 		y = 233; --位置
	-- 		visible = true; --是否显示，不配默认为显示
	-- 		file = onlooker_barrage_pin_map["btn_msg.png"]; --图片路径，为string或table，格式参看Button，可不配
	-- 	};

	-- 	colorsConfig = { --弹幕字体颜色（示例为默认展示的颜色），可不配
	-- 		normal = {255,255,255}; --普通玩家发送的文本弹幕的字体颜色
	-- 		props = {141,214,255};--玩家发送的道具弹幕的字体颜色
	-- 		vip = {255,241,10};--vip玩家发送的弹幕的字体颜色
	-- 	};
	-- };

	-- 该项配置可不添加，不配时则使用默认配置