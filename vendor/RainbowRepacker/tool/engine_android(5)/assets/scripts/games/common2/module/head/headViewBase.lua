require("games/common2/module/layerShowTypeData");
local headBaseLayout = require("view/kScreen_1280_800/games/common2/headBaseLayout");
require("games/common2/module/invite2/data/inviteConfig");

local viewBase = Import("games/common2/module/viewBase");

HeadViewBase = class(viewBase,false);

local _getNickMaxWidth;
local _getNickSubLen;

HeadViewBase.s_defaultBoyFile = UserBaseInfoIsolater.getInstance():getMaleHead();
HeadViewBase.s_defaultGirlFile = UserBaseInfoIsolater.getInstance():getFemaleHead();

HeadViewBase.Delegate = {
};

HeadViewBase.ctor = function ( self, seat, layoutConfig )
	super(self,layoutConfig);
	self.m_seat = seat;
	self.m_isAi = false;
	if self.m_root then
		local width, height = self.m_root:getSize();
		self:setSize(width,height);
		self.m_root:setVisible(false);
	end
	self:commonInitView();
end

HeadViewBase.dtor = function ( self )
	ImageCache.getInstance():cleanRef(self);
	delete(self.m_vipAnim);
	self.m_vipAnim = nil;
	if self.m_netTipsAnim then
		self.m_netTipsAnim:stop()
		self.m_netTipsAnim = nil
	end
end

HeadViewBase.commonInitView = function ( self )
	self.m_commonHeadView = SceneLoader.load(headBaseLayout);
	self:addChild(self.m_commonHeadView);
	self.m_commonHeadView:setAlign(kAlignCenter);
	self.m_commonHeadView:setSize(92,92);
	self.m_commonHeadView:setLevel(-1);

	self.m_headView 	= self.m_commonHeadView:getChildByName("headView");
	self.m_headRobot 	= self.m_headView:getChildByName("headRobot");
	self.m_headDefault 	= self.m_headView:getChildByName("defaultHead");
	self.m_headFrame 	= self.m_headView:getChildByName("headFrame");
	self.m_vipFrame 	= self.m_headView:getChildByName("vipFrame");
	self.m_bankruptView = self.m_headView:getChildByName("bankruptView");
	self.m_netTips = self.m_commonHeadView:getChildByName("net_tips");
	self.m_wifi = self.m_netTips:getChildByName("wifi");
	self.m_headFrame:setLevel(2);
	self.m_vipFrame:setLevel(2);
	self.m_bankruptView:setLevel(2);

	self.m_headEmpty 	= self.m_commonHeadView:getChildByName("headEmpty");
	self.m_inviteBtn 	= self.m_headEmpty:getChildByName("inviteBtn");

	self.m_nameArea 	= self.m_commonHeadView:getChildByName("name_area");
	self.m_nickText 	= self.m_nameArea:getChildByName("nick_text");

	self.m_moneyArea 	= self.m_commonHeadView:getChildByName("money_area");
	self.m_moneyIcon 	= self.m_moneyArea:getChildByName("money_icon");
	self.m_moneyView 	= self.m_moneyArea:getChildByName("money_view");

	self.m_scoreArea 	= self.m_commonHeadView:getChildByName("score_area");
	self.m_score 		= self.m_scoreArea:getChildByName("score");

	self.m_ownerView 	= self.m_commonHeadView:getChildByName("ownerView");

	local file = RoomPropertyData.getInstance():getCurPropertyIcon();
	self:resetMoneyIconFile(file);

	self.m_headFrame:setOnClick(self,self.onPlayerHeadClick);
	self.m_vipFrame:setOnClick(self,self.onPlayerHeadClick);
	self.m_inviteBtn:setOnClick(self,self.onInviteBtnClick);

	self:setInviteBtnStatus(PrivateRoomIsolater.getInstance():isInPrivateRoom());

	if GameInfoIsolater.getInstance():isInMatchRoom() then
		self.m_nameArea:setVisible(false);
		self.m_moneyArea:setVisible(false);
		self.m_scoreArea:setVisible(true);
	else
		self.m_nameArea:setVisible(true);
		self.m_moneyArea:setVisible(true);
		self.m_scoreArea:setVisible(false);
	end
	self.m_scoreColor = {255,255,255};
