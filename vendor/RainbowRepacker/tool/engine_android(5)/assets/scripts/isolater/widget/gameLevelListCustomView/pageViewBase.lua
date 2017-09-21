require("common/commonGameLayer");


PageViewBase = class(CommonGameLayer, false);

PageViewBase.s_defaultWidth = System.getScreenScaleWidth();

PageViewBase.s_defaultItemNum = 3;

PageViewBase.ctor = function(self, data)
    super(self, nil);
    self.m_data = table.verify(data);

    self.m_itemW = 0;
    self.m_itemH = 0;
    self:initView();
end

PageViewBase.getData = function(self)
    return self.m_data;
end

PageViewBase.initView = function(self)
    local index = 1;
    for k, v in pairs(self.m_data) do
        if v then
            local item = new(self:getPageItemView() , v);
            self.m_itemW, self.m_itemH = item:getSize();
            self:addChild(item);
            item:setPos( self:getItemPos(index) );
            index = index + 1;
        end
    end

    self:setSize( self:getPageViewSize() );
end

PageViewBase.getItemPos = function(self, index)
    local space = self:getItemSpace();
    local marginSpace = self:getMarginSpace();
    local x = marginSpace + space * index + self.m_itemW * (index - 1);
    return x, 0;
end

PageViewBase.getItemSpace = function(self)
    local page_w = self:getPageViewSize();
    local pageItemNum = self:getPageItemNum();
    local marginSpace = self:getMarginSpace();
    return (page_w - marginSpace*2 - self.m_itemW * pageItemNum) / (pageItemNum + 1);
end

--左右偏移长度
PageViewBase.getMarginSpace = function(self)
    return 0;
end

PageViewBase.getPageViewSize = function(self)
    return PageViewBase.s_defaultWidth, self.m_itemH;
end

PageViewBase.getPageItemNum = function(self)
    return PageViewBase.s_defaultItemNum;
end

PageViewBase.getPageItemView = function(self)
    return nil;
end

