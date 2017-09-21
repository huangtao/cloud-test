local room_player_info_layout = require("view/kScreen_1280_800/games/common2/room_player_info_layout");
local room_player_info_prop = require("view/kScreen_1280_800/games/common2/room_player_info_prop");

--[[
	游戏中的用户信息卡
]]

local ViewBase = require("games/common2/module/viewBase");

local PlayerInfoView = class(ViewBase,false);

PlayerInfoView.s_controls = 
{
	bg_touchView  			= ToolKit.getIndex();        
	bg  					= ToolKit.getIndex();        
	m_head  				= ToolKit.getIndex();        
	m_gender  				= ToolKit.getIndex();        
	m_totalMoney  			= ToolKit.getIndex();        
	m_levelBg  				= ToolKit.getIndex();        
	m_levelValue  			= ToolKit.getIndex();        
	m_level_name  			= ToolKit.getIndex();        
	m_zhanJi  				= ToolKit.getIndex();        
	m_shenglv  				= ToolKit.getIndex();       
	m_id  					= ToolKit.getIndex();        
	m_name  				= ToolKit.getIndex();        
	m_diamond  				= ToolKit.getIndex();        
	m_btnFriend  			= ToolKit.getIndex();    
	m_addFriendImg			= ToolKit.getIndex();    
	m_txtFriend  			= ToolKit.getIndex();        
	m_btnKick   			= ToolKit.getIndex();        
	m_txtKick   			= ToolKit.getIndex();        
	m_vipImg   				= ToolKit.getIndex();        
	dividerLine   			= ToolKit.getIndex();        
	m_city   				= ToolKit.getIndex();         
	infoBtn   				= ToolKit.getIndex();        
	achievementBtn   		= ToolKit.getIndex();        
	tabInfoSelImg   		= ToolKit.getIndex();        
	tabAchievementSelImg   	= ToolKit.getIndex();        
	infoView   				= ToolKit.getIndex();        
	achievementView   		= ToolKit.getIndex();        
	propsView   			= ToolKit.getIndex();        
	propsTxt   				= ToolKit.getIndex();        
--------------------------------后续添加的 都需要判断这个控件是否能获取到 ，因为有的游戏传了一个错误的配置进来------
	m_crystal 				= ToolKit.getIndex();
	m_btnReport 			= ToolKit.getIndex();
	cheatTips 				= ToolKit.getIndex();
	moneyIcon 				= ToolKit.getIndex();
	diamondIcon				= ToolKit.getIndex();
	crystalIcon 			= ToolKit.getIndex();
	moneyName				= ToolKit.getIndex();
};

---------------------------------------------------------------------
----------------- 构造函数 -------------------------------------
---------------------------------------------------------------------
PlayerInfoView.ctor = function(self,seat,viewConfig)	
	viewConfig = viewConfig or room_player_info_layout;
	super(self,viewConfig);
	self.m_ctrls = PlayerInfoView.s_controls;
    PlayerInfoView.setFillParent(self, true, true);
    self:setVisible(false);

	self:initViews();
	CommunityIsolater.getInstance():setObserver(self);
	PlayerInfoLogic.getInstance():setObserver(self);
	self.m_seat = seat;
end

PlayerInfoView.parseConfig = function(self,config)
	config = table.verify(config);
	self.m_isNeedDrawTimes = config.isNeedDrawTimes; 
end

---------------------------------------------------------------------
----------------- Button event response functions -------------------
---------------------------------------------------------------------
PlayerInfoView.hidden = function(self)	
	if self:getVisible() then 	
		self:setVisible(false);
		ImageCache.getInstance():cleanRef(self);
		DialogLogic.getInstance():popDialog();
	end 
end

