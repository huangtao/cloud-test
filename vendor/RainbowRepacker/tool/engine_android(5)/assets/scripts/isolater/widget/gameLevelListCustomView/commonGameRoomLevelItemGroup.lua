-- 数据分页
CommonGameRoomLevelItemGroup = class(CommonGameLayer, false);

CommonGameRoomLevelItemGroup.s_defaultWidth = 300;
CommonGameRoomLevelItemGroup.s_defaultHeight = 300;
CommonGameRoomLevelItemGroup.s_itemClass = nil;

CommonGameRoomLevelItemGroup.setDefaultSize = function(w, h)
    CommonGameRoomLevelItemGroup.s_defaultWidth = w or CommonGameRoomLevelItemGroup.s_defaultWidth;
    CommonGameRoomLevelItemGroup.s_defaultHeight = h or CommonGameRoomLevelItemGroup.s_defaultHeight;
end

CommonGameRoomLevelItemGroup.setPageItemClass = function(itemClass)
    CommonGameRoomLevelItemGroup.s_itemClass = itemClass;
end

CommonGameRoomLevelItemGroup.ctor = function(self,data)  
    super(self, nil);
    self.m_data = data;
    self:setSize(CommonGameRoomLevelItemGroup.s_defaultWidth, CommonGameRoomLevelItemGroup.s_defaultHeight);
    self:initViews();
end

CommonGameRoomLevelItemGroup.initViews = function(self)
    -- 3行2列
    local w, h = self:getSize();
    local itemWidth = w / 2;
    local itemHeight = h;
    for k,v in pairs(self.m_data) do
        if v then
            local view = new(CommonGameRoomLevelItemGroup.s_itemClass, v, h);
            view:setSize(itemWidth, nil);
            self:addChild(view);
            local col = (k-1) % 2;
            view:setPos(col * itemWidth, nil);
            view:setContentAlign(kAlignCenter);

            local _, viewHeight = view:getSize();
            itemHeight = viewHeight;
        end
    end
    
    self:setSize(nil, itemHeight);
end
