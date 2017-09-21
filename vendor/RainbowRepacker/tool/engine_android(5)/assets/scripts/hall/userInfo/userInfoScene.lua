require("common/commonScene");
require("ui/toast");
require("hall/login/logic/loginLogic");
require("hall/userInfo/data/userLevelConfigInterface");
require("hall/common/uploadImgLogic");
require("hall/userInfo/data/userInfoData");
require("hall/widget/cascadeMenu");
require("hall/main/data/hallDataInterface");
require("uilibs/userMoneyItem");
require("hall/login/data/thirdPartyLoginManager");
require("hall/recharge/data/vipDataInterface");
local userInfo_pin_map = require("qnFiles/qnPlist/hall/userInfo_pin");

local UserInfoScene = class(CommonScene);
UserInfoScene.eStatusType = {
   OPEN = 0; --开启
   CLOSE = 1;--关闭
}
local h_index = 0;
local getIndex = function(self)
	h_index = h_index + 1;
	return h_index;
end
UserInfoScene.s_controls = 
{
	closeBtn  = getIndex();
	headBoxBtn = getIndex();
	nickNameEditText = getIndex();
	iphoneNum = getIndex();
	agentId = getIndex();
	sexRadioBtnView = getIndex();
	sexBoy = getIndex();
	sexGirl = getIndex();
	sexSecrecy = getIndex();
	boyIcon = getIndex();
	girlIcon = getIndex();
	goldNumView = getIndex();

	chenghaoLevel =	getIndex();
	experienceBg = getIndex();
	experienceBar =	getIndex();
	experienceBarNum =	getIndex();

	onekeyRegLoginBtn = getIndex();
	changeAccountBtn = getIndex();
    rechargeCardBtn = getIndex();
	guestplyaIcon = getIndex();
    crystalView    = getIndex();
	crystalNumView = getIndex();
	diamondNumView = getIndex();
	vipIcon = getIndex();
	levelView = getIndex();
    contentView = getIndex();
    cityInfoArea	        = getIndex();
    cityName				= getIndex();
    personalDetailBtn       = getIndex();
    agentBtn                = getIndex();
    userInfoView            = getIndex();
    idNumber                = getIndex();
    vipTips                 = getIndex();
    openVipTips             = getIndex();
    line                    = getIndex();
    moneyNumText            = getIndex();
    crystalNumText          = getIndex();
    diamondNumText          = getIndex();    
    bindingLine             = getIndex();
    qr = getIndex();
    agentPhoneBtn           = getIndex();
    bubble					= getIndex();
    agentPhoneNum 			= getIndex();
    editViewBg              = getIndex();
    pen                     = getIndex(); 
    modifyHeadBg            = getIndex();
};

UserInfoScene.s_cmds =
{
    UpdateBag				=   12;
	SetActiveTab			=   13;
	UpdateQR				=   14;
}


UserInfoScene.ctor = function(self)
	self.m_ctrl = UserInfoScene.s_controls;
    self:setEventTouch(self,function ()end);
    self:setEventDrag(self,function() end);
	self:_initView();
    self:_showPersonalDetail();
    self:__showBindingTips();
    self:__showBindingRedDot();
    self.m_agentPhoneClickCount = 0
    self:__setPenStatus(UserInfoScene.eStatusType.CLOSE);
end

UserInfoScene.resume = function(self)
	CommonScene.resume(self);	
	kUserInfoData:setObserver(self);
	LoginLogic.getInstance():setObserver(self);
	self:updateUserInfo();
end

UserInfoScene.pause = function(self)
	CommonScene.pause(self);
	kUserInfoData:clearObserver(self);
	kUserInfoData:refreshUserCacheInfo();
	LoginLogic.getInstance():clearObserver(self);
end

UserInfoScene.dtor = function(self)
	self:_clearLogic();
	ImageCache.getInstance():cleanRef(self);
	local BaseLoginDialog = require("hall/login/widget/baseLoginDialog");
	BaseLoginDialog.hideAllDialog();
	NativeEvent.getInstance():HideLoadingDialog();
	self.m_agentPhoneClickCount = nil
	self:dtorTimerAgentPhoneBtn()
	self:dtorAgentBubble()
    self:__deleteBindingTipsTimer();
end

UserInfoScene._clearLogic = function(self)
	delete(self.m_uploadImgLogic);
	self.m_uploadImgLogic = nil;
end
-----------------------------------------------------
UserInfoScene.onCloseBtnClick = function(self)
	self:requestCtrlCmd(UserInfoController.s_cmds.Back);
end


UserInfoScene.onHeadBoxBtnClick = function(self)
	UBReport.getInstance():report(UBConfig.kHallUserInfoHead);
	if HallDataInterface.getInstance():isTakePhotoSwitchOpen() then
		if not self.m_uploadImgLogic then 
			self.m_uploadImgLogic = new(UploadImgLogic,self);
		end 
		self.m_uploadImgLogic:startUploadHeadImage();
	end
end

UserInfoScene.__setPenStatus = function (self, status)
   self.m_penStatus = status;
   local isShow = status == UserInfoScene.eStatusType.OPEN and true or false ;
   self.m_editViewBg:setVisible(isShow);
   self.m_pen:setVisible(not isShow);
