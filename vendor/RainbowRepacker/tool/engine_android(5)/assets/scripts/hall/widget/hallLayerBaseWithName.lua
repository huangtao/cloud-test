-- HallLayerBaseWithName.lua
-- Author:Demon
-- Date:2016/1/18
-- Last modification:2016/04/11
-- Description:
-- Note:
require("common/IPopDialogManager");
require("isolater/widget/layerManagerIsolater");

local HallLayerBase = require("hall/widget/hallLayerBase");

local HallLayerBaseWithName = class(HallLayerBase);

HallLayerBaseWithName.ctor = function(self, viewConfig, isDelayLoad, layerName)	
											--viewConfig 提供给CommonGameLayer
											--isDelayLoad 提供给CommonGameLayer
											--layerName 必须为你的layer取一个名字
											--并且与LayerManagerIsolater中的名字必须一致；
											--这个名字应该作为子类的类元素而存在，不能通过
											--子类的构造参数赋值
	self.__layerName = 	layerName;									

    assert( type(layerName) == "string" );

	LayerManagerIsolater.getInstance():__addToPool(self,self.__layerName);

    local levelConfig = require("hall/widget/globalLayerLevelConfig");
    self:setLevel( number.valueOf(levelConfig[layerName]) );

	self:setFillParent(true, true);
    self:addToRoot();
end

HallLayerBaseWithName.dtor = function(self)	
	LayerManagerIsolater.getInstance():__removeFromPoolByName(self.__layerName);
    IPopDialogManager.getInstance():removePopDialog(self);
end

--是否要在CommonState监听返回事件
HallLayerBaseWithName.setListenBackEvent = function(self,p_isNeedListen,p_level)
    p_level = p_level or self:getLevel();
    if p_isNeedListen then
        IPopDialogManager.getInstance():addPopDialog(self, p_level, self.close, self);
    else
        IPopDialogManager.getInstance():removePopDialog(self);
    end
end

HallLayerBaseWithName.close = function(self)
    if self:hasUiAnimation() then
        self:runUiAction(UiAnimConfig.ACTION.END);
    else
        self:_close();
    end
end

--@brief layerManagerIsolater 会进行调用
HallLayerBaseWithName._close = function(self)	
	delete(self);
end

HallLayerBaseWithName.touch_close = function(self,finger_action,x,y,drawing_id_first,drawing_id_current, event_time)
    if finger_action == kFingerUp then
        self:close();
    end
end

--专门给某些控件屏蔽点击事件用
HallLayerBaseWithName.onBindBlankFunc = function(self)
end

HallLayerBaseWithName.onUiBeginActionBefore = function(self)
    self:setEventTouch(self,self.touch_close);
end

HallLayerBaseWithName.onUiEndActionBefore = function(self)
    self:setEventTouch(nil, function () end);
end

--@override
HallLayerBaseWithName.onUiEndActionFinish = function(self)
    self:_close();
end

return HallLayerBaseWithName;
