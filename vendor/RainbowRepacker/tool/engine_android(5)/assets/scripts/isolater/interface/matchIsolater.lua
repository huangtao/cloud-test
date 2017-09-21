require("gameData/dataInterfaceBase");
require("hall/matchHall/gameMatchHall/data/matchHallDataInterface");
require("hall/matchHall/gameMatchHall/data/matchRecordDataInterface");

--[[
	比赛信息中间层
--]]
MatchIsolater = class(DataInterfaceBase);

MatchIsolater.Delegate = {

	-- 比赛列表
	onGetMatchList					= "onGetMatchList";
	onResponseMatchDetail			= "onResponseMatchDetail";
	onResponseMatchBasicInfo		= "onResponseMatchBasicInfo";
	-- 报名
	onSignupMatchSuccess			= "onSignupMatchSuccess";
	onUpdateMatchState				= "onUpdateMatchState";
	onSignupMatchFailed				= "onSignupMatchFailed";
	onTimeToEnterMatch				= "onTimeToEnterMatch";
	-- 退赛
	onExitMatchSuccess				= "onExitMatchSuccess";
	onExitMatchFailed				= "onExitMatchFailed";
	-- 邀请好友
	onGetFriendInviteList			= "onGetFriendInviteList";
	-- 等待界面
	onRefreshMatchWatingTime		= "onRefreshMatchWatingTime";

	onMatchReconnected				= "onMatchReconnected";
};

MatchIsolater.getInstance = function (	)
	if not MatchIsolater.s_instance then 
		MatchIsolater.s_instance = new (MatchIsolater);
	end
	return MatchIsolater.s_instance;
end

MatchIsolater.ctor = function ( self )
	MatchHallDataInterface.getInstance():setObserver(self);
end

MatchIsolater.dtor = function ( self )
	MatchHallDataInterface.getInstance():clearObserver(self);
end

--[[
	@brief 设置当前比赛详情
	@param matchData (table) 比赛详情
--]]
MatchIsolater.setMatchData = function ( self, matchData )
	MatchHallDataInterface.getInstance():setMatchData(matchData or {});
end

--[[
	@brief 获取当前比赛详情
	@return (table) 比赛详情
--]]
MatchIsolater.getMatchData = function ( self )
	return MatchHallDataInterface.getInstance():getMatchData();
end

--[[
	@brief 设置当前比赛类型
	@param matchType (number) 比赛类型
		GameConstant.NORMAL_IMMEDIATE_MATCH		= 0		快速赛
		GameConstant.FIXED_TIME_MATCH			= 3		定时赛
--]]
MatchIsolater.setCurMatchType = function ( self, matchType )
	MatchHallDataInterface.getInstance():setCurMatchType(matchType);
end

--[[
	@brief 获取当前比赛类型
	@return (number) 比赛类型
		GameConstant.NORMAL_IMMEDIATE_MATCH		= 0		快速赛
		GameConstant.FIXED_TIME_MATCH			= 3		定时赛
--]]
MatchIsolater.getCurMatchType = function ( self )
	return MatchHallDataInterface.getInstance():getCurMatchType();
end

--[[
	@brief 设置当前比赛状态
	@param status (number) 比赛状态
		1		报名成功等待界面
		2		轮结束等待界面
		3		比赛游戏结束
		4		游戏中
		5		无状态
--]]
MatchIsolater.setMatchStatus = function ( self, status )
	MatchHallDataInterface.getInstance():setMatchStatus(status);
end

--[[
	@brief 获取当前比赛状态
	@return (number) 比赛状态
		1		报名成功等待界面
		2		轮结束等待界面
		3		比赛游戏结束
		4		游戏中
		5		无状态
--]]
MatchIsolater.getMatchStatus = function ( self )
	return MatchHallDataInterface.getInstance():getMatchStatus();
end

--[[
    @brief 当前比赛是否支持举报
    @return boolean
--]]
MatchIsolater.getCurMatchIsSupportReport = function(self)
	return MatchHallDataInterface.getInstance():getCurMatchIsSupportReport();