end

UserInfoScene.onPenClick = function (self, finger_action, x, y, drawing_id_first, drawing_id_current)
    local penX, penY = self.m_pen:getAbsolutePos();
    local w, h = self.m_pen:getSize();
    local space = 20;
    if x >= penX - space and x <= penX + w + space and y >= penY - space and y <= penY + h + space then
         local nickName = self:findViewById(UserInfoScene.s_controls.nickNameEditText);
         if self.m_penStatus == UserInfoScene.eStatusType.CLOSE then   
             nickName:onEventTouch(finger_action, x, y, drawing_id_first, drawing_id_current);
             if finger_action == kFingerUp then
                self:__setPenStatus(UserInfoScene.eStatusType.OPEN);
             end
         else
             if finger_action == kFingerUp then
                nickName:setText("");  
             end   
         end
    end
end

UserInfoScene.onModifyNickName = function(self)
    local nameCtrl = self:findViewById(UserInfoScene.s_controls.nickNameEditText);
    self:__setPenStatus(UserInfoScene.eStatusType.CLOSE);
	local str = nameCtrl:getText();
	local resultStr,bCount = ToolKit.utf8_substring(tostring(str),1,12);
	local tips = "";
	local flag = false;
	if string.find(resultStr , " ") then
		tips = GameString.get("loginNickFormatEmptyError");
		resultStr = self.m_nickname;
	elseif bCount < 3 or (bCount >= 12 and str ~= resultStr) then 
 		tips = GameString.get("loginNickFormatError");
		resultStr = self.m_nickname;
	else
		flag = true;
 	end
 	nameCtrl:setText(resultStr,420);
 	if not flag then
 		self:showNotice(tips);
 	else
 		kUserInfoData:setCacheNick(resultStr);
 		kUserInfoData:setNickname(resultStr);
    end
end

UserInfoScene.onSexRadioGroupChange = function(self,curIndex,lastIndex)
  	kEffectPlayer:play(Effects.AudioButtonClick);
	kUserInfoData:setCacheSex(curIndex);
	kUserInfoData:setSex(curIndex);
	self.m_sex = curIndex;

	self:onSetUserHeadIcon();
end

UserInfoScene.onSexBoyTouch = function(self,finger_action,x,y,drawing_id_first,drawing_id_current)
	self:onSexTipsTouch(1,finger_action,x,y,drawing_id_first,drawing_id_current);
end 

UserInfoScene.onSexGirlTouch = function(self,finger_action,x,y,drawing_id_first,drawing_id_current)
	self:onSexTipsTouch(2,finger_action,x,y,drawing_id_first,drawing_id_current);
end 

UserInfoScene.onSexSecrecyTouch = function(self,finger_action,x,y,drawing_id_first,drawing_id_current)
	self:onSexTipsTouch(3,finger_action,x,y,drawing_id_first,drawing_id_current);
end

UserInfoScene.onSexTipsTouch = function(self,index,finger_action,x,y,drawing_id_first,drawing_id_current)
	local tipsCtrl;
	if index == 1 then 
		tipsCtrl = self.m_ctrl.sexBoy;
	elseif index == 2 then 
		tipsCtrl = self.m_ctrl.sexGirl;
	else 
		tipsCtrl = self.m_ctrl.sexSecrecy;
	end 
	local tips = self:findViewById(tipsCtrl);

	if finger_action == kFingerDown then
		tips:setColor(128,128,128);
	elseif finger_action == kFingerUp then 
		tips:setColor(255,255,255);

		if drawing_id_first == drawing_id_current then 
			self:onSexRadioGroupChange(index);
			
			self:findViewById(self.m_ctrl.sexRadioBtnView):setSelected(index);
		end 
	else
		tips:setColor(255,255,255);
	end
end 

UserInfoScene.onOneKeyRegLogin = function(self)
    self:__saveOpenRegisterBtnRedDotStatus(kFalse,"bindingRedDot");
    if self.m_redDot then
        self.m_redDot:setVisible(false);
    end
	UBReport.getInstance():report(UBConfig.kHallUserInfoRegistAccount);
	kUserInfoData:refreshUserCacheInfo();
	local RegisterAccountDialog = require("hall/login/widget/registerAccountDialog");
    RegisterAccountDialog.show();
end

UserInfoScene.onChangeAccount = function(self)
	UBReport.getInstance():report(UBConfig.kHallUserInfoSwitchAccount);
	kUserInfoData:refreshUserCacheInfo();
	local loginType = ThirdPartyLoginManager.getInstance():getThirdPartyLoginType();
	if ThirdPartyLoginManager.getInstance():isSupportSwitchAccount(loginType) then
		local ThirdPartySwitchAccountDialog = require("hall/login/widget/thirdPartySwitchAccountDialog");
		ThirdPartySwitchAccountDialog.show();
	else
        if  kLoginDataInterface:getLastUType() == LoginConstants.uType.BoyaaPassport then
        	local OldAccountLoginDialog = require("hall/login/widget/oldAccountLoginDialog");
		    OldAccountLoginDialog.show();
        else
        	local WarningLoginDialog = require("hall/login/widget/warningLoginDialog");
            WarningLoginDialog.show();
        end
	end
