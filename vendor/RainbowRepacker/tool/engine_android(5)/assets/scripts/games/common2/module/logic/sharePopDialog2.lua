
local share_layout_2 = require(ViewPath .. "games/common2/share_layout_2");

local SharePopDialog2 = class(IBaseDialog, false);
----------------------------------------------
SharePopDialog2.s_controls =
{
	shareBg 				= ToolKit.getIndex();
	weixinGroupBtn 			= ToolKit.getIndex();
	weixinFriendBtn 		= ToolKit.getIndex();
	shareCover				= ToolKit.getIndex();
};

-- local sharePopDialog = require("games/common2/module/logic/sharePopDialog2");
-- 	local data = {score = 10};
-- 	local shareDialog = new(sharePopDialog, data, config);
-- 	sharePopDialog:setContentPos(x,y,align)
-- 	IBaseDialog.pushDialog(shareDialog);

SharePopDialog2.s_gameType = {
	[GameConstant.NORMAL_IMMEDIATE_MATCH]		= "快速赛",
	[GameConstant.FIXED_TIME_MATCH]				= "定时赛"
}


--[[
	config = {
		items = {
			{
				key = "weixinGroup",
				isShow = false;
				sort = 1,
			},
			{
				key = "weixinFriend",
				isShow = false;
				sort = 2,
			},
		}
	}
]]
SharePopDialog2.ctor = function(self, data, config)
	super(self, share_layout_2);
	self:setLevel(193);
	self.m_shareData = {};
    self.m_shareGroupData = data;
	config = config or self:getDefaultShareConfig();

	local resultData = data;
	if table.isEmpty(resultData) or table.isEmpty(config) then
		if _DEBUG then
			Toast.getInstance():showText("子游戏透传的配置为nil", 50, 30, kAlignLeft, "", 24, 200, 175, 110);
		end
		return;
	end

	self:initView(config);

	Log.v("SharePopDialog2.ctor resultData", resultData);
	local currentGame = GameInfoIsolater.getInstance():getGameName(GameInfoIsolater.getInstance():getCurGameId());

	if resultData.Rank then
		local matchType = MatchIsolater.getInstance():getCurMatchType();
		if SharePopDialog2.s_gameType[matchType] then 
			currentGame = string.concat(currentGame, SharePopDialog2.s_gameType[matchType]);
		else 
			currentGame = string.concat(currentGame, "");
		end

		self.m_matchconfigid = data.matchconfigid;
	end

	local shareTempleData = MatchIsolater.getInstance():getShareTemplate();
	Log.i("---------shareTempleData ", shareTempleData);
	if table.isEmpty(shareTempleData) then
		if _DEBUG then
			Toast.getInstance():showText("分享配置为nil", 50, 30, kAlignLeft, "", 24, 200, 175, 110);
		end
		return;
	end
    
    resultData.gameId = resultData.gameId or GameInfoIsolater.getInstance():getCurGameId();
    resultData.levelId = resultData.levelId or GameInfoIsolater.getInstance():getCurRoomLevelId();

	local propertyName = RoomPropertyData.getInstance():getCurPropertyName() or "银币";

	if resultData.score then
		if resultData.score > 0 then
			local gameWinTab = shareTempleData.game_win;
			if table.isEmpty(gameWinTab) then
				Toast.getInstance():showText(kTextNoNetworkOrRetry, 50, 30, kAlignLeft, "", 24, 200, 175, 110);
				return;
			end
			local contentStr = gameWinTab.desc;
			contentStr = string.gsub(contentStr, "{game_name}", currentGame or "");
			contentStr = string.gsub(contentStr, "{money}", string.format("%d", math.abs(resultData.score)));
			contentStr = string.gsub(contentStr,"{property_name}",propertyName);
			self.m_shareData.share_icon = gameWinTab.share_icon;
			self.m_shareData.share_url = self:_concatUrl(gameWinTab.share_url, 1, resultData.gameId, resultData.score,resultData.levelId);
			self.m_shareData.desc = contentStr;
			self.m_shareData.title = contentStr;
		else
			local gamefailedTab = shareTempleData.game_failed;
			if table.isEmpty(gamefailedTab) then
				Toast.getInstance():showText(kTextNoNetworkOrRetry, 50, 30, kAlignLeft, "", 24, 200, 175, 110);
				return;
			end
			local contentStr = gamefailedTab.desc;
			contentStr = string.gsub(contentStr, "{game_name}", currentGame or "");
			contentStr = string.gsub(contentStr, "{money}", string.format("%d", math.abs(resultData.score)));
			contentStr = string.gsub(contentStr,"{property_name}",propertyName);
			self.m_shareData.share_icon = gamefailedTab.share_icon;
			self.m_shareData.share_url = self:_concatUrl(gamefailedTab.share_url, 0, resultData.gameId, -resultData.score,resultData.levelId);
			self.m_shareData.desc = contentStr;
			self.m_shareData.title = contentStr;
		end
        if self.m_shareData.desc then
		    self.m_shareData.desc = string.gsub(self.m_shareData.desc,"{property_name}",propertyName);
	    end
	    if self.m_shareData.title then
		    self.m_shareData.title = string.gsub(self.m_shareData.title,"{property_name}",propertyName);
	    end
	else
		self.m_shareData.isReward = resultData.isReward;
		if resultData.isReward then
			local matchWinTab = shareTempleData.match_win;
			if table.isEmpty(matchWinTab) then
				Toast.getInstance():showText(kTextNoNetworkOrRetry, 50, 30, kAlignLeft, "", 24, 200, 175, 110);
				return;
			end
            local desc = "";
			local rankStr = self:_getRankDesc(resultData.Rank);
            self.m_shareData.share_icon = matchWinTab.share_icon;
			self.m_shareData.share_url, desc = self:_getFreindUrl(resultData);
            self.m_shareData.desc = "我在刚刚结束的"..(resultData.djName or "").."中勇夺"..(rankStr or "").."，获得"..desc.."奖励，快来看看吧！";
			self.m_shareData.title = "我在刚刚结束的"..(resultData.djName or "").."中勇夺"..(rankStr or "").."，快来看看！";
		else
			local matchFailedTab = shareTempleData.match_failed;
			if table.isEmpty(matchFailedTab) then
				Toast.getInstance():showText(kTextNoNetworkOrRetry, 50, 30, kAlignLeft, "", 24, 200, 175, 110);
				return;
			end
            local desc = "";
			self.m_shareData.share_icon = matchFailedTab.share_icon;
			self.m_shareData.share_url, desc = self:_getFreindUrl(resultData);
			self.m_shareData.desc = "再努力一下就能拿到"..desc.."奖励啦，全天比赛奖不停，快来和我一起玩！";
			self.m_shareData.title = "我在刚刚结束的"..(resultData.djName or "").."中获得第"..resultData.Rank.."名！";
		end
	end

	Log.d("SharePopDialog2",self.m_shareData);