end

--[[
	@brief 设置报名比赛id
	@param matchId (number) 比赛id
	@note 设置该值，进入比赛列表时，会自动报名该比赛。用完请赋值nil
--]]
MatchIsolater.setSignMatchId = function ( self, matchId )
	MatchHallDataInterface.getInstance():setSignMatchId(matchId);
end

--[[
	@brief 获取报名比赛id
	@return (number) 比赛id
--]]
MatchIsolater.getSignMatchId = function ( self )
	return MatchHallDataInterface.getInstance():getSignMatchId();
end

--[[
	@brief 设置比赛跳转信息
	@param jumpInfo (table) 比赛跳转信息
--]]
MatchIsolater.setMatchJumpInfo = function(self, jumpInfo)
	MatchHallDataInterface.getInstance():setMatchJumpInfo(jumpInfo)
end

--[[
	@brief 获取比赛跳转信息
	@return (table) 比赛跳转信息
--]]
MatchIsolater.getMatchJumpInfo = function(self)
	return MatchHallDataInterface.getInstance():getMatchJumpInfo()
end

--[[
	@brief 设置是否从房间接收广播进入比赛
	@param flag (boolean) true为是，false为否
--]]
MatchIsolater.setIsRoomToMatch = function(self, flag)
	MatchHallDataInterface.getInstance():setIsRoomToMatch(flag);
end

--[[
	@brief 获取是否从房间接收广播进入比赛
	@return (boolean) 是否从房间接收广播进入比赛, true为是，false为否
--]]
MatchIsolater.getIsRoomToMatch = function(self)
	return MatchHallDataInterface.getInstance():getIsRoomToMatch();
end

--[[
	@brief	设置比赛列表过滤的游戏id（用作房间列表往比赛列表跳转）
	@param gameId (number) 游戏id
--]]
MatchIsolater.setFilterGameId = function (self, gameId)
	MatchHallDataInterface.getInstance():setFilterGameId(gameId);
end

--[[
	@brief 获取比赛列表过滤的游戏id
	@return (number) 游戏id
--]]
MatchIsolater.getFilterGameId = function (self)
	return MatchHallDataInterface.getInstance():getFilterGameId();
end

--[[
	@brief 设置比赛分享模板，弃用
	@param template (table) 分享模板
--]]
MatchIsolater.setShareTemplate = function ( self, template )
	-- do nothing
end

--[[
	@brief 获取比赛分享模板
	@return	 (table) 分享模板  主要用于比赛分享 + 子游戏分享
		t = {
			[key] = {
				share_icon	分享Icon
				share_url	分享url
				desc		分享内容
			}
		}

		key --> eg: match_win、match_failed、game_win、game_failed、free_failed 等等
--]]
MatchIsolater.getShareTemplate = function ( self )
	return MatchHallDataInterface.getInstance():getShareTemplate();
end

--[[
	@brief 设置下一场比赛的类型，比赛结束报名下一场的时候用
	@param type (number) 比赛类型
		GameConstant.NORMAL_IMMEDIATE_MATCH		= 0		快速赛
		GameConstant.FIXED_TIME_MATCH			= 3		定时赛
--]]
MatchIsolater.setNextMatchType = function ( self, type) 
	MatchHallDataInterface.getInstance():setNextMatchType(type);
end

--[[
	@brief 获取下一场比赛类型
	@return (number) 比赛类型
		GameConstant.NORMAL_IMMEDIATE_MATCH		= 0		快速赛
		GameConstant.FIXED_TIME_MATCH			= 3		定时赛
--]]
MatchIsolater.getNextMatchType = function ( self )
	return MatchHallDataInterface.getInstance():getNextMatchType();
end

--[[
	@brief 设置比赛缓存的玩家分数信息
	@param info (table) 玩家分数信息
		info = {
			[1] = {
				mid			玩家mid
				score		玩家分数
			},
			...
		}
--]]
MatchIsolater.setMatchScoreInfo = function ( self, info )
	MatchHallDataInterface.getInstance():setMatchScoreInfo(info);
