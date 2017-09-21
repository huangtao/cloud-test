
require("common/commonScene");
local SafeBoxScene = class(CommonScene);


require("util/StringLib");

---------------------------------------------------------------------
----------------- Button event response functions -------------------
---------------------------------------------------------------------

SafeBoxScene.strings_zh=
{
	["cashText"]="%s";
	["savingsText"]="%s";
	
	["currentSavings_cun"]="%s";
	["currentSavings_qu"]="%s";
	["serviceFee"]="%s";
	["savingsamount"]="%s";
	["cashamount"]="%s";
	["toast_cun"]="正在存入%s...";
	["toast_qu"]="正在取出%s...";
	["coinNoChanged"]="%s数量未改变";
}

local h_index = 0;
local getIndex = function(self)
	h_index = h_index + 1;
	return h_index;
end

SafeBoxScene.s_controls = 
{
	maskView = getIndex();
	bg = getIndex();
	closeBtn = getIndex();

	page1 = getIndex();
	cashText = getIndex();
	savingsText = getIndex();
	slider = getIndex();
	resetBtn  = getIndex();
	confirmBtn = getIndex();
	
	page2 = getIndex();
	currentSavings = getIndex();
	serviceFee = getIndex();
	savingsamount = getIndex();
	cashamount = getIndex();
	backBtn  = getIndex();
	page2confirmBtn = getIndex();

	addGoldBtn = getIndex();
	cutDownGlodBtn = getIndex();
	safeBoxText_one = getIndex();
	safeBoxText_two = getIndex();

	radioButtonGroup = getIndex();
	goldRadioButton = getIndex();
	bullionRadioButton = getIndex();

	title = getIndex();
	cashIcon = getIndex();
	savingsIcon = getIndex();

};

SafeBoxScene.ctor = function(self, viewConfig, controller, currencyId, isHideMenu)	
	self.m_controller = controller;
	self.m_ctrls = SafeBoxScene.s_controls;
	self.m_socket = OnlineSocketManager.getInstance();
	self.m_isHideMenu = isHideMenu
	self.m_index = (tonumber(currencyId) or 0) + 1
	self:init();
	self:startCalculateTimeoutTimer();

	SafeBoxDataInterface.getInstance():setObserver(self);
end

SafeBoxScene.resume = function(self)
	CommonScene.resume(self);
end

SafeBoxScene.pause = function(self)
	CommonScene.pause(self);
end


SafeBoxScene.onBgClick = function(self)
end

SafeBoxScene.onShadeBgClick = function(self)
	--屏蔽作用
end

SafeBoxScene.onMaskTouch = function(self , finger_action , x , y, drawing_id_first , drawing_id_current)
	--屏蔽作用
end

SafeBoxScene.onCloseClick = function(self)
     self:requestCtrlCmd(SafeBoxController.s_cmds.goBack);
end

SafeBoxScene.onSliderDrag = function(self)
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

		self:findViewById(self.m_ctrls.cashText):setText(string.format(SafeBoxScene.strings_zh.cashText,self.m_desCash));
		self:findViewById(self.m_ctrls.savingsText):setText(string.format(SafeBoxScene.strings_zh.savingsText,self.m_desSavings));

		self:checkButtonEnable();
	end
end

SafeBoxScene.onResetClick = function(self)
	self:init();
end

SafeBoxScene.onAddGoldBtnClick = function(self)
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
	self:findViewById(self.m_ctrls.cashText):setText(string.format(SafeBoxScene.strings_zh.cashText,self.m_desCash));
	self:findViewById(self.m_ctrls.savingsText):setText(string.format(SafeBoxScene.strings_zh.savingsText,self.m_desSavings));	
	self.m_tag=0;

	self:checkButtonEnable();
end

