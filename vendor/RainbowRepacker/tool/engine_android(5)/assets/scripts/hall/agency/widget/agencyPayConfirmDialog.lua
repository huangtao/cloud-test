local agencyConfirmPay = require(ViewPath.."hall/agency/agencyConfirmPay");
require("common/commonGameLayer");

AgencyPayConfirmDialog = class(CommonGameLayer, false);

AgencyPayConfirmDialog.Delegate = {
	onPayConfirmReturnBtnClick = "onPayConfirmReturnBtnClick";
	onPayConfirmBtnClick = "onPayConfirmBtnClick";
};

AgencyPayConfirmDialog.s_controls =
{	
	bg = 1;
	returnBtn = 2;
	payConfirmBtn = 3;

	goodsName = 4;
	goodsPrice = 5;
	goodsDes = 6;
};

AgencyPayConfirmDialog.ctor = function(self)
	super(self, agencyConfirmPay);
	self.m_ctrl = AgencyPayConfirmDialog.s_controls;
	
	self:setFillParent(true,true);

	self:_init();
end

AgencyPayConfirmDialog.dtor = function(self)
end

AgencyPayConfirmDialog.onBgClick = function(self)
end

AgencyPayConfirmDialog.onReturnBtnClick = function(self)
	self:hide();
	self:execDelegate(AgencyPayConfirmDialog.Delegate.onPayConfirmReturnBtnClick);
end

AgencyPayConfirmDialog.onPayConfirmBtnClick = function(self)
	self:execDelegate(AgencyPayConfirmDialog.Delegate.onPayConfirmBtnClick);
end

AgencyPayConfirmDialog._init = function(self)
	local goods = self:_getAgencyGoodsInfo();

	local name = goods.name or "一年代理资格";
	local pamount = number.valueOf(goods.pamount or 500);
	local desc = goods.desc or "";

	self:findViewById(self.m_ctrl.goodsName):setText(name);
	self:findViewById(self.m_ctrl.goodsPrice):setText(pamount.."元");
	self:findViewById(self.m_ctrl.goodsDes):setText(desc);
end

AgencyPayConfirmDialog._getAgencyGoodsInfo = function(self)
	local sceneGoodInfo = kGoodsListInterface:getSceneGoodsInfo(PayConfig.eGoodsListId.AgentCard, {scene = PayConfig.eGoodsListId.AgentCard});
	
	local goodsList = table.verify(sceneGoodInfo.goodsList);
	if table.isEmpty(goodsList) then
		return {};
	end

	local goods = table.verify(goodsList[1]);

	return goods;
end

AgencyPayConfirmDialog.s_controlConfig =
{
	[AgencyPayConfirmDialog.s_controls.bg] 				= {"bg"},
	[AgencyPayConfirmDialog.s_controls.returnBtn]		= {"top",  "returnBtn"},
	[AgencyPayConfirmDialog.s_controls.payConfirmBtn]	= {"content","contentView", "confirmBtn"},

	[AgencyPayConfirmDialog.s_controls.goodsName]		= {"content","contentView","Text1"};
	[AgencyPayConfirmDialog.s_controls.goodsPrice]		= {"content","contentView","line2","Text3"};
	[AgencyPayConfirmDialog.s_controls.goodsDes]		= {"content","contentView","line2","Text4"};
};

AgencyPayConfirmDialog.s_controlFuncMap =
{
	[AgencyPayConfirmDialog.s_controls.bg]				= AgencyPayConfirmDialog.onBgClick,
	[AgencyPayConfirmDialog.s_controls.returnBtn]		= AgencyPayConfirmDialog.onReturnBtnClick,
	[AgencyPayConfirmDialog.s_controls.payConfirmBtn]	= AgencyPayConfirmDialog.onPayConfirmBtnClick,
};