end

UserInfoScene.onRechargeCardBtnClick = function(self)
    UBReport.getInstance():report(UBConfig.kHallUserInfoRechargeCardBtn);
    StateMachine.getInstance():pushState(States.RechargeCard);
end

-----------------------------------------------------
UserInfoScene.updateUserInfo = function(self)
	self.m_nickname = kUserInfoData:getNickname();
	self.m_sex = kUserInfoData:getSex();

	self:onSetUserNickName();
	self:onSetUserAccount();	
	self:onSetUserSex();

	self:onSetUserLevel();
	self:onSetUserExp();
	self:onRefreshProperty();

	self:onSetVipInfo();
	self:onSetCity();
end

UserInfoScene.onRefreshProperty = function(self)
	self:onSetUserMoney();
	self:onSetUserDiamond();
	self:onSetUserCrystal();
end

UserInfoScene.onRefreshVipInfo = function(self)
	self:onSetVipInfo();
	self:onRefreshProperty();
end



UserInfoScene.onSetUserMoney = function(self)
	local money = kUserInfoData:getMoney();
	self.m_moneyNumText:setText(ToolKit.skipMoneyEx5(money,2));
end

UserInfoScene.onSetUserDiamond = function(self)
	local diamond = kUserInfoData:getDiamond();
  	self.m_diamondNumText:setText(ToolKit.skipMoneyEx5(diamond,2));
end

UserInfoScene.onSetUserCrystal = function(self)
    local crystalOrSilver = kUserInfoData:getCrystal();
    self.m_crystalNumText:setText(ToolKit.skipMoneyEx5(crystalOrSilver,2));
end

UserInfoScene._showIphoneNumber = function (self,isBoyaaPassport)
    local iphoneNum = self:findViewById(self.m_ctrl.iphoneNum);
    local iphoneStr;
    local r, g, b = 143, 92, 31;
    if isBoyaaPassport then
        local number = kLoginDataInterface:getLastByacc();
        iphoneStr = string.sub(number,1,3).."****"..string.sub(number,8,11);    
    else
        iphoneStr = "安全绑定" ;
        r, g, b = 53, 153, 83;   
    end
    iphoneNum:setPickable(not isBoyaaPassport);
    iphoneNum:setText(string.valueOf(iphoneStr),nil,nil,r,g,b);
    local  bindingLine = self:findViewById(self.m_ctrl.bindingLine)
    bindingLine:setVisible(not isBoyaaPassport);
    bindingLine:setPos(iphoneNum:getPos(),nil);
end

UserInfoScene.onImmediatelyBindingClick = function (self)
    self:onOneKeyRegLogin();
end

UserInfoScene.onSetUserAccount = function(self)
	
    self:findViewById(self.m_ctrl.idNumber):setText(string.valueOf(kUserInfoData:getUserCid()));

	local agentId = kUserInfoData:getAgentCode();
	local ctrlAgentId = self:findViewById(self.m_ctrl.agentId);
	if agentId > 0 then
		ctrlAgentId:setVisible(true);
		ctrlAgentId:setText("推荐码:" .. agentId);
	else
		ctrlAgentId:setVisible(false);
	end

	local lastLoginUType = kLoginDataInterface:getLastUType();
	local isBoyaaPassport = (lastLoginUType == 2);
	self:findViewById(self.m_ctrl.guestplyaIcon):setVisible(not isBoyaaPassport);
	self:findViewById(self.m_ctrl.onekeyRegLoginBtn):setVisible(not isBoyaaPassport);
    if isBoyaaPassport then
       self:__reSetBtnsPosition();      
    end

	if not HallDataInterface.getInstance():isRegisterSwitchOpen() then
		self:findViewById(self.m_ctrl.onekeyRegLoginBtn):setVisible(false);
	end
	
    self:_showIphoneNumber(isBoyaaPassport);
	self:findViewById(self.m_ctrl.changeAccountBtn):setVisible(HallDataInterface.getInstance():isAccountSwitchOpen());
end

UserInfoScene.__reSetBtnsPosition = function (self)
    local onekeyRegLoginBtn =  self:findViewById(self.m_ctrl.onekeyRegLoginBtn); 
    local changeAccountBtn =  self:findViewById(self.m_ctrl.changeAccountBtn);
    local rechargeCardBtn =  self:findViewById(self.m_ctrl.rechargeCardBtn);
    local x,_ = onekeyRegLoginBtn:getPos();
    changeAccountBtn:setPos(x,nil);
    rechargeCardBtn:setPos(x+148);
end

UserInfoScene.onSetUserNickName = function(self)
	self:findViewById(self.m_ctrl.nickNameEditText):setText(ToolKit.utf8_substring(self.m_nickname,1,12),420);
end

UserInfoScene.onSetCity = function(self)
	local city = ToolKit.utf8_substring(kUserInfoData:getCity(), 1, 18);
	self.m_cityName:setText(city, 1);
	local w, h = self.m_cityName:getSize();
	self.m_cityInfoArea:setSize(w + 40, h);
end

