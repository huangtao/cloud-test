--
-- @@LIB_NAME@@, Version: @@Version@@
--
-- This file is a part of @@LIB_NAME@@.
--
-- Author:
-- Xiaofeng Yang     2015
-- Vicent Gong       2012
--
--

---
--
-- @module listView2

require("core/object");
require("ui2/compat/tableView2");

ListView2 = class(TableView2);

ListView2.setDefaultScrollBarWidth = function(width)
    ListView2.s_scrollBarWidth = width or TableView2.s_defaultScrollBarWidth;
end

ListView2.setDefaultMaxClickOffset = function(maxClickOffset)
    ListView2.s_maxClickOffset = maxClickOffset or TableView2.s_defaultMaxClickOffset;
end

ListView2.ctor = function(self, x, y, w, h)

end
