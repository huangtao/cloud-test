require("hall/common/commonJumpLogic");

JumpInterfaceMatchHall = class();

JumpInterfaceMatchHall.getInstance = function()
    if not JumpInterfaceMatchHall.s_instance then
        JumpInterfaceMatchHall.s_instance = new(JumpInterfaceMatchHall);
    end
    return JumpInterfaceMatchHall.s_instance;
end

JumpInterfaceMatchHall.releaseInstance = function()
    delete(JumpInterfaceMatchHall.s_instance);
    JumpInterfaceMatchHall.s_instance = nil;
end

JumpInterfaceMatchHall.ctor = function(self)
end 

JumpInterfaceMatchHall.dtor = function(self)
end

JumpInterfaceMatchHall.enterMacthHallScene = function(self, configId)
    local jumpInfo = { cmd = CommonJumpCmds.GOTO_MATCH_ROOM, matchconfigid = configId};
    local isNeedBackToHall = CommonJumpLogic.getInstance():executeJsCall(jumpInfo);
    if isNeedBackToHall then
        GameManager.getInstance():startGame(GameType.HALL);
    end
end