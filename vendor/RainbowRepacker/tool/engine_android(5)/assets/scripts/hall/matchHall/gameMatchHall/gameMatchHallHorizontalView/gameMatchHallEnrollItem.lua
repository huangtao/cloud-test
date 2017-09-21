local match_hall_enroll_item_layout = require(ViewPath .. "/hall/matchHall/match_hall_enroll_item_layout");
local match_hall_pin_map = require("qnFiles/qnPlist/hall/match_hall_pin");
require("hall/recharge/data/rechargeDataInterface");
require("uilibs/userMoneyItem");

local ItemBase = require("hall/matchHall/gameMatchHall/gameMatchHallHorizontalView/gameMatchHallItemBase");

-- 已报名列表item
local GameMatchHallEnrollItem = class(ItemBase, false);

local h_index = 0;
local getIndex = function(self)
    h_index = h_index + 1;
    return h_index;
end

GameMatchHallEnrollItem.s_controls = 
{
    btnItem = getIndex(),
    nameView = getIndex(),
    txtTime = getIndex(),
    txtCount = getIndex(),
    txtReward = getIndex(),
    iconReward = getIndex(),
    condition = getIndex(),
    resurgence_icon = getIndex(),
    icon = getIndex(),
    iconGame = getIndex(),
    timeTextView = getIndex(),
};

GameMatchHallEnrollItem.Delegate = {
    onMatchItemClick = "onMatchItemClick"; -- 比赛点击回调
    refreshMatchList = "refreshMatchList" --刷新报名列表
};

GameMatchHallEnrollItem.ctor = function(self, data)
    super(self, match_hall_enroll_item_layout);
   
    self:setSize(self.m_root:getSize())

    self:_setData(data);
    self:_initView();
    self:_resetView();

    if self.m_data then    
        self:_showData();
    end
end

--item点击事件
GameMatchHallEnrollItem.onItemClick = function(self)
    self:execDelegate(GameMatchHallEnrollItem.Delegate.onMatchItemClick, self.m_data);
end

GameMatchHallEnrollItem._initView = function(self)
    local nameView = self:findViewById(self.s_controls.nameView);
    self.m_name = new(RichText, "", w, h, kAlignLeft, nil, 26);
    nameView:addChild(self.m_name);
    self.m_time = self:findViewById(self.s_controls.txtTime);
    self.m_count = self:findViewById(self.s_controls.txtCount);
    self.m_reward = self:findViewById(self.s_controls.txtReward);
    self.m_iconReward = self:findViewById(self.s_controls.iconReward);
    self.resurgence_icon = self:findViewById(self.s_controls.resurgence_icon);
    self.m_icon = self:findViewById(self.s_controls.icon);
    self.m_iconGame = self:findViewById(self.s_controls.iconGame);
    self.m_timeTextView = self:findViewById(self.s_controls.timeTextView);
end

GameMatchHallEnrollItem._resetView = function(self)
    self.m_name:setText("");
    self.m_time:setText("");
    self.m_count:setText("");
    self.m_reward:setText("");
    self.m_timeTextView:setVisible(false);
    self:_setImageFile(self.m_icon);
    self:_setGameImageFile();
end

--显示快速赛数据
GameMatchHallEnrollItem._showDataImmediate = function(self)
    local data = self.m_data;
    self.m_time:setText(string.format("满%s人开赛", data.requestnum  or "0"));
    self.m_count:setText(string.format("%s", data.allapplynum or "0"));
end

--显示定时赛数据
GameMatchHallEnrollItem._showDataTime = function(self)
    local data = self.m_data;
    self.m_count:setText(string.format("%s", data.allapplynum or "0"));

    local time = MatchHallDataInterface.getInstance():getSimpleTimeString(data);
    self.m_time:setText(time);

    self.m_timeTextView:removeAllChildren(true);
    self.m_textTime = new(RichText, "", nil, nil, kAlignRight, nil, 24);
    self.m_textTime:setAlign(kAlignCenter);
    self.m_timeTextView:addChild(self.m_textTime);
    self.m_timeTextView:setVisible(true);

    self:_startUpdateRemainTimeTimer();
end

