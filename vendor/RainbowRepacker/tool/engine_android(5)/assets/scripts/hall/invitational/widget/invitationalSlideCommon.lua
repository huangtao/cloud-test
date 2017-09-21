require("common/commonGameLayer")
local invitational_create_slide_common = require(ViewPath .. "hall/invitational/invitational_create_slide_common")
local InvitationalSlideAwardItem = require("hall/invitational/widget/invitationalSlideAwardItem")
local InvitationalSlideAwardRankingItem = require("hall/invitational/widget/invitationalSlideAwardRankingItem")
local InvitationalSlideFeeItem = require("hall/invitational/widget/invitationalSlideFeeItem")
local InvitationalSlideGameItem = require("hall/invitational/widget/invitationalSlideGameItem")
local InvitationalSlideMinPlayersItem = require("hall/invitational/widget/invitationalSlideMinPlayersItem")
local hallLayerBaseWithName = require("hall/widget/hallLayerBaseWithName");

--创建邀请赛选择通用框
local InvitationalSlideCommon = class(hallLayerBaseWithName, false)

local h_index = 0
local getIndex = function(self)
    h_index = h_index + 1
    return h_index
end

InvitationalSlideCommon.s_controls = {
    centerView = getIndex(),
    radioButtonGroup = getIndex(),
    radio1 = getIndex(),
    radio2 = getIndex(),
    contentView = getIndex(),
    content = getIndex(),
    title = getIndex(),
    btn = getIndex(),
}

InvitationalSlideCommon.s_slideShowType = {
    award = "award",
    awardRanking = "awardRanking",
    fee = "fee",
    games = "games",
    minPlayers = "minPlayers",
}

InvitationalSlideCommon.s_itemClass = {
    [InvitationalSlideCommon.s_slideShowType.award] = InvitationalSlideAwardItem,
    [InvitationalSlideCommon.s_slideShowType.awardRanking] = InvitationalSlideAwardRankingItem,
    [InvitationalSlideCommon.s_slideShowType.fee] = InvitationalSlideFeeItem,
    [InvitationalSlideCommon.s_slideShowType.games] = InvitationalSlideGameItem,
    [InvitationalSlideCommon.s_slideShowType.minPlayers] = InvitationalSlideMinPlayersItem,
}

InvitationalSlideCommon.ctor = function(self, showType, data, obj, callback)
    super(self, invitational_create_slide_common, nil, "InvitationalSlideCommon")
    self.m_radio_index = 1
    self.m_operating_data = {}
    self.m_showType = showType
    self.m_raw_data = data
    self:setSize(self.m_root:getSize())
    self:setFillParent(true, true)
    self.m_ctrls = InvitationalSlideCommon.s_controls
    self:initData()
    self:initView()
    self.m_radioButtonGroup:setSelected(self.m_radio_index)
    self:setListenBackEvent(true);
    
    self.m_obj = obj;
    self.m_callback = callback;

    self:runUiAction(UiAnimConfig.ACTION.BEGIN, self:findViewById(self.s_controls.centerView));
end

InvitationalSlideCommon.dtor = function(self)
    
    if self.m_pickerView then
        self.m_pickerView:remove_from_parent()
        self.m_pickerView:cleanup()
        self.m_pickerView = nil
    end
end

InvitationalSlideCommon.initView = function(self)
    self.m_radioButtonGroup = self:findViewById(self.m_ctrls.radioButtonGroup)
    self.m_radio1 = self:findViewById(self.m_ctrls.radio1)
    self.m_radio2 = self:findViewById(self.m_ctrls.radio2)
    self.m_contentView = self:findViewById(self.m_ctrls.contentView)
    self.m_content = self:findViewById(self.m_ctrls.content)
    self.m_title = self:findViewById(self.m_ctrls.title)
    self:setRadioButtonGroupState(self.m_showType == self.s_slideShowType.award or self.m_showType == self.s_slideShowType.fee)
    --self.m_adapter, self.m_listView = self:createListView(self.m_content, self.onScrollCallbackListView, self.onClickCallbackListView)
    local data = self:getPickerViewData()
    if not table.isEmpty(data) then
        self.m_pickerView = self:createPickerView(self.m_content, data)
    end
