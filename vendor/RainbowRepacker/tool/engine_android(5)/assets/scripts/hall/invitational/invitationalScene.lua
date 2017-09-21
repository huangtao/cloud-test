require("common/commonScene")
require("hall/invitational/data/invitationalDataInterface")
local invitational_keyboard = require(ViewPath .. "hall/invitational/invitational_keyboard")

local InvitationalKeyboardLayer = require("hall/invitational/widget/invitationalKeyboardLayer")

--邀请赛
InvitationalScene = class(CommonScene)

local h_index = 0;
local getIndex = function(self)
    h_index = h_index + 1
    return h_index
end
InvitationalScene.s_controls = 
{
	backBtn = getIndex(),
	createBtn = getIndex(),
	myMatchBtn = getIndex(),
	myInvolvedBtn = getIndex(),
	rightView = getIndex(),
}

InvitationalScene.s_cmds = {
	onResponseInvitationalDetail = 1,
	onUpdateMatchState = 2,
	onResponseInvitationalCreate = 3,
	onBroadcastPayMoney     = 4,
	onResponseMyMatchInvitational = 5,
	onResponseErrorTipsInvitational = 6,
	onInvitationalMyApplyLists = 7,
	onUpdateBatteryLevel = 8,
	onRefreshMyMatchInvitational = 9,
	onResponseMatchDetail = 10,
	onResetInputView = 11,
}

InvitationalScene.s_error = {
	[9] = "该游戏的尚不支持邀请赛",
	[10] = "钱币数量不够，无法创建",
	[11] = "创建的比赛达到上限，无法创建",--房间达到上限
	[12] = "当前时间大于开赛时间",--时间错误（当前时间大于开赛时间）
	[13] = "创建比赛的用户太多啦，请稍后再试",
	[50] = "您输入的比赛编号不存在",--房间不存在（未创建）
	[51] = "该比赛已经开始，无法进入",--比赛已经开始，无法报名
	[100] = "退还奖池失败，请稍候重试",--系统原因导致退还奖池失败
	--[101] = "该比赛已经开始，请稍候重试",--系统原因导致将报名费给创建者失败
}

InvitationalScene.s_detailViewConfig = {
	[InvitationalConstants.eMatchInviteType.INVITATIONAL] = "hall/invitational/widget/invitationalMatchDetail",
	[InvitationalConstants.eMatchInviteType.GROUP] = "hall/matchHall/gameMatchHall/gameMatchHallDetail/gameMatchHallDetail",
}

InvitationalScene.ctor = function(self,viewConfig,controller)
	self:setSize(self.m_root:getSize())
    self:setFillParent(true, true)
    self.m_data = {}
    self:setEventDrag(self, self.onBgClick)
    self:setEventTouch(self, self.onBgClick)
    self.m_rightView = self:findViewById(self.s_controls.rightView)
    InvitationalDataInterface.getInstance():requestQcodeUrl()
    self:createMatchCodeKeyboard()
    SafeBoxDataInterface.getInstance():setObserver(self)
    UpdateHandleMgr.getInstance():setObserver(self);
end

InvitationalScene.dtor = function(self)	
	self.m_createStayTime = nil
	self.m_myMatchStayTime = nil
	self:removeInvitationalCreate()
	self:removeInvitationalInfo()
	self:removePasswordView()
	self:removeMatchCodeKeyboard()
	self:removeMyApplyLists()
	self:removeMatchDetailLayer()
	SafeBoxDataInterface.getInstance():clearObserver(self)
    UpdateHandleMgr.getInstance():clearObserver(self);
end

--返回
InvitationalScene.onBackBtnClick = function(self)
	UBReport.getInstance():report(UBConfig.kInvitationalAction3)
	self:requestCtrlCmd(InvitationalController.s_cmds.goBack)
end

