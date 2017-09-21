----保存大厅底部按钮的配置

require("gameData/gameData");
require('hall/goldBar/data/goldBarDataInterface');

HallBottomButtonConfig = class(GameData);

HallBottomButtonConfig.s_maxTryCount = 8;

HallBottomButtonConfig.btnIds = {
	mall = 1,
	activity = 2,
	rank = 3,
	exchange = 4,
	friend = 5,
	groupGame = 6,
	safeBox = 7,
	freeMoney = 8,
	more = 9,
	moreGame = 10,
	setting = 11,
    backpack = 12,
	goldBar = 13,

	--以下是710新加的icon      message 也受后台控制。
	message = 14,    --消息
    agent = 15,		 --代理 
	service = 16,	 --客服
    friendRoom = 17, --约牌
    redEnvelope = 18, --红包
    invitational = 19, --邀请赛
    tellFriends = 20, --告诉好友
    friendsCircle = 21, --发朋友圈 
}

HallBottomButtonConfig.leftTopBtnIds ={
	[HallBottomButtonConfig.btnIds.agent] = true;
	[HallBottomButtonConfig.btnIds.rank] = true;
	[HallBottomButtonConfig.btnIds.service] = true;
	[HallBottomButtonConfig.btnIds.setting] = true;
}

HallBottomButtonConfig.leftCenterBtnIds ={
	[HallBottomButtonConfig.btnIds.friend] = true;
	[HallBottomButtonConfig.btnIds.message] = true;
	[HallBottomButtonConfig.btnIds.goldBar] = true;
	[HallBottomButtonConfig.btnIds.redEnvelope] = true;
}

HallBottomButtonConfig.rightBottomBtnIds ={
	[HallBottomButtonConfig.btnIds.mall] = true;
	[HallBottomButtonConfig.btnIds.freeMoney] = true;
	[HallBottomButtonConfig.btnIds.activity] = true;
	[HallBottomButtonConfig.btnIds.friendRoom] = true;
}

HallBottomButtonConfig.leftBottomBtnIds ={
	[HallBottomButtonConfig.btnIds.backpack] = true;
	[HallBottomButtonConfig.btnIds.safeBox] = true;
}

HallBottomButtonConfig.s_defaultConfig = {
	{
		id = HallBottomButtonConfig.btnIds.service,
		display = 1,
		highlight = 0,
	},
	{
		id = HallBottomButtonConfig.btnIds.setting,
		display = 1,
		highlight = 0,
	},
}


HallBottomButtonConfig.Delegate = {
	onGetHallBottomButtonListCallBack = "onGetHallBottomButtonListCallBack";
}

HallBottomButtonConfig.initData = function(self)
	self.m_gameBtnsMap = {};
	self.m_gameVersionMap = {};
	self.m_updateFlagMap = {};
	self.m_updateTryMap = {};
end

HallBottomButtonConfig.loadDictData = function(self, dict)
	local strVersion = dict:getString("versions") or "";
	local versionMap = json.decode(strVersion);
	if not table.isEmpty(versionMap) then
		self.m_gameVersionMap = versionMap;
	end

	local strData = dict:getString("bottomButtonConfig") or "";
	local config = json.decode(strData);
	if not table.isEmpty(config) then
		self.m_gameBtnsMap = config;
	end
	
	--大厅更新后提示新功能
	local showTipStr= dict:getString("more_tip") or "yes";
	self.m_isShowTip = true;
	if showTipStr == "no" then
		self.m_isShowTip = false;
	end

	--历史大厅版本号
	local hall_version_history = dict:getString("hall_version") or "";
	local hall_version_current =  kGameManager:getGameVersion(GameType.HALL);
	hall_version_current = ""..hall_version_current;
    self.m_isHallVersionChanged = false;
	if hall_version_history ~= hall_version_current then
		self.m_isShowTip = true;
        self.m_isHallVersionChanged = true;
	end

end

HallBottomButtonConfig.saveDictData = function(self, dict)
	local strVersion = json.encode(self.m_gameVersionMap);
	if strVersion then
		dict:setString("versions", strVersion);
	end

	local strConfig = json.encode(self.m_gameBtnsMap);
	if strConfig then
		dict:setString("bottomButtonConfig", strConfig);
	end

	local showTipStr = "no" ;
	if self.m_isShowTip then
		showTipStr = "yes";
	end
	dict:setString("more_tip",showTipStr);

	local hall_version_str = kGameManager:getGameVersion(GameType.HALL);
	dict:setString("hall_version",""..hall_version_str);
