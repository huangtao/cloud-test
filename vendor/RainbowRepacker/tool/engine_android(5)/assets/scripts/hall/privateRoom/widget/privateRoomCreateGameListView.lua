require("common/commonGameLayer");
local privateRoomCreateGameListViewLayout = require(ViewPath .. "hall/privateRoom/privateRoomCreateGameListViewLayout");
local privateRoom_pin_map = require("qnFiles/qnPlist/hall/privateRoom_pin")

local PrivateRoomCreateGameListView = class(CommonGameLayer, false);

PrivateRoomCreateGameListView.s_maxShowItemCount = 4.5;

PrivateRoomCreateGameListView.s_arrowUpImage = privateRoom_pin_map["arrow_up2.png"];
PrivateRoomCreateGameListView.s_arrowDownImage = privateRoom_pin_map["arrow_down2.png"];

PrivateRoomCreateGameListView.s_bg = "hall/privateRoom/create_title_bg.png"
PrivateRoomCreateGameListView.s_bgListView = "hall/privateRoom/create_title_list_bg.png"

PrivateRoomCreateGameListView.s_controls = {
    nameArea = ToolKit.getIndex();
    contentView = ToolKit.getIndex();
    listView = ToolKit.getIndex();
    toggleImg = ToolKit.getIndex();
    clickBg = ToolKit.getIndex();
    name = ToolKit.getIndex();
}

PrivateRoomCreateGameListView.ctor = function(self, data)
    super(self, privateRoomCreateGameListViewLayout);
    self:setSize(self.m_root:getSize());
    self.m_ctrl = PrivateRoomCreateGameListView.s_controls;

    self:__init();

    self:setData(data);
end

PrivateRoomCreateGameListView.dtor = function(self)
    if self.m_maskImage then
        delete(self.m_maskImage);
        self.m_maskImage = nil;
    end
end

PrivateRoomCreateGameListView.setOnItemClick = function(self, obj, func)
    self.m_eventCallBackObj = obj;
    self.m_eventCallBackFunc = func;
end

PrivateRoomCreateGameListView.setData = function(self, data)
    self.m_data = table.verify(data);
    self:__resortChooseList();
    self:__refreshArrowStatus();
end

PrivateRoomCreateGameListView.setSelectItemData = function(self, itemData)
    self:__resortChooseList(itemData);
end

PrivateRoomCreateGameListView.setSelecteItemId = function(self, id)
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

PrivateRoomCreateGameListView.revisePos = function(self)
    self.super.revisePos(self);
    
    self:revisePopListBackground();
end

PrivateRoomCreateGameListView.revisePopListBackground = function(self)
    if self.m_clickBg then
        local x ,y = self:getAbsolutePos();
        self.m_clickBg:setPos(-x,-y);
    end
end

PrivateRoomCreateGameListView.__resortChooseList = function(self, curSelectItemData)
    if not table.isEmpty(curSelectItemData) then
        local index;
        for k,v in ipairs(self.m_data) do
            if v.name == curSelectItemData.name then
                index = k;
                break;
            end
        end

        if index then
            table.remove(self.m_data, index);
            table.insert(self.m_data, 1, curSelectItemData);
        end

        self:findViewById(self.s_controls.name):setText(curSelectItemData.name or "");
    end

    self:__refreshChooseList();
end

PrivateRoomCreateGameListView.__init = function(self)
    self:__initListView();
end

PrivateRoomCreateGameListView.__initListView = function(self)
    self.m_nameArea = self:findViewById(self.m_ctrl.nameArea);
    self.m_toggleImg = self:findViewById(self.m_ctrl.toggleImg);
    self.m_contentView = self:findViewById(self.m_ctrl.contentView);
    self.m_listView = self:findViewById(self.m_ctrl.listView);
    self.m_listView:setScrollBarWidth(0);
    self.m_listView:setOnItemClick(self, self.onChooseListItemClick);
    self.m_clickBg = self:findViewById(self.m_ctrl.clickBg);
    self.m_clickBg:setEventDrag(self, function() end);
    self.m_clickBg:setSize(System.getScreenWidth()/System.getLayoutScale(), System.getScreenHeight()/System.getLayoutScale());
    self.m_toggleImg:setFile(PrivateRoomCreateGameListView.s_arrowDownImage);

    self.m_clickBg:setVisible(false);
    self.m_toggleImg:setVisible(false);

    -- self.m_stencil = require('libEffect.shaders.stencilMask')
    -- self.m_maskImage = new(Image, privateRoom_pin_map["create_title_mask.png"], nil, nil, 38, 38, 5, 38)

    self.m_listView:setVisible(false);
end

PrivateRoomCreateGameListView.onNameAreaTouch = function(self, finger_action, x, y, drawing_id_first, drawing_id_current)
    if finger_action ~= kFingerDown and finger_action ~= kFingerMove then
        
        if not table.isEmpty(self.m_data) and #self.m_data > 1 then
            --在按起的时候
            self:__toggleChooseList();
        end
    end
end

PrivateRoomCreateGameListView.__toggleChooseList = function(self)
    local lastShowingStatus = self.m_isChooseListShowing;
    if lastShowingStatus then
        self:__hideChooseList();
    else
        self:__showChooseList();
    end
end

PrivateRoomCreateGameListView.onBgClick = function(self,finger_action)
    if self.m_isChooseListShowing then
        self:onNameAreaTouch(finger_action);   
    end