end

--[[
	@brief 获取比赛缓存的玩家分数信息
	@return (table) 玩家分数信息
		t = {
			[1] = {
				mid			玩家mid
				score		玩家分数
			},
			...
		}
--]]
MatchIsolater.getMatchScoreInfo = function (self) 
	return MatchHallDataInterface.getInstance():getMatchScoreInfo();
end

--[[
	@brief 设置比赛阶段信息
	@param info (table) 比赛阶段信息
		info = {
			stageInfo = {
				[1] = {
					name			阶段名称
					number			晋级人数
					rounds = {		阶段包含轮数
						1,2,3,...
					}
				},
				...
			}
			daliInfo = {
				TillWeedoutNum		截止人数
				promotionNum		晋级人数
			}
		}
--]]
MatchIsolater.setMatchStageInfo = function ( self, info)
	MatchHallDataInterface.getInstance():setMatchStageInfo(info);
end

--[[
	@brief 获取比赛阶段信息
	@return (table) 比赛阶段信息
		info = {
			stageInfo = {
				[1] = {
					name			阶段名称
					number			晋级人数
					rounds = {		阶段包含轮数
						1,2,3,...
					}
				},
				...
			}
			daliInfo = {
				TillWeedoutNum		截止人数
				promotionNum		晋级人数
			}
		}
--]]
MatchIsolater.getMatchStageInfo = function ( self )
	return MatchHallDataInterface.getInstance():getMatchStageInfo();
end

--[[
	@note 兼容旧接口，不要再调用此接口
--]]
MatchIsolater.getClosestDSMatch = function	( self, matchType, gameId )
	return self:getClosestMatchCanSiginup({type = matchType, gameid = gameId});
end

--[[
	@brief 获取最近一场定时赛，报名下一场用
	@param data (table) 比赛数据
--]]
MatchIsolater.getClosestMatchCanSiginup = function	( self, data )
	return MatchHallDataInterface.getInstance():getClosestMatchCanSiginup(data);
end

--[[
	@brief 根据比赛ID判断是否为邀请赛
	@param matchId (number) 比赛ID
--]]
MatchIsolater.checkInvitationalById = function	( self, matchId)
	return MatchHallDataInterface.getInstance():checkInvitationalById(matchId);
end

--[[
	@brief 设置比赛是否刚开始
	@param flag (boolean) true为是，false为否
--]]
MatchIsolater.setIsJustStart = function ( self, flag ) 
	MatchHallDataInterface.getInstance():setIsJustStart(flag);
end

--[[
	@brief 获取比赛是否刚开始
	@return (boolean) true为是，false为否
--]]
MatchIsolater.getIsJustStart = function ( self )
	return MatchHallDataInterface.getInstance():getIsJustStart();
end

-- ==========================比赛大厅 begin====================================
--[[
	@brief 报名比赛
	@param matchInfo (table) 比赛数据，即比赛列表数据项
--]]
MatchIsolater.signupMatch = function ( self, matchInfo )
	MatchHallDataInterface.getInstance():signupMatch(matchInfo);
end

--[[
	@brief 报名成功回调，直接进入等待界面
	@param info (table) 报名成功返回数据
		info = {
			num					当前报名人数
			totalNum			最低报名人数
			turnMoney			银币变化
			totalMoney			总银币
			totalDiamond		总钻石
			userInfo			用户当前信息(json格式，银币钻石水晶数量更新尽量用此字段，方便以后扩展)
		}
--]]
MatchIsolater.onSignupMatchSuccess = function ( self, info )
	self:notify(MatchIsolater.Delegate.onSignupMatchSuccess, info);
end

--[[
	@brief 报名成功，未进入等待界面
	@param info (table) 报名成功返回数据
		info = {
			type				物品类型
			count				物品数量
			extenalMoney		玩家银币(组合报名相关字段，已无用)
			userInfo			用户当前信息(json格式，银币钻石水晶数量更新尽量用此字段，方便以后扩展)
		}
--]]
MatchIsolater.onUpdateMatchState = function ( self, info )
	self:notify(MatchIsolater.Delegate.onUpdateMatchState, info);
