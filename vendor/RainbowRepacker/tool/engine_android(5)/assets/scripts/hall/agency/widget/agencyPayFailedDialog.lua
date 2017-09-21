local agencyPayFailed = require(ViewPath.."hall/agency/agencyPayFailed");
require("common/commonGameLayer");

AgencyPayFailedDialog = class(CommonGameLayer, false);

AgencyPayFailedDialog.Delegate = {
	onPayFailedReturnBtnClick = "onPayFailedReturnBtnClick";
	onPayAgainBtnClick = "onPayAgainBtnClick";
};

AgencyPayFailedDialog.s_controls =
{	
	bg = 1;
	returnBtn = 2;
	payAgainBtn = 3;
};

AgencyPayFailedDialog.ctor = function(self)
	super(self, agencyPayFailed);
	
	self:setFillParent(true,true);
end

AgencyPayFailedDialog.dtor = function(self)
end

AgencyPayFailedDialog.onBgClick = function(self)
end

AgencyPayFailedDialog.onReturnBtnClick = function(self)
	self:hide();
	self:execDelegate(AgencyPayFailedDialog.Delegate.onPayFailedReturnBtnClick);
end

AgencyPayFailedDialog.onPayAgainBtnClick = function(self)
	self:hide();
	self:execDelegate(AgencyPayFailedDialog.Delegate.onPayAgainBtnClick);
end

AgencyPayFailedDialog.s_controlConfig =
{
	[AgencyPayFailedDialog.s_controls.bg] 			= {"bg"},
	[AgencyPayFailedDialog.s_controls.returnBtn]	= {"top",  "returnBtn"},
	[AgencyPayFailedDialog.s_controls.payAgainBtn]	= {"contentView",  "againBtn"},
};

AgencyPayFailedDialog.s_controlFuncMap =
{
	[AgencyPayFailedDialog.s_controls.bg]			= AgencyPayFailedDialog.onBgClick,
	[AgencyPayFailedDialog.s_controls.returnBtn]	= AgencyPayFailedDialog.onReturnBtnClick,
	[AgencyPayFailedDialog.s_controls.payAgainBtn]	= AgencyPayFailedDialog.onPayAgainBtnClick,
};
