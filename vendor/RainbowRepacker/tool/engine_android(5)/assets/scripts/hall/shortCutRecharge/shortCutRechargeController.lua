ShortCutRechargeController = class(CommonController);

ShortCutRechargeController.s_cmds = {
	GoBack = 1;
}

ShortCutRechargeController.onBack = function(self)
	self.m_state:popState();
end

ShortCutRechargeController.onResume = function(self)
    CommonController.onResume(self);
    self:updateView(ShortCutRechargeScene.s_cmds.onResume);
end

ShortCutRechargeController.onPause = function(self)
    CommonController.onPause(self);
    self:updateView(ShortCutRechargeScene.s_cmds.onPause);
end

ShortCutRechargeController.onBroadcastPayMoney = function(self, broadType)
    StateMachine.getInstance():popState();
end

ShortCutRechargeController.s_cmdConfig = 
{
	[ShortCutRechargeController.s_cmds.GoBack] 	   = ShortCutRechargeController.onBack,
}