end

--[[
	@brief 报名失败
	@param info (table) 报名失败返回数据
		info = {
			code				错误码
			matchId				比赛id
			gameId				游戏id
		}
		
		错误码
		MatchHallDataInterface.FATAL_ERROR			= 0		服务器内部异常
		MatchHallDataInterface.MATCH_NOT_EXSITS		= 1		比赛信息错误
		MatchHallDataInterface.NOT_ENOUGH_ENTRY_FEE = 2		银币小于报名费用
		MatchHallDataInterface.MATH_IS_PLAYING		= 3		比赛已经开始且不属于重连
		MatchHallDataInterface.ALREADY_SIGN_UP		= 4		玩家已經報名
		MatchHallDataInterface.NOT_REACH_TIME		= 5		没到时间
		MatchHallDataInterface.SIGN_UP_ERROR		= 6		收到该错误码时，啥都不用处理
		MatchHallDataInterface.MATCH_OVER_MAX_USER	= 7		超过比赛报名最大人数
--]]
MatchIsolater.onSignupMatchFailed = function ( self, info )
	self:notify(MatchIsolater.Delegate.onSignupMatchFailed, info);
end

--[[
	@brief 够钟比赛，允许进入等待界面
	@param info (table) 返回数据
		info = {
			matchId				比赛id
			matchName			比赛名称
			min					提前几分钟入场
			startTime			命令接收时间
		}
--]]
MatchIsolater.onTimeToEnterMatch = function (self, data) 
	self:notify(MatchIsolater.Delegate.onTimeToEnterMatch, data);
end

--[[
	@brief 请求退赛
	@param data (table) 比赛数据，即比赛列表数据项
--]]
MatchIsolater.requestExitMatch = function ( self, data )
	MatchHallDataInterface.getInstance():requestExitMatch(data);
end

--[[
	@brief 请求退赛成功
	@param matchInfo (table) 比赛数据，即比赛列表数据项
	@param packetInfo (table) 返回数据
		info = {
			returnMoney		退还银币
			totalMoney		总银币
			totalDiamond	总钻石
			hasProp			是否有道具
			type			道具类型，hasProp为true时存在
			count			道具数量，hasProp为true时存在
			userInfo		用户当前信息(json格式，银币钻石水晶数量更新尽量用此字段，方便以后扩展)
		}
	@param flag (boolean) 无用，必为true
--]]
MatchIsolater.onExitMatchSuccess = function ( self, matchInfo, packetInfo, flag )
	self:notify(MatchIsolater.Delegate.onExitMatchSuccess, matchInfo, packetInfo, flag);
end

--[[
	@brief 请求退赛失败
	@param info (table) 返回数据
		info = {
			errorType		错误码
			matchId			比赛id，与客户端无关
			gameId			游戏id
			realMatchId		比赛id
		}

		错误码
		0	游戏已经开始，而且该玩家处理比赛中，退出失败
		1	该玩家未报名或者已经被淘汰，退出成功（不退报名费）
		2	其他错误原因，退出成功（不退还报名费）
		3	用户不存在
		4	比赛即将开始，不允许退赛
--]]
MatchIsolater.onExitMatchFailed = function ( self,info)
	self:notify(MatchIsolater.Delegate.onExitMatchFailed,info);
end

--[[
	@brief 比赛重连
	@param info (table) 返回数据
		info = {
			matchId			比赛id，与客户端无关
			gameId			游戏id
			readMatchId		比赛id
			gameType		游戏类型
			isPlayIng		是否在玩牌中
		}
--]]
MatchIsolater.onMatchReconnected = function(self,info)
	self:notify(MatchIsolater.Delegate.onMatchReconnected,info);
end

