require("common/commonGameLayer")
local invitational_calendar = require(ViewPath .. "hall/invitational/invitational_calendar")
local TimeFormatUtil = require("util/timeFormatUtil")
local hallLayerBaseWithName = require("hall/widget/hallLayerBaseWithName");

local CalendarItem = class(Node)

CalendarItem.ctor = function (self, data)
    self:setFillParent(true, false)
    self:setSize(410, 90)
    self.m_data = data
    self:initViews()
end

CalendarItem.initViews = function (self)
    local str = ""
    if not table.isEmpty(self.m_data) then
        if self.m_data.date then
            local isSameDay = TimeFormatUtil.isSameDay(GameInfoIsolater.getInstance():getRightTimeWithServer(), self.m_data.date)
            str = isSameDay and "今天" or os.date("%Y.%m.%d", self.m_data.date)
        elseif self.m_data.hour then
            str = string.format("%d", self.m_data.hour)
        elseif self.m_data.minute then
            str = string.format("%.2d" , self.m_data.minute)
        end
    end
    self:createText(str, false)
end

CalendarItem.createText = function(self, str, isSelect)
    local fontSize, r, g, b = 30, 139, 106, 64
    if isSelect then
        fontSize, r, g, b = 40, 226, 86, 0
    end
    if self.m_text then
        str = str or self.m_text:getText()
        self:removeChild(self.m_text, true)
    end
    self.m_text = new(Text, str, nil, nil, nil, nil, fontSize, r, g, b)
    self.m_text:setAlign(kAlignCenter)
    self:addChild(self.m_text)
end

CalendarItem.getTimeStr = function(self)
    return self.m_text:getText()
end

CalendarItem.setTextColor = function(self, r, g, b)
    local str = self.m_text:getText()
    self.m_text:setText(str, nil, nil, r, g, b)
end

CalendarItem.dtor = function (self)
    delete(self.m_text)
    self.m_text = nil
end


-- 邀请赛日历控件
local InvitationalCalendar = class(hallLayerBaseWithName, false)

InvitationalCalendar.Delegate = {
}

local h_index = 0
local getIndex = function(self)
    h_index = h_index + 1
    return h_index
end

InvitationalCalendar.s_controls = {
    centerView = getIndex(),
    dateView = getIndex(),
    hourView = getIndex(),
    minuteView = getIndex(),
    btn = getIndex(),
}

InvitationalCalendar.s_defaultDateCount = 7
InvitationalCalendar.s_interval = 2


InvitationalCalendar.s_typ = {
    date = "date",
    hour = "hour",
    minute = "minute",
}

InvitationalCalendar.ctor = function(self, showType, data, obj, callback)
    super(self, invitational_calendar, nil, "InvitationalCalendar")
    self.m_operating_data = {}
    self.m_adapter = {}
    self.m_list = {}
    self.m_pickerView = {}
    self.m_select = {}
    self.m_isUpdateTime = {}
    self:setSize(self.m_root:getSize())
    self:setFillParent(true, true)
    self.m_ctrls = InvitationalCalendar.s_controls
    self.m_data = data
    self.m_date_count = (data and data.count) and data.count or InvitationalCalendar.s_defaultDateCount
    self.m_dateView = self:findViewById(self.m_ctrls.dateView)
    self.m_hourView = self:findViewById(self.m_ctrls.hourView)
    self.m_minuteView = self:findViewById(self.m_ctrls.minuteView)
    self:initView()
    self:setListenBackEvent(true);
    
    self.m_obj = obj;
    self.m_callback = callback;

    self:runUiAction(UiAnimConfig.ACTION.BEGIN, self:findViewById(self.s_controls.centerView));
end

InvitationalCalendar.dtor = function(self)
    self.m_isUpdateTime = {}
    if self.m_pickerView then
        for _,v in pairs(self.m_pickerView) do
            v:remove_from_parent()
            v:cleanup()
        end
        self.m_pickerView = {}
    end
end

InvitationalCalendar.initView = function(self)
    local parent = {
        [InvitationalCalendar.s_typ.date] = self.m_dateView,
        [InvitationalCalendar.s_typ.hour] = self.m_hourView,
        [InvitationalCalendar.s_typ.minute] = self.m_minuteView,
    };
    for k,v in pairs(InvitationalCalendar.s_typ) do
        self.m_pickerView[v] = self:createPickerView(parent[v], v)
    end
    self:setDefaultTime()
end

InvitationalCalendar.createPickerView = function(self, parent, typ)
    local PickerView = require("ui2.PickerView")
    local width, height = parent:getSize()
    local start = Clock.now()
    local pickerView = PickerView({size = Point(width, height), row_height = height / 5,data = self:getPickerViewData(typ)})
    pickerView.on_change_select = function(index)
        self:onChangeSelect(typ, index)
    end
    parent:getWidget():add(pickerView)
    return pickerView
