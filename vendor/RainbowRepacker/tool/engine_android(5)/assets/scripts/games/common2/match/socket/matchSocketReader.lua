require("games/common2/match/socket/matchSocketCmd");

MatchSocketReader = class(CommonSocketReader);

MatchSocketReader.ctor = function(self)
    local name = "MatchSocketReader";
end 

MatchSocketReader.onResponseJionDingjusai = function(self,packetId)
	local info = {};
	info.num = self.m_socket:readShort(packetId, -1);
	info.totalNum = self.m_socket:readShort(packetId, -1);
	info.turnMoney = self.m_socket:readInt(packetId, -1);
	info.totalMoney = self.m_socket:readInt64(packetId, -1);
	info.totalDiamond = self.m_socket:readInt(packetId, -1);
	info.userInfo = table.verify(json.decode(self.m_socket:readString(packetId)));
	info.matchpartitions = self.m_socket:readInt(packetId, -1);
	Log.d("MatchSocketReader.onResponseJionDingjusai B07",info);
	return info;
end

MatchSocketReader.onResponseJionDingjusaiFail = function( self,packetId )
	local errorInfo = {};
		errorInfo.code = self.m_socket:readShort(packetId, -1);
		errorInfo.svid = self.m_socket:readShort(packetId, -1);
        errorInfo.gameId = self.m_socket:readShort(packetId, -1);
        errorInfo.matchId = self.m_socket:readInt(packetId, -1);
	return errorInfo;
end

MatchSocketReader.onResponseUpdatePeoleCount = function(self, packetId)
	local info = {};
	info.num 		= self.m_socket:readShort(packetId, 0);
	info.totalNum 	= self.m_socket:readShort(packetId, 0);
	info.matchpartitions = self.m_socket:readInt(packetId, -1);
	return info;
end

-- 服务器广播聊天内容
MatchSocketReader.onServerSendChatMsg = function(self, packetId)
	local info = {};
	info.msgInfo = self.m_socket:readString(packetId);
	return info;
end

MatchSocketReader.onResponseServerShutup = function(self,packetId)
    local info = {};
	info.msgInfo = self.m_socket:readString(packetId);
	return info;
end
------------------------------------ 定局赛开始 ------------------------------------------------
MatchSocketReader.onResponseMatchDingJuInfo = function(self, packetId)
	-- body
	-- 局数，轮数 ，我的排名，总人数，
	local info = {};
	info.bureauNum = self.m_socket:readShort(packetId, -1);			-- 当前局数
	info.roundNum = self.m_socket:readShort(packetId, -1);			-- 当前轮数
	info.totalPersonNum = self.m_socket:readShort(packetId, 0); --参赛总人数
	info.myRankPos = self.m_socket:readShort(packetId, -1); --本桌排名
	local curMatchCount = self.m_socket:readShort(packetId, 0);
	info.tablePersonCount = curMatchCount; -- 本桌人数
	info.userList = {};
	for i = 1, curMatchCount do
		local tmp = {};
		tmp.mid = self.m_socket:readInt(packetId, -1);
		tmp.score = self.m_socket:readInt(packetId, 0);
		tmp.nick = self.m_socket:readString(packetId) or "";
		table.insert(info.userList, tmp);
	end 
	info.bureauCount = self.m_socket:readShort(packetId, -1);		-- 总局数
	info.roundCount = self.m_socket:readShort(packetId, -1);		-- 总轮数
	info.stage = self.m_socket:readByte(packetId, -1); 				-- 阶段 1:打立出局 2:定局移位 3:定局积分

	info.curPos = self.m_socket:readInt(packetId, 0); --当前排名
	info.totalNum = self.m_socket:readInt(packetId,0);--当前剩余总人数
	return info;
end

