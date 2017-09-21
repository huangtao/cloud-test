
require("games/common2/network/php/commonGamePhpCmd2");

-- 银元场
SilverroomDataInterface2 = class(DataInterfaceBase);

SilverroomDataInterface2.Delegate = {
	 onGetSilverTaskCallBack    =    "onGetSilverTaskCallBack";
     onGetSilverRewardCallBack  =    "onGetSilverRewardCallBack";
}

SilverroomDataInterface2.getInstance = function()
	if not SilverroomDataInterface2.s_instance then
		SilverroomDataInterface2.s_instance = new(SilverroomDataInterface2);
	end

	return SilverroomDataInterface2.s_instance;
end

SilverroomDataInterface2.ctor = function ( self )
	self.m_inning = 0;
    self.m_prize = 0;
    self.m_done = 0;
end

SilverroomDataInterface2.dtor = function ( self)
	
end

SilverroomDataInterface2.checkAndRequestSilverTaskData = function ( self, gameId, levelId )
	self:requestSilverTaskData();
end

SilverroomDataInterface2.requestSilverTaskData = function ( self )
    local param = {};
	param.gameid = GameInfoIsolater.getInstance():getCurGameId();
	param.level = GameInfoIsolater.getInstance():getCurRoomLevelId();
	SocketIsolater.getInstance():sendMsg(PHP_REQUEST_SILVER_DATA, param);
end

SilverroomDataInterface2.onPushCurInning = function (self, data)
    Log.d("SilverroomDataInterface2.onPushCurInning","data = ", data);
    if table.isEmpty(data) then
        return;
    end
    self.m_inning = number.valueOf(data.inning);
    self:notify(SilverroomDataInterface2.Delegate.onGetSilverTaskCallBack, true, self.m_inning == self.m_done and true or false);
end

SilverroomDataInterface2.onGetSilverTaskCallBack = function ( self, isSuccess, data )

    Log.d("SilverroomDataInterface2.onGetSilverTaskCallBack", isSuccess, data);
	if not isSuccess or table.isEmpty(data) then
		return ;
	end
    self.m_inning = number.valueOf(data.inning) --完成牌局数
    self.m_prize = number.valueOf(data.prize);  --奖励数
    self.m_done  = number.valueOf(data.done);   --任务牌局
    self:notify(SilverroomDataInterface2.Delegate.onGetSilverTaskCallBack, isSuccess, self.m_inning == self.m_done and true or false);
end

SilverroomDataInterface2.isGetReward = function (self)
    if self.m_inning > 0 and self.m_inning == self.m_done then
        return true;
    end
    return false;
end

SilverroomDataInterface2.setCurInning = function (self, inning)
    self.m_inning = inning;
end

SilverroomDataInterface2.getCurInning = function (self)
    return self.m_inning;
end


SilverroomDataInterface2.getRewardNum = function (self)
    return self.m_prize or 0, (self.m_done - self.m_inning) or 0;
end

SilverroomDataInterface2.getTargetInnings = function (self)
    return self.m_done;
end

SilverroomDataInterface2.requestSilverReward = function (self)
    LoadingView.getInstance():showText("银元运送中...");
    local param = {};
	param.ssid = UserBaseInfoIsolater.getInstance():getSsid();
	param.level = GameInfoIsolater.getInstance():getCurRoomLevelId();
    param.gameid = GameInfoIsolater.getInstance():getCurGameId();
    SocketIsolater.getInstance():sendMsg(PHP_ROOM_SILVER_GET_REWARD, param);
end

SilverroomDataInterface2.onGetSilverRewardCallBack = function (self, isSuccess, info)
    Log.d("SilverroomDataInterface2.onGetSilverRewardData","isSuccess = ",isSuccess,"info ", info);
    LoadingView.getInstance():hidden();
    local msg = isSuccess and "成功领取"..self.m_prize.."银元!" or "领取银元失败";
    Toast.getInstance():showText(msg,50,30,kAlignLeft,"",24,200,175,110);
    self:notify(SilverroomDataInterface2.Delegate.onGetSilverRewardCallBack, isSuccess);
end


SilverroomDataInterface2.s_socketCmdFuncMap = {
	[PHP_REQUEST_SILVER_DATA]				    = SilverroomDataInterface2.onGetSilverTaskCallBack;
    [PHP_ROOM_SILVER_GET_REWARD]				= SilverroomDataInterface2.onGetSilverRewardCallBack;
};