end

InvitationalCalendar.setListViewShowingIndex = function(self, typ, index)
    if not index or index <= 0 then
        return
    end
    if self.m_list and self.m_list[typ] then
        self.m_list[typ]:setShowingIndex(index)
    end
    if not table.isEmpty(self.m_pickerView) and self.m_pickerView[typ] then
        if self.m_pickerView and self.m_pickerView[typ] then
            if self.m_pickerView[typ].init_finish then
                self.m_pickerView[typ]:select_item(index, 0)
            else
                self.m_pickerView[typ].showing_index = index
            end
        end
    end
end

--最小可以开赛的时间
InvitationalCalendar.getMinStartTime = function(self)
    return InvitationalDataInterface.getInstance():getStartTime()
    --return GameInfoIsolater.getInstance():getRightTimeWithServer() + 60 * InvitationalCalendar.s_interval
end

--设置默认值
InvitationalCalendar.setDefaultTime = function(self)
    local time = self.m_data and self.m_data.time
    local minStartTime = self:getMinStartTime()
    if not time or time < minStartTime then
        time = minStartTime
    end
    self:updateShowingTime(time)
    self:__refreshColor(time);
end

InvitationalCalendar.updateShowingTime = function(self, time)
    if not time then
        return
    end
    local index = {}
    local t = os.date("*t", time)
    self.m_isUpdateTime = {}
    for _,v in pairs(InvitationalCalendar.s_typ) do
        index[v] = 1
        self.m_isUpdateTime[v] = true
        for k2,v2 in pairs(self:getData(v)) do
            if v == InvitationalCalendar.s_typ.date then
                if v2[v] and TimeFormatUtil.isSameDay(v2[v], time) then
                    index[v] = k2
                    break
                end
            elseif v == InvitationalCalendar.s_typ.hour then
                if t.hour == v2[v] then
                    index[v] = k2
                    break
                end
            elseif v == InvitationalCalendar.s_typ.minute then
                if t.min == v2[v] then
                    index[v] = k2
                    break
                end
            end
        end
        self:setListViewShowingIndex(v, index[v]-2)
    end
end

--设置选中文本
InvitationalCalendar.setSelectText = function(self, old_item, new_item)
    if old_item then
        old_item:createText(nil, false)
    end
    if new_item then
        new_item:createText(nil, true)
    end
end

InvitationalCalendar.onChangeSelect = function(self, typ, index)
    self:updateSelect(typ, index, true)
end

InvitationalCalendar.onUiEndActionBefore = function(self)
    for _,v in pairs(self.m_pickerView) do
        v:stop_kinetic()
    end
end

--更新选中项
InvitationalCalendar.updateSelect = function(self, typ, itemIndex, isStop)
    local index = itemIndex + 2
    if self:getSelectIndex(typ) == index and not isStop then
        self.m_isUpdateTime[typ] = nil
        return
    end
    local old_item = self:getSelectItem(typ)
    local new_item = self.m_adapter and self.m_adapter[typ] and self.m_adapter[typ]:getView(index)
    self:setSelectFlag(typ, index, new_item)
    self:setSelectText(old_item, new_item)
    local selectTime = self:getSelectTime()
    if selectTime == self.m_operating_data.time then
        self.m_isUpdateTime[typ] = nil
        self:__refreshColor(selectTime);
        return
    end
    if isStop then
        self.m_operating_data.time = self:getSelectTime()
        self:checkTime(typ)
    end
end

--获取当前选中时间
InvitationalCalendar.getSelectTime = function(self)
    local time = self:getSelectTimeByType(InvitationalCalendar.s_typ.date)
    local date = os.date("*t", time)
    date.hour = self:getSelectTimeByType(InvitationalCalendar.s_typ.hour)
    date.min = self:getSelectTimeByType(InvitationalCalendar.s_typ.minute)
    return os.time(date)
end

InvitationalCalendar.getSelectTimeByType = function(self, typ)
    local index = self:getSelectIndex(typ)
    index = (not index or index < 0) and 1 or index
    return self:getData(typ)[index][typ]
end

InvitationalCalendar.checkTime = function(self, typ)
    if self.m_isUpdateTime[typ] then
        self.m_isUpdateTime[typ] = nil
        return
    end

    local minStartTime = self:getMinStartTime()
    local selectTime = self:getSelectTime();
    local isLegalTime = selectTime >= minStartTime and true or false;
    if  isLegalTime then
        self:__refreshColor(selectTime);
    end

    if not isLegalTime then
        self:updateShowingTime(minStartTime)
    end
end

