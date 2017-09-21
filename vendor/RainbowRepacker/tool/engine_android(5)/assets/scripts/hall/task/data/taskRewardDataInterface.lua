require("gameData/dataInterfaceBase");
require("hall/task/data/dayRewardData");
require("hall/task/data/dayTaskData");

TaskRewardDataInterface = class(DataInterfaceBase);

TaskRewardDataInterface.WEIXIN_FRIEND_SHARE = 1;
TaskRewardDataInterface.WEIXIN_SPACE_SHARE = 2;


TaskRewardDataInterface.Delegate = {
	onGetSigninInfosCallBack = "onGetSigninInfosCallBack";
	onSigninCallBack = "onSigninCallBack";
	onGetSigninCalendarCallBack = "onGetSigninCalendarCallBack";

	onGetDayTaskListCallBack = "onGetDayTaskListCallBack";
	onGetTaskRewardCallBack = "onGetTaskRewardCallBack";	

	onSendDayTaskShareFlagCallBack = "onSendDayTaskShareFlagCallBack";

	onRefreshTaskRewardStatusCallBack = "onRefreshTaskRewardStatusCallBack";

    onToCompleteSomeTask = "onTaskItemBtnClick";
}

TaskRewardDataInterface.getInstance = function()
	if not TaskRewardDataInterface.s_instance then
		TaskRewardDataInterface.s_instance = new(TaskRewardDataInterface);
	end

	return TaskRewardDataInterface.s_instance;
end

TaskRewardDataInterface.cleanup = function()
	local lastObserverMap = TaskRewardDataInterface.getInstance():getObserverMap();
	delete(TaskRewardDataInterface.s_instance);
	TaskRewardDataInterface.s_instance = nil;

	TaskRewardDataInterface.getInstance():setObserverMap(lastObserverMap);
end

TaskRewardDataInterface.ctor = function(self)
    Log.w("TaskRewardDataInterface.ctor","tostring(self) = ",tostring(self));
	self.m_dayRewardData = new(DayRewardData, self);
	self.m_dayTaskData = new(DayTaskData, self);
end

TaskRewardDataInterface.dtor = function(self)
    Log.w("TaskRewardDataInterface.dtor","tostring(self) = ",tostring(self));
	delete(self.m_dayTaskData);
	self.m_dayTaskData = nil;

	delete(self.m_dayRewardData);
	self.m_dayRewardData = nil;
end

TaskRewardDataInterface.requestSignin = function(self,day,isBuSignin)
	self.m_dayRewardData:requestSignin(day,isBuSignin);
end

TaskRewardDataInterface.onSigninCallBack = function(self, isSuccess, rewardInfo)
    Log.w("TaskRewardDataInterface.onSigninCallBack","tostring(self) = ",tostring(self));
	self:notify(TaskRewardDataInterface.Delegate.onSigninCallBack, isSuccess, rewardInfo);
	self:notify(TaskRewardDataInterface.Delegate.onRefreshTaskRewardStatusCallBack);
end

TaskRewardDataInterface.getRewardAdConfig = function(self)
	return self.m_dayRewardData:getRewardAdConfig();
end
--------------------------------------------------------------------------------------------------------
TaskRewardDataInterface.getSigninInfos = function(self)
	self.m_dayRewardData:getSigninInfos();
end 

TaskRewardDataInterface.onGetSigninInfosCallBack = function(self,isSuccess,todaySigninInfos,tomorrowSigninConfig,continueSigninInfo,rewardAdConfig,autoopen)
	self:notify(TaskRewardDataInterface.Delegate.onGetSigninInfosCallBack,isSuccess,todaySigninInfos,tomorrowSigninConfig,continueSigninInfo,rewardAdConfig,autoopen);
	self:notify(TaskRewardDataInterface.Delegate.onRefreshTaskRewardStatusCallBack);
end

TaskRewardDataInterface.getSigninCalendarInfo = function(self)
	return self.m_dayRewardData:getSigninCalendarInfo();
end 

TaskRewardDataInterface.onGetSigninCalendarCallBack = function(self,isSuccess,signinCalendarInfo,continueSigninInfo)
	self:notify(TaskRewardDataInterface.Delegate.onGetSigninCalendarCallBack, isSuccess,signinCalendarInfo,continueSigninInfo);
end 

TaskRewardDataInterface.getTodaySigninInfos = function(self)
	return self.m_dayRewardData:getTodaySigninInfos();
end

TaskRewardDataInterface.isSignToday = function(self)
	local today = self:getTodaySigninInfos();

	return today.isSignToday;
end

TaskRewardDataInterface.canUseCardToday = function(self)
	local today = self:getTodaySigninInfos();

	return today.canUseCard;
end

TaskRewardDataInterface.getTodaySigninConfig = function(self)
	local today = self:getTodaySigninInfos();

	return table.verify(today.config);
end

