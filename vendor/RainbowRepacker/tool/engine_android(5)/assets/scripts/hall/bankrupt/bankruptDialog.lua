--2016/7/25由scene改成dialog. --by Demon
require("common/IBaseDialog");
require("util/timeOutTimer");
local brokeAllowanceItemImLayer = require(ViewPath .. "hall/brokeAllowance/brokeAllowanceItemImLayer");
local brokeAllowance = require(BrokeAllowanceViewPath .. "brokeAllowance");

require("hall/onlineSocket/onlineSocketManager");
require("hall/bankrupt/widget/brokeTimerCountDown");
require("hall/bankrupt/data/bankruptInterface");
local bankrupt_pin_map = require("qnFiles/qnPlist/hall/bankrupt_pin");

BankruptDialog = class(IBaseDialog,false);

BankruptDialog.s_requestBankruptCountTimeOut = 10;
BankruptDialog.s_requestBankruptMoneyTimeOut = 11;
BankruptDialog.s_requestRechargeListTimeOut = 12;

BankruptDialog.TimeOutTime = 10 * 1000;

BankruptDialog.s_eventSocket = EventDispatcher.getInstance():getUserEvent();

BankruptDialog.Delegate = {
	onBankruptDialogClose = "onBankruptDialogClose";
}

BankruptDialog.s_controls = 
{
	closetBtn = 1;

	moreGoldBtn = 11;
	topHeadAnimView = 12;
	topHeadView = 13,
	listView = 15,
	bankruptLoadingText = 16,
	chargeListLoadingText = 17,

	shiled = 22,

	---VIP功能
	vipView = 24,
	vipTip = 25,
	vipButton =26,
	vipButtonText =27,

    leftView = 28,
}

BankruptDialog.s_cmds = {
	onResume = 1;
}

BankruptDialog.ctor = function(self)
	super(self, brokeAllowance,"bankrupt",996);
	self.m_root:setEventTouch(self,function() end); 
    self.m_guideView = nil;
    self.m_ctrl = self.s_controls;
    kBankruptDataInterface:setIsHaveDialog(true);
	kGoodsListInterface:setObserver(self);
	kPropManager:setObserver(self);
	kBankruptDataInterface:setObserver(self);
	kUserInfoData:setObserver(self);
	self:_init();

	--因为不是场景所以之前resume里的业务功能提取到ctor
	self:resume();
	self:onResume();
end

BankruptDialog.dtor = function(self)
	self:__clearTimeOutTimer();
	BrokeTimerCountDown.stop();
	LoadingView.getInstance():hidden();

	kGoodsListInterface:clearObserver(self);
	kPropManager:clearObserver(self);
	kBankruptDataInterface:clearObserver(self);
	kUserInfoData:clearObserver(self);

    kBankruptDataInterface:setIsHaveDialog(false);
end

BankruptDialog.resume = function(self)
    	--VIP功能
	self:_checkVip();
    self:showView();
end

BankruptDialog.onResume = function(self)
	self:_requestBankruptCount();
end

BankruptDialog._init = function(self)
	self.m_socket = OnlineSocketManager.getInstance();
	self:_findViews();
    
    self:__clearTimeOutTimer();
	self.m_TimeOutTimer = new(TimeOutTimer, self, self.TimeOutTime);

	self.m_shiled:setEventDrag(self, self.onEmptyFunc); 
end

BankruptDialog.__clearTimeOutTimer = function(self)
	delete(self.m_TimeOutTimer);
	self.m_TimeOutTimer = nil;
end

---控件
BankruptDialog._findViews = function(self)
	self.m_shiled = self:findViewById(self.m_ctrl.shiled);
	self.m_bankruptLoadingText = self:findViewById(self.m_ctrl.bankruptLoadingText);

	self.m_chargeListLoadingText = self:findViewById(self.m_ctrl.chargeListLoadingText);
	self.m_listView = self:findViewById(self.m_ctrl.listView);



	--VIP功能
	self.m_vipView = self:findViewById(self.m_ctrl.vipView);
	self.vipTip = self:findViewById(self.m_ctrl.vipTip);
	self.vipButtonText = self:findViewById(self.m_ctrl.vipButtonText);

    self.m_leftView = self:findViewById(self.m_ctrl.leftView);
    
