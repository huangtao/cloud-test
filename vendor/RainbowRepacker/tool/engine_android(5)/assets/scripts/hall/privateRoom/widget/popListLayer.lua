require("common/commonGameLayer");
local popList = require(ViewPath .. "hall/privateRoom/popList");
local popListItems = require(ViewPath .. "hall/privateRoom/popListItems");
local privateRoom_pin_map = require("qnFiles/qnPlist/hall/privateRoom_pin")

local PopListLayer = class(CommonGameLayer, false);

PopListLayer.s_maxShowItemCount = 4;

PopListLayer.kDirectionUp = 1;
PopListLayer.kDirectionDown = 2;

PopListLayer.s_bgImage = privateRoom_pin_map["game_sel_bg.png"];
PopListLayer.s_arrowUpImage = privateRoom_pin_map["arrow_up.png"];
PopListLayer.s_arrowDownImage = privateRoom_pin_map["arrow_down.png"];

PopListLayer.s_width = 229;
PopListLayer.s_height = 60;

local h_index = 0;
local getIndex = function(self)
    h_index = h_index + 1;
    return h_index;
end

PopListLayer.s_controls = {
    nameArea = getIndex();
    contentView = getIndex();
    listView     = getIndex();
    toggleImg = getIndex();
    clickBg = getIndex();
    name = getIndex();
}

PopListLayer.ctor = function(self, direction, data)
    super(self, popList);
    self:setSize( self.m_root:getSize() );
    self.m_ctrl = PopListLayer.s_controls;

    self.m_direction = direction or PopListLayer.kDirectionDown;
    self:__init();

    self:setData(data);
end

PopListLayer.dtor = function(self)
end

PopListLayer.setDefaultSize = function(width, height)
    PopListLayer.s_width = width or 229;
    PopListLayer.s_height = height or 60;
end

PopListLayer.setDefaultBgImage = function(file)
    if string.isEmpty(file) then
        PopListLayer.s_bgImage = privateRoom_pin_map["game_sel_bg.png"];
    else
        PopListLayer.s_bgImage = file;
    end
end

PopListLayer.setOnItemClick = function(self, obj, func)
    self.m_eventCallBackObj = obj;
    self.m_eventCallBackFunc = func;
end

PopListLayer.setData = function(self, data)
    self.m_data = table.verify(data);
    self:__resortChooseList();
    self:__refreshArrowStatus();
end

PopListLayer.setSelectItemData = function(self, itemData)
    self:__resortChooseList(itemData);
end

PopListLayer.setSelecteItemId = function(self, id)
    if table.isEmpty(self.m_data) or not id then
        return;
    end

    for k, v in pairs(self.m_data) do
        if v.id == id then
            self:_chooseItem(v);
            break;
        end
    end
end

PopListLayer.revisePos = function(self)
    self.super.revisePos(self);
    
    self:revisePopListBackground();
end

PopListLayer.revisePopListBackground = function(self)
    if self.m_clickBg then
        local x ,y = self:getAbsolutePos();
        self.m_clickBg:setPos(-x/2,-y+10);
    end
end

PopListLayer.__resortChooseList = function(self, curSelectItemData)
    if not table.isEmpty(curSelectItemData) then
        for k,v in ipairs(self.m_data) do
            v.isSeleted = v.name == curSelectItemData.name;
        end
        self:findViewById(self.s_controls.name):setText(curSelectItemData.name or "");
    end

    self:__refreshChooseList();
end

PopListLayer.__resetLine = function(self)
    local num = #self.m_data;
    for k,v in ipairs(self.m_data) do
        v.hideLine = num == k;
    end
end

PopListLayer.__init = function(self)
    self:__initListView();
end

