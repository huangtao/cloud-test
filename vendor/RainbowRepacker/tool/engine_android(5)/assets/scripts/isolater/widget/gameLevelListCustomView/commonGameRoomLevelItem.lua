require("common/commonGameLayer");
local gameRoomLevelItem = require(ViewPath.."isolater/gameLevelListCustomView/gameRoomLevelItem");
local roomLevels_pin_map = require("qnFiles/qnPlist/hall/roomLevels_pin")
local CommonGameRoomLevelItem = class(CommonGameLayer, false);

CommonGameRoomLevelItem.s_controls = {
    button = 1,
    contentView = 2,
    baseChipView = 3,
    baseChipIcon = 4,
    onlineNumView = 5,
    cheat_icon  = 6;
    onlineText = 7;
}

CommonGameRoomLevelItem.ctor = function(self, data, viewPagerHeight)
    super(self, gameRoomLevelItem);

    self.m_ctrls = CommonGameRoomLevelItem.s_controls;
    self.m_data = data;
    self.m_viewPagerHeight = viewPagerHeight;

    local w, _ = self.m_root:getSize();
    local h = self:__getItemHeight();
    self:setSize(w, h);

    self:initView();

    kGameManager:setObserver(self);
end

CommonGameRoomLevelItem.dtor = function(self)
    kGameManager:clearObserver(self);
end

CommonGameRoomLevelItem.setContentAlign = function(self, align)
    self.m_root:setAlign(align);
end

CommonGameRoomLevelItem.onItemClick = function(self)
    EventDispatcher.getInstance():dispatch(GameLevelListViewBase.s_eventItemClick, self.m_data);
end

CommonGameRoomLevelItem.initView = function(self)
    self:refreshLevelIcon();
    self:refreshCustomView();
    self:refreshOnlineNums();
    self:checkIsDefenseCheat();
end

CommonGameRoomLevelItem.refreshLevelIcon = function(self)
    local key = string.format("levelIcon_%s.png", tostring(self.m_data.levelId) );
    local localIcon = roomLevels_pin_map[key];
    if localIcon then
        self:findViewById(self.m_ctrls.button):setFile(localIcon);
    end

    local url = self.m_data.icon;
    if not string.isEmpty(url) then
       ImageCache.getInstance():request(url, self, self.onDownloadIcon);
    end   
end

--virtual
CommonGameRoomLevelItem.refreshCustomView = function(self)
    self:refreshBaseChipView();
end

CommonGameRoomLevelItem.refreshBaseChipView = function(self)
    self:__showCommonBaseChipView();
end

CommonGameRoomLevelItem.checkIsDefenseCheat = function(self)
    local isOpen = kGameManager:isDuringDefenseCheatTime(self.m_data.levelId, self.m_data.gameId);
    self:findViewById(self.m_ctrls.cheat_icon):setVisible(isOpen);
end

CommonGameRoomLevelItem.__setBaseChipNumFile = function (self)
    local baseChipIcon = self:findViewById(self.m_ctrls.baseChipIcon);
    baseChipIcon:setFile(roomLevels_pin_map["baseChip.png"]);
    baseChipIcon:setSize(baseChipIcon.m_res:getWidth(),baseChipIcon.m_res:getHeight());
end

CommonGameRoomLevelItem.__splitGreatNumber = function (self, baseNum)
    if baseNum >= 100000000 then
        baseNum = (baseNum/100000000).."Y";
    elseif baseNum >= 100000 then
        baseNum = (baseNum/10000).."W";
    end
    return baseNum;
end

CommonGameRoomLevelItem.__showCommonBaseChipView = function(self)
    UserMoneyItem.setFilePath(UserMoneyItem.s_roomLevelBrightRedNumFilePath);
    self:__setBaseChipNumFile();
    local parent = self:getBaseChipParentView();
    if not self.m_commonBaseChip then
        self.m_commonBaseChip = new(UserMoneyItem);
        parent:addChild(self.m_commonBaseChip);
    end
    self.m_commonBaseChip:setNormalMoneyNum(self:__splitGreatNumber(number.valueOf(self.m_data.baseChip)));
    self.m_commonBaseChip:setAlign(kAlignLeft);
 
    local x,_ = parent:getPos();
    self:findViewById(self.m_ctrls.baseChipIcon):setPos(x + self.m_commonBaseChip.m_width, nil);
   
    UserMoneyItem.setFilePath(nil);
end

--@param isSplit：是否用逗号进行分离
CommonGameRoomLevelItem.createNumWithBaseChipImage = function(self, num, percent, isSplit)
    UserMoneyItem.setFilePath(UserMoneyItem.s_roomLevelBrightRedNumFilePath);
    self:__setBaseChipNumFile();
    num = number.valueOf(num);
    percent = number.valueOf(percent, 1);
    local numNode = new(UserMoneyItem);
    if isSplit then
        numNode:setNormalMoneyNum(self:__splitGreatNumber(num), percent);
    else
        numNode:setMoneyNum(num, percent);
    end

    UserMoneyItem.setFilePath(nil);

    return numNode;
end

CommonGameRoomLevelItem.getBaseChipParentView = function(self)
    return self:findViewById(self.m_ctrls.baseChipView);
end

CommonGameRoomLevelItem.getContentView = function(self)
    return self:findViewById(self.m_ctrls.contentView);
end

CommonGameRoomLevelItem.onDownloadIcon = function(self,url,fileName)
    if not string.isEmpty(fileName) then
        self:findViewById(self.m_ctrls.button):setFile(fileName);
    end
end

CommonGameRoomLevelItem.onGetGameLevelPlayerNumCallBack = function(self)
    self:refreshOnlineNums();
end

CommonGameRoomLevelItem.refreshOnlineNums = function(self)
    local _playerNum = kGameManager:getGameLevelPlayerNum(self.m_data.gameId,self.m_data.levelId);
   self:findViewById(self.m_ctrls.onlineText):setText(string.valueOf(_playerNum).."人");
end

CommonGameRoomLevelItem.__getItemHeight = function(self)
    local btn = self:findViewById(self.s_controls.button);
    local _, btnH = btn:getSize();
    
    local count = (self.m_viewPagerHeight + 0.38 * btnH) / btnH - 0.5;
    count = math.floor(count)

    local itemH = (self.m_viewPagerHeight + 0.38 * btnH) / (count + 0.5);
    return itemH;
end

CommonGameRoomLevelItem.s_controlConfig = {
    [CommonGameRoomLevelItem.s_controls.button] = {"button"},
    [CommonGameRoomLevelItem.s_controls.contentView] = {"button", "contentView"},
    [CommonGameRoomLevelItem.s_controls.baseChipView] = {"button", "contentView", "baseChipView"},
    [CommonGameRoomLevelItem.s_controls.baseChipIcon] = {"button", "contentView", "baseChipIcon"},
    
    [CommonGameRoomLevelItem.s_controls.onlineNumView]  = {"button", "onlineNumView"},
    [CommonGameRoomLevelItem.s_controls.onlineText]  = {"button", "onlineNumView","onlineText"},
    
    [CommonGameRoomLevelItem.s_controls.cheat_icon] = {"button", "cheat_icon"};
}

CommonGameRoomLevelItem.s_controlFuncMap = {
    [CommonGameRoomLevelItem.s_controls.button] = CommonGameRoomLevelItem.onItemClick;
}

return CommonGameRoomLevelItem;