end

-----------------------------------private function------------------------------------------------------------------
_getNickMaxWidth = function(self,len)
	if not self.m_nickMaxWidth then
		local test = "宽";
		local nickText = new(Text, test, 1, 1, kAlignLeft, nil,26);
		self.m_nickMaxWidth = nickText:getSize();
		self.m_nickMaxWidth = self.m_nickMaxWidth*(len or 5);
		delete(nickText);
	end 
	return self.m_nickMaxWidth;
end

_getNickSubLen = function(self,userName,maxLen)
	self.m_nickMaxlen = maxLen or (self.m_nickMaxlen or 5);
	if string.isEmpty(userName) then
    	return self.m_nickMaxlen;
    end
    local maxWidth = _getNickMaxWidth(self,self.m_nickMaxlen);
    local len;
    for i = self.m_nickMaxlen,3,-1 do 
    	local nickName = string.subUtfStrByCn(userName,1,i,"");
    	local nickText = new(Text, nickName, 1, 1, kAlignLeft, nil,26);
    	local w = nickText:getSize();
    	delete(nickText);

    	if w <= maxWidth then 
    		len = i;
    		break;
    	end 
    end
    len = len or 2;
    return len;
end

-----------------------------------private function------------------------------------------------------------------


HeadViewBase.setInviteBtnStatus = function ( self, visible )
	if self.m_inviteBtn then
		local curShowType = LayerShowTypeData.getInstance():getCurShowType();
		if curShowType == LayerShowTypeData.getInstance():getOnlookerType() then 
			visible = false;
		end 
		self.m_inviteBtn:setVisible(visible);
	end
end

HeadViewBase.setBaseHeadPos = function ( self, x, y, align )
	if self.m_commonHeadView then
		self.m_commonHeadView:setPos(x, y);
		self.m_commonHeadView:setAlign(align);
	end
end

HeadViewBase._getNameArea = function(self)
	self.m_commonHeadView:removeChild(self.m_nameArea);
	return self.m_nameArea;
end

HeadViewBase._getScoreArea = function(self)
	self.m_commonHeadView:removeChild(self.m_scoreArea);
	return self.m_scoreArea;
end

HeadViewBase._refreshScoreAreaSize = function(self)
	local w = self.m_score:getSize();
	self.m_scoreArea:setSize(w,nil);
end

HeadViewBase._setScoreColor = function(self,r,g,b)
	self.m_scoreColor = {r,g,b};
end

HeadViewBase._getMoneyArea = function(self)
	self.m_commonHeadView:removeChild(self.m_moneyArea);
	return self.m_moneyArea;
end

HeadViewBase._setMoneyIconFile = function ( self, file )
	self:resetMoneyIconFile(file);
	self:resetMoneyIconSize();

	if self.m_userData then
		local money = self.m_userData:getMoney();
		self:setMoneyView(money);
	end
end

HeadViewBase.resetMoneyIconFile = function(self,file)
	if type(file) ~= "string" or file == "" then
		return;
	end

	self.m_moneyIcon:setFile(file);
end

HeadViewBase.resetMoneyIconSize = function(self)
	local res = self.m_moneyIcon.m_res;
	if res then
		local width = res:getWidth();
		local height = res:getHeight();
		self.m_moneyIcon:setSize(width,height);
	end
end

HeadViewBase.refreshNickName = function(self,userName)
	if not userName then return end
	local len = _getNickSubLen(self,userName);
	local nickName = string.subUtfStrByCn(userName,1,len,"");
	self.m_nickText:setText(nickName,nil,nil,self.m_nickText:getColor());
end

-- 设置昵称长度
HeadViewBase.setNickNameMaxLen = function(self,maxLen)
	if not maxLen then return end
	self.m_nickMaxlen = maxLen;
end