--点击创建邀请赛
InvitationalScene.onCreateBtnClick = function(self)
	UBReport.getInstance():report(UBConfig.kInvitationalAction5)
	self:resetMatchCodeKeyboard()
	if LoginDataInterface.getInstance():getLastUType() == LoginConstants.uType.Guest then
		local dialog = new(require("hall/login/widget/registerBindingGuide"), LoginConstants.eBindingGuideType.INVITATIONAL)
		dialog:setRichTextPos(0, 0)
		dialog:setRichTextAlign(kAlignCenter)
    	IBaseDialog.pushDialog(dialog)
    	return
    end
    self:removeInvitationalCreate()
	local InvitationalCreate = require("hall/invitational/widget/invitationalCreate")
	self.m_invitational_create = new(InvitationalCreate)
	self.m_invitational_create:setDelegate(self)
	self:addChild(self.m_invitational_create)
	self:pushStateStack(self, self.onInvitationalCreateClose)
	self.m_invitational_create:show()
	self.m_createStayTime = os.time()
end

--关闭创建邀请赛界面
InvitationalScene.onInvitationalCreateClose = function(self, popStack)
	UBReport.getInstance():report(UBConfig.kInvitationalAction6)
	if self.m_createStayTime and (os.time() - self.m_createStayTime) > 0 then
		UBReport.getInstance():report(UBConfig.kInvitationalAction7, os.time() - self.m_createStayTime)
	end
	if popStack then
        self:popStateStack()
    end
	self:removeInvitationalCreate()
end

--获取创建邀请赛界面的显示状态
InvitationalScene.getInvitationalCreateVisible = function(self)
	if self.m_invitational_create and self.m_invitational_create:getVisible() then
		return true
	end
	return false
end

--删除创建邀请赛界面
InvitationalScene.removeInvitationalCreate = function(self)
	if self.m_invitational_create then
		delete(self.m_invitational_create)
		self.m_invitational_create = nil
	end
end

--点击我创建的邀请赛
InvitationalScene.onMyMatchBtnClick = function(self)
	UBReport.getInstance():report(UBConfig.kInvitationalAction13)
	self:removeInvitationalInfo()
	local InvitationalInfo = require("hall/invitational/widget/invitationalInfo")
	self.m_invitational_info = new(InvitationalInfo)
	self.m_invitational_info:setDelegate(self)
	self:addChild(self.m_invitational_info)
	self:pushStateStack(self, self.onInvitationalInfoClose)
	self.m_isGetMyMatch = true
	self.m_myMatchStayTime = os.time()
end

--获取我创建的邀请赛回调
InvitationalScene.onResponseMyMatchInvitational = function(self, info)
	if self.m_isGetMyMatch then
		if self:getInvitationalCreateVisible() then
			self:onInvitationalCreateClose(true)
		end
		self:resetMatchCodeKeyboard()
	end
	if self:getInvitationalInfoVisible() then
		self.m_invitational_info:showList(info)
	end
	self.m_isGetMyMatch = nil
end

--获取我创建的邀请赛界面的显示状态
InvitationalScene.getInvitationalInfoVisible = function(self)
	if self.m_invitational_info and self.m_invitational_info:getVisible() then
		return true
	end
	return false
end

--删除我创建的邀请赛界面
InvitationalScene.removeInvitationalInfo = function(self)
	if self.m_invitational_info then
		delete(self.m_invitational_info)
		self.m_invitational_info = nil
	end
end

--关闭我创建的邀请赛界面
InvitationalScene.onInvitationalInfoClose = function(self, popStack)
	UBReport.getInstance():report(UBConfig.kInvitationalAction14)
	if self.m_myMatchStayTime and (os.time() - self.m_myMatchStayTime) > 0 then
		UBReport.getInstance():report(UBConfig.kInvitationalAction15, os.time() - self.m_myMatchStayTime)
	end
	if popStack then
        self:popStateStack()
    end
	self:removeInvitationalInfo()
end

--播放创建成功动画
InvitationalScene.doCreateSuccessAnim = function(self, info)
	if self.m_invitational_create then
		self.m_invitational_create:doSuccessAnim(info)
	end
end

--请求创建邀请赛
InvitationalScene.doCreateInvitational = function(self, data)
	InvitationalDataInterface.getInstance():createMatch(data)
end