MatchSocketReader.onResponseMatchDingJuRoundOver = function(self, packetId)
	-- body
	local info = {};
	info.myRankPos = self.m_socket:readShort(packetId, -1);
	info.myGameState = self.m_socket:readByte(packetId, -1);--是否被淘汰
	info.totalParticipants = self.m_socket:readShort(packetId, 0); -- 总参赛人数

	-- since 1.4.3 by c.mj
	local dalichuju = self.m_socket:readByte(packetId, -1); -- 定局赛阶段标识,必传,值只为1,不知道干嘛用
	
	-- server数据兼容 begin
	self.m_socket:readByte(packetId, -1);
	local roundCount = self.m_socket:readByte(packetId, -1);
	for i = 1, roundCount do 
		self.m_socket:readByte(packetId, -1);
	end
	-- server数据兼容 end

	info.matchStage = self.m_socket:readByte(packetId, -1); -- 1:打立出局 2:定局移位 3:定局积分
	info.myPos = self.m_socket:readByte(packetId, -1) + 1;	-- 玩家所处位置


    info.stageName = self.m_socket:readByte(packetId, -1);
    info.notFinishTable = self.m_socket:readShort(packetId, -1);
    info.rank = self.m_socket:readInt(packetId, -1);
    info.weedOutNum = self.m_socket:readShort(packetId, -1);
    info.promotionNum = self.m_socket:readShort(packetId, -1);
    info.rankList = {};
    local size = self.m_socket:readInt(packetId, -1);
    for i=1, size do
        local tmp = {};
        tmp.rank = self.m_socket:readInt(packetId, -1);
        tmp.score = self.m_socket:readInt(packetId, -1);
        tmp.nick = self.m_socket:readString(packetId);
		if tmp.rank == info.rank then 
			tmp.isMe = 1;
		else 
			tmp.isMe = 0;
		end
        table.insert(info.rankList, tmp);
    end

	info.progressList = {};
	local promotionNumber = self.m_socket:readInt(packetId, -1); -- 打立出局阶段人数
	table.insert(info.progressList, 1, {stage = dalichuju, number = promotionNumber});
	info.roundCount = self.m_socket:readByte(packetId, -1);
	for i = 1, info.roundCount do 
		local number = self.m_socket:readInt(packetId, -1);
		table.insert(info.progressList, 1, {stage = 0, number = number});
	end

	return info;
end
MatchSocketReader.onResponseMatchDingJuMatchOver = function(self, packetId)
	-- body
	--只是通知比赛结束，无内容
	local info = {};
	return info;
end
MatchSocketReader.onResponseMatchDingJuMatchStart = function(self, packetId)
	-- body
	--只是通知比赛开始，无内容
	local info = {};
	return info
end

MatchSocketReader.onResponseMatchDingJuMatchContinue = function(self, packetId)
	-- body
	--只是通知比赛开始，无内容
	local info = {};
	return info
end

MatchSocketReader.onResponseMatchDingJuMatchOverReward = function(self, packetId)
	-- body
	local info = {};
	info.mid = self.m_socket:readShort(packetId, -1);
	info.isReward = self.m_socket:readShort(packetId, -1) == 1;
	info.myRankPos = self.m_socket:readShort(packetId, -1);
	info.totalPersonNum = self.m_socket:readShort(packetId, -3);
	info.reward = {};
	if info.isReward then
		local count = self.m_socket:readByte(packetId, 0);
		for i=1,count do
			local tmp = {};
			tmp.rewardType = self.m_socket:readInt(packetId, 0)
			if tmp.rewardType == 1 then
				tmp.rewardNum = self.m_socket:readInt64(packetId, 0) -- 银币
			elseif tmp.rewardType == 8 or tmp.rewardType == 9 then -- 钻石、大师分
				tmp.rewardNum = self.m_socket:readInt(packetId, 0)
			end
			if tmp.rewardNum > 0 then
				table.insert(info.reward,tmp);
			end
		end
	end
	-- 添加道具读取 by c.mj @ 2015-01-20
	info.propCount = self.m_socket:readShort(packetId, 0); -- 用作更新道具数量
	info.propList = {};
	for i = 1, info.propCount do
		local propInfo = {};
		propInfo.type = self.m_socket:readInt(packetId, -1);
		propInfo.count = self.m_socket:readInt(packetId, 0);

		table.insert(info.propList, propInfo);
	end
	-- since 1.4.3
	info.propCountNew = self.m_socket:readInt(packetId, 0); -- 用作道具奖励
	info.propListNew = {};
	for i = 1, info.propCountNew do 
		local propInfo = {};
		propInfo.propType = self.m_socket:readInt(packetId, -1); -- 奖励道具
		propInfo.propNum = self.m_socket:readInt(packetId, 0); -- 奖励道具数量
		table.insert(info.propListNew, propInfo);
	end

	-- updated by LeoChen @ 2016/01/06 比赛奖励以json格式处理
	-- 格式{"turn_money" : [{ "type" : 0, "value" : 10, "new_type" : 0, "new_value" : 10}, ...], "turn_prop" : [{ "type" : 9, "value" : 10}, ...]};
	local rewardJson = self.m_socket:readString(packetId, ""); 
	info.rewardInfo = json.decode(rewardJson);

	info.matchConfigId = self.m_socket:readString(packetId, "0");
	Log.d("MatchSocketReader.onResponseMatchDingJuMatchOverReward",info);
	return info;