PlayerInfoView.show = function(self , x , y, user , isNeedDrawTimes)
	Log.v("PlayerInfoView.show:",user);
	if not user then 
		return;
	end

	DialogLogic.getInstance():pushDialogStack(self,self.hidden);
	self:setVisible(true);
	self.m_contentBg:setPos(x,y);
	
	isNeedDrawTimes = isNeedDrawTimes ~= nil and isNeedDrawTimes or self.m_isNeedDrawTimes;

	self.m_player = {};
	self.m_player.m_sex = user:getSex();
	self.m_player.m_avatar_m = user:getAvatar();
	self.m_player.m_money = user:getMoney();
	self.m_player.m_wintimes = user:getWinCount();
	self.m_player.m_losetimes = user:getLoseCount();
	self.m_player.m_deuceCount = isNeedDrawTimes and user:getDrawCount() or 0;
	self.m_player.m_id = user:getMid();
	self.m_player.m_cid = user:getCid();
	self.m_player.m_mnick = user:getNick();
	self.m_player.m_exp = user:getExp();
	self.m_player.m_diamond = user:getDiamond();
	self.m_player.m_crystal = user:getCrystal();
	self.m_player.m_identity = user:getIdentity();
	self.m_player.m_city = user:getCity();
	
	self:setUserHead();
	self:setUserId();
	self:setUserSex();
	self:setUserName();
	self:setUserProperty();
	self:setUserLevel();
	self:setUserZhanji(isNeedDrawTimes);
	self:setUserPropsTips();
	self:setUserIdentity();
	self:setUserRelationship();
	self:setUserCity();
	self:_changeTab(self.m_infoBtn.m_drawingID);
end

PlayerInfoView.setUserId = function(self)
	local playerId = number.valueOf(self.m_player.m_cid);
	--应上级要求，修改机器人id为指定id
	if playerId >= 9000000 and playerId < 10000000 then
		playerId = GamePlayerManager2.getInstance():getRobotId(playerId);
	end
	self.playerId = playerId;
	self:findViewById(self.m_ctrls.m_id):setText("ID  " .. self.playerId);
end

PlayerInfoView.setUserSex = function(self)
	local genderImageFile = UserBaseInfoIsolater.getInstance():getSexIconBySex(self.m_player.m_sex);
	self:findViewById(self.m_ctrls.m_gender):setFile(genderImageFile);
end

PlayerInfoView.setUserName = function(self)
	local niciName=string.subUtfStrByCn(self.m_player.m_mnick, 1, 5, "")
	self:findViewById(self.m_ctrls.m_name):setText(niciName);
end

PlayerInfoView.setUserProperty = function(self)
	local moneyValue = self:findViewById(self.m_ctrls.m_totalMoney);
	local diamondValue = self:findViewById(self.m_ctrls.m_diamond);
	local moneyIcon = self:findViewById(self.m_ctrls.moneyIcon);
	local moneyName = self:findViewById(self.m_ctrls.moneyName);

	moneyValue:setText(ToolKit.skipMoneyEx2(self.m_player.m_money));
	diamondValue:setText(self.m_player.m_diamond or 0);
	self:__safeInitViews();
	
	if moneyName then 
		local propertyName = RoomPropertyData.getInstance():getCurPropertyName();
		moneyName:setText(string.format("%s：",propertyName or "资产"));
	end 
	if moneyIcon then 
		local file = RoomPropertyData.getInstance():getCurPropertyIcon();
		moneyIcon:setFile(file);
		moneyIcon:setSize(moneyIcon.m_res.m_width,moneyIcon.m_res.m_height);
	end 
end

--保护性的获取控件，为了埋游戏的坑（防止游戏重新传了一个配置文件进来导致获取id crash）
PlayerInfoView.__safeInitViews = function(self)
	local crystal = self:findViewById(self.m_ctrls.m_crystal);
	if crystal then
            crystal:setText(self.m_player.m_crystal or 0);
        end
    
    local crystalLabel = self.m_infoView:getChildByName("crystalLabel");
    if crystalLabel then

        crystalLabel:setText("金条：");
	end
    local crystalIcon = self.m_infoView:getChildByName("crystalIcon");
    if crystalIcon then
            crystalIcon:setFile("isolater/crystal.png");
        end
	end

