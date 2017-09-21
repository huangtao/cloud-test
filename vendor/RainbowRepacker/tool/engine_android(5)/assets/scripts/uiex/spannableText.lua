require("core/constants");
require("core/object");
require("core/res");
require("core/gameString");
require("ui/node");

--[[

	@author JasonWang
	@功能：用于显示格式化的字符串
	@创建时间：2014/09/05
]]
SpannableText = class(Node);

SpannableText.ctor = function(self, width, height, align, fontName, fontSize, r, g, b)
    self.m_str = "";
    width = width or 0;
    height = height or 0;
    self.m_defaultR = r or 0;
    self.m_defaultG = g or 0;
    self.m_defaultB = b or 0;
    self.m_fontSize = fontSize or 30;
    self.m_styleMap = {};
    self.m_align = align;
    self.m_fontName = fontName;
    self:setSize(width, height);
end

SpannableText.setText = function(self, str, r, g, b)
    self.m_str = self:convert2SafeString(str);
    self.m_defaultR = r or 0;
    self.m_defaultG = g or 0;
    self.m_defaultB = b or 0;
    self:refresh();
end

SpannableText.addSpannableColor = function(self, startPos, endPos, r,g,b)
    if not string.isEmpty(str) and tonumber(startPos) and tonumber(endPos) then
        local tmp = {};
        tmp.s = startPos;
        tmp.e = endPos;
        tmp.r = tonumber(r) or 0;
        tmp.g = tonumber(g) or 0;
        tmp.b = tonumber(b) or 0;
        table.insert(self.m_styleMap, tmp);
    end
end

SpannableText.addSpannableText = function(self, str, r,g,b)
    local addStr = self:convert2SafeString(str);
    if not string.isEmpty(str) then
        local curNum = string.count(self.m_str);
        local addNum = string.count(addStr);  
        self.m_str = self.m_str .. addStr;
        local tmp = {};
        tmp.s = curNum + 1;
        tmp.e = curNum + addNum;
        tmp.r = tonumber(r) or 0;
        tmp.g = tonumber(g) or 0;
        tmp.b = tonumber(b) or 0;
        table.insert(self.m_styleMap, tmp);
    end
end

SpannableText.getText = function(self)
    return self.m_str;
end

SpannableText.dtor = function(self)
    
end

---------------------------------private functions-----------------------------------------

SpannableText.clean = function(self)
    -- body
    self:removeAllChildren(true);
    self.m_styleMap = {};
    self.m_str = "";
end

SpannableText.refresh = function(self)
    --此处将刷新界面    
    table.sort(self.m_styleMap, function(a, b)
        if a and b then
            return number.valueOf(a.s) < number.valueOf(b.s);
        end
    end);
    local str = self.m_str;
    local resMap = {};
    local disP = 0;
    for k,v in pairs(self.m_styleMap) do
        if v then
            local totalCount = string.count(str);
            local s = v.s - disP;
            local e = v.e - disP;
            if s > totalCount then
                break;
            end
            disP = v.e;
            local strB = "";
            local strC = "";
            if s > 1 then     
                strB = string.subUtfStr(str, 1, s);
                strC = string.subUtfStr(str, s + 1, (e - s + 1));
            else
                strC = string.subUtfStr(str, s, (e - s + 1));
            end
            local strE = string.subUtfStr(str, e + 1, (totalCount - e + 1));
            
            if not string.isEmpty(strB) then
                local tmp = {};
                tmp.str = strB;
                tmp.r = self.m_defaultR;
                tmp.g = self.m_defaultG;
                tmp.b = self.m_defaultB;
                table.insert(resMap, tmp);
            end
            if not string.isEmpty(strC) then
                local tmp = {};
                tmp.str = strC;
                tmp.r = v.r;
                tmp.g = v.g;
                tmp.b = v.b;
                table.insert(resMap, tmp);
            end
            if string.isEmpty(strE) then
                break;
            else
                str = strE;
            end
        end
    end
    self:removeAllChildren(true);
    local x = 0;
    local childMap = {};
    for k,v in pairs(resMap) do
        if v then
            local stc = new(SpannableTextCell, v.str, nil, nil, kAlignLeft, nil, self.m_fontSize, v.r, v.g, v.b);
            local w,h = stc:getSize();
            self:addChild(stc);
            local tmp = {};
            tmp.x = x
            tmp.view = stc;
            x = x + w;
            table.insert(childMap, tmp);
        end
    end
    local dis = 0;
    local w,h = self:getSize();
    if self.m_align == kAlignLeft or self.m_align == kAlignTopLeft then

    elseif self.m_align == kAlignRight or self.m_align == kAlignTopRight then

    elseif self.m_align == kAlignCenter then
        dis = (x - w)/2
    end

    for k,v in pairs(childMap) do
        if v and v.view then
            v.view:setPos(v.x - dis);
        end
    end
end

SpannableText.convert2SafeString = function(self, str)
    str = (str == "" or not str) and " " or str;
    return str;
end

SpannableText.convert2SafePlatformString = function(self, str)
	str = (str == "" or not str) and " " or str;
	local platformStr = GameString.convert2Platform(str);
	platformStr = (platformStr == "" or not platformStr) and " " or platformStr;

	return platformStr;
end		


SpannableTextCell = class(DrawingImage,false);

SpannableTextCell.ctor = function(self, str, width, height, align, fontName, fontSize, r, g, b)
    self.m_str = str;
    local platformstr = SpannableTextCell.convert2SafePlatformString(self, str);

    width = width or 0;
    height = height or 0;
    
    self.m_res = new(ResText,platformstr,width,height,align,fontName,fontSize,r,g,b,kTextSingleLine);
    super(self,self.m_res);
end

SpannableTextCell.convert2SafePlatformString = function ( self, str )
    str = (str == "" or not str) and " " or str;
    local platformStr = GameString.convert2Platform(str);
    platformStr = (platformStr == "" or not platformStr) and " " or platformStr;

    return platformStr;
end

SpannableTextCell.dtor = function(self)
    delete(self.m_res);
    self.m_res = nil;
end