end

SharePopDialog2._getRankDesc = function (self, rank)
    local str = "";
    if rank == 1 then
        str = "冠军";
    elseif rank == 2 then
        str = "亚军";
    elseif rank == 3 then
        str = "季军";
    else
        str = "第"..(rank or "").."名";
    end
    return str;
end

SharePopDialog2._encodeURI = function (self, s)
    if string.isEmpty (s) then
        return "";
    end
    s = string.gsub(s, "([^%w%.%- ])", function(c) return string.format("%%%02X", string.byte(c)) end);
    return string.gsub(s, " ", "+");
end

SharePopDialog2._getFreindUrl = function(self, resultData)
    local url = "";
    local desc = "";
    local shareEntry = GameMatchHallConstants.eShareEntryType.MATCH_OVER;
    local nickName = kUserInfoData:getNickname();
    local sex = kUserInfoData:getSex();
    local curtime = AppData.getInstance():getRightTimeWithServer();
    local url = string.format("%sindex.php?action=h5.match", ServerConfig.getInstance():getHostUrl() or "");
    url = url.."&shareEntry="..shareEntry.."&nickName="..nickName.."&configId="..(resultData.matchconfigid).."&matchName="..(resultData.djName or "");
    if resultData.isReward then
        if not table.isEmpty(resultData.awardsList) then
            local param = resultData.awardsList[1];
            local goodsInfo = RechargeDataInterface.getInstance():getGoodInfoByTypeId(param.type) or {};
            url = url.."&rewardUrl="..(self:_encodeURI(goodsInfo.item_icon)).."&rewardDesc="..(param.desc or "");
            desc = param.desc or "";
        end
    else
        if not table.isEmpty(resultData.awardsWiner) then
            local award = resultData.awardsWiner.award[1];
            local curUrl = resultData.awardsWiner.icon["1"];
            url = url.."&rewardUrl="..(self:_encodeURI(curUrl)).."&rewardDesc="..(award.desc or "");
            desc = award.desc or "";
       end
    end
    local isReward = resultData.isReward and 1 or 0;
    url = url.."&rank="..resultData.Rank.."&matchAllUser="..resultData.matchusers.."&time="..curtime.."&sex="..sex.."&isReward="..isReward;

    local configId = tostring(resultData.matchconfigid or 0);
    local password = PasswordIsolater.getInstance():getPasswordByCode(PasswordIsolater.TYPE_MATCH, configId);
    url = PasswordIsolater.getInstance():generateUrlWithPassword(url, password);
    return url, desc;
