
--[[
    房间任务信息
]]
RoomTaskLogic = class(DataInterfaceBase);
 
RoomTaskLogic.Delegate = {
    onUsePropsEvent = "onUsePropsEvent";
};

RoomTaskLogic.getInstance = function()
    if not RoomTaskLogic.s_instance then
        RoomTaskLogic.s_instance = new(RoomTaskLogic);
    end
    return RoomTaskLogic.s_instance;
end

RoomTaskLogic.releaseInstance = function()
    delete(RoomTaskLogic.s_instance);
    RoomTaskLogic.s_instance = nil;
end

RoomTaskLogic.ctor = function(self) 
    self.m_socket = SocketIsolater.getInstance():getSocket();
    self.m_data = {};
end

RoomTaskLogic.dtor = function(self)

end

RoomTaskLogic.setRoomTaskData = function ( self, data )
    self.m_data = data;
end

RoomTaskLogic.getRoomTaskData = function(self)
    return self.m_data;
end

-- 请求宝箱任务信息
RoomTaskLogic.requestRoomBaxTaskInfo = function(self,gameId)
    local info = {};
    info.ssid = UserBaseInfoIsolater.getInstance():getSsid();
    info.gameid = gameId or GameInfoIsolater.getInstance():getCurGameId();
    info.level = GameRoomData.getInstance():getRoomLevel();--GameInfoIsolater.getInstance():getCurRoomLevelId();
    self.m_socket:sendMsg(PHP_ROOM_TASK, info);
end

--返回宝箱进度
RoomTaskLogic.responseRoomBaxTaskInfo = function(self,info)
    local t = info 
    t.prize = tonumber(t.prize) or 0;
    local data = {};
    data.ptype = t.ptype;
    local pName = "钻石";
    if data.ptype == 1 then 
        pName = "银币";
    end 
    data.pName = pName;
    data.taskName = "连续对局"..(t.done or 0) .."局奖励"..(t.prize or 0)..pName;
    data.state = 1;
    if t.done == t.inning then 
        data.state = 2;
    end 
    t.done = t.done or 0 ;
    if (t.done or -1) <= 0 then 
        data.state = 1
    end 
    data.currentPro = t.inning;
    data.totalPro = t.done;
    data.prize = t.prize;
    local change = false;
    if self.m_data.currentPro == 0  then 
        change = true;
    end 
    if self.m_data.currentPro ~= data.currentPro then 
        change = true;
    end
    self:setRoomBaxHasChange(change);
    local param = {}; 
    param.prize = data.prize;
    param.currentPro = data.currentPro;
    param.state = data.state;
    param.totalPro = data.totalPro;
    param.ptype = data.ptype;
    param.tips = t.tips;
    self:setRoomBaxChangeData(data);
    self:setRoomBaxData(param);
    local action = GameMechineConfig.ACTION_REFRESH_BOX_TASK_INFO;
    MechineManage.getInstance():receiveAction(action, param);
end

-- 宝箱任务进度是否发生变化
RoomTaskLogic.setRoomBaxHasChange = function(self,change)
    self.m_change = change;
end

RoomTaskLogic.getRoomBaxHasChange = function(self)
    return self.m_change;
end

-- 宝箱更新数据
RoomTaskLogic.setRoomBaxData = function(self,data)
    self.m_roomBoxData = data;
end

RoomTaskLogic.getRoomBaxData = function(self)
    return self.m_roomBoxData;
end

-- 宝箱任务信息
RoomTaskLogic.setRoomBaxChangeData = function(self,data)
    self.m_changeData = data;
end

RoomTaskLogic.getRoomBaxChangeData = function(self)
    return self.m_changeData;
end

--请求宝箱任务奖励
RoomTaskLogic.requestRoomBoxReward = function(self)
    local info = {};
    info.ssid = UserBaseInfoIsolater.getInstance():getSsid();
    info.level = GameRoomData.getInstance():getRoomLevel();-- GameInfoIsolater.getInstance():getCurRoomLevelId();
    self.m_socket:sendMsg(PHP_ROOM_TASK_GET_REWARD,info);
    Log.d("RoomTaskLogic.requestRoomBoxReward", info);
    Log.d("RoomTaskLogic.requestRoomBoxReward---levell=", GameInfoIsolater.getInstance():getCurRoomLevelId());
    -- self:showLoading("宝箱运送中...");
end

RoomTaskLogic.onGetRoomBoxReward = function(self,info)
    --任务完成，领取奖励，刷新任务状态，重新开始
    -- self:hideLoading();
    -- self:requestRoomBaxTaskInfo();
    --刷新用户银币等界面信息
    --更新自己的钻石信息
    local t = info;
    -- self.m_data = {};
    local data = {};
    if t.ret then 
        if t.ret.type == 1  then 
            data.ptype = 1;     
            data.prize = t.ret.addMoney;
        else 
            data.ptype = 2;
            data.prize = t.ret.addDiamond;
        end 
        data.otherDatas = {
            [1] = {["ptype"]=1,["prize"]=0};
            [2] = {["ptype"]=1,["prize"]=0};
        };
        if t.nh then 
            math.randomseed( os.time() )
            local rIndex = math.ceil(math.random(99))%2 + 1;
            if t.nh.tiny then 
                data.otherDatas[rIndex].ptype = t.nh.tiny.type;
                data.otherDatas[rIndex].prize = t.nh.tiny.num;
           end 
           if t.nh.big then 
                if rIndex == 2 then 
                    data.otherDatas[1].ptype = t.nh.big.type;
                    data.otherDatas[1].prize = t.nh.big.num;
                else 
                    data.otherDatas[2].ptype = t.nh.big.type;
                    data.otherDatas[2].prize = t.nh.big.num;
                end 
            end 
        end
        data.state = 3;
        self:setRoomBoxRewardData(data);
        local action = GameMechineConfig.ACTION_REFRESH_BOX_TASK_INFO;
        MechineManage.getInstance():receiveAction(action, data);    
    end 
end

RoomTaskLogic.setRoomBoxRewardData = function(self,data)
    self.m_rewardData = data;
end

RoomTaskLogic.getRoomBoxRewardData = function(self)
    return self.m_rewardData;
end

RoomTaskLogic.broadcastRoomBoxInfo = function(self, msgInfo)
    local gameId = msgInfo.gameid;
    local level = msgInfo.level;
    local inning = msgInfo.inning;
    local done = msgInfo.done or 0;

    self.m_data = table.verify(self.m_data);
    self.m_data.currentPro = inning;
    self.m_data.state = 1;
    if done >= self.m_data.currentPro then 
         if done ~= 0 then 
            self.m_data.totalPro = done 
         end 
    end 
    if self.m_data.totalPro == self.m_data.currentPro then 
        self.m_data.state = 2;
    end 

    local action = GameMechineConfig.ACTION_REFRESH_BOX_TASK_INFO;
    MechineManage.getInstance():receiveAction(action, self.m_data);

end