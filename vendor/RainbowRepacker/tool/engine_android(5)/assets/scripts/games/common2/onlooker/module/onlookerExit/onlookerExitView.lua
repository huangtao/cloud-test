local ViewBase = require("games/common2/module/viewBase");
local OnlookerExitView = class(ViewBase,false);

OnlookerExitView.ctor = function(self, seat, layoutConfig)
    super(self,nil);
	self.m_ctrls = OnlookerExitView.s_controls;

    self:_initView();
end 

OnlookerExitView.dtor = function(self)
end

OnlookerExitView._initView = function(self)
	local file = "games/common/match/match_allover/btn_return.png";
	local config = {};
	if GameInfoIsolater.getInstance():isInMatchRoom() then
		config = table.verify(GameMatchConfig.onlookerExit);
	else 
		local gameConfig = table.verify(GameProcessManager2.getInstance():getGameConfig());
		config = table.verify(gameConfig.onlookerExit);
	end
	file = config.file or file;

	local exitBtn = UIFactory.createButton(file);
	self:addChild(exitBtn);
	self:setSize(exitBtn:getSize());

	exitBtn:setOnClick(self, self.onExitBtnClick);
end
-----------------------------------------------------------------------------
OnlookerExitView.onExitBtnClick = function(self)
	MechineManage.getInstance():receiveAction(GameMechineConfig.ACTION_REQUEST_EXIT_ONLOOKER);
end

return OnlookerExitView;