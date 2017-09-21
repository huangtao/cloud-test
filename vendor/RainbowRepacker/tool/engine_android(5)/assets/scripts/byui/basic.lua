---
-- UI库.
-- 包含@{# byui.bmfont} ,@{# byui.scroll},@{# byui.simple_ui},@{# byui.edit}
-- @module byui
-- @return #byui

local simple_ui = require 'byui/simple_ui'
local scroll = require 'byui/scroll'
local edit = require 'byui/edit'
local tableview = require 'byui/tableview'
local bmfont = require 'byui/bmfont'
 


local M = {}
table.merge(M,simple_ui)
table.merge(M,scroll)
table.merge(M,edit)
table.merge(M,tableview)
table.merge(M,bmfont)
return M 