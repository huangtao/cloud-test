local MoreTip = class(CommonGameLayer,false)
require("isolater/interface/weiXinIsolater");

local h_index = 0;
local getIndex = function(self)
	h_index = h_index + 1;
	return h_index;
end

MoreTip.s_controls = {
	Image_more_bg = getIndex();
}

MoreTip.ctor = function(self)
	local config = require(ViewPath .. "hall/main/more_view");
	super(self,config);
    self:setFillParent(true,true);
	self.Delegate = {
    onPushToOtherState = "onPushToOtherState";
	scanningBtnClick = "scanningBtnClick";
	}

	self.m_root:setEventTouch(self,self.onRootClick);
	self:init();

    IPopDialogManager.getInstance():addPopDialog(self, 100, self.close, self);
end

MoreTip.dtor = function(self)
    IPopDialogManager.getInstance():removePopDialog(self);
end

MoreTip.getItemData = function(self)

	local __data = {
	{imagePath = "hall/hall/hall_moreSweep.png",func = self.onSweepClick}
	};

	local __exchangeConfig = {imagePath = "hall/hall/hall_moreChange.png",func = self.onChangeClick};
	local __isOpen = HallDataInterface.getInstance():isButtonDisplay(GameType.HALL, HallBottomButtonConfig.btnIds.exchange);
	if __isOpen then
		table.insert(__data,__exchangeConfig);
	end
	__isOpen = HallDataInterface.getInstance():isButtonDisplay(GameType.HALL, HallBottomButtonConfig.btnIds.invitational);
	if __isOpen then
		table.insert(__data, {imagePath = "hall/hall/hall_invitational.png", func = self.onInvitationalClick})
	end

    __isOpen = HallDataInterface.getInstance():isButtonDisplay(GameType.HALL, HallBottomButtonConfig.btnIds.tellFriends);
	if __isOpen then
		table.insert(__data, {imagePath = "hall/hall/hall_moreTellFriends.png", func = self.onTellFriendsClick})
	end

    __isOpen = HallDataInterface.getInstance():isButtonDisplay(GameType.HALL, HallBottomButtonConfig.btnIds.friendsCircle);
	if __isOpen then
		table.insert(__data, {imagePath = "hall/hall/hall_moreFriendsCircle.png", func = self.onFriendsCircleClick})
	end

	return __data;
end

MoreTip.init = function(self)

	local __data = self:getItemData();
	local __y = 0;
	local __intervalY = 70;
	self:findViewById(self.s_controls.Image_more_bg):setSize(nil,__intervalY*(#__data));

	for i = 1,#__data do 

		local __node = new(Node)
		__node:setSize(230,70);
		__node:setPos(0,__y);

		local __image = new(Image,__data[i].imagePath);
		__image:setAlign(kAlignCenter);
		__node:addChild(__image);

		__node:setEventTouch(self,__data[i].func); 
	
		self:findViewById(self.s_controls.Image_more_bg):addChild(__node);
		__y = __y + __intervalY;
	end

end

MoreTip.close = function(self)
	delete(self);
	self = nil;
end

--callback

MoreTip.onSweepClick = function(self , finger_action , x , y, drawing_id_first , drawing_id_current)
    if finger_action == kFingerDown then
	elseif finger_action == kFingerUp then
        UBReport.getInstance():report(UBConfig.kHallMoreSweep);
		kEffectPlayer:play(EffectsCommon.AudioButtonClick);
		self:close();
		if kLoginDataInterface:getIsLoginSuccess() then
			self:execDelegate(self.Delegate.scanningBtnClick)
			QRUtil.getInstance():scanQR()
		end
    end
end

MoreTip.onInvitationalClick = function(self , finger_action , x , y, drawing_id_first , drawing_id_current)
    if finger_action == kFingerDown then
	elseif finger_action == kFingerUp then
		kEffectPlayer:play(EffectsCommon.AudioButtonClick);
        self:close();
		UBReport.getInstance():report(UBConfig.kInvitationalAction1)
    	self:execDelegate(self.Delegate.onPushToOtherState, States.Invitational);
    end
end

MoreTip.onChangeClick = function(self , finger_action , x , y, drawing_id_first , drawing_id_current)
    if finger_action == kFingerDown then
	elseif finger_action == kFingerUp then
		kEffectPlayer:play(EffectsCommon.AudioButtonClick);
        UBReport.getInstance():report(UBConfig.kHallMoreExchange);
		self:close();
		self:execDelegate(self.Delegate.onPushToOtherState, States.DiamondShop);
    end
end

MoreTip.onTellFriendsClick = function(self , finger_action , x , y, drawing_id_first , drawing_id_current)
    if finger_action == kFingerDown then
	elseif finger_action == kFingerUp then
		kEffectPlayer:play(EffectsCommon.AudioButtonClick);
        UBReport.getInstance():report(UBConfig.kHallMoreTellFriends);
		self:close();
		self:__sendToWeChat(false);
    end
end

MoreTip.onFriendsCircleClick = function(self , finger_action , x , y, drawing_id_first , drawing_id_current)
    if finger_action == kFingerDown then
	elseif finger_action == kFingerUp then
		kEffectPlayer:play(EffectsCommon.AudioButtonClick);
        UBReport.getInstance():report(UBConfig.kHallMoreFriendsCircle);
		self:close();
		self:__sendToWeChat(true);
    end
end

MoreTip.__sendToWeChat = function (self, isSendToMoment)
    local wechatData = self:__getWeChatData(isSendToMoment);
    WeiXinIsolater.getInstance():weixinSendWebPage(wechatData.url, wechatData.title, wechatData.desc, wechatData.share_icon, isSendToMoment);
end

MoreTip.__getWeChatData = function (self, isSendToMoment)
    local weiChatInfo = WeiXinIsolater.getInstance():getWeiXinChatInfo();
    local data = {};
    if table.isTable(weiChatInfo) then
        data.url = isSendToMoment and weiChatInfo.space_url or weiChatInfo.friend_url;
        data.desc = weiChatInfo.desc or "";
        data.title = weiChatInfo.title or "";
        data.share_icon = weiChatInfo.share_icon or "";
    end
    return data;
end

MoreTip.onRootClick =function(self , finger_action , x , y, drawing_id_first , drawing_id_current) 
	if finger_action == kFingerDown then
		self:close();
	end
end

MoreTip.s_controlConfig = {
    [MoreTip.s_controls.Image_more_bg] = {"Image_more_bg"};
}

MoreTip.s_controlFuncMap = {
}


return MoreTip;