-- 根据身份信息设置昵称颜色
HeadViewBase.refreshNickColor = function(self,identity)
	if not identity then return end
	if not GameInfoIsolater.getInstance():isInMatchRoom() then
		local color = {255,255,255};
		self.m_nameArea:setVisible(true);
		if UserIdentityIsolater.getInstance():checkIsVip(identity) then
			color = {246,80,0};
			if self:isDuringDefenseCheatTime() then
				-- 防作弊时，昵称颜色默认黑色
				color = {255,255,255};
			end
		end
		self.m_nickText:setColor(unpack(color));
	end
end

HeadViewBase.refreshHeadIcon = function(self,url,sex)
	self.m_headView:setVisible(true);
	self.m_headEmpty:setVisible(false);
	
	local isFemale = UserBaseInfoIsolater.getInstance():checIsFemale(sex);
	local imagePath = isFemale and HeadViewBase.s_defaultGirlFile or HeadViewBase.s_defaultBoyFile;
	self:__setHeadDefault(imagePath);
	self.m_headDefault:setVisible(true);
	if self.m_headImage then
		self.m_headImage:setVisible(false);
	end
	if (not GameInfoIsolater.getInstance():isInMatchRoom()) then
		if url and (not self:isDuringDefenseCheatTime()) then
			-- 防作弊时，不显示自定义头像
			ImageCache.getInstance():request(url,self,self.onUpdateHeadImage);
		end
	end
end


HeadViewBase.setUserData = function ( self, userData )
	if not userData then
		return;
	end
	self.m_userData = userData;
	if self.m_root then
		self.m_root:setVisible(true);
	end

	self.m_uid = userData:getMid();
	self:refreshNickName(userData:getNick());
	self:refreshNickColor(userData:getIdentity());
	self:refreshHeadIcon(userData:getAvatar(),userData:getSex());
	self:refreshIdentity(userData);
	self:refreshProperty(userData);
	self:setUserAi(userData:isAi());
	self:refreshPos();
	if GameInfoIsolater.getInstance():isInMatchRoom() then
		self:refreshMatchScore(); 
	end 
end

HeadViewBase.__setHeadDefault = function (self, imagePath)
    if self.m_headDefaultImage then
	    self.m_headDefault:removeChild(self.m_headDefaultImage);
	end
	delete(self.m_headDefaultImage);
	self.m_headDefaultImage = nil;

	self.m_headDefaultImage = self:createHeadImage(imagePath);
	self.m_headDefault:addChild(self.m_headDefaultImage);
	self.m_headDefaultImage:setAlign(kAlignCenter);
    self.m_headDefaultImage:setSize(self.m_headDefault:getSize());
    self:updateHeadImagePath(imagePath);
end

HeadViewBase.refreshPos = function ( self )
	InteractionInfo.getInstance():setHeadAbsolutePos(self.m_seat,self:getHeadAbsolutePos());
	InteractionInfo.getInstance():setHeadPos(self.m_seat,self:getPos());
	InteractionInfo.getInstance():setHeadSize(self.m_seat,self.m_commonHeadView:getSize());
end

HeadViewBase.setUserAi = function ( self, isAi )
	-- body
	self.m_headRobot:setVisible(isAi);

	if self.m_isAi ~= isAi then
		if self.m_clickListener then
			self.m_clickListener.onAiStateChanged(self, self.m_seat, isAi);
		end
	end
	self.m_isAi = isAi;
	if isAi then
		if self.m_headImage then
			self.m_headImage:setVisible(false);
		end
		self.m_headDefault:setVisible(false);
	else
		if self.m_isHasImage then
			self.m_headDefault:setVisible(false);
			if self.m_headImage then
				self.m_headImage:setVisible(true);
			end
		else
			self.m_headDefault:setVisible(true);
			if self.m_headImage then
				self.m_headImage:setVisible(false);
			end
		end
	end
end

HeadViewBase.isAiState = function ( self )
	-- body
	return self.m_isAi;
end