PlayerInfoView.setUserLevel = function(self)
	local level, levelName = UserExpInfoIsolater.getInstance():countLevelByExp(self.m_player.m_exp);
	self:findViewById(self.m_ctrls.m_level_name):setText("LV " .. number.valueOf(level));
	local percent = UserExpInfoIsolater.getInstance():countLevelPercent(self.m_player.m_exp);
	
	local tw,th = self:findViewById(self.m_ctrls.m_levelBg):getSize();
    self:findViewById(self.m_ctrls.m_levelValue):setClip(0,0,tw*(number.valueOf(percent,1)),th);
end

PlayerInfoView.setUserZhanji = function(self,isNeedDrawTimes)
	if PrivateRoomIsolater.getInstance():isInPrivateRoom() then
    	self:findViewById(self.m_ctrls.m_zhanJi):setText(isNeedDrawTimes and "0胜/0负/0平" or "0胜/0负");
    	self:findViewById(self.m_ctrls.m_shenglv):setText("0%");
    else
    	local zhanji = "";
    	local totalCount = 0;
    	if isNeedDrawTimes then 
    		zhanji = string.format("%s胜/%s负/%s平",self.m_player.m_wintimes,self.m_player.m_losetimes,self.m_player.m_deuceCount);
    		totalCount = self.m_player.m_wintimes + self.m_player.m_losetimes + self.m_player.m_deuceCount;
    	else 
    		zhanji = string.format("%s胜/%s负",self.m_player.m_wintimes,self.m_player.m_losetimes);
    		totalCount = self.m_player.m_wintimes + self.m_player.m_losetimes;
    	end
    	local winPercent = ""; 
    	if totalCount == 0 then 
    		winPercent = "0%";
    	else 
    		winPercent = math.ceil(100*self.m_player.m_wintimes/totalCount) .. "%";
    	end 
		self:findViewById(self.m_ctrls.m_zhanJi):setText(zhanji);
		self:findViewById(self.m_ctrls.m_shenglv):setText(winPercent);
	end
end

PlayerInfoView.setUserPropsTips = function(self)
	local myMid = UserBaseInfoIsolater.getInstance():getUserId();
	if self.m_player.m_id == myMid then
		self.m_btnFriend:setVisible(false);
		self.m_propsTxt:setText("物品箱:");
		self.m_btnKick:setVisible(false);
		self:__setReportBtnShow(false);
	else
		self.m_propsTxt:setText("对ta使用:");
		self.m_btnFriend:setVisible(true);
		self.m_btnKick:setVisible(true);
		self:__setReportBtnShow(true);

		if PrivateRoomIsolater.getInstance():isInJiFenRoom() then 
			local isMaster;
			local player = GamePlayerManager2.getInstance():getPlayerByMid(myMid);
			if player then 
				isMaster = player:getInfoByType("isMaster");
			end 
			self.m_btnKick:setVisible(isMaster);
		elseif GameInfoIsolater.getInstance():isInMatchRoom() then 
			self.m_btnKick:setVisible(false);
		end 
	end
end

PlayerInfoView.setUserIdentity = function(self)
	if UserIdentityIsolater.getInstance():checkIsVip(self.m_player.m_identity) then 
		self.m_vipImg:setVisible(true);
	else
		self.m_vipImg:setVisible(false);
	end

	if PrivateRoomIsolater.getInstance():isInJiFenRoom() then 
		self.m_txtKick:setText("踢走");
	else 
		if UserIdentityIsolater.getInstance():getIsVip() then
			self.m_txtKick:setText("请TA离开");
		else
			local kickPropNum = PropIsolater.getInstance():getPropNumByPropType(PropIsolater.propTypeMap.TYPE_VIP_KICK);
			local str = tostring((kickPropNum > 99) and "99+" or kickPropNum);
			self.m_txtKick:setText("踢走("..str..")");
		end
	end 
end

