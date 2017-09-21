require("common/popupWindow");
local match_hall_record_info_history_layout = require(ViewPath .. "hall/matchHall/widget/match_hall_record_info_history_layout");
local match_record_pin_map = require("qnFiles/qnPlist/hall/match_record_pin");
require("gameData/weixinShareUtil");
require("hall/gameData/share/shareDataInterface");
require("isolater/interface/regionConfigIsolater");

-- 比赛战绩信息弹框
local GameMatchHallRecordMatchInfo = class(PopupWindow, false);

local h_index = 0;
local getIndex = function(self)
    h_index = h_index + 1;
    return h_index;
end

GameMatchHallRecordMatchInfo.s_controls = 
{
    contentView = getIndex(),
    contentBg = getIndex(),
    momentBtn = getIndex(),
    wechatBtn = getIndex(),
    text = getIndex(),
    line = getIndex(),
};

GameMatchHallRecordMatchInfo.Delegate = {
    onMatchInfoShowCallback = "onMatchInfoShowCallback";
    onMatchInfoCloseCallback = "onMatchInfoCloseCallback";
}


GameMatchHallRecordMatchInfo.s_cmds = 
{

};

GameMatchHallRecordMatchInfo.__setWeixinGroupOrWeixinFriendPos = function (self)
    local defualtShareBgW = 200;
    local weixinGroupBtn = self:findViewById(self.s_controls.momentBtn);
    local weixinFriendBtn = self:findViewById(self.s_controls.wechatBtn);
    local line = self:findViewById(self.s_controls.line);
    local defualtShareConfig = RegionConfigIsolater.getInstance():getDefaultShareConfig();
    if defualtShareConfig["weixinGroup"] and not defualtShareConfig["weixinFriend"] then
        weixinFriendBtn:setVisible(false);
        weixinGroupBtn:setPos(0, nil);
        weixinGroupBtn:setAlign(kAlignCenter);
        line:setVisible(false);
    elseif not defualtShareConfig["weixinGroup"] and defualtShareConfig["weixinFriend"] then   
        weixinGroupBtn:setVisible(false);
        weixinFriendBtn:setPos(0, nil);
        weixinFriendBtn:setAlign(kAlignCenter);
        line:setVisible(false);
    elseif not defualtShareConfig["weixinGroup"] and not defualtShareConfig["weixinFriend"] then
        Toast.getInstance():showText(kBackpackShareTips,50,30,kAlignLeft,"",24,200,175,110);
        line:setVisible(false);
        weixinFriendBtn:setVisible(false);
        weixinGroupBtn:setVisible(false);
    end
end

GameMatchHallRecordMatchInfo.ctor = function(self)
    super(self, match_hall_record_info_history_layout);
   
    self:setFillParent(true, true);
    self:setAlign(kAlignCenter);
    self:setEventTouch(self, self.onBgTouch);
    self:setEventDrag(self, function() end)
    self:_initView();
    self:__setWeixinGroupOrWeixinFriendPos();
    self:addToRoot();
end

GameMatchHallRecordMatchInfo.dtor = function(self)
end

GameMatchHallRecordMatchInfo.isShowing = function(self)
    return self.m_isShowing;
end

GameMatchHallRecordMatchInfo.show = function(self, data)
    PopupWindow.show(self, PopupWindowStyle.NORMAL);

    self.m_isShowing = true;

    self:_initData(data);
    self:_showData();

    self:execDelegate(GameMatchHallRecordMatchInfo.Delegate.onMatchInfoShowCallback, self.m_isShowUp);
end

GameMatchHallRecordMatchInfo.hidden = function(self)
    if self.m_isShowing then
        self.m_isShowing = false;
        PopupWindow.hidden(self, PopupWindowStyle.NORMAL);
    end

    self:execDelegate(GameMatchHallRecordMatchInfo.Delegate.onMatchInfoCloseCallback);
end

GameMatchHallRecordMatchInfo.setContentPos = function(self, x, y, delta)
    local contentView = self:findViewById(self.s_controls.contentView);
    local contentBg = self:findViewById(self.s_controls.contentBg);
    local sHeight = System.getScreenScaleHeight();

    local w, h = contentView:getSize();
    contentView:setAlign(kAlignTopLeft);

    self.m_isShowUp = (y + delta + h) > sHeight;
    
    local viewX = x - w / 2;
    local viewY = self.m_isShowUp and (y - h - delta) or (y + delta);
    contentView:setPos(viewX, viewY);

    local file = self.m_isShowUp and match_record_pin_map["popup_bg_up.png"] or match_record_pin_map["popup_bg_down.png"]
    local align = self.m_isShowUp and kAlignTop or kAlignBottom;
    contentBg:setFile(file);
    contentBg:setAlign(align)