end

InvitationalSlideCommon.setTitle = function(self, title)
    if self.m_title and title then
        self.m_title:setText(title)
    end
end

InvitationalSlideCommon.initData = function(self)
    self.m_data = self:spliceData(self:getRawData())
end

InvitationalSlideCommon.getRawData = function(self)
    if (self.m_showType == self.s_slideShowType.award or self.m_showType == self.s_slideShowType.fee) then
        local typ = "type" .. (self.m_radio_index - 1)
        return self.m_raw_data[typ]
    else
        return self.m_raw_data
    end
end

InvitationalSlideCommon.getPickerViewData = function(self)
    local data = self:getRawData()
    if self.m_showType == self.s_slideShowType.awardRanking then
        local t = {}
        local min_players = InvitationalDataInterface.getInstance():getInvitationalCreateData():getMinPlayers()
        for k,v in ipairs(data) do
            if v.type and v.value and min_players and v.name then
                if v.type == "num" then
                    table.insert(t, v.name)
                elseif v.type == "percent" then
                    local count = InvitationalDataInterface.getInstance():getAwardCount(v.type, v.value, min_players)
                    table.insert(t, string.format("%s(前%s名)", v.name, count))
                end
            end
        end
        return t
    end 
    return data
end

--创建ListView
InvitationalSlideCommon.createListView = function(self, parent, scrollCallback, clickCallback)
    local width, height = parent:getSize()
    local listView = new(ListView, 0, 0, width, height, true)
    listView:setScrollBarWidth(0)
    local adapter = new(CacheAdapter, InvitationalSlideCommon.s_itemClass[self.m_showType], self.m_data)
    listView:setAdapter(adapter)
    listView:setOnScroll(self, scrollCallback)
    listView:setOnItemClick(self, clickCallback)
    parent:addChild(listView)
    return adapter, listView
end

InvitationalSlideCommon.removeListView = function(self)
    if self.m_listView then
        self.m_listView:removeAllChildren(true)
        self.m_listView = nil
        self.m_adapter = nil
    end
end

InvitationalSlideCommon.createPickerView = function(self, parent, data)
    local PickerView = require("ui2.PickerView")
    local widget, height = parent:getSize()
    local pickerView = PickerView({size = Point(widget, height), row_height = height / 5})
    pickerView.data = data
    pickerView.on_change_select = function(index)
        self:onChangeSelect(index)
    end
    parent:getWidget():add(pickerView)
    return pickerView
end

InvitationalSlideCommon.onChangeSelect = function(self, index)
    self.m_operating_data.data = self:getRawData()[index]
    self.m_operating_data.radio_index = self.m_radio_index
    Log.v("onChangeSelect============",index, self.m_operating_data.data)
end

InvitationalSlideCommon.onUiEndActionBefore = function(self)
    if self.m_pickerView then
        self.m_pickerView:stop_kinetic()
    end
end

--设置按钮组的显示状态
InvitationalSlideCommon.setRadioButtonGroupState = function(self, state)
    self.m_radioButtonGroup:setVisible(state)
end

InvitationalSlideCommon.setRadioButtonGroupSelected = function(self, index)
    self.m_radioButtonGroup:setSelected(index)
end

InvitationalSlideCommon.setListViewShowingIndex = function(self, index)
    if not table.isEmpty(self:getRawData()) and index and self.m_listView then
        self.m_listView:setShowingIndex(index)
    end
    if self.m_pickerView and index then
        if self.m_pickerView.init_finish then
            self.m_pickerView:select_item(index, 0)
        else
            self.m_pickerView.showing_index = index
        end
    end
end

InvitationalSlideCommon.onScrollCallbackListView = function(self, scroll_status, itemIndex, nViews, diff, totalOffset)
    self:scrollerStatusChange(scroll_status, itemIndex, nViews, diff, totalOffset)