PlayerInfoView.setUserRelationship = function(self)
	if CommunityIsolater.getInstance():checkIsFriend(self.m_player.m_cid) then
	    self.m_btnFriend:setEnable(false);
	    self.m_addFriendImg:setVisible(false);
	    self.m_txtFriend:setText("已是好友");
	    self.m_txtFriend:setVisible(true);
	else
		self.m_btnFriend:setEnable(true);
		self.m_addFriendImg:setVisible(true);
		self.m_txtFriend:setText("");
		self.m_txtFriend:setVisible(false);
	end
end

PlayerInfoView.setUserCity = function(self)
	local city = self.m_player.m_city or RegionConfigIsolater.getInstance():getRegionDefaultCity();
    if city == "" then 
        city = RegionConfigIsolater.getInstance():getRegionDefaultCity();
    end
	self:findViewById(self.m_ctrls.m_city):setText(city);
end

PlayerInfoView.__setReportBtnShow = function(self, isShow)
	if self.m_btnReport then
		self.m_btnReport:setVisible(isShow);
	end
end

PlayerInfoView.checkIsDuringDefenseCheatTime = function(self, isSelectInfoTab)
	local cheatText = self:findViewById(self.m_ctrls.cheatTips);
	local isOpen;
	if GameInfoIsolater.getInstance():isInMatchRoom() then 
		isOpen = true;
	else 
		isOpen = GameInfoIsolater.getInstance():checkIsDuringDefenseCheatTime();
		isOpen = isOpen and number.valueOf(self.m_player.m_id) ~= UserBaseInfoIsolater.getInstance():getUserId();
	end 

	self:findViewById(self.m_ctrls.m_id):setVisible(not isOpen);

	if not isSelectInfoTab then
		self.m_infoView:setVisible(false);
		if cheatText then
			cheatText:setVisible(false);
		end
	else
		self.m_infoView:setVisible(not isOpen);
		if cheatText then
			cheatText:setVisible(isOpen);
			cheatText:setText("为保障牌局公正性,\n目前已开启防作弊");
		end
	end
end

PlayerInfoView.initViews = function (self)
	self.m_touchView = self:findViewById(self.s_controls.bg_touchView);
	self.m_touchView:setEventTouch(self, self.hidden);
	self.m_touchView:setEventDrag(self, function() end);

	self.m_btnFriend = self:findViewById(self.s_controls.m_btnFriend);
	self.m_addFriendImg = self:findViewById(self.s_controls.m_addFriendImg);
    self.m_txtFriend = self:findViewById(self.s_controls.m_txtFriend);
	self.m_btnReport = self:findViewById(self.s_controls.m_btnReport);

    self.m_btnKick = self:findViewById(self.s_controls.m_btnKick);
    self.m_txtKick = self:findViewById(self.s_controls.m_txtKick);
    self.m_vipImg = self:findViewById(self.s_controls.m_vipImg);


	self.m_contentBg = self:findViewById(self.m_ctrls.bg);
	self.m_dividerLine = self:findViewById(self.m_ctrls.dividerLine);

	self.m_tabInfoSelImg = self:findViewById(self.m_ctrls.tabInfoSelImg);
	self.m_tabAchievementSelImg = self:findViewById(self.m_ctrls.tabAchievementSelImg);
	self.m_infoView = self:findViewById(self.m_ctrls.infoView);
	self.m_achievementView = self:findViewById(self.m_ctrls.achievementView);
	self.m_propsView = self:findViewById(self.m_ctrls.propsView);
	self.m_infoBtn = self:findViewById(self.m_ctrls.infoBtn);
	self.m_achievementBtn = self:findViewById(self.m_ctrls.achievementBtn);
	self.m_propsTxt = self:findViewById(self.s_controls.propsTxt);					-- 道具文本
    self.m_headImageBg = self:findViewById(self.s_controls.m_head);
	if System.getPlatform() == kPlatformIOS then
		self.m_achievementBtn:setVisible(false);
	end

	if GameInfoIsolater.getInstance():isInMatchRoom() then
		self:resetMatchInfoView();
	end 
