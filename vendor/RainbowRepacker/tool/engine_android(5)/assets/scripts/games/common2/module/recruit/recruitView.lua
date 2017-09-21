
--[[
    招募的主界面，广播邀请、微信邀请
]]

local ViewBase = require("games/common2/module/viewBase");

local RecruitView = class(ViewBase, false);

RecruitView.Delegate = {
};

RecruitView.s_controls =
{
    itemView            = ToolKit.getIndex();
	recuitBtn 		    = ToolKit.getIndex();
	inviteSelectedArea 	= ToolKit.getIndex();
	broadcastBtn 		= ToolKit.getIndex();
	weChatBtn 		    = ToolKit.getIndex();
};

RecruitView.ctor = function(self,seat,viewConfig)
    super(self, viewConfig);
    self:setSize(self.m_root:getSize());
    self.m_seat = seat;
    self:setFillParent(true, true);
    self.m_ctrls = RecruitView.s_controls;

    self.m_recuitBtn = self:findViewById(self.m_ctrls.recuitBtn);

    self:initConfig();
    self:setVisible(false);
end

RecruitView.dtor = function(self)
end

RecruitView.initConfig = function(self)
    local viewCommonConfig = self:getCommonConfig();
    local config = table.verify(viewCommonConfig.recruitBtnConfig);
    self.itemView = self:findViewById(self.m_ctrls.itemView);
    self.itemView:setPos(config.x or 0, config.y or 0);
    self.itemView:setAlign(config.align or kAlignRight);
end

RecruitView.onBroadcastBtnClick = function(self)
    self:dealRecruitChoice("broadcast",UBConfig.kRoomRecruiteBroadcast);
end


RecruitView.showRecruitView = function(self,desc)
    if not self.m_recruitView then
        local recruitWnd = require("games/common2/module/recruit/recruitWnd");
        self.m_recruitView = new(recruitWnd);
        self:addChild(self.m_recruitView);
        self.m_recruitView:setAlign(kAlignCenter);
        self.m_recruitView:show(desc);
    end
end

RecruitView.onCloseRecruitWnd = function(self,seat,uid,info,isFast)
    if self.m_recruitView then
        self:removeChild(self.m_recruitView);
        delete(self.m_recruitView);
        self.m_recruitView = nil;
    end
end


--处理招募按钮的事件
RecruitView.dealRecruitChoice = function(self, choiceType, reportId)
     local curGameId = GameInfoIsolater.getInstance():getCurGameId();
    UBReport.getInstance():report(reportId, string.format("gameId_%s", curGameId or ""));

    Log.d("wanpg--RecruitView.dealRecruitChoice---",choiceType);


    local privateRoomInfo = PrivateRoomIsolater.getInstance():getCurPrivateRoomInfo();
    Log.v("RecruitView.showInviteBtn",privateRoomInfo);

    if table.isEmpty(privateRoomInfo) then
        return;
    end

    if choiceType == "wechat" then
        local weichatData = self:getPrivateRoomWeiChatData();
        WeiXinIsolater.getInstance():weixinSendWebPage(weichatData.friend_url, weichatData.title, weichatData.desc, weichatData.share_icon, false);
    elseif choiceType == "broadcast" then
        --此处展示广播界面
        local desc = self:getPrivateRoomRecruitDesc();
        desc = desc or "";
        self:showRecruitView(desc);
    end
end

RecruitView.getPrivateRoomRecruitDesc = function(self)
    local privateRoomInfo = PrivateRoomIsolater.getInstance():getCurPrivateRoomInfo();
    privateRoomInfo = table.verify(privateRoomInfo);

    local _all,_cur = self:getPlayerCount();
    local data =
    {
        gameName = GameInfoIsolater.getInstance():getGameName(privateRoomInfo.gameId);
        game_level = "约牌房";
        room_id = privateRoomInfo.tId or "";
        room_basechips = privateRoomInfo.baseChip or "";
        room_emptyseats = _all-_cur;
    }
    local tInvite_content = PrivateRoomIsolater.getInstance():getPrivateRoomRecruitDesFormat();
    local desc = nil;
    if tInvite_content and data then
        tInvite_content = table.copyTab(tInvite_content);
        for i=2,#tInvite_content do
            tInvite_content[i]=(data[tInvite_content[i]] or "" .. "");
        end
        desc = string.format(unpack(tInvite_content));
    end
    return desc;