end

----获取VIP信息
BankruptDialog._checkVip = function(self)
	if kUserInfoData:getIsVip() then ---是VIP用户
		local leftTime = kUserInfoData:getVipTimeDesc();
		self.vipButtonText:setText("续费");
		self.vipTip:setText(string.concat("您的VIP使用期限还有",leftTime));
	else
		self.vipButtonText:setText("开通VIP");
		self.vipTip:setText("VIP领取救济金无需等待");
	end 
end

BankruptDialog.refreshUserProperty = function(self,propertyType,curNum,lastNum)
	if propertyType == RechargeDataInterface.getInstance():getPropertySilverCoinID() then 
		self:_checkBankrupt();	
	end 
end
--------------------------------------------------------------------------------------------------------
BankruptDialog.showView = function(self)
	if not self:_checkBankrupt() then 
		return;
	end 

	self.m_gameId = kGameManager:getCurGameId();
	if self.m_gameId < 1 then
		self.m_gameId = 0;
	end
	self.m_levelid = kGameManager:getCurRoomLevelId();
	self:requestBrokeRechargeList();
end

BankruptDialog._checkBankrupt = function(self)	
	local status = kBankruptDataInterface:getBankruptStatus();
	if status == BankruptStatus.Fake then 
		self:_addGuideView("safeBox");
		self:_checkVip();
		return true;

	elseif status == BankruptStatus.Real then
		self:_requestBankruptCount();
		return true;

	else
		self:requestClose();
		return false;

	end
end  

BankruptDialog._requestBankruptCount = function(self)
	local status = kBankruptDataInterface:getBankruptStatus();
	if status == BankruptStatus.Real then
		self:onInitBankruptView();
		kBankruptDataInterface:requestBankruptCount();
		self.m_TimeOutTimer:startTimer(self.s_requestBankruptCountTimeOut, self.onRequestTimeOut);
	end
end

---请求破产信息
BankruptDialog.onGetBankruptCount = function(self)	

	self.m_TimeOutTimer:clearTimer(self.s_requestBankruptCountTimeOut);
    self:_checkVip();

    --领取银币
    local isBankruptRemain = kBankruptDataInterface:isBankruptRewardRemain();
    local leftTime = kBankruptDataInterface:getCurLeftTime();

    if isBankruptRemain and leftTime <= 0 then
        self:_addGuideView("getMoney");
        return;
    end

    --引导免除CD
   	if  kBankruptDataInterface:getCurCanCutCD() == 1 then
   		self:_addGuideView("toCutCD");
        return;
   	end

    --引导分享任务
    local _isHaveShareTask = function()

        local tmpTaskData = false
        require("hall/task/data/taskRewardDataInterface");
        local _taskData = TaskRewardDataInterface.getInstance():getDayTaskList();

        for k,v in pairs(_taskData ) do
	
	        local jumpInfo = table.verify(json.decode(v.jump_code));
	        local cmd = jumpInfo.cmd;

	        if cmd == CommonJumpCmds.GOTO_WEIXIN_SHARE  and (v.status == 0 or v.status == 1) then
                local _lowLimit = kBankruptDataInterface:getBankruptLowestMoney();
                local _myMoney = kUserInfoData:getMoney();
                if tonumber(v.reward_type) == 0 and (tonumber(v.reward) + _myMoney) >= _lowLimit then
		            tmpTaskData = true;
                end
	        end	
        end

        return tmpTaskData;
    end

    local isHaveShareTask = _isHaveShareTask();
    if isHaveShareTask then
        self:_addGuideView("toShare");
        return;
    end

    --比赛
    self:_addGuideView("toMatch");

end 

