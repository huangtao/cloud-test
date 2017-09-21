local match_hall_detail_select_list_item_layout = require(ViewPath.."hall/matchHall/widget/match_hall_detail_select_list_item_layout");

local GameMatchHallDetailSelectListItem = class(CommonGameLayer, false)

GameMatchHallDetailSelectListItem.s_controls = {
    bg = 1,
    line = 2,
    count = 3,
    direction = 4,
    icon = 5,
    str = 6,

}

GameMatchHallDetailSelectListItem.ctor = function(self, data)
	super(self, match_hall_detail_select_list_item_layout)
	self.m_data = data
    self:getHandle()
    self.m_bg = self:findViewById(self.s_controls.bg)
    self:init()
end

GameMatchHallDetailSelectListItem.getHandle = function(self)
    self.m_count = self:findViewById(self.s_controls.count)
    self.m_line = self:findViewById(self.s_controls.line)
    self.m_direction = self:findViewById(self.s_controls.direction)
    self.m_icon = self:findViewById(self.s_controls.icon)
    self.m_str = self:findViewById(self.s_controls.str)
end

GameMatchHallDetailSelectListItem.init = function(self)
    self:setSize(self.m_root:getSize())
    if self.m_data and self.m_data[1] and self.m_data[1]["type"] and self.m_data[1].num then
        local typ = number.valueOf(self.m_data[1]["type"])
        local num = number.valueOf(self.m_data[1].num)
        local coinID = RechargeDataInterface.getInstance():getPropertySilverCoinID()
        local barID = RechargeDataInterface.getInstance():getPropertyGoldBarID()
        local propInfo = table.verify(RechargeDataInterface.getInstance():getGoodInfoByTypeIdWithMap(typ))
        if typ == coinID or typ == barID then
            self:setCount(ToolKit.skipMoney(num))
            ImageCache.getInstance():request(propInfo.item_icon, self, self.onImageDownloadIcon)
        else
            self:setCount(string.format("%s*%s", propInfo.item_name or "", num or ""))
            self.m_count:setPos(109, nil)
        end
    end
end

GameMatchHallDetailSelectListItem.updateBgGray = function(self)
    if self.m_data[1].num and self.m_data[1].type then
        if MatchHallDataInterface.getInstance():checkEnroll(tonumber(self.m_data[1].type), tonumber(self.m_data[1].num), true) then
            self.m_icon:setGray(false)
        else
            self.m_icon:setGray(true)
        end
    end
end

GameMatchHallDetailSelectListItem.onImageDownloadIcon = function(self, url, file)
    if not string.isEmpty(file) then
        self:setIcon(file)
    end
end

GameMatchHallDetailSelectListItem.setCount = function(self, text)
    self.m_count:setText(text)
end

GameMatchHallDetailSelectListItem.setStrState = function(self, state)
    self.m_str:setVisible(state)
end

GameMatchHallDetailSelectListItem.setIcon = function(self, file)
    local w, h = self.m_icon:getSize()
    self.m_icon:setFile(file)
    if self.m_icon.m_res then
        local resW = self.m_icon.m_res:getWidth()
        local resH = self.m_icon.m_res:getHeight()
        local scaleW, scaleH =  resW / w, resH / h
        local width, height = w, h
        if scaleW > scaleH then
            width = w
            height = resH / scaleW
        else
            width = resW / scaleH
            height = h
        end
        self.m_icon:setSize(width, height)
    end
end

GameMatchHallDetailSelectListItem.setDirectionFile = function(self, file)
    self.m_direction:setFile(file)
end

GameMatchHallDetailSelectListItem.setDirectionState = function(self, state)
    self.m_direction:setVisible(state)
end

GameMatchHallDetailSelectListItem.setLineState = function(self, state)
    self.m_line:setVisible(state)
end

GameMatchHallDetailSelectListItem.dtor = function(self)
	
end

GameMatchHallDetailSelectListItem.setBgState = function(self, state)
    self.m_bg:setVisible(state)
end

GameMatchHallDetailSelectListItem.s_controlConfig = {
    [GameMatchHallDetailSelectListItem.s_controls.bg] = {"bg"},
    [GameMatchHallDetailSelectListItem.s_controls.line] = {"line"},
    [GameMatchHallDetailSelectListItem.s_controls.count] = {"bg","text"},
    [GameMatchHallDetailSelectListItem.s_controls.icon] = {"bg","icon"},
    [GameMatchHallDetailSelectListItem.s_controls.direction] = {"bg","direction"},
    [GameMatchHallDetailSelectListItem.s_controls.str] = {"bg","str"},
}

return GameMatchHallDetailSelectListItem