end

HallBottomButtonConfig.isCanShowTip = function(self)
	return self.m_isShowTip and HallDataInterface.getInstance():isButtonDisplay(GameType.HALL, HallBottomButtonConfig.btnIds.invitational)
end

HallBottomButtonConfig.setCanShowTip = function(self,p_bool)
	self.m_isShowTip = p_bool;
    self:saveData();
end

HallBottomButtonConfig.getLocalDictName = function(self)
	return "HallBottomButtonConfig";
end

HallBottomButtonConfig.__requestData = function(self, gameid)
	if not LoginDataInterface.getInstance():getIsLoginSuccess() then
		--登录成功后再进行请求,为了让后端进行控制底部按钮的显示
		return;
	end

	local strGameid = tostring(gameid);
	self.m_updateTryMap[strGameid] = number.valueOf(self.m_updateTryMap[strGameid], 0) + 1;

	if not self.m_updateFlagMap[strGameid] and self.m_updateTryMap[strGameid] <= HallBottomButtonConfig.s_maxTryCount then

		local param = { 
		version = kClientInfo:getApkVersion(),
		gameid = gameid,
		type = 1,
        hall_version = kGameManager:getGameVersion(GameType.HALL),
		cli_ver = self.m_gameVersionMap[strGameid] or -1 };

        if self.m_isHallVersionChanged then
            param.cli_ver = -1;
        end

		OnlineSocketManager.getInstance():sendMsg(PHP_HALL_BOTTOM_BUTTON, param, 6000);

        self.m_isHallVersionChanged = false;

	end
end

HallBottomButtonConfig.onGetHallBottomButtonListCallBack = function(self, isSuccess, info, sendParam)
	if not sendParam.gameid then
		return;
	end

	local gameid = sendParam.gameid;
	if not isSuccess then
		self:__requestData(gameid);
		self:execDelegate(HallBottomButtonConfig.Delegate.onGetHallBottomButtonListCallBack, false, {}, gameid);
		return;
	end	

	self:setShowGoldBarLimit(tonumber(info.crystalMustMoney) or -1);

	self:updateDataByCompareVersion(info.svr_ver, info.isrefresh, info.data, gameid);
end

--设置是否显示金条ICON的上限值
HallBottomButtonConfig.setShowGoldBarLimit = function(self,p_num)
    if not p_num or type(p_num) ~= 'number' then
        return;
    end 
    self.m_showIconLimit = p_num;

end

--得到是否显示金条ICON的上限值
HallBottomButtonConfig.getShowGoldBarLimit = function(self)
  
    self.m_showIconLimit = self.m_showIconLimit or -1 ; 
    return self.m_showIconLimit;

end

HallBottomButtonConfig.updateMemData = function(self, serverVersion, data, gameid)
	if table.isEmpty(data) or not gameid then
		return;
	end

	local strGameid = tostring(gameid);
	self.m_updateFlagMap[strGameid] = true;
	self.m_gameVersionMap[strGameid] = serverVersion;
	self.m_gameBtnsMap[strGameid] = {};

	for k, v in ipairs(data) do
		table.insert(self.m_gameBtnsMap[strGameid], self:__formatData(v) );--有序
	end

	self:execDelegate(HallBottomButtonConfig.Delegate.onGetHallBottomButtonListCallBack, true, Copy(self.m_gameBtnsMap[strGameid]), gameid);
end

HallBottomButtonConfig.__formatData = function(self, orgData)
	local item = {};
	item.id = tonumber(orgData.id) or 0; --按钮Id
	item.display = tonumber(orgData.display) or 0; --是否显示 1为显示 0为隐藏
	item.highlight = tonumber(orgData.highlight) or 0; --高亮显示：0为不高亮 1为每次登录高亮 2为永远高亮
	item.childs = {};

	for k, v in ipairs( table.verify(orgData.child) ) do
		v.id = tonumber(v.id) or 0;
		v.display = tonumber(v.display) or 0; --是否显示 1为显示 0为隐藏
		v.highlight = tonumber(v.highlight) or 0; --高亮显示：0为不高亮 1为每次登录高亮 2为永远高亮
		table.insert(item.childs, v);
	end

	return item;
end

