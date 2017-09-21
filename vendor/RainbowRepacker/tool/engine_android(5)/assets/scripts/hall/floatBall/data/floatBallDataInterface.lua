local FloatBallData = require("hall/floatBall/data/floatBallData");

FloatBallDataInterface = class(DataInterfaceBase);

FloatBallDataInterface.eFloatDataType = {
    ENTER_MATCH = 1;
}

FloatBallDataInterface.Delegate = {
    onGetFloatBallConfigCallBack = "onGetFloatBallConfigCallBack";
    onGetHintMessageCallBack = "onGetHintMessageCallBack";
}

FloatBallDataInterface.getInstance = function()
    if not FloatBallDataInterface.s_instance then
        FloatBallDataInterface.s_instance = new(FloatBallDataInterface);
    end

    return FloatBallDataInterface.s_instance;
end

FloatBallDataInterface.ctor = function(self)
    self.m_floatBallConfig = new(FloatBallData, self);
    self.m_msgStack = {};
    self.m_scene_name = "hall";

    -- self.m_anim = AnimFactory.createAnimInt(kAnimRepeat, 0, 1, 10000, -1);

    -- self.m_anim:setEvent(self, function()
    --     self:insertMatchMessage( {matchName="大连话费争夺赛", startTime = os.time() + 500, matchId=1000} );
    --     end)
end

FloatBallDataInterface.setSceneName = function(self,p_name)
    if p_name then
        self.m_scene_name = p_name;
    end
end

FloatBallDataInterface.getSceneName = function(self)
    return self.m_scene_name;
end

FloatBallDataInterface.requestFloatBallConfig = function(self)
    self.m_floatBallConfig:requestData();
end

FloatBallDataInterface.getFloatBallConfig = function(self)
    return self.m_floatBallConfig:getFloatBallConfig();
end

FloatBallDataInterface.onGetFloatBallConfigCallBack = function(self, isSuccess, floatBallConfig)
    self:notify(FloatBallDataInterface.Delegate.onGetFloatBallConfigCallBack, isSuccess, floatBallConfig);
end

FloatBallDataInterface.insertMatchMessage = function(self, info)
    if table.isEmpty(info) then
        return;
    end

    info.ballDataType = FloatBallDataInterface.eFloatDataType.ENTER_MATCH;
    table.insert(self.m_msgStack, info);
    self:notify(FloatBallDataInterface.Delegate.onGetHintMessageCallBack);
end

FloatBallDataInterface.hasMessageItem = function(self)
    return #self.m_msgStack > 0 and true or false;
end

FloatBallDataInterface.popMessageItem = function(self)
    if table.isEmpty(self.m_msgStack) then
        return {};
    else
        local item = table.remove(self.m_msgStack, 1);
        return item;
    end
end

FloatBallDataInterface.setRedBubbleStatus = function(self, isShow)
    self.m_floatBallConfig:setRedBubbleStatus(isShow);
end

FloatBallDataInterface.getRedBubbleStatus = function(self)
    return self.m_floatBallConfig:getRedBubbleStatus();
end

FloatBallDataInterface.setPhpSwitchStatus = function(self, isOpen)
    self.m_phpSwitch = isOpen;
end

FloatBallDataInterface.getPhpSwitchStatus = function(self)
    return self.m_phpSwitch;
end

FloatBallDataInterface.isSwitchOpen = function(self)
    return self.m_phpSwitch and SettingDataInterface.getInstance():getFloatBallSwitch();
end
