local rechargeTopAd = require(RechargeViewPath.."rechargeTopAd");


local RechargeTopAd = class(CommonGameLayer, false);

RechargeTopAd.s_controls =
{
    bagBtn = 1,
    adText = 2,
    ad_bg = 3,
}

RechargeTopAd.ctor = function(self)
	super(self, rechargeTopAd);
	local w, h = self.m_root:getSize();
	self:setSize(w, h);
	self.m_ctrls = RechargeTopAd.s_controls;
    self:__initViews();
    self.m_ad_bg:setVisible(false);
    self:showAdText("");
end

RechargeTopAd.__initViews = function (self)
    self.m_adText = self:findViewById(self.s_controls.adText);
    self.m_bagBtn = self:findViewById(self.s_controls.bagBtn);
    self.m_ad_bg = self:findViewById(self.s_controls.ad_bg);
end

RechargeTopAd.setBagBtnVisible = function (self, isShow)
    self.m_bagBtn:setVisible(isShow);
end

RechargeTopAd.showAdText = function (self, content)
    if not string.isEmpty(content) then
        self.m_ad_bg:setVisible(true);
        self.m_adText:setText(content);
    end
end

RechargeTopAd.onBagBtnClick = function(self)
	UBReport.getInstance():report(UBConfig.kHallMallBag, string.format("userId_%s", kUserInfoData:getUserId()));
	LayerManagerIsolater.getInstance():show("case_list_ui");
end

RechargeTopAd.s_controlConfig =
{
	[RechargeTopAd.s_controls.adText] = {"commonLayer","ad_bg","adView","adText"},
    [RechargeTopAd.s_controls.bagBtn] = {"commonLayer","bagBtn"},
    [RechargeTopAd.s_controls.ad_bg]  = {"commonLayer","ad_bg"},
};

RechargeTopAd.s_controlFuncMap =
{
	[RechargeTopAd.s_controls.bagBtn] = RechargeTopAd.onBagBtnClick,
};

return RechargeTopAd;
