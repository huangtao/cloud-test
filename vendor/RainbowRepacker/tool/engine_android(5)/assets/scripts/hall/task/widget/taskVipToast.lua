local taskVipToastLayout = require(HallViewPath.."task/taskVipToastLayout");
require("common/commonGameLayer");

TaskVipToast = class(CommonGameLayer,false);

TaskVipToast.showToast = function(data)
	TaskVipToast.hide();
	TaskVipToast.s_instance = new(TaskVipToast, data);
	TaskVipToast.s_instance:addToRoot();
end

TaskVipToast.hide = function()
	delete(TaskVipToast.s_instance);
	TaskVipToast.s_instance = nil;
end


TaskVipToast.s_controls =
{
	bg = 1,
	text = 2,
	bg1 = 3,
	text1 = 4,
}

TaskVipToast.ctor = function(self,data)
	super(self,nil);
	self.m_ctrls = TaskVipToast.s_controls;
	self.m_data = data;
	self:addToRoot();
	self:setSize(1280, 800);
	self:setAlign(kAlignCenter);
	self:setFillParent(true, true);
	self:setLevel(199);
	self:init();
end

TaskVipToast.dtor = function(self)
	delete(self.animTimer);
	self.animTimer = nil;
	delete(self.animTimerJishi);
	self.animTimerJishi = nil;
	self.m_data = nil;
end

TaskVipToast.findViews = function(self)
	self.m_bg = self:findViewById(self.m_ctrls.bg);
	self.m_text = self:findViewById(self.m_ctrls.text);
	self.m_bg1 = self:findViewById(self.m_ctrls.bg1);
	self.m_text1 = self:findViewById(self.m_ctrls.text1);
end

TaskVipToast.init = function(self)
	self:onTimerJishi();
	self.m_itemArray = {};
	self.m_itemCount = 0;
	for k,v in pairs(self.m_data) do
		local item = SceneLoader.load(taskVipToastLayout);
		self:addChild(item);
		item:getChildByName("bg"):getChildByName("text"):setText(v);
		item:setVisible(false);
		table.insert(self.m_itemArray, item);
		self.m_itemCount = self.m_itemCount + 1;
	end
	self:play();
end

TaskVipToast.play = function(self)
	
	local animDelay = 1500;
	if self.m_itemCount == 1 then
		if self.m_itemArray[1] then
			self.m_itemArray[1]:setPos(0, 0);
			self.m_itemArray[1]:setAlign(kAlignCenter);
			self.m_itemArray[1]:setVisible(true);
		end
	else
		self.m_curItemIndex = 1;
		self:onTimer();
		self.animTimer = AnimFactory.createAnimInt(kAnimRepeat, 0, 1, 400, -1);
	self.animTimer:setDebugName("TaskVipToast.animTimer");
	self.animTimer:setEvent(self,self.onTimer);
		animDelay = 400 * (self.m_itemCount - 1) + 800;
	end
	self.animTimerJishi = AnimFactory.createAnimInt(kAnimNormal, 0, 1, animDelay, -1);
	self.animTimerJishi:setDebugName("TaskVipToast.animTimerJishi");
	self.animTimerJishi:setEvent(self,self.onTimerJishi);
end

TaskVipToast.onTimer = function(self)
	local item = self.m_itemArray[self.m_curItemIndex];
	if item then
		item:setPos(0, 15);
		item:setAlign(kAlignCenter);
		item:setVisible(true);
		local anim = item:addPropTranslate(1, kAnimNormal, 700, 0, 0, 0, 0, -100)
		if anim then
			anim:setDebugName("TaskVipToast.onTimer");
			local data = {};
			data.obj = self;
			data.view = item;
			anim:setEvent(data, self.onItemAnimOver);
		end
		self.m_curItemIndex = self.m_curItemIndex + 1;
	else

	end
	if self.m_curItemIndex > self.m_itemCount then
		self:onTimerStop();
	end
end

TaskVipToast.onItemAnimOver = function(data)
	-- body
	local self = data.obj;
	local view = data.view;
	if self and view then
		-- view:removeProp(1);
		view:setVisible(false);
	end
end

TaskVipToast.onTimerStop = function(self)
	delete(self.animTimer);
	self.animTimer = nil;
end

TaskVipToast.onTimerJishi = function(self)
	-- body
	delete(self.animTimer);
	self.animTimer = nil;
	delete(self.animTimerJishi);
	self.animTimerJishi = nil;
	self:removeAllChildren(true);
	TaskVipToast.hide();
end

TaskVipToast.s_controlConfig = 
{
	-- [TaskVipToast.s_controls.bg] = {"bg"};
	-- [TaskVipToast.s_controls.text] = {"bg","text"};
	-- [TaskVipToast.s_controls.bg1]={"bg1"};
	-- [TaskVipToast.s_controls.text1]={"bg1","text1"};
}