PopListLayer.__initListView = function(self)
    self.m_nameArea = self:findViewById(self.m_ctrl.nameArea);
    self.m_toggleImg = self:findViewById(self.m_ctrl.toggleImg);
    self.m_contentView = self:findViewById(self.m_ctrl.contentView);
    self.m_listView = self:findViewById(self.m_ctrl.listView);
    self.m_clickBg = self:findViewById(self.m_ctrl.clickBg);
    self.m_clickBg:setPickable(false);
    self.m_clickBg:setEventDrag(self, function() end);
    self.m_clickBg:setSize(System.getScreenWidth()/System.getLayoutScale(), System.getScreenHeight()/System.getLayoutScale());

    self.m_nameArea:setFile(PopListLayer.s_bgImage);
    
    local width = PopListLayer.s_width;
    local height = PopListLayer.s_height;
    self.m_nameArea:setSize(width, height);
    self.m_root:setSize(width, height);
    self:setSize(width, height);

    self.m_widthItem = width-70;
    self.m_widthHeight = height;
    self.m_contentView:setSize(self.m_widthItem, self.m_widthHeight);

    if self.m_direction == PopListLayer.kDirectionUp then
        self.m_contentView:setAlign(kAlignBottomLeft);
        self.m_nameArea:setAlign(kAlignBottom);
        self.m_toggleImg:setAlign(kAlignBottomRight);
        self.m_toggleImg:setFile(PopListLayer.s_arrowUpImage);
        self.m_listView:setAlign(kAlignBottomLeft);
    else
        self.m_contentView:setAlign(kAlignTopLeft);
        self.m_nameArea:setAlign(kAlignTop);
        self.m_toggleImg:setAlign(kAlignTopRight);
        self.m_toggleImg:setFile(PopListLayer.s_arrowDownImage);
        self.m_listView:setAlign(kAlignTopLeft);
    end

    self.m_toggleImg:setVisible(false);
    self.m_listView:setPos(0, height + 5);
    self.m_listView:setVisible(false);
end

PopListLayer.onNameAreaTouch = function(self, finger_action, x, y, drawing_id_first, drawing_id_current)
    if finger_action ~= kFingerDown and finger_action ~= kFingerMove then
        
        if not table.isEmpty(self.m_data) and #self.m_data > 1 then
            --在按起的时候
            self:__toggleChooseList();
        end
    end
end

PopListLayer.__toggleChooseList = function(self)
    local lastShowingStatus = self.m_isChooseListShowing;
    if lastShowingStatus then
        self:__hideChooseList();
    else
        self:__showChooseList();
    end
end

PopListLayer.onBgClick = function(self,finger_action)
    if self.m_isChooseListShowing then
        self:onNameAreaTouch(finger_action);   
    end
end

PopListLayer.__hideChooseList = function(self)
    self.m_isChooseListShowing = false;
    self:__refreshArrowStatus();
    self:__refreshChooseList();
    self.m_listView:setVisible(false);
end

PopListLayer.__showChooseList = function(self)
    if #self.m_data == 0 then
        return;
    end

    self.m_isChooseListShowing = true;
    self:__refreshArrowStatus();
    self:__refreshChooseList();
    self.m_listView:setVisible(true);
end

PopListLayer.__refreshChooseList = function(self)
    if #self.m_data == 0 then
        return;
    end
    
    self:__resetLine();

    PopListItemsLayer.setDefaultSize(self.m_widthItem, self.m_widthHeight + 20);
    PopListItemsLayer.setCallback(self, self.onChooseListItemClick);
    if not self.m_listItem then
        self.m_listItem = new(PopListItemsLayer, self.m_data);
        self.m_listView:addChild(self.m_listItem);
    else
        self.m_listItem:changeData(self.m_data);
    end
    self:__resetListSize();   
end

