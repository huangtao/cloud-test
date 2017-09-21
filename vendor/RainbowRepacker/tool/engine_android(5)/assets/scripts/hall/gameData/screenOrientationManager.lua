ScreenOrientationManager = class(DataInterfaceBase)

--屏幕方向
ScreenOrientationManager.eScreenOrien = {
    LANDSCAPE = 0; --横屏
    PORTRAIT = 1;  --竖屏
}

ScreenOrientationManager.Delegate = {
    onChangeScreenOrientationCallBack = "onChangeScreenOrientationCallBack",
}

ScreenOrientationManager.getInstance = function(self)
    if not ScreenOrientationManager.s_instance then
        ScreenOrientationManager.s_instance = new(ScreenOrientationManager)
    end
    return ScreenOrientationManager.s_instance
end

ScreenOrientationManager.ctor = function(self)
    local orientation = System.isLandscape() and ScreenOrientationManager.eScreenOrien.LANDSCAPE or ScreenOrientationManager.eScreenOrien.PORTRAIT;
	self.m_curScreenOrien = orientation or ScreenOrientationManager.eScreenOrien.LANDSCAPE
	EventDispatcher.getInstance():register(Event.Call,self,self.onNativeEvent)
end

ScreenOrientationManager.dtor = function(self)
	EventDispatcher.getInstance():unregister(Event.Call,self,self.onNativeEvent)
	self.m_curScreenOrien = nil
end

--改变当前屏幕方向
ScreenOrientationManager.changeScreenOrientation = function(self, isLandscapeState)
    Application.instance():set_orientation(isLandscapeState and Application.LANDSCAPE or Application.PORTRAIT);
end

--获取当前屏幕方向
ScreenOrientationManager.getCurScreenOrientation = function(self)
    local orientation = System.isLandscape() and ScreenOrientationManager.eScreenOrien.LANDSCAPE or ScreenOrientationManager.eScreenOrien.PORTRAIT;
	return self.m_curScreenOrien or orientation or ScreenOrientationManager.eScreenOrien.LANDSCAPE
end

ScreenOrientationManager.setCurScreenOrientation = function(self, orientation)
	self.m_curScreenOrien  = orientation
end


--当前是否是横屏
ScreenOrientationManager.isLandscape = function(self)
	return System.isLandscape();
end

--当前是否是竖屏
ScreenOrientationManager.isPortrait = function(self)
	return System.isPortrait();
end

--屏幕方向切换完成回调
ScreenOrientationManager.onChangeScreenOrientationCallBack = function(self, flag, info)
	self:notify(ScreenOrientationManager.Delegate.onChangeScreenOrientationCallBack, flag, info)
end

ScreenOrientationManager.onNativeEvent = function(self,param,...)
    if self.s_nativeEventFuncMap[param] then
        self.s_nativeEventFuncMap[param](self,...)
    end
end

ScreenOrientationManager.s_nativeEventFuncMap = {
    ["changeScreenOrientationCallBack"] = ScreenOrientationManager.onChangeScreenOrientationCallBack,
}