end

PlayerInfoView.resetMatchInfoView = function(self,w,h)
	if GameInfoIsolater.getInstance():isInMatchRoom() then
		local cheatText = self:findViewById(self.m_ctrls.cheatTips);	
		self.m_infoView:setVisible(false);
		if cheatText then
			cheatText:setVisible(true);
			cheatText:setText("为保障牌局公正性,\n目前已开启防作弊");
		end 
		
		self.m_infoBtn:setVisible(false);
		self.m_achievementBtn:setVisible(false);

		w = tonumber(w) or 560;
		h = tonumber(h) or 350;
		local w_1,h_1 = self:getRealWidthHeight();
		local bg = self:findViewById(self.m_ctrls.bg);
		bg:addPropScaleSolid(0,w/w_1,h/h_1,kNotCenter);
		InteractionInfo.getInstance():setPlayerInfoSize(w,h);
	end 
end

PlayerInfoView.setUserHead = function(self)
	local defaultHeadFile = UserBaseInfoIsolater.getInstance():getHeadBySex(tonumber(self.m_player.m_sex),true); 
	
	self:__setHeadImage(defaultHeadFile);

	if not GameInfoIsolater.getInstance():isInMatchRoom() then 
		ImageCache.getInstance():request(self.m_player.m_avatar_m, self, self.onImageDownload);
	end 
end

PlayerInfoView.getRealWidthHeight = function(self)
	return self:findViewById(self.m_ctrls.bg):getSize();
end

PlayerInfoView.onImageDownload = function(self,url,fileName)	
	self.m_urlHead = url;	
	if not string.isEmpty(fileName) then
        self:__setHeadImage(fileName);
    end
end

PlayerInfoView.__setHeadImage = function (self, image)
    if self.m_headImage then
		self.m_headImageBg:removeChild(self.m_headImage);
	end
	delete(self.m_headImage);
	self.m_headImage = new(Mask, image, "hall/common/mask_head_156.png");
	self.m_headImageBg:addChild(self.m_headImage);
	self.m_headImage:setAlign(kAlignCenter);
end

PlayerInfoView.onBtnFriendClick = function(self)
	ReportIsolater.getInstance():report(UBConfig.kGameDesktopPlayerInfoAddFriend, true, true)
	local cid = number.valueOf(self.m_player.m_cid);
	CommunityLogic.getInstance():requestAddFriend(cid,"");
	self:hidden();
end

--举报按钮回掉
PlayerInfoView.onbtnReportClick = function(self)
	ReportIsolater.getInstance():report(UBConfig.kGameDesktopPlayerInfoClickReport, true, true)
	-- local _isPlaying = (self.m_mainState == GameMechineConfig.STATUS_PLAYING) and true or false;
	
	local _whichItem = "all";
	local isDefaultSelected;
	if GameInfoIsolater.getInstance():isInMatchRoom() then 
		_whichItem = "match_cheat";
		isDefaultSelected = true;
	else 
		local isDefense = GameInfoIsolater.getInstance():checkIsDuringDefenseCheatTime();
		_whichItem = isDefense and "only_game" or "all";
	end 
	-- LayerManagerIsolater.getInstance():show("commonReport",self.m_player.m_id,whichItem,isPlaying);
	
	self:hidden();

	local action = GameMechineConfig.ACTION_NS_CREATVIEW;
	local data = {viewName = GameMechineConfig.VIEW_REPORT}
   	MechineManage.getInstance():receiveAction(action,data);

	action = GameMechineConfig.ACTION_NS_OPEN_REPORT;
	local data = {uid=self.m_player.m_id,whichItem = _whichItem,isDefaultSelected = isDefaultSelected};
	MechineManage.getInstance():receiveAction(action,data);
end

PlayerInfoView.onResponseAddFriend = function(self,seat,uid,info,isFast)
	self:setVisible(false);
end

