local taskSignupTip = require(ViewPath.."hall/task/taskSignupTip");

TaskSignupTip = class(CommonGameLayer,false);

TaskSignupTip.s_controls =
{
	bg = 1,
	tipText1 = 2,
	tipText2 =3,
	tipText3= 4,
	cancelBtn = 5,
	okBtn = 6,
	goRechargeBtn=7,
	closeBtn =8,
	subView = 9,
}

TaskSignupTip.ctor = function(self,flag,data)
	super(self,taskSignupTip);
	self:addToRoot();
	Log.v("------TaskSignupTip.ctor-----",flag,data);
	self:setFillParent(true,true);
	self.m_ctrl = TaskSignupTip.s_controls;
	self.m_data = data;
	self.m_flag = flag or 0;
	self:findViews();
	self:init();
end

TaskSignupTip.dtor = function(self)
	
end

TaskSignupTip.findViews = function(self)
	self.m_bg = self:findViewById(self.m_ctrl.bg);
	self.m_tipText1 = self:findViewById(self.m_ctrl.tipText1);
	self.m_tipText2 = self:findViewById(self.m_ctrl.tipText2);
	self.m_tipText3	= self:findViewById(self.m_ctrl.tipText3);
	self.m_cancelBtn = self:findViewById(self.m_ctrl.cancelBtn);
	self.m_okBtn = self:findViewById(self.m_ctrl.okBtn);
	self.m_goRechargeBtn = self:findViewById(self.m_ctrl.goRechargeBtn);
	self.m_closeBtn = self:findViewById(self.m_ctrl.closeBtn);
end
--0：显示补签界面  1显示补签卡不足的界面
TaskSignupTip.init = function(self)
	if self.m_flag and tonumber(self.m_flag) == 0 then
		self:showSignupView();
	else
		self:showGoRechargeView();
	end
end

---显示补签的界面
TaskSignupTip.showSignupView = function(self)
	self.m_tipText1:setVisible(true);
	self.m_tipText2:setVisible(true);
	self.m_tipText3:setVisible(false);
	self.m_tipText2:setText(string.concat("是否补签",self.m_data.day,"号?"));
	self.m_cancelBtn:setVisible(true);
	self.m_okBtn:setVisible(true);
	self.m_goRechargeBtn:setVisible(false);
end

--显示补签卡不足的界面
TaskSignupTip.showGoRechargeView = function(self)
	self.m_tipText1:setVisible(false);
	self.m_tipText2:setVisible(false);
	self.m_tipText3:setVisible(true);
	self.m_cancelBtn:setVisible(false);
	self.m_okBtn:setVisible(false);
	self.m_goRechargeBtn:setVisible(true);
end

TaskSignupTip.onCloseClick = function(self)
	Log.v("-----TaskSignupTip.onCloseClick--------");
	delete(self);
end
---签到
TaskSignupTip.onOkClick = function(self)
	Log.v("----TaskSignTip.onOkClick-----");

	self.m_signRewardFunc(self.m_signRewardObj,self.m_data.day);
	delete(self);
end
--去商城
TaskSignupTip.onGoRechargeClick = function(self)
	Log.v("---------TaskSignupTip.onGoRechargeClick-------");
	self.m_goRechargeFunc(self.m_goRechargeObj);
	delete(self);
end

TaskSignupTip.onSubViewClick = function(self)

end

TaskSignupTip.setOnGoRecharge = function(self,obj,func)
	self.m_goRechargeObj = obj;
	self.m_goRechargeFunc = func;
end

TaskSignupTip.setOnSignReward = function(self,obj,func)
	self.m_signRewardObj = obj;
	self.m_signRewardFunc = func;
end

TaskSignupTip.s_controlConfig =
{
	[TaskSignupTip.s_controls.subView] = {"subView"};
	[TaskSignupTip.s_controls.bg] = {"bg"};
	[TaskSignupTip.s_controls.tipText1] = {"bg","tipsView","tipText1"};
	[TaskSignupTip.s_controls.tipText2] = {"bg","tipsView","tipText2"};
	[TaskSignupTip.s_controls.tipText3]	= {"bg","tipsView","tipText3"};
	[TaskSignupTip.s_controls.cancelBtn] ={"bg","bottomView","cancelBtn"};
	[TaskSignupTip.s_controls.okBtn]	={"bg","bottomView","okBtn"};
	[TaskSignupTip.s_controls.goRechargeBtn] = {"bg","bottomView","goRechargeBtn"};
	[TaskSignupTip.s_controls.closeBtn] = {"bg","closeBtn"};
}

TaskSignupTip.s_controlFuncMap =
{
	[TaskSignupTip.s_controls.subView] = TaskSignupTip.onSubViewClick;
	[TaskSignupTip.s_controls.cancelBtn] = TaskSignupTip.onCloseClick;
	[TaskSignupTip.s_controls.okBtn] = TaskSignupTip.onOkClick;
	[TaskSignupTip.s_controls.goRechargeBtn] = TaskSignupTip.onGoRechargeClick;
	[TaskSignupTip.s_controls.closeBtn] = TaskSignupTip.onCloseClick;
}