--添加破产引导模块
BankruptDialog._addGuideView = function(self,p_keyString)	
    local _classFactory = require("hall/bankrupt/widget/differentGuide/createGuideViewFactory");
    local _factory = new(_classFactory);

    if self.m_guideView then
        self.m_leftView:removeChild(self.m_guideView,true);
        self.m_guideView = nil;
    end

    local _veiw = _factory:getView(p_keyString);
    if not _veiw then
        return;
    end

    self.m_leftView:addChild(_veiw);
    self.m_guideView = _veiw;
end

------------------------------------------------------------------------------------------------
---领取破产补助
BankruptDialog._requestBankruptMoney = function(self)
	kBankruptDataInterface:requestBankruptMoney();
end

---领取破产补助的结果回调
BankruptDialog.onGetBankruptMoney = function(self,isSuccess,errType)
	LoadingView.getInstance():hidden();
	local gotMoney = kBankruptDataInterface:getCurBankruptReward();
	if isSuccess then 
		self.m_isBankrupting = false; 
	end 

	-- local subView = self:createBankruptMoneyMessageView(isSuccess,gotMoney);
	local func = isSuccess and self.onCloseBtnClick or nil;
	local title = isSuccess and GameString.get("BrokeAllowanceGetSuccess") or GameString.get("BrokeAllowanceGetFailed");

	local content = nil;
	if isSuccess then
		content = string.format(GameString.get("bankruptSucessTips"), gotMoney);

		AnimManager.getInstance():playAnim(AnimIds.MoneyDropPar, 100);
	else 
		content = GameString.get(string.concat("bankruptErrTips",errType));
	end
	MessageBox.show(title,content,"确定",nil, false, self, func,nil,nil,self, func);
end 
------------------------------------------------------------------------------------------------
--请求获取支付列表
BankruptDialog.requestBrokeRechargeList = function(self)
    local gameId = kGameManager:getCurGameId();
	local levelId = kGameManager:getCurRoomLevelId();
    local list = kGoodsListInterface:getGoodsList(PayConfig.eGoodsListId.Broken, { ["level"] = levelId, ["gameid"] = gameId, ["scene"] = PayConfig.eGoodsListId.Broken } );

    self:onInitChargeList(list);
    if table.isEmpty(list) then 
	    self.m_TimeOutTimer:startTimer(self.s_requestRechargeListTimeOut, self.onRequestTimeOut);
	end 
end

BankruptDialog.onGetGoodsInfoCallBack = function(self, isSuccess, data, sendParam)
	self.m_TimeOutTimer:clearTimer(self.s_requestRechargeListTimeOut);
	if isSuccess then
        local gameId = kGameManager:getCurGameId();
	    local levelId = kGameManager:getCurRoomLevelId();
        local list = kGoodsListInterface:getGoodsList(PayConfig.eGoodsListId.Broken, { ["level"] = levelId, ["gameid"] = gameId, ["scene"] = PayConfig.eGoodsListId.Broken } );
		self:onUpdateChargeList(list);
	end
end

BankruptDialog.onRequestPay = function(self, data)
    RechargeDataInterface.getInstance():setSceneType(UBPaySceneConfig.kHallBroken);
	StateMachine.getInstance():pushState(States.ShortCutRecharge, nil, true, PayConfig.eGoodsListId.Broken, nil, data);
end


------------------- Loading View 结束 ----------------------------
--初始化请求破产信息的界面
BankruptDialog.onInitBankruptView = function(self)
	self.m_bankruptLoadingText:setVisible(true);
end

--初始化加载商品列表界面
BankruptDialog.onInitChargeList = function(self, data)
	if table.isEmpty(data) then
		if self.m_loadingText then
			self.m_loadingText:setVisible(true);
		end
		if self.m_listView then
			self.m_listView:setVisible(false);
		end
	else
		Log.d("wanpg-----------BankruptDialog.onInitChargeList --  use local data");
		self:onUpdateChargeList(data);
	end
end