end

PrivateRoomCreateGameListView.__hideChooseList = function(self)
    self.m_isChooseListShowing = false;
    self:__refreshArrowStatus();
    self:__refreshChooseList();
    self.m_listView:setVisible(false);
    self.m_contentView:setVisible(true);
end

PrivateRoomCreateGameListView.__showChooseList = function(self)
    if #self.m_data == 0 then
        return;
    end

    self.m_isChooseListShowing = true;
    self:__refreshArrowStatus();
    self:__refreshChooseList();
    self.m_listView:setVisible(true);
    self.m_contentView:setVisible(false);
end

PrivateRoomCreateGameListView.__refreshChooseList = function(self)
    if #self.m_data == 0 then
        return;
    end

    if not self.m_adapter then
        self.m_adapter = UIFactory.createCacheAdapter(PrivateRoomCreateGameListItem, self.m_data);
        self.m_listView:setAdapter(self.m_adapter);
    else
        self.m_adapter:changeData(self.m_data);
    end
    self:__resetListSize();   
end

PrivateRoomCreateGameListView.__refreshArrowStatus = function(self)
    self.m_toggleImg:setVisible( #self.m_data > 1 );
    self.m_clickBg:setVisible(self.m_isChooseListShowing);
    local img = self.m_isChooseListShowing and PrivateRoomCreateGameListView.s_arrowUpImage or PrivateRoomCreateGameListView.s_arrowDownImage;
    self.m_toggleImg:setFile(img);
end

PrivateRoomCreateGameListView.__resetListSize = function(self)
    if self.m_isChooseListShowing then
        self.m_nameArea:setFile(PrivateRoomCreateGameListView.s_bgListView);
        local height = self.m_nameArea.m_res:getHeight();
        local _, h = self:getSize();
        local maxCount = math.min(#self.m_data, PrivateRoomCreateGameListView.s_maxShowItemCount);
        maxCount = math.max(maxCount, 1); 
        local list_h = maxCount*h;
        self.m_nameArea:setSize(nil, list_h + height * 0.08);
        if self.m_listView then    
            self.m_listView:setSize(nil, list_h);
        end

        -- self.m_maskImage:setSize(nil, list_h + height * 0.08);
        -- self.m_nameArea:getWidget():update()


        -- if self.m_stencilWidget == nil then
        --     self.m_stencilWidget = self.m_stencil.applyToDrawing(self.m_nameArea,self.m_listView,self.m_maskImage,0.1)
        -- else
        --     self.m_stencilWidget:invalidate();
        -- end
    else
        self.m_nameArea:setFile(PrivateRoomCreateGameListView.s_bg);
        local height = self.m_nameArea.m_res:getHeight();
        self.m_nameArea:setSize(nil, height);
        -- if self.m_stencilWidget ~= nil then
        --     self.m_stencilWidget:invalidate();
        -- end
    end
end

PrivateRoomCreateGameListView.onChooseListItemClick = function(self,adapter,view,index)
    local data = adapter:getData();
    local itemData = data[index];
    self:_chooseItem(itemData, index);
end

PrivateRoomCreateGameListView._chooseItem = function(self, data, index)
    if table.isEmpty(data) then
        return;
    end

    self:__hideChooseList();
    self:__resortChooseList(data);

    if self.m_eventCallBackObj and self.m_eventCallBackFunc then
        self.m_eventCallBackFunc(self.m_eventCallBackObj, data, index);
    end
end

PrivateRoomCreateGameListView.s_controlConfig = {
    [PrivateRoomCreateGameListView.s_controls.nameArea] = {"nameArea"};
    [PrivateRoomCreateGameListView.s_controls.contentView] = {"nameArea", "contentView"};
    [PrivateRoomCreateGameListView.s_controls.listView] = {"nameArea", "listView"};
    [PrivateRoomCreateGameListView.s_controls.toggleImg] = {"nameArea", "toggleImg"};
    [PrivateRoomCreateGameListView.s_controls.clickBg] = {"clickBg"};
    [PrivateRoomCreateGameListView.s_controls.name] = {"nameArea", "contentView", "name"};
}

PrivateRoomCreateGameListView.s_controlFuncMap = {
    [PrivateRoomCreateGameListView.s_controls.nameArea] = PrivateRoomCreateGameListView.onNameAreaTouch;
    [PrivateRoomCreateGameListView.s_controls.clickBg] = PrivateRoomCreateGameListView.onBgClick;
}



-----------------------------------------------------------------
PrivateRoomCreateGameListItem = class(Node);

PrivateRoomCreateGameListItem.setCallback = function(obj, func)
    PrivateRoomCreateGameListItem.s_callbackObj = obj;
    PrivateRoomCreateGameListItem.s_callbackFunc = func;
end

PrivateRoomCreateGameListItem.ctor = function(self, data)
    if not table.isTable(data) then
        return;
    end

    self.m_data = data;
    self:initView();
end

PrivateRoomCreateGameListItem.initView = function(self)
    local data = self.m_data;

    local image = UIFactory.createImage(privateRoom_pin_map["create_title_item.png"]);
    self:addChild(image);
    self:setSize(image:getSize());

    local name = UIFactory.createText(data.name or "", 32, 32, 32, kAlignCenter, 255, 254, 164);
    name:setAlign(kAlignCenter);
    self:addChild(name);

end

return PrivateRoomCreateGameListView;