--显示通用数据
GameMatchHallEnrollItem._showDataCommon = function(self)
    --子游戏icon
    local data = self.m_data;
    self:_setGameImageFile(string.format("hall/matchHall/sicon_%s.png", data.gameId));

    local name = string.valueOf(self.m_data.name):remove("#");
    name = string.subUtfStrByCn(name, 1, 14, "");

    self.m_name:setText(string.format("#cA0400B%s", name));
    self.m_reward:setText(data.rewardDescribe);

    if not string.isEmpty(data.advicon) then
        ImageCache.getInstance():request(data.advicon, self, self._onImageDownloadIcon);
    end
end

--比赛icon下载回调
GameMatchHallEnrollItem._onImageDownloadIcon = function(self, url, file)
    self:_setImageFile(self.m_icon, file)
end

GameMatchHallEnrollItem._setImageFile = function(self, img, file)
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

GameMatchHallEnrollItem._setGameImageFile = function(self, file)
    local imgFile = file or "isolater/bg_blank.png";
    self.m_iconGame:setFile(imgFile);
end

---------------------------------------------------------------
--virtual
GameMatchHallEnrollItem._onTimer = function(self, diff)
    local str = ""
    if diff <= 0 then --小等于0秒
        str = "#cffffff倒计时#l00:00"
    elseif diff < 60 * 60 then --大于0秒小于1小时
        local m = math.floor(diff / 60)
        local s = math.floor(diff % 60)
        str = string.format("#cffffff倒计时#l%.2d:%.2d", m, s)
    elseif diff < 60 * 60 * 24 then --大等于1小时并小于24小时
        local h = math.floor(diff / (60 * 60))
        local m = math.floor((diff % (60 * 60)) / 60)
        str = string.format("#cffffff还有#l%d小时%d分", h, m)
    else --大等于24小时
        local d = math.floor(diff / (60* 60 * 24))
        local m = math.floor(((diff % (60 * 60 * 24)) % (60 * 60)) / 60)
        local h = (m > 30) and math.ceil((diff % (60 * 60 * 24)) / (60*60)) or math.floor((diff % (60 * 60 * 24)) / (60*60))
        str = string.format("#cffffff还有#l%d天%s", d, ((h==0) and "" or (h .."小时")))
    end
    self:_setTextTime(str)
end

--显示开赛倒计时
GameMatchHallEnrollItem._setTextTime = function(self, str)
    if self.m_textTime then
        self.m_textTime:setText(str);
    end
end

--下一场循环赛信息获取回调
GameMatchHallEnrollItem.onGetNextLoopMatchInfo = function(self, isSuccess, data)
    ItemBase.onGetNextLoopMatchInfo(self, isSuccess, data)
    self:execDelegate(GameMatchHallEnrollItem.Delegate.refreshMatchList, MatchHallDataInterface.getInstance():getEnrollList())
end

GameMatchHallEnrollItem.s_controlConfig =
{   
    [GameMatchHallEnrollItem.s_controls.btnItem] = {"itemBtn"};
    [GameMatchHallEnrollItem.s_controls.nameView] = {"itemBtn", "nameView"};
    [GameMatchHallEnrollItem.s_controls.txtTime] = {"itemBtn", "infoView", "iconTime", "time"};
    [GameMatchHallEnrollItem.s_controls.txtCount] = {"itemBtn", "infoView", "iconCount", "count"};
    [GameMatchHallEnrollItem.s_controls.txtReward] = {"itemBtn", "infoView", "iconReward", "reward"};
    [GameMatchHallEnrollItem.s_controls.iconReward] = {"itemBtn", "infoView", "iconReward"};
    [GameMatchHallEnrollItem.s_controls.resurgence_icon] = {"itemBtn", "resurgence_icon"};
    [GameMatchHallEnrollItem.s_controls.icon] = {"itemBtn", "rewardView", "icon"};
    [GameMatchHallEnrollItem.s_controls.iconGame] = {"itemBtn", "icon"};
    [GameMatchHallEnrollItem.s_controls.timeTextView] = {"itemBtn", "infoView", "timeTextView"};
};

GameMatchHallEnrollItem.s_controlFuncMap =
{
    [GameMatchHallEnrollItem.s_controls.btnItem] = GameMatchHallEnrollItem.onItemClick;
};

return GameMatchHallEnrollItem;