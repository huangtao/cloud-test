require("ui/toast");

Toast.s_defaultSheildBgImage = "hall/common/bg_blank.png";


Toast.setDefaultImage = function(bgImg,sheildBgImg)
	Toast.s_defaultBgImage = bgImg or Toast.s_defaultBgImage;
	Toast.s_defaultSheildBgImage = sheildBgImg or Toast.s_defaultSheildBgImage;
end 

Toast.showText = function(self, str, width, height, align, fontName, fontSize, r, g, b , x, y , isShowForever)
	local view = new(Text,str,width,height,align or kAlignLeft,
		fontName or Toast.s_fontName,fontSize or Toast.s_fontSize,
		r or Toast.s_r,g or Toast.s_g,b or Toast.s_b);
    view:setName("toast");
	local w,h = view:getSize();
	bg = self:loadTextBg(w,h);
	bg:addChild(view);
	view:setAlign(kAlignCenter);

	bg:setPos(x , y);

	if isShowForever then
		Toast.showForever(self , bg);
	else
	Toast.show(self,bg);
end
end



Toast.showTextView = function(self, str, width, height, align, fontName, fontSize, r, g, b,x, y)
	local view = new(TextView,str,width,height,align,fontName,fontSize,r,g,b);
	view:setName("toast");
	bg = self:loadTextBg(width, height);
	bg:addChild(view);
	view:setAlign(kAlignCenter);
	bg:setPos(x,y);
	
	Toast.show(self,bg);
end

Toast.showSheildText = function(self,str, width, height, align, fontName, fontSize, r, g, b)
	local view = self:loadText(str, width, height, align, fontName, fontSize, r, g, b);
	local sheildBg = self:loadSheild();

	sheildBg:addChild(view);
	view:setAlign(kAlignCenter);

	Toast.show(self,sheildBg);
end 

Toast.showSheildTextView = function(self, str, width, height, align, fontName, fontSize, r, g, b)
	local view = self:loadTextView(str,width,height,align,fontName,fontSize,r,g,b);

	local sheildBg = self:loadSheild();
	sheildBg:addChild(view);
	view:setAlign(kAlignCenter);

	Toast.show(self,sheildBg);
end 

Toast.showSheildView = function(self,viewType, ...)
	if not (viewType and self.m_typeMap[viewType]) then
		Toast.hidden(self);
		return;
	end

	local view = self.m_typeMap[viewType](...);
	local sheildBg = self:loadSheild();
	sheildBg:addChild(view);
	view:setAlign(kAlignCenter);
	Toast.show(self,sheildBg);
end 

------------------------ private ---------------------------------------------------------
Toast.show = function(self, view)
	Toast.hidden(self);

	if not view then
		return;
	end

	self.m_view = view;
	local __levelConfig = require("isolater/widget/globalLayerLevelConfig");
    local __level = 199;  ---历史==199
    if type(__levelConfig.Toast) == 'number' then
        __level = __levelConfig.Toast;
    end
	self.m_view:setLevel(__level);
	self.m_view:addToRoot();
	self.m_view:setAlign(kAlignCenter);
	Toast.startTimer(self);
end

Toast.showForever = function(self , view)
	Toast.hidden(self);

	if not view then
		return;
	end

	self.m_view = view;
	local __levelConfig = require("isolater/widget/globalLayerLevelConfig");
    local __level = 199;  ---历史==199
    if type(__levelConfig.Toast) == 'number' then
        __level = __levelConfig.Toast;
    end
	self.m_view:setLevel(__level);
	self.m_view:addToRoot();
	self.m_view:setAlign(kAlignCenter);
end

Toast.loadText = function(self, str, width, height, align, fontName, fontSize, r, g, b)
	local textStr = new(Text,str,width,height,align or kAlignLeft,
		fontName or Toast.s_fontName,fontSize or Toast.s_fontSize,
		r or Toast.s_r,g or Toast.s_g,b or Toast.s_b);

	local w,h = textStr:getSize();
	local view = self:loadTextBg(w,h);
	view:addChild(textStr);
	textStr:setAlign(kAlignCenter);

	return view;
end 

Toast.loadTextView = function(self, str, width, height, align, fontName, fontSize, r, g, b)
	local textStr = new(TextView,str,width,height,align,fontName,fontSize,r,g,b);
	local view = self:loadTextBg(width, height);
	view:addChild(textStr);
	textStr:setAlign(kAlignCenter);

	return view;
end 

Toast.loadSheild = function(self)
	local sheildBg = new(Image,Toast.s_defaultSheildBgImage);
	sheildBg:setSize(System.getScreenScaleWidth(),System.getScreenScaleHeight());
	sheildBg:setEventTouch(nil,function()
	end);

	return sheildBg;
end


local autoCaclText_X = function(oldX , width , text )
	local text_width , text_height = text:getSize();
	local newX = oldX + text_width;

	return newX , width + text_width , text_height;
end
Toast.createColorTextView = function(self , strInfoTable,fontName , fontSize)
	-- local view = self:loadTextBg(0,0);
	local view = new(Node);

	local x , y = 0 ,0;
	local width , height = 0 , 0;

	for k , v in ipairs(strInfoTable) do
		local tmpText = new(Text , v[1] , 0 , 0 , kAlignLeft ,  fontName or Toast.s_fontName,fontSize or Toast.s_fontSize
						 , v[2] or Toast.s_r , v[3] or Toast.s_g, v[4] or Toast.s_b );
		view:addChild(tmpText);
		tmpText:setAlign(kAlignLeft);
		tmpText:setPos(x , nil);

		x , width , height = autoCaclText_X(x ,width , tmpText);
	end

	view:setAlign(kAlignCenter);
	view:setSize(width , height);

	return view,width,height;
end

--[[
strInfoTable = {
	{text , r , g , b},
} 
--]]
Toast.showColorText = function(self,strInfoTable,fontName,fontSize,x,y)
	local view,w,h = self:createColorTextView(strInfoTable,fontName,fontSize);

	local bg = self:loadTextBg(w,h);
	bg:addChild(view);
	bg:setAlign(kAlignCenter);
	bg:setPos(x,y)
	Toast.show(self , bg);
end

Toast.setDefaultImageGridSpace = function(leftWidth, rightWidth, topWidth, bottomWidth)
	Toast.s_leftWidth = leftWidth;
	Toast.s_rightWidth = rightWidth;
	Toast.s_topWidth = topWidth;
	Toast.s_bottomWidth = bottomWidth;
end

Toast.loadTextBg = function(self,w,h)
	local bg = new(Image,Toast.s_defaultBgImage,nil,nil,Toast.s_leftWidth or 25,Toast.s_rightWidth or 25,Toast.s_topWidth or 0,Toast.s_bottomWidth or 0);
	-- local bg_w,bg_h = bg:getSize();
	local bg_w,bg_h = 450,60;
	local tempW,tempH = w+Toast.s_defaultSpaceW*2,h+Toast.s_defaultSpaceH*2;

	bg_w = tempW > bg_w and tempW or bg_w;
	bg_h = tempH > bg_h and tempH or bg_h;
	bg:setSize(bg_w,bg_h);

	return bg;
end