end


MatchSocketReader.onResponseWithDraw = function(self, packetId)
	local info = {};
	info.returnMoney = self.m_socket:readInt(packetId, 0);
	info.totalMoney = self.m_socket:readInt64(packetId, -1);
	info.totalDiamond = self.m_socket:readInt(packetId, -1);
	
	info.hasProp = self.m_socket:readInt(packetId, 0) > 0;
	if info.hasProp then 
		info.type = self.m_socket:readInt(packetId, -1);
		info.count = self.m_socket:readInt(packetId, 0);
	end
	info.userInfo = table.verify(json.decode(self.m_socket:readString(packetId)));
	return info;
end

MatchSocketReader.onResponseWithDrawError = function(self, packetId)
	local info = {};
	info.errorType = self.m_socket:readShort(packetId, 0);
    info.matchId = self.m_socket:readShort(packetId, -1);
    info.gameId = self.m_socket:readShort(packetId, -1);
	info.realMatchId = self.m_socket:readInt(packetId, -1);
	return info
end

MatchSocketReader.onResponseMatchDjReconnect = function(self, packetId)
	-- body
	local info = {};
	-- info.matchState = self:readShort(packetId, -1);
    info.matchId = self.m_socket:readShort(packetId, -1);
    info.gameId = self.m_socket:readShort(packetId, -1);
    info.readMatchId = self.m_socket:readInt(packetId, -1);
    info.gameType = self.m_socket:readShort(packetId, -1);
    info.isPlayIng = self.m_socket:readInt(packetId, 0);
	return info;
end

-- 长时间未开始游戏被踢
MatchSocketReader.onResponseDingJuSaiKickUser = function(self, packetId)
	-- body
	local info = {};
	info.flag = self.m_socket:readByte(packetId, -1);
	info.money  = self.m_socket:readInt64(packetId, 0); -- 银币数量
	info.propList = {}; -- 道具数量

	-- 兼容数据 begin---------------------------------------
	local count = self.m_socket:readByte(packetId, 0);
	for i = 1, count do 
		self.m_socket:readByte(packetId, -1);
		self.m_socket:readByte(packetId, 0);
	end
	-- 兼容数据 end---------------------------------------

	info.userInfo = table.verify(json.decode(self.m_socket:readString(packetId)));
	
	count = self.m_socket:readInt(packetId, 0);
	for i = 1, count do 
		local propInfo = {};
		propInfo.propType = self.m_socket:readInt(packetId, -1);
		propInfo.propNum = self.m_socket:readInt(packetId, 0);
		table.insert(info.propList, propInfo);
	end

	info.matchId = self.m_socket:readInt(packetId, 0);
	return info;
end

------------------------------------ 定局赛结束 ------------------------------------------------

-------------------------------- 定时赛 ------------------------------------
--0x0B47
MatchSocketReader.onResponseDingshiTableInfo = function(self, packetId)
    local info = {};
    info.curPos = self.m_socket:readInt(packetId, -1);
    info.totalNum = self.m_socket:readInt(packetId, -1);

    Log.d("MatchSocketReader.onResponseDingshiTableInfo", info);
    return info;
end

MatchSocketReader.onResponseDingshiStageInfo = function(self, packetId)
    local info = {};
    info.stage = self.m_socket:readByte(packetId, -1);
    info.act = self.m_socket:readByte(packetId, -1);
    Log.d("MatchSocketReader.onResponseDingshiStageInfo", info);
    return info;
end

MatchSocketReader.onResponseDingshiWaitTable = function(self, packetId)
    local info = {};
    return info;
end

MatchSocketReader.onResponseDingshiBaseInfo = function(self, packetId)
    local info = {};
    info.baseScore = self.m_socket:readInt(packetId, -1);
    info.weedOutScore = self.m_socket:readInt(packetId, -1);
    info.isShow = self.m_socket:readInt(packetId, -1); --0就是开局的底注，1就是中间变化的底注
    return info;