SafeBoxScene.onCutDownBtnClick = function(self)
	if not number.isNum(self.m_desSavings) then
		return ;
	end
	self.m_tag=1;
	if self.m_desSavings<=self.m_moneyChangeStep then 
		self.m_desSavings = 0;
		self.m_desCash = 	self:getTotal();
		self:findViewById(self.m_ctrls.slider):setProgress(0);
	else
		self.m_desSavings=self.m_desSavings-self.m_moneyChangeStep;
		self.m_desCash = self:getTotal()-self.m_desSavings;
		local progress = self:findViewById(self.m_ctrls.slider):getProgress();
		local subProgress = self.m_moneyChangeStep/(self:getTotal()-self.m_lowestCashMoney);	
		self:findViewById(self.m_ctrls.slider):setProgress(progress-subProgress);		
	end

	self.m_oldProgress=self:findViewById(self.m_ctrls.slider):getProgress();
	self:findViewById(self.m_ctrls.cashText):setText(string.format(SafeBoxScene.strings_zh.cashText,self.m_desCash));
	self:findViewById(self.m_ctrls.savingsText):setText(string.format(SafeBoxScene.strings_zh.savingsText,self.m_desSavings));	
	self.m_tag=0;

	self:checkButtonEnable();
end

SafeBoxScene.onConfirmClick = function(self)
    local name = (self.m_index == 1) and "银币" or "金条"; 
	if self.m_desSavings and self.m_desCash and self.m_desSavings ~= self.m_srcSavings and self.m_desCash ~= self.m_srcCash then

		local feeRatio = SafeBoxDataInterface.getInstance():getFeeRatioByDiff( self.m_desSavings-self.m_srcSavings, self.m_index);
		local serviceFee=self.m_desSavings> self.m_srcSavings and math.ceil((self.m_desSavings-self.m_srcSavings)*feeRatio) or 0;
		serviceFee=math.min(serviceFee, SafeBoxDataInterface.getInstance():getMaxServiceFee(self.m_index) );
		local currentSavings=self.m_desSavings-self.m_srcSavings;
		local savingsamount=self.m_desSavings-serviceFee;
		local cashamount=self.m_desCash;

		local str=currentSavings>0 and SafeBoxScene.strings_zh.currentSavings_cun or SafeBoxScene.strings_zh.currentSavings_qu;
		self:findViewById(self.m_ctrls.currentSavings):setText(string.format(str,math.abs(currentSavings)));
		self:findViewById(self.m_ctrls.serviceFee):setText(string.format(SafeBoxScene.strings_zh.serviceFee,serviceFee));
		self:findViewById(self.m_ctrls.savingsamount):setText(string.format(SafeBoxScene.strings_zh.savingsamount,savingsamount));
		self:findViewById(self.m_ctrls.cashamount):setText(string.format(SafeBoxScene.strings_zh.cashamount,cashamount));
		

		if self.m_desSavings> self.m_srcSavings then--存钱
			if not SafeBoxDataInterface.getInstance():isFree() and self.m_index == 1 then
				self:findViewById(self.m_ctrls.page1):setVisible(false);
				self:findViewById(self.m_ctrls.page2):setVisible(true);
			else
				self:onpage2confirmClick();
			end
		else--取钱
			local str = string.format(SafeBoxScene.strings_zh.toast_qu, name)
			NativeEvent.getInstance():ShowLoadingDialog(str);
			SafeBoxDataInterface.getInstance():updateSafeBox(2, math.abs(currentSavings), self:getMoneyType());
		end
	else
		local str = string.format(SafeBoxScene.strings_zh.coinNoChanged, name) 
		Toast.getInstance():showTextView(str,620, height or 60,kAlignCenter,"",30,200,175,115);
	end
end

SafeBoxScene.onUpdateSafeBoxCallBack = function(self, isSuccess, data)
	if isSuccess then
		data = table.verify(data);
		local money = number.valueOf(data.money);
		local isSaved = money > 0;
        local name = (self.m_index == 1) and "银币" or "金条"
		local str = string.format(isSaved and "%s成功存入保险箱" or "成功从保险箱取出%s", name)
		Toast.getInstance():showText(str,50,30,kAlignLeft,"",24,200,175,110);
		self:onCloseClick();
	else
		Toast.getInstance():showText("保险箱金额变更失败",50,30,kAlignLeft,"",24,200,175,110);
	end

	NativeEvent.getInstance():HideLoadingDialog();
end

SafeBoxScene.onBackClick = function(self)
	self:findViewById(self.m_ctrls.page1):setVisible(true);
	self:findViewById(self.m_ctrls.page2):setVisible(false);
end

