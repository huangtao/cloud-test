require("gameData/dataInterfaceBase");
require("hall/onlineSocket/globalSocketCmd");
require("hall/onlineSocket/globalSocketWriter");
require("hall/onlineSocket/globalSocketReader");
require("hall/prop/propManager");
require("hall/shortCutRecharge/widget/rechargeSucPop");
require("hall/privateRoom/data/privateRoomDataInterface");
require("hall/gameData/pay/goodsListInterface");
require("games/common2/data/commonPlayerInfoHandler2");
require("hall/bankrupt/data/bankruptInterface");
require("hall/backpack/data/backpackDataInterface")
require("hall/message/data/messageDataInterface");
require("netWork/ServerConfig");
require("hall/recharge/data/rechargeDataInterface");
require("hall/announcement/data/announceDataInterface");
require("isolater/interface/gameInfoIsolater");
require("isolater/interface/socketIsolater");
require("hall/redEnvelope/data/redEnvelopeDataInterface");

GlobalSocketMessageHandler = class(DataInterfaceBase);

GlobalSocketMessageHandler.Delegate = {
    onSocketUpdateNetIcon = "onSocketUpdateNetIcon";
	onSocketFirstConnected = "onSocketFirstConnected";
	onSocketReconnecting = "onSocketReconnecting";
	onSocketReconnected = "onSocketReconnected";
	onSocketReConnectFailed = "onSocketReConnectFailed";

	onBroadcastRoomBoxProgress = "onBroadcastRoomBoxProgress";

	onPhpRequestTimeout = "onPhpRequestTimeout";

	onBroadcastPayMoney = "onBroadcastPayMoney";

	onServerBroadPhpUseProps = "onServerBroadPhpUseProps";
    onServerBroadVipKick = "onServerBroadVipKick";

    onBroadcastSilverInning = "onBroadcastSilverInning"; -- 广播银元牌局进度
    onGetPhpPushMessageCallBack = "onGetPhpPushMessageCallBack";
    onServerPushOtherUserInfo = "onServerPushOtherUserInfo";
};


GlobalSocketMessageHandler.getInstance = function()
	if not GlobalSocketMessageHandler.s_instance then
		GlobalSocketMessageHandler.s_instance = new(GlobalSocketMessageHandler);
	end

	return GlobalSocketMessageHandler.s_instance;
end


GlobalSocketMessageHandler.ctor = function(self)
	self.m_fileName = "GlobalSocketMessageHandler";
	
	self:initSocketManager();
	self:createSocketReader();
	self:createSocketWriter();
end 
GlobalSocketMessageHandler.dtor = function(self)
end 

GlobalSocketMessageHandler.log = function(self,funcName,...)
	Log.v(self.m_fileName," ",funcName," ",...);
end

GlobalSocketMessageHandler.initSocketManager = function(self)
	self.m_socket = OnlineSocketManager.getInstance();
end 

GlobalSocketMessageHandler.createSocketReader = function(self)
	self.m_socketReader = new(GlobalSocketReader);
	self.m_socket:addSocketReader(self.m_socketReader);
end

GlobalSocketMessageHandler.createSocketWriter = function(self)
	self.m_socketWriter = new(GlobalSocketWriter);
	self.m_socket:addSocketWriter(self.m_socketWriter);
end

-----------------------------------------------------------------
GlobalSocketMessageHandler.onSocketFirstConnected = function(self)
	self:log("onSocketFirstConnected");
	self:notify(GlobalSocketMessageHandler.Delegate.onSocketFirstConnected);
end

GlobalSocketMessageHandler.onSocketReConnecting = function(self, data)
	self:log("onSocketReConnecting");
	self:notify(GlobalSocketMessageHandler.Delegate.onSocketReconnecting, data);
end

GlobalSocketMessageHandler.onSocketReConnected = function(self)
	self:log("onSocketReConnected");
	self:notify(GlobalSocketMessageHandler.Delegate.onSocketReconnected);
end