PlayerInfoView.onBtnKickClick = function(self)
	if PrivateRoomIsolater.getInstance():isInJiFenRoom() then --积分房只有房主可以踢人，房主踢人不区分是否为vip，没有冷却时间
		ReportIsolater.getInstance():report(UBConfig.kPrivateJiFenKickUser, true, true);
		self:handleMasterKickUser();
		self:hidden();
		return;
	end 

	ReportIsolater.getInstance():report(UBConfig.kGameDesktopPlayerInfoClickKick, true, true)
	if UserIdentityIsolater.getInstance():getIsVip() then
		-- vip 不做验证
	else
		local kickPropNum = PropIsolater.getInstance():getPropNumByPropType(PropIsolater.propTypeMap.TYPE_VIP_KICK);
		if kickPropNum == 0 then
			UBReport.getInstance():report(UBConfig.kHallGetVipKick);
			self:hidden();
			-- 续费，调用充值

			PayIsolater.getInstance():setSceneType(UBPaySceneConfig.kRoomUserInfoVipRecharge);
			local action = GameMechineConfig.ACTION_RECHARGE;
			local data = {scene=PayIsolater.eGoodsListId.VipCharge};
			MechineManage.getInstance():receiveAction(action,data);
			return;
		end
	end

	if not PlayerInfoLogic.getInstance():checkKickEnable() then
		Toast.getInstance():showText(kTextTickCDTips,50,30,kAlignLeft,"",24,200,175,110);
		return;
	end

	if self.m_player.m_id == UserBaseInfoIsolater.getInstance():getUserId() then
		Toast.getInstance():showText(kTextKickSelf,50,30,kAlignLeft,"",24,200,175,110);
		return;
	end

	if UserIdentityIsolater.getInstance():checkIsVip(self.m_player.m_identity) then 
		Toast.getInstance():showText(kTextOwnerVipPrerogative,50,30,kAlignLeft,"",24,200,175,110);
		self:hidden();
		return;
	end

	self:_saveKickInfo();

	local param = {};
	param.beKickedUid = self.m_player.m_id;
	param.kickName = self.m_player.m_mnick;
	param.kickPropNum = 1;
	SocketIsolater.getInstance():sendMsg(CLIENT_COMMAND_VIPKICK, param);

    self:hidden();
end

PlayerInfoView._saveKickInfo = function(self)
	local kickUserId = self.m_player.m_id;
	local kickInfo = {};
	kickInfo.seatId = GamePlayerManager2.getInstance():getLocalSeatByMid(kickUserId);
	kickInfo.userId = kickUserId;
	kickInfo.sex = self.m_player.m_sex;
	local path_tb = InteractionInfo.getInstance():getHeadImagePath(kickInfo.seatId);
	kickInfo.url = path_tb.path;
	kickInfo.x,kickInfo.y = InteractionInfo.getInstance():getHeadAbsolutePos(kickInfo.seatId);
	GameRoomData.getInstance():setKickUserInfo(kickInfo);
end

PlayerInfoView.handleMasterKickUser = function(self)
	self:_saveKickInfo();

	local param = {};
	param.sUid = UserBaseInfoIsolater.getInstance():getUserId();  --踢人id
	param.sName = UserBaseInfoIsolater.getInstance():getNickname();
	param.tUid = self.m_player.m_id; --被踢者id
	param.tName = self.m_player.m_mnick;

	SocketIsolater.getInstance():sendMsg(CLIENT_COMMAND_JIFEN_ROOM_KICK_USER, param);
end

PlayerInfoView.setVipKickClick = function(self, obj, func)
	self.obj = obj;
	self.func = func;
end

PlayerInfoView.execDelegate = function (self, func, ...)
    if self.m_delegate and self.m_delegate[func] then
        self.m_delegate[func](self.m_delegate, ...);
    end
end

--[Comment]
--右侧标签点击事件
PlayerInfoView.onTabClick = function (self, finger_action, x, y, drawing_id_first, drawing_id_current)
	if drawing_id_current ~= drawing_id_first then 
		return;
	end
	self:_changeTab(drawing_id_current);