HeadViewBase.setUserReady = function ( self, isReady )
	-- body
	if self.m_isReady ~= isReady then
		if self.m_clickListener then
			self.m_clickListener.onReadyStateChanged(self, self.m_seat, isReady);
		end
	end
	self.m_isReady = isReady;
end

HeadViewBase.reset = function ( self )
	self:setUserReady(false);
	self:setUserAi(false);
end

-- 清人
HeadViewBase.clear = function ( self )
	self.m_headEmpty:setVisible(true);
	self.m_headView:setVisible(false);

	self.m_moneyArea:setVisible(false);
	self.m_nameArea:setVisible(false);
	self.m_headRobot:setVisible(false);

	if self.m_root then
		self.m_root:setVisible(false);
	end

	self.m_userData = nil;
	self.m_isHasImage = nil;
	self.m_isAi = false;
	self:stopBankruptAnim();
end

HeadViewBase.refreshIdentity = function ( self, userData )
	-- body
	if not userData then
		return;
	end
	local identity = userData:getIdentity();
	local isVip = UserIdentityIsolater.getInstance():checkIsVip(identity);
	if isVip and not self:isDuringDefenseCheatTime() then
		-- 添加vip动画
		delete(self.m_vipAnim);
		self.m_vipAnim = nil;

		self.m_vipFrame:setVisible(true);
		self.m_headFrame:setVisible(false);

		self.m_vipAnim = new(AnimHeadVipAnim2);
        self.m_vipAnim:init();
        self.m_vipAnim:play(self.m_vipFrame);
	else
		self.m_vipFrame:setVisible(false);
		self.m_headFrame:setVisible(true);
	end
end

HeadViewBase.refreshProperty = function ( self, userData )
	-- body
	if not userData then
		return;
	end
	local money = userData:getMoney();
	self:setMoneyView(money);

	if self:isDuringDefenseCheatTime() then
		self.m_moneyArea:setVisible(false);
	elseif GameInfoIsolater.getInstance():isInMatchRoom() then
		self.m_moneyArea:setVisible(false);
	else
		self.m_moneyArea:setVisible(true);
	end

	local file = RoomPropertyData.getInstance():getCurPropertyIcon();
	self:resetMoneyIconFile(file);
end

HeadViewBase.getHeadAbsolutePos = function ( self )
	-- body
	local x, y = self.m_commonHeadView:getAbsolutePos();
	return x, y;
end

HeadViewBase.setMoneyView = function ( self, money )
	self.m_moneyView:removeAllChildren(true);
	local number_path = "games/common/head/head_base/money_num/money_%s.png"
	local moneyStr = MoneyTools.skipMoney(money);
	local moneyNode = MoneyTools.getNumberNode(number_path,moneyStr,-2);
	local moneyNode_w,moneyNode_h = moneyNode:getSize();

	self.m_moneyView:addChild(moneyNode);
	moneyNode:setAlign(kAlignCenter);
	self.m_moneyView:setSize(moneyNode_w,moneyNode_h);

	local icon_w,icon_h = self.m_moneyIcon:getSize();
	self.m_moneyArea:setSize(moneyNode_w+icon_w+4,30);
end

HeadViewBase.updateScore = function ( self, score )
	self.m_score:setText(score,nil,nil,unpack(self.m_scoreColor));
	local w = self.m_score:getSize();
	self.m_scoreArea:setSize(w,nil);
end

HeadViewBase.onUpdateHeadImage = function ( self, url, imagePath )
	-- body
	Log.v("HeadViewBase.onUpdateHeadImage",imagePath);
	if imagePath then
		self:updateHeadImagePath(imagePath);
		self.m_isHasImage = true;
		self.m_headDefault:setVisible(false);

		if self.m_headImage then
			self.m_headView:removeChild(self.m_headImage);
		end
		delete(self.m_headImage);
		self.m_headImage = nil;

		self.m_headImage = self:createHeadImage(imagePath);
		self.m_headView:addChild(self.m_headImage);
		self.m_headImage:setLevel(1);
		self.m_headImage:setAlign(kAlignCenter);
        self.m_headImage:setSize(self.m_headDefault:getSize());
	else
		self.m_isHasImage = nil;
	end