--[[
	@brief 请求比赛列表
	@return (table) 比赛列表
		t = {
			[1] = {
				requestnum			最低开赛人数
				type				比赛类型（0:快速赛，3:定时赛）
				mname				比赛名称
				id					比赛id
				gameid				游戏id
				allowwaittime		允许提前进入时间
				micon				比赛icon
				iconweight			比赛icon权重，从小到大优先级
				applynum			报名人数
				allapplynum			报名总人数 带上了机器人人数
				matchpartitions		分场
				fee = {				报名费，为空则免费报名
					[1] = {				列表项
						type				类型
						num					数量
						desc				描述
						index 				序号
					},
					...
				}
				status				比赛状态
				champion			冠军奖励信息
				stime				开始时间
				etime				结束时间
				isfhmatch			是否复活赛
				configid			比赛配置ID
				looptype			比赛循环周期 1:单场 2:多场
				loopinterval		比赛循环间隔(单位为分钟)
				loopendtime			比赛循环截至时间(一天多场)
				firstbegintime		首次开赛时间，用于循环赛显示
				rewardUrl			比赛奖励图
				rewardDescribe		比赛奖励描述
				matchtags = {		比赛标签(用于筛选)
					1,2,3,...			标签id
				}
				invitetype		邀请赛类型 0：邀请赛 1：集团赛			
				matchentrycode		比赛验证码
				matchentryinfo		比赛验证码获取方式
				advicon				比赛运营icon
				adIcon 				广告图
				listSort 			列表排序ID，从1开始，0或空最后
				threshold 			报名门槛 0为不设置
				thresholdType 		报名门槛类型 0：金币（银币） 1：金条
			},
			...
		}

		比赛状态
		GameConstant.NOT_SIGN_UP				= 0		未报名
		GameConstant.HAVE_SIGN_UP				= 1		已报名/已报名未开赛
		GameConstant.ALLOW_JOIN_IN				= 2		允许进入
		GameConstant.MATCH_HAVE_START			= 3		比赛已经开始
		GameConstant.SIGN_UP_AND_ALLOW_JOIN_IN	= 4		报名并且比赛可以进入
		GameConstant.SIGN_UP_BUT_HAVE_START		= 5		报名但比赛已经开始
--]]
MatchIsolater.requestMatchList = function ( self )
	return MatchHallDataInterface.getInstance():requestMatchList();
end

--[[
	@brief 请求比赛列表回调
	@param info (table) 比赛列表
--]]
MatchIsolater.onGetMatchList = function ( self, info)
	self:notify(MatchIsolater.Delegate.onGetMatchList, info);
end

--[[
	@brief 请求比赛详细信息
	@param matchId (number) 比赛id
--]]
MatchIsolater.requestMatchDetail = function ( self, matchId, groupId)
	MatchHallDataInterface.getInstance():requestMatchDetail(number.valueOf(matchId), groupId);
end

--[[
	@brief 请求比赛详细信息回调
	@param info (table) 比赛详细信息
		info = {			
			matchid					比赛id
			desc					规则描述
			awardcount				比赛奖励数量
			estimateduration		预估比赛时长(分钟)
			
			awardsmap = {			奖励映射
				"","",..
			}
			icon = {				奖励图片列表
				["1"] = "",				图片url
				["2"] = "",
				...
			}
			award = {				奖励列表
				[1] = {					列表项
					rank					排名描述
					sort					排名
					desc					奖励描述
				},
				...
			}
		}
--]]
MatchIsolater.onResponseMatchDetail = function ( self, info,matchId )
	self:notify(MatchIsolater.Delegate.onResponseMatchDetail, info,matchId);
end

--[[
	@brief 清空比赛详情
	@param matchId (number) 比赛id
--]]
MatchIsolater.cleanMatchDetailByMatchId = function(self, matchId)
   MatchHallDataInterface.getInstance():cleanMatchDetailByMatchId(matchId);
end

--[[
	@brief 请求比赛基础信息
	@param matchId (number) 比赛id
--]]
MatchIsolater.requestMatchBasicInfo = function ( self, matchId )
	MatchHallDataInterface.getInstance():requestMatchBasicInfo(matchId);
