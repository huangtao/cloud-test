require("common/commonGameLayer")
local match_hall_horizontal_view = require(ViewPath .. "hall/matchHall/match_hall_horizontal_view")
local HorizontalItem = require("hall/matchHall/gameMatchHall/gameMatchHallHorizontalView/gameMatchHallHorizontalItem")
local HorizontalBigItem = require("hall/matchHall/gameMatchHall/gameMatchHallHorizontalView/gameMatchHallHorizontalBigItem")

-- 比赛列表
local GameMatchHallHorizontalView = class(CommonGameLayer, false)

GameMatchHallHorizontalView.Delegate = {
    onMatchItemClick = "onMatchItemClick"
}

local h_index = 0
local getIndex = function(self)
    h_index = h_index + 1
    return h_index
end

local item_padding = 26 --比赛列表item边距
local match_list_top_padding = 5 --比赛列表顶部边距

GameMatchHallHorizontalView.s_controls = {
    contentView = getIndex(),
    bottomView = getIndex(),

    matchContentView = getIndex(),
    emptyTips = getIndex(),

    matchTypeBtn = getIndex(),
    imgSignupFlag = getIndex(),
    txtSignupNum = getIndex(),
    tagsView = getIndex(),
    tagsViewBg = getIndex(),
    bg = getIndex(),
    maskView = getIndex(),
}

GameMatchHallHorizontalView.ctor = function(self)
    super(self, match_hall_horizontal_view)
    self.m_ctrls = GameMatchHallHorizontalView.s_controls
    self:__init()
end

GameMatchHallHorizontalView.dtor = function(self)
    self.m_matchTagList = nil
    self.m_selectedIndex = nil
    self.m_tagsScrollView = nil
end

GameMatchHallHorizontalView.show = function(self, unmoving)
    MatchHallDataInterface.getInstance():setObserver(self)
    self:refreshMatchList()
end

GameMatchHallHorizontalView.hide = function(self)
    MatchHallDataInterface.getInstance():clearObserver(self);
end

--刷新比赛列表
GameMatchHallHorizontalView.refreshMatchList = function(self)
    self:refreshTagsListView()
    self:changeTabSelected()
end

--初始化
GameMatchHallHorizontalView.__init = function(self)
    self.m_contentView = self:findViewById(self.m_ctrls.contentView)
    self.m_bottomView = self:findViewById(self.m_ctrls.bottomView)
    self.m_matchContentView = self:findViewById(self.m_ctrls.matchContentView)
    self.m_emptyTips = self:findViewById(self.m_ctrls.emptyTips)
    self.m_matchTypeBtn = self:findViewById(self.m_ctrls.matchTypeBtn)
    self.m_imgSignupFlag = self:findViewById(self.m_ctrls.imgSignupFlag)
    self.m_txtSignupNum = self:findViewById(self.m_ctrls.txtSignupNum)
    self.m_tagsView = self:findViewById(self.m_ctrls.tagsView)
    self.m_tagsViewBg = self:findViewById(self.m_ctrls.tagsViewBg)

    self.m_tagsBtnList = {}
    for i = 1, 4 do
        local btn = self.m_tagsView:getChildByName(string.format("tagBtn_%s", i))
        btn:setVisible(false)
        btn:setOnClick(self, self.onTagsItemClick)
        table.insert(self.m_tagsBtnList, btn)
    end

    self.m_tagsScrollView = {}

    local alphaAreaY = require("coreex/alphaAreaY")
    local bg = self:findViewById(self.m_ctrls.bg)
    HolidaysBgDataInterface.getInstance():showImg(HolidaysBgDataInterface.ImgType.Bg, bg)
    local maskView = self:findViewById(self.m_ctrls.maskView)
    local _, y = maskView:getAbsolutePos()
    local _, h = maskView:getSize()
    local scale = System.getLayoutScale()
    y = System.getScreenHeight() - math.abs(y)*scale
    local sy = y/System.getScreenHeight()
    local ey = (y+h*scale)/System.getScreenHeight()
    alphaAreaY.applyToDrawing(bg, sy, ey)