end

HeadViewBase.createHeadImage = function ( self, imagePath )
	-- body
	local headImage = new(Mask,imagePath,"games/common/head/head_base/ddz_head_mask.png");
	return headImage;
end

HeadViewBase.updateHeadImagePath = function ( self,imagePath )
	self.m_headImagePath = imagePath;
	InteractionInfo.getInstance():setHeadImagePath(self.m_seat,imagePath);
end

HeadViewBase.getHeadAreaSize = function ( self )
	-- body
	return self.m_commonHeadView:getSize();
end

HeadViewBase.isDuringDefenseCheatTime = function (self)
	return GameInfoIsolater.getInstance():checkIsDuringDefenseCheatTime() and self.m_seat ~= 1;
end

HeadViewBase.onPlayerHeadClick = function ( self )
	ReportIsolater.getInstance():report(UBConfig.kGameDesktopPlayerInfo, true, true)
	if GameInfoIsolater.getInstance():isInMatchRoom() then 
		local isShowPlayerInfo = false;
		local myUserId = UserBaseInfoIsolater.getInstance():getUserId();
		local curShowType = LayerShowTypeData.getInstance():getCurShowType();
		local onlookerType = LayerShowTypeData.getInstance():getOnlookerType();

		if self.m_uid ~= myUserId and curShowType ~= onlookerType 
			and MatchIsolater.getInstance():getCurMatchIsSupportReport() then 
			isShowPlayerInfo = true;
		end 

		if not isShowPlayerInfo then 
			Toast.getInstance():showText("比赛场无法查看选手信息",50,30,kAlignLeft,"",24,200,175,110);
			return;
		end 
	end
    local data = {seat = self.m_seat}
    local action = GameMechineConfig.ACTION_NS_HEADCLICK;
    MechineManage.getInstance():receiveAction(action,data,self.m_uid);
end

HeadViewBase.onInviteBtnClick = function ( self )
	local action = GameMechineConfig.ACTION_NS_REQUESTINVITELIST;
	local inviteType = InviteConfig.TYPE_PRIVATE_ROOM;
    MechineManage.getInstance():receiveAction(action, inviteType);
end


HeadViewBase.joinGame = function ( self, seat, uid, info, isFast )
	self:onUpdateUserInfo(seat, uid, info, isFast);
	self:refreshInviteBtnStatus();
end

HeadViewBase.onUpdateUserInfo = function ( self, seat, uid, info, isFast )
	local gameplayerInfo = GamePlayerManager2.getInstance():getPlayerBySeat(seat);
	if gameplayerInfo then
		self.m_seat = seat;
		self.m_uid = uid;
		self:setUserData(gameplayerInfo);
		-- self:setUserReady(false);
	end
end

HeadViewBase.gameReady = function ( self, seat, uid, info, isFast )
	self:setUserReady(true);
	self:stopBankruptAnim();
end

HeadViewBase.startGame = function ( self )
	self:setUserReady(false);
	self:stopBankruptAnim();
end

HeadViewBase.onLogout = function ( self, seat, uid, info, isFast )
	self:setUserReady(false);
end

HeadViewBase.onGameOver = function ( self, seat, uid, info, isFast )
	self:onUpdateUserInfo(seat, uid, info, isFast);
	self:reset();
end

HeadViewBase.onAi = function ( self, seat, uid, info, isFast )
	-- body
	if not info then 
		return;
	end
	self:setUserAi(info.isAi == 1);
end

HeadViewBase.refreshMatchScore = function(self,seat,uid,info,isFast)
	local info = MatchIsolater.getInstance():getMatchScoreInfo();
	info = table.verify(info);
	for k,v in pairs(info) do 
		if v.mid == self.m_uid then 
			self:updateScore(v.score);
		end 
	end 
end

HeadViewBase.refreshInviteBtnStatus = function (self)
	self:setInviteBtnStatus(PrivateRoomIsolater.getInstance():isInPrivateRoom());
end

