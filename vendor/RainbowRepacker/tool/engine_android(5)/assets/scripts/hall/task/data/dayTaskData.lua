require("gameData/gameData");
require("hall/userInfo/data/userInfoData");
require("hall/prop/propManager");

--@brief 每日任务数据源

DayTaskData = class(GameData);

DayTaskData.Delegate = {
	onGetDayTaskListCallBack = "onGetDayTaskListCallBack";
	onGetTaskRewardCallBack = "onGetTaskRewardCallBack";
}

DayTaskData.initData = function(self)
	self.m_taskList = {};
end

DayTaskData.getDayTaskList = function(self, isForceUpdate)
	self:__requestDayTaskList(isForceUpdate);
	return Copy(self.m_taskList);
end

DayTaskData.__requestDayTaskList = function(self, isForceUpdate)
	if table.isEmpty(self.m_taskList) or isForceUpdate then
		OnlineSocketManager.getInstance():sendMsg(PHP_DAY_MISSION_GET_LIST,{});
	end
end

DayTaskData.onGetDayTaskListCallBack = function(self, isSuccess, info)
	if not isSuccess or table.isEmpty(info) then
		self:execDelegate(DayTaskData.Delegate.onGetDayTaskListCallBack, false);
		return;
	end

	self.m_taskList = {};
	for k, v in pairs(info) do
		local item = {};
		item.region_id = tonumber(v.region_id) or 0; --?
		item.jump_code = tostring(v.jump_code) or ""; --跳转地址
		item.id = tonumber(v.id) or 0;
		item.desc = tostring(v.desc) or ""; --微信分享动态
		item.progress = tostring(v.progress) or ""; --任务完成进度(请原样展示，可能会有"进行中"这种值)
		item.name = tostring(v.name) or ""; --任务名称
		item.reward_type = tonumber(v.reward_type) or 0; --任务奖励类型
		item.status = tonumber(v.status) or 0; --任务状态 0:未完成 1:已完成未领奖 2:已领奖
		item.sort_order = tonumber(v.sort_order) or 0; --任务显示排序
		item.icon = v.icon or "";--任务图标
		item.reward = tonumber(v.reward) or 0;--任务奖励(请原样展示，可能会有"随机"这种值)
		
		table.insert(self.m_taskList, item);
	end
	self:saveData();
	self:execDelegate(DayTaskData.Delegate.onGetDayTaskListCallBack, true, Copy(self.m_taskList) );
end

DayTaskData.requestGetTaskReward = function(self, taskId)
    VipAnimManager.getInstance():setPauseAnim(true);
	OnlineSocketManager.getInstance():sendMsg(PHP_DAY_MISSION_GET_REWARD, {mission = taskId});
end

DayTaskData.onGetTaskRewardCallBack = function(self, isSuccess, info, sendParam)
    VipAnimManager.getInstance():setPauseAnim(false);
	if not isSuccess or table.isEmpty(info) then
		self:execDelegate(DayTaskData.Delegate.onGetTaskRewardCallBack, false)
		return;
	end

	info.reward_type = tonumber(info.reward_type) or 0;--任务奖励类型(参见全局配置表的物品ID)
	info.reward = tonumber(info.reward) or 0;--领取的奖励数目

	local totalNum;
	if info.reward_type == 0 then
		--奖励为银币
		totalNum = kUserInfoData:getMoney() + info.reward;
		kUserInfoData:setMoney(totalNum);
	elseif info.reward_type == 1 then
		--奖励为金条
		totalNum = kUserInfoData:getCrystal() + info.reward;
		kUserInfoData:setCrystal(totalNum);
	
	elseif info.reward_type == 2 then
		--奖励为砖石
		totalNum = kUserInfoData:getDiamond() + info.reward;
		kUserInfoData:setDiamond(totalNum);
	else
		--道具通过推送进行刷新
	end

	local isRefresh = self:refreshTaskStatus(sendParam.mission, 2);--设为已领奖
	if isRefresh then
		self:execDelegate(DayTaskData.Delegate.onGetDayTaskListCallBack, true, Copy(self.m_taskList) );
	end
    self:removeItemByjumpCode(CommonJumpCmds.GOTO_REGISTER_ACCOUNT);
	self:execDelegate(DayTaskData.Delegate.onGetTaskRewardCallBack, true, info);
end

DayTaskData.refreshTaskStatus = function(self, taskId, status)
	if not (taskId and status) then
		return false;
	end

	for _, v in pairs(self.m_taskList) do
		if v.id == taskId then
			v.status = status or v.status;
			return true;
		end
	end

	return false;
end

DayTaskData.onFinishTaskSuccess = function(self, taskId)
	Log.v("DayTaskData.onFinishTaskSuccess --> ", taskId);

	for k,v in pairs(self.m_taskList) do
		if tonumber(v.id) == tonumber(taskId) then
			v.status = 1;
			v.progress = "完成";
            self:saveData();
			break;
		end
	end

	self:execDelegate(DayTaskData.Delegate.onGetDayTaskListCallBack, true, Copy(self.m_taskList) );
end

DayTaskData.getCanRewardTaskNum = function(self)
	local num = 0;

	for k, v in pairs(self.m_taskList) do
		if tonumber(v.status) == 1 then --0:未完成 1:已完成未领奖 2:已领奖
			num = num + 1;
		end
	end

	return num;
end

DayTaskData.getRewardNumByjumpCode = function (self,jumpCode)
    local num = 0;
    for k, v in pairs(self.m_taskList) do
        local jumpInfo = json.decode(v.jump_code);
        if not table.isEmpty(jumpInfo) and jumpInfo.cmd == jumpCode then 
            num = v.reward;
        end
    end
    return num;
end

DayTaskData.removeItemByjumpCode = function (self, jumpCode)
    if table.isEmpty(self.m_taskList) then
        return;
    end
    for k,v in pairs(self.m_taskList) do
        local jumpInfo = json.decode(v.jump_code);
        if not table.isEmpty(jumpInfo) and jumpInfo.cmd == jumpCode then 
            table.remove(self.m_taskList, k);
            self:saveData();
        end
    end
end

---------------------------------------------------------------------------------------------------------
-- 本地缓存
DayTaskData.loadDictData = function(self, dict)
	self.m_taskList = table.verify(json.decode(dict:getString("task_list")));
end

DayTaskData.saveDictData = function(self, dict)
	dict:setString("task_list", json.encode(self.m_taskList));
end

DayTaskData.getLocalDictName = function(self)
	self.m_userId = self.m_userId or kUserInfoData:getUserId();
	return "dic_day_task_" .. self.m_userId;
end

DayTaskData.s_socketCmdFuncMap = {
	[PHP_DAY_MISSION_GET_LIST] 		         = DayTaskData.onGetDayTaskListCallBack;
	[PHP_DAY_MISSION_GET_REWARD] 		      = DayTaskData.onGetTaskRewardCallBack;
};