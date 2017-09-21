local BaseLoginDialog = require("hall/login/widget/baseLoginDialog");

local AutoRegisterDialog = class(BaseLoginDialog,false);

AutoRegisterDialog.ctor = function(self)
    super(self, nil);

    RegisterLogic.getInstance():setObserver(self);
end

AutoRegisterDialog.dtor = function(self)
    RegisterLogic.getInstance():clearObserver(self);
end

AutoRegisterDialog.onCheckRegisterSucess = function(self, info)
    Log.v("AutoRegisterDialog","onCheckRegisterSucess");

    info = table.verify(info);
    info.checkPhone = info.checkPhone or 0;
    AutoRegisterDialog.hide();
    local RegisterAccountVerifyDialog = require("hall/login/widget/registerAccountVerifyDialog");
    RegisterAccountVerifyDialog.show(info);
end

AutoRegisterDialog.onCheckRegisterFailed = function(self,errorInfo)
    Log.v("AutoRegisterDialog","onCheckRegisterFailed");

    AutoRegisterDialog.hide();
    local errorType = errorInfo and  errorInfo.errorType or 0;
    if errorType == LoginConstants.eRegisterErr.Registered then 
        local num = errorInfo and errorInfo.checkPhone or 0;
        local AccountRegisteredDialog = require("hall/login/widget/accountRegisteredDialog");
        AccountRegisteredDialog.show(num);
    else
        local AutoVerifyFailedDialog = require("hall/login/widget/autoVerifyFailedDialog");
        AutoVerifyFailedDialog.show();
    end
end

AutoRegisterDialog.show = function(...) 
    AutoRegisterDialog.hide(true);
    AutoRegisterDialog.s_instance = new(AutoRegisterDialog , ...);
    AutoRegisterDialog.s_instance:addToRoot();
    AutoRegisterDialog.s_instance:setFillParent(true,true);
    
    RegisterLogic.getInstance():startAutoRegister();

    return AutoRegisterDialog.s_instance;
end

AutoRegisterDialog.hide = function()    
    delete(AutoRegisterDialog.s_instance);
    AutoRegisterDialog.s_instance = nil;
end

return AutoRegisterDialog