TaskRewardDataInterface.getTomorrowSigninConfig = function(self)
	return self.m_dayRewardData:getTomorrowSigninConfig();
end

TaskRewardDataInterface.getContinueInfos = function(self)
	return self.m_dayRewardData:getContinueInfos();
end
--------------------------------------------------------------------------------------------------------
--每日任务相关
TaskRewardDataInterface.getDayTaskList = function(self, isForceUpdate)
	return self.m_dayTaskData:getDayTaskList(isForceUpdate);
end

TaskRewardDataInterface.getRewardNumByjumpCode = function (self, jumpCode)
    return self.m_dayTaskData:getRewardNumByjumpCode(jumpCode);
end

TaskRewardDataInterface.requestGetTaskReward = function(self, taskId)
	self.m_dayTaskData:requestGetTaskReward(taskId);
end

TaskRewardDataInterface.getCanRewardTaskNum = function(self)
	return self.m_dayTaskData:getCanRewardTaskNum();
end

TaskRewardDataInterface.onGetDayTaskListCallBack = function(self, isSuccess, tasklist)
	self:notify(TaskRewardDataInterface.Delegate.onGetDayTaskListCallBack, isSuccess, tasklist);
	self:notify(TaskRewardDataInterface.Delegate.onRefreshTaskRewardStatusCallBack);
end

TaskRewardDataInterface.onGetTaskRewardCallBack = function(self, isSuccess, taskRewardInfo)
	self:notify(TaskRewardDataInterface.Delegate.onGetTaskRewardCallBack, isSuccess, taskRewardInfo);
	self:notify(TaskRewardDataInterface.Delegate.onRefreshTaskRewardStatusCallBack);
end

TaskRewardDataInterface.canGetFreeMoney = function(self)
    local isSignToday = self:isSignToday();
    if isSignToday == nil then
        isSignToday = true;
    end
	return self.m_dayTaskData:getCanRewardTaskNum() > 0 or (not isSignToday); 
end

--发送任务分享标识
TaskRewardDataInterface.sendDayTaskShareFlag = function(self, shareType)
	self.m_lastShareType = shareType;
	OnlineSocketManager.getInstance():sendMsg(PHP_DAY_MISSION_SEND_SHARE_FLAG, {flag = shareType} );
end

TaskRewardDataInterface.sendDayTaskShareFlagByShareChannel = function(self, shareChannel, isSendToFriendsCircle)
	local shareType = self:__getShareFlag(shareChannel, isSendToFriendsCircle);
	self:sendDayTaskShareFlag(shareType);
end

TaskRewardDataInterface.__getShareFlag = function(self, shareChannel, isSendToFriendsCircle)
	
	if shareChannel == WeixinShareUtil.eShareChannel.WEIXIN then
		return isSendToFriendsCircle and TaskRewardDataInterface.WEIXIN_SPACE_SHARE or TaskRewardDataInterface.WEIXIN_FRIEND_SHARE;
	end 
end

TaskRewardDataInterface.onSendDayTaskShareFlagCallBack = function(self, isSuccess, info)
	if not isSuccess or table.isEmpty(info) then
		self:notify(TaskRewardDataInterface.Delegate.onSendDayTaskShareFlagCallBack, false);
	else
		local taskId = self:__getTaskIdByShareType(self.m_lastShareType);
		if taskId then
			self:onFinishTaskSuccess(taskId);
		end
		self:notify(TaskRewardDataInterface.Delegate.onSendDayTaskShareFlagCallBack, info.result == 1);
	end
end

TaskRewardDataInterface.__getTaskIdByShareType = function(self, shareType)
	if not shareType then
		return;
	end

  	local map = {
		[TaskRewardDataInterface.WEIXIN_SPACE_SHARE] =  CommonJumpCmds.GOTO_WEIXIN_SHARE;
		[TaskRewardDataInterface.WEIXIN_FRIEND_SHARE] =  CommonJumpCmds.GOTO_WEIXIN_INVITE;
  	}

  	local cmd = map[shareType];
  	local _taskData = self:getDayTaskList();
    for k,v in pairs(_taskData) do
        local jumpInfo = table.verify(json.decode(v.jump_code));
        if cmd and cmd == jumpInfo.cmd then
        	return v.id;
        end
    end
end

--完成任务成功
TaskRewardDataInterface.onFinishTaskSuccess = function(self, taskId)
	self.m_dayTaskData:onFinishTaskSuccess(taskId);
end

--指定完成某个任务
TaskRewardDataInterface.onToCompleteSomeTask = function(self, data)
	self:notify(TaskRewardDataInterface.Delegate.onToCompleteSomeTask, data);
end

TaskRewardDataInterface.s_socketCmdFuncMap = {
	[PHP_DAY_MISSION_SEND_SHARE_FLAG]      = TaskRewardDataInterface.onSendDayTaskShareFlagCallBack;
};