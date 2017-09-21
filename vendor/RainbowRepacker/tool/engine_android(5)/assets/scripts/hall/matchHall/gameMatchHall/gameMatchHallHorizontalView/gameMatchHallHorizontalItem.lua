local match_hall_horizontal_item_layout = require(ViewPath .. "/hall/matchHall/match_hall_horizontal_item_layout");
local match_hall_pin_map = require("qnFiles/qnPlist/hall/match_hall_pin");
require("hall/recharge/data/rechargeDataInterface");
require("uilibs/userMoneyItem");

local ItemBase = require("hall/matchHall/gameMatchHall/gameMatchHallHorizontalView/gameMatchHallItemBase");

-- 比赛列表小图item
local GameMatchHallHorizontalItem = class(ItemBase, false);

local h_index = 0;
local getIndex = function(self)
    h_index = h_index + 1;
    return h_index;
end

GameMatchHallHorizontalItem.s_controls = 
{
    btnItem = getIndex(),
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

GameMatchHallHorizontalItem.Delegate = {
    onMatchItemClick = "onMatchItemClick"; -- 比赛点击回调
};

GameMatchHallHorizontalItem.s_viewHeight = 450;

GameMatchHallHorizontalItem.ctor = function(self, data)
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
GameMatchHallHorizontalItem.onItemClick = function(self)
    UBReport.getInstance():report(UBConfig.kHallMatchItemClickHorizontal, string.format("id_%s", (self.m_data and self.m_data.id or "")))
    self:execDelegate(GameMatchHallHorizontalItem.Delegate.onMatchItemClick, self.m_data);
end

GameMatchHallHorizontalItem._initView = function(self)
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
end

GameMatchHallHorizontalItem._resetView = function(self)
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

-- 快速赛
GameMatchHallHorizontalItem._showDataImmediate = function(self)
    local data = self.m_data;
    self.m_time:setText(string.format("满%s人开赛", data.requestnum  or "0"));
    --self.m_count:setText(string.format("%s/%s", data.applynum or "0", data.requestnum  or "0"));
    self.m_count:setText(string.format("%s", data.allapplynum or "0"));
end

-- 定时赛
GameMatchHallHorizontalItem._showDataTime = function(self)
    local data = self.m_data;
    self.m_count:setText(string.format("%s", data.allapplynum or "0"));

    local time = MatchHallDataInterface.getInstance():getSimpleTimeString(data);
    self.m_time:setText(time);

    self.m_timeTextView:removeAllChildren(true);
    self.m_textTime = new(RichText, "", nil, nil, kAlignRight, nil, 18);
    self.m_textTime:setAlign(kAlignRight);
    self.m_timeTextView:addChild(self.m_textTime);
    self.m_timeTextView:setVisible(true);

    self:_startUpdateRemainTimeTimer();
end

GameMatchHallHorizontalItem._showDataCommon = function(self)
    --子游戏icon
    local data = self.m_data;
    self:_setGameImageFile(string.format("hall/matchHall/sicon_%s.png", data.gameId));

    local name = string.valueOf(self.m_data.name):remove("#");
    name = string.subUtfStrByCn(name, 1, 10, "");

    self.m_name:setText(string.format("#cA0400B%s", name));
    self.m_reward:setText(data.rewardDescribe);
    --self.m_iconReward:setVisible(not string.isEmpty(data.rewardDescribe));

    --self.resurgence_icon:setVisible(data.isfhmatch == 1);

    if not string.isEmpty(data.advicon) then
        ImageCache.getInstance():request(data.advicon, self, self._onImageDownloadIcon);
    end

    local isSignup = self.m_data.status == GameConstant.HAVE_SIGN_UP or 
        self.m_data.status == GameConstant.SIGN_UP_AND_ALLOW_JOIN_IN or 
        self.m_data.status == GameConstant.SIGN_UP_BUT_HAVE_START;
    self:showEnrollContent(isSignup)
end

--比赛icon下载回调
GameMatchHallHorizontalItem._onImageDownloadIcon = function(self, url, file)
    self:_setImageFile(self.m_icon, file)
end

--设置报名条件图标显示状态
GameMatchHallHorizontalItem.setConditionState = function(self, state)
    self.m_condition:setVisible(state)
    self.m_conditionFee:setVisible(not state)
    self.m_conditionView:setVisible(not state)
end

--显示报名内容
GameMatchHallHorizontalItem.showEnrollContent = function(self, isSignup)
    if not self.m_data then
        return
    end
    if isSignup then --已报名
        self.m_condition:setFile(match_hall_pin_map["signed.png"])
        self:setConditionState(true)
    else
        if not string.isEmpty(self.m_data.matchentrycode) then --需要邀请码
            self.m_condition:setFile(match_hall_pin_map["inviteCode.png"])
            self:setConditionState(true)
        else
            if not self.m_data.fee or #self.m_data.fee == 0 then --免费报名
                self.m_condition:setFile(match_hall_pin_map["free_enroll.png"])
                self:setConditionState(true)
            else --需要报名费
                self:_showFeeInfo(self.m_data)
                self:setConditionState(false)
            end
        end
    end
end

-- 显示报名费
GameMatchHallHorizontalItem._showFeeInfo = function (self, item)
    self.m_conditionView:removeAllChildren(true);
    local canSignup = MatchHallDataInterface.getInstance():checkCanSignup(item);
    MatchHallDataInterface.getInstance():sortFee(item.fee)
    local node = self:_createFeeItem(item.fee[1]);
    self.m_conditionView:addChild(node);
end

-- 生成报名方式节点
GameMatchHallHorizontalItem._createFeeItem = function(self, data)
    local node = new(Node);
    node:setAlign(kAlignCenter);
    local nodeWidth = 0;
    local nodeHeight = 0;
    for _ , v in ipairs(data or {}) do
        local item = self:_createFeeIconAndText(v);
        item:setPos(nodeWidth, 0);
        local itemWidth, itemHeight = item:getSize();
        nodeWidth = nodeWidth + itemWidth;
        nodeHeight = itemHeight;
        node:addChild(item)
    end
    node:setSize(nodeWidth, nodeHeight);
    return node;
end

-- 生成节点：icon+text
GameMatchHallHorizontalItem._createFeeIconAndText = function(self, data)
    local itemType = number.valueOf(data.type);

    local iconFile, downImg = self:_getIconFileByType(itemType);
    
    local iconImg = new(Image, iconFile);
    iconImg:setAlign(kAlignLeft);
    iconImg:setPos(0, 0);
    self:_setImageFile(iconImg, iconFile);
    local widthImg, heightImg = iconImg:getSize();

    UserMoneyItem.setFilePath(UserMoneyItem.s_matchListNumFilePath);
    local text = new(UserMoneyItem);
    text:setAlign(kAlignLeft);
    local str = number.valueOf(data.num) > 9999 and string.concat(((number.valueOf(data.num))/10000),"W") or tostring(data.num or 0 )
    text:setNormalMoneyNum(string.format("%s", str));
    UserMoneyItem.setFilePath();
    local widthText = text:getSize();

    local nodeText = new(Node);
    nodeText:setAlign(kAlignLeft);
    nodeText:addChild(text);
    nodeText:setSize(widthText,heightImg)
    nodeText:setPos(widthImg, 0);

    local node = new(Node);
    node:setAlign(kAlignLeft);
    node:setSize(widthImg + widthText, heightImg);
    node:addChild(iconImg);
    node:addChild(nodeText);

    if downImg then
        local propInfo = table.verify(RechargeDataInterface.getInstance():getGoodInfoByTypeIdWithMap(itemType));
        ImageCache.getInstance():request(propInfo.item_icon, self, self._onImageDownloadFee, iconImg);
    end

    return node;
end

--报名费道具下载回调
GameMatchHallHorizontalItem._onImageDownloadFee = function(self, url, file, iconImg)
    self:_setImageFile(iconImg, file);
end

GameMatchHallHorizontalItem._setImageFile = function(self, img, file)
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

GameMatchHallHorizontalItem._setGameImageFile = function(self, file)
    local imgFile = file or "hall/matchHall/sicon_default.png";
    self.m_iconGame:setFile(imgFile);
end

---------------------------------------------------------------
--virtual
GameMatchHallHorizontalItem._onTimer = function(self, diff)
    if diff <= 0 then
        self:_setTextTime("");
        self:showEnrollContent(false)
    elseif diff > 0 and diff <= 60 then
        local sec = diff % 61;
        local str = string.format("#cEA4828%s秒#c933E01后开赛", sec);
        self:_setTextTime(str);
    elseif diff <= 5 * 60 and diff > 60 then
        local min = math.floor(diff / 60);
        local str = string.format("#cEA4828%s分钟#c933E01后开赛", min);
        self:_setTextTime(str);
    end
end

GameMatchHallHorizontalItem._setTextTime = function(self, str)
    if self.m_textTime then
        self.m_textTime:setText(str)
        if self.m_iconReward:getVisible() then
            self.m_iconReward:setVisible(false)
        end
    end
end

GameMatchHallHorizontalItem.s_controlConfig =
{   
    [GameMatchHallHorizontalItem.s_controls.btnItem] = {"itemBtn"};
    [GameMatchHallHorizontalItem.s_controls.nameView] = {"itemBtn", "nameView"};
    [GameMatchHallHorizontalItem.s_controls.txtTime] = {"itemBtn", "infoView", "iconTime", "time"};
    [GameMatchHallHorizontalItem.s_controls.txtCount] = {"itemBtn", "infoView", "iconCount", "count"};
    [GameMatchHallHorizontalItem.s_controls.txtReward] = {"itemBtn", "infoView", "iconReward", "reward"};
    [GameMatchHallHorizontalItem.s_controls.iconReward] = {"itemBtn", "infoView", "iconReward"};
    [GameMatchHallHorizontalItem.s_controls.tagBg] = {"itemBtn", "tagBg"};
    [GameMatchHallHorizontalItem.s_controls.condition] = {"itemBtn", "tagBg", "conditionView", "img"};
    [GameMatchHallHorizontalItem.s_controls.conditionFee] = {"itemBtn", "tagBg", "conditionViewWithFee", "img"};
    [GameMatchHallHorizontalItem.s_controls.conditionView] = {"itemBtn", "tagBg", "conditionViewWithFee", "view"};
    [GameMatchHallHorizontalItem.s_controls.resurgence_icon] = {"itemBtn", "resurgence_icon"};
    [GameMatchHallHorizontalItem.s_controls.icon] = {"itemBtn", "rewardView", "icon"};
    [GameMatchHallHorizontalItem.s_controls.iconGame] = {"itemBtn", "icon"};
    [GameMatchHallHorizontalItem.s_controls.timeTextView] = {"itemBtn", "infoView", "timeTextView"};
};

GameMatchHallHorizontalItem.s_controlFuncMap =
{
    [GameMatchHallHorizontalItem.s_controls.btnItem] = GameMatchHallHorizontalItem.onItemClick;
};

return GameMatchHallHorizontalItem;