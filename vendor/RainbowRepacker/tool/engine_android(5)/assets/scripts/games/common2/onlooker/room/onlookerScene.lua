local OnlookerScene = class();

OnlookerScene.s_cmds = {
	InitOnlookerRoom 			= ToolKit.getIndex();
	ReleaseOnlookerRoom 		= ToolKit.getIndex();
};

OnlookerScene.initOnlookerRoom = function(self)
	self:createOnlookerBarrageLayer();
	self:createOnlookerChatAndUserLayer();
	self:createOnlookerMyBarrageLayer();
	self:createOnlookerExitLayer();
end

OnlookerScene.releaseOnlookerRoom = function(self)
end 

------------------------------------------------------------------------------------
OnlookerScene.createOnlookerBarrageLayer = function(self)
	if not self.m_onlookerBarrageLayer then 
		local OnlookerBarrageLayer = require("games/common2/onlooker/module/onlookerBarrage/onlookerBarrageLayer");
		self.m_onlookerBarrageLayer = new(OnlookerBarrageLayer);
		self.m_commonViewMap[4]:addChild(self.m_onlookerBarrageLayer);
		local level = RoomLevelConfig.getInstance():getLevel("layer4","level1");
		self.m_onlookerBarrageLayer:setLevel(level);
	end 
end

OnlookerScene.createOnlookerChatAndUserLayer = function(self)
	if not self.m_onlookerChatAndUserLayer then
		local onlookerChatAndUserLayer = require("games/common2/onlooker/module/onlookerChatAndUser/onlookerChatAndUserLayer");
		self.m_onlookerChatAndUserLayer = new(onlookerChatAndUserLayer);
		self.m_commonViewMap[4]:addChild(self.m_onlookerChatAndUserLayer);
		local level = RoomLevelConfig.getInstance():getLevel("layer4","level8");
		self.m_onlookerChatAndUserLayer:setLevel(level);
	end
end

OnlookerScene.createOnlookerMyBarrageLayer = function(self)
	if not self.m_onlookerMyBarrageLayer then 
		local OnlookerMyBarrageLayer = require("games/common2/onlooker/module/onlookerMyBarrage/onlookerMyBarrageLayer");
		self.m_onlookerMyBarrageLayer = new(OnlookerMyBarrageLayer);
		self.m_commonViewMap[4]:addChild(self.m_onlookerMyBarrageLayer);
		local level = RoomLevelConfig.getInstance():getLevel("layer4","level8");
		self.m_onlookerMyBarrageLayer:setLevel(level);
	end 
end

OnlookerScene.createOnlookerExitLayer = function(self)
	if not self.m_onlookerExitLayer then 
		local OnlookerExitLayer = require("games/common2/onlooker/module/onlookerExit/onlookerExitLayer");
		self.m_onlookerExitLayer = new(OnlookerExitLayer);
		self.m_commonViewMap[2]:addChild(self.m_onlookerExitLayer);
		local level = RoomLevelConfig.getInstance():getLevel("layer2","level10");
		self.m_onlookerExitLayer:setLevel(level);
	end 
end
------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------
OnlookerScene.createReadyDegradeLayer = function(self)
end 
OnlookerScene.creatBankrupt = function(self)
end
OnlookerScene.creatReadyLayer = function(self)
end
OnlookerScene.creatChatLayer = function(self)
end
OnlookerScene.creatTaskLayer = function(self)
end
OnlookerScene.creatRecharge = function(self)
end 
OnlookerScene.creatChatWndLayer = function(self)
end 
OnlookerScene.creatToolBarLayer = function(self)
end 
OnlookerScene.creatBoxTaskLayer = function(self)
end 
OnlookerScene.creatChatRealTimeLayer = function(self)
end 
OnlookerScene.creatRecruitLayer = function(self)
end 
OnlookerScene.crateInviteLayer = function(self)
end 
OnlookerScene.createSilverLayer = function ( self )
end 
OnlookerScene.creatMatchToolbarLayer = function ( self )
end 
OnlookerScene.createOnlookerSpinnerLayer = function ( self )
end 
------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------
OnlookerScene.s_cmdConfig = 
{
	[OnlookerScene.s_cmds.InitOnlookerRoom] = OnlookerScene.initOnlookerRoom;
	[OnlookerScene.s_cmds.ReleaseOnlookerRoom] = OnlookerScene.releaseOnlookerRoom;	
};

return OnlookerScene;