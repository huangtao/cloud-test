require("isolater/widget/gameLevelListCustomView/pageViewBase");

HallGameListPageView = class(PageViewBase);

HallGameListPageView.getPageItemNum = function(self)
    return 4;
end

HallGameListPageView.getPageItemView = function(self)
    return HallGameListPageItem;
end

HallGameListPageView.getMarginSpace = function(self)
    return 81;
end

-------------------------------
require("common/commonGameLayer");
require("hall/animation/animScale")
local hall_game_list_item = require(HallViewPath .. "main/hall_game_list_item");
require("uilibs/userMoneyItem");

HallGameListPageItem = class(CommonGameLayer, false);

HallGameListPageItem.s_controls = 
{
    bg = 1,
    logo = 2,
    onlineNumView = 3,
    word = 4;
    newGamesIcon = 5;
    moreGamesView = 6;
    redDot = 7;
};

HallGameListPageItem.ctor = function(self, data)
    super(self,hall_game_list_item);
    self.m_ctrls = HallGameListPageItem.s_controls;
    self:setSize(self.m_root:getSize());
    self.m_data = data;
    self:init();
    self:setName("game"..data.id);
end

HallGameListPageItem.dtor = function(self)
    AnimScale.release();
    delete(self.m_onlineNum)
    self.m_onlineNum = nil
end

HallGameListPageItem.onBgTouch = function(self , finger_action , x , y, drawing_id_first , drawing_id_current)
    if finger_action == kFingerDown then
        self:setColor(128,128,128);
        AnimScale.play(self, true);
        self.m_startX = x;
        self.m_startY = y;
    elseif finger_action == kFingerUp then
        AnimScale.play(self, false);
        self:setColor(255,255,255);
        local disX = math.abs(x - self.m_startX);
        local disY = math.abs(y - self.m_startY);
        if drawing_id_first == drawing_id_current and disX < 15 and disY < 15 then
            kEffectPlayer:play(EffectsCommon.AudioButtonClick);
            self:_report();
            EventDispatcher.getInstance():dispatch(HallController.s_eventRequestGameRoomList, self.m_data);
        end
    end
end

HallGameListPageItem.init =function (self)
    self.m_logo = self:findViewById(self.m_ctrls.logo);
    local icon = kGameManager:getGameIconWithGamePkgname(self.m_data.game_pkg);
    if not string.isEmpty(icon) then
        self.m_logo:setFile(icon);
    end

    if not string.isEmpty(self.m_data.icon) then
        ImageCache.getInstance():request(self.m_data.icon,self,HallGameListPageItem.onImageDownload);
    end

    self:refreshOnlineNums();
    self:refreshMoreGames();
end

HallGameListPageItem.refreshOnlineNums = function(self)
    if self.m_data.game_pkg == "games/private_room" or self.m_data.game_pkg == "games/match_room" 
        or self.m_data.game_pkg == "games/more_games" then
        self:findViewById(self.m_ctrls.onlineNumView):setVisible(false);
        return;
    end

    local isValidPlay = self:isValidPlay();
    self:findViewById(self.m_ctrls.newGamesIcon):setVisible(not isValidPlay);
    self:findViewById(self.m_ctrls.onlineNumView):setVisible(isValidPlay);

    UserMoneyItem.setFilePath( UserMoneyItem.s_onlineNumFilePath );
    if not self.m_onlineNum then
        self.m_onlineNum = new(UserMoneyItem);
        self:findViewById(self.m_ctrls.onlineNumView):addChild(self.m_onlineNum);
    end

    local num = HallDataInterface.getInstance():getGamePlayerNumsByGameId(self.m_data.id);
    self.m_onlineNum:setMoneyNum(num);
    self.m_onlineNum:setAlign(kAlignRight);

    local w,_ = self.m_onlineNum:getSize();
    local word_w,_ = self:findViewById(self.m_ctrls.word):getSize();
    self:findViewById(self.m_ctrls.onlineNumView):setSize(w+word_w+3);

    UserMoneyItem.setFilePath(nil);
end

