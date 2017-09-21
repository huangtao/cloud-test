local match_hall_record_view_rank_layout = require(ViewPath .. "hall/matchHall/widget/match_hall_record_view_rank_layout");
require("gameData/weixinShareUtil");

local RecordRankItem = require("hall/matchHall/gameMatchHall/gameMatchHallRecord/rank/gameMatchHallRecordRankItem");
local NVerticalListView = require("ui2/NVerticalListView");

-- 好友排行
local GameMatchHallRecordRankLayer = class(CommonGameLayer, false);

local h_index = 0;
local getIndex = function(self)
    h_index = h_index + 1;
    return h_index;
end

-- loading 状态
GameMatchHallRecordRankLayer.eLoadingStatus = {
    CAN_LOAD = 1,       -- 可加载
    LOADING = 2,        -- 加载中
    CAN_NOT_LOAD = 3,   -- 不可加载（加载完成）
}

GameMatchHallRecordRankLayer.s_controls = 
{
    -- 好友排行
    contentView = getIndex(),
    emptyView = getIndex(),
    loadingView = getIndex(),
};

GameMatchHallRecordRankLayer.s_cmds = 
{
};

GameMatchHallRecordRankLayer.ctor = function(self)
    super(self, match_hall_record_view_rank_layout);
    self:setSize(self.m_root:getSize());
    self:setAlign(kAlignCenter);

    self:_initView();

    MatchRecordDataInterface.getInstance():setObserver(self);
end

GameMatchHallRecordRankLayer.dtor = function(self)
    MatchRecordDataInterface.getInstance():clearObserver(self);

    self:_deleteInfoView();
end

GameMatchHallRecordRankLayer.show = function(self)
	CommonGameLayer.show(self);
    self:_resetView();

    -- 请求大师分排行
    MatchRecordDataInterface.getInstance():getMatchRecordRankList();
end

GameMatchHallRecordRankLayer.hasOpenLayer = function(self)
    local hasOpenLayer = false;

    if (self.m_rankInfo and self.m_rankInfo:isShowing()) and 
        (self.m_inviteLayer and self.m_inviteLayer:hasOpenLayer()) then
        hasOpenLayer = true;
    end

    return hasOpenLayer;
end

---------------------------------------------------------------------
-- interface callback
GameMatchHallRecordRankLayer.onGetMatchRecordRankList = function(self, data, isUpdate)
    if isUpdate then
        self:_updataListView(data);
    else
        self:_resetView();
        if table.isEmpty(data) then
            self:showEmptyView();
        else
            self:_createListView(data);
            self.m_contentView:setVisible(true);
        end
    end
end

-- item view callback
GameMatchHallRecordRankLayer.onItemClick = function(self, data, view)
    self:_createInfoView(data, view);
end

GameMatchHallRecordRankLayer.showEmptyView = function(self)
    if not self.m_inviteLayer then
        local gameMatchHallRecordRankInviteLayer = require("hall/matchHall/gameMatchHall/gameMatchHallRecord/rank/gameMatchHallRecordRankInviteLayer");
        self.m_inviteLayer = new(gameMatchHallRecordRankInviteLayer);
        self.m_emptyView:addChild(self.m_inviteLayer);
    end

    self.m_inviteLayer:show();

    self.m_emptyView:setVisible(true);
end 

---------------------------------------------------------------------------------------
GameMatchHallRecordRankLayer._initView = function(self)
    self.m_emptyView = self:findViewById(self.s_controls.emptyView);
    self.m_contentView = self:findViewById(self.s_controls.contentView);
    self.m_loadingView = self:findViewById(self.s_controls.loadingView);
end

GameMatchHallRecordRankLayer._resetView = function(self)
    self.m_emptyView:setVisible(false);
    self.m_contentView:setVisible(false);
end

GameMatchHallRecordRankLayer._createInfoView = function(self, data, view)
    local x, y = view:getAbsolutePos();
    local w, h = view:getSize();

    if not self.m_rankInfo then
        local gameMatchHallRecordRankInfo = require("hall/matchHall/gameMatchHall/gameMatchHallRecord/rank/gameMatchHallRecordRankInfo");
        self.m_rankInfo = new(gameMatchHallRecordRankInfo);
    end

    self.m_rankInfo:setContentPos(x + w / 2, y + h / 2, h / 2);
    self.m_rankInfo:show(data);
end



GameMatchHallRecordRankLayer._deleteInfoView = function(self)
    if self.m_rankInfo then
        delete(self.m_rankInfo);
        self.m_rankInfo = nil;
    end
end

-----------------------------------------列表逻辑-------------------------------------
GameMatchHallRecordRankLayer._createListView = function(self, data)
    self.m_listData = data;

    if not self.m_listView then
        local w,h = self.m_contentView:getParent():getSize();
        RecordRankItem.setDefaultSize(w, h / MatchRecordDataInterface.getInstance():getRankViewNumberPerPage());
        RecordRankItem.setOnItemClick(self, self.onItemClick);
        self.m_listView = NVerticalListView.create();
        self.m_contentView:addChild(self.m_listView);   
        self.m_listView:setAlign(kAlignCenter);
        self.m_listView:setSize(w,h);
        self.m_listView:setScrollBarWidth(0);

        self.m_listView:setOnScroll(self.onListViewScroll, self);
        self.m_loadingView:addChild(self:_createLoadingNode());
        self.m_listView:setOnStop(function ()
            if self.m_needGetNextPage then
                MatchRecordDataInterface.getInstance():getMatchRecordRankListNext();
                self.m_needGetNextPage = false;
            end
        end)
        self.m_needCreateItem = true;
        self:_needCreateItem();
        self:_checkLoadingStatus();
    else
        self.m_listView:addInvokeOnStop(function ()
            self.m_listView:moveTo(0);
            self:_updateItem();
            self:_checkLoadingStatus();
        end)
    end

    if #self.m_listData == 0 then
        self.m_listView:setFingerActionEnabled(false);
    else
        self.m_listView:setFingerActionEnabled(true);
    end