UserInfoScene.onSetUserLevel = function(self)
	local level ,levelName = kUserLevelConfigInterface:countLevelByExp(kUserInfoData:getExp());
	local strChenghaoLevel = string.concat(GameString.get("UserInfoLevelSymbol") , level or "0" , "(" , levelName or kTextUserInfoDefaultLevelName , ")");
	self:findViewById(self.m_ctrl.chenghaoLevel):setText(strChenghaoLevel);
end

UserInfoScene.onSetUserExp = function(self)
	local curExp = kUserInfoData:getExp();
	local expValue = kUserLevelConfigInterface:countLevelPercent(curExp);
	expValue = number.valueOf(expValue , 0);
	local bar = self:findViewById(self.m_ctrl.experienceBar);
    local w,h = bar:getSize();
    local width,height = self:findViewById(self.m_ctrl.experienceBg):getSize();

    bar:setClip(0,0,w*expValue,height);

	self:findViewById(self.m_ctrl.experienceBarNum):setText(string.concat(math.floor(expValue*100) , "%"));
end

UserInfoScene.onSetUserSex = function(self)
	local sex = self.m_sex;

	if sex == 0 then
		sex = 3;
	end
  	self:findViewById(self.m_ctrl.sexRadioBtnView):setSelected(sex);

  	self:onSetUserHeadIcon();
end

UserInfoScene.onSetUserHeadIcon = function(self)
	self:_onImageDownload();

	local url = kUserInfoData:getAvatar_b();
	if url and url~="" then
		ImageCache.getInstance():request(url,self,self._onImageDownload);
	end
end

UserInfoScene._onImageDownload = function(self,url,file)	
	if self.m_headImage then
		self.m_headImage:getParent():removeChild(self.m_headImage, true);
	end

    local headImgFile = string.isEmpty(file) and kUserInfoData:getHeadBySex(self.m_sex, true) or file;

	self.m_headImage = new(Mask, headImgFile, userInfo_pin_map["head_mask.png"]);
	self.m_headBoxBtn:addChild(self.m_headImage);
	self.m_headImage:setLevel(-2);
	local width, height = self.m_headBoxBtn:getSize()
    self.m_headImage:setSize(width, height);
end

UserInfoScene._getTextAndColour = function (self, isVip)
    local vipTime = kUserInfoData:getVipTime();
    local str,r,g,b;
    r = 143; g = 92; b = 31;
    if not isVip then
        str = "尚未开通";
    else
        if vipTime == -1 then
            str = "无限制";
        elseif vipTime == 0 then
            str = "已过期";
            r = 255; g = 0; b = 0;
        else
            local d, h = math.modf(vipTime/(24*3600));
            local showH = math.floor(h*24);
            h = h*24;
            if d > 0 or h > 1  then
                str = d.."天"..showH.."小时";
            elseif h < 1 then
                str = "不足1小时";
                r = 255; g = 0; b = 0;
            end
        end
    end
    return str, r, g, b;
end

UserInfoScene._getTextSize =  function(self, label)
    local text = new(Text, label:getText(), nil, nil, nil, nil, label.m_res.m_fontSize);
    local w,h = text:getSize();
    delete(text);
    return w,h;
end

UserInfoScene.onSetVipInfo = function(self)
	local isVip = kUserInfoData:getIsVip();
    
    local vipIcon = self:findViewById(UserInfoScene.s_controls.vipIcon);
	vipIcon:setVisible(isVip);
    
    local vipTips = self:findViewById(UserInfoScene.s_controls.vipTips);
    local vipTipsStr,r,g,b = self:_getTextAndColour(isVip);
    vipTips:setText(vipTipsStr,nil,nil,r,g,b);
    

    local openVipTips = self:findViewById(UserInfoScene.s_controls.openVipTips);
    local openVipTipsStr = isVip and "立即续费" or "了解VIP特权";
    openVipTips:setText(openVipTipsStr);
    local w,h = self:_getTextSize(vipTips);
    local x,y = vipTips:getPos();
    openVipTips:setPos(x + w + 30, nil);

    local line = self:findViewById(UserInfoScene.s_controls.line);
    local openVipTipsW, _ = self:_getTextSize(openVipTips);
    line:setSize(openVipTipsW, nil);
    line:setPos(x + w + 30 , nil);
end

UserInfoScene.onOpenVipTipsTextClick = function (self)
    local isVip = kUserInfoData:getIsVip();
    if isVip then
        UBReport.getInstance():report(UBConfig.kHallUserInfoImmediatelyRenewals);
        self:_showFastRenewalsLayout();
    else
        UBReport.getInstance():report(UBConfig.kHallUserInfoVipPrivilege);
        RechargeDataInterface.getInstance():setToRechargeMode( RechargeDataInterface.getInstance():getTabVipId() );
        StateMachine.getInstance():pushState(States.Recharge,nil,true);
    end
end

UserInfoScene._showFastRenewalsLayout = function (self)
    local data = kGoodsListInterface:getSceneGoodsInfo(PayConfig.eGoodsListId.MarketVip, { ["scene"] = PayConfig.eGoodsListId.MarketVip} );
    if not self.m_showFastRenewalsLayout then
		self.m_showFastRenewalsLayout = new(require("hall/userInfo/widget/fastRenewalsLayout"), data.goodsList or {});
		self.m_showFastRenewalsLayout:setDelegate(self);
		self.m_showFastRenewalsLayout:setFillParent(true, true);
		self:addChild(self.m_showFastRenewalsLayout);
	end
	self.m_showFastRenewalsLayout:show();
    self:pushStateStack(self, self.onCloseFastRenewalsLayout); 