--获得所有配置信息
HallBottomButtonConfig.getConfig = function(self, gameid)
	if not gameid then
		return {};
	end

	self:__requestData(gameid);

	return self:__getConfigWithGameId(gameid);
end

---根据ID配置信息
HallBottomButtonConfig.getConfigById = function(self, gameid, btnId)
	if not (gameid and btnId) then
		return;
	end

	local btnsMap = self:__getConfigWithGameId(gameid);
	for k, v in ipairs( table.verify(btnsMap) ) do
		if v.id == btnId then
			return v;
		end

		for _, child in ipairs( table.verify(v.childs) ) do
			if child.id == btnId then
				return child;
			end
		end
	end
end

--根据模板过滤数据
HallBottomButtonConfig.__filterBtnIdsByModule = function(self,p_gameId,p_module)
	
	if not p_gameId then
		return;
	end

	local ret = {};
	local btnsMap = self:__getConfigWithGameId(p_gameId);
	for k, v in ipairs( table.verify(btnsMap) ) do
		if tonumber(v.display) == 1 and self:__isCanShow(v.id) and p_module[v.id] then
			table.insert(ret, v.id);
		end
	end
	return ret;
end

--得到左上角按钮id
HallBottomButtonConfig.getLeftTopBtnIds = function(self, gameid)
	if not gameid then
		return;
	end

	--self:__requestData(gameid);

	return self:__filterBtnIdsByModule(gameid,HallBottomButtonConfig.leftTopBtnIds);

end

--得到左中按钮id
HallBottomButtonConfig.getLeftCenterBtnIds = function(self, gameid)
	if not gameid then
		return;
	end

	--self:__requestData(gameid);

	--return self:__filterBtnIdsByModule(gameid,HallBottomButtonConfig.leftCenterBtnIds);
	local temp = self:__filterBtnIdsByModule(gameid,HallBottomButtonConfig.leftCenterBtnIds);
	--table.insert(temp,18);
	return temp;
end

--得到右下角按钮id
HallBottomButtonConfig.getLeftBottomBtnIds = function(self, gameid)
	if not gameid then
		return;
	end

	--self:__requestData(gameid);

	return self:__filterBtnIdsByModule(gameid,HallBottomButtonConfig.leftBottomBtnIds);

end

--得到右下角按钮id
HallBottomButtonConfig.getRightBottomBtnIds = function(self, gameid)
	if not gameid then
		return;
	end

	--self:__requestData(gameid);

	return self:__filterBtnIdsByModule(gameid,HallBottomButtonConfig.rightBottomBtnIds);

end


--在服务器开关打开的基础上，客户端再做一次逻辑判断，这样从概念上来说是不合理的，一定要确定好特殊性再放到这里
HallBottomButtonConfig.__isCanShow = function(self, p_configId)
    local _isCanshow = true;
    local _handFunc = {};

    --金条显示
    _handFunc[HallBottomButtonConfig.btnIds.goldBar] = function()
        --如果已经显示过，则不管此时银币数量多少都显示
        if GoldBarDataInterface.getInstance():isShowed() then
            return true;
        else
        	local _upLimit = self:getShowGoldBarLimit();
            if UserInfoData.getInstance():getTotalMoney() >=  _upLimit and _upLimit ~= -1  then
                GoldBarDataInterface.getInstance():setGoldBarRedState(1);
                GoldBarDataInterface.getInstance():setIsShowed(true);
                return true;
            else
                return false; 
            end  
        end 
    end

    --代理商显示
    _handFunc[HallBottomButtonConfig.btnIds.agent] = function()
        local isLuaAgencyOpen = AgencyDataInterface.getInstance():isLuaAgencyOpen();
        return isLuaAgencyOpen;
    end

    if _handFunc[p_configId] then
        _isCanshow = _handFunc[p_configId]();
    else
        --默认为true;服务器让显示就显示。    
    end

    return _isCanshow;
end

HallBottomButtonConfig.__getConfigWithGameId = function(self, gameid)
	local strGameid = tostring(gameid);
	return self.m_gameBtnsMap[strGameid] or HallBottomButtonConfig.s_defaultConfig;
end

HallBottomButtonConfig.s_socketCmdFuncMap = {
	[PHP_HALL_BOTTOM_BUTTON]	 = HallBottomButtonConfig.onGetHallBottomButtonListCallBack;
};
