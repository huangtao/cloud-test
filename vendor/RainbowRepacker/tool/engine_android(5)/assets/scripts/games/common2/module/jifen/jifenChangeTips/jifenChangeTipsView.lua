local viewBase = Import("games/common2/module/viewBase");

local JiFenChangeTipsView = class(viewBase,false);

JiFenChangeTipsView.s_controls = {
	closeBtn = ToolKit.getIndex();
	refuseBtn = ToolKit.getIndex();
	agreeBtn = ToolKit.getIndex();
	userHead = ToolKit.getIndex();
	userName = ToolKit.getIndex();
	userNameSuffix = ToolKit.getIndex();
	shadeBg = ToolKit.getIndex();
};

JiFenChangeTipsView.ctor = function(self,seat,layoutConfig)
	super(self,layoutConfig);
	self.m_ctrls = JiFenChangeTipsView.s_controls;
	self:setFillParent(true,true);

	self.m_changeSeatApplyList = {};

	self:setVisible(false);
end

JiFenChangeTipsView.dtor = function(self)
	ImageCache.getInstance():cleanRef(self);
	self.m_changeSeatApplyList = {};
end

JiFenChangeTipsView.parseConfig = function(self,config)
	config = table.verify(config);
end

------------------------------------------------------------------
JiFenChangeTipsView.onCloseBtnClick = function(self)
	ReportIsolater.getInstance():report(UBConfig.kPrivateJiFenCloseChangeSeat, true, true);
	self:hide();

	self:showNextApply();
end

JiFenChangeTipsView.onRefuseBtnClick = function(self)
	ReportIsolater.getInstance():report(UBConfig.kPrivateJiFenRefuseChangeSeat, true, true);
	self:_handleReplyChangeSeat(false);
	self:hide();

	self:showNextApply();
end

JiFenChangeTipsView.onAgreeBtnClick = function(self)
	ReportIsolater.getInstance():report(UBConfig.kPrivateJiFenAgreeChangeSeat, true, true);
	self:_handleReplyChangeSeat(true);

	self:atuoRefuseApply(self.m_info.sUid);

	self:hide();	
end

JiFenChangeTipsView._handleReplyChangeSeat = function(self,isAgree,info)
	info = info or Copy(self.m_info);
	info = table.verify(info);
	info.replyType = isAgree and 1 or 0;

	SocketIsolater.getInstance():sendMsg(CLIENT_REPLY_JIFEN_ROOM_CHANGE_SEAT,info);
end

JiFenChangeTipsView.onEmpty = function(self)
end
------------------------------------------------------------------
JiFenChangeTipsView.onReceiveJiFenChangeSeatApply = function(self,seat, uid, info, isFast)
	self.m_changeSeatApplyList = table.verify(self.m_changeSeatApplyList);

	table.insert(self.m_changeSeatApplyList,info);

	if not self:getVisible() then 
		self:showNextApply();
	end 
end

JiFenChangeTipsView.atuoRefuseApply = function(self,lastAgreeId)
	local applyList = Copy(self.m_changeSeatApplyList);
	self.m_changeSeatApplyList = {};

	for _,v in pairs(applyList) do 
		if lastAgreeId and lastAgreeId == v.sUid then --同一个玩家发的多条请求，第一条同意后后面的就自动忽略
		else--不同玩家向玩家发的多条请求，第一条同意后后面的就自动拒绝 
			self:_handleReplyChangeSeat(false,v);
		end 
	end 
end

JiFenChangeTipsView.showNextApply = function(self)
	self.m_changeSeatApplyList = table.verify(self.m_changeSeatApplyList);

	if #self.m_changeSeatApplyList > 0 then 
		local info = table.remove(self.m_changeSeatApplyList,1);
		self:showChangeTips(info);
	end 
end

JiFenChangeTipsView.showChangeTips = function(self,info)
	info = table.verify(info);

	local player = GamePlayerManager2.getInstance():getPlayerByMid(info.sUid);
	if player and info.tUid == UserBaseInfoIsolater.getInstance():getUserId() then 
		local sex = player:getSex();
		local avater = player:getAvatar();
		local userNick = player:getNick();

		self.m_headImageBg = self:findViewById(self.m_ctrls.userHead);
		local userName = self:findViewById(self.m_ctrls.userName);
		local userNameSuffix = self:findViewById(self.m_ctrls.userNameSuffix);

		local file = UserBaseInfoIsolater.getInstance():getHeadBySex(sex,true);
		self:__setHeadImage(file);

		if avater and avater ~= "" then
			ImageCache.getInstance():request(avater,self,self.onUpdateHeadImage);
		end

		userName:setText(userNick,10);
		local w = userName:getSize();
		local x = userName:getPos();
		userNameSuffix:setPos(w+x,nil);

		self.m_info = info;

		DialogLogic.getInstance():pushDialogStack(self,self.onCloseBtnClick);

		self:show();
	else 
		self:showNextApply();
	end 
end

JiFenChangeTipsView.__setHeadImage = function (self, image)
    if self.m_headImage then
		self.m_headImageBg:removeChild(self.m_headImage);
	end
	delete(self.m_headImage);
	self.m_headImage = new(Mask, image, "hall/common/mask_head_156.png");
	self.m_headImageBg:addChild(self.m_headImage);
	self.m_headImage:setAlign(kAlignCenter);
end

JiFenChangeTipsView.onUpdateHeadImage = function ( self, url, imagePath )
	Log.v("JiFenChangeTipsView.onUpdateHeadImage",imagePath);
	if imagePath then
		self:__setHeadImage(imagePath);
	end
end

JiFenChangeTipsView.hide = function(self)
	ImageCache.getInstance():cleanRef(self);
	self.m_info = nil;
	DialogLogic.getInstance():popDialogStack();
	self:setVisible(false);
end
------------------------------------------------------------------
JiFenChangeTipsView.s_controlConfig = 
{	
	[JiFenChangeTipsView.s_controls.closeBtn]			= {"centerView","closeBtn"};
	[JiFenChangeTipsView.s_controls.refuseBtn]			= {"centerView","btnsView","refuseBtn"};
	[JiFenChangeTipsView.s_controls.agreeBtn]			= {"centerView","btnsView","agreeBtn"};

	[JiFenChangeTipsView.s_controls.userHead]			= {"centerView","infoTipsView","userHead"};
	[JiFenChangeTipsView.s_controls.userName]			= {"centerView","infoTipsView","tipsView","userName"};
	[JiFenChangeTipsView.s_controls.userNameSuffix]		= {"centerView","infoTipsView","tipsView","userNameSuffix"};
	[JiFenChangeTipsView.s_controls.shadeBg] 			= {"shadeBg"};
};

JiFenChangeTipsView.s_controlFuncMap =
{
	[JiFenChangeTipsView.s_controls.closeBtn]			 	= JiFenChangeTipsView.onCloseBtnClick;
	[JiFenChangeTipsView.s_controls.refuseBtn]			 	= JiFenChangeTipsView.onRefuseBtnClick;
	[JiFenChangeTipsView.s_controls.agreeBtn]			 	= JiFenChangeTipsView.onAgreeBtnClick;
	[JiFenChangeTipsView.s_controls.shadeBg] 				= JiFenChangeTipsView.onEmpty;
};


JiFenChangeTipsView.s_actionFuncMap = {
	[GameMechineConfig.ACTION_NS_JIFEN_CHANGE_SEATE_NOTIFY]		= "onReceiveJiFenChangeSeatApply";	
};

return JiFenChangeTipsView;