
--[[
	toast消息队列，消息压栈。每次播放一条，间隔500ms后再播放队列中的下一条消息
]]


require("core/object");
require("ui/text");
require("core/anim");

ToastQueue = class();

local showText;
local loadTextBg;
local startShowToast;
local showNextToast;
local show;
local resetView;
local startTimer;
local stopTimer;
local onTimer;
local startIntervalTimer;
local stopIntervalTimer;
local onIntervalTimer;

ToastQueue.getInstance = function()
	if not ToastQueue.s_instance then 
		ToastQueue.s_instance = new(ToastQueue);
	end
	return ToastQueue.s_instance;
end

ToastQueue.releaseInstance = function()
	delete(ToastQueue.s_instance);
	ToastQueue.s_instance = nil;
end

ToastQueue.ctor = function(self)
	self.m_defaultDisplayTime = 1500;
	self.m_defaultIntervalTime = 500;
	self.m_defaultBgImage = "ui/toast_bg.png";
	self.m_defaultSpaceW = 20;
	self.m_defaultSpaceH = 10;
	self.m_listMsg = {};
	self.m_isShow = false;

end

showText = function(self, str, width, height, align, fontName, fontSize, r, g, b)
	local view = new(Text,str,width,height,align or kAlignLeft,
		fontName or self.m_fontName,fontSize or self.m_fontSize,
		r or self.m_r,g or self.m_g,b or self.m_b);

	local w,h = view:getSize();
	bg = loadTextBg(self,w,h);
	bg:addChild(view);
	view:setAlign(kAlignCenter);

	show(self,bg);
end

loadTextBg = function(self,w,h)
	local bg = new(Image,self.m_bgImage or self.m_defaultBgImage,nil,nil,25,25,0,0);
	local bg_w,bg_h = bg:getSize();
	local tempW,tempH = w+self.m_defaultSpaceW*2,h+self.m_defaultSpaceH*2;

	bg_w = tempW > bg_w and tempW or bg_w;
	bg_h = tempH > bg_h and tempH or bg_h;
	bg:setSize(bg_w,bg_h);

	return bg;
end


ToastQueue.dtor = function(self)
	self:reset();
end

startShowToast = function(self)
	if #self.m_listMsg > 0 and (not self.m_isShow) then
		self.m_isShow = true;
		local data = table.remove(self.m_listMsg,1);
		showText(self,data.str,data.width,data.height,data.align,data.fontName,data.fontSize,data.r,data.g,data.b);
	end
end

showNextToast = function(self)
	self.m_isShow = false;
	startShowToast(self);
end

show = function(self, view)
	if not view then
		showNextToast(self);
		return;
	end

	self.m_view = view;
	self.m_view:addToRoot();
	self.m_view:setAlign(kAlignCenter);
	startTimer(self);
end

resetView = function(self)
	if self.m_view then
		delete(self.m_view);
		self.m_view = nil;
	end
	self.m_displayTime = self.m_defaultDisplayTime;
	self.m_bgImage = self.m_defaultBgImage;
end

startTimer = function(self)
	stopTimer(self);
	local time = self.m_displayTime or self.m_defaultDisplayTime;
	self.m_timer = new(AnimDouble,kAnimNormal,0,1,time,-1);
	self.m_timer:setEvent(self,onTimer);
end

stopTimer = function(self)
	if self.m_timer then
		delete(self.m_timer);
		self.m_timer = nil;
	end
end

onTimer = function(self)
	resetView(self);
	stopTimer(self);
	startIntervalTimer(self);
end

-- 延迟500ms播放下一条
startIntervalTimer = function(self)
	stopIntervalTimer(self);
	local time = self.m_intervalTime or self.m_defaultIntervalTime;
	self.m_intervalDimer = new(AnimDouble,kAnimNormal,0,1,time,-1);
	self.m_intervalDimer:setEvent(self,onIntervalTimer);
end

stopIntervalTimer = function(self)
	if self.m_intervalDimer then
		delete(self.m_intervalDimer);
		self.m_intervalDimer = nil;
	end
end

onIntervalTimer = function(self)
	self.m_intervalTime = self.m_defaultIntervalTime;
	stopIntervalTimer(self);
	showNextToast(self);
end

--[[
	str：内容
	width、height：宽、高
	align：对齐方式
	fontName：字体
	fontSize：字体大小
	r,g,b：字体颜色
	millsecond：播放时长
	interval：间隔时长
	bgImg：背景图片
]]
ToastQueue.addToast = function(self, str, width, height, align, fontName, fontSize, r, g, b, millsecond, interval, bgImg)
	if string.isEmpty(str) then
		return;
	end
	self.m_displayTime = millsecond;
	self.m_intervalTime = interval;
	self.m_bgImage = bgImg;
	local data = {str = str, width = width, height = height, align = align, fontName = fontName, r = r, g = g, b = b};
	table.insert(self.m_listMsg,data);
	startShowToast(self);
end

ToastQueue.reset = function(self)
	stopTimer(self);
	stopIntervalTimer(self);
	resetView(self);
	self.m_listMsg = {};
	self.m_isShow = false;
end