end

UserInfoScene.onCloseFastRenewalsLayout = function (self,isManualClick)
    self.m_showFastRenewalsLayout:hide();
	self:popStateStack(isManualClick);
end

UserInfoScene.showNotice = function(self,msg, fontSize)
	if msg and msg ~= "" then 
		Toast.getInstance():showText(msg,50,30,kAlginLeft,"", (fontSize or 24),255,255,255);
	end 
end

UserInfoScene._initView = function(self)
    
	self.m_pen = self:findViewById(self.m_ctrl.pen);
    self.m_editViewBg = self:findViewById(self.m_ctrl.editViewBg);
    local nickNameEditText = self:findViewById(self.m_ctrl.nickNameEditText);
	nickNameEditText:setText("",420);
	nickNameEditText:setHintText(kTextUserInfoInputName, 143, 92, 31);
    nickNameEditText:setMaxLength(12);
	nickNameEditText:setEventTouch(self,self.onPenClick);
    nickNameEditText:setFilterSensitiveWordFlag(true);
	self.m_cityName = self:findViewById(self.m_ctrl.cityName);
    
    self.m_modifyHeadBg = self:findViewById(self.m_ctrl.modifyHeadBg)
	self.m_cityInfoArea = self:findViewById(self.m_ctrl.cityInfoArea)
	self.m_contentView = self:findViewById(self.m_ctrl.contentView)
	self.m_headBoxBtn = self:findViewById(self.m_ctrl.headBoxBtn);
	self.m_qr = self:findViewById(self.m_ctrl.qr)
	self:updateQR()
    
    if HallDataInterface.getInstance():isTakePhotoSwitchOpen() then
        self.m_modifyHeadBg:setVisible(true);
    else
        self.m_modifyHeadBg:setVisible(false);
    end
    

	-- 棋类隐藏等级和经验
	local levelView = self:findViewById(self.m_ctrl.levelView);
	levelView:setVisible(RegionConfigDataInterface.getInstance():getShowUserLevelExpFlag());

    local experienceBg = self:findViewById(self.m_ctrl.experienceBg);
    experienceBg:setVisible(RegionConfigDataInterface.getInstance():getShowUserLevelExpFlag());

	self:_initGoldDiamondNum();

	local phone = kUserInfoData:getAgentPhone()
	self:findViewById(self.m_ctrl.agentPhoneBtn):setVisible((phone ~= ""))

	local isRechargeCardSwitchOpen = not HallDataInterface.getInstance():getVersionFilterSwitch();
	self:findViewById(self.m_ctrl.rechargeCardBtn):setVisible(isRechargeCardSwitchOpen);
end

UserInfoScene.updateQR = function(self)
	local file_name = kUserInfoData:getQRImageName()
	if not file_name then
        local qRImageName = QRUtil.getInstance():_getQRImageNameByType(QRUtil.eQRType.BIND_ANGECY_USERINFO)
        local imagePath = System.getStorageImagePath() .. "/" .. qRImageName
        if not QRUtil.getInstance():isFileExist(imagePath) then
        	return
        end
        file_name = qRImageName
	end
	self.m_qr:setFile(file_name)
end

UserInfoScene._initGoldDiamondNum = function(self)
	self.m_moneyNumText = self:findViewById(self.m_ctrl.moneyNumText);
	self.m_diamondNumText = self:findViewById(self.m_ctrl.diamondNumText);
    self.m_crystalView = self:findViewById(self.m_ctrl.crystalView);
	self.m_crystalNumText = self:findViewById(self.m_ctrl.crystalNumText);

    self.m_crystalView:getChildByName("crystalIcon"):setFile("isolater/crystal.png");   
end


--[Comment]
--修改玩家城市
UserInfoScene.onEditUserCity = function ( self )
	UBReport.getInstance():report(UBConfig.kHallUserInfoCity);
	if not self.m_cityData then 
		self.m_cityData = kUserInfoData:getCityData();
		if not self.m_cityData then 
			return;
		end
	end
	
	self:pushStateStack(self, self.onEditUserCityClose);
	
	-- 创建级联菜单
	if not self.m_menu then 
		self.m_menu = new(CascadeMenu, self.m_cityData, 428, 552, "hall/common/bg_shiled.png");
		self.m_menu:setOnItemClickCallback(self, self.onSelectUserCity);
		self.m_menu:setOnCloseCallback(self, self.onEditUserCityClose);
		self.m_menu:setAlign(kAlignCenter);
		self.m_menu:hide();
		self.m_root:addChild(self.m_menu);
	end
	
	local cityInfo = string.split(self.m_cityName:getText(), " ");
	if #cityInfo == 2 then 
		self.m_menu:setDefaultCity(cityInfo[1], cityInfo[2]);
	else
		self.m_menu:setDefaultCity(cityInfo[1], "");
	end

	self.m_menu:show();
end

