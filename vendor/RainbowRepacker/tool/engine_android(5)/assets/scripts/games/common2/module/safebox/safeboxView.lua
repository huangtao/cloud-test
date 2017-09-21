
local ViewBase = require("games/common2/module/viewBase");

local SafeBoxView = class(ViewBase,false);
---------------------------------------------------------------------
----------------- Button event response functions -------------------
---------------------------------------------------------------------

SafeBoxView.strings_zh=
{
	["cashText"]="现金：%s";
	["savingsText"]="存款：%s";
	
	["currentSavings_cun"]="%s";
	["currentSavings_qu"]="%s";
	["serviceFee"]="%s";
	["savingsamount"]="%s";
	["cashamount"]="%s";
	["toast_cun"]="正在存入%s...";
	["toast_qu"]="正在取出%s...";
	["coinNoChanged"]="%s数量未改变";
}

SafeBoxView.s_controls = 
{
	maskView 				= ToolKit.getIndex();
	bg 						= ToolKit.getIndex();
	closeBtn 				= ToolKit.getIndex();
	title 					= ToolKit.getIndex();

	page1 					= ToolKit.getIndex();
	cashText 				= ToolKit.getIndex();
	savingsText 			= ToolKit.getIndex();
	slider 					= ToolKit.getIndex();
	resetBtn  				= ToolKit.getIndex();
	confirmBtn 				= ToolKit.getIndex();
	
	addGoldBtn 				= ToolKit.getIndex();
	cutDownGlodBtn 			= ToolKit.getIndex();
	safeBoxText_one 		= ToolKit.getIndex();
	safeBoxText_two 		= ToolKit.getIndex();
};

SafeBoxView.ctor = function( self, seat, layoutConfig )	
	super(self,layoutConfig);
	self:setFillParent(true,true);
	self.m_seat = seat;

	self.m_ctrls = SafeBoxView.s_controls;

	local moneyType = RoomPropertyData.getInstance():getCurPropertyId();
    self.m_index = moneyType == 1 and 2 or 1;
    self.m_moneyName = RoomPropertyData.getInstance():getCurPropertyName();
	self:initView();
	self:startCalculateTimeoutTimer();
	self:setVisible(false);
end

SafeBoxView.onBgClick = function(self)
end

SafeBoxView.onShadeBgClick = function(self)
	--屏蔽作用
end

SafeBoxView.onMaskTouch = function(self , finger_action , x , y, drawing_id_first , drawing_id_current)
	--屏蔽作用
	self:onCloseClick();
end

-- 关闭保险箱
SafeBoxView.onCloseClick = function(self)
	DialogLogic.getInstance():popDialog();
    local action = GameMechineConfig.ACTION_NS_CLOSE_SAFEBOX;
	MechineManage.getInstance():receiveAction(action);
end

-- 滑块
SafeBoxView.onSliderDrag = function(self)
	if self.m_tag==0 then
		if not self.m_balanceProgress then
			return;
		end
		local progress = self:findViewById(self.m_ctrls.slider):getProgress();
		if self.m_oldProgress == progress then
			return;
		end
		self.m_oldProgress=progress;
		
		if progress>self.m_balanceProgress then--往右存
			
			if self.m_balanceProgress ==1 then
				--当现金小于限制时，只能取不能存
				self.m_desSavings=self.m_srcSavings;
			else
				self.m_desSavings = self.m_srcSavings + math.floor((progress-self.m_balanceProgress)/(1-self.m_balanceProgress)*(self.m_srcCash-self.m_lowestCashMoney));
			end
			self.m_desCash=self:getTotal()-self.m_desSavings;
		else--往左取

			if self.m_balanceProgress ==0 then
				--当存款为0时，只能存不能取
				self.m_desSavings=self.m_srcSavings;
			else
				self.m_desSavings=self.m_srcSavings-math.floor((self.m_balanceProgress-progress)/self.m_balanceProgress*self.m_srcSavings);
			end
			self.m_desCash=self:getTotal()-self.m_desSavings;
		end

		self:findViewById(self.m_ctrls.cashText):setText(string.format(SafeBoxView.strings_zh.cashText,self.m_desCash));
		self:findViewById(self.m_ctrls.savingsText):setText(string.format(SafeBoxView.strings_zh.savingsText,self.m_desSavings));

		self:checkButtonEnable();
	end
end

-- 重置
SafeBoxView.onResetClick = function(self)
	self:initView();
end

