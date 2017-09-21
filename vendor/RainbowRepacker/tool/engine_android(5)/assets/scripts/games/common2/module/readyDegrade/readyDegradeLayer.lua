
local layerBase = require("games/common2/module/layerBase");

--[[
	
]]
local ReadyDegradeLayer = class(layerBase);

ReadyDegradeLayer.ctor = function(self)
end

ReadyDegradeLayer.dtor = function(self)
	
end

ReadyDegradeLayer.parseViewConfig = function(self)
    local viewConfig = {
        ["onlooker"] = {};
    };

    return viewConfig;
end

-- 初始化layer的配置
ReadyDegradeLayer.initViewConfig = function(self)
	self.m_viewConfig = {
		[1] = {
			path = "games/common2/module/readyDegrade/readyDegradeView";
			pos = {};
		};
		[2] = {};
		[3] = {};
	};
end

return ReadyDegradeLayer;

--[[
	配桌降场
		准备后很久不开局就降场

	监听状态：
	STATUS_LOGIN：登陆时，显示准备、换桌按钮。开启了自动准备时，会发送准备消息
	STATUS_READY：准备状态，准备按钮隐藏
	STATUS_START：牌局开始，界面隐藏
]]