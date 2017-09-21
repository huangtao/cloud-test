require("common/popupWindow");
local moreGameInfoView = require(ViewPath .. "hall/moreGames/moreGameInfoView");

-- 更多游戏下载弹框
local MoreGameInfoView = class(PopupWindow, false);

local h_index = 0;
local getIndex = function(self)
    h_index = h_index + 1;
    return h_index;
end

MoreGameInfoView.s_controls = 
{
    closeBtn = getIndex(),
    contentView = getIndex(),
    downloadBtn = getIndex(),
    gameName = getIndex(),
    gameInfo = getIndex(),
    sizeText = getIndex(),
};

MoreGameInfoView.Delegate = {
    onMoreGameInfoViewDownload = "onMoreGameInfoViewDownload";
    onMoreGameInfoViewShowEnd = "onMoreGameInfoViewShowEnd";
    onMoreGameInfoViewCloseStart = "onMoreGameInfoViewCloseStart";
    onMoreGameInfoViewCloseEnd = "onMoreGameInfoViewCloseEnd";
}


MoreGameInfoView.s_cmds = 
{

};

MoreGameInfoView.ctor = function(self, data)
    super(self, moreGameInfoView);
   
    self:setFillParent(true, true);
    self:setAlign(kAlignCenter);
    self:setEventTouch(self, self.onEmptyFunc)
    self:setEventDrag(self, self.onEmptyFunc);
    self:_initData(data);
    self:_initView();
    self:_showData();
end

MoreGameInfoView.dtor = function(self)

end

MoreGameInfoView.isShowing = function(self)
    return self.m_isShowing;
end

MoreGameInfoView.show = function(self)
    self:_moveIn();

    self.m_isShowing = true;
end

MoreGameInfoView.hidden = function(self)
    if self.m_isShowing then

        self:_moveOut();
        self.m_isShowing = false;
    end
end

MoreGameInfoView._moveIn = function(self)
    self:execDelegate(MoreGameInfoView.Delegate.onMoreGameInfoViewShowEnd);

    if not self.m_data then
        PopupWindow.show(self, PopupWindowStyle.NORMAL);
        return;
    end
    local startX = self.m_data.isPageEnd and 360 or -360;
    local startY = self.m_data.isPageEnd and 0 or 0;

    local anim = self.m_root:addPropTranslate(0, kAnimNormal, 400, 0, startX, startY, 0, 0);
    anim:setEvent(self, function(self)
        self.m_root:removeProp(0);
    end)
    PopupWindow.show(self, PopupWindowStyle.NORMAL);
end

MoreGameInfoView._moveOut = function(self)
    if not self.m_data then
        PopupWindow.hidden(self, PopupWindowStyle.NORMAL);
        return;
    end

    local startX = self.m_data.isPageEnd and 0 or 0;
    local startY = self.m_data.isPageEnd and 360 or -360;

    local anim = self.m_root:addPropTranslate(1, kAnimNormal, 400, 0, startX, startY, 0, 0);
    anim:setEvent(self, function(self)
        PopupWindow.hidden(self, PopupWindowStyle.NORMAL);
        self.m_root:removeProp(1);
        self:execDelegate(MoreGameInfoView.Delegate.onMoreGameInfoViewCloseEnd);
    end)
end

MoreGameInfoView.onEmptyFunc = function(self) 
end

MoreGameInfoView.onCloseBtnClick = function(self)
    self:execDelegate(MoreGameInfoView.Delegate.onMoreGameInfoViewCloseStart);
end

MoreGameInfoView.onDownloadBtnClick = function(self)
    self:execDelegate(MoreGameInfoView.Delegate.onMoreGameInfoViewDownload);
end

-------------------------------------------------------------------------
MoreGameInfoView._initData = function(self, data)
    self.m_data = data;
end

MoreGameInfoView._showData = function(self)
    local data = self.m_data;

    self.m_gameName:setText(data.name);

    if not string.isEmpty(data.desc) then
        self.m_gameInfo:setText(data.desc);
    else
        self.m_gameInfo:setText("这是一款老少咸宜的棋牌游戏，刺激有趣，快来试试吧！");
    end

    local size = tonumber(data.size) or 0;
    local sizeStr = string.format("游戏大小：%.2fM",math.max(size/1024/1024,0.01));
    self.m_sizeText:setText(sizeStr);   


    if data.isPageEnd then
        self.m_closeBtn:setAlign(kAlignTopLeft);
        self.m_contentView:setAlign(kAlignLeft);
        self.m_root:setAlign(kAlignRight);
    else
        self.m_closeBtn:setAlign(kAlignTopRight);
        self.m_contentView:setAlign(kAlignRight);
        self.m_root:setAlign(kAlignLeft);
    end
end

MoreGameInfoView._initView = function(self)
    self.m_closeBtn = self:findViewById(self.s_controls.closeBtn);
    self.m_contentView = self:findViewById(self.s_controls.contentView);
    self.m_gameName = self:findViewById(self.s_controls.gameName);
    self.m_gameInfo = self:findViewById(self.s_controls.gameInfo);
    self.m_sizeText = self:findViewById(self.s_controls.sizeText);
end

--------------------------------------------------------------------------------
MoreGameInfoView.s_controlConfig =
{   
    [MoreGameInfoView.s_controls.closeBtn] = {"info_bg", "close_btn"};
    [MoreGameInfoView.s_controls.contentView] = {"info_bg", "content_view"};
    [MoreGameInfoView.s_controls.gameName] = {"info_bg", "content_view", "game_name"};
    [MoreGameInfoView.s_controls.gameInfo] = {"info_bg", "content_view", "game_info"};
    [MoreGameInfoView.s_controls.downloadBtn] = {"info_bg", "content_view", "download_btn"};
    [MoreGameInfoView.s_controls.sizeText] = {"info_bg", "content_view", "size_bg", "size"};

};

MoreGameInfoView.s_controlFuncMap =
{
    [MoreGameInfoView.s_controls.closeBtn] = MoreGameInfoView.onCloseBtnClick;
    [MoreGameInfoView.s_controls.downloadBtn] = MoreGameInfoView.onDownloadBtnClick;

};

MoreGameInfoView.s_cmdConfig =
{
};

return MoreGameInfoView;