UserInfoScene.onEditUserCityClose = function(self, popStack)
	if popStack then
		self:popStateStack();
	end

	if self.m_menu then
		self.m_menu:hide();
	end
end

--[Comment]
-- 选择城
UserInfoScene.onSelectUserCity = function ( self, pro, city )
	-- body
	local cityInfo = string.concat(pro, " ", city);
	Log.d("city", cityInfo);
	self.m_cityName:setText(cityInfo, 1);
	local w, h = self.m_cityName:getSize();
	self.m_cityInfoArea:setSize(w + 40, h);
	kUserInfoData:setCacheCity(cityInfo);
 	kUserInfoData:setCity(cityInfo);
end

UserInfoScene.onLoginSuccess = function(self)
	self:requestCtrlCmd(UserInfoController.s_cmds.BackToHall);
end

UserInfoScene.onUploadHeadImageCallback = function(self,isSuccess)
	if isSuccess then 
		self:onSetUserHeadIcon();
	end
end

UserInfoScene.refreshUserProperty = function(self,propertyType,curNum,lastNum)
	self:onRefreshProperty();
end

UserInfoScene.refreshUserIdentity = function(self,curIdentity,lastIdentity)
	self:onRefreshVipInfo();
end

UserInfoScene.onPersonalDetailBtnClick = function (self)
    self:_showPersonalDetail();
end

UserInfoScene.onAgentBtnClick = function (self) 
    self:_showAgent();
end

UserInfoScene._showPersonalDetail = function (self)
    self:findViewById(self.m_ctrl.personalDetailBtn):setEnable(false);
	self:findViewById(self.m_ctrl.agentBtn):setEnable(true);
    self:findViewById(self.m_ctrl.userInfoView):setVisible(true);
end

UserInfoScene._showAgent = function (self)
    self:findViewById(self.m_ctrl.personalDetailBtn):setEnable(true);
	self:findViewById(self.m_ctrl.agentBtn):setEnable(false);
    self:findViewById(self.m_ctrl.userInfoView):setVisible(false);
end

UserInfoScene.onAgentPhoneBtnClick = function (self)
	local phone = kUserInfoData:getAgentPhone()
	if phone == "" then
		return
	end

	self:findViewById(self.m_ctrl.bubble):setVisible(false)
	delete(self.m_timerAgentPhoneBtn)
	self.m_timerAgentPhoneBtn = new(AnimDouble, kAnimNormal, 0, 1, 1500, -1)
	self.m_timerAgentPhoneBtn:setDebugName("AnimDouble|UserInfoScene.m_agentPhoneClickCount")
	self.m_timerAgentPhoneBtn:setEvent(self, self.resetAgentPhoneCount)

	self.m_agentPhoneClickCount = self.m_agentPhoneClickCount + 1
	if self.m_agentPhoneClickCount == 3 then
		self:resetAgentPhoneCount()
		phone = self:formatPhone(phone)
		self:findViewById(self.m_ctrl.agentPhoneNum):setText(phone)
		self:findViewById(self.m_ctrl.bubble):setVisible(true)
		delete(self.m_timerAgentBubble)
		self.m_timerAgentBubble = new(AnimDouble, kAnimNormal, 0, 1, 5000, -1)
	    self.m_timerAgentBubble:setDebugName("AnimDouble|UserInfoScene.m_timerAgentBubble")
	    self.m_timerAgentBubble:setEvent(self, self.resetAgentBubble)
	end
end

UserInfoScene.formatPhone = function(self, phone)
	if type(phone) ~= "string" then
		return ""
	end
	local str1 = string.sub(phone, 1, 3)
	local str2 = string.sub(phone, 8, -1)
	return str1 .. "****" .. str2
end

UserInfoScene.resetAgentPhoneCount = function(self)
	self.m_agentPhoneClickCount = 0
	self:dtorTimerAgentPhoneBtn()
end

UserInfoScene.dtorTimerAgentPhoneBtn = function(self)
	delete(self.m_timerAgentPhoneBtn)
	self.m_timerAgentPhoneBtn = nil
end

UserInfoScene.resetAgentBubble = function(self)
	self:findViewById(self.m_ctrl.bubble):setVisible(false)
	self:dtorAgentBubble()
end

UserInfoScene.dtorAgentBubble = function(self)
	delete(self.m_timerAgentBubble)
	self.m_timerAgentBubble = nil
end

UserInfoScene.__showBindingTips = function (self)

    local rewardNum = TaskRewardDataInterface.getInstance():getRewardNumByjumpCode(CommonJumpCmds.GOTO_REGISTER_ACCOUNT);
    if rewardNum == 0 then
        return;
    end
    local isShow = self:__getOpenRegisterBtnRedDotStatus("bindingTips") == kTrue and true or false;
    if isShow and not self.m_bubble then  
        self.m_bubble = UIFactory.createImage("hall/broadcast/bubble.png");
        self:findViewById(self.m_ctrl.onekeyRegLoginBtn):addChild(self.m_bubble);
        self.m_bubble:setAlign(kAlignTop);
        self.m_bubble:setPos(-65,-90);
        local str = "#c359953成功注册绑定手机#cFFFFFF可立即获得#cF26D0B%s银币";
        local w, h = self.m_bubble:getSize();
        local tips = new(RichText, string.format(str, rewardNum), w, h, kAlignLeft, nil, 22, nil, nil, nil, true);
	    tips:setAlign(kAlignLeft);
        tips:setPos(10,-7);
	    self.m_bubble:addChild(tips);
        self:__saveOpenRegisterBtnRedDotStatus(kFalse,"bindingTips");
        self.m_bindingTipsTimer = new(Timer,"UserInfoScene|m_bindingTipsTimer", 5, self, self.hideBindingTips);
    end
