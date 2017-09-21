--救济领取模块
local GuideBase = require("hall/bankrupt/widget/differentGuide/guideBase");
local SafeBoxGuide = class(GuideBase,false);

SafeBoxGuide.ctor = function(self,data)
    UBReport.getInstance():report(UBConfig.kHallBankruptSafeBoxShow);
    self.m_data = table.verify(data);
    super(self);
end

SafeBoxGuide.dtor = function(self)

end

--重写父类函数
SafeBoxGuide._init = function(self)
    GuideBase._init(self);
    --tittle
    self.m_Text_tittleMiddle:setVisible(true);
    self.m_Text_tittleMiddle:setText("现金不足，请取钱后再战");

    --iconImage
    self.m_Image_iconSafeBox:setVisible(true);

    --tips

    --button des
    self.m_Text_button:setText("打开保险箱");
end

--重写父类函数
SafeBoxGuide._onbutton_goClick = function(self)
    UBReport.getInstance():report(UBConfig.kHallBankruptClickSafeBox);
    GuideBase._onbutton_goClick(self);
    --打开保险箱
    StateMachine.getInstance():pushState(States.SafeBox, nil, true);
    IBaseDialog.remove("bankrupt");
end

return SafeBoxGuide
