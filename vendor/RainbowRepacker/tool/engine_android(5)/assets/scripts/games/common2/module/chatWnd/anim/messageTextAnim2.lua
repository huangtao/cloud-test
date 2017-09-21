
--[[
	快捷聊天动画播放
]]
MessageTextAnim2 = class(Node);

MessageTextAnim2.ctor = function(self)
	self:setSize(1280, 80);
	self.itemViewMap = {};
	self.itemDelayAnimMap = {};
end

MessageTextAnim2.play = function(self, str, x, y, align, sex, chatConfig,seat)
	self:release();
	local index = 1;
	if align == kAlignTopLeft or align == kAlignTop then
		index = 1;
	elseif align == kAlignTopRight then
		index = 2;
	elseif align == kAlignLeft or align == kAlignBottomLeft or align == kAlignBottom then
		index = 3;
	elseif align == kAlignRight or align == kAlignBottomRight then
		index = 4;
	end
	local msgTextView = self:getItemView(index);
	msgTextView:setVisible(true);
	msgTextView:setText(str);

	self:addItemDelayAnim(index);

	local w, h = msgTextView:getSize();
	local _x,_y = self:checkPosXY(x,y,w,h,index)

	self:setPos(_x,_y);
	self:setSize(w,h);
	self:setAlign(kAlignTopLeft);

	self.chatConfig = chatConfig;
	local sound = self:getSound(str, sex);
	if sound then
		kEffectPlayer:play(sound);
	end
end

MessageTextAnim2.checkPosXY = function(self,x,y,w,h,index)
	if h > 70 then -- 超过一行
		if index == 3 or index == 4 then
			y = y - (h - 70);
		end
	end
	if index == 2 or index == 4 then
		x = x - w;
	end
	local screenH = System.getScreenScaleHeight();
	x = (x < 0) and 20 or x;
	y = (y + h > screenH) and (screenH - h - 30) or y;
	return x,y;
end

-- 根据性别和内容获取对应的语音文件
MessageTextAnim2.getSound = function(self, str, sex)
	-- body
	if table.isEmpty(self.chatConfig) then
		return nil;
	end
	local index = 0;
	local td = self.chatConfig.text;
	if table.isEmpty(td) then
		return nil;
	end
	for k,v in pairs(td) do 
		if v == str then
			index = k;
			break;
		end
	end

	if index <= 0 then
		return nil;
	end
	local strsex = UserBaseInfoIsolater.getInstance():checIsFemale(sex) and "W" or "M";
	return self.chatConfig.effectMap[string.format("%s%d%s",self.chatConfig.effectStr, index, strsex)]; 
end


MessageTextAnim2.getItemView = function(self,index)
	-- body
	if not self.itemViewMap[index] then
		self.itemViewMap[index] = new(MessageTextAnimItem, index);
		self:addChild(self.itemViewMap[index]);
	end
	return self.itemViewMap[index];
end

MessageTextAnim2.addItemDelayAnim = function(self,index)
	-- body
	delete(self.itemDelayAnimMap[index]);
	self.itemDelayAnimMap[index] = nil;

	local anim = AnimFactory.createAnimInt(kAnimNormal,1.0,0.0, 1500);
	anim:setDebugName(string.concat("AnimInt|MessageTextAnim2.addItemDelayAnim", index));
	anim:setEvent({obj = self,index = index}, self.onItemDelayOver);
	self.itemDelayAnimMap[index] = anim;
end

MessageTextAnim2.onItemDelayOver = function(obj)
	self = obj.obj;
	delete(self.itemDelayAnimMap[obj.index]);
	self.itemDelayAnimMap[obj.index] = nil;

	local itemView = self:getItemView(obj.index);
	itemView:setVisible(false);
end

MessageTextAnim2.stop = function(self)

end 

MessageTextAnim2.release = function(self)
	self:stop();
	for k, v in pairs(self.itemDelayAnimMap) do
		delete(v);
		v = nil;
	end

	for k,v in pairs(self.itemViewMap) do
		self:removeChild(v, true);
		delete(v);
		v = nil;
	end

	self.itemDelayAnimMap = {};
	self.itemViewMap = {};
end

--[[
	消息的itemView
]]
MessageTextAnimItem = class(Node);

MessageTextAnimItem.BG_MAP = {
	[1] = "games/common/chat/chat_bubble_l2.png";
	[2] = "games/common/chat/chat_bubble_r2.png";
	[3] = "games/common/chat/chat_bubble_l1.png";
	[4] = "games/common/chat/chat_bubble_r1.png";	
};

--最小w = 100，h = 70
--最大w = 350, h = 120
MessageTextAnimItem.ctor = function(self, index)
	local file = MessageTextAnimItem.BG_MAP[index];
	local fmt = 0;
	local filter = 0;
	local leftWidth, rightWidth, topWidth, bottomWidth = 20,20,20,20;
	self.m_bg = UIFactory.createImage(file, fmt, 0, leftWidth, rightWidth, topWidth, bottomWidth);
	self.m_textView = new(NewTextView, 320, 0, kAlignTopLeft, "", 26, 143, 92, 31);

	self:setSize(self.m_bg:getSize());
	self:addChild(self.m_bg);	
	self:addChild(self.m_textView);
	self.m_textView:setAlign(kAlignCenter);
	if index == 1 then
		self.m_textView:setPos(1,-3);
	elseif index == 2 then
		self.m_textView:setPos(-1,0);
	elseif index == 3 then
		self.m_textView:setPos(1,-3);
	elseif index == 4 then
		self.m_textView:setPos(0,-3);
	end
end

MessageTextAnimItem.setText = function(self, str)
	-- body
	self.m_textView:setText(str);

	local w, h = self.m_textView:getSize();

	local rW, rH = w, h;
	if w >= 320 then
		rW = 320 + 40;
	elseif w <= 90 then
		rW = 90 + 40; 
	else
		rW = w + 40;
	end

	if h > 200 then
		rH = 200 + 40;
	elseif h < 30 then
		rH = 30 + 40;
	else
		rH = h + 40;
	end
	self.m_bg:setSize(rW, rH);
	self:setSize(rW, rH);
end

MessageTextAnimItem.dtor = function(self)
end