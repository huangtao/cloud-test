
local SilverLogic = class();

SilverLogic.getInstance = function (  )
	if not SilverLogic.s_instance then
		SilverLogic.s_instance = new(SilverLogic);
	end

	return SilverLogic.s_instance;
end

SilverLogic.releaseInstance = function (  )
	delete( SilverLogic.s_instance );
	SilverLogic.s_instance = nil;
end

SilverLogic.ctor = function ( self )

end

SilverLogic.dtor = function ( self )

end
-- 请求银元牌局任务信息
SilverLogic.requestSilverData = function ( self )
    local param = {};
	param.gameid = GameInfoIsolater.getInstance():getCurGameId();
	param.level = GameInfoIsolater.getInstance():getCurRoomLevelId();
	SocketIsolater.getInstance():sendMsg(PHP_REQUEST_SILVER_DATA, param);
end
-- 请求领取牌局任务奖励
SilverLogic.requestSilverReward = function ( self )
    LoadingView.getInstance():showText("银元运送中...");
    local param = {};
	param.ssid = UserBaseInfoIsolater.getInstance():getSsid();
	param.level = GameInfoIsolater.getInstance():getCurRoomLevelId();
    param.gameid = GameInfoIsolater.getInstance():getCurGameId();
    SocketIsolater.getInstance():sendMsg(PHP_ROOM_SILVER_GET_REWARD, param);
end

return SilverLogic;