--创建邀请赛回复
InvitationalScene.onResponseInvitationalCreate = function(self, info)
	UBReport.getInstance():report(UBConfig.kInvitationalAction8)
	self:doCreateSuccessAnim(info)
end

--创建比赛编号键盘
InvitationalScene.createMatchCodeKeyboard = function(self)
	if not self.m_matchCodeKeyboard then
		self.m_matchCodeKeyboard = new(InvitationalKeyboardLayer, invitational_keyboard)
		self.m_matchCodeKeyboard:setDelegate(self)
		self.m_matchCodeKeyboard:setBgFile("hall/invitational/enter_match_keyboard.png")
		self.m_matchCodeKeyboard:setTitle("输入比赛编号")
		self.m_matchCodeKeyboard:setInputBgAlign(kAlignLeft)
		--self.m_matchCodeKeyboard:setNumberTitleVisible(true)
		self.m_rightView:addChild(self.m_matchCodeKeyboard)
	end
end

--重置比赛编号键盘
InvitationalScene.resetMatchCodeKeyboard = function(self)
	if self.m_matchCodeKeyboard then
		self.m_matchCodeKeyboard:onInputReset()
	end
end

--删除比赛编号键盘
InvitationalScene.removeMatchCodeKeyboard = function(self)
	if self.m_matchCodeKeyboard then
		delete(self.m_matchCodeKeyboard)
		self.m_matchCodeKeyboard = nil
	end
end

--创建密码键盘
InvitationalScene.createPasswordKeyboard = function(self)
	self:removePasswordView()
	self.m_passwordView = UIFactory.createImage("hall/common/bg_shiled.png")
    self:addChild(self.m_passwordView)
    self.m_passwordView:setFillParent(true, true)
    self.m_passwordView:setEventDrag(self, self.onBgClick)
    self.m_passwordView:setEventTouch(self, self.onBgClick)
	self.m_passwordKeyboard = new(InvitationalKeyboardLayer, invitational_keyboard)
	self.m_passwordKeyboard:setDelegate(self)
	self.m_passwordKeyboard:setBgFile("hall/invitational/popup_keyboard_bg.png")
	self.m_passwordKeyboard:setTitle("输入四位比赛密码")
	self.m_passwordKeyboard:setReturnBtnState(true)
	self:pushStateStack(self, self.onKeyboardLayerCloseClick)
	self.m_passwordView:addChild(self.m_passwordKeyboard)
end

--删除密码键盘
InvitationalScene.removePasswordView = function(self)
	if self.m_passwordView then
		delete(self.m_passwordView)
		self.m_passwordView = nil
	end
end

--键盘输入回调
InvitationalScene.onInputNumberCallback = function(self, number)
	if not self.m_passwordView then
		UBReport.getInstance():report(UBConfig.kInvitationalAction12)
		if number < 1000 then
			if self.m_matchCodeKeyboard then
				self.m_matchCodeKeyboard:showEmptyView(InvitationalScene.s_error[50])
			end
			return
		end
		InvitationalDataInterface.getInstance():enterMatch({code = number})
		--self:resetMatchCodeKeyboard()
	else
		if self.m_itemData then
			if string.format("%.4d", number) == tostring(self.m_itemData.matchentrycode) then
				self:removePasswordView()
				self:doEnroll(self.m_itemData)
			else
				if self.m_passwordKeyboard then
					self.m_passwordKeyboard:showEmptyView("密码不正确，请重新输入")
				end
			end
		end
	end
end

--密码键盘输入关闭回调
InvitationalScene.onKeyboardLayerCloseClick = function(self, popStack)
	if popStack then
        self:popStateStack()
    end
    self:removePasswordView()
    if self.m_match_detail then
        self:createMatchDetail(self.m_match_detail:getData())
    end
end

--背景点击回调
InvitationalScene.onBgClick = function(self)
end

--点击已报名列表item
InvitationalScene.onMatchItemClick = function(self, data)
	InvitationalDataInterface.getInstance():enterMatch({code = data.id})
end

