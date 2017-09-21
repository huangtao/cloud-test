--时间轴动画 

--[[
	用法示例：
	local tl = new(Timeline,onComplete,...); -- onComplete 是可选参数

	local anim_1 = new(TimelineAnim,target,160,delay);  --创建一个动画，可设置移动、透明度、缩放、旋转属性变化
	anim_1:setMove(lx,ly - 24);
	anim_1:setAlpha(0,0.7);

	local anim_2 = new(TimelineAnim,target,100);
	anim_2:setMove(lx,ly);
	anim_1:setAlpha(0.7,1.0);

	tl:append(anim_1); --添加到队列中
	tl:append(anim_2);
	
	tl:play(); --启动动画

	移除Timeline 只需要调用 tl:stop() 再 delete(tl) 即可
]]--
require("util/timelineAnim");
Timeline = class();

Timeline.ctor = function(self,onComplete,...)
	self.animList = {};
	self.index = 1;
	self.completeFunc = onComplete;
	self.completeParams = arg;
end

Timeline.dtor = function(self)
	self.animList = nil;
	self.completeFunc = nil;
	self.completeParams = nil;
end

--this param:anim accept TimelineAnim type only
Timeline.append = function(self,anim)
	table.insert(self.animList,anim);
end

Timeline.play = function(self)
	local anim = self.animList[self.index];
	if not anim then
		return;
	end
	anim:create();
	anim:getEventListener():setEvent(self,self.onComplete);
	local propArr = anim:getPropArr();
	for i = 1,#propArr do
		local prop = propArr[i];
		anim:getTarget():addProp(prop,prop.m_propID);
	end
end

Timeline.onComplete = function(self)
	self:stop();
	if self.index == #self.animList then
		if self.completeFunc ~= nil then
			if self.completeParams ~= nil then
				self.completeFunc(unpack(self.completeParams));
			else
				self.completeFunc();
			end
			self:dtor();
		end
	else
		self.index = self.index + 1;
		self:play();
	end
end

Timeline.stop = function(self)
	if self.animList then
		local anim = self.animList[self.index];
		if anim ~= nil then
			local propArr = anim:getPropArr();
			local target = anim:getTarget();
			anim:onEndAnim();
			--local endPos = anim:getEndPos();
			if target ~= nil then
				
				for i = 1,#propArr do
					local prop = propArr[i];
					target:removeProp(prop.m_propID);
					delete(prop);
				end
			end

			anim:dtor();
		end
	end
end