SafeBoxScene.onpage2confirmClick = function(self)
	--发送网络请求
	local feeRatio = SafeBoxDataInterface.getInstance():getFeeRatioByDiff( self.m_desSavings-self.m_srcSavings, self.m_index);
	local currentSavings=self.m_desSavings-self.m_srcSavings;
	local serviceFee=math.ceil((self.m_desSavings-self.m_srcSavings)*feeRatio);
	local savingsamount=self.m_desSavings-serviceFee;
	local cashamount=self.m_desCash;
    local name = (self.m_index==1) and "银币" or "金条";
	local str = string.format((currentSavings>0 and SafeBoxScene.strings_zh.toast_cun or SafeBoxScene.strings_zh.toast_qu), name);

	NativeEvent.getInstance():ShowLoadingDialog(str);

	SafeBoxDataInterface.getInstance():updateSafeBox(currentSavings>0 and 1 or 2, math.abs(currentSavings), self:getMoneyType());
end

SafeBoxScene.startCalculateTimeoutTimer = function(self)
	self:clearCalculateTimeoutTimer();
	self.m_calculateTimeOut = AnimFactory.createAnimInt(kAnimRepeat,0,1,200,-1);
	ToolKit.setDebugName(self.m_calculateTimeOut,"AnimInt|SafeBoxScene.startCalculateTimeoutTimer|timeOut");
	self.m_calculateTimeOut:setEvent(self,self.onCalculateRequestTimeout);
end 

SafeBoxScene.clearCalculateTimeoutTimer = function(self)
	delete(self.m_calculateTimeOut);
	self.m_calculateTimeOut = nil;
end

SafeBoxScene.onCalculateRequestTimeout = function(self)
	self:onSliderDrag();
end

---------------------------------------------------------------------
----------------- 构造和析构函数 -------------------------------------
---------------------------------------------------------------------

SafeBoxScene.dtor = function(self)	
	self:clearCalculateTimeoutTimer();
	self.m_data=nil;
	self.m_balanceProgress=nil;
	self.m_oldProgress=nil;
	self.m_index = nil
	NativeEvent.getInstance():HideLoadingDialog();
	SafeBoxDataInterface.getInstance():clearObserver(self);
end

SafeBoxScene.init = function(self)	
	self.m_downBtn = self:findViewById(self.m_ctrls.cutDownGlodBtn);
	self.m_addBtn = self:findViewById(self.m_ctrls.addGoldBtn);

	self.m_title = self:findViewById(self.m_ctrls.title)
	self.m_radioButtonGroup = self:findViewById(self.m_ctrls.radioButtonGroup)
	self.m_cashIcon = self:findViewById(self.m_ctrls.cashIcon)
	self.m_savingsIcon = self:findViewById(self.m_ctrls.savingsIcon)
	self.m_cashText = self:findViewById(self.m_ctrls.cashText)
	self.m_savingsText = self:findViewById(self.m_ctrls.savingsText)
	self.m_safeBoxText_one = self:findViewById(self.m_ctrls.safeBoxText_one)
	self.m_safeBoxText_two = self:findViewById(self.m_ctrls.safeBoxText_two)

	self.m_srcCash = self:getSrcCash()  --开始的现金
	self.m_desCash = self.m_srcCash;
	self.m_srcSavings = self:getSrcSavings() --开始的存款
	self.m_tag = 0;
	self.m_desSavings = self.m_srcSavings;
	
	self.m_lowestCashMoney = self:getLowestCash()
	self.m_moneyChangeStep = self:getChangeStep()
	self.m_total = self:getTotal()

	if self.m_total > 0 then
		if self.m_srcCash > self.m_lowestCashMoney then
			if self.m_srcSavings <= 0 then --当存款为0是，balanceProgress=0
				self.m_balanceProgress=0;
			else
				self.m_balanceProgress = self.m_srcSavings/(self.m_total - self.m_lowestCashMoney);
			end
		else
			self.m_balanceProgress = 1;
		end
	else
		self.m_balanceProgress=nil;
	end
	
	self:findViewById(self.m_ctrls.slider):setProgress(self.m_balanceProgress or 0.5);
	self:findViewById(self.m_ctrls.slider):setImages(
		"hall/common/progress_bg_l15_r15_t15_b15.png",
		"hall/common/progress_fg_l15_r15_t15_b15.png",
		"hall/common/progress_btn.png");

	self:setEventTouch(self,SafeBoxScene.onShadeBgClick);
	self:setEventDrag(self,SafeBoxScene.onShadeBgClick);

	self:checkButtonEnable();

	self:setSafeBoxText(self.m_index)
	self.m_radioButtonGroup:setSelected(self.m_index)
	self:setMoney(self.m_index)
	self:setTitle(self.m_index)
	self:setRadioButtonGroup(not self.m_isHideMenu)
	self:findViewById(self.m_ctrls.page1):setVisible(true)
	self:findViewById(self.m_ctrls.page2):setVisible(false)
