require("common/commonGameLayer");
local loadingView = require(ViewPath.."common/loadingView");
require("animation/animManager");
require("animation/animDef");
require("core/anim");


LoadingView = class();

LoadingView.s_defaultDisplayTime = 15000; -- millsecond 默认30秒自动关闭

LoadingView.getInstance = function()
	if not LoadingView.s_instance then 
		LoadingView.s_instance = new(LoadingView);
	end
	return LoadingView.s_instance;
end

LoadingView.releaseInstance = function()
	delete(LoadingView.s_instance);
	LoadingView.s_instance = nil;
end


LoadingView.ctor = function(self)
	
end

LoadingView.dtor = function(self)
	self:hidden();
end

LoadingView.setLevel = function(self, level)
	if self.m_view then
		self.m_view:setLevel(level);
	end
end

LoadingView.showText = function(self, str,x,y,touchEnable)
	if not self.m_isExist then 
		self.m_view = new(DialogView);
		self.m_view:addToRoot();
		self.m_isExist = true;
	end
	if not self.m_view.isShowing then
		self:stopTimer();
		self:startTimer();
	end

	self.m_view:setVisible(true);
	self.m_view:setDialogText(str);
	self.m_view:show(true, false,x,y,touchEnable)
end

LoadingView.setText = function(self, str)
	if self.m_view then 
		self.m_view:setDialogText(str);
	end
end

LoadingView.isShowing = function(self)
	-- body
	if self.m_view then 
		return self.m_view.isShowing;
	else
		return false;
	end
end

LoadingView.hidden = function(self)
	self:stopTimer();
	self.m_isExist = false;
	delete(self.m_view);
	self.m_view = nil;
	self.m_timerFinishObj = nil
	self.m_timerFinishFunc = nil
end

LoadingView.setDefaultDisplayTime = function(millsecond)
	LoadingView.s_displayTime = millsecond or LoadingView.s_defaultDisplayTime;
end


LoadingView.startTimer = function(self)
	self.m_timer = new(AnimDouble,kAnimNormal,0,1,LoadingView.s_displayTime or LoadingView.s_defaultDisplayTime,-1);
	self.m_timer:setDebugName("AnimDouble|LoadingView.startTimer|m_timeOut|");
	self.m_timer:setEvent(self,LoadingView.onTimer);
end

LoadingView.stopTimer = function(self)
	if self.m_timer then
		delete(self.m_timer);
	end
	self.m_timer = nil;
end

LoadingView.onTimer = function(self)
    self:doTimerFinishFunc()
	self:hidden();
end

LoadingView.setTimerFinishFunc = function(self, obj, func)
	self.m_timerFinishObj = obj
	self.m_timerFinishFunc = func
end

LoadingView.doTimerFinishFunc = function(self)
	if self.m_timerFinishObj and self.m_timerFinishFunc then
		self.m_timerFinishFunc(self.m_timerFinishObj)
	end
	self.m_timerFinishObj = nil
	self.m_timerFinishFunc = nil
end

----------------------------------------------------------------------------
----------------- dialog view --------------------------------------------

DialogView = class(CommonGameLayer,false);

DialogView.s_controls = 
{
	indicator = 1,
	loadingContent = 2,
	sheild = 3,
	view_bg = 4,
};

DialogView.s_cmds = 
{

};

DialogView.ctor = function(self, viewConfig)
	super(self, loadingView);
	self:setFillParent(true,true);
    self.m_ctrl = DialogView.s_controls; 
end 

DialogView.dtor = function(self)

end 

DialogView.show = function(self, isBg, cancelAble,x,y,touchEnable)
	-- body
	self:changeLoadingState(true);
	self.isShowing = true;

	local bg = self:findViewById(self.m_ctrl.view_bg);
	if touchEnable then
		bg:setVisible(false);
	else
		bg:setEventTouch(self, function()
			-- body
		end);
		bg:setEventDrag(self, function()
			-- body
		end);
		bg:setVisible(true);
	end

	local loadContent = self:findViewById(self.m_ctrl.loadingContent);
	loadContent:setPos(x,y);
end

DialogView.setDialogText = function(self, text)
	if self.m_text then
		delete(self.m_text);
	end
	self.m_text = UIFactory.createText(text or "", 30, 0, 0, kAlignLeft, 200, 175, 115);
	local w,h = self.m_text:getSize();

	local loadContent = self:findViewById(self.m_ctrl.loadingContent);
	local w1,h1 = loadContent:getSize();
	loadContent:setSize(75 + w + 25,h1);
	loadContent:addChild(self.m_text);
	self.m_text:setPos(75,0);
	self.m_text:setAlign(kAlignLeft);
end

DialogView.dismiss = function(self, isDelete)
	self.isShowing = false;
	self:changeLoadingState(false);
end

DialogView.changeLoadingState = function(self, isLoading)
	local indicator = self:findViewById(self.m_ctrl.indicator);

	if indicator then
		if isLoading then
			local animLoading = indicator:addPropRotate(0,kAnimRepeat,1440,0,0,360,kCenterDrawing);
			if animLoading then
				animLoading:setDebugName("DialogView.changeLoadingState|indicator loading");
			end
		else
		    if not indicator:checkAddProp(0) then
                indicator:removeProp(0);
            end 
		end
	end


	-- if not indicator then

	-- else 
	-- 	if isLoading then
	-- 		indicator:addPropRotate(0,kAnimRepeat,1440,0,0,360,kCenterDrawing);
	-- 	else
	-- 	    if not indicator:checkAddProp(0) then
 --                indicator:removeProp(0);
 --            end 
	-- 	end
	-- end
end

DialogView.s_controlConfig = 
{
	[DialogView.s_controls.indicator] 	= {"loading", "indicator"};
	[DialogView.s_controls.loadingContent] 	= {"loading"};
	[DialogView.s_controls.sheild] 		= {"sheild"};
	[DialogView.s_controls.view_bg] 	= {"view_bg"};
};

DialogView.s_controlFuncMap = 
{
	--[GameLayer.s_controls.***] = function;
};

DialogView.s_cmdConfig = 
{
	--[GameLayer.s_cmds.***] = ***;
};