end

--设置列表为空提示的显示状态
GameMatchHallHorizontalView.setEmptyTipsState = function(self, state)
    self.m_emptyTips:setVisible(state)
end

-- 渲染比赛列表
-- @param data 数据源
GameMatchHallHorizontalView.showMatchList = function(self, viewPage, data)
    viewPage:removeAllChildren(true)
    local leftH, rightH = match_list_top_padding, match_list_top_padding
    for i,v in ipairs(data) do
        local view = (v.adIcon == "") and new(HorizontalItem, v) or new(HorizontalBigItem, v)
        viewPage:addChild(view)
        view:setPos(nil, (i%2 == 1 and leftH or rightH))
        local _,h = view:getSize()
        leftH = leftH + (i%2 == 1 and (h + item_padding) or 0)
        rightH = rightH + (i%2 == 1 and 0 or (h + item_padding))
        view:setAlign((i%2 == 1 and kAlignTopLeft or kAlignTopRight))
        view:setDelegate(self)

        if (i == #data) and (i%2 == 1) and (leftH > (rightH + h + item_padding)) then
            view:setPos(nil, rightH)
            view:setAlign(kAlignTopRight)
            leftH = leftH - h
            rightH = rightH + h
        end
    end
    viewPage:setNodeWidthHeight(nil, (leftH > rightH and leftH or rightH))
    viewPage:update()
end

--点击比赛列表item
GameMatchHallHorizontalView.onMatchItemClick = function(self, data)
    Log.d("GameMatchHallHorizontalView.onMatchItemClick")
    self:execDelegate(GameMatchHallHorizontalView.Delegate.onMatchItemClick, data)
end

--获取比赛标签回调
GameMatchHallHorizontalView.onGetMatchTagList = function(self, info)
    self:refreshTagsListView()
    self:changeTabSelected()
end

--刷新比赛标签菜单栏
GameMatchHallHorizontalView.refreshTagsListView = function(self)
    self.m_matchTagList = MatchHallDataInterface.getInstance():getHaveDataMatchTagList()
    local w, _ = self.m_matchTypeBtn:getSize()
    local tagsViewWidth = (#self.m_matchTagList + 1) * w
    self.m_tagsView:setSize(tagsViewWidth)
    self.m_tagsViewBg:setSize(tagsViewWidth + 10)
    for k, v in ipairs(self.m_tagsBtnList) do
        v:setVisible(k<=#self.m_matchTagList)
        if self.m_matchTagList[k] then
            v:getChildByName("text"):setText(self.m_matchTagList[k].name or "");
        end
    end
end

--点击全部比赛按钮
GameMatchHallHorizontalView.onMatchTypeBtnClick = function(self)
    if self.m_selectedIndex == 0 then
        return
    end
    self.m_selectedIndex = 0
    UBReport.getInstance():report(UBConfig.kHallMatchHorizontalTagMatch)
    self:changeTabSelected()
end

--点击菜单栏按钮
GameMatchHallHorizontalView.onTagsItemClick = function(self, finger_action, x, y, drawing_id_first, drawing_id_current)
    local index = self.m_selectedIndex
    for k, v in ipairs(self.m_tagsBtnList) do
        if drawing_id_current == v:getID() then
            index = k
        end
    end
    if index == self.m_selectedIndex then
        return
    end
    self.m_selectedIndex = index
    local tagId = self:getTagIdByIndex(self.m_selectedIndex)
    UBReport.getInstance():report(UBConfig.kHallMatchHorizontalTags, string.format("id_%s", tagId or ""))
    self:changeTabSelected()
end

--改变tab栏选中状态
GameMatchHallHorizontalView.changeTabSelected = function(self)
    self.m_selectedIndex = self.m_selectedIndex or 0
    self.m_matchTagList = self.m_matchTagList or MatchHallDataInterface.getInstance():getHaveDataMatchTagList()
    self.m_matchTypeBtn:getChildByName("imgSel"):setVisible((self.m_selectedIndex == 0) or (self.m_selectedIndex > #self.m_matchTagList))
    for i, v in ipairs(self.m_tagsBtnList) do
        v:getChildByName("imgSel"):setVisible(i == self.m_selectedIndex)
    end

    local tagId = self:getTagIdByIndex(self.m_selectedIndex)
    local data = MatchHallDataInterface.getInstance():sortMatchList(MatchHallDataInterface.getInstance():getMatchListWithTagId(tagId))
    local viewPager, isCacheData = self:getScrollViewByIndexAndCheckCacheData(self.m_selectedIndex, data)

    if isCacheData then
        Log.d("GameMatchHallHorizontalView.changeTabSelected", "isCacheData", isCacheData);
        return
    end

    self:showMatchList(viewPager, data)
end

--根据tab栏索引获取标签ID
GameMatchHallHorizontalView.getTagIdByIndex = function(self, index)
    self.m_matchTagList = self.m_matchTagList or MatchHallDataInterface.getInstance():getHaveDataMatchTagList()
    return (index and self.m_matchTagList[index]) and self.m_matchTagList[index].id or 0
end

--重置ScrollView
GameMatchHallHorizontalView.resetScrollView = function(self)
    for k, v in pairs(self.m_tagsScrollView) do
        if v and v.scrollView then
            v.scrollView:setVisible(false)
        end
    end
end

--根据tab栏索引获取ScrollView
GameMatchHallHorizontalView.getScrollViewByIndexAndCheckCacheData = function(self, index, info)
    local data = Copy(info);
    self:resetScrollView();
    local currentIndex = index or 0
    local scrollViewData = self.m_tagsScrollView[currentIndex]
    local isCacheData = false;
    if not scrollViewData or not scrollViewData.scrollView or not scrollViewData.cacheData then
        scrollViewData = {scrollView = nil, cacheData = nil}
        local w,h = self.m_matchContentView:getSize()
        scrollViewData.scrollView = UIFactory.createScrollView(0,0,w,h,true)
        self.m_matchContentView:addChild(scrollViewData.scrollView) 

        scrollViewData.cacheData = data;
        self.m_tagsScrollView[currentIndex] = scrollViewData
    else
        isCacheData = table.equal(data, scrollViewData.cacheData);
        scrollViewData.cacheData = data;
    end
    scrollViewData.scrollView:gotoTop();
    scrollViewData.scrollView:setVisible(true)
    return scrollViewData.scrollView, isCacheData
end

GameMatchHallHorizontalView.s_controlConfig = {
    [GameMatchHallHorizontalView.s_controls.contentView] = {"contentView"};
    [GameMatchHallHorizontalView.s_controls.bottomView] = {"bottomView"};
    [GameMatchHallHorizontalView.s_controls.matchContentView] = {"contentView", "matchContentView"};
    [GameMatchHallHorizontalView.s_controls.emptyTips] = {"contentView", "matchContentView", "emptyTips"};
    [GameMatchHallHorizontalView.s_controls.matchTypeBtn] = {"tagsView", "matchTypeBtn"};
    [GameMatchHallHorizontalView.s_controls.imgSignupFlag] = {"tagsView", "bg", "matchTypeBtn", "text", "imgSignupNum"};
    [GameMatchHallHorizontalView.s_controls.txtSignupNum] = {"tagsView", "bg", "matchTypeBtn", "text", "imgSignupNum", "txtSignupNum"};
    [GameMatchHallHorizontalView.s_controls.tagsView] = {"tagsView"};
    [GameMatchHallHorizontalView.s_controls.tagsViewBg] = {"tagsView", "bg"};
    [GameMatchHallHorizontalView.s_controls.bg] = {"bg"};
    [GameMatchHallHorizontalView.s_controls.maskView] = {"maskView"};
}

GameMatchHallHorizontalView.s_controlFuncMap = {
    [GameMatchHallHorizontalView.s_controls.matchTypeBtn] = GameMatchHallHorizontalView.onMatchTypeBtnClick;
}

return GameMatchHallHorizontalView