local agencyPaying = require(ViewPath.."hall/agency/agencyPaying");
require("common/commonGameLayer");
require("util/timeOutTimer");

AgencyPayingDialog = class(CommonGameLayer, false);

AgencyPayingDialog.Delegate = {
	onShowPayingDialogTimeOut = "onShowPayingDialogTimeOut";
};

AgencyPayingDialog.s_controls =
{	
	bg = 1;
	loading = 2;
};

AgencyPayingDialog.s_showTimeOut = 60*1000;

AgencyPayingDialog.ctor = function(self)
	super(self, agencyPaying);
	
	self:setFillParent(true,true);
end

AgencyPayingDialog.dtor = function(self)
end

AgencyPayingDialog.show = function(self,time)
	CommonGameLayer.show(self);

	self:_init(time);
end

AgencyPayingDialog.hide = function(self)
	self:_clearLoadingAnim();
	self:_clearShowTimeoutTimer();
	CommonGameLayer.hide(self);
end

AgencyPayingDialog.onBgClick = function(self)
end

AgencyPayingDialog._init = function(self,time)
	self:_addLoadingAnim();

	if not self.m_timeOutTimer then 
		self.m_timeOutTimer = new(TimeOutTimer, self);
	end 
	time = number.valueOf(time or AgencyPayingDialog.s_showTimeOut);
	self.m_timeOutTimer:startTimer("AgencyPayingDialog.Show",self._onShowTimeout,time);
end

AgencyPayingDialog._onShowTimeout = function(self)
	self:hide();
	self:execDelegate(AgencyPayingDialog.Delegate.onShowPayingDialogTimeOut);
end

AgencyPayingDialog._clearShowTimeoutTimer = function(self)
	if self.m_timeOutTimer then 
		self.m_timeOutTimer:clearTimer("AgencyPayingDialog.Show");
	end
end

AgencyPayingDialog._addLoadingAnim = function(self)
	self:_clearLoadingAnim();

	local loading = self:findViewById(AgencyPayingDialog.s_controls.loading);
	loading:addPropRotate(0, kAnimRepeat, 2000, 0, 0, 360, kCenterDrawing);
end

AgencyPayingDialog._clearLoadingAnim = function(self)
	local loading = self:findViewById(AgencyPayingDialog.s_controls.loading);

	if not loading:checkAddProp(0) then
		loading:removeProp(0);
	end
end

AgencyPayingDialog.s_controlConfig =
{
	[AgencyPayingDialog.s_controls.bg] 			= {"bg"},
	[AgencyPayingDialog.s_controls.loading]		= {"contentView",  "loading"},
};

AgencyPayingDialog.s_controlFuncMap =
{
	[AgencyPayingDialog.s_controls.bg]			= AgencyPayingDialog.onBgClick,
};
