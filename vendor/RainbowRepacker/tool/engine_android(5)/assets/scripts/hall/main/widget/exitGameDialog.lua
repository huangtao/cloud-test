require("common/commonGameLayer");
local exitGameView = require(HallViewPath.."main/exitGameView");

local ExitGameDialog = class(IBaseDialog,false);

ExitGameDialog.s_controls = 
{
	maskView = 1;
	bg = 2;
	todayGold = 3;
	tomorrowGold = 4;
	exitBtn = 5;
	continueBtn = 6;
	closeBtn = 7;
	tomorrowView = 8;
};

ExitGameDialog.ctor = function(self,token,level,obj,exitFunc,continueFunc,closeFunc)
	super(self,exitGameView,token,level);
	self.m_ctrls = ExitGameDialog.s_controls;
	self:findViews();
	self.m_obj = obj;
	self.m_exitFunc =exitFunc;
	self.m_continueFunc = continueFunc;
	self.m_closeFunc = closeFunc;
	self:init();
end

ExitGameDialog.dtor = function(self)
	self.m_obj = nil;
	self.exitFunc = nil;
	self.continueFunc = nil;
	self.closeFunc = nil
end

ExitGameDialog.findViews = function(self)
	self.m_todayGoldText = self:findViewById(self.m_ctrls.todayGold);
	self.m_tomorrowGoldText = self:findViewById(self.m_ctrls.tomorrowGold);
end

ExitGameDialog.init = function(self)
	self:setEventTouch(self,ExitGameDialog.onShadeBgClick);
	self:setEventDrag(self,ExitGameDialog.onShadeBgClick);
	--这次启动盈余
	local totalMoneyDic = new(Dict,"TOTALMONEY");
	totalMoneyDic:load();
	totalMoney=totalMoneyDic:getDouble("totalMoney",0);
	local todayGold = (kUserInfoData:getTotalMoney() - totalMoney) or 0;
	local str="";
	if todayGold > 0 then

		--str = "+"..todayGold.."银币";
		todayGold = ToolKit.skipMoneyEx5(todayGold, 2);
		str = "这次赢了"..todayGold.."银币,真厉害,下次能赢更多吧!";

		--self.m_todayGoldText:setColor(198,100,37);
	elseif todayGold < 0 then 	 
		--str = "-"..math.abs(todayGold).."银币";
		todayGold = ToolKit.skipMoneyEx5(math.abs(todayGold), 2);
		str = "这次输了"..todayGold.."银币,别灰心,下次还能赢回来!";
		--self.m_todayGoldText:setColor(198,100,37);
	else
		str ="这次输赢持平,加把劲,下次就能赢钱了!";
		--self.m_todayGoldText:setColor(198,100,37);
	end
	self.m_todayGoldText:setText(str);
	self.m_todayGoldText:setVisible(RegionConfigDataInterface.getInstance():getShowExitGameTodayMoneyFlag());
	--明天可以获得的钱
	local y = RegionConfigDataInterface.getInstance():getShowExitGameTodayMoneyFlag() and 40 or 0;
	self:findViewById(self.m_ctrls.tomorrowView):setPos(0,y);

	local tomorrowSigninConfig = TaskRewardDataInterface.getInstance():getTomorrowSigninConfig();

	rewardType = number.valueOf(tomorrowSigninConfig.type); --0为银币2为钻石
	rewardNum = number.valueOf(tomorrowSigninConfig.num);
	local tomorrowGold = "";
	if rewardNum > 0 then
		if rewardType == 0 then 
			tomorrowGold = rewardNum.."银币";
		elseif rewardType == 2 then  
			tomorrowGold = rewardNum.."钻石";
		else 
			tomorrowGold = "更多";
		end 
	else
		tomorrowGold = "更多";
	end
	
	self.m_tomorrowGoldText:setText(tomorrowGold);
end

ExitGameDialog.onExitClick = function(self)
	UBReport.getInstance():report(UBConfig.ConfirmExitGame)
	self.m_exitFunc(self.m_obj);
end

ExitGameDialog.onContinueClick = function(self)
	UBReport.getInstance():report(UBConfig.HideExitGameDialog)
	self.m_continueFunc(self.m_obj);
	ExitGameDialog.hide();
	ExitGameDialog.hide();
end

ExitGameDialog.onCloseClick = function(self)
	self.m_closeFunc(self.m_obj);
	ExitGameDialog.hide();
end
--------------------屏蔽作用-----------------------------------
ExitGameDialog.onMaskTouch = function(self , finger_action , x , y, drawing_id_first , drawing_id_current)	
	if finger_action == kFingerUp then
		ExitGameDialog.hide();
    end
end
ExitGameDialog.onShadeBgClick = function(self)
end
------------------------------------------------------------
ExitGameDialog.s_controlConfig = 
{
	[ExitGameDialog.s_controls.maskView] = {"shiled"};
	[ExitGameDialog.s_controls.bg] = {"contentView","bg"};
	[ExitGameDialog.s_controls.todayGold] = {"contentView","topView","desc"};
	[ExitGameDialog.s_controls.tomorrowGold] = {"contentView","centerView","contentBg","tipsView","tomorrowGold"};
	[ExitGameDialog.s_controls.exitBtn] = {"contentView","bottomView","subView","exitBtn"};
	[ExitGameDialog.s_controls.continueBtn] = {"contentView","bottomView","subView","continueBtn"};
	[ExitGameDialog.s_controls.closeBtn] = {"contentView","closeBtn"};
	[ExitGameDialog.s_controls.tomorrowView] = {"contentView","centerView","contentBg"};
}

ExitGameDialog.s_controlFuncMap = 
{
	[ExitGameDialog.s_controls.maskView] = ExitGameDialog.onMaskTouch;
	[ExitGameDialog.s_controls.bg] = ExitGameDialog.onShadeBgClick;
	[ExitGameDialog.s_controls.exitBtn] = ExitGameDialog.onExitClick;
	[ExitGameDialog.s_controls.continueBtn] = ExitGameDialog.onContinueClick;
	[ExitGameDialog.s_controls.closeBtn] = ExitGameDialog.onCloseClick;
}

return ExitGameDialog;