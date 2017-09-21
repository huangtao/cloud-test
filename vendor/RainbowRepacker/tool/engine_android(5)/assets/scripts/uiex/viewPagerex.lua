require("ui/viewPager");

ViewPager.setPage = function(self, pageIndex)
    if not pageIndex or pageIndex < 0 or self.m_curPage == pageIndex then
        return;
    end
    local pageLength = self:getUnitLength(self);
    local scroller = ViewPager.getScroller(self);
    if scroller then
        scroller:setOffset(-pageLength * (pageIndex-1));
    end
end