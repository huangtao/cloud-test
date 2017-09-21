---- UICreator.lua
-- Date: 2013-09-11
-- Last modification : 2013-09-11
-- Description: wrapper for create UI item

require("core/global");
require("core/constants");
require("core/object");
require("core/res");
require("core/anim");
require("core/prop");
require("core/drawing");
require("ui/image");
require("ui/images");
require("ui/text");
require("ui/textView");
require("ui/button");

UICreator = {};
UICreator.revisePos = function (x,y)
    x = x or 0;
    y = y or 0;
    --x = x*kPosScaleX;
   -- y = y*kPosScaleY;
	return x,y;
end
UICreator.createImg = function ( imgDIr, x, y )
    if imgDIr == nil then
    	imgDIr = "";
    end  
    x,y = UICreator.revisePos(x,y);
	local img = new(Image , imgDIr);
	img:setVisible(true);
	img:setPos(x or 0 , y or 0);
	return img;
end

UICreator.createImgContainsWH = function(imgDir,x,y,w,h)
	local img = UICreator.createImg(imgDir,x,y);
	img:setSize(w,h);
	return img;
	-- body
end
UICreator.createBtn = function ( imgDir, x, y, obj, func)
	local btn = new( Button, imgDir );
	x,y = UICreator.revisePos(x,y);
	btn:setPos( x, y);
	if func then
		btn:setOnClick(obj,func);
	end
	return btn;
end

UICreator.createTextBtn = function ( imgDir, x, y, str, fontSize, r, g, b)
	str = GameString.convert2Platform(str);
	local btn = new( Button, imgDir );
	x,y = UICreator.revisePos(x,y);
	btn:setPos( x, y);
	local text = UICreator.createText(str, 0, 0, btn.m_width, btn.m_height, kAlignCenter, fontSize, r, g, b);
	btn:addChild(text);
	return btn, text;
end

UICreator.createBtn2 = function ( imgDir, disableImgDir, x, y, obj, func)
	local btn = new( Button, imgDir, disableImgDir );
	x,y = UICreator.revisePos(x,y);
	btn:setPos( x, y);
	if func then
		btn:setOnClick(obj,func);
	end
	return btn;
end

UICreator.createText = function ( str, x, y, width,height, align ,fontSize, r, g, b )
	text = GameString.convert2Platform(text);
	local text = new( Text, str, width, height, align, nil, fontSize, r, g, b);
	x,y = UICreator.revisePos(x,y);
	text:setPos( x, y);
	return text;
end