-- 生成比赛详情弹框
InvitationalScene.createMatchDetail = function(self, data)
	if self.m_match_detail then
		delete(self.m_match_detail)
		self.m_match_detail = nil
	end

	local detailView = InvitationalScene.s_detailViewConfig[number.valueOf(data.invitetype)];
	if string.isEmpty(detailView) then
		detailView = InvitationalScene.s_detailViewConfig[InvitationalConstants.eMatchInviteType.INVITATIONAL];
	end
	
	local InvitationalMatchDetail = require(detailView)
    self.m_match_detail = new(InvitationalMatchDetail)
    self.m_match_detail:setDelegate(self)
    self:addChild(self.m_match_detail)
    self:pushStateStack(self, self.onMatchDetailLayerClose)
    self.m_match_detail:show()
    self.m_match_detail:setData(data)
end

--关闭比赛详情弹框
InvitationalScene.onMatchDetailLayerClose = function(self, popStack)
	if self.m_match_detail:hasOpenLayer() then
		self:pushStateStack(self, self.onMatchDetailLayerClose)
		return
	end
    if popStack then
        self:popStateStack()
    end
    if self.m_match_detail then
        self.m_match_detail:hide()
    end
end

--删除比赛详情弹框
InvitationalScene.removeMatchDetailLayer = function(self)
	if self.m_match_detail then
		delete(self.m_match_detail)
		self.m_match_detail = nil
	end
end

--收到邀请赛详细信息回复
InvitationalScene.onResponseInvitationalDetail = function(self, info)
	self:createMatchDetail(info)
	MatchHallDataInterface.getInstance():requestMatchDetail(info.id)
end

InvitationalScene.onResponseMatchDetail = function(self, info)
	if self.m_match_detail and self.m_match_detail:getVisible() then
		self.m_match_detail:setDataDetail(info);
	end
end

--@brief 显示报名提示
--@param error_type 报名校验的返回类型表 GameMatchHallConstants.enrollErrorType
--@param typ 道具类型
--@param num 道具数量
--@param itemData item数据
InvitationalScene.showEnrollErrorTips = function(self, error_type, typ, num, itemData)
    local coinID = RechargeDataInterface.getInstance():getPropertySilverCoinID()
    local barID = RechargeDataInterface.getInstance():getPropertyGoldBarID()
    local bankruptMoney = BankruptDataInterface.getInstance():getBankruptLowestMoney()
    local unit = ""
    if typ == coinID or typ == barID then
        unit = (typ == coinID) and "银币" or "金条"
    end
    local name = itemData.mname
    local continue_cb, ok_cb = nil, nil
    local tips = "需要报名费"
    local dialog = GameMatchTipsDialog.show("报名提示")
    if error_type == GameMatchHallConstants.enrollErrorType.CASH_OUT or error_type == GameMatchHallConstants.enrollErrorType.CASH_RUIN then
        tips = string.format("报名%s%s%s%s，继续报名系统将自动为你取出保险箱中的%s并完成报名。", name, tips, num, unit, unit)
        if error_type == GameMatchHallConstants.enrollErrorType.CASH_RUIN then
            tips = string.format("您需要达到%s%s，才可以报名。继续报名系统将自动为你取出保险箱中的%s并完成报名。", (bankruptMoney + num), unit, unit)
        end
        continue_cb = function()
            GameMatchTipsDialog.hide()
            self.m_selectItemData = itemData
            local safeBox = (typ == coinID) and kUserInfoData:getSafeBoxCurMoney() or kUserInfoData:getSafeBoxCurCrystal()
            SafeBoxDataInterface.getInstance():updateSafeBox(2, safeBox, typ)
        end
    elseif error_type == GameMatchHallConstants.enrollErrorType.TOTAL_OUT or error_type == GameMatchHallConstants.enrollErrorType.TOTAL_RUIN then
        tips = string.format("报名%s%s%s%s，需获取更多的%s才能继续报名。", name, tips, num, unit, unit)
        if error_type == GameMatchHallConstants.enrollErrorType.TOTAL_RUIN then
            tips = string.format("您需要达到%s%s，才可以报名。", (bankruptMoney + num), unit)
        end
        continue_cb = function()
            GameMatchTipsDialog.hide()
            self:_quickPay(typ, (typ == coinID) and (bankruptMoney + num) or num, itemData);
        end
    end
    local function close_cb()
    	GameMatchTipsDialog.hide()
    end
    dialog:initTipsView(tips, nil, continue_cb, close_cb, close_cb, close_cb)