GlobalSocketMessageHandler.onSocketReConnectFailed = function(self)
	self:log("onSocketReConnectFailed");
	kLoginDataInterface:setLoginState(LoginConstants.eLoginState.None);
	self:notify(GlobalSocketMessageHandler.Delegate.onSocketReConnectFailed);
end

GlobalSocketMessageHandler.onSocketUpdateNetIcon = function(self, data)
    self:notify(GlobalSocketMessageHandler.Delegate.onSocketUpdateNetIcon, data);
end

--------------------------------------------------------------------------------------------------
GlobalSocketMessageHandler.onMultiDeviceLogin = function(self,info)
	self:log("onMultiDeviceLogin","info = ",info);
	Log.eWF("MultiDeviceLogin ","GlobalSocketMessageHandler.onMultiDeviceLogin","info = ",info,"userId = ",kUserInfoData:getUserId());
	local userId = info and tonumber(info.mid or -1) or -1;
	local userUType = kLoginDataInterface:getLastUType();

    --游客账号是不会存在异地登录的,游客账号收到这条消息时,直接忽略
	if kUserInfoData:getUserId() == userId and userUType ~= LoginConstants.uType.Guest then
		Log.eWF("MultiDeviceLogin ","GlobalSocketMessageHandler.onMultiDeviceLogin kUserInfoData:getUserId() == userId ==> _handleMultiLogin");
		self:_handleMultiLogin();		
	end
end

GlobalSocketMessageHandler.onServerKickout = function(self)
	self:log("onServerKickout");
	Log.eWF("MultiDeviceLogin ","GlobalSocketMessageHandler.onServerKickout ==> _handleMultiLogin ");

	self:_handleMultiLogin();
end

GlobalSocketMessageHandler.onPhpKickout = function(self, info)
    self:log("onPhpKickout info = ", info);
    local msg = info.msg;
    local errorType = info.errorType ;
    self.m_socket:closeSocketSync();
    kLoginDataInterface:setLoginState(LoginConstants.eLoginState.PhpKickout);
    kGameManager:startGame(GameType.HALL);
    if errorType == LoginConstants.eKickoutErr.ERR_BACKSTAGE_DISABLE_ACCOUNT then
        local DisableAccountDialog = require("hall/login/widget/disableAccountDialog");
        DisableAccountDialog.show({cid = kUserInfoData:getUserCid()});
    else
        if msg and msg ~= "" then
            Toast.getInstance():showText(msg,50,30,kAlignLeft,"",24,255,255,255);
        end  
    end
end

GlobalSocketMessageHandler.onServerRequestReLogin = function(self)
	kLoginDataInterface:onServerRequestReLogin();
end

GlobalSocketMessageHandler._handleMultiLogin = function(self)
	Log.eWF("MultiDeviceLogin ","GlobalSocketMessageHandler._handleMultiLogin");

	self.m_socket:closeSocketSync();	
    kLoginDataInterface:setLoginState(LoginConstants.eLoginState.MultiDeviceLogin);
	Log.eWF("MultiDeviceLogin ","GlobalSocketMessageHandler._handleMultiLogin ==> gameManager start to hall");

	kGameManager:startGame(GameType.HALL);
end
---------------------------------------------------------------------------------------------------------
GlobalSocketMessageHandler.onReciveBroadcastMessage = function(self, info)
	self:log("onReciveBroadcastMessage");
	local data = json.decode(info.ret);
	if  data and table.isTable(data) then
		local msgTab = {};
        msgTab.type = data.type;
        if msgTab.type == 3 then 
            --临时公告
          	AnnounceDataInterface.getInstance():insertTemporaryData(data); 
        elseif msgTab.type == 1 or msgTab.type == 0 then
            --0：用户广播
            --1：系统广播
		  	BroadcastDataInterface.getInstance():addRadioMsg(data);
        end
	end
end