end

UserInfoScene.__deleteBindingTipsTimer = function (self)
    if self.m_bindingTipsTimer then
        delete(self.m_bindingTipsTimer);
    end
    self.m_bindingTipsTimer = nil;
end

UserInfoScene.hideBindingTips = function (self)
    if self.m_bubble then
        self.m_bubble:setVisible(false);
    end
    self:__deleteBindingTipsTimer();
end

UserInfoScene.__showBindingRedDot = function (self)
    local isShow = self:__getOpenRegisterBtnRedDotStatus("bindingRedDot") == kTrue and true or false;
    if isShow and not self.m_redDot then
        self.m_redDot = UIFactory.createImage("hall/common/msg_icon.png");
        self:findViewById(self.m_ctrl.onekeyRegLoginBtn):addChild(self.m_redDot);
        self.m_redDot:setAlign(kAlignTopRight);
        self.m_redDot:setSize(24,24);
    end
end

UserInfoScene.__saveOpenRegisterBtnRedDotStatus = function (self, status, name)
    local dict_name = self:__getDictName();
    dict_set_int(dict_name, name, status);
    dict_save(dict_name);
end

UserInfoScene.__getOpenRegisterBtnRedDotStatus = function (self, name)
    return dict_get_int(self:__getDictName(), name, kTrue);
end

UserInfoScene.__getDictName = function (self)
   local dict_name = "UserInfoSceneRegisterBinding"..kUserInfoData:getUserId();
   dict_load(dict_name); 
   return dict_name;
end

UserInfoScene.s_controlConfig = 
{
	[UserInfoScene.s_controls.closeBtn] = {"bg","closeBtn"},
	[UserInfoScene.s_controls.headBoxBtn] = {"userInfoView","headView" , "headbg","headBoxBtn"},
	[UserInfoScene.s_controls.iphoneNum] = {"userInfoView","headView" , "phoneView","iphoneNum"},
    [UserInfoScene.s_controls.bindingLine] = {"userInfoView","headView" , "phoneView","bindingLine"},
	[UserInfoScene.s_controls.agentId] = {"userInfoView","headView" , "agentId"},
	[UserInfoScene.s_controls.goldNumView] = {"userInfoView","headView" , "goldView", "goldNumView"},
    [UserInfoScene.s_controls.moneyNumText] = {"userInfoView","headView" , "goldView", "goldNumView","moneyNumText"},
	[UserInfoScene.s_controls.crystalView] = {"userInfoView","headView" , "crystalView"},
	[UserInfoScene.s_controls.crystalNumView] = {"userInfoView","headView" , "crystalView","crystalNumView"},
    [UserInfoScene.s_controls.crystalNumText] = {"userInfoView","headView" , "crystalView","crystalNumView","crystalNumText"},
	[UserInfoScene.s_controls.diamondNumView] = {"userInfoView","headView" , "diamondView", "diamondNumView"},
    [UserInfoScene.s_controls.diamondNumText] = {"userInfoView","headView" , "diamondView", "diamondNumView","diamondNumText"},
	[UserInfoScene.s_controls.nickNameEditText] = {"userInfoView","infoView","bg","contentView" , "nameView" , "editText"},	
	[UserInfoScene.s_controls.sexRadioBtnView] = {"userInfoView","infoView","bg","contentView" , "sexView" , "sexRadioBtnView"},
	[UserInfoScene.s_controls.sexBoy] = {"userInfoView","infoView","bg","contentView" , "sexView" , "boyText"},
	[UserInfoScene.s_controls.sexGirl] = {"userInfoView","infoView","bg","contentView" , "sexView" , "girlText"},
	[UserInfoScene.s_controls.sexSecrecy] = {"userInfoView","infoView","bg","contentView" , "sexView" , "secrecyText"},
	[UserInfoScene.s_controls.boyIcon] = {"userInfoView","infoView","bg","contentView" , "sexView" , "boyIcon"},
	[UserInfoScene.s_controls.girlIcon] = {"userInfoView","infoView","bg","contentView" , "sexView" , "girlIcon"},		
    [UserInfoScene.s_controls.idNumber] = {"userInfoView","headView" , "idView","idNumber"},
	[UserInfoScene.s_controls.chenghaoLevel] = {"userInfoView","infoView","bg","contentView" , "chenghao" , "chenghaoLevel"},
	[UserInfoScene.s_controls.experienceBg] = {"userInfoView","infoView","bg","contentView" , "chenghao" , "pro_bg"},
	[UserInfoScene.s_controls.experienceBar] = {"userInfoView","infoView","bg","contentView" , "chenghao" , "pro_bg","pro"},
	[UserInfoScene.s_controls.experienceBarNum] = {"userInfoView","infoView","bg","contentView" , "chenghao" , "pro_bg" , "pro_text"},
	[UserInfoScene.s_controls.onekeyRegLoginBtn] = {"userInfoView","infoView","bg","btnsView","onekeyRegLoginBtn"},
	[UserInfoScene.s_controls.changeAccountBtn] = {"userInfoView","infoView","bg","btnsView","changeAccountBtn"},
    [UserInfoScene.s_controls.rechargeCardBtn] = {"userInfoView","infoView","bg","btnsView","rechargeCardBtn"},
	[UserInfoScene.s_controls.qr] = {"userInfoView","infoView","bg","btnsView","QR"}, 
	[UserInfoScene.s_controls.guestplyaIcon] = {"userInfoView","headView" , "headbg","headBoxBtn","guestplayIcon"},
	[UserInfoScene.s_controls.vipIcon] = {"userInfoView","headView" , "headbg","headBoxBtn","vip_icon"},
	[UserInfoScene.s_controls.levelView] = {"userInfoView","infoView","bg","contentView", "chenghao"},
	[UserInfoScene.s_controls.contentView] = {"userInfoView","infoView","bg","contentView"},
	[UserInfoScene.s_controls.cityName] = {"userInfoView","infoView","bg","contentView" , "cityView", "cityInfoArea", "cityName"},
    [UserInfoScene.s_controls.cityInfoArea] = {"userInfoView","infoView","bg","contentView" , "cityView", "cityInfoArea"},
    [UserInfoScene.s_controls.personalDetailBtn] = {"rightTabView" , "personalDetailBtn"},
    [UserInfoScene.s_controls.agentBtn] = {"rightTabView" , "agentBtn"},
    [UserInfoScene.s_controls.userInfoView] = {"userInfoView"}, 
    [UserInfoScene.s_controls.vipTips] = {"userInfoView","infoView","bg","vipView","vipTips"}, 
    [UserInfoScene.s_controls.openVipTips] = {"userInfoView","infoView","bg","vipView","openVipTips"}, 
    [UserInfoScene.s_controls.line] = {"userInfoView","infoView","bg","vipView","line"}, 
    [UserInfoScene.s_controls.agentPhoneBtn] = {"bg", "agentPhoneBtn"}, 
    [UserInfoScene.s_controls.bubble] = {"bg", "bubble"}, 
    [UserInfoScene.s_controls.agentPhoneNum] = {"bg", "bubble", "num"}, 
    [UserInfoScene.s_controls.editViewBg] = {"userInfoView","infoView","bg","contentView" , "nameView" , "editViewBg"},	
    [UserInfoScene.s_controls.pen] = {"userInfoView","infoView","bg","contentView" , "nameView" , "pen"},	
    [UserInfoScene.s_controls.modifyHeadBg] = {"userInfoView","headView" , "headbg","headBoxBtn","modifyHeadBg"},
};