end

SharePopDialog2.getDefaultShareConfig = function(self)
	local defualtShareConfig = RegionConfigIsolater.getInstance():getDefaultShareConfig();
	if table.isEmpty(defualtShareConfig) then
		return {};
	end

	local config = {
		items = {
			{
				key = "weixinGroup",
				isShow = defualtShareConfig["weixinGroup"];
				sort = 1;
			},
			{
				key = "weixinFriend",
				isShow = defualtShareConfig["weixinFriend"];
				sort = 2;
			},
		}
	}

	return config;
end

SharePopDialog2.dtor = function(self)
    self:__deleteShareLayer();
end

SharePopDialog2.setShowButtonsEvent = function ( self, obj, func )
	self.m_callbackObj = obj;
	self.m_callbackFunc = func;
end

SharePopDialog2.showAndHideButtons = function ( self, flag )
	if self.m_callbackObj and self.m_callbackFunc then 
		self.m_callbackFunc(self.m_callbackObj, flag);
	end
end

SharePopDialog2.onShareBgClick = function(self)
	IBaseDialog.hide();
end

SharePopDialog2.setContentPos = function(self, x, y,align)
	align = align or kAlignTopLeft;
	local contentView = self:findViewById(self.s_controls.shareCover);
	contentView:setAlign(align);
	contentView:setPos(x,y);
end

SharePopDialog2.__getShareConfigShowNum = function (self, config)
   local num = 0;
   for k, v in pairs(table.verify(config)) do
       if v.isShow then
          num = num + 1;
       end 
   end
   return num;
end
SharePopDialog2.initView = function(self,config)
	self.m_ctrl = SharePopDialog2.s_controls;
	self.m_menuItemCount = 0;
	self.m_weixinGroupBtn = self:findViewById(self.m_ctrl.weixinGroupBtn);
	self.m_weixinFriendBtn = self:findViewById(self.m_ctrl.weixinFriendBtn);
	self.m_weixinGroupBtn:setVisible(false);
	self.m_weixinFriendBtn:setVisible(false);

	local shareBtnConfig = table.verify(config);
	local items = table.verify(shareBtnConfig.items);

	table.sort(items, function ( a, b )
		if a and b then 
			return number.valueOf(a.sort) <= number.valueOf(b.sort);
		end
	end );

	for k, v in pairs(items) do
		local menuItem = self:getShowItem(v);
		if menuItem then
			if self:__getShareConfigShowNum(items) == 1 then
				menuItem:setPos(0, 0);
				menuItem:setAlign(kAlignCenter);
			else
				menuItem:setPos(98*self.m_menuItemCount + 40*(self.m_menuItemCount+1), 0);
				menuItem:setAlign(kAlignLeft);
			end
			if v.file and v.file ~= "" then
				menuItem:setFile(v.file);
			end
			self.m_menuItemCount = self.m_menuItemCount + 1;
		end
	end
	local contentView = self:findViewById(self.m_ctrl.shareCover);
	local moreViewWidth = 98*self.m_menuItemCount + 40*(self.m_menuItemCount+1);
	moreViewWidth = (moreViewWidth < 316) and 316 or moreViewWidth;
	contentView:setSize(moreViewWidth);