HeadViewBase.parseConfig = function ( self, config )
	-- body
	if not config then return; end
	local headPos = config.headPos and config.headPos[self.m_seat] or nil;
	if headPos then 
		self:setPos(headPos.x, headPos.y);
		self:setAlign(headPos.align);
	end

	local ownerPos = config.ownerPos and config.ownerPos[self.m_seat] or nil;
	if ownerPos and self.m_ownerView then
		self.m_ownerView:setPos(ownerPos.x, ownerPos.y);
		self.m_ownerView:setAlign(ownerPos.align);
	end
end

HeadViewBase.showBankruptAnim = function(self,seat)
	if GameInfoIsolater.getInstance():isInMatchRoom() then
		return;
	end

	local playerInfo = GamePlayerManager2.getInstance():getPlayerBySeat(seat);
	if playerInfo then
		if RoomPropertyData.getInstance():checkIsBankrupt(playerInfo:getMoney()) then
			self:stopBankruptAnim();
			require("games/common2/animation/animBankrupt");
			self.m_bankruptAnim = new(AnimBankrupt);
			self.m_bankruptAnim:play();
			self.m_bankruptView:addChild(self.m_bankruptAnim);
			self.m_bankruptAnim:setAlign(kAlignCenter)
		end
	end
end

HeadViewBase.stopBankruptAnim = function(self)
	if self.m_bankruptAnim then
		delete(self.m_bankruptAnim);
		self.m_bankruptAnim = nil;
		self.m_bankruptView:removeAllChildren(true);
	end
end

HeadViewBase.refreshUserProperty = function ( self, seat, uid, info, isFast )
	local gameplayerInfo = GamePlayerManager2.getInstance():getPlayerBySeat(seat);
	self:refreshProperty(gameplayerInfo);
end

HeadViewBase.refreshWifi = function (self, seat, uid, info, isFast)
	if self.m_netTips and self.m_wifi then
		self.m_netTips:setVisible(info)
		if info then
			if not self.m_netTipsAnim then
				local am = require 'animation'
				self.m_netTipsAnim = am.Animator(am.flash(), am.updator(self.m_wifi:getWidget()),kAnimLoop)
			end
			self.m_netTipsAnim:start()
		else
			if self.m_netTipsAnim then
				self.m_netTipsAnim:stop()
				self.m_netTipsAnim = nil
			end
		end
	end 
end

HeadViewBase.refreshReadyStatus = function(self,seat,uid,info,isFast)
	info = table.verify(info);
	self:setUserReady(info.isShow);
end

HeadViewBase.resetHeadEmptyPos = function(self,x,y)
	self.m_headEmpty:setPos((x or 0), (y or 0));
end

HeadViewBase.setUserOwner = function(self, isOwner)
	if self.m_ownerView then
		local isInJiFenRoom = PrivateRoomIsolater.getInstance():isInJiFenRoom();
		self.m_ownerView:setVisible(isInJiFenRoom and isOwner)
	end
end

HeadViewBase.s_stateFuncMap = {
	[GameMechineConfig.STATUS_LOGIN]							= "joinGame";
	[GameMechineConfig.STATUS_READY]							= "gameReady";
	[GameMechineConfig.STATUS_PLAYING]							= "startGame";
	[GameMechineConfig.STATUS_LOGOUT]							= "onLogout";
	[GameMechineConfig.STATUS_GAMEOVER]							= "onGameOver";
};

HeadViewBase.s_actionFuncMap = {
	[GameMechineConfig.ACTION_NS_ROBOT]          				= "onAi";
	[GameMechineConfig.ACTION_NS_MATCH_SCORE] 					= "refreshMatchScore";
	[GameMechineConfig.ACTION_NS_UPDATE_USERINFO]				= "onUpdateUserInfo";
	[GameMechineConfig.ACTION_NS_REFRESH_USERPROPERTY]			= "refreshUserProperty";
	[GameMechineConfig.ACTION_NS_REFRESH_WIFI]					= "refreshWifi";
	[GameMechineConfig.ACTION_NS_REFRESH_READY_STATUS]			= "refreshReadyStatus";
}

return HeadViewBase;