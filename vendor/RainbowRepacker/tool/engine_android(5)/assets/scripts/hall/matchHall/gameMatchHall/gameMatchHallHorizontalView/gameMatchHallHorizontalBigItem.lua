local match_hall_horizontal_item_layout = require(ViewPath .. "/hall/matchHall/match_hall_horizontal_big_item_layout");
local match_hall_pin_map = require("qnFiles/qnPlist/hall/match_hall_pin");
require("hall/recharge/data/rechargeDataInterface");
require("uilibs/userMoneyItem");

local ItemBase = require("hall/matchHall/gameMatchHall/gameMatchHallHorizontalView/gameMatchHallItemBase");

-- 比赛列表广告图item
local GameMatchHallHorizontalBigItem = class(ItemBase, false);

local h_index = 0;
local getIndex = function(self)
    h_index = h_index + 1;
    return h_index;
end

GameMatchHallHorizontalBigItem.s_controls = 
{
    btnItem = getIndex(),
    bg = getIndex(),
    nameView = getIndex(),
    txtTime = getIndex(),
    txtCount = getIndex(),
    txtReward = getIndex(),
    iconReward = getIndex(),
    condition = getIndex(),
    conditionFee = getIndex(),
    conditionView = getIndex(),
    resurgence_icon = getIndex(),
    icon = getIndex(),
    tagBg = getIndex(),
    iconGame = getIndex(),
    timeTextView = getIndex(),
};

GameMatchHallHorizontalBigItem.Delegate = {
    onMatchItemClick = "onMatchItemClick"; -- 比赛点击回调
};

GameMatchHallHorizontalBigItem.ctor = function(self, data)
    super(self, match_hall_horizontal_item_layout);
   
    self:setSize(self.m_root:getSize())

    self:_setData(data);
    self:_initView();
    self:_resetView();

    if self.m_data then    
        self:_showData();
    end
end

--item点击事件
GameMatchHallHorizontalBigItem.onItemClick = function(self)
    self:execDelegate(GameMatchHallHorizontalBigItem.Delegate.onMatchItemClick, self.m_data);
end

GameMatchHallHorizontalBigItem._initView = function(self)
    local nameView = self:findViewById(self.s_controls.nameView);
    self.m_name = new(RichText, "", w, h, kAlignLeft, nil, 22);
    nameView:addChild(self.m_name);
    self.m_time = self:findViewById(self.s_controls.txtTime);
    self.m_count = self:findViewById(self.s_controls.txtCount);
    self.m_reward = self:findViewById(self.s_controls.txtReward);
    self.m_iconReward = self:findViewById(self.s_controls.iconReward);
    self.m_condition = self:findViewById(self.s_controls.condition);
    self.m_conditionFee = self:findViewById(self.s_controls.conditionFee);
    self.m_conditionView = self:findViewById(self.s_controls.conditionView);
    self.resurgence_icon = self:findViewById(self.s_controls.resurgence_icon);
    self.m_icon = self:findViewById(self.s_controls.icon);
    self.m_tagBg = self:findViewById(self.s_controls.tagBg);
    self.m_iconGame = self:findViewById(self.s_controls.iconGame);
    self.m_timeTextView = self:findViewById(self.s_controls.timeTextView);
    self.m_bg = self:findViewById(self.s_controls.bg)
end

GameMatchHallHorizontalBigItem._resetView = function(self)
    self.m_name:setText("");
    self.m_time:setText("");
    self.m_count:setText("");
    self.m_reward:setText("");
    self.m_condition:setVisible(false);
    self.m_conditionFee:setVisible(false);
    self.m_conditionView:setVisible(false);
    self.m_timeTextView:setVisible(false);
    self:_setImageFile(self.m_icon);
    self:_setGameImageFile();
end

--显示快速赛数据
GameMatchHallHorizontalBigItem._showDataImmediate = function(self)
    local data = self.m_data;
    self.m_time:setText(string.format("满%s人开赛", data.requestnum  or "0"));
    self.m_count:setText(string.format("%s", data.allapplynum or "0"));
end

--显示定时赛数据
GameMatchHallHorizontalBigItem._showDataTime = function(self)
    local data = self.m_data;
    self.m_count:setText(string.format("%s", data.allapplynum or "0"));

    local time = MatchHallDataInterface.getInstance():getSimpleTimeString(data);
    self.m_time:setText(time);

    --self.m_timeTextView:removeAllChildren();
    --self.m_textTime = new(RichText, "", nil, nil, kAlignRight, nil, 18);
    --self.m_textTime:setAlign(kAlignRight);
    --self.m_timeTextView:addChild(self.m_textTime);
    --self.m_timeTextView:setVisible(true);

    self:_startUpdateRemainTimeTimer();
end

