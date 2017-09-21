local BaseLoginDialog = require("hall/login/widget/baseLoginDialog");
local login_thirdParty_switch_account = require("view/kScreen_1280_800/hall/login/login_thirdParty_switch_account");
require("hall/login/data/thirdPartyLoginManager");

local ThirdPartySwitchAccountDialog = class(BaseLoginDialog,false);

local h_index = 0;
local getIndex = function(self)
    h_index = h_index + 1;
    return h_index;
end

ThirdPartySwitchAccountDialog.s_controls = {
    desc = getIndex();
}

ThirdPartySwitchAccountDialog.ctor = function(self)
    super(self, login_thirdParty_switch_account);

    self.m_ctrl = ThirdPartySwitchAccountDialog.s_controls;
    self:init();

    LoginLogic.getInstance():setObserver(self);
end

ThirdPartyLoginManager.dtor = function(self)
    LoginLogic.getInstance():clearObserver(self);
end

ThirdPartySwitchAccountDialog.init = function(self)
    local desc = ThirdPartyLoginManager.getInstance():getThirdPartyLoginName();
    self:findViewById(self.m_ctrl.desc):setText(desc);
end

ThirdPartySwitchAccountDialog.createLogic = function(self)
    ThirdPartyLoginManager.getInstance():requestSwitchAccount();
end

ThirdPartySwitchAccountDialog.onLoginSuccess = function(self)
    ThirdPartySwitchAccountDialog.hide();   
end

ThirdPartySwitchAccountDialog.onLoginFailed = function(self)
    ThirdPartySwitchAccountDialog.hide();
    self:showNotice("切换账号失败");
end

ThirdPartySwitchAccountDialog.onLoginTimeout = function(self)
    ThirdPartySwitchAccountDialog.hide();
end

ThirdPartySwitchAccountDialog.show = function(data)
    ThirdPartySwitchAccountDialog.hide();
    ThirdPartySwitchAccountDialog.s_instance = new(ThirdPartySwitchAccountDialog, data);
    ThirdPartySwitchAccountDialog.s_instance:addToRoot();
    ThirdPartySwitchAccountDialog.s_instance:setFillParent(true,true);
    return ThirdPartySwitchAccountDialog.s_instance;
end

ThirdPartySwitchAccountDialog.hide = function()
    delete(ThirdPartySwitchAccountDialog.s_instance);
    ThirdPartySwitchAccountDialog.s_instance = nil;
end

ThirdPartySwitchAccountDialog.showNotice = function(self,msg,width ,height)
    Toast.getInstance():showTextView(msg,width or 640, height or 60,kAlignCenter,"",30,200,175,115);
end 

ThirdPartySwitchAccountDialog.s_controlConfig = {
    [ThirdPartySwitchAccountDialog.s_controls.desc] = {"content_bg", "desc"};
}

return ThirdPartySwitchAccountDialog