require("core/constants");
require("core/object");
require("core/res");
require("ui/node");
require("core/gameString");

NewTextView = class(Node);

---------------------costruct function  -------------------------------------------------
--Parameters: 	width , height	   	-- the region to show
--				algin				-- the alignment of the text to show in the region
									-- It can be 	kAlignCenter=0
									--				kAlignTop=1
									--				kAlignTopRight=2
									--				kAlignRight=3
									--				kAlignBottomRight=4
									--				kAlignBottom=5
									--				kAlignBottomLeft=6
									--				kAlignLeft=7 
									--				kAlignTopLeft=8
--				fontName			-- the font name 
--				fontSize			-- the font size
--				r,g,b				-- the color of the text,
									-- it can be default one , (0,0,0)
--Return 	:   no return
-----------------------------------------------------------------------------------------
NewTextView.ctor = function(self, width, height, align, fontName, fontSize, r, g, b)
	self.m_realheight = tonumber(height) or 0;
	self.m_realWidth = tonumber(width) or 0;
	self.m_textAlign = align or kAlignTopLeft;
	self.m_fontName = fontName;
	self.m_fontSize = fontSize;
	self.m_r = r or 0;
	self.m_g = g or 0;
	self.m_b = b or 0;
	self.m_isAutoHeight = (self.m_realheight <= 0) and true or false;

	self.m_str = "";
	self:setSize(self.m_realWidth,self.m_realheight);
end

NewTextView.setFontColor = function(self, r, g, b)
	-- body
	self.m_r = r or 0;
	self.m_g = g or 0;
	self.m_b = b or 0;
	self:refresh();
end

NewTextView.setText = function(self, str)
	if type(str) == "table" then

	else
		self.m_str = self:convert2SafeString(str);
	end
	self:refresh();--重新绘制text
end

NewTextView.getText = function(self)
	return self.m_str;
end

NewTextView.dtor = function(self)
	delete(self.m_resText);
	self.m_resText = nil;
end

---------------------------------private functions-----------------------------------------

NewTextView.refresh = function(self)
	-- body
	self:clean();
	local platformstr = self:convert2SafePlatformString(self.m_str);
    local resTextSingle = new(ResText,platformstr,0, 0, self.m_textAlign,self.m_fontName, self.m_fontSize, self.m_r, self.m_g, self.m_b, kTextSingleLine);
    local sW, sH = resTextSingle.m_width, resTextSingle.m_height;
    local isUseChildW = false;
    if sW <= self.m_realWidth then
        self.m_resText = resTextSingle;
        isUseChildW = true;
    else
        delete(resTextSingle);
        resTextSingle = nil;
        self.m_resText = new(ResText,platformstr,self.m_realWidth, self.m_realheight, self.m_textAlign,self.m_fontName, self.m_fontSize, self.m_r, self.m_g, self.m_b, kTextMultiLines);
    end

	self.m_textDrawing = new(DrawingImage,self.m_resText)
	local drawingW,drawingH = self.m_textDrawing:getSize();
	local w,h = self.m_realWidth, self.m_realheight;
	if self.m_isAutoHeight then
		h = drawingH;
	end
    if isUseChildW then
        w = drawingW;
    end

	self.m_textDrawing:setClip(0,0,w,h);

	self:addChild(self.m_textDrawing);
	self:setSize(w, h);

	Log.d("NewTextView----总尺寸",self:getSize());
	Log.d("NewTextView----子尺寸",self.m_textDrawing:getSize());

end

NewTextView.clean = function(self)
	-- body
	delete(self.m_resText);
	self.m_resText = nil;

	delete(self.m_textDrawing);
	self.m_textDrawing = nil;
	
end

NewTextView.convert2SafeString = function(self, str)
	str = (str == "" or not str) and " " or str;
	return str;
end

NewTextView.convert2SafePlatformString = function(self, str)
	str = (str == "" or not str) and " " or str;
	local platformStr = GameString.convert2Platform(str);
	platformStr = (platformStr == "" or not platformStr) and " " or platformStr;

	return platformStr;
end		
