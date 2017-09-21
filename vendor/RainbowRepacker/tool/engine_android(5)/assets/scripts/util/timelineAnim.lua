--require("timeline/timelineBase");
TLAType = {
	Move = 1,    --位移
	Alpha = 2, --透明度
	Scale = 3,        --缩放
	Rotate = 4,       --旋转
	-- Color = 5,        --变色
	-- Clip = 6,         --剪辑
}

TimelineAnim = class();

function TimelineAnim.ctor(self,target,duration,delay)
	self.m_target = target;
	self.m_duration = duration;
	self.m_delay = delay;

	self.m_valueMap = {};

	self.m_eventListener = nil;
	self.m_propArr = {};
	self.m_animArr = {};
	self.m_endFuncArr = {};
	target = nil;
end

function TimelineAnim.dtor(self)
	for i = 1,#self.m_animArr do
		delete(self.m_animArr[i]);
		self.m_animArr[i] = nil;
	end
	self.m_animArr = {};

	self.m_propArr = {};
	self.m_endFuncArr = {};
	self.m_valueMap = {};
	self.m_endFuncArr = {};
	self.m_eventListener = nil;
end

function TimelineAnim.setMove(self,endX,endY,animType)
	self.m_valueMap[TLAType.Move] = {endX,endY,animType};
end

function TimelineAnim.setAlpha(self,startValue,endValue,animType)
	self.m_valueMap[TLAType.Alpha] = {startValue,endValue,animType};
end

function TimelineAnim.setScale(self,startX,startY,endX,endY,animType,center,x,y)
	self.m_valueMap[TLAType.Scale] = {startX,startY,endX,endY,animType,center,x,y};
end

function TimelineAnim.setRotate(self,startRotate,endRotate,animType,center,x,y)
	self.m_valueMap[TLAType.Rotate] = {startRotate,endRotate,animType,center,x,y};
end

function TimelineAnim.create(self)
	for k,v in pairs(self.m_valueMap) do
		if TimelineAnim.typeCreatFuncMap[k] then
			TimelineAnim.typeCreatFuncMap[k](self,unpack(v));
		end
	end
end

function TimelineAnim.createMove(self,endX,endY,animType)
	local startX,startY = self.m_target:getPos();
	local dx = (endX - startX) * System.getLayoutScale();
	local dy = (endY - startY) * System.getLayoutScale();
	local animsX = new(AnimDouble,animType or kAnimNormal,0,dx,self.m_duration,self.m_delay or 0);
	local animsY = new(AnimDouble,animType or kAnimNormal,0,dy,self.m_duration,self.m_delay or 0);
	table.insert(self.m_animArr,animsX);
	table.insert(self.m_animArr,animsY);
	local prop = new(PropTranslate,animsX,animsY);
	table.insert(self.m_propArr,prop);
	if self.m_eventListener == nil then
		self.m_eventListener = animsX;
	end

	function endAnim(target,endX,endY)
		target:setPos(endX,endY);
	end

	table.insert(self.m_endFuncArr,{func = endAnim,params = {self.m_target,endX,endY}});
end

function TimelineAnim.createAlpha(self,startValue,endValue,animType)
	self.m_target:setTransparency(1);
	local anim = new(AnimDouble,animType or kAnimNormal,startValue,endValue,self.m_duration,self.m_delay or 0);
	table.insert(self.m_animArr,anim);
	local prop = new(PropTransparency,anim);
	table.insert(self.m_propArr,prop);
	if self.m_eventListener == nil then
		self.m_eventListener = anim;
	end
end

function TimelineAnim.createScale(self,startX,startY,endX,endY,animType,center,x,y)
	local animsX = new(AnimDouble,animType or kAnimNormal,startX,endX,self.m_duration,self.m_delay or 0);
	local animsY = new(AnimDouble,animType or kAnimNormal,endX,endY,self.m_duration,self.m_delay or 0);
	table.insert(self.m_animArr,animsX);
	table.insert(self.m_animArr,animsY);
	local prop = new(PropScale,animsX,animsY,center, x, y);
	table.insert(self.m_propArr,prop);
	if self.m_eventListener == nil then
		self.m_eventListener = animsX;
	end
end

function TimelineAnim.createRotate(self,startRotate,endRotate,animType,center,x,y)
	local anim = new(AnimDouble,animType or kAnimNormal,startRotate,endRotate,self.m_duration,self.m_delay or 0);
	table.insert(self.m_animArr,anim);
	local prop = new(PropRotate,anim,center, x, y);
	table.insert(self.m_propArr,prop);
	if self.m_eventListener == nil then
		self.m_eventListener = anim;
	end
end

TimelineAnim.typeCreatFuncMap = {
	[TLAType.Move] = TimelineAnim.createMove;
	[TLAType.Alpha] = TimelineAnim.createAlpha;
	[TLAType.Scale] = TimelineAnim.createScale;
	[TLAType.Rotate] = TimelineAnim.createRotate;
}

function TimelineAnim.getDuration(self)
	return self.m_duration;
end

function TimelineAnim.getTarget(self)
	return self.m_target;
end

function TimelineAnim.getPropArr(self)
	return self.m_propArr;
end

function TimelineAnim.getAnimArr(self)
	return self.m_animArr;
end

function TimelineAnim.getEventListener(self)
	return self.m_eventListener;
end

function TimelineAnim.onEndAnim(self)
	for i = 1,#self.m_endFuncArr do
		local func = self.m_endFuncArr[i].func;
		local params = self.m_endFuncArr[i].params;
		func(unpack(params));
	end
end