PopListLayer.__refreshArrowStatus = function(self)
    self.m_toggleImg:setVisible( #self.m_data > 1 );
    self.m_clickBg:setPickable(self.m_isChooseListShowing);
    if self.m_direction == PopListLayer.kDirectionUp then
        local img = self.m_isChooseListShowing and PopListLayer.s_arrowDownImage or PopListLayer.s_arrowUpImage;
        self.m_toggleImg:setFile(img);
    else
        local img = self.m_isChooseListShowing and PopListLayer.s_arrowUpImage or PopListLayer.s_arrowDownImage;
        self.m_toggleImg:setFile(img);       
    end
end

PopListLayer.__resetListSize = function(self)
    if self.m_listItem then
        self.m_listView:setSize(self.m_listItem:getSize());
    end
end

PopListLayer.onChooseListItemClick = function(self, index, lastIndex)
    local data = self.m_data;
    local itemData = data[index];
    self:_chooseItem(itemData, index);
end

PopListLayer._chooseItem = function(self, data, index)
    if table.isEmpty(data) then
        return;
    end

    self:__hideChooseList();
    self:__resortChooseList(data);

    if self.m_eventCallBackObj and self.m_eventCallBackFunc then
        self.m_eventCallBackFunc(self.m_eventCallBackObj, data, index);
    end
end

PopListLayer.s_controlConfig = {
    [PopListLayer.s_controls.nameArea] = {"nameArea"};
    [PopListLayer.s_controls.contentView] = {"nameArea", "contentView"};
    [PopListLayer.s_controls.listView]     = {"nameArea", "listView"};
    [PopListLayer.s_controls.toggleImg] = {"nameArea", "toggleImg"};
    [PopListLayer.s_controls.clickBg] = {"clickBg"};
    [PopListLayer.s_controls.name] = {"nameArea", "contentView", "name"};
}

PopListLayer.s_controlFuncMap = {
    [PopListLayer.s_controls.nameArea] = PopListLayer.onNameAreaTouch;
    [PopListLayer.s_controls.clickBg] = PopListLayer.onBgClick;
}



-----------------------------------------------------------------
PopListItemsLayer = class(Node);

PopListItemsLayer.s_width = 229;
PopListItemsLayer.s_height = 60;

PopListItemsLayer.setDefaultSize = function(width, height)
    PopListItemsLayer.s_width = width or 229;
    PopListItemsLayer.s_height = height or 60;
end

PopListItemsLayer.setCallback = function(obj, func)
    PopListItemsLayer.s_callbackObj = obj;
    PopListItemsLayer.s_callbackFunc = func;
end

PopListItemsLayer.ctor = function(self, data)
    if not table.isTable(data) then
        return;
    end

    self.m_data = data;
    self:initView();
    self:showData();
end

PopListItemsLayer.initView = function(self)
    self.m_view = SceneLoader.load(popListItems);
    self:addChild(self.m_view);

    self.m_contentBg = self.m_view:getChildByName("contentBg");
    self.m_contentBg:setFile(PopListLayer.s_bgImage);
    self.m_group = self.m_contentBg:getChildByName("group");
    self.m_group:setOnChange(self, self.onGroupChange);
    self.m_lineView = self.m_contentBg:getChildByName("lineView");
end

PopListItemsLayer.showData = function(self)
    local data = self.m_data;

    local size = 3;
    local maxX = 0;
    local maxY = 0;
    self.m_group:removeAllChildren(true);
    self.m_lineView:removeAllChildren(true);
    RadioButton.setDefaultImages({"hall/common/checkbox_uncheck.png","hall/common/checkbox_checked.png"});
    local seletedIndex = 1;
    for k, v in ipairs(data) do
        local rdBtn = self:_createRadioButton(v.name);
        local w, h = rdBtn:getSize();
        local col, _ = math.floor((k - 1) / size);
        local row = (k - 1) % size
        local x = col * (w + PopListItemsLayer.s_width);
        local y = row * PopListItemsLayer.s_height;
        rdBtn:setAlign(kAlignTopLeft);
        rdBtn:setPos(x, y + (PopListItemsLayer.s_height - h) / 2);
        self.m_group:addChild(rdBtn);

        maxX = math.max(maxX, x + w + PopListItemsLayer.s_width);
        maxY = math.max(maxY, y + PopListItemsLayer.s_height);

        if v.isSeleted then
            seletedIndex = k;
        end
    end
    RadioButton.setDefaultImages();

    self.m_group:setSelected(seletedIndex);

    local dataSize = #data;
    local lineSize = dataSize > size and size or dataSize;

    for i = 1, lineSize - 1 do
        local img = UIFactory.createImage("hall/common/line.png");
        img:setFillParent(true, false);
        img:setAlign(kAlignTop);
        img:setPos(nil, i * PopListItemsLayer.s_height);
        self.m_lineView:addChild(img);
    end

    local fillRegion, topLeftX, topLeftY, bottomRightX, bottomRightY = self.m_group:getFillRegion();
    local contentWidth = math.max(topLeftX + topLeftY + maxX, PopListLayer.s_width);
    local contentHeight = math.max(maxY, PopListLayer.s_height);
    self.m_contentBg:setSize(contentWidth, contentHeight);
    self.m_view:setSize(self.m_contentBg:getSize());
    self:setSize(self.m_contentBg:getSize());
    
end

PopListItemsLayer.changeData = function(self, data)
    if not table.isTable(data) then
        return;
    end

    self.m_data = data;
    self:showData();
end

PopListItemsLayer.onGroupChange = function(self, index, lastIndex)
    if PopListItemsLayer.s_callbackObj and PopListItemsLayer.s_callbackFunc then
        PopListItemsLayer.s_callbackFunc(PopListItemsLayer.s_callbackObj, index, lastIndex);
    end
end

PopListItemsLayer._createRadioButton = function(self, text)
    local rdBtn = new(RadioButton);     
    local name = UIFactory.createText(text or "", 32, 32, 32, kAlignCenter, 118,72,18);
    local w_rd = rdBtn:getSize();
    local w_name = name:getSize();
    name:setAlign(kAlignLeft);
    name:setPos(w_rd + 6);
    rdBtn:addChild(name);
    return rdBtn;
end

return PopListLayer;