HallGameListPageItem.isValidPlay = function(self)
    local getGameStatus = HallUpdateConfig.getInstance():getGameStatus(self.m_data.id);
    if getGameStatus == HallGameStatus.CanPlay then
        return true;
    else
        return false;
    end
end

HallGameListPageItem.onImageDownload = function(self,url,fileName)
    if not string.isEmpty(fileName) then
        self.m_logo:setFile(fileName);
    end
end

HallGameListPageItem.refreshMoreGames = function(self)
    local moreGamesView = self:findViewById(self.m_ctrls.moreGamesView);
    local dotView = self:findViewById(self.m_ctrls.redDot);
    moreGamesView:removeAllChildren();
    if self.m_data.game_pkg == "games/more_games" and not table.isEmpty(self.m_data.moreGames) then
        local alignMap = {kAlignTopLeft, kAlignTopRight, kAlignBottomLeft, kAlignBottomRight};
        local function onMoreGamesImageDownload(self, url, imagePath, view) 
            self:_setMoreGamesIcon(view, imagePath);
        end

        local count = 1;
        for k, v in ipairs(self.m_data.moreGames) do
            local view = UIFactory.createNode();
            view:setAlign(alignMap[count]);
            view:setSize(100, 100);
            view:setPos(0, 0);

            moreGamesView:addChild(view);

            local icon = kGameManager:getGameIconWithGamePkgname(v.game_pkg);
            self:_setMoreGamesIcon(view, icon);

            if not string.isEmpty(v.icon) then
                ImageCache.getInstance():request(v.icon, self, onMoreGamesImageDownload, view);
            end

            count = count + 1;
            if count > 4 then
                break;
            end
        end

        local openState = kGameManager:getMoreGamesOpenStatus();
        dotView:setVisible(openState);
        moreGamesView:setVisible(true);
    else
        moreGamesView:setVisible(false);
        dotView:setVisible(false);
    end
end

HallGameListPageItem._report = function(self)
    local data = self.m_data;
    if data.game_pkg == "games/private_room" then
        UBReport.getInstance():report(UBConfig.kHallGameType, "private");
    elseif data.game_pkg == "games/match_room" then
        UBReport.getInstance():report(UBConfig.kHallGameType, "match");
    elseif data.game_pkg == "games/more_games" then
        UBReport.getInstance():report(UBConfig.kHallGameType, "more");
    else
        UBReport.getInstance():report(UBConfig.kHallGameType, (data and data.id) and data.id or "");
    end
end

HallGameListPageItem._setMoreGamesIcon = function(self, view, file)
    if view and not string.isEmpty(file) then
        local w, _ = view:getSize();
        local img = new(Mask, file, "hall/common/mask.png");
        local imgW, imgH = img:getSize();
        img:setSize(w, imgH * w / imgW);
        img:setAlign(kAlignTop);

        view:removeAllChildren();
        view:addChild(img);

        local imgBg = UIFactory.createImage("hall/common/gameicon_bg.png");
        imgBg:setAlign(kAlignCenter);
        imgBg:setLevel(1);
        view:addChild(imgBg);
    end
end

HallGameListPageItem.s_controlConfig = 
{   
    [HallGameListPageItem.s_controls.bg] = {"bg"},
    [HallGameListPageItem.s_controls.logo] = {"bg", "logo"},
    [HallGameListPageItem.s_controls.onlineNumView] = {"bg", "logo", "onlineNumView"},
    [HallGameListPageItem.s_controls.word] = {"bg", "logo", "onlineNumView", "word"};
    [HallGameListPageItem.s_controls.newGamesIcon] = {"bg", "logo", "gameStatusView", "newGamesIcon"};
    [HallGameListPageItem.s_controls.moreGamesView] = {"bg", "logo", "moreGamesView"};
    [HallGameListPageItem.s_controls.redDot] = {"bg", "logo", "redDot"};
};

HallGameListPageItem.s_controlFuncMap =
{
    [HallGameListPageItem.s_controls.bg] = HallGameListPageItem.onBgTouch;
};