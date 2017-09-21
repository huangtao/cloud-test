---
-- 图片字.
-- @module byui.bmfont
-- @extends byui#byui.bmfont
-- @return #table 返回listview等类型 
local M = {}
local class, mixin, super = unpack(require('byui/class'))

local function Utf8to32(utf8str)
    assert(type(utf8str) == "string")
    local res, seq, val = {}, 0, nil
    for i = 1, #utf8str do
	    local c = string.byte(utf8str, i)
	    if seq == 0 then
	        table.insert(res, val)
	        seq = c < 0x80 and 1 or c < 0xE0 and 2 or c < 0xF0 and 3 or
	              c < 0xF8 and 4 or --c < 0xFC and 5 or c < 0xFE and 6 or
	              error("invalid UTF-8 character sequence")
	        val = bit.band(c, 2^(8-seq) - 1)
	    else
	        val = bit.bor(bit.lshift(val, 6), bit.band(c, 0x3F))
	    end
	    seq = seq - 1
    end
    table.insert(res, val)
    table.insert(res, 0)
    return res
end

---
-- 图片字.
-- @type byui.LabelBMFont
-- @extends engine#Widget 

---
-- 创建图片字对象.
-- @callof #byui.LabelBMFont
-- @param #byui.LabelBMFont self 
-- @param #table args 构造时传入的参数.<br/>
--                    1. filename:图片字的配置文件。
--                    2. text:需要显示的文本。
-- @return #byui.LabelBMFont 返回创建的图片字对象. 
-- @usage 
-- local labelBMFont = M.LabelBMFont{text = '13245\n6.12312\n78dsdsd46542390',filename = 'fnt.lua',line_width = nil}
--    root:add(labelBMFont)
--    Clock.instance():schedule_once(function ( ... )
--        -- labelBMFont.text = '1.321657463156746458'
--        for i,v in ipairs(labelBMFont.children_node) do
--            if i == 3 then
--                -- v.background_color = Colorf.red
--            end
--            print(i,v.pos,v.size)
--        end
--    end,2)


M.LabelBMFont = class('LabelBMFont',Widget,{
	__init__ = function ( self,args )
		super(M.LabelBMFont, self).__init__(self)
		self.filename = require(args.filename)
		self._line_width = args.line_width 
		self._children_node = {}
		self.text = args.text or ''
	end,
	
	--- 
	-- 显示的文字.
	-- 不能为nil,且必须为字符串。如果在配置中不存在对应的字符则不会显示。 
	-- @field [parent=#byui.LabelBMFont] #string text 
	text = {function ( self )
		return self._text or ''
	end,function ( self,value )
		assert(value,'string does not exist')
		assert(type(value) == 'string','the parameter must be a string')
		self._text = value
		self._uchar = Utf8to32(self._text)
		self._length = #self._uchar - 1
		self:_clear()
		self:_create_font_chars()
	end},
	_clear = function ( self )
		for key,value in ipairs(self._children_node) do
			value:remove_from_parent()
		end
		self._children_node = {}
	end,
	_create_font_chars = function ( self )
		local nextFontPositionX = 0
	    local nextFontPositionY = 0
	    local common_height = 0

	    local tmpSize = Point(0,0)

	    local longestLine = 0;
    	local totalHeight = 0;

    	local quantityOfLines = 1;
    	
    	if self._length == 0 then
    		self.size = tmpSize
    		return 
    	end
    	local charSet = self.filename  	
    	common_height = charSet[tostring(self._uchar[1])..".png"].utHeight -- charSet[tostring(self._uchar[1])..".png"].offsetY
		for i=1,self._length do
			local c = self._uchar[i]
			if c == 10 then
				nextFontPositionX = 0
            	nextFontPositionY = nextFontPositionY + common_height
            	quantityOfLines = quantityOfLines + 1
            elseif not charSet[tostring(c)..".png"] then
            	print(string.format("LabelBMFont: Attempted to use character not defined in this bitmap:%s",string.char(c)))
            else
            	local unit_data = charSet[tostring(c)..".png"]
            	local unit = TextureUnit.load(unit_data)
            	local sprite = Sprite()
            	sprite.unit = unit
            	sprite.size = unit.original_size

            	local xoffset = 0
            	local real_width = 0
            	if unit_data.rotated then
            		real_width = unit_data.height
            	else
            		real_width = unit_data.width
            	end
				xoffset = unit_data.offsetX

            	local tempx = nextFontPositionX + real_width 
            	if self._line_width and tempx > self._line_width then
            		if nextFontPositionX == 0 then
            			nextFontPositionY = nextFontPositionY
            			quantityOfLines = quantityOfLines
         			else
            			nextFontPositionX = 0
            			nextFontPositionY = nextFontPositionY + common_height
            			quantityOfLines = quantityOfLines + 1
         			end
                end 
            	local fontPos = Point(nextFontPositionX-xoffset,nextFontPositionY)
            	sprite.pos = fontPos
            	nextFontPositionX = nextFontPositionX + real_width
            	if longestLine < nextFontPositionX then
		            longestLine = nextFontPositionX
        		end
        		table.insert(self._children_node,sprite)
        		self:add(sprite)
			end 
		end
		totalHeight = common_height*quantityOfLines
		tmpSize.x = longestLine 
		tmpSize.y = totalHeight
		self.size = tmpSize
	end,
	---
	-- 返回所有的文符对象集合.
	-- 主要用来做动画。
	-- @field [parent=#byui.LabelBMFont] #table children_node 
	children_node = {function ( self )
		return self._children_node
	end},
	})
M.test = function ( root )
	-- local test = M.BMFontConfiguration{filename = 'bmp.fnt'}
	-- test:parse_config_file()
	-- print(string_length('你好nihao12adsd!!￥'))
	local labelBMFont = M.LabelBMFont{text = '13245\n6.12312\n78dsdsd46542390',filename = 'fnt.lua',line_width = nil}
	root:add(labelBMFont)
	Clock.instance():schedule_once(function ( ... )
		-- labelBMFont.text = '1.321657463156746458'
		for i,v in ipairs(labelBMFont.children_node) do
			if i == 3 then
				-- v.background_color = Colorf.red
			end
			print(i,v.pos,v.size)
		end
	end,2)
end


return M