
local layerBase = require("games/common2/module/layerBase");

--[[
    实时对讲层
]]

local ChatRealTimeLayer = class(layerBase);

ChatRealTimeLayer.s_cmds = {
};

ChatRealTimeLayer.ctor = function(self)
    local localseat = PlayerSeat.getInstance():getMyLocalSeat();
    if self.m_viewConfig[localseat] then
        self:addView(localseat,self.m_viewConfig[localseat]);
    end
    local w = System.getScreenScaleWidth();
    local h = System.getScreenScaleHeight();
    self:setSize(w, h);
end

ChatRealTimeLayer.dtor = function(self)
end

ChatRealTimeLayer.parseViewConfig = function(self)
    local viewConfig = {
        ["onlooker"] = {};
    };

    return viewConfig;
end

-- 初始化layer的配置
ChatRealTimeLayer.initViewConfig = function(self)
    self.m_viewConfig = {
        [1] = {
            path = "games/common2/module/chatRealTime/chatRealTimeView";
            viewLayer = "view/kScreen_1280_800/games/common2/chatRealTimeLayer";
            viewConfig = "chatRealTimeLayer";
            config = table.verify(GameProcessManager2.getInstance():getGameConfig()).chatRealTimeBtnConfig or {
            ["x"] = 280;
            ["y"] = 15;
            ["align"] = kAlignTopLeft;};
            };
        [2] = {};
        [3] = {};
    };
end

return ChatRealTimeLayer;

--[[
    实时对讲:
    
    ACTION_NS_LOGIN_VIDEO：登录语音对讲服务器
    ACTION_NS_LOGIN_VIDEO：登出语音对讲服务器
    ACTION_NS_SHOW_MICROPHONE：显示语音对讲话筒
    ACTION_NS_HIDE_MICROPHONE：隐藏语音对讲话筒
    ACTION_NS_UPDATE_CHAT_VOICE：显示玩家语音动画
    ACTION_NS_REFRESH_CHAT_VOICE: 刷新玩家语音动画（玩家头像位置更改）

    配置说明：
    自定义按钮的位置
    DDZConfig.chatRealTimeBtnConfig = {
        ["x"] = 20;
        ["y"] = 270;
        ["align"] = kAlignBottomRight;
    }
]]