end

MatchSocketReader.onResponseDingshiUserPromotion = function(self, packetId)
    local info = {};
    info.stageName = self.m_socket:readByte(packetId, -1);
    info.notFinishTable = self.m_socket:readShort(packetId, -1);
    info.rank = self.m_socket:readInt(packetId, -1);
    info.weedOutNum = self.m_socket:readShort(packetId, -1);
    info.promotionNum = self.m_socket:readShort(packetId, -1);
    info.rankList = {};
    local size = self.m_socket:readInt(packetId, -1);
    for i=1, size do
        local tmp = {};
        tmp.rank = self.m_socket:readInt(packetId, -1);
        tmp.score = self.m_socket:readInt(packetId, -1);
        tmp.nick = self.m_socket:readString(packetId);
		if tmp.rank == info.rank then 
			tmp.isMe = 1;
		else 
			tmp.isMe = 0;
		end
        table.insert(info.rankList, tmp);
    end

    -- since 1.4.3 by c.mj
	local dalichuju = self.m_socket:readByte(packetId, -1); -- 定局赛阶段标识,必传,值只为1,不知道干嘛用

	-- server数据兼容 begin
	self.m_socket:readByte(packetId, -1);
	local roundCount = self.m_socket:readByte(packetId, -1);
	for i = 1, roundCount do 
		self.m_socket:readByte(packetId, -1);
	end
	-- server数据兼容 end

	info.matchStage = self.m_socket:readByte(packetId, -1); -- 1:打立出局 2:定局移位 3:定局积分
	info.myPos = self.m_socket:readByte(packetId, -1) + 1;	-- 玩家所处位置
	info.totalParticipants = self.m_socket:readShort(packetId, -1); -- 总参赛人数

	info.progressList = {};
	local promotionNumber = self.m_socket:readInt(packetId, -1); -- 打立出局阶段人数
	table.insert(info.progressList, 1, {stage = dalichuju, number = promotionNumber});
	info.roundCount = self.m_socket:readByte(packetId, -1);
	for i = 1, info.roundCount do 
		local number = self.m_socket:readInt(packetId, -1);
		table.insert(info.progressList, 1, {stage = 0, number = number});
	end

    return info;
end
-- 阶段信息 since 1.4.3
MatchSocketReader.onBroadcastMatchStageInfo = function ( self, packetId )
	-- body
	local info = {};
	local stageJsonInfo = self.m_socket:readString(packetId, "");
	local daliJsonInfo = self.m_socket:readString(packetId, "");--打立出局阶段信息
	local tmp = json.decode(stageJsonInfo);
	info.stageInfo = {};
	if tmp and table.isTable(tmp) then 
		-- 排序，key为字符串 T_T
		local key_tb = {};
		for k, _ in pairs(tmp) do 
			table.insert(key_tb, k);
		end
		table.sort( key_tb );

		for _, key in pairs(key_tb) do
			local v = tmp[key];
			local stage = {};
			stage.name = Base64.decode(v.name);
			stage.number = number.valueOf(v.number);
			local roundsArr = string.split(v.rounds, ",");
			stage.rounds = roundsArr or {};

			table.insert(info.stageInfo, 1, stage);
		end
	end

	local tmp2 = json.decode(daliJsonInfo);
	if tmp2 and table.isTable(tmp2) then 
		local daliInfo = {};
		daliInfo.TillWeedoutNum = tmp2.TillWeedoutNum;--截止人数
		daliInfo.promotionNum = tmp2.PromotionNum;--晋级人数
		info.daliInfo = daliInfo;
	end 
	Log.d(">>>onBroadcastMatchStageInfo>>>", info);
	return info;
end

MatchSocketReader.onResponseDingshiSignUpState = function(self, packetId) 
	local info = {};
	info.type = self.m_socket:readInt(packetId, -1);
	info.count = self.m_socket:readInt(packetId, -1);
	if info.type ~= 0 then 
		info.extenalMoney = self.m_socket:readInt(packetId, -1);
	end
	info.userInfo = table.verify(json.decode(self.m_socket:readString(packetId)));
	Log.v("MatchSocketReader.onResponseDingshiSignUpState", info);
	return info;
