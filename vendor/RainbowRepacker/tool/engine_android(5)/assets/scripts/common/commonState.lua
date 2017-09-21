require("gameBase/gameState");
require("common/IPopDialogManager");

CommonState = class(GameState, false);

--ctor 不做耗时的占大量内存的初始化工作
CommonState.ctor = function(self, ...)
	super(self);
	self.m_commonBundleData = {...};
end

--@brief 获取状态切换(pushState、changeState)时，传送的参数
CommonState.getBundleData = function(self)
	if table.isEmpty(self.m_commonBundleData) then
		return;
	end

	return unpack(self.m_commonBundleData);
end

CommonState.canPopStateStack = function(self)
	return #self.m_stateStack > 0 and true or false;
end

CommonState.gobackLastState = function(self)
	local controller = self:getController();
	if typeof(controller,GameController) then
		controller:onBackPressed();
	end
end

CommonState.onBack = function(self)
	local isDone = IPopDialogManager.getInstance():onBackPressCall();
	if isDone then
		return;
	end

	GameState.popState(self);
end