end

--报名
InvitationalScene.onMatchDetailLayerSignup = function(self, itemData)
	if not UserBaseInfoIsolater.getInstance():getIsLoginSuccess() then 
		return
	end
	if not itemData then
		return
	end
	self.m_itemData = itemData

	if itemData.status == InvitationalConstants.eMatchStatus.NO_SIGN then
		if InvitationalDataInterface.getInstance():isNeedPassword(itemData) then
			self:createPasswordKeyboard()
		else
			self:doEnroll(itemData)
		end
	elseif itemData.status == InvitationalConstants.eMatchStatus.CAN_ENTER then
		self:doEnroll(itemData)
	elseif itemData.status == InvitationalConstants.eMatchStatus.SIGNED then
		self:requestExitMatch(itemData)
	end
end

InvitationalScene.doEnroll = function(self, itemData)
	local downloaded = self:isGameDownloaded(itemData)
	if not downloaded then 
		return
	end
	if itemData.status == InvitationalConstants.eMatchStatus.NO_SIGN and not table.isEmpty(itemData.fee) and itemData.fee[1][1] then
		local typ = number.valueOf(itemData.fee[1][1].type)
    	local num = number.valueOf(itemData.fee[1][1].num)
		local result, error_type = MatchHallDataInterface.getInstance():checkEnroll(typ, num, true)
		if not result then
			self:showEnrollErrorTips(error_type, typ, num, itemData)
			return
		end
	end
	self:requestCtrlCmd(InvitationalController.s_cmds.signupMatch, itemData)
end

--@brief 快速购买银币or金条
InvitationalScene._quickPay = function(self, typ, num, matchItemData)
    local goodsListId = (typ == RechargeDataInterface.getInstance():getPropertySilverCoinID()) and PayConfig.eGoodsListId.MarketGold 
    	or PayConfig.eGoodsListId.MarketCrystal
    RechargeDataInterface.getInstance():setSceneType(UBPaySceneConfig.KMatchApplyRecharge);
    StateMachine.getInstance():pushState(States.ShortCutRecharge, nil, true, goodsListId,
    	{scene = goodsListId}, nil, nil, nil, { diffMoney = num - kUserInfoData:getMoneyById(typ)});
    self.m_selectItemData = matchItemData;
end

--@brief 支付到账回调
InvitationalScene.onBroadcastPayMoney = function(self, broadType)
	if self.m_invitational_create then
		self.m_invitational_create:onBroadcastPayMoney(broadType)
	end
    if self.m_selectItemData then
        --支付回来后，重新报名比赛
        self:onMatchDetailLayerSignup(self.m_selectItemData)
        self.m_selectItemData = nil;
    end
end

--@brief 操作保险箱回调
InvitationalScene.onUpdateSafeBoxCallBack = function(self, isSuccess, data)
    if isSuccess and self.m_selectItemData then
        self:onMatchDetailLayerSignup(self.m_selectItemData)
    end
    self.m_selectItemData = nil;
end


--报名成功,未到等待进入时间,不进入赛前等待界面
InvitationalScene.onUpdateMatchState = function(self, itemData)
	MatchHallDataInterface.getInstance().getMyApplyLists()
	
    local tips = table.isEmpty(itemData.fee) and "请准时入场，预祝您赢得大奖！" or "未能按时参加比赛，已交报名费用不再退还"
    require("hall/matchHall/gameMatchHall/gameMatchTipsDialog")
    local dialog = GameMatchTipsDialog.show("报名成功")
    local TimeFormatUtil = require("util/timeFormatUtil")
    local time = TimeFormatUtil.isSameDay(os.time(), itemData.stime) and os.date("今天%H:%M", itemData.stime) or os.date("%m月%d日 %H:%M", itemData.stime)
    dialog:initSuccessView(time, tips)
    dialog:setSuccessOtherTipsVisible(true)