---更新充值列表
BankruptDialog.onUpdateChargeList = function(self, goodsData)		
	if not (self.m_chargeListLoadingText and self.m_listView) then
		return;
	end		
	if table.isEmpty(goodsData) then
		---说明没有数据
		self.m_chargeListLoadingText:setVisible(true);
		self.m_listView:setVisible(false);
		self.m_chargeListLoadingText:setText("商品列表加载失败");
	else
		self.m_chargeListLoadingText:setVisible(false);
		self.m_listView:setVisible(true);
		table.sort( goodsData, self.chargeListSort);--排序
		self.m_goodsData = goodsData;
		local adapter = new(CacheAdapter, BrokeChargeItem, goodsData);
		self.m_listView:setAdapter(adapter);								--设置adapter
		self.m_listView:setScrollBarWidth(3);								--滚动条宽带，小于1不显示滚动条
		self.m_listView:setMaxClickOffset(5);
		self.m_listView:setOnItemClick(self,self.onChargeItemClick);
	end	
end

---充值列表排序
BankruptDialog.chargeListSort = function(a, b)
	if not a or not b then
		return false;
	end
	local an = number.valueOf(a.pamount);
	local bn = number.valueOf(b.pamount);
	return an < bn;
end

BankruptDialog.onChargeItemClick = function(self, adapter, view, index)
	UBReport.getInstance():report(UBConfig.kHallBankruptBuy, string.format("index_%s", index));
	--进行充值操作
	local data = self.m_goodsData[index];
	self:onRequestPay(data);
end

BankruptDialog.onResponseBankruptRemainTime = function(self)
	self.m_bankruptLoadingText:setText("信息获取失败");
end

---超时
BankruptDialog.onRequestTimeOut = function(self,timeOutType)
	LoadingView.getInstance():hidden();
	if timeOutType == self.s_requestBankruptCountTimeOut then
		--请求破产信息超时
        self:onResponseBankruptRemainTime();
	elseif timeOutType == self.s_requestBankruptMoneyTimeOut then
		--领取破产补助超时
	elseif timeOutType == self.s_requestRechargeListTimeOut then
		--获取破产商品列表超时
		self:onUpdateChargeList({});
	end
end

------------------------- btns func --------------------------------------------

BankruptDialog.onCloseBtnClick = function(self)
	self:requestClose();
end

BankruptDialog.requestClose = function(self)
	IBaseDialog.remove("bankrupt");
end

BankruptDialog.onMoreGoldBtnClick = function(self,finger_action,x, y, drawing_id_first, drawing_id_current)
	if finger_action == kFingerUp and drawing_id_first == drawing_id_current then
        UBReport.getInstance():report(UBConfig.kHallBankruptMoreShoping);
		kEffectPlayer:play(Effects.AudioButtonClick);
		StateMachine.getInstance():pushState(States.Recharge);
	end 
end

BankruptDialog.onVipChargeClick = function(self)
	UBReport.getInstance():report(UBConfig.kHallGetVipBankrupt);
    UBReport.getInstance():report(UBConfig.kHallBankruptGetVip);
	RechargeDataInterface.getInstance():setToRechargeMode( RechargeDataInterface.getInstance():getTabVipId() ); ---直接跳转到VIP
	StateMachine.getInstance():pushState(States.Recharge);
end

BankruptDialog.onEmptyFunc = function(self)
end

BankruptDialog.s_controlConfig = 
{	
	[BankruptDialog.s_controls.shiled] = {"shiled"};
	[BankruptDialog.s_controls.closetBtn] = {"centerView" , "closeBtn"},	
    [BankruptDialog.s_controls.leftView] = {"centerView" , "leftView"},	
	[BankruptDialog.s_controls.moreGoldBtn]  = {"centerView" , "moreGold"},
	--VIP功能
	[BankruptDialog.s_controls.vipView] = {"centerView","leftView","vipView"},
	[BankruptDialog.s_controls.vipTip] = {"centerView","leftView","vipView","vipTip"},
	[BankruptDialog.s_controls.vipButton] = {"centerView","leftView","vipView","vipButton"},
	[BankruptDialog.s_controls.vipButtonText] = {"centerView","leftView","vipView","vipButton","vipButtonText"},

	[BankruptDialog.s_controls.listView] = {"centerView" , "rightView" , "listView"};
	[BankruptDialog.s_controls.bankruptLoadingText] = {"centerView" ,"leftView" ,"loading_text"},
	[BankruptDialog.s_controls.chargeListLoadingText] = {"centerView" ,"rightView" ,"loading_text"},
	
}

