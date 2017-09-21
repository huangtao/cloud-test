
require("hall/slotMachine/slotMachineLayer");

SlotMachineLayerIsolater = class(DataInterfaceBase);

SlotMachineLayerIsolater.Delegate = {
    onGetSlotMachineConfigCallBack = "onGetSlotMachineConfigCallBack";
    onGetSlotMachineRecordCallBack = "onGetSlotMachineRecordCallBack";
    onGetSlotMachineRewardCallBack = "onGetSlotMachineRewardCallBack";
    onGetSlotMachineGameSwitchCallBack = "onGetSlotMachineGameSwitchCallBack";
};

SlotMachineLayerIsolater.getInstance = function()
    if not SlotMachineLayerIsolater.s_instance then
        SlotMachineLayerIsolater.s_instance = new(SlotMachineLayerIsolater); 
    end
    return SlotMachineLayerIsolater.s_instance;
end

SlotMachineLayerIsolater.ctor = function(self)
    SlotMachineInfo.getInstance():setObserver(self);
end

SlotMachineLayerIsolater.dtor = function(self)
    SlotMachineInfo.getInstance():clearObserver(self);
end

SlotMachineLayerIsolater.isOpen = function(self)
    return SlotMachineInfo.getInstance():isOpen();
end

SlotMachineLayerIsolater.isOpenGameSwitch = function(self)
    return SlotMachineInfo.getInstance():isOpenGameSwitch();
end

SlotMachineLayerIsolater.getSlotMachineLayer = function(self)
    return new(SlotMachineLayer);
end

SlotMachineLayerIsolater.showSlotMachineLayer = function(self, slotMachine)
    if slotMachine then
        slotMachine:show();
    end
end

SlotMachineLayerIsolater.hideSlotMachineLayer = function(self, slotMachine)
    if slotMachine then
        slotMachine:hide();
    end
end

SlotMachineLayerIsolater.onGetSlotMachineConfigCallBack = function(self, isSuccess)
    self:notify(SlotMachineLayerIsolater.Delegate.onGetSlotMachineConfigCallBack, isSuccess);
end

SlotMachineLayerIsolater.onGetSlotMachineGameSwitchCallBack = function(self, isSuccess)
    self:notify(SlotMachineLayerIsolater.Delegate.onGetSlotMachineGameSwitchCallBack, isSuccess);
end

SlotMachineLayerIsolater.onGetSlotMachineRecordCallBack = function(self, isSuccess,data)
    self:notify(SlotMachineLayerIsolater.Delegate.onGetSlotMachineRecordCallBack, isSuccess,data);
end

SlotMachineLayerIsolater.onGetSlotMachineRewardCallBack = function(self, isSuccess,data)
    self:notify(SlotMachineLayerIsolater.Delegate.onGetSlotMachineRewardCallBack, isSuccess,data);
end