end

GameMatchHallRecordMatchInfo.onBgTouch = function(self, finger_action, x, y, drawing_id_first,drawing_id_current, event_time)
    if finger_action == kFingerUp then
        self:_closeView();
    end
end

-- 分享朋友圈
GameMatchHallRecordMatchInfo.onMomentBtnClick = function(self)
    UBReport.getInstance():report(UBConfig.kHallMatchRecordMatchShareMoment);
    self:_sendToWeChat(true);
    self:_closeView();
end

-- 分享微信好友
GameMatchHallRecordMatchInfo.onWechatBtnClick = function(self)
    UBReport.getInstance():report(UBConfig.kHallMatchRecordMatchShareWechat);
    self:_sendToWeChat(false);
    self:_closeView();
end

----------------------------------------------------------------------------------------
GameMatchHallRecordMatchInfo._closeView = function(self)
    EventDispatcher.getInstance():dispatch(kClosePopupWindows);
end

GameMatchHallRecordMatchInfo._initData = function(self, data)
	self.m_data = data;
end

GameMatchHallRecordMatchInfo._showData = function(self)
    local data = self.m_data;
    
    self.m_text:setText(string.format("实力超强，您共计淘汰%s位选手", data.eliminate));
end

GameMatchHallRecordMatchInfo._initView = function(self)
    self.m_text = self:findViewById(self.s_controls.text);
end
--------------------------------------分享-----------------------------------------
GameMatchHallRecordMatchInfo._sendToWeChat = function(self, isSendToMoment)
    local info = ShareDataInterface.getInstance():getWeiXinChatInfo();
    local shareData = self:_getShareData(isSendToMoment, info);
    WeixinShareUtil.getInstance():weixinSendWebPage(shareData.url, shareData.title, shareData.desc, shareData.share_icon, isSendToMoment);
end

GameMatchHallRecordMatchInfo._getShareData = function(self, isSendToMoment, info)
    local title, desc = self:_getShareDesc(isSendToMoment);
    local data = {};
    if table.isTable(info) then
        data.url = isSendToMoment and info.space_url or info.friend_url;
        data.desc       = desc or info.desc or "";
        data.title      = title or info.title or "";
        data.share_icon = info.share_icon or "";
    end

    return data;
end

GameMatchHallRecordMatchInfo._getShareDesc = function(self, isSendToMoment)
    local data = self.m_data;
    local str = string.format("我在%s中获得了第%s名", data.matchname or "", data.rank or "")
    
    if not string.isEmpty(data.rewards) then
        str = string.format("%s，获得%s", str, data.rewards);
    end

    if data.eliminate > 0 then
        str = string.format("%s，击败了%s名玩家", str, data.eliminate);
    end

    if isSendToMoment then
        return str, "";
    else
        return RegionConfigDataInterface.getInstance():getRegionProductName(), str;
    end
end

--------------------------------------------------------------------------------
GameMatchHallRecordMatchInfo.s_controlConfig =
{   
    [GameMatchHallRecordMatchInfo.s_controls.contentView] = {"contentView"};
    [GameMatchHallRecordMatchInfo.s_controls.contentBg] = {"contentView", "contentBg"};
    [GameMatchHallRecordMatchInfo.s_controls.momentBtn] = {"contentView", "btnView", "momentBtn"};
    [GameMatchHallRecordMatchInfo.s_controls.wechatBtn] = {"contentView", "btnView", "wechatBtn"};
    [GameMatchHallRecordMatchInfo.s_controls.text] = {"contentView", "text"};
    [GameMatchHallRecordMatchInfo.s_controls.line] = {"contentView","btnView","line1"};
};

GameMatchHallRecordMatchInfo.s_controlFuncMap =
{
    [GameMatchHallRecordMatchInfo.s_controls.momentBtn] = GameMatchHallRecordMatchInfo.onMomentBtnClick;
    [GameMatchHallRecordMatchInfo.s_controls.wechatBtn] = GameMatchHallRecordMatchInfo.onWechatBtnClick;
};

GameMatchHallRecordMatchInfo.s_cmdConfig =
{
};

return GameMatchHallRecordMatchInfo;