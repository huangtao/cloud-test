require("gameBase/gameLayer");
require("gameData/dataInterfaceBase");

LayerStateStatus = 
{
	Unloaded  	= 1;
	Loaded      = 2;
	Started     = 3;
	Resumed     = 4;
	Paused      = 5;
	Stoped      = 6;
	Droped		= 7;
}

local layer_releaseFuncMap = 
{
	[LayerStateStatus.Unloaded] 	= {};
	[LayerStateStatus.Loaded] 	= {"unload"};
	[LayerStateStatus.Started] 	= {"stop","unload"};
	[LayerStateStatus.Resumed] 	= {"pause","stop","unload"};
	[LayerStateStatus.Paused] 	= {"stop","unload"};
	[LayerStateStatus.Stoped] 	= {"unload"};
	[LayerStateStatus.Droped] 	= {};
};

CommonGameLayer = class(GameLayer, false);

--@param isDelayLoad:是否延迟加载 默认为false
--@note 大多数情况下应该是不需要延迟加载的，只有那些很大块的界面才需要
CommonGameLayer.ctor = function(self, viewConfig, isDelayLoad)
	super(self);
	self.m_layerMap = {};
	self.m_layerStatus = LayerStateStatus.Unloaded;
	self.m_viewConfig = viewConfig;

	if not isDelayLoad then
		self:__resumeState();
	end
end

--设置依赖的场景
CommonGameLayer.setDependentScene = function(self, dependentScene)
	self.m_dependentScene = dependentScene;
end

CommonGameLayer.getDependentScene = function(self)
	return self.m_dependentScene;
end

--压栈
CommonGameLayer.pushIntoSceneStateStack = function(self, obj, func)
	if self.m_dependentScene and typeof(self.m_dependentScene, GameScene) then
		self.m_dependentScene:pushStateStack(obj, func);
	end
end

--出栈
CommonGameLayer.popFromSceneStateStack = function(self)
	if self.m_dependentScene and typeof(self.m_dependentScene, GameScene) then
		self.m_dependentScene:popStateStack();
	end
end

CommonGameLayer.dtor = function(self)
	self.m_layerStatus = LayerStateStatus.Droped;
	self.m_dependentScene = nil;
	EventDispatcher.getInstance():unregister(Event.Call,self,self.onNativeEvent);
	DataInterfacePool.getInstance():clearObserver(self);
	ImageCache.getInstance():cleanRef(self);
end 

CommonGameLayer.findViewById = function(self, control)
	return self:getControl(control);
end

CommonGameLayer.setVisible = function(self, visible)
	GameLayer.setVisible(self, visible);

	if visible then
		self:__resumeState();
	else
		self:__pauseState();
	end
end

--@brief 加载viewConfig
CommonGameLayer.onLayerLoading = function(self)
	if self.m_layerStatus >= LayerStateStatus.Loaded then
		return
	end

	self.m_layerStatus = LayerStateStatus.Loaded;

	if not self.m_viewConfig then
		return;
	end
	self.m_root = SceneLoader.load(self.m_viewConfig);
	if self.m_root then 
	    CommonGameLayer.addChild(self,self.m_root);
	end

	self.m_controlsMap = {};
	CommonGameLayer.addEventListeners(self);
end

--@brief 监听数据的更新 eg: XXX:setObserver(self)
CommonGameLayer.onLayerRun = function(self)
	self.m_layerStatus = LayerStateStatus.Started;
end

--@brief 此时界面已显示完毕
CommonGameLayer.onLayerResume = function(self)
	self.m_layerStatus = LayerStateStatus.Resumed;

	EventDispatcher.getInstance():register(Event.Call,self,self.onNativeEvent);
end

CommonGameLayer.onLayerPause = function(self)
	self.m_layerStatus = LayerStateStatus.Paused;

	EventDispatcher.getInstance():unregister(Event.Call,self,self.onNativeEvent);
end

--@brief 停止监听数据的更新 eg: XXX:clearObserver(self)
CommonGameLayer.onLayerStop = function(self)
	self.m_layerStatus = LayerStateStatus.Stoped;
end

CommonGameLayer.onLayerUnload = function(self)
	self.m_layerStatus = LayerStateStatus.Unloaded;
end

CommonGameLayer.isLayerLoaded = function(self)
	return self.m_layerStatus >= LayerStateStatus.Loaded;
end

CommonGameLayer.getLayerCurStatus = function(self)
	return self.m_layerStatus;
end

--@brief 显示layer
CommonGameLayer.show = function(self)
	self:setVisible(true);
end

CommonGameLayer.hide = function(self)
	self:setVisible(false);
end

CommonGameLayer.__resumeState = function(self)
	self:onLayerLoading();
	self:onLayerRun();
	self:onLayerResume();

	for _, layer in pairs(self.m_layerMap) do
		if layer:__getRevertFlag() then
			CommonGameLayer.__setRevertFlag(self, false);
			CommonGameLayer.show(self);
		end
	end
end

CommonGameLayer.__pauseState = function(self)
	if self.m_layerStatus == LayerStateStatus.Resumed then
		self:onLayerPause();
		self:onLayerStop();
	end

	for _, layer in pairs(self.m_layerMap) do
		if layer:getCurStatus() == LayerStateStatus.Resumed then
			CommonGameLayer.__setRevertFlag(self, true);
			CommonGameLayer.hide(self);
		end
	end	
end

CommonGameLayer.__getRevertFlag = function(self)
	return self.m_revertFlag;
end

--@brief 标记是否需要还原到以前状态
CommonGameLayer.__setRevertFlag = function(self, isNeedRevert)
	self.m_revertFlag = isNeedRevert;
end

--@brief 根据layer的当前状态来进行释放
CommonGameLayer.cleanLayerState = function(self)
	local funcMap = layer_releaseFuncMap[self.m_layerStatus];
	if not table.isTable(funcMap) then
		return;
	end

	for _, layer in pairs(self.m_layerMap) do
		layer:cleanLayerState();
	end

	for index, funcName in ipairs(funcMap) do
		self[funcName](self);
	end
end

CommonGameLayer.addLayer = function(self, subLayer)
    if not typeof(subLayer, CommonGameLayer) then
    	Log.v("CommonGameLayer.addLayer ", "the subLayer must be the derived class of the CommonGameLayer");
        return;
    end

    self.m_layerMap  = self.m_layerMap or {};
    for _, layer in pairs(self.m_layerMap) do
        if layer == subLayer then
            return;
        end
    end

    table.insert(self.m_layerMap, subLayer);
    self:addChild(subLayer);	
end

CommonGameLayer.addChild  = function(self, child)
	GameLayer.addChild(self, child);
	if typeof(child, CommonGameLayer) and self.m_dependentScene then
		child:setDependentScene(self.m_dependentScene);
	end
end

CommonGameLayer.onNativeEvent = function(self,param,...)
	if self.s_nativeEventFuncMap[param] then
		self.s_nativeEventFuncMap[param](self,...);
	end
end

CommonGameLayer.execDelegate = function(self,func,...)
    if self.m_delegate and self.m_delegate[func] then
        self.m_delegate[func](self.m_delegate,...);
    end
end

CommonGameLayer.s_nativeEventFuncMap = {

};