GlobalSocketMessageHandler.onPhpPushMessage = function(self, info)
	local data = json.decode(info.ret);
	self:log("onPhpPushMessage", "info = ", info);
	if not table.isEmpty(data) then
		local msgType = data.mtype;
		if msgType == 1 then
			--此时是私信,兼容老四川
			self:log("onPhpPushMessage","收到私信");
			local msgInfo = data.info;
			if msgInfo.awards then 
				msgInfo.awards = json.decode(msgInfo.awards);
			end
			MessageDataInterface.getInstance():addMsgData(msgInfo);
		elseif msgType == 2 then 
			--此时是房间任务消息
			self:log("onPhpPushMessage","广播房间任务进度");
            if not table.isEmpty(data.info) then
		        self:notify(GlobalSocketMessageHandler.Delegate.onBroadcastRoomBoxProgress, data.info);
            end

		elseif msgType == 6 then		
		elseif msgType == 10 then		
		elseif msgType == 11 then		
		elseif msgType == 12 then
        elseif msgType == 13 then
            --PHP刷新用户信息
            local field = tonumber(data.info.field); -- 0:银币, 1:金条 2:钻石
            local value = tonumber(data.info.value);

            if field and value then
                if field == 0 then
                    kUserInfoData:setMoney(value);
                elseif field == 1 then
                    kUserInfoData:setCrystal(value);
                elseif field == 2 then
                    kUserInfoData:setDiamond(value);
                end
            end
		  
		elseif msgType == 15 then	
		elseif msgType == 17 then
			--此时是私信
			self:log("onPhpPushMessage","收到私信");
			local msgInfo = data.info;
			MessageDataInterface.getInstance():addMsgData(msgInfo);
		elseif msgType == 19 then --代理商注册成功
			self:log("onPhpPushMessage","代理商注册成功");
		elseif msgType == 20 then --立即切换大厅IP与端口
            if not table.isEmpty(data.info) then
                ServerConfig.getInstance():setServerRecommendIpPort(data.info.ip, data.info.port);
            end
		elseif msgType == 21 then
        elseif msgType == 27 then 
            --推送银元场当前牌局数
            if not table.isEmpty(data.info) then
                self:notify(GlobalSocketMessageHandler.Delegate.onBroadcastSilverInning, data.info);
            end
        elseif msgType == 28 then
			-- 新物品箱 线下物品兑换推送
			BackpackDataInterface.getInstance():onPushOffline(true, data.info);
        elseif msgType == 29 then
			-- 物品箱 刷新物品箱数据 入口显示小红点消息体 
			BackpackDataInterface.getInstance():onPushBagChange(true, data.info);
        elseif msgType == 30 then
			-- 物品箱 领奖记录入口显示小红点
			BackpackDataInterface.getInstance():onPushRecordChange(true, data.info);
        elseif msgType == 31 then
            if data.info and data.info.agentphone then
                kUserInfoData:setAgentPhone(data.info.agentphone)
            end
        elseif msgType == 32 then
            BackpackDataInterface.getInstance():onExchangeApplyExamine(true, data.info)
        elseif msgType == 34 then
            --接收子游戏|子模块的推送信息
            if not table.isEmpty(data.info) then
                SocketIsolater.getInstance():setMessagePushedByPhp(data.info.gameid, data.info.type, data.info.data);
                self:notify(GlobalSocketMessageHandler.Delegate.onGetPhpPushMessageCallBack, msgType, data);
            end
        elseif msgType == 999 then
            ServerConfig.getInstance():redirectionIpPort(data.info);
		else
            --大厅未拦截的命令，则透传出去（防止模块或子游戏需要进行处理）
            self:notify(GlobalSocketMessageHandler.Delegate.onGetPhpPushMessageCallBack, msgType, data);
        end
	end