UserInfoScene.s_controlFuncMap = 
{
	[UserInfoScene.s_controls.closeBtn] = UserInfoScene.onCloseBtnClick;
	[UserInfoScene.s_controls.headBoxBtn] = UserInfoScene.onHeadBoxBtnClick;
	[UserInfoScene.s_controls.nickNameEditText] = UserInfoScene.onModifyNickName;
	[UserInfoScene.s_controls.sexRadioBtnView] = UserInfoScene.onSexRadioGroupChange;
	[UserInfoScene.s_controls.sexBoy] = UserInfoScene.onSexBoyTouch;
	[UserInfoScene.s_controls.sexGirl] = UserInfoScene.onSexGirlTouch;
	[UserInfoScene.s_controls.sexSecrecy] = UserInfoScene.onSexSecrecyTouch;
	[UserInfoScene.s_controls.boyIcon] = UserInfoScene.onSexBoyTouch;
	[UserInfoScene.s_controls.girlIcon] = UserInfoScene.onSexGirlTouch;
	[UserInfoScene.s_controls.onekeyRegLoginBtn] = UserInfoScene.onOneKeyRegLogin;
	[UserInfoScene.s_controls.changeAccountBtn] = UserInfoScene.onChangeAccount;
    [UserInfoScene.s_controls.rechargeCardBtn] = UserInfoScene.onRechargeCardBtnClick;
	[UserInfoScene.s_controls.cityInfoArea] 		= UserInfoScene.onEditUserCity;
    [UserInfoScene.s_controls.personalDetailBtn] = UserInfoScene.onPersonalDetailBtnClick;
    [UserInfoScene.s_controls.agentBtn] = UserInfoScene.onAgentBtnClick;
    [UserInfoScene.s_controls.openVipTips]   = UserInfoScene.onOpenVipTipsTextClick;
    [UserInfoScene.s_controls.iphoneNum]   = UserInfoScene.onImmediatelyBindingClick;
    [UserInfoScene.s_controls.agentPhoneBtn] = UserInfoScene.onAgentPhoneBtnClick;
};

UserInfoScene.s_cmdConfig = 
{
    [UserInfoScene.s_cmds.UpdateQR] = UserInfoScene.updateQR,
}

return UserInfoScene;
