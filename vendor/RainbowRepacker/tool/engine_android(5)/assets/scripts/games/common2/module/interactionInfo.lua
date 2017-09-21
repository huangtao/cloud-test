--[[
	记录跨功能模块需要的相关信息
]]

InteractionInfo = class()

InteractionInfo.getInstance = function()
	if not InteractionInfo.s_instance then
		InteractionInfo.s_instance = new(InteractionInfo);
	end
	return InteractionInfo.s_instance;
end

InteractionInfo.releaseInstance = function()
	delete(InteractionInfo.s_instance);
	InteractionInfo.s_instance = nil;
end

InteractionInfo.ctor = function(self)
	self.m_headPos = {};
	self.m_headSize = {};
	self.m_headAbsolutPos = {};
	self.m_playerInfoSize = {};
	self.m_headImg = {};
	self.m_headArea = {};
end

InteractionInfo.dtor = function(self)

end

InteractionInfo.reset = function(self,seat)
	self.m_headPos[seat] = nil;
	self.m_headSize[seat] = nil;
	self.m_headAbsolutPos[seat] = nil;
	self.m_playerInfoSize[seat] = nil;
	self.m_headImg[seat] = nil;
	self.m_headArea[seat] = nil;
end

-------------------------------- head --------------------------------
-- 绝对位置
InteractionInfo.setHeadAbsolutePos = function(self,seat,_x,_y)
	self.m_headAbsolutPos[seat] = {x=_x,y=_y};
	local info = GamePlayerManager2.getInstance():getPlayerBySeat(seat);
    if info then
    	local action = GameMechineConfig.ACTION_NS_REFRESH_HEADPOS;
	    MechineManage.getInstance():receiveAction(action,seat,info:getMid());
	end
end

InteractionInfo.getHeadAbsolutePos = function(self,seat)
	local pos = self.m_headAbsolutPos[seat];
	if pos then
		local x = pos.x;
		local y = pos.y;
		return x,y;
	end
	return 0,0;
end

-- 设置头像位置
InteractionInfo.setHeadPos = function(self,seat,_x,_y)
	self.m_headPos[seat] = {x=_x,y=_y};
end

InteractionInfo.getHeadPos = function(self,seat)
	local pos = self.m_headPos[seat];
	if pos then
		local x = pos.x;
		local y = pos.y;
		return x,y;
	end
	return 0,0;
end

-- 设置头像大小
InteractionInfo.setHeadSize = function(self,seat,_w,_h)
	self.m_headSize[seat] = {w=_w,h=_h};
end

InteractionInfo.getHeadSize = function(self,seat)
	local size = self.m_headSize[seat];
	if size then
		local w = size.w;
		local h = size.h;
		return w,h;
	end
	return 106,104;
end

-- 设置个人信息弹框的大小
InteractionInfo.setPlayerInfoSize = function(self,_w,_h)
	self.m_playerInfoSize = {w=_w,h=_h};
end

InteractionInfo.getPlayerInfoSize = function (self)
	-- body
	return self.m_playerInfoSize.w or 0,self.m_playerInfoSize.h or 0;
end

-- 设置头像的区域
-- 设置的整个头像的绝对坐标、头像名字等整个区域的大小
InteractionInfo.setHeadArea = function(self,seat,x,y,w,h)
	self.m_headArea[seat] = self.m_headArea[seat] or {};
	local pos = { x = (x or 0), y = (y or 0) };
	local size = { w = (w or 0), h = (h or 0) };
	self.m_headArea[seat].pos = pos;
	self.m_headArea[seat].size = size;
end

InteractionInfo.getHeadArea = function (self,seat)
	return self.m_headArea[seat];
end

-- 获取表情动画播放的位置
InteractionInfo.getChatFaceAnimPos = function(self,seat)
	local x, y = self:getHeadAbsolutePos(seat);
	local w, h = self:getHeadSize(seat);
	local w1, h1 = 140,140;
	local sWidth =  System.getScreenScaleWidth();
	local sHeight = System.getScreenScaleHeight();
	if x < sWidth * 3 / 5 then
		rx = x + w;-- 头像右侧
	elseif x >= sWidth * 3 / 5 then
		rx = x - w/2;-- 头像像左侧
	end

	if y < sHeight / 3 then
		ry = y + h/2; -- 头像底部
	elseif y >= sHeight / 3 then
		ry = y - h/2;-- 头像顶部
	end
	return kAlignTopLeft,rx,ry;
end