BankruptDialog.s_controlFuncMap = 
{	
	[BankruptDialog.s_controls.closetBtn]  = BankruptDialog.onCloseBtnClick;
	[BankruptDialog.s_controls.shiled] = BankruptDialog.onEmptyFunc;
	[BankruptDialog.s_controls.vipButton] = BankruptDialog.onVipChargeClick;
	[BankruptDialog.s_controls.moreGoldBtn] = BankruptDialog.onMoreGoldBtnClick;
}

BankruptDialog.s_cmdConfig = {
	[BankruptDialog.s_cmds.onResume] = BankruptDialog.onResume;
}

------------------------------------------------------------------------------------------------------
--------------------------- rechagre list item -------------------------------------------------------
------------------------------------------------------------------------------------------------------

BrokeChargeItem = class(Node);

BrokeChargeItem.ctor = function(self, data)
	Log.v("--------------BrokeChargeItem.ctor --------------",data);
	if table.isEmpty(data) then
		return ;
	end
	self:setFillParent(true,false);
	self.m_adapter = adapter;
	self.m_data = data;
	local view = SceneLoader.load(brokeAllowanceItemImLayer);
	self:setSize(view:getSize());
	self.m_newNode = view:getChildByName("content");

	local leftIcon = self.m_newNode:getChildByName("leftIcon");
	local recIcon = self.m_newNode:getChildByName("recIcon");
	local rightView = self.m_newNode:getChildByName("rightView"); 
	local priceBg = self.m_newNode:getChildByName("priceBg");
	local price = priceBg:getChildByName("price"); 

	local pamount = number.valueOf(data.pamount,0) or -1;
	local pchips  = number.valueOf(data.pchips,0) or -1;

	-- 商品图标
	if data.order>=1 and data.order<=3 then
		leftIcon:setFile(bankrupt_pin_map[string.format("coin_%s.png",data.order)]);
	else
		leftIcon:setFile(bankrupt_pin_map["coin_1.png"]);
	end
	if data.icon then
		ImageCache.getInstance():request(data.icon,self,self.onUpdatePriceImage);
	end	

	-- 热销等标签
	recIcon:setVisible( not string.isEmpty(data.eventIcon) );
	if not string.isEmpty(data.eventIcon) then	
		ImageCache.getInstance():request(data.eventIcon,self, self.onUpdateImage);
	end

	require("uilibs/richText")
	local msg = string.format(GameString.get("BrokeAllowanceMessageText_8"),ToolKit.skipMoney(pchips));
	if (not string.isEmpty(data.specialDesc)) then
		msg = msg .. string.format(GameString.get("BrokeAllowanceMessageText_10"),data.specialDesc);
	end
	local w,h = rightView:getSize();
	self.m_richText = new(RichText, msg, w, h, kAlignCenter, nil, 30, 255, 255, 255, true);
	rightView:addChild(self.m_richText);
	-- 价格
	price:setText(string.format(GameString.get("BrokeAllowanceMessageText_9"),pamount)); 
 
	self:addChild(view);
end

-- 热销等标签
BrokeChargeItem.onUpdateImage = function(self, url, imagePath)
	if imagePath then
		self.m_newNode:getChildByName("recIcon"):setFile(imagePath);
	end
end

-- 商品图标
BrokeChargeItem.onUpdatePriceImage = function(self,url,imagePath)
	if imagePath then
		self.m_newNode:getChildByName("leftIcon"):setFile(imagePath);
	end
end
BrokeChargeItem.dtor = function(self)
	ImageCache.getInstance():cleanRef(self);
end