end
-----------------------------------------------------------------------------------------------------------------------------
--广播支付获取银币 充值成功
GlobalSocketMessageHandler.onBroadcastPayMoney = function(self,packetInfo)
    local updatePayStatus = function()
         local isPay  = kUserInfoData:getPayStatus(); -- 0未充值,1普通充值,2二次特权充值
        if isPay == 0 then 
           isPay = 2; --普通充值->二次特权
        end
        kUserInfoData:setPayStatus(isPay);
    end

	local broadType = packetInfo.type;--广播类型
	local detailInfo = json.decode(packetInfo.data) or {}; --详细信息
    self:log("充值成功","broadType = ",broadType,"detailInfo = ",detailInfo);
	if 0 == broadType then -- 老的支付广播接口
		local payMoney = detailInfo.pay_money or 0;
		local cur_money = detailInfo.cur_money or kUserInfoData:getMoney();
        local refund_bouns = detailInfo.fplus;
	    
		kUserInfoData:setMoney(cur_money);

        
	      
	    local data = {};
        data.topTips = detailInfo.pay_succ_tips;
        data.rightTitle = "内容说明";
        data.rightContent = detailInfo.pay_succ_explain;
        data.adUrl = detailInfo.pay_succ_pic;
        data.jumpcode = detailInfo.pay_succ_jumpcode;

        if MessageBox.isShowDirect() then
            RechargeSucPop.show(data);
        end
       
        updatePayStatus();

    elseif 1 == broadType then -- 购买金条
        local payCrystal = tonumber(detailInfo.crystal) or 0; --购买金条数
        local totalCrystal = tonumber(detailInfo.total_crystal) or 0;--总金条数
        kUserInfoData:setCrystal(totalCrystal);

        local bouns = table.verify(detailInfo.bouns);
        local award_gold = number.valueOf(bouns.gold, 0);
        local award_diamond = number.valueOf(bouns.diamond, 0);
        local award_props = table.verify(bouns.props);

        local desc = string.format("成功购买%s金条", ToolKit.skipMoneyEx2(payCrystal) );
        if award_gold > 0 then
            desc = desc .. string.format(",加赠%s银币", award_gold);
        end

        if award_diamond > 0 then
            desc = desc .. string.format(",加赠%s钻石", award_diamond);
        end

        for propClassifyId, num in pairs(award_props) do
            local propInfo = RechargeDataInterface.getInstance():getGoodInfoByTypeId(propClassifyId);
            if propInfo and propInfo.item_name then
                desc = desc .. ",加赠".. propInfo.item_name .."x" ..num;
            end
        end
          
        local data = {};
        data.title = detailInfo.pay_succ_tips;         --标题提示信息
        data.rightTitle = "内容说明";
        data.topTips = desc;                             --提示信息
        data.rightContent = detailInfo.pay_succ_explain; --右侧说明内容
        data.adUrl = detailInfo.pay_succ_pic;            --左侧图片
        data.jumpcode = detailInfo.pay_succ_jumpcode;    --跳转代码

        if MessageBox.isShowDirect() then
            RechargeSucPop.show(data);
        end

        -- updatePayStatus();

	elseif 3 == broadType  then --购买VIP
        local cur_money = detailInfo.cur_money or kUserInfoData:getMoney();
        kUserInfoData:setMoney(cur_money);
		
		local data = {};
        data.title = detailInfo.pay_succ_tips;
        data.rightTitle = "内容说明";
        data.topTips = detailInfo.pay_succ_content;                             
        data.rightContent = detailInfo.pay_succ_explain;
        data.adUrl = detailInfo.pay_succ_pic;
        data.jumpcode = detailInfo.pay_succ_jumpcode;

        if MessageBox.isShowDirect() then
            RechargeSucPop.show(data);
        end

		updatePayStatus();

	elseif 4 == broadType then --新的支付广播接口
		local payMoney = tonumber(detailInfo.gold) or 0; --支付银币
		local cur_money = tonumber(detailInfo.cur_money) or kUserInfoData:getMoney();
       	local cur_diamond = tonumber(detailInfo.diamond) or kUserInfoData:getDiamond();

		kUserInfoData:setMoney(cur_money);
		kUserInfoData:setDiamond(cur_diamond);

        

        local award_gold = 0;
        local award_diamond = 0;
        local award_props = {};

        local privilege = table.verify(detailInfo.privilege);
        if privilege.status then
        	award_gold = award_gold + number.valueOf(privilege.gold, 0);
        	award_diamond = award_diamond + number.valueOf(privilege.diamond, 0);
        	award_props = CombineTables(award_props, table.verify(privilege.props) );
        end

        local bouns = table.verify(detailInfo.bouns);
    	award_gold = award_gold + number.valueOf(bouns.gold, 0);
    	award_diamond = award_diamond + number.valueOf(bouns.diamond, 0);
    	award_props = CombineTables(award_props, table.verify(bouns.props) );

        local desc = string.format("成功购买%s银币", ToolKit.skipMoneyEx2(payMoney) );
        if award_gold > 0 then
        	desc = desc .. string.format(",加赠%s银币", award_gold);
        end

        if award_diamond > 0 then
        	desc = desc .. string.format(",加赠%s钻石", award_diamond);
        end

        for propClassifyId, num in pairs(award_props) do
        	local propInfo = RechargeDataInterface.getInstance():getGoodInfoByTypeId(propClassifyId);
        	if propInfo and propInfo.item_name then
        		desc = desc .. ",加赠".. propInfo.item_name .."x" ..num;
        	end
        end
	      
	    local data = {};
        data.title = detailInfo.pay_succ_tips;         --标题提示信息
        data.rightTitle = "内容说明";
        data.topTips = desc;                             --提示信息
        data.rightContent = detailInfo.pay_succ_explain;
        data.adUrl = detailInfo.pay_succ_pic;
        data.jumpcode = detailInfo.pay_succ_jumpcode;

        if MessageBox.isShowDirect() then
            RechargeSucPop.show(data);
        end

        updatePayStatus();

	elseif 100 == broadType then --代理商年卡
        local cur_money = tonumber(detailInfo.cur_money) or kUserInfoData:getMoney();
        local cur_diamond = tonumber(detailInfo.diamond) or kUserInfoData:getDiamond();

        kUserInfoData:setMoney(cur_money);
        kUserInfoData:setDiamond(cur_diamond);   

        local price = tonumber(detailInfo.price) or 0;
        local bouns = table.verify(detailInfo.bouns);
        award_gold = number.valueOf(bouns.gold, 0);
        award_diamond = number.valueOf(bouns.diamond, 0);
        award_props = table.verify(bouns.props)
    end

    kGoodsListInterface:resetGoodsListUpdateFlag();
	self:notify(GlobalSocketMessageHandler.Delegate.onBroadcastPayMoney, broadType);
	
    local platform = System.getPlatform();
    if platform == kPlatformIOS then
	    NativeEvent.getInstance():closeIosWebPay();
    end