end

RecruitView.getPrivateRoomWeiChatData = function(self)
    local desc = self:getPrivateRoomRecruitDesc();
    local weiChatInfo = WeiXinIsolater.getInstance():getWeiXinChatInfo();
    local weichatData = {"recruitView",};
    if table.isTable(weiChatInfo) then
        weichatData.friend_url = weiChatInfo.friend_url;
        weichatData.space_url  = weiChatInfo.space_url;
        weichatData.desc       = desc or weiChatInfo.desc or "";
        weichatData.title      = weiChatInfo.title;
        weichatData.share_icon = weiChatInfo.share_icon or "";
        weichatData.taskid     = 1;
    end
    return weichatData;
end

--获取用户总数与现在的个数
RecruitView.getPlayerCount=function(self)
    local config = self:getCommonConfig();
    return number.valueOf(config.playerNumer), GamePlayerManager2.getInstance():getPlayerSize();
end

--获取通用配置
RecruitView.getCommonConfig = function(self)
    return table.verify(GameProcessManager2.getInstance():getGameConfig());
end

RecruitView.onSendRadioCallBack = function(self,seat,uid,info,isFast)
    if not info then 
        return;
    end
    local isSuccess = info.isSuccess
    local info = info.info;
    if isSuccess then
        Toast.getInstance():showText(kTextBroadcast, 50, 30, kAliginCenter, "", 30, 250, 210, 70);  

        local updateInfo = { };
        local moneyData = {};
        moneyData.key = "money";
        moneyData.value = UserPropertyIsolater.getInstance():getMoney();
        moneyData.propertyId = UserPropertyIsolater.getInstance():getPropertySilverCoinID();
        table.insert(updateInfo, moneyData);
        GamePlayerManager2.getInstance():updatePlayerInfo(GameConstant.SEAT_LOCAL_MINE, updateInfo);

        local action = GameMechineConfig.ACTION_NS_UPDATE_USERINFO;
        MechineManage.getInstance():receiveAction(action);

    else 
        local msg = info.errorTips or "";
        if msg ~= "" then 
            Toast.getInstance():showText(msg, 50, 30, kAliginCenter, "", 30, 255, 255, 255);    
        end 
    end
end

RecruitView.onShowRecruitView = function (self,seat,uid,info,isFast)
    self:setVisible(true);
end

-- 设置广播邀人按钮是否可显示
RecruitView.onRecruitBtnVisible = function(self,seat,uid,info,isFast)
    if info and info.isvisible ~= nil then
        self:setVisible(info.isvisible);
    end
end

RecruitView.s_controlConfig =
{
    [RecruitView.s_controls.itemView]                = {"recruitView"},
	[RecruitView.s_controls.recuitBtn] 	             = {"recruitView","recuitBtn"},

};

RecruitView.s_controlFuncMap = 
{
	[RecruitView.s_controls.recuitBtn] 	                        = RecruitView.onBroadcastBtnClick,

};

RecruitView.s_stateFuncMap = {
    [GameMechineConfig.STATUS_LOGIN]                            = "onShowRecruitView";
    [GameMechineConfig.STATUS_GAMEOVER]                         = "onShowRecruitView";
};
                    
RecruitView.s_actionFuncMap = {
    [GameMechineConfig.ACTION_NS_RECEIVE_SENDRAIAOCALLBACK]     = "onSendRadioCallBack";
    [GameMechineConfig.ACTION_NS_RECRUIT_VISIBLE]               = "onRecruitBtnVisible";
    [GameMechineConfig.ACTION_NS_CLOSE_RECRUITEWND]             = "onCloseRecruitWnd";
}

return RecruitView;