-- 往保险箱存钱
SafeBoxView.onAddGoldBtnClick = function(self)
	if self.m_desCash<= self.m_lowestCashMoney then
		return;
	end
	self.m_tag=1;     
	if self.m_desCash- self.m_moneyChangeStep <= self.m_lowestCashMoney then 
		self.m_desSavings=self:getTotal()- self.m_lowestCashMoney;
		self.m_desCash = self.m_lowestCashMoney;
		self:findViewById(self.m_ctrls.slider):setProgress(1);
	else
		self.m_desSavings=self.m_desSavings+self.m_moneyChangeStep;
		self.m_desCash = self:getTotal()-self.m_desSavings;	
		local progress = self:findViewById(self.m_ctrls.slider):getProgress();
		local addProgress = self.m_moneyChangeStep/(self:getTotal()-self.m_lowestCashMoney);	
		self:findViewById(self.m_ctrls.slider):setProgress(progress+addProgress);
	end

	self.m_oldProgress=self:findViewById(self.m_ctrls.slider):getProgress();
	self:findViewById(self.m_ctrls.cashText):setText(string.format(SafeBoxView.strings_zh.cashText,self.m_desCash));
	self:findViewById(self.m_ctrls.savingsText):setText(string.format(SafeBoxView.strings_zh.savingsText,self.m_desSavings));	
	self.m_tag=0;

	self:checkButtonEnable();
end

-- 从保险箱取钱
SafeBoxView.onCutDownBtnClick = function(self)
	if not number.isNum(self.m_desSavings) then
		return ;
	end
	self.m_tag=1;
	if self.m_desSavings<=self.m_moneyChangeStep then 
		self.m_desSavings = 0;
		self.m_desCash = self:getTotal();
		self:findViewById(self.m_ctrls.slider):setProgress(0);
	else
		self.m_desSavings=self.m_desSavings-self.m_moneyChangeStep;
		self.m_desCash = self:getTotal()-self.m_desSavings;
		local progress = self:findViewById(self.m_ctrls.slider):getProgress();
		local subProgress = self.m_moneyChangeStep/(self:getTotal()-self.m_lowestCashMoney);	
		self:findViewById(self.m_ctrls.slider):setProgress(progress-subProgress);		
	end

	self.m_oldProgress=self:findViewById(self.m_ctrls.slider):getProgress();
	self:findViewById(self.m_ctrls.cashText):setText(string.format(SafeBoxView.strings_zh.cashText,self.m_desCash));
	self:findViewById(self.m_ctrls.savingsText):setText(string.format(SafeBoxView.strings_zh.savingsText,self.m_desSavings));	
	self.m_tag=0;

	self:checkButtonEnable();
end

-- 确认取款
SafeBoxView.onConfirmClick = function(self)
	if self.m_desSavings and self.m_desCash and self.m_desSavings ~= self.m_srcSavings and self.m_desCash ~= self.m_srcCash then

		local currentSavings = self.m_desSavings - self.m_srcSavings;
		if self.m_desSavings < self.m_srcSavings then -- 当前存款>初始存款，取钱
			local str = string.format(SafeBoxView.strings_zh.toast_qu, self.m_moneyName)
			NativeEvent.getInstance():ShowLoadingDialog(str);
			SafeBoxIsolater.getInstance():updateSafeBox(2, math.abs(currentSavings), self:getMoneyType());
		end
	else
		local str = string.format(SafeBoxView.strings_zh.coinNoChanged, self.m_moneyName) 
		Toast.getInstance():showTextView(str,620, height or 60,kAlignCenter,"",30,200,175,115);
	end
end

-- 存款结果
SafeBoxView.onUpdateSafeBoxCallBack = function(self, seat, uid, info, isFast)
	if not self:getVisible() then 
		return;
	end 
	if info then
		if info.isSuccess then
			data = table.verify(info.data);
			local money = number.valueOf(data.money);
			local isSaved = money > 0;
			local str = string.format(isSaved and "%s成功存入保险箱" or "成功从保险箱取出%s", self.m_moneyName)
			Toast.getInstance():showText(str,50,30,kAlignLeft,"",24,200,175,110);
			self:onCloseClick();
		else
			Toast.getInstance():showText("保险箱金额变更失败",50,30,kAlignLeft,"",24,200,175,110);
		end
	end
	NativeEvent.getInstance():HideLoadingDialog();
end

SafeBoxView.startCalculateTimeoutTimer = function(self)
	self:clearCalculateTimeoutTimer();
	self.m_calculateTimeOut = AnimFactory.createAnimInt(kAnimRepeat,0,1,200,-1);
	ToolKit.setDebugName(self.m_calculateTimeOut,"AnimInt|SafeBoxView.startCalculateTimeoutTimer|timeOut");
	self.m_calculateTimeOut:setEvent(self,self.onCalculateRequestTimeout);
end 

SafeBoxView.clearCalculateTimeoutTimer = function(self)
	delete(self.m_calculateTimeOut);
	self.m_calculateTimeOut = nil;