end

GameMatchHallRecordRankLayer._updataListView = function(self, data)
    self.m_listData = data;
    self.m_needCreateItem = true;
    self:_needCreateItem();
    self:_checkLoadingStatus();
end

GameMatchHallRecordRankLayer._createLoadingNode = function (self)
    local node  = new(Node);
    self.m_loadingText = new(Text, "", nil, nil, kAlignCenter, nil, 24, 143, 92, 31)
    self.m_loadingText:setAlign(kAlignCenter) 
    node:addChild(self.m_loadingText);
    self.m_loadingImage  = new(Image,"hall/common/loading.png");
    self.m_loadingImage:setPos(-100);
    self.m_loadingImage:addPropRotate(0,kAnimRepeat,1440,0,0,360,kCenterDrawing);
    node:addChild(self.m_loadingImage)
    self.m_loadingImage:setAlign(kAlignCenter);
    node:setAlign(kAlignCenter);
    local width = self.m_contentView:getParent():getSize();
    node:setSize(width, 40);
    return node;
end

GameMatchHallRecordRankLayer._setLoadingNodeStatus = function(self, state)
    if state == GameMatchHallRecordRankLayer.eLoadingStatus.CAN_LOAD then
        self.m_loadingText:setText("滑动查看全部");
        self.m_loadingImage:setVisible(false);
    elseif state == GameMatchHallRecordRankLayer.eLoadingStatus.LOADING then
        self.m_loadingText:setText("正在加载...");
        self.m_loadingImage:setVisible(true);
    elseif state == GameMatchHallRecordRankLayer.eLoadingStatus.CAN_NOT_LOAD then
        self.m_loadingText:setText("没有更多好友了");
        self.m_loadingImage:setVisible(false);
    end
end

GameMatchHallRecordRankLayer._checkLoadingStatus = function(self)
    local itemCount = self.m_listView:getItemCount();
    local data = self.m_listData;
    local len = #data;

    if itemCount >= len and not MatchRecordDataInterface.getInstance():hasMatchRecordRankNext() then
        self:_setLoadingNodeStatus(GameMatchHallRecordRankLayer.eLoadingStatus.CAN_NOT_LOAD);
    else
        self:_setLoadingNodeStatus(GameMatchHallRecordRankLayer.eLoadingStatus.CAN_LOAD);
    end
end

GameMatchHallRecordRankLayer._needCreateItem = function(self)
    if not self.m_needCreateItem or not self.m_listView then
        return;
    end
    
    local maxItem = MatchRecordDataInterface.getInstance():getRankDataNumberPerPage();
    local itemCount = self.m_listView:getItemCount();
    local data = self.m_listData;
    local len = #data;
    local diff = len-itemCount;
    if len == 0 then --暂无创建数据
        self.m_needCreateItem = false;
        return;
    end
    local index  = 0;
    if diff > 0 then --创建
        if diff  >= maxItem then
            index = maxItem;
        else
            index = diff;
        end 
    end

    local maxIndex = index+itemCount;
    for k = itemCount+1,maxIndex do
        self.m_listView:addInvokeOnStop(function ()
            local itemData = data[k];
            if itemData then
                self:_createListItem(itemData);
            end
            if k == maxIndex then
                self.m_needCreateItem = false;
            end
        end)
    end
end

GameMatchHallRecordRankLayer._updateItem = function (self)
    local data = self.m_listData;
    local len = #data;
    if table.isEmpty(data) then
        return;
    end
    --刷新item属性
    local itemCount = self.m_listView:getItemCount();
    local minCount = math.min(itemCount, len);
    for index = 1,minCount do
        self.m_listView:addInvokeOnStop(function ()
            local itemData = data[index];
            local item = self.m_listView:getItem(index);
            if itemData then
                item:updateListItem(itemData);
            end
        end)
    end

    if len - itemCount > 0 then --添加
       self.m_needCreateItem = true;
       self:_needCreateItem(); 
    elseif len - itemCount < 0 then --删除   
        for index = itemCount, len+1, -1 do
            local item = self.m_listView:getItem(index);
            item:removeData();

            self.m_listView:addInvokeOnStop(function ()
                self.m_listView:removeItem(index, true);
            end);    
        end
    end
end

--创建一个item
GameMatchHallRecordRankLayer._createListItem = function (self,v)
    local item = new(RecordRankItem, v);
    self.m_listView:addItem(item);
end

GameMatchHallRecordRankLayer._updateBottomBanner = function (self)
    if self.m_listView:isBouncingToBottom() then
        self:_setLoadingNodeStatus(GameMatchHallRecordRankLayer.eLoadingStatus.LOADING);
        self.m_needGetNextPage = true;
    end
end

GameMatchHallRecordRankLayer.onListViewScroll = function (self,offset)
   self:_updateBottomBanner();
end


---------------------------------------------------------------------------------------
GameMatchHallRecordRankLayer.s_controlConfig = 
{
    [GameMatchHallRecordRankLayer.s_controls.contentView] = {"contentView"};
    [GameMatchHallRecordRankLayer.s_controls.emptyView] = {"emptyView"};
    [GameMatchHallRecordRankLayer.s_controls.loadingView] = {"contentView", "loadingView"};
};

GameMatchHallRecordRankLayer.s_controlFuncMap = 
{

};

GameMatchHallRecordRankLayer.s_cmdConfig = 
{
};

return GameMatchHallRecordRankLayer;