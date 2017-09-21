require("hall/common/commonJumpLogic");

JumpInterfacePrivateRoom = class();

JumpInterfacePrivateRoom.getInstance = function()
    if not JumpInterfacePrivateRoom.s_instance then
        JumpInterfacePrivateRoom.s_instance = new(JumpInterfacePrivateRoom);
    end
    return JumpInterfacePrivateRoom.s_instance;
end

JumpInterfacePrivateRoom.releaseInstance = function()
    delete(JumpInterfacePrivateRoom.s_instance);
    JumpInterfacePrivateRoom.s_instance = nil;
end

JumpInterfacePrivateRoom.ctor = function(self)
end 

JumpInterfacePrivateRoom.dtor = function(self)
end

-- 跳转到私人房
-- data = {tableId}
JumpInterfacePrivateRoom.enterPrivateRoom = function(self, data, obj, func, enterType)
    if obj and func then
        func(obj);
    end
    
    local jumpInfo = { cmd = CommonJumpCmds.GOTO_PRIVATE_ROOM, tableId = data.tableId, enterType = enterType};
    local isNeedBackToHall = CommonJumpLogic.getInstance():executeJsCall(jumpInfo);
    if isNeedBackToHall then
        GameManager.getInstance():startGame(GameType.HALL);
    end
end