end

SafeBoxView.onCalculateRequestTimeout = function(self)
	self:onSliderDrag();
end

---------------------------------------------------------------------
----------------- 构造和析构函数 -------------------------------------
---------------------------------------------------------------------

SafeBoxView.dtor = function(self)
    self.m_index = nil	
    self.m_moneyName = nil;
	self:clearCalculateTimeoutTimer();
	self.m_data=nil;
	self.m_balanceProgress=nil;
	self.m_oldProgress=nil;
	NativeEvent.getInstance():HideLoadingDialog();
	DialogLogic.getInstance():popDialogStack();
end

-- 初始化
SafeBoxView.initView = function(self)	
	self.m_downBtn = self:findViewById(self.m_ctrls.cutDownGlodBtn);
	self.m_addBtn = self:findViewById(self.m_ctrls.addGoldBtn);
	self.m_safeBoxText_one = self:findViewById(self.m_ctrls.safeBoxText_one)
	self.m_safeBoxText_two = self:findViewById(self.m_ctrls.safeBoxText_two)
	self.m_title = self:findViewById(self.m_ctrls.title)
	
	self.m_srcCash = self:getSrcCash();   --初始的现金
	self.m_desCash = self.m_srcCash;
	self.m_srcSavings = self:getSrcSavings(); --初始的存款
	self.m_tag = 0;
	self.m_desSavings = self.m_srcSavings;
	
	self.m_lowestCashMoney = self.m_srcCash; -- 获取存款的限制，银币低于这个值不能存款
	self.m_moneyChangeStep = self:getChangeStep(); -- 获取每次增加/减少金钱的变化数

	if self:getTotal() > 0 then
		self.m_balanceProgress = 1;
	else
		self.m_balanceProgress=nil;
	end
	
	if self.m_srcSavings == 0 then
		self.m_balanceProgress = 0;		
		self:findViewById(self.m_ctrls.slider):setEnable(false);
	else 
		self:findViewById(self.m_ctrls.slider):setEnable(true);
	end 
	self:findViewById(self.m_ctrls.slider):setProgress(self.m_balanceProgress or 0.5);
	self:findViewById(self.m_ctrls.slider):setImages(
		"isolater/progress_bg_l15_r15_t15_b15.png",
		"isolater/progress_fg_l15_r15_t15_b15.png",
		"isolater/progress_btn.png");
	self:findViewById(self.m_ctrls.cashText):setText(string.format(SafeBoxView.strings_zh.cashText,self.m_srcCash));
	self:findViewById(self.m_ctrls.savingsText):setText(string.format(SafeBoxView.strings_zh.savingsText,self.m_srcSavings));

	self:setEventTouch(self,SafeBoxView.onShadeBgClick);
	self:setEventDrag(self,SafeBoxView.onShadeBgClick);

	self:setSafeBoxText(self.m_index)
	self:setTitle(self.m_index)

	self:checkButtonEnable();
end

SafeBoxView.setTitle = function(self, index)
	if self.m_title then
		local str = string.format("%s保险箱", self.m_moneyName);
		self.m_title:setText(str)
	end
end

SafeBoxView.setSafeBoxText = function(self, index)
	if not self.m_safeBoxText_one or not self.m_safeBoxText_two then
		return
	end
	local step = self:getChangeStep()
	local unit = self.m_moneyName;
	local str_one = "1.牌桌保险箱只能取款，无法使用存款功能"
	local str_two = string.format("2.通过\"+\"、\"-\"可以%s%s为单位进行调节", step, unit)
	self.m_safeBoxText_one:setText(str_one)
	self.m_safeBoxText_two:setText(str_two)
	self.m_safeBoxText_one:setScrollBarWidth(0)
	self.m_safeBoxText_two:setScrollBarWidth(0)
end

SafeBoxView.getMoneyType = function(self)
	return (self.m_index == 1) and 0 or 1
end

SafeBoxView.getSrcCash = function(self)
	return (self.m_index == 1) and UserPropertyIsolater.getInstance():getMoney() or UserPropertyIsolater.getInstance():getCrystal()
end

SafeBoxView.getSrcSavings = function(self)
	return (self.m_index == 1) and UserPropertyIsolater.getInstance():getSafeBoxCurMoney() or UserPropertyIsolater.getInstance():getSafeBoxCurCrystal()
end

SafeBoxView.getLowestCash = function(self)
	return (self.m_index == 1) and SafeBoxIsolater.getInstance():getLowestCashMoney() or SafeBoxIsolater.getInstance():getCrystalLowestCash()
end

