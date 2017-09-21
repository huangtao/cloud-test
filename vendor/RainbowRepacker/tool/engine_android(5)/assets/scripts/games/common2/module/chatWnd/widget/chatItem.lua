--[[
	文字聊天
]]

local ChatItem = class(Node);

ChatItem.ctor = function(self,name,text,maxWidth,isMySelf)
	local bgFile = isMySelf and "games/common/chat/chat_bg_r.png" or "games/common/chat/chat_bg_l.png";
	text = text or "";
	local str = text;
	if name then
		str = name .. " : " .. text;
	end
	local r,g,b =142,92,31;
    local textView = UIFactory.createText(str,28,0,0,kAlignLeft,r,g,b);
    if textView:getSize() > maxWidth - 15*2 then
    	delete(textView);
    	textView = nil;
		textView = UIFactory.createTextView(str,28,(maxWidth - 15*2),0,kAlignLeft,r,g,b);
	end
	local w,h = textView:getSize();
	self:setSize(w+15*5,h+15*4);
	local align = isMySelf and kAlignTopRight or kAlignTopLeft;
	local bg = UIFactory.createImage(bgFile,nil,nil,20,20,30,20);
	bg:setSize(w+15*4,h+15*3);
	bg:setAlign(kAlignCenter);	
	bg:addChild(textView);
	textView:setAlign(kAlignCenter);
	self:addChild(bg);
end

return ChatItem;