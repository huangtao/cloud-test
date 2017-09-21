--裸码支付确认弹框

local bareCodeConfirmLayer = require(ViewPath .. "hall/shortCutRecharge/bareCodeConfirmLayer");

local BareCodeConfirmLayer = class(CommonGameLayer, false);

BareCodeConfirmLayer.Delegate = {
    onBareCodeConfirmLayerClose = "onBareCodeConfirmLayerClose";
    onBareCodeConfirmLayerBuyBtnClick = "onBareCodeConfirmLayerBuyBtnClick";
};

BareCodeConfirmLayer.s_controls = {
    shadeBg = 1;
    centerView = 2;
    content = 3;
    closeBtn = 4;
    buyBtn = 5;
}

BareCodeConfirmLayer.ctor = function(self)
    super(self, bareCodeConfirmLayer);
    self:setFillParent(true, true);

    self.m_ctrl = BareCodeConfirmLayer.s_controls;
    self:getControl(self.m_ctrl.shadeBg):setEventTouch(nil , function()
    end);
    self:getControl(self.m_ctrl.shadeBg):setEventDrag(nil , function()
    end);
end

BareCodeConfirmLayer.show = function(self, goodInfo)
    Log.v("BareCodeConfirmLayer.show");
    CommonGameLayer.show(self);
    if table.isEmpty(goodInfo) then
        self:onCloseBtnClick();
        return;
    end

    self:__initView(goodInfo);
end

BareCodeConfirmLayer.__initView = function(self, goodInfo)
    local confirm_tips = "成功购买会扣除相应费用，是否确认购买%s%s，价格%s元";
    local additionStr = "";
    if string.isEmpty(goodInfo.priorityDesc) then
        if not string.isEmpty(goodInfo.specialDesc) then
            additionStr = string.format("(%s)", goodInfo.specialDesc);
        end
    else
        additionStr = string.format("(%s)", goodInfo.priorityDesc);
    end
    local tips = string.format(confirm_tips, goodInfo.name, additionStr, goodInfo.pamount);
    self:getControl(self.m_ctrl.content):setText(tips);
end

BareCodeConfirmLayer.onBuyBtnClick = function(self)
    self:execDelegate(BareCodeConfirmLayer.Delegate.onBareCodeConfirmLayerBuyBtnClick);
end

BareCodeConfirmLayer.onCloseBtnClick = function(self)
    self:execDelegate(BareCodeConfirmLayer.Delegate.onBareCodeConfirmLayerClose);
end

BareCodeConfirmLayer.s_controlConfig = {
    [BareCodeConfirmLayer.s_controls.shadeBg] = {"shadeBg"};
    [BareCodeConfirmLayer.s_controls.centerView] = {"centerView"};
    [BareCodeConfirmLayer.s_controls.content] = {"centerView", "contentBg", "content"};
    [BareCodeConfirmLayer.s_controls.closeBtn] = {"centerView", "closeBtn"};
    [BareCodeConfirmLayer.s_controls.buyBtn] = {"centerView", "buyBtn"};
}

BareCodeConfirmLayer.s_controlFuncMap = {
    [BareCodeConfirmLayer.s_controls.closeBtn] = BareCodeConfirmLayer.onCloseBtnClick;
    [BareCodeConfirmLayer.s_controls.buyBtn] = BareCodeConfirmLayer.onBuyBtnClick;
}

return BareCodeConfirmLayer;