end

SafeBoxScene.getMoneyType = function(self)
	return (self.m_index == 1) and 0 or 1
end

SafeBoxScene.getSrcCash = function(self)
	return (self.m_index == 1) and kUserInfoData:getMoney() or kUserInfoData:getCrystal()
end

SafeBoxScene.getSrcSavings = function(self)
	return (self.m_index == 1) and kUserInfoData:getSafeBoxCurMoney() or kUserInfoData:getSafeBoxCurCrystal()
end

SafeBoxScene.getLowestCash = function(self)
	return (self.m_index == 1) and SafeBoxDataInterface.getInstance():getLowestCashMoney() or SafeBoxDataInterface.getInstance():getCrystalLowestCash()
end

SafeBoxScene.getChangeStep = function(self)
	return (self.m_index == 1) and SafeBoxDataInterface.getInstance():getMoneyChangeStep() or SafeBoxDataInterface.getInstance():getCrystalChangeStep()
end

SafeBoxScene.getTotal = function(self)
	return (self.m_index == 1) and kUserInfoData:getTotalMoney() or kUserInfoData:getTotalCrystal()
end

SafeBoxScene.setMoney = function(self, index)
	if not self.m_cashIcon or not self.m_savingsIcon or not self.m_cashText or not self.m_savingsText then
		return
	end
	local fileName = (index == 1) and "hall/safebox/gold.png" or "hall/safebox/bullion.png"
	local iconWidth, iconHeight = (index == 1) and 38 or 49, (index == 1) and 38 or 37
	local cashTextPosX, savingsTextX = (index == 1) and 253 or 265, (index == 1) and 594 or 606
	self.m_cashText:setText(string.format(SafeBoxScene.strings_zh.cashText,self.m_srcCash))
	self.m_cashText:setPos(cashTextPosX, 0)
	self.m_savingsText:setText(string.format(SafeBoxScene.strings_zh.savingsText,self.m_srcSavings))
	self.m_savingsText:setPos(savingsTextX, 0)
	self.m_cashIcon:setFile(fileName)
	self.m_cashIcon:setSize(iconWidth, iconHeight)
	self.m_cashIcon:setPos(210, 8)
	self.m_savingsIcon:setFile(fileName)
	self.m_savingsIcon:setSize(iconWidth, iconHeight)
	self.m_savingsIcon:setPos(550, 8)
end

SafeBoxScene.setRadioButtonGroup = function(self, state)
	if self.m_radioButtonGroup then
		self.m_radioButtonGroup:setVisible(state)
	end
end

SafeBoxScene.setSafeBoxText = function(self, index)
	if not self.m_safeBoxText_one or not self.m_safeBoxText_two then
		return
	end
	local min = self:getLowestCash()
	local step = self:getChangeStep()
	local unit = (index == 1) and "银币" or "金条"
	local str_one = string.format("1.资产在%s%s以上的玩家可通过保险箱存取%s", min, unit, unit)
	local str_two = string.format("2.通过\"+\"、\"-\"可以%s%s为单位进行调节", step, unit)
	self.m_safeBoxText_one:setText(str_one)
	self.m_safeBoxText_two:setText(str_two)
end

SafeBoxScene.setTitle = function(self, index)
	if self.m_title then
		local str = (index == 1) and "银币保险箱" or "金条保险箱"
		self.m_title:setText(str)
	end
end

SafeBoxScene.onRadioButtonGroup = function(self, curIndex, lastIndex)
	kEffectPlayer:play(Effects.AudioButtonClick)
	self:setModuleIndex(curIndex)
end

SafeBoxScene.setModuleIndex = function(self, index)
	self.m_index = index
	self:init()
end

SafeBoxScene.checkButtonEnable = function(self)
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