InvitationalCalendar.__refreshColor = function(self, selectTime)
    local minStartTime = self:getMinStartTime()
    local minDate = os.date("*t", minStartTime);
    local selectDate = os.date("*t", selectTime);

    local isSameDay = TimeFormatUtil.isSameDay(minStartTime, selectTime);
    local hourFlag = minDate.hour >= selectDate.hour;
    local index = {};

    Log.v("minDate.hour = ", minDate.hour);
    Log.v("selectDate.hour = ", selectDate.hour);
    if isSameDay then
        for k, v in pairs(self:getData(InvitationalCalendar.s_typ.hour)) do
            if minDate.hour == v[InvitationalCalendar.s_typ.hour] then
                index[InvitationalCalendar.s_typ.hour] = k-2
                break
            end
        end

        if hourFlag then
            for k, v in pairs(self:getData(InvitationalCalendar.s_typ.minute)) do
                if minDate.min == v[InvitationalCalendar.s_typ.minute] then
                    index[InvitationalCalendar.s_typ.minute] = k-2
                    break
                end
            end
        end
    end

    Log.v("index = ", index)
    for _,v in pairs(InvitationalCalendar.s_typ) do
        self.m_pickerView[v]:set_default_color(index[v], {172,164,154});
    end    
end


--设置当前选中index及item
InvitationalCalendar.setSelectFlag = function(self, typ, index, item)
    self:setSelectIndex(typ, index)
    self:setSelectItem(typ, item)  
end

--获取当前选中index及item
InvitationalCalendar.getSelectFlag = function(self, typ)
    return self.m_select[typ]["index"], self.m_select[typ]["item"]
end

--设置当前选中index
InvitationalCalendar.setSelectIndex = function(self, typ, index)
    self.m_select[typ] = self.m_select[typ] or {}
    self.m_select[typ]["index"] = index
end

--获取当前选中index
InvitationalCalendar.getSelectIndex = function(self, typ)
    return self.m_select[typ] and self.m_select[typ]["index"] or nil
end

--设置当前选中item
InvitationalCalendar.setSelectItem = function(self, typ, item)
    self.m_select[typ] = self.m_select[typ] or {}
    self.m_select[typ]["item"] = item
end

--获取当前选中item
InvitationalCalendar.getSelectItem = function(self, typ)
    return self.m_select[typ] and self.m_select[typ]["item"] or nil
end

--获取数据
InvitationalCalendar.getData = function(self, typ)
    local tmpData = self:getRawData(typ)
    table.insert(tmpData, 1, {})
    table.insert(tmpData, 1, {})
    table.insert(tmpData, {})
    table.insert(tmpData, {})
    return tmpData
end

InvitationalCalendar.getRawData = function(self, typ)
    local tmpData = {}
    if typ == InvitationalCalendar.s_typ.date then
        local today = TimeFormatUtil.getDayStartTime(GameInfoIsolater.getInstance():getRightTimeWithServer())
        table.insert(tmpData, {[typ]=today})
        for i=1,self.m_date_count do
            table.insert(tmpData, {[typ]=today + i*24*60*60})
        end
    elseif typ == InvitationalCalendar.s_typ.hour then
        for i=0,23 do
            table.insert(tmpData, {[typ]=i})
        end
    elseif typ == InvitationalCalendar.s_typ.minute then
        for i=0,59,5 do
            table.insert(tmpData, {[typ]=i})
        end
    end
    return tmpData
end

InvitationalCalendar.getPickerViewData = function(self, typ)
    local data = self:getRawData(typ)
    local t = {}
    for i,v in ipairs(data) do
        if typ == InvitationalCalendar.s_typ.date then
            local isSameDay = TimeFormatUtil.isSameDay(GameInfoIsolater.getInstance():getRightTimeWithServer(), v[typ])
            t[i] = isSameDay and "今天" or os.date("%Y.%m.%d", v[typ])
        elseif typ == InvitationalCalendar.s_typ.hour then
            t[i] = string.format("%d", v[typ])
        elseif typ == InvitationalCalendar.s_typ.minute then
            t[i] = string.format("%.2d" , v[typ])
        end
    end
    return t
end

InvitationalCalendar.onBtnClick = function(self)
    self:close()
    if self.m_obj and self.m_callback then
        self.m_callback(self.m_obj, self.m_operating_data)
    end
end

InvitationalCalendar.s_controlConfig = {
    [InvitationalCalendar.s_controls.centerView] = {"centerView"},
    [InvitationalCalendar.s_controls.dateView] = {"centerView", "dateView"},
    [InvitationalCalendar.s_controls.hourView] = {"centerView", "hourView"},
    [InvitationalCalendar.s_controls.minuteView] = {"centerView", "minuteView"},
    [InvitationalCalendar.s_controls.btn] = {"centerView", "btn"},
}

InvitationalCalendar.s_controlFuncMap = {
    [InvitationalCalendar.s_controls.btn] = InvitationalCalendar.onBtnClick,
}

return InvitationalCalendar