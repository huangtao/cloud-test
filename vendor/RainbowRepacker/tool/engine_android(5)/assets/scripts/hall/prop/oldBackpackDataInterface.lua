--之前老背包的数据接口，，但相关的对象都是prop里的，所以放在prop目录下。。
require("gameData/dataInterfaceBase");

OldBackpackDataInterface = class(DataInterfaceBase);

OldBackpackDataInterface.Delegate = {
    onUseCallback                   = "onUseCallback",
    onAbandonCallBack               = "onAbandonCallBack"
};

OldBackpackDataInterface.getInstance = function()
    if not OldBackpackDataInterface.s_instance then
        OldBackpackDataInterface.s_instance = new(OldBackpackDataInterface);
    end

    return OldBackpackDataInterface.s_instance;
end

OldBackpackDataInterface.releaseInstance = function()
    delete(OldBackpackDataInterface.s_instance);
    OldBackpackDataInterface.s_instance = nil;
end

OldBackpackDataInterface.ctor = function(self)
    
end 

OldBackpackDataInterface.dtor = function(self)

end

OldBackpackDataInterface.use = function(self, propsType, propsNum,activeMids)
    Log.d("OldBackpackDataInterface.use","propsType = ",propsType,"propsNum = ",propsNum,"activeMids = ",activeMids);
    if not propsType or not propsNum then
        return;
    end

    local param = {
        propsType = propsType,
        propsNum = number.valueOf(propsNum),
        activeMids = activeMids,
    };
    OnlineSocketManager.getInstance():sendMsg(PHP_USE_PROPS, param);
end

OldBackpackDataInterface.onUseCallback = function(self, isSuccess, data, sendParam)
    Log.d("OldBackpackDataInterface.onUseCallback","isSuccess = ",isSuccess,"data = ",data,"sendParam = ",sendParam);
    if isSuccess and not table.isEmpty(sendParam) then
        local num = kPropManager:getPropNumByPropType(sendParam.propsType);
        kPropManager:updatePropNum(sendParam.propsType, number.valueOf(num - sendParam.propsNum));
        Log.d("OldBackpackDataInterface.onUseCallback","propsType = ",sendParam.propsType,"remain number ===> ",number.valueOf(num - sendParam.propsNum));
    end
    self:notify(OldBackpackDataInterface.Delegate.onUseCallback, isSuccess, sendParam);
end

OldBackpackDataInterface.abandon = function(self, propsType, propsNum)
    if not propsType or not propsNum then
        return;
    end

    local param = {
        propsType = propsType,
        propsNum = number.valueOf(propsNum),
    };
    OnlineSocketManager.getInstance():sendMsg(PHP_BAG_PROP_ABANDON, param, 6000);
end

OldBackpackDataInterface.onAbandonCallBack = function(self, isSuccess, data, sendParam)
    if isSuccess and not table.isEmpty(sendParam) then
        local num = kPropManager:getPropNumByPropType(sendParam.propsType);
        kPropManager:updatePropNum(sendParam.propsType, number.valueOf(num - sendParam.propsNum));
    end

    self:notify(OldBackpackDataInterface.Delegate.onAbandonCallBack, isSuccess, data);
end

OldBackpackDataInterface.s_socketCmdFuncMap = {
    [PHP_USE_PROPS]                   = OldBackpackDataInterface.onUseCallback;
    [PHP_BAG_PROP_ABANDON]            = OldBackpackDataInterface.onAbandonCallBack;
};