end 
--[[
	@brief 请求比赛基础信息回调
	@param info (table) 比赛数据，即比赛列表数据项
--]]
MatchIsolater.onResponseMatchBasicInfo = function ( self, info )
	self:notify(MatchIsolater.Delegate.onResponseMatchBasicInfo, info);
end

--[[
	@brief 请求好友列表
--]]
MatchIsolater.requestFriendInviteList = function ( self )
	MatchHallDataInterface.getInstance():requestFriendInviteList();
end

--[[
	@brief 请求好友列表回调
	@param info (table) 好友列表
		info = {
			[1] = {
				nick	昵称
				mid		mid
				cid		cid
			},
			...
		}
--]]
MatchIsolater.onGetFriendsInviteList = function ( self, info )
	self:notify(MatchIsolater.Delegate.onGetFriendInviteList, info);
end

-- 请求邀请好友
--[[
	@brief 请求邀请好友
	@param cidList (table) cid列表
		cidList = {
			[1] = {			
				cid			被邀请cid
			},
			...
		}
	@param param (table) 邀请数据
		param = {
			mid				邀请方mid
			nick			邀请方昵称
			sendtime		发送时间
			match_id		比赛id
			match_name		比赛名称
			match_entyfee	比赛报名费("报名费1,报名费2,...")
			match_ccsq		兼容老版本
			match_coin		兼容老版本
		}
--]]
MatchIsolater.requestInviteFriends = function ( self, cidList, param )
	MatchHallDataInterface.getInstance():requestInviteFriends(cidList, param);
end

--[[
	@brief 刷新等待界面倒计时，CommonGameController.onResume调用
--]]
MatchIsolater.onRefreshMatchWatingTime = function (self)
	self:notify(MatchIsolater.Delegate.onRefreshMatchWatingTime);
end

-- ==========================比赛大厅 end  ====================================


-- ========================== 大师分 begin ====================================
--[[
	@brief 获取玩家大师分
	@return (number) 玩家大师分
--]]
MatchIsolater.getMyMasterPoint = function ( self )
	return MatchRecordDataInterface.getInstance():getMyMasterPoint();
end

--[[
	@brief 更新玩家大师分
	@param masterpoint (number) 玩家大师分
--]]
MatchIsolater.setMyMasterPoint = function ( self, masterpoint )
	MatchRecordDataInterface.getInstance():setMyMasterPoint(masterpoint);
end

-- ========================== 大师分 end	====================================

-- ============================ 分享 begin ====================================
--[[
	@brief 设置比赛结算时分享图片
	@param matchconfigid (number) 比赛配置id
	@param shareImagePath (string) 下载后的图片路径
--]]
MatchIsolater.setMatchOverShareImageInfo = function(self, matchconfigid, shareImagePath)
	self.m_matchOverShareImageInfo = {
		matchconfigid = matchconfigid;
		shareImagePath = shareImagePath;
	};
end

--[[
	@brief 判断图片是否下载完成了 
	@param matchconfigid (number) 比赛配置id
	@return (boolean) 是否下载完成
	@return	(string) 图片地址，如果不为""，则代表下载成功，如果为"", 则代表下载失败。
--]]
MatchIsolater.isShareImageDownloadFinish = function(self, matchconfigid)
	if string.isEmpty(matchconfigid) then
		return true, ""; --如果configId为"",则认为下载失败
	elseif not table.isEmpty(self.m_matchOverShareImageInfo) and self.m_matchOverShareImageInfo.matchconfigid == matchconfigid then
		return true, self.m_matchOverShareImageInfo.shareImagePath;
	else
		return false;
	end
end

-- ============================ 分享 end ====================================

-- ============================ 重连 begin ====================================
--[[
	@brief 设置上次连接是否在比赛中
	@param value (boolean) true：比赛中 false：不在比赛中
	@note 用于判断比赛中途断线，重连回来比赛已经结束的情况，比赛开始设置为true，比赛结束和退赛设为false
--]]
MatchIsolater.setLastConnectInMatch = function(self, value)
	MatchHallDataInterface.getInstance():setLastConnectInMatch(value);
end

-- ============================ 重连 end	====================================