end
-- 比赛开始前N分钟提示进入比赛
MatchSocketReader.onTimeToEnterMatch = function(self, packetId)
	local info = {};
	info.matchId = self.m_socket:readInt(packetId, -1);
	info.matchName = self.m_socket:readString(packetId, "");
	info.min = self.m_socket:readInt(packetId, -1);
	info.startTime = self.m_socket:readInt64(packetId, os.time());
	return info;
end

--b66
MatchSocketReader.onServerBroadcastPlayerScore = function ( self, packetId )
	-- body
	local count = self.m_socket:readInt(packetId, 0);
	local info = {};
	for i = 1, count do 
		local player = {};
		player.mid = self.m_socket:readInt(packetId, -1);
		player.score = self.m_socket:readInt(packetId, 0);

		table.insert(info, player);
	end
	Log.v("MatchSocketReader.onServerBroadcastPlayerScore", info);
	return info;
end

---------------------------------------- 复活赛 --------------------------------------------
MatchSocketReader.onReviveNotify = function(self, packetId)
	local reviveInfoJson = self.m_socket:readString(packetId, 0);
	local reviveInfo = table.verify(json.decode(reviveInfoJson));
	
	-- max_count:最大可复活字数
	-- time:复活等待时间
	-- prop_list:复活所需要的物品列表
	-- { 
	-- prop_type:复活所需要的物品类型
	-- need_count:复活所需要的物品数量
	-- }
	-- index:当前第几次破产
	-- rank:还剩下多少用户
	-- score:复活最低会有多少积分
	local info = {
		max_count = number.valueOf(reviveInfo.max_count, 0),
		time = number.valueOf(reviveInfo.time, 0),
		index = number.valueOf(reviveInfo.index, 0),
		rank = number.valueOf(reviveInfo.rank, 0),
		score = number.valueOf(reviveInfo.score, 0),
		prop_list = {},
	};

	for k, v in pairs(table.verify(reviveInfo.prop_list)) do
		local item = {
			prop_type = number.valueOf(v.prop_type, 0),
			need_count = number.valueOf(v.need_count, 0),
		};
		table.insert(info.prop_list, item);
	end

	Log.d("MatchSocketReader.onReviveNotify", "info", info);
	return info;
end

MatchSocketReader.onReviveResponse = function(self, packetId)
	local reviveInfoJson = self.m_socket:readString(packetId, 0);
	local reviveInfo = table.verify(json.decode(reviveInfoJson));
	
	-- ret:客户端请求复活结果（如果为非0，,下面的参数请忽略，返回ret不为0的情况要么是服务端抽风要不就是客户端抽风了）
	-- stage:当前比赛所在阶段（100%在打立阶段）
	-- rank:当前排名
	-- score:当前积分
	-- total:总人数
	-- prop_type:物品类型

	-- ret:无法复活的原因
	-- limit:限制（如果ret是道具数量不足:该字段表示需要多少张复活卡 如果是复活人数限制：该字段表示复活人数限制 如果是复活次数限制：该字段表示可以复活最多次数）
	-- now:目前是个什么情况（如果ret是道具数量不足:该字段表示玩家有多少张复活卡 如果是复活人数限制：该字段目前有多少玩家 如果是复活次数限制：该字段表示用户已经复活的次数）
	local info = {
		ret = number.valueOf(reviveInfo.ret, -1),
		stage = number.valueOf(reviveInfo.stage, 0),
		rank = number.valueOf(reviveInfo.rank, 0),
		score = number.valueOf(reviveInfo.score, 0),
		total = number.valueOf(reviveInfo.total, 0),
		limit = number.valueOf(reviveInfo.limit, 0),
		now = number.valueOf(reviveInfo.now, 0),
		prop_type = number.valueOf(reviveInfo.prop_type, 0),
        prop_list = {},
	};

    for k, v in pairs(table.verify(reviveInfo.prop_list)) do
		local item = {
			prop_type = number.valueOf(v.prop_type, 0),
			need_count = number.valueOf(v.need_count, 0),
		};
		table.insert(info.prop_list, item);
	end

	Log.d("MatchSocketReader.onReviveResponse", "info", info);
	return info;
end

