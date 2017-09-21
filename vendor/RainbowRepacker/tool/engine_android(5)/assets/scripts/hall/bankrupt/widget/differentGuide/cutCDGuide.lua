--救济领取模块
local GuideBase = require("hall/bankrupt/widget/differentGuide/guideBase");
local CutCDGuide = class(GuideBase,false);

CutCDGuide.ctor = function(self,data)
    UBReport.getInstance():report(UBConfig.kHallBankruptCutCD);
    self.m_data = table.verify(data);
    self.m_data.isCanFreeGet = kBankruptDataInterface:isBankruptRewardRemain();
    self.m_data.startTime  = kBankruptDataInterface:getCurLeftTime();
    self.m_data.moneyCount = kBankruptDataInterface:getCurBankruptReward();

    local shareInfo = ShareDataInterface.getInstance():getShareTemplate();
    shareInfo = shareInfo.broken or {};
    self.m_data.share_url = shareInfo.share_url or "";
    self.m_data.title = shareInfo.desc or "";
    self.m_data.desc = shareInfo.desc or "";
    self.m_data.share_icon = shareInfo.share_icon or "";

    super(self);

    WeixinShareUtil.getInstance():setObserver(self);
end

CutCDGuide.dtor = function(self)
    WeixinShareUtil.getInstance():clearObserver(self);
end

--重写父类函数
CutCDGuide._init = function(self)
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
    self.m_Image_cut_cd:setVisible(true);

    --tips
    self.m_View_upTip:setVisible(true);
    self.m_Text_tips:setText("分享后，无需等待立即领取救济金");

    --button des
    self.m_Text_button:setText("分享到朋友圈");
end

CutCDGuide.getWeiChatCallback = function(self, isSuccess, param, shareChannel)
    Log.v("ShareNotice.getWeiChatCallback", " isSuccess = ", isSuccess, " param = ", param);
    if isSuccess then
        --请求减CD
        kBankruptDataInterface:requestBankruptCount(1);
        UBReport.getInstance():report(UBConfig.kHallBankruptCutCDOK);
    end
end

--重写父类函数
CutCDGuide._onbutton_goClick = function(self)
    --UBReport.getInstance():report(UBConfig.kHallBankruptClickMatch);
    GuideBase._onbutton_goClick(self);
    --分享到微信朋友圈
    local jumpInfo = {};
    jumpInfo.cmd = CommonJumpCmds.GOTO_WEIXIN_SHARE;
    jumpInfo.info = {};
    jumpInfo.info.share_url = self.m_data.share_url;
    jumpInfo.info.title = self.m_data.title;
    jumpInfo.info.desc = self.m_data.desc;
    jumpInfo.info.share_icon = self.m_data.share_icon;

    CommonJumpLogic.getInstance():executeJsCall(jumpInfo);
end

return CutCDGuide
