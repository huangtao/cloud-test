
require("games/common2/room/commonGameController2");
require("games/common2/room/commonGameScene2");
local gameCommonLayout2 = require("view/kScreen_1280_800/games/common2/gameCommonLayout2");

CommonGameState2 = class(CommonState);

CommonGameState2.ctor = function(self)
end

CommonGameState2.load = function(self)
	CommonState.load(self);
	return true;
end

CommonGameState2.getCurShowStateConfig = function(self)
	return self.m_curShowStateConfig;
end

--protect方法，只能调用不能重写
--需要子类在load的时候调用，替换之前的 --self.m_controller = new(EqsRoomController, self, EqsRoomScene, eqsRoomLayout);
CommonGameState2.loadView = function(self, controller, scene, layoutConfig)
	self.m_curShowStateConfig = {
		controller = controller;
		scene = scene;
		param = {layoutConfig};
	};
	self.m_controller = new(controller, self, scene, gameCommonLayout2, layoutConfig);
end

CommonGameState2.resume = function(self)
	CommonState.resume(self);

	EventDispatcher.getInstance():register(kShowPopupWindows , self,self.onPopupWindowsShow);
	EventDispatcher.getInstance():register(kClosePopupWindows , self,self.onPopupWindowsClose);
end

CommonGameState2.pause = function(self)
	CommonState.pause(self);
	EventDispatcher.getInstance():unregister(kClosePopupWindows , self,self.onPopupWindowsClose);
	EventDispatcher.getInstance():unregister(kShowPopupWindows , self,self.onPopupWindowsShow);
end  

CommonGameState2.unload = function(self)
	CommonState.unload(self);
	delete(self.m_controller);
	self.m_controller = nil;
end

CommonGameState2.getController = function(self)
	return self.m_controller;
end

CommonGameState2.dtor = function(self)

end

CommonGameState2.onPopupWindowsShow = function(self,obj,func)
	self:pushStateStack(obj,func);
end

CommonGameState2.onPopupWindowsClose = function(self)
	self:popStateStack();
end