MatchSocketReader.onResponseRankDetail = function(self, packetId)
    local info = {};
    local errorType = self.m_socket:readInt(packetId,-1);--0:成功;不为0失败
    info.myRankDetail = {};
    if errorType == 0 then 
    	local data = {};
    	data.rank = self.m_socket:readInt(packetId,0);
    	data.score = self.m_socket:readInt(packetId,0);
    	data.name = self.m_socket:readString(packetId,0);
    	info.myRankDetail = data;
    end 
    info.rankCount = self.m_socket:readInt(packetId,0);
    info.rankDetail = {};
    for i = 1,info.rankCount do 
    	local data = {};
    	data.rank = self.m_socket:readInt(packetId,0);
    	data.score = self.m_socket:readInt(packetId,0);
    	data.name = self.m_socket:readString(packetId,0);
    	info.rankDetail[i] = data;
   	end 

   	info.canOnlookerCount = 0;

   	local rankCount = self.m_socket:readInt(packetId,0);
   	local tmp = {};
   	for i = 1,rankCount do   
   		local data = {};		
   		data.userId = self.m_socket:readInt(packetId,0);
   		data.rank = self.m_socket:readInt(packetId,0); 		
   		data.canOnlooker = self.m_socket:readByte(packetId,0) == 1;--0:不能被围观，1可以被围观

   		if data.canOnlooker then 
   			info.canOnlookerCount = info.canOnlookerCount + 1;
   		end 

   		if info.rankDetail[i] and info.rankDetail[i].rank == data.rank then 
   			info.rankDetail[i].userId = data.userId;
   			info.rankDetail[i].canOnlooker = data.canOnlooker;
   		else 
   			table.insert(tmp,data);
   		end 
   	end  

   	info.totalNum = self.m_socket:readInt(packetId,0);--当前剩余总人数

   	if #tmp > 0 then 
   		for k,v in pairs(info.rankDetail) do 
   			if v.canOnlooker == nil then 
   				local key;
   				for kk, vv in pairs(tmp) do 
   					if vv.rank == v.rank then 
   						key = kk;
   						v.userId = vv.userId;
   						v.canOnlooker = vv.canOnlooker;
   						break;
   					end 
   				end 

   				if key then 
   					table.remove(tmp,key);
   				end 
   			end 
   		end 
   	end 

    Log.d("MatchSocketReader.onResponseRankDetail 0x0B76", info);
    return info;
end

MatchSocketReader.onResponseRule = function(self,packetId)
	local info = {
		stageCurrent = self.m_socket:readByte(packetId, -1); -- 阶段 1:打立出局 2:定局移位 3:定局积分
	};
	if info.stageCurrent == 1 then
		info.promotionNumCurrent = self.m_socket:readInt(packetId, -1); -- 晋级人数
		info.TillWeedoutNumCurrent = self.m_socket:readInt(packetId, -1); -- 淘汰截止人数
	else
		info.promotionNumCurrent = self.m_socket:readInt(packetId, -1); -- 晋级人数
	end

	info.stageNext = self.m_socket:readInt(packetId, -1); -- 阶段 1:打立出局 2:定局移位 3:定局积分
	info.roundNumNext = self.m_socket:readByte(packetId, -1); -- 轮数
	info.bureauNumNext = self.m_socket:readInt(packetId, -1); -- 局数

	return info;
end

MatchSocketReader.onServerBroadcastEnterOnlooker = function(self,packetId)
	local info = self:onResponseMatchDjReconnect(packetId);
	Log.d("MatchSocketReader.onServerBroadcastEnterOnlooker","info = ",info);
	return info;
end

MatchSocketReader.onResponseGroupInfo = function(self, packetId)
	local info = {
		groupId = self.m_socket:readInt(packetId, -1);
	}
	return info;
end