----------------- config tables -------------------------------------
---------------------------------------------------------------------
SafeBoxScene.s_controlConfig = 
{	
	[SafeBoxScene.s_controls.maskView] = {"maskView"};
	[SafeBoxScene.s_controls.closeBtn] = {"contentView", "closeBtn"};
	[SafeBoxScene.s_controls.bg] 		= {"contentView", "bg"};
	[SafeBoxScene.s_controls.title] 		= {"contentView", "titleBg", "title"};
	[SafeBoxScene.s_controls.radioButtonGroup] = {"contentView", "radioButtonGroup"};
	[SafeBoxScene.s_controls.goldRadioButton] = {"contentView", "radioButtonGroup", "goldRadioButton"};
	[SafeBoxScene.s_controls.bullionRadioButton] = {"contentView", "radioButtonGroup", "bullionRadioButton"};

	[SafeBoxScene.s_controls.cashText] 	= {"contentView", "topView", "cashText"};
	[SafeBoxScene.s_controls.savingsText] 	= {"contentView", "topView", "savingsText"};
	[SafeBoxScene.s_controls.cashIcon] 	= {"contentView", "topView", "cashIcon"};
	[SafeBoxScene.s_controls.savingsIcon] 	= {"contentView", "topView", "savingsIcon"};	

	[SafeBoxScene.s_controls.page1] 		= {"contentView", "centerView", "page1"};
	[SafeBoxScene.s_controls.slider] 		= {"contentView", "centerView", "page1","slider"};
	[SafeBoxScene.s_controls.resetBtn] 	= {"contentView", "centerView", "page1","resetBtn"};
	[SafeBoxScene.s_controls.confirmBtn] 	= {"contentView", "centerView", "page1","confirmBtn"};
	[SafeBoxScene.s_controls.addGoldBtn] 	= {"contentView", "centerView", "page1","addGoldBtn"};
	[SafeBoxScene.s_controls.cutDownGlodBtn] 	= {"contentView", "centerView", "page1","cutDownGlodBtn"};

	[SafeBoxScene.s_controls.page2] 			= {"contentView", "centerView", "page2"};
	[SafeBoxScene.s_controls.currentSavings] 	= {"contentView", "centerView", "page2","currentSavings"};
	[SafeBoxScene.s_controls.serviceFee]		= {"contentView", "centerView", "page2","serviceFee"};
	[SafeBoxScene.s_controls.savingsamount] 	= {"contentView", "centerView", "page2","savingsamount"};
	[SafeBoxScene.s_controls.cashamount] 		= {"contentView", "centerView", "page2","cashamount"};
	[SafeBoxScene.s_controls.backBtn] 			= {"contentView", "centerView", "page2","backBtn"};
	[SafeBoxScene.s_controls.page2confirmBtn] 	= {"contentView", "centerView", "page2","page2confirmBtn"};
	[SafeBoxScene.s_controls.safeBoxText_one] 	= {"contentView", "bottomView", "safePrompt1"};
	[SafeBoxScene.s_controls.safeBoxText_two] 	= {"contentView", "bottomView", "safePrompt2"};
};


SafeBoxScene.s_controlFuncMap =
{
	[SafeBoxScene.s_controls.maskView] = SafeBoxScene.onMaskTouch;
	[SafeBoxScene.s_controls.bg] = SafeBoxScene.onBgClick;
	[SafeBoxScene.s_controls.closeBtn] = SafeBoxScene.onCloseClick;

	[SafeBoxScene.s_controls.resetBtn] = SafeBoxScene.onResetClick;
	[SafeBoxScene.s_controls.confirmBtn] = SafeBoxScene.onConfirmClick;
	[SafeBoxScene.s_controls.addGoldBtn] = SafeBoxScene.onAddGoldBtnClick;
	[SafeBoxScene.s_controls.cutDownGlodBtn] = SafeBoxScene.onCutDownBtnClick;

	[SafeBoxScene.s_controls.backBtn] = SafeBoxScene.onBackClick;
	[SafeBoxScene.s_controls.page2confirmBtn] = SafeBoxScene.onpage2confirmClick;
	[SafeBoxScene.s_controls.radioButtonGroup] = SafeBoxScene.onRadioButtonGroup;
}

return SafeBoxScene