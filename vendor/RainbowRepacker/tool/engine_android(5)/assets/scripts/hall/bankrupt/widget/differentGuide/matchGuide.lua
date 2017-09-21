--救济领取模块
local GuideBase = require("hall/bankrupt/widget/differentGuide/guideBase");
local MatchGuide = class(GuideBase,false);

MatchGuide.ctor = function(self,data)
    UBReport.getInstance():report(UBConfig.kHallBankruptShowMatch);
    self.m_data = table.verify(data);
    self.m_data.isCanFreeGet = kBankruptDataInterface:isBankruptRewardRemain();
    self.m_data.startTime  = kBankruptDataInterface:getCurLeftTime();
    self.m_data.moneyCount = kBankruptDataInterface:getCurBankruptReward();
    super(self);
end

MatchGuide.dtor = function(self)

end

--重写父类函数
MatchGuide._init = function(self)
    GuideBase._init(self);
    --tittle
    if self.m_data.isCanFreeGet then
        self.m_Text_tittleRight:setVisible(true);
        self.m_Text_tittleRight:setText("00:00");
        self.m_Text_tittleLeft:setVisible(true);
        self.m_Text_tittleLeft:setText("免费救济倒计时：");
         --count down time
        self:_countDownTime(self.m_data.startTime,0);
        self.m_View_money_count:setVisible(true);
        self.m_Text_money_count:setText(self.m_data.moneyCount);
    else
        self.m_Text_tittleMiddle:setVisible(true);
        self.m_Text_tittleMiddle:setText("今日救济次数已用完");
    end

    --iconImage
    self.m_Image_iconMatch:setVisible(true);

    --tips
    self.m_View_upTip:setVisible(true);
    self.m_Text_tips:setText("参加免费比赛，赢银币拿大奖");

    --button des
    self.m_Text_button:setText("去比赛场");
end

--重写父类函数
MatchGuide._onbutton_goClick = function(self)
    UBReport.getInstance():report(UBConfig.kHallBankruptClickMatch);
    GuideBase._onbutton_goClick(self);
    StateMachine.getInstance():changeState(States.GameMatchHall); 
    IBaseDialog.remove("bankrupt");
    --去比赛
end

return MatchGuide