MatchSocketReader.s_severCmdFunMap = {
	[MatchSocketCmd.MATCH_DINGJU_RESPONSE_SIGHUP]   = MatchSocketReader.onResponseJionDingjusai;          --定局赛报名成功
    [MatchSocketCmd.MATCH_DINGJU_RESPONSE_SIGHUP_FAIL] = MatchSocketReader.onResponseJionDingjusaiFail;   ---报名失败
    [MatchSocketCmd.MATCH_DINGJU_MATCH_UPDATEPEOPLE_RESPONSE] 	= MatchSocketReader.onResponseUpdatePeoleCount;
    [MatchSocketCmd.SERVER_CMD_SEND_CHAT_MSG]				   = MatchSocketReader.onServerSendChatMsg;
    [MatchSocketCmd.SERVER_CMD_USER_SHUTUP]                   = MatchSocketReader.onResponseServerShutup;

    --定局赛指令开始
    [MatchSocketCmd.MATCH_DINGJU_ROOM_INFO_RESPONSE] = MatchSocketReader.onResponseMatchDingJuInfo;
	[MatchSocketCmd.MATCH_DINGJU_ROUND_OVER_RESPONSE] = MatchSocketReader.onResponseMatchDingJuRoundOver;
	[MatchSocketCmd.MATCH_DINGJU_MATCH_OVER_RESPONSE] = MatchSocketReader.onResponseMatchDingJuMatchOver;
	[MatchSocketCmd.MATCH_DINGJU_MATCH_START_RESPONSE] = MatchSocketReader.onResponseMatchDingJuMatchStart;
	[MatchSocketCmd.MATCH_DINGJU_MATCH_CONTINUE_RESPONSE] = MatchSocketReader.onResponseMatchDingJuMatchContinue;
	[MatchSocketCmd.MATCH_DINGJU_MATCH_OVER_REWARD] = MatchSocketReader.onResponseMatchDingJuMatchOverReward;

    
    
	[MatchSocketCmd.MATCH_DINGJU_MATCH_WITHDRAW_RESPONSE] 		= MatchSocketReader.onResponseWithDraw;
	[MatchSocketCmd.MATCH_DINGJU_MATCH_WITHDRAW_ERROR_RESPONSE] 		= MatchSocketReader.onResponseWithDrawError;

    [MatchSocketCmd.MATCH_DINGJU_MATCH_RECONNECT_RESPONSE] = MatchSocketReader.onResponseMatchDjReconnect;

    [MatchSocketCmd.SERVER_CMD_LONG_TIME_NOT_START_KICK_USER] = MatchSocketReader.onResponseDingJuSaiKickUser;
	
    --定局赛指令结束

	---------------------------------------- 定时赛 ------------------------------------------------
	[MatchSocketCmd.MATCH_DINGSHI_ROOM_BROADCAST_TABLE_INFO]    = MatchSocketReader.onResponseDingshiTableInfo;
	[MatchSocketCmd.MATCH_DINGSHI_ROOM_BROADCAST_STAGE_INFO]    = MatchSocketReader.onResponseDingshiStageInfo;
	[MatchSocketCmd.MATCH_DINGSHI_ROOM_BROADCAST_WAIT_TABLE]    = MatchSocketReader.onResponseDingshiWaitTable;
	[MatchSocketCmd.MATCH_DINGSHI_ROOM_BROADCAST_BASE_INFO]     = MatchSocketReader.onResponseDingshiBaseInfo;
	[MatchSocketCmd.MATCH_DINGSHI_ROOM_USER_PROMOTION ]         = MatchSocketReader.onResponseDingshiUserPromotion;

	[MatchSocketCmd.MATCH_XIANSHI_RESPONSE_SIGHUP] 				= MatchSocketReader.onResponseDingshiSignUpState;
	[MatchSocketCmd.TIME_TO_ENTER_MATCH]						= MatchSocketReader.onTimeToEnterMatch;
	[MatchSocketCmd.BROADCAST_PLAYER_SCORE]						= MatchSocketReader.onServerBroadcastPlayerScore;
	[MatchSocketCmd.BROADCAST_MATCH_STAGE_INFO]					= MatchSocketReader.onBroadcastMatchStageInfo;

	---------------------------------------- 复活赛 --------------------------------------------
	[MatchSocketCmd.MATCH_REVIVE_NOTIFY] = MatchSocketReader.onReviveNotify;
	[MatchSocketCmd.MATCH_REVIVE_RESPONSE] = MatchSocketReader.onReviveResponse;

	[MatchSocketCmd.MATCH_RANK_DETAIL_RESPONSE] = MatchSocketReader.onResponseRankDetail;
	[MatchSocketCmd.MATCH_RULE_RESPONSE] = MatchSocketReader.onResponseRule;

	-----------------------------------------围观---------------------------------------------------
	[MatchSocketCmd.S_BROADCAST_ENTER_ONLOOKER] = MatchSocketReader.onServerBroadcastEnterOnlooker;

	[MatchSocketCmd.MATCH_GROUP_INFO_RESPONSE] = MatchSocketReader.onResponseGroupInfo;
};
