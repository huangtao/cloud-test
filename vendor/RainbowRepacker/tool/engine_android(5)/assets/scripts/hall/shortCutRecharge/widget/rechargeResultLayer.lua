local rechargeResultLayer = require(ViewPath .. "hall/shortCutRecharge/rechargeResultLayer");

--支付结果通知弹框

local RechargeResultLayer = class(CommonGameLayer, false);

RechargeResultLayer.Delegate = {
    onRechargeResultLayerClose = "onRechargeResultLayerClose";
}

local l_index = 0;
local getIndex = function(self)
    l_index = l_index + 1;
    return l_index;
end

RechargeResultLayer.s_controls = {
    shadeBg = getIndex();
    title = getIndex();
    successView = getIndex();
    failedView = getIndex();
    okBtn = getIndex();
    closeBtn = getIndex();
    okBtnText = getIndex();
}

RechargeResultLayer.ctor = function(self)
    super(self, rechargeResultLayer);

    self.m_ctrl = RechargeResultLayer.s_controls;
    self:getControl(self.m_ctrl.shadeBg):setEventTouch(nil , function()
    end);
    self:getControl(self.m_ctrl.shadeBg):setEventDrag(nil , function()
    end);
end

RechargeResultLayer.show = function(self, isSuccess)
    local title = isSuccess and "支付成功" or "支付失败";
    self:getControl(self.m_ctrl.title):setText(title);

    local btnText = isSuccess and "知道了" or "重新支付";
    self:getControl(self.m_ctrl.okBtnText):setText(btnText);

    self:getControl(self.m_ctrl.successView):setVisible(isSuccess);
    self:getControl(self.m_ctrl.failedView):setVisible(not isSuccess);


    CommonGameLayer.show(self);
end

RechargeResultLayer.onOkBtnClick = function(self)
    self:onCloseBtnClick();
end

RechargeResultLayer.onCloseBtnClick = function(self)
    self:execDelegate(RechargeResultLayer.Delegate.onRechargeResultLayerClose, true);
end

RechargeResultLayer.s_controlConfig = {
    [RechargeResultLayer.s_controls.shadeBg] = {"shadeBg"};
    [RechargeResultLayer.s_controls.title] = {"centerView", "titleBg", "title"};
    [RechargeResultLayer.s_controls.successView] = {"centerView", "contentBg", "successView"};
    [RechargeResultLayer.s_controls.failedView] = {"centerView", "contentBg", "failedView"};
    [RechargeResultLayer.s_controls.okBtn] = {"centerView", "okBtn"};
    [RechargeResultLayer.s_controls.closeBtn] = {"centerView", "closeBtn"};   
    [RechargeResultLayer.s_controls.okBtnText] = {"centerView", "okBtn", "text"};
}

RechargeResultLayer.s_controlFuncMap = {
    [RechargeResultLayer.s_controls.okBtn] = RechargeResultLayer.onOkBtnClick;
    [RechargeResultLayer.s_controls.closeBtn] = RechargeResultLayer.onCloseBtnClick;
}

return RechargeResultLayer;