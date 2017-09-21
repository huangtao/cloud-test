--救济领取模块
local GuideBase = require("hall/bankrupt/widget/differentGuide/guideBase");
local CountDownOverGuide = class(GuideBase,false);

CountDownOverGuide.ctor = function(self,data)
    UBReport.getInstance():report(UBConfig.kHallBankruptShowGetGold);
    --[[
    data = {
        moneyNum = 0;
        func = function() end
        refreshFunc = function() end
    }
    ]]
    self.m_data = table.verify(data);
    self.m_data.moneyCount = kBankruptDataInterface:getCurBankruptReward();
    super(self);
end

CountDownOverGuide.dtor = function(self)

end

--重写父类函数
CountDownOverGuide._init = function(self)
    GuideBase._init(self);
    --tittle
    self.m_Text_tittleMiddle:setVisible(true);
    self.m_Text_tittleMiddle:setText("免费救济已经就绪");

    --iconImage
    self.m_Text_Image_iconGold:setVisible(true);

    --tips
   self.m_View_downTip:setVisible(true);
   local _textLeft = "免费领取";
   local _textRight = self.m_data.moneyCount or 0;
   _textRight = "".._textRight;
   local w,h = self.m_View_downTip:getSize();
   require("uilibs/richText");
   local _tips = string.format("#c8f5c1f%s#cea4018%s#c8f5c1f%s",_textLeft,_textRight,"银币" );
   local richText = new(RichText, _tips, w, h, kAlignCenter, nil, 22,nil,nil,nil,true);
	richText:setAlign(kAlignCenter);
	self.m_View_downTip:addChild(richText);

    --button des
    self.m_Text_button:setText("领取银币");
end

--重写父类函数
CountDownOverGuide._onbutton_goClick = function(self)
    UBReport.getInstance():report(UBConfig.kHallBankruptClickGetGold);
    GuideBase._onbutton_goClick(self);
    LoadingView.getInstance():showText("正在领取破产补助，请稍候...");
    kBankruptDataInterface:requestBankruptMoney();
    --领取金币
end

return CountDownOverGuide