end
-----------------------------------------------------------------------------------------------------------------------------

GlobalSocketMessageHandler.onGetUserVipInfo = function(self,info)
	self:log("onGetUserVipInfo","info = ",info);
	if info then
		for k, v in pairs( table.verify(info.propDetail) ) do
			v.expires = tonumber(v.expires) or 0;
			if v.propsType == PropManager.propTypeMap.TYPE_VIP then  --VIP
				--更新本地数据
				local isPayUser = kUserInfoData:getIsPayUser();
				if v.expires ~= 0 then  --VIP未过期的情况
					local identity = isPayUser and UserInfoData.eIdentity.RmbAndVip or UserInfoData.eIdentity.Vip;
					kUserInfoData:setIdentity(identity);
					kUserInfoData:setVipTime(v.expires);
                    --如果是背包的合成界面则不播放VIP动画
                    local _isCompounding = BackpackDataInterface.getInstance():getIsCompounding();
                    if not _isCompounding then
		                VipAnimManager.getInstance():setIsNeedPlay(true);
                        VipAnimManager.getInstance():playVipAnim();
                    end
				else--过期的情况
					local identity = isPayUser and UserInfoData.eIdentity.Rmb or UserInfoData.eIdentity.Normal;
					kUserInfoData:setIdentity(identity); 
					kUserInfoData:setVipTime(0);
				end
			else
				kPropManager:updatePropNum(v.propsType,v.allowTimes,v.expires);
			end
		end
	end