end

--请求退赛
InvitationalScene.requestExitMatch = function(self, info)
	self:requestCtrlCmd(InvitationalController.s_cmds.requestExitMatch, info)
end

--@brief 判断是否需要下载游戏
InvitationalScene.isGameDownloaded = function(self, itemData)
	local downloaded = true;
	local status = HallUpdateConfig.getInstance():getGameStatus(itemData.gameId);
	if status == HallGameStatus.CanPlay then	
	elseif status == HallGameStatus.CanInstall or status == HallGameStatus.CanUpdate then
		-- 需要更新或下载游戏
		downloaded = false;
		self:downloadGame(itemData.gameId, status);
	else
		downloaded = false;
		Toast.getInstance():showText(kTextExpectation,50,30,kAlignLeft,"",30,200,175,115);
	end
	return downloaded;
end

--@brief 更新或下载游戏
InvitationalScene.downloadGame = function(self, gameId, status)
	Log.v("GameMatchHallScene.downloadGame", "gameId = ", gameId, " status = ", status);
	local data = GameInfoIsolater.getInstance():getGameConfigById(gameId);
	data.status = status;
	UpdateHandleMgr.getInstance():startDownloadOrUpdateGame(data);
end

--@brief 下载游戏成功回调
InvitationalScene.downloadGameSuccessed = function(self, data)
	self:onMatchDetailLayerSignup(self.m_itemData);
end

--@brief 更新游戏成功回调
InvitationalScene.updateGameSuccessed = function(self, data)
	self:onMatchDetailLayerSignup(self.m_itemData);
end

InvitationalScene.onResponseErrorTipsInvitational = function(self, info)
	LoadingView.getInstance():hidden()
	if info.errCode >= 1 and info.errCode <= 8 then
		Toast.getInstance():showText("系统异常，请稍候重试",50,30,kAlignLeft,"",30,200,175,115)
		return
	end
	if InvitationalScene.s_error[info.errCode] then
		if self:getInvitationalInfoVisible() then
			if info.errCode == 100 then
				Toast.getInstance():showText(InvitationalScene.s_error[info.errCode],50,30,kAlignLeft,"",30,200,175,115)
			end
			return
		end
		if self:getInvitationalCreateVisible() then
			if info.errCode >=9 and info.errCode <= 13 then
				Toast.getInstance():showText(InvitationalScene.s_error[info.errCode],50,30,kAlignLeft,"",30,200,175,115)
			end
			return
		end
		if self.m_matchCodeKeyboard and info.errCode == 50 or info.errCode == 51 then
			self.m_matchCodeKeyboard:showEmptyView(InvitationalScene.s_error[info.errCode])
			return
		end
		Toast.getInstance():showText(InvitationalScene.s_error[info.errCode],50,30,kAlignLeft,"",30,200,175,115)
	end
end

--点击我报名的邀请赛
InvitationalScene.onMyInvolvedBtnClick = function(self)
	if not self.m_enrollList then
        local GameMatchHallHorizontaEnrollList = require("hall/matchHall/gameMatchHall/gameMatchHallHorizontalView/gameMatchHallHorizontaEnrollList")
        self.m_enrollList = new(GameMatchHallHorizontaEnrollList)
        self.m_enrollList:setDelegate(self)
        self:addChild(self.m_enrollList)
        self.m_enrollList:hide()
    end
	LoadingView.getInstance():showText("数据加载中...")
	self.m_isSignedBtnClick = true
    MatchHallDataInterface.getInstance().getMyApplyLists()
end

