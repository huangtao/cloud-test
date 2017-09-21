
local layerBase = require("games/common2/module/layerBase");

--[[
    招募玩家功能层
]]

local RecruitLayer = class(layerBase);

RecruitLayer.s_cmds = {
};

RecruitLayer.ctor = function(self)
    local localseat = PlayerSeat.getInstance():getMyLocalSeat();
    if self.m_viewConfig[localseat] then
        self:addView(localseat,self.m_viewConfig[localseat]);
    end
end

RecruitLayer.dtor = function(self)
end

RecruitLayer.parseViewConfig = function(self)
    local viewConfig = {
        ["onlooker"] = {};
    };

    return viewConfig;
end

-- 初始化layer的配置
RecruitLayer.initViewConfig = function(self)
    self.m_viewConfig = {
        [1] = {
            path = "games/common2/module/recruit/recruitView";
            pos = {};
            viewLayer = "view/kScreen_1280_800/games/common2/room_recruitView";
            viewConfig = "room_recruitView";
        };
        [2] = {};
        [3] = {};
    };
end

RecruitLayer.onCloseRecruitView = function (self,seat,uid,info,isFast)
	if self.m_views[seat] then
        self.m_views[seat]:setVisible(false);
    end
end

RecruitLayer.s_stateFuncMap = {
    [GameMechineConfig.STATUS_PLAYING]          = "onCloseRecruitView";
    [GameMechineConfig.STATUS_START]            = "onCloseRecruitView";
    [GameMechineConfig.STATUS_GAMEOVER]         = "onCloseRecruitView";
};

RecruitLayer.s_actionFuncMap = {
};

return RecruitLayer;

--[[
    招募玩家
    私人房，发送系统广播，招募玩家。
    招募一次需要扣除一定的银币，扣除银币后达到破产条件，会提示不能发送招募信息

    状态监听：
    STATUS_START/STATUS_PLAYING/STATUS_GAMEOVER：游戏开始和结算时，需要关闭招募的弹框

    动作监听：
    ACTION_NS_CLICK_DESKTOP：点击桌面空白区域，隐藏弹框
    ACTION_NS_RECEIVE_SENDRAIAOCALLBACK：发送招募邀请消息回调，更新银币、ui

    ACTION_NS_RECRUIT_VISIBLE：广播邀人按钮是否可显示
    lcoal data = {isvisible = true/false}
    MechineManage.getInstance():receiveAction(GameMechineConfig.ACTION_NS_RECRUIT_VISIBLE,data);
]]