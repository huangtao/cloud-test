--
-- @@LIB_NAME@@, Version: @@Version@@
--
-- This file is a part of @@LIB_NAME@@.
--
-- Author:
-- Xiaofeng Yang     2015
-- Vicent Gong       2013
--
--

---
--
-- @module gridView2

require("core/object");
require("ui2/compat/tableView2");

GridView2 = class(TableView2,false);

GridView2.setDefaultScrollBarWidth = function(width)
    GridView2.s_scrollBarWidth = width or TableView2.s_defaultScrollBarWidth;
end

GridView2.setDefaultMaxClickOffset = function(maxClickOffset)
    GridView2.s_maxClickOffset = maxClickOffset or TableView2.s_defaultMaxClickOffset;
end

GridView2.ctor = function(self, x, y, w, h)
    super(self,x,y,w,h,true);
end