--获取已报名的邀请赛回调
InvitationalScene.onInvitationalMyApplyLists = function(self, isSuccess, info)
	LoadingView.getInstance():hidden()
	if isSuccess then
        local data = MatchHallDataInterface.getInstance():getInvitationalEnrollList()
        if self.m_isSignedBtnClick then
            if #data > 0 then
                if self.m_enrollList and not self.m_enrollList:getVisible() then
                	self:resetMatchCodeKeyboard()
                    self.m_enrollList:show()
                    self:pushStateStack(self, self.onMatchEnrollListClose)
                end
            else
                Toast.getInstance():showText("老板，您还没有报名任何比赛。",50,30,kAlignLeft,"",30,200,175,115)
            end
        end
        if self.m_enrollList and self.m_enrollList:getVisible() then
            self.m_enrollList:refreshMatchList(data)
        end
    end
    self.m_isSignedBtnClick = nil
end

InvitationalScene.onMatchEnrollListClose = function(self, popStack)
    if popStack then
        self:popStateStack()
    end
    if self.m_enrollList then
        self.m_enrollList:hide()
    end
end

InvitationalScene.onUpdateBatteryLevel = function(self, level)
	Log.v("InvitationalScene.onUpdateBatteryLevel", level)
	if self.m_invitational_create then
		self.m_invitational_create:updateBatteryLevel(level)
	end
end

--刷新我创建的邀请赛列表item
InvitationalScene.onRefreshMyMatchInvitational = function(self, info)
	if self.m_enrollList and self.m_enrollList:getVisible() then
		MatchHallDataInterface.getInstance().getMyApplyLists()
	end
end

--删除已报名的邀请赛界面
InvitationalScene.removeMyApplyLists = function(self)
	if self.m_enrollList then
		delete(self.m_enrollList)
		self.m_enrollList = nil
	end
end

--重置输入
InvitationalScene.onResetInputView = function(self)
	self:resetMatchCodeKeyboard();
end

InvitationalScene.s_controlConfig = 
{	
	[InvitationalScene.s_controls.backBtn] = {"topView", "returnBtn"},
	[InvitationalScene.s_controls.createBtn] = {"contentView", "leftView", "createBtn"},
	[InvitationalScene.s_controls.myMatchBtn] = {"contentView", "leftView", "myMatchBtn"},
	[InvitationalScene.s_controls.myInvolvedBtn] = {"contentView", "leftView", "myInvolvedBtn"},

	[InvitationalScene.s_controls.rightView] = {"contentView", "rightView"},
}

InvitationalScene.s_controlFuncMap =
{
	[InvitationalScene.s_controls.backBtn] = InvitationalScene.onBackBtnClick;
	[InvitationalScene.s_controls.createBtn] = InvitationalScene.onCreateBtnClick;
	[InvitationalScene.s_controls.myMatchBtn] = InvitationalScene.onMyMatchBtnClick;
	[InvitationalScene.s_controls.myInvolvedBtn] = InvitationalScene.onMyInvolvedBtnClick;

}

InvitationalScene.s_cmdConfig = {
	[InvitationalScene.s_cmds.onResponseInvitationalDetail]			= InvitationalScene.onResponseInvitationalDetail,
	[InvitationalScene.s_cmds.onUpdateMatchState]			= InvitationalScene.onUpdateMatchState,
	[InvitationalScene.s_cmds.onBroadcastPayMoney]     = InvitationalScene.onBroadcastPayMoney,
	[InvitationalScene.s_cmds.onResponseInvitationalCreate]     = InvitationalScene.onResponseInvitationalCreate,
	[InvitationalScene.s_cmds.onResponseMyMatchInvitational]     = InvitationalScene.onResponseMyMatchInvitational,
	[InvitationalScene.s_cmds.onResponseErrorTipsInvitational]     = InvitationalScene.onResponseErrorTipsInvitational,
	[InvitationalScene.s_cmds.onInvitationalMyApplyLists]  = InvitationalScene.onInvitationalMyApplyLists,
	[InvitationalScene.s_cmds.onUpdateBatteryLevel]  = InvitationalScene.onUpdateBatteryLevel,
	[InvitationalScene.s_cmds.onRefreshMyMatchInvitational]  = InvitationalScene.onRefreshMyMatchInvitational,
	[InvitationalScene.s_cmds.onResponseMatchDetail]  = InvitationalScene.onResponseMatchDetail,
	[InvitationalScene.s_cmds.onResetInputView]  = InvitationalScene.onResetInputView,
}