SafeBoxView.getChangeStep = function(self)
	return (self.m_index == 1) and SafeBoxIsolater.getInstance():getMoneyChangeStep() or SafeBoxIsolater.getInstance():getCrystalChangeStep()
end

SafeBoxView.getTotal = function(self)
	return (self.m_index == 1) and UserPropertyIsolater.getInstance():getTotalMoney() or UserPropertyIsolater.getInstance():getTotalCrystal()
end

SafeBoxView.checkButtonEnable = function(self)
	-- 资产<=0
	if self:getTotal() <= 0 then
		self.m_downBtn:setEnable(false);
		self.m_downBtn:setGray(true)
		self.m_addBtn:setEnable(false);
		self.m_addBtn:setGray(true)
		return;
	end

	-- 现金小于要求并且无存款
	if self.m_desCash <= self.m_lowestCashMoney and self.m_desSavings <= 0 then
		self.m_downBtn:setEnable(false);
		self.m_downBtn:setGray(true)
		self.m_addBtn:setEnable(false);
		self.m_addBtn:setGray(true)
		return;
	end

	-- 存款是否大于0：大于0显示-按钮
	self.m_downBtn:setEnable(self.m_desSavings > 0);
	self.m_downBtn:setGray(not (self.m_desSavings > 0))

	if self.m_desCash < self.m_lowestCashMoney and self.m_desSavings > 0 then
		self.m_addBtn:setEnable(false); -- 不满足存款条件
		self.m_addBtn:setGray(true)
	else
		self.m_addBtn:setEnable(self.m_desCash > self.m_lowestCashMoney); -- 现金是否大于要求
		self.m_addBtn:setGray(not (self.m_desCash > self.m_lowestCashMoney))
	end
end

SafeBoxView.showSafeBox = function(self, seat, uid, info, isFast)
    self.m_index = (tonumber(info) or 0) + 1
    self:initView()
	self:setVisible(true);
	DialogLogic.getInstance():pushDialogStack(self,self.onCloseClick);
end

----------------- config tables -------------------------------------
---------------------------------------------------------------------
SafeBoxView.s_controlConfig = 
{	
	[SafeBoxView.s_controls.maskView] 			= {"maskView"};
	[SafeBoxView.s_controls.closeBtn] 			= {"contentView", "closeBtn"};
	[SafeBoxView.s_controls.bg] 				= {"contentView", "bg"};
	[SafeBoxView.s_controls.title] 				= {"contentView", "titleBg", "title"};

	[SafeBoxView.s_controls.cashText] 			= {"contentView", "topView", "cashText"};
	[SafeBoxView.s_controls.savingsText] 		= {"contentView", "topView", "savingsText"};	

	[SafeBoxView.s_controls.page1] 				= {"contentView", "centerView", "page1"};
	[SafeBoxView.s_controls.slider] 			= {"contentView", "centerView", "page1","slider"};
	[SafeBoxView.s_controls.resetBtn] 			= {"contentView", "centerView", "page1","resetBtn"};
	[SafeBoxView.s_controls.confirmBtn] 		= {"contentView", "centerView", "page1","confirmBtn"};
	[SafeBoxView.s_controls.addGoldBtn] 		= {"contentView", "centerView", "page1","addGoldBtn"};
	[SafeBoxView.s_controls.cutDownGlodBtn] 	= {"contentView", "centerView", "page1","cutDownGlodBtn"};

	[SafeBoxView.s_controls.safeBoxText_one] 	= {"contentView", "bottomView", "safePrompt1"};
	[SafeBoxView.s_controls.safeBoxText_two] 	= {"contentView", "bottomView", "safePrompt2"};
};


SafeBoxView.s_controlFuncMap =
{
	[SafeBoxView.s_controls.maskView] 				= SafeBoxView.onMaskTouch;
	[SafeBoxView.s_controls.bg] 					= SafeBoxView.onBgClick;
	[SafeBoxView.s_controls.closeBtn] 				= SafeBoxView.onCloseClick;

	[SafeBoxView.s_controls.resetBtn] 				= SafeBoxView.onResetClick;
	[SafeBoxView.s_controls.confirmBtn] 			= SafeBoxView.onConfirmClick;
	[SafeBoxView.s_controls.addGoldBtn] 			= SafeBoxView.onAddGoldBtnClick;
	[SafeBoxView.s_controls.cutDownGlodBtn] 		= SafeBoxView.onCutDownBtnClick;
}

SafeBoxView.s_actionFuncMap = {
	[GameMechineConfig.ACTION_NS_OPEN_SAFEBOX]		= "showSafeBox";
	[GameMechineConfig.ACTION_NS_SAFEBOXRESULT]		= "onUpdateSafeBoxCallBack";
};

return SafeBoxView;