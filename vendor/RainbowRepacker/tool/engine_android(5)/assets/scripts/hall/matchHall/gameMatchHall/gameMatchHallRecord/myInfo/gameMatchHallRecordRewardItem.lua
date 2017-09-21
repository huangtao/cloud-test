require("ui/node");
local match_hall_record_reward_item_layout = require(ViewPath .. "hall/matchHall/widget/match_hall_record_reward_item_layout");
local dailyReward_map = require("qnFiles/qnPlist/hall/dailyReward");

-- 奖励
local GameMatchHallRecordRewardPage = class(Node);

GameMatchHallRecordRewardPage.s_defaultWidth = 300;
GameMatchHallRecordRewardPage.s_defaultHeight = 300;

GameMatchHallRecordRewardPage.setDefaultSize = function(width, height)
    GameMatchHallRecordRewardPage.s_defaultWidth = width or 300;
    GameMatchHallRecordRewardPage.s_defaultHeight = height or 300;
end

GameMatchHallRecordRewardPage.setOnClick = function(obj, func)
    GameMatchHallRecordRewardItem.setOnClick(obj, func);
end

GameMatchHallRecordRewardPage.ctor = function(self, data)
    self:setSize(GameMatchHallRecordRewardPage.s_defaultWidth, GameMatchHallRecordRewardPage.s_defaultHeight);
    self:initData(data);
    self:initView();
end

GameMatchHallRecordRewardPage.dtor = function(self)
    self.m_data = nil;
end

-----------------------------------------------------------------------------
GameMatchHallRecordRewardPage.initData = function(self, data)
    self.m_data = data;
end

GameMatchHallRecordRewardPage.initView = function(self)
    local data = self.m_data;
    local width, height = self:getSize();
    local numPerPage = 4;
    local itemWidth = width / numPerPage;

    for k, v in ipairs(data) do
        local item = new(GameMatchHallRecordRewardItem, v);
        item:setSize(itemWidth, height);
        item:setAlign(kAlignLeft);
        item:setPos((k - 1)*itemWidth, 0);
        self:addChild(item);

        if k == numPerPage then
            item:hideLine();
        end
    end
end

---------------------------------------------------------------------
-- 奖励
GameMatchHallRecordRewardItem = class(Node);

-- 银币钻石使用每日任务资源，其他从后台拉取
GameMatchHallRecordRewardItem.s_fileMap = {
    [0] = dailyReward_map["sign_gold.png"],
    [2] = dailyReward_map["sign_diamond.png"],
}

GameMatchHallRecordRewardItem.setOnClick = function(obj, func)
    GameMatchHallRecordRewardItem.s_callbackObj = obj;
    GameMatchHallRecordRewardItem.s_callbackFunc = func;
end

GameMatchHallRecordRewardItem.ctor = function(self, data)
    local view = SceneLoader.load(match_hall_record_reward_item_layout);
    local w, h = view:getSize();
    self:addChild(view);
    self:setSize(w, h);
    view:setAlign(kAlignCenter);
    self.m_view = view;
    self.m_data = data;

    self:initView();
    self:resetView();
    self:showData();
end

GameMatchHallRecordRewardItem.dtor = function(self)
    self.m_view = nil;
    self.m_data = nil;
end

GameMatchHallRecordRewardItem.hideLine = function(self)
    local line = self.m_view:getChildByName("line");
    line:setVisible(false);
end

---------------------------------------------------------------------------------------
GameMatchHallRecordRewardItem.initView = function(self)
    self.m_btn = self.m_view:getChildByName("btn");
    self.m_icon = self.m_view:getChildByName("icon");
    local infoView = self.m_btn:getChildByName("infoView");
    self.m_text = infoView:getChildByName("text");
    self.m_img = infoView:getChildByName("img");
    self.m_imgText = self.m_img:getChildByName("text");
end

GameMatchHallRecordRewardItem.resetView = function(self)
    self.m_btn:setPickable(false)
    self.m_text:setVisible(false);
    self.m_img:setVisible(false);
end

GameMatchHallRecordRewardItem.showData = function(self)
    local data = self.m_data;

    if data.rewardType == GameMatchHallConstants.eRewardType.TAGS then
        self:showDataTag();
    elseif data.rewardType == GameMatchHallConstants.eRewardType.REWARD then 
        self:showDataReward();
    end
end

-- 比赛标签
GameMatchHallRecordRewardItem.showDataTag = function(self)
    local data = self.m_data;
    self.m_imgText:setText(data.name);    
    self.m_img:setVisible(true);
    self.m_icon:setGray(true);
    self.m_btn:setOnClick(self, self._onBtnClick);
    self.m_btn:setPickable(true);
    self:_setImageFile(self.m_icon, dailyReward_map["sign_gold.png"]);
    ImageCache.getInstance():request(data.image, self, self._onImageDownload);
end

-- 比赛奖励
GameMatchHallRecordRewardItem.showDataReward = function(self)
    local data = self.m_data;
    local propInfo = RechargeDataInterface.getInstance():getGoodInfoByTypeIdWithMap(data.type);
    if not table.isEmpty(propInfo) then
        -- 银币 钻石
        if propInfo.item_type == 0 or propInfo.item_type == 2 then
            local str = string.format("%s%s", data.num, propInfo.item_name);
            local subStr = string.subUtfStrByCn(str, 1, 6, "");
            if string.len(subStr) < string.len(str) then
                subStr = string.subUtfStrByCn(str, 1, 5, "...");
            end
            self.m_text:setText(subStr);
            self:_setImageFile(self.m_icon, GameMatchHallRecordRewardItem.s_fileMap[propInfo.item_type] or "");
        else
            local str = string.format("%sx%s", propInfo.item_name, data.num);
            local subStr = string.subUtfStrByCn(str, 1, 6, "");
            if string.len(subStr) < string.len(str) then
                subStr = string.subUtfStrByCn(str, 1, 5, "...");
            end
            self.m_text:setText(subStr);
            self:_setImageFile(self.m_icon, GameMatchHallRecordRewardItem.s_fileMap[0]);
            ImageCache.getInstance():request(propInfo.item_icon, self, self._onImageDownload);
        end

        self.m_text:setVisible(true);
    end
end

GameMatchHallRecordRewardItem._onBtnClick = function(self)
    if GameMatchHallRecordRewardItem.s_callbackObj and GameMatchHallRecordRewardItem.s_callbackFunc then
        GameMatchHallRecordRewardItem.s_callbackFunc(GameMatchHallRecordRewardItem.s_callbackObj, self.m_data, self);
    end
end

GameMatchHallRecordRewardItem._onImageDownload = function(self, url, file)
    self:_setImageFile(self.m_icon, file);
end

GameMatchHallRecordRewardItem._setImageFile = function(self, img, file)
    if img and file then
        local _, h = img:getSize();

        img:setFile(file);

        if img.m_res then
            local widthRes = img.m_res:getWidth();
            local heightRes = img.m_res:getHeight();
            local w = widthRes * h / heightRes;
            img:setSize(w, h);
        end
    end
end

return GameMatchHallRecordRewardPage;