end

GlobalSocketMessageHandler.onGetUserVipError = function(self,info)
	self:log("onGetUserVipError", "info = ",info);
	local isPayUser = kUserInfoData:getIsPayUser();
	local identity = isPayUser and UserInfoData.eIdentity.Rmb or UserInfoData.eIdentity.Normal;
	kUserInfoData:setIdentity(identity); 
	kUserInfoData:setVipTime(0);
end

--server定时推送过期
GlobalSocketMessageHandler.onGetUserVipExpired = function(self,info)
	self:log("onGetUserVipExpired", "info = ",info);
	local isPayUser = kUserInfoData:getIsPayUser();
	local identity = isPayUser and UserInfoData.eIdentity.Rmb or UserInfoData.eIdentity.Normal;
	kUserInfoData:setIdentity(identity); 
	kUserInfoData:setVipTime(0);
end
---------------------------------------------------------------------------------------------------------------
--php请求超时（server返回的）
GlobalSocketMessageHandler.onPhpRequestTimeout = function(self,packetInfo)
	self:notify(GlobalSocketMessageHandler.Delegate.onPhpRequestTimeout);
end
---------------------------------------------------------------------------------------------------------------
-- 广播房间内使用道具
GlobalSocketMessageHandler.onServerBroadPhpUseProps = function(self,data)
	Log.d("GlobalSocketMessageHandler.onServerBroadPhpUseProps:", os.clock());
	self:notify(GlobalSocketMessageHandler.Delegate.onServerBroadPhpUseProps, data);
end
---------------------------------------------------------------------------------------------------------------
--(只有四国军棋在使用！)
GlobalSocketMessageHandler.onServerBroadRefreshUserInfo = function(self,data)
	Log.d("GlobalSocketMessageHandler.onServerBroadRefreshUserInfo:", "data = ",data);
	local money = number.valueOf(data.money,kUserInfoData:getMoney());
	kUserInfoData:setMoney(money);

	local gameInfo = json.decode(data.gameInfo or "");
	gameInfo = table.verify(gameInfo);

	local gameId = number.valueOf(gameInfo.game_id);
	if gameId > 0 then 
		for k,v in pairs(gameInfo) do 
			if k ~= "game_id" then 
				kUserInfoData:setGameItemValueWithKey(gameId,k,v);
			end 
		end 
		kUserInfoData:refreshGameAllRecord(gameId);
	end 
end

--@brief server推送用户信息 （有可能是牌桌中其他人的信息） 目前只会推送资产类信息
GlobalSocketMessageHandler.onServerPushUserInfo = function(self, data)
    if data.userMid == kUserInfoData:getUserId() then
        --自己
        for k, v in pairs(data.propertyArr) do
            kUserInfoData:setMoneyById(v.propertyId, v.num);
        end
    else
        --其他人
        self:notify(GlobalSocketMessageHandler.Delegate.onServerPushOtherUserInfo, data);
    end 
end


GlobalSocketMessageHandler.onRecivePhpKeepAlive = function(self,isSuccess,info)
	Log.d("GlobalSocketMessageHandler.onRecivePhpKeepAlive","isSuccess = ",isSuccess,"info = ",info);
	if isSuccess and not string.isEmpty(info.ssid) then 
		kUserInfoData:setSsid(info.ssid);
	end 
end