end

InvitationalSlideCommon.onClickCallbackListView = function(self, adapter, item, index, x, y)
    if not table.isEmpty(self:getRawData()) and index then
        self.m_listView:setShowingIndex(index - 2)
    end
end

InvitationalSlideCommon.scrollerStatusChange = function(self, scroll_status, itemIndex, nViews, diff, totalOffset)
    if scroll_status == kScrollerStatusMoving then
        local index = math.abs(totalOffset / 90) + 1
        index = math.floor(index + 0.5)
        if itemIndex == 1 then
            if itemIndex == index then
                self:updateSelect(index)
            end
        else
            self:updateSelect(index)
        end
    elseif scroll_status == kScrollerStatusStop then
        self:updateSelect(itemIndex)
    end
end

--更新选中项
InvitationalSlideCommon.updateSelect = function(self, itemIndex)
    itemIndex = itemIndex or 1
    local index = itemIndex + 2
    if self.m_select_index == index then
        return
    end
    local old_item = self.m_select_item
    local new_item = self.m_adapter:getView(index)
    self:setSelectFlag(index, new_item)
    self:setSelectText(old_item, new_item)
    self.m_operating_data.data = self.m_data[index]
    self.m_operating_data.radio_index = self.m_radio_index
end

--设置当前选中index及item
InvitationalSlideCommon.setSelectFlag = function(self, index, item)
    self.m_select_index = index
    self.m_select_item = item
end

--设置选中文本
InvitationalSlideCommon.setSelectText = function(self, old_item, new_item)
    if old_item then
        old_item:createText(nil, false)
    end
    if new_item then
        new_item:createText(nil, true)
    end
end

--并接数据
InvitationalSlideCommon.spliceData = function(self, data)
    local tempData = Copy(data)
    table.insert(tempData, 1, "")
    table.insert(tempData, 1, "")
    table.insert(tempData, "")
    table.insert(tempData, "")
    return tempData
end

InvitationalSlideCommon.onRadioButtonGroupClick = function(self, curIndex, lastIndex, offSound)
    if not offSound then
        kEffectPlayer:play(Effects.AudioButtonClick)
    end
    self.m_radio_index = curIndex
    self.m_select_index = nil
    self:initData()
    --self.m_adapter:changeData(self.m_data)
    --self:removeListView()
    --self.m_adapter, self.m_listView = self:createListView(self.m_content, self.onScrollCallbackListView, self.onClickCallbackListView)
    
    if self.m_pickerView then
        self.m_pickerView.data = self:getPickerViewData()
    end
    self:setListViewShowingIndex(1)
end

InvitationalSlideCommon.onBtnClick = function(self)
    self:close()
    if self.m_obj and self.m_callback then
        self.m_callback(self.m_obj, self.m_operating_data)
    end
end

InvitationalSlideCommon.s_controlConfig = {
    [InvitationalSlideCommon.s_controls.centerView] = {"centerView"},
    [InvitationalSlideCommon.s_controls.radioButtonGroup] = {"centerView", "radioButtonGroup"},
    [InvitationalSlideCommon.s_controls.radio1] = {"centerView", "radioButtonGroup", "radio1"},
    [InvitationalSlideCommon.s_controls.radio2] = {"centerView", "radioButtonGroup", "radio2"},
    [InvitationalSlideCommon.s_controls.contentView] = {"centerView", "contentView"},
    [InvitationalSlideCommon.s_controls.content] = {"centerView", "contentView", "content"},
    [InvitationalSlideCommon.s_controls.title] = {"centerView", "titleBg", "title"},
    [InvitationalSlideCommon.s_controls.btn] = {"centerView", "btn"},
}

InvitationalSlideCommon.s_controlFuncMap = {
    [InvitationalSlideCommon.s_controls.radioButtonGroup] = InvitationalSlideCommon.onRadioButtonGroupClick,
    [InvitationalSlideCommon.s_controls.btn] = InvitationalSlideCommon.onBtnClick,
}

return InvitationalSlideCommon