-- 获取聊天动画播放的位置
InteractionInfo.getChatMsgAnimPos = function(self,seat)
	local x, y = self:getHeadAbsolutePos(seat);
	local w, h = self:getHeadSize(seat);
	local sWidth =  System.getScreenScaleWidth();
	local sHeight = System.getScreenScaleHeight();

	local isLeft = true;
	local isTop = true;
	local align = kAlignTopLeft;

	if x < sWidth * 3 / 5 then
		rx = x + 92;-- 头像右侧
		isLeft = false;
	elseif x >= sWidth * 3 / 5 then
		rx = x;-- 头像像左侧
	end

	if y < sHeight / 2 then
		ry = y + h; -- 头像底部
		isTop = false;
	elseif y >= sHeight / 2 then
		ry = y - (h*3)/4;-- 头像顶部
	end

	if isTop and not isLeft then -- 3
		align = kAlignLeft;
	elseif isTop and isLeft then -- 4
		align = kAlignBottomRight;
	elseif not isTop and not isLeft then -- 1
		align = kAlignTopLeft;
	elseif not isTop and isLeft then -- 2
		align = kAlignTopRight;
	end

	return align,rx,ry;
end

InteractionInfo.getPlayerInfoPos = function(self,seat)
	local rx = 0;
	local ry = 0;
	local w, h = self:getHeadSize(seat);
	local sWidth =  System.getScreenScaleWidth();
	local sHeight = System.getScreenScaleHeight();
	local pw = self.m_playerInfoSize.w or 761;
	local ph = self.m_playerInfoSize.h or 492;

	local x, y = self:getHeadAbsolutePos(seat);
	
	Log.d("HeadViewBase.onPlayerHeadClick, w, h", w, h);
	if x < sWidth / 3 then 
		rx = x + 92;
	elseif x >= sWidth / 3 and x <= sWidth * 2 / 3 then 
		rx = x - pw / 2 + w / 2;
	else 
		rx = x - pw;
	end

	if y < sHeight / 3 then 
		if x >= sWidth / 3 and x <= sWidth * 2 / 3 then
			ry = y + h;
		else 
			ry = y;
		end
	elseif y >= sHeight / 3 and y <= sHeight * 2 / 3 then 
		ry = y - ph / 2 + h / 2;
	else
		if x >= sWidth / 3 and x <= sWidth * 2 / 3 then
			ry = y - ph;
		else 
			ry = y - ph + h;
		end
	end
	local limitX = sWidth - pw;
	local limitY = sHeight - ph;

	rx = rx < 0 and 0 or rx;
	rx = rx > limitX and limitX or rx;
	ry = ry < 0 and 0 or ry;
	ry = ry > limitY and limitY or ry;

	return rx, ry;
	-- self:execDelegate(HeadViewBase.Delegate.onPlayerHeadClick, self.m_seat, rx, ry);
end

-- 设置头像位置
InteractionInfo.setHeadImagePath = function(self,seat,_path)
	self.m_headImg[seat] = {path = _path};
end

InteractionInfo.getHeadImagePath = function(self,seat)
	return self.m_headImg[seat] or "";
end

-- 获取实时对讲声音弹框位置，相对于GameHeadView
InteractionInfo.getChatVoicePos = function(self, seat)
	local x, y = self:getHeadAbsolutePos(seat);
	local w, h = self:getHeadSize(seat);
	local sWidth =  System.getScreenScaleWidth();
	local sHeight = System.getScreenScaleHeight();
	local interval = 0;
	local align = kAlignTopLeft;
	local isLeft = true;
	if x < sWidth * 3 / 5 then
		isLeft = true;
	elseif x >= sWidth * 3 / 5 then
		isLeft = false;
	end

	if isLeft then
		align = kAlignTopLeft;
		return x + w + interval, y + 20, kAlignTopLeft;
	else 
		align = kAlignTopRight;
		return sWidth - x + interval, y + 20, kAlignTopRight;
	end
end

-- 获取实时对讲声音弹框位置，相对于GameHeadView
InteractionInfo.getChatVoicePosNew = function(self, seat)
	local headArea = self:getHeadArea(seat);
	if headArea and headArea.pos and headArea.size then
		local x, y = headArea.pos.x, headArea.pos.y;
		local w, h = headArea.size.w, headArea.size.h;
		local sWidth =  System.getScreenScaleWidth();
		local sHeight = System.getScreenScaleHeight();
		if x + w + 120 > sWidth then
			return (sWidth - x), y + 20, kAlignTopRight;
		else
			return x + w, y + 20, kAlignTopLeft;
		end
	else
		return self:getChatVoicePos(seat);
	end
end
-------------------------------- head --------------------------------