end

PlayerInfoView._changeTab = function (self, drawing_id_current)
	self:checkIsDuringDefenseCheatTime(self.m_infoBtn.m_drawingID == drawing_id_current);
	self.m_tabInfoSelImg:setVisible(self.m_infoBtn.m_drawingID == drawing_id_current);
	self.m_achievementView:setVisible(self.m_achievementBtn.m_drawingID == drawing_id_current);
	self.m_tabAchievementSelImg:setVisible(self.m_achievementBtn.m_drawingID == drawing_id_current);
	if self.m_infoBtn.m_drawingID == drawing_id_current then
		self.m_infoBtn:setEnable(false);
		self.m_achievementBtn:setEnable(true);
	elseif self.m_achievementBtn.m_drawingID == drawing_id_current then 
		self.m_infoBtn:setEnable(true);
		self.m_achievementBtn:setEnable(false);
	end
end

--[Comment]
--设置道具数据
--propsData:道具数据源
PlayerInfoView.setPropsData = function ( self, propsData)
	self:initPropsViewPager(propsData);
end

--[Comment]
--初始化道具ViewPager
--data:数据源（4个为一组）
PlayerInfoView.initPropsViewPager = function ( self, data)
	if not data then return; end
	if not self.m_propsViewPager then 
		self.m_propsViewPager = new(ViewPager, 0, 0, self.m_propsView:getSize());
		self.m_propsViewPager:setSize(440, 115);
	end

	if not self.m_propsAdapter then
		local pageView = require("games/common2/module/playerInfo/propsPageView");
		self.m_propsAdapter = new(CacheAdapter, pageView, data);
		self.m_propsViewPager:setAdapter(self.m_propsAdapter);
	else
		self.m_propsAdapter:changeData(data);
	end
	self.m_propsView:addChild(self.m_propsViewPager);
end

PlayerInfoView.showToast = function(slef,msg)
	if msg and msg ~= "" then 
		Toast.getInstance():showText(msg,50,30,kAlignLeft,"",24,200,175,110);
	end
end

-- 使用道具
PlayerInfoView.onUsePropsEvent = function(self,cmd, propInfo)
	self:hidden();
	if self.m_player then
		ReportIsolater.getInstance():reportWithVal(UBConfig.kGameDesktopPlayerInfoClickProp, string.format("gameId%s_levelId%s_itemId%s",
			GameInfoIsolater.getInstance():getCurGameId(), GameInfoIsolater.getInstance():getCurRoomLevelId(), self.m_player.m_id));
    	RoomPropsLogic.getInstance():onRequestUseProps(cmd, propInfo, self.m_player.m_id);
    end
end
---------------------------------------------------------------------
-----------------析构函数 -------------------------------------
---------------------------------------------------------------------
PlayerInfoView.dtor = function(self)
	ImageCache.getInstance():cleanRef(self);
	CommunityIsolater.getInstance():clearObserver(self);
	PlayerInfoLogic.getInstance():clearObserver(self);
	DialogLogic.getInstance():popDialogStack();
end
---------------------------------------------------------------------
----------------- config tables -------------------------------------