end

SharePopDialog2.getShowItem = function ( self, item )
	if not item.isShow then 
		return nil; -- isShow为false时，也不显示
	end
	local itemName = item.key;
	local menuItem = nil;
	if itemName == "weixinGroup" then 
		menuItem = self.m_weixinGroupBtn;
	elseif itemName == "weixinFriend" then 
		menuItem = self.m_weixinFriendBtn;
	end
	if menuItem then 
		menuItem:setVisible(true);
	end
	return menuItem;
end

-- 微信分享给好友
SharePopDialog2.onWeixinFriendBtnClick = function(self)
	if GameInfoIsolater.getInstance():isInMatchRoom() then 
		local action = self.m_shareData.isReward and UBConfig.kMatchShareFriendReward or UBConfig.kMatchShareFriendUnReward;
		UBReport.getInstance():report(action);
	end
    WeiXinIsolater.getInstance():weixinSendWebPage(self.m_shareData.share_url, self.m_shareData.title, self.m_shareData.desc, self.m_shareData.share_icon, false);
	IBaseDialog.hide();
end

SharePopDialog2.__deleteShareLayer = function (self)
    if self.m_shareLayer then
       delete(self.m_shareLayer);
       self.m_shareLayer = nil;
    end
end

SharePopDialog2.__createShareLayer = function (self)
    local matchGameOverShareDetailLayer = require("games/common2/match/module/matchGameOver/matchGameOverShareDetailLayer");
	self:__deleteShareLayer();
    self.m_shareLayer = new(matchGameOverShareDetailLayer, self.m_shareGroupData);
end

-- 微信分享给朋友圈
SharePopDialog2.onWeixinGroupBtnClick = function(self)
	if GameInfoIsolater.getInstance():isInMatchRoom() then 
		local action = self.m_shareData.isReward and UBConfig.kMatchShareMomentsReward or UBConfig.kMatchShareMomentsUnReward;
		UBReport.getInstance():report(action);
        self:__createShareLayer();
        local filePath = System.offscreenRender(self.m_shareLayer);
		if not string.isEmpty(filePath) then
            Clock.instance():schedule_once(function()
			    WeiXinIsolater.getInstance():weixinSendImage(filePath, true);
            end)
		end
	else 
		WeiXinIsolater.getInstance():weixinSendWebPage(self.m_shareData.share_url, self.m_shareData.title, self.m_shareData.desc, self.m_shareData.share_icon, true);
		IBaseDialog.hide();
	end
end

SharePopDialog2._concatUrl = function(self, url, winOrLose, gameId, money,levelId)
	local str = url;
	if winOrLose then
		str = string.format("%s&winOrLose=%s", str, winOrLose);
	end

	if gameId then
		str = string.format("%s&gameId=%s", str, gameId);
	end

	if money then
		str = string.format("%s&money=%s", str, money);
	end

	if levelId then 
		str = string.format("%s&levelId=%s",str,levelId);
	end 
	return str;
end

SharePopDialog2.s_controlConfig =
{
	[SharePopDialog2.s_controls.shareBg]				= { "shareBg" };
	[SharePopDialog2.s_controls.shareCover]				= { "shareBg", "shareCover" };
	[SharePopDialog2.s_controls.weixinGroupBtn]			= { "shareBg", "shareCover", "weixinGroupBtn" };
	[SharePopDialog2.s_controls.weixinFriendBtn]		= { "shareBg", "shareCover", "weixinFriendBtn" };
};

SharePopDialog2.s_controlFuncMap =
{
	[SharePopDialog2.s_controls.shareBg]				= SharePopDialog2.onShareBgClick;
	[SharePopDialog2.s_controls.weixinGroupBtn]		= SharePopDialog2.onWeixinGroupBtnClick;
	[SharePopDialog2.s_controls.weixinFriendBtn]		= SharePopDialog2.onWeixinFriendBtnClick;
}


return SharePopDialog2;