--显示通用数据
GameMatchHallHorizontalBigItem._showDataCommon = function(self)
    --子游戏icon
    local data = self.m_data;
    self:_setGameImageFile(string.format("hall/matchHall/sicon_%s.png", data.gameId));

    local name = string.valueOf(self.m_data.name):remove("#");
    name = string.subUtfStrByCn(name, 1, 10, "");

    self.m_name:setText(string.format("#cA0400B%s", name));
    --self.m_reward:setText(data.rewardDescribe);

    --self.resurgence_icon:setVisible(data.isfhmatch == 1);

    if not string.isEmpty(data.advicon) then
        ImageCache.getInstance():request(data.advicon, self, self._onImageDownloadIcon);
    end

    --下载广告大图
    if data.adIcon ~= "" then
        ImageCache.getInstance():request(data.adIcon, self, self.onImageDownload)
    end
end

--比赛icon下载回调
GameMatchHallHorizontalBigItem._onImageDownloadIcon = function(self, url, file)
    self:_setImageFile(self.m_icon, file)
end

--广告大图下载回调
GameMatchHallHorizontalBigItem.onImageDownload = function(self, url, file)
    if not string.isEmpty(file) then
        self.m_bg:setFile(file)
    end
end

GameMatchHallHorizontalBigItem._setImageFile = function(self, img, file)
    if img then
        local w, _ = img:getSize();
        file = string.isEmpty(file) and match_hall_pin_map["icon_default.png"] or file;
        img:setFile(file);

        if img.m_res then
            local widthRes = img.m_res:getWidth();
            local heightRes = img.m_res:getHeight();
            local h = heightRes * w / widthRes;
            img:setSize(w, h);
        end
    end
end

GameMatchHallHorizontalBigItem._setGameImageFile = function(self, file)
    local imgFile = file or "hall/matchHall/sicon_default.png";
    self.m_iconGame:setFile(imgFile);
end

---------------------------------------------------------------
--virtual
GameMatchHallHorizontalBigItem._onTimer = function(self, diff)
    if diff <= 5 * 60 and diff > 60 then
        local min = math.floor(diff / 60);
        local str = string.format("#cEA4828%s分钟#c933E01后开赛", min);
        self:_setTextTime(str);
    elseif diff <= 60 then
        local sec = diff % 61;
        local str = string.format("#cEA4828%s秒#c933E01后开赛", sec);
        self:_setTextTime(str);
    end
end

--定时赛显示倒计时
GameMatchHallHorizontalBigItem._setTextTime = function(self, str)
    if self.m_textTime then
        self.m_textTime:setText(str);
    end
end

GameMatchHallHorizontalBigItem.s_controlConfig =
{   
    [GameMatchHallHorizontalBigItem.s_controls.btnItem] = {"itemBtn"};
    [GameMatchHallHorizontalBigItem.s_controls.bg] = {"itemBtn", "bg"};
    [GameMatchHallHorizontalBigItem.s_controls.nameView] = {"itemBtn", "nameView"};
    [GameMatchHallHorizontalBigItem.s_controls.txtTime] = {"itemBtn", "infoView", "iconTime", "time"};
    [GameMatchHallHorizontalBigItem.s_controls.txtCount] = {"itemBtn", "infoView", "iconCount", "count"};
    [GameMatchHallHorizontalBigItem.s_controls.txtReward] = {"itemBtn", "infoView", "iconReward", "reward"};
    [GameMatchHallHorizontalBigItem.s_controls.iconReward] = {"itemBtn", "infoView", "iconReward"};
    [GameMatchHallHorizontalBigItem.s_controls.tagBg] = {"itemBtn", "tagBg"};
    [GameMatchHallHorizontalBigItem.s_controls.condition] = {"itemBtn", "tagBg", "conditionView", "img"};
    [GameMatchHallHorizontalBigItem.s_controls.conditionFee] = {"itemBtn", "tagBg", "conditionViewWithFee", "img"};
    [GameMatchHallHorizontalBigItem.s_controls.conditionView] = {"itemBtn", "tagBg", "conditionViewWithFee", "view"};
    [GameMatchHallHorizontalBigItem.s_controls.resurgence_icon] = {"itemBtn", "resurgence_icon"};
    [GameMatchHallHorizontalBigItem.s_controls.icon] = {"itemBtn", "rewardView", "icon"};
    [GameMatchHallHorizontalBigItem.s_controls.iconGame] = {"itemBtn", "icon"};
    [GameMatchHallHorizontalBigItem.s_controls.timeTextView] = {"itemBtn", "infoView", "timeTextView"};
};

GameMatchHallHorizontalBigItem.s_controlFuncMap =
{
    [GameMatchHallHorizontalBigItem.s_controls.btnItem] = GameMatchHallHorizontalBigItem.onItemClick;
};

return GameMatchHallHorizontalBigItem;