GlobalSocketMessageHandler.onServerBroadVipKick = function(self, data)
    if table.isEmpty(data) then
        return;
    end
    Log.d("GlobalSocketMessageHandler.onServerBroadVipKick",data);

    self:notify(GlobalSocketMessageHandler.Delegate.onServerBroadVipKick, data);

    if data.errorcode == 0 then
        local myMid = kUserInfoData:getUserId();

        if data.vipuid == myMid and data.kickType == 2 then
            --刷新踢人卡
            local kickPropNum = PropManager.getInstance():getPropNumByPropType(PropManager.propTypeMap.TYPE_VIP_KICK);
            PropManager.getInstance():updatePropNum(PropManager.propTypeMap.TYPE_VIP_KICK, kickPropNum - 1);
        end

        --踢人成功
        local strVipOrCard = data.kickType == 1 and "VIP特权" or "踢人卡";
        if data.vipuid ~= myMid then
        	local level = GameManager.getInstance():getLastRoomLevelId();
            data.vipname = GameInfoIsolater.getInstance():checkIsDuringDefenseCheatTime(level) and "玩家" or data.vipname;
            if data.kickuid == myMid then
                local str = string.concat("你被", data.vipname, "用"..strVipOrCard.."请离房间。");
                self:showToast(str);
            else
                local str = string.concat(data.kickname, "被", data.vipname, "用"..strVipOrCard.."踢出房间。");
                self:showToast(str);
            end
        else
            self:showToast(string.concat("您将", data.kickname, "用"..strVipOrCard.."踢出房间"));
        end
    else
        --do nothing
    end
end

GlobalSocketMessageHandler.showToast = function(self,msg)
    if not string.isEmpty(msg) then
        Toast.getInstance():showText(msg,50,30,kAlignLeft,"",24,200,175,110);
    end
end

---------------------------------------------------------------------------------------------------------------
GlobalSocketMessageHandler.s_socketCmdFuncMap = {
    [SOCKET_UPDATE_NET_ICON]           = GlobalSocketMessageHandler.onSocketUpdateNetIcon;
	[SOCKET_FIRST_CONNECTED] 		   = GlobalSocketMessageHandler.onSocketFirstConnected;
	[SOCKET_RECONNECT_ING] 		   	   = GlobalSocketMessageHandler.onSocketReConnecting;
	[SOCKET_RECONNECT_SUCCESS] 		   = GlobalSocketMessageHandler.onSocketReConnected;
	[SOCKET_RECONNECT_FAILED] 		   = GlobalSocketMessageHandler.onSocketReConnectFailed;
	
	[SERVER_REQUEST_RELOGIN] 			= GlobalSocketMessageHandler.onServerRequestReLogin;
	[SERVER_KICK_OUT] 					= GlobalSocketMessageHandler.onServerKickout;
    [PHP_KICK_OUT]                      = GlobalSocketMessageHandler.onPhpKickout;
	[SERVER_MULTI_DEVICE_LOGIN] 		= GlobalSocketMessageHandler.onMultiDeviceLogin;

	[PHP_MSG_TO_CLIENT] 				= GlobalSocketMessageHandler.onPhpPushMessage;
	[PHP_RADIO_TO_CLIENT] 				= GlobalSocketMessageHandler.onReciveBroadcastMessage;

	[SERVER_USER_VIP_INFO]				= GlobalSocketMessageHandler.onGetUserVipInfo;  --VIP
	[SERVER_USER_VIP_ERROR]				= GlobalSocketMessageHandler.onGetUserVipError;
	[SERVER_USER_VIP_EXPIRED] 			= GlobalSocketMessageHandler.onGetUserVipExpired;  
	[PHP_REQUEST_TIMEOUT]				= GlobalSocketMessageHandler.onPhpRequestTimeout;

	[RESPONSE_BROADCAST_PAY_MONEY]	     = GlobalSocketMessageHandler.onBroadcastPayMoney;

	[SERVER_COMMAND_BROAD_PHP_USE_PROPS] = GlobalSocketMessageHandler.onServerBroadPhpUseProps;

	[SERVER_COMMAND_BROAD_REFRESH_USERINFO] = GlobalSocketMessageHandler.onServerBroadRefreshUserInfo;
    [SERVER_COMMAND_VIPKICK_SUCCESS]        = GlobalSocketMessageHandler.onServerBroadVipKick;

	[PHP_KEEPALIVE]						  = GlobalSocketMessageHandler.onRecivePhpKeepAlive;
    [SERVER_COMMAND_PUSH_USERINFO]        = GlobalSocketMessageHandler.onServerPushUserInfo;
};