PlayerInfoView.s_controlConfig = 
{	
	[PlayerInfoView.s_controls.bg_touchView]		= {"bg_touchView"};
	[PlayerInfoView.s_controls.bg]					= {"bg"};
	[PlayerInfoView.s_controls.m_head]				= {"bg","head_img"};
	[PlayerInfoView.s_controls.m_gender]			= {"bg","infoView","gender_icon"};
	[PlayerInfoView.s_controls.m_name]				= {"bg","infoView","name_value"};
	[PlayerInfoView.s_controls.m_totalMoney]		= {"bg","infoView","total_money_value"};
	[PlayerInfoView.s_controls.moneyName]			= {"bg","infoView","total_money_key"};
	[PlayerInfoView.s_controls.moneyIcon]			= {"bg","infoView","money_icon","icon"};
	[PlayerInfoView.s_controls.m_levelBg]			= {"bg","infoView","level_bg"};
	[PlayerInfoView.s_controls.m_levelValue]		= {"bg","infoView","level_bg","level_value"};
	[PlayerInfoView.s_controls.m_level_name]		= {"bg","infoView","level_name"};
	[PlayerInfoView.s_controls.m_zhanJi]			= {"bg","infoView","zhanji_value"};
	[PlayerInfoView.s_controls.m_shenglv]			= {"bg","infoView","shenglv_value"};
	[PlayerInfoView.s_controls.m_id]				= {"bg","id_value"};
	[PlayerInfoView.s_controls.m_diamond]			= {"bg","infoView","diamondCount"};
	[PlayerInfoView.s_controls.diamondIcon]			= {"bg","infoView","diamondIcon"};
	[PlayerInfoView.s_controls.m_crystal]        	= {"bg","infoView","crystalCount"};
	[PlayerInfoView.s_controls.crystalIcon]        	= {"bg","infoView","crystalIcon"};
	[PlayerInfoView.s_controls.m_btnFriend]			= {"bg","infoView", "btnFriend"};
	[PlayerInfoView.s_controls.m_addFriendImg]		= {"bg","infoView", "btnFriend","img"};
	[PlayerInfoView.s_controls.m_txtFriend]			= {"bg","infoView","btnFriend","txtFriend"};
	[PlayerInfoView.s_controls.m_btnKick]			= {"bg","btnKick"};
	[PlayerInfoView.s_controls.m_txtKick]			= {"bg","btnKick","txtKick"};
	[PlayerInfoView.s_controls.m_vipImg]			= {"bg","infoView","vip_img"};
	[PlayerInfoView.s_controls.m_city]				= {"bg","infoView","city"};
	[PlayerInfoView.s_controls.dividerLine] 	 	= {"bg","line"};

	[PlayerInfoView.s_controls.infoBtn]				= {"bg","tabView","infoBtn"};
	[PlayerInfoView.s_controls.achievementBtn]		= {"bg","tabView","achievementBtn"};
	[PlayerInfoView.s_controls.tabInfoSelImg]		= {"bg","tabView","tabInfoSelImg"};
	[PlayerInfoView.s_controls.tabAchievementSelImg]= {"bg","tabView","tabAchievementSelImg"};
	[PlayerInfoView.s_controls.infoView]			= {"bg","infoView"};
	[PlayerInfoView.s_controls.achievementView]		= {"bg","achievementView"};
	[PlayerInfoView.s_controls.propsView]			= {"bg","infoView","propsView"};
	[PlayerInfoView.s_controls.propsTxt]			= {"bg", "infoView", "propsTxt"};
	[PlayerInfoView.s_controls.m_btnReport]      	= {"bg","btnReport"};
	[PlayerInfoView.s_controls.cheatTips]           = {"bg","cheatTips"};
};

PlayerInfoView.s_controlFuncMap =
{
	[PlayerInfoView.s_controls.m_btnFriend]			= PlayerInfoView.onBtnFriendClick;
	[PlayerInfoView.s_controls.m_btnKick]			= PlayerInfoView.onBtnKickClick;

	[PlayerInfoView.s_controls.infoBtn]				= PlayerInfoView.onTabClick;
	[PlayerInfoView.s_controls.achievementBtn]		= PlayerInfoView.onTabClick;
	[PlayerInfoView.s_controls.m_btnReport]      	= PlayerInfoView.onbtnReportClick;
};

PlayerInfoView.s_actionFuncMap = {
    [GameMechineConfig.ACTION_NS_ADDFRIENDRESULT]      	= "onResponseAddFriend";
    [GameMechineConfig.ACTION_SHOWPROPNIM]      		= "hidden";
    [GameMechineConfig.ACTION_NS_CLOSEPLAYERWND]      	= "hidden";
};

return PlayerInfoView;