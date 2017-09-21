require("gameData/dataInterfaceBase");
require("hall/community/data/communityDataInterface");
require("hall/password/data/passwordDataInterface");
require("hall/matchHall/gameMatchHall/data/matchHallDataInterface")

-- 比赛战绩数据接口
MatchRecordDataInterface = class(DataInterfaceBase);

MatchRecordDataInterface.Delegate = {
    onGetMatchRecordStatistics              = "onGetMatchRecordStatistics"; -- 获取比赛统计数据回调
    onGetMatchRecordReward                  = "onGetMatchRecordReward"; -- 获取比赛累计奖励数据回调
    onGetMatchRecordHistory                 = "onGetMatchRecordHistory"; -- 获取历史战绩数据回调
    onGetMatchRecordRankList                = "onGetMatchRecordRankList"; -- 获取大师分好友排行数据回调

    onGetPasswordByInfoCallback             = "onGetPasswordByInfoCallback"; -- 获取口令回调
    onGetContactListCallBack                = "onGetContactListCallBack"; -- 获取通讯录回调
    onInviteContactFriendsCallback          = "onInviteContactFriendsCallback"; -- 发送短信回调
    onGetMatchTagList                       = "onGetMatchTagList"; -- 获取比赛标签列表回调
};

MatchRecordDataInterface.getInstance = function()
    if not MatchRecordDataInterface.s_instance then
        MatchRecordDataInterface.s_instance = new(MatchRecordDataInterface);
    end

    return MatchRecordDataInterface.s_instance;
end

MatchRecordDataInterface.releaseInstance = function()
    delete(MatchRecordDataInterface.s_instance);
    MatchRecordDataInterface.s_instance = nil;
end

MatchRecordDataInterface.ctor = function(self)
    self.m_dataStatistics = new(require("hall/matchHall/gameMatchHall/data/matchRecordDataStatistics"), self); -- 比赛统计数据
    self.m_dataReward = new(require("hall/matchHall/gameMatchHall/data/matchRecordDataReward"), self); -- 累计奖励数据
    self.m_dataHistory = new(require("hall/matchHall/gameMatchHall/data/matchRecordDataHistory"), self); -- 历史战绩数据
    self.m_dataRank = new(require("hall/matchHall/gameMatchHall/data/matchRecordDataRank"), self); -- 好友排行数据

    self.m_invitedListMessage = {};
    self.m_password = nil;

    PasswordDataInterface.getInstance():setObserver(self);
    CommunityDataInterface.getInstance():setObserver(self);
end 

MatchRecordDataInterface.dtor = function(self)
	PasswordDataInterface.getInstance():clearObserver(self);
	CommunityDataInterface.getInstance():clearObserver(self);

    if self.m_dataStatistics then
        delete(self.m_dataStatistics);
        self.m_dataStatistics = nil;
    end

    if self.m_dataReward then
        delete(self.m_dataReward);
        self.m_dataReward = nil;
    end

    if self.m_dataHistory then
        delete(self.m_dataHistory);
        self.m_dataHistory = nil;
    end

    if self.m_dataRank then
        delete(self.m_dataRank);
        self.m_dataRank = nil;
    end

    self.m_invitedListMessage = nil;
    self.m_password = nil;
end

MatchRecordDataInterface.reset = function(self)
	self.m_dataReward:reset();
	self.m_dataHistory:reset();
	self.m_dataRank:reset();
	self.m_dataStatistics:reset();
end

------------------------------比赛统计---------------------------------
-- 获取比赛统计数据
MatchRecordDataInterface.getMatchRecordStatistics = function(self, mid)
	self.m_dataStatistics:getData(mid);
end

-- 返回比赛统计数据
MatchRecordDataInterface.onGetMatchRecordStatistics = function(self, data, mid)
	self:notify(MatchRecordDataInterface.Delegate.onGetMatchRecordStatistics, data, mid);
end

------------------------------奖励统计---------------------------------
-- 获取累计奖励数据
MatchRecordDataInterface.getMatchRecordReward = function(self)
	self.m_dataReward:getData();
end

-- 返回累计奖励数据
MatchRecordDataInterface.onGetMatchRecordReward = function(self, data)
	self:notify(MatchRecordDataInterface.Delegate.onGetMatchRecordReward, data);
end

-- 获取标签列表
MatchRecordDataInterface.getMatchTagList = function(self)
	return MatchHallDataInterface.getInstance():getMatchTagList();
end

-- 返回标签列表
MatchRecordDataInterface.onGetMatchTagList = function(self, data)
    self:notify(MatchRecordDataInterface.Delegate.onGetMatchTagList, data);
end

-----------------------------历史战绩--------------------------------
-- 获取历史战绩数据
MatchRecordDataInterface.getMatchRecordHistory = function(self)
	self.m_dataHistory:getData();
end

-- 获取下一页历史战绩数据
MatchRecordDataInterface.getMatchRecordHistoryNext = function(self)
    self.m_dataHistory:getDataNext();
end

-- 是否还有历史战绩数据
MatchRecordDataInterface.hasMatchRecordHistoryNext = function(self)
    return self.m_dataHistory:hasDataNext();
end

-- 返回历史战绩数据
MatchRecordDataInterface.onGetMatchRecordHistory = function(self, data, isUpdate)
	self:notify(MatchRecordDataInterface.Delegate.onGetMatchRecordHistory, data, isUpdate);
end

-- 获取比赛显示时间
MatchRecordDataInterface.getTimeStringWithTime = function(self, time)
	return MatchHallDataInterface.getInstance():getTimeStringWithTime(time);
end

-----------------------------排行榜----------------------------------
-- 获取好友排行数据
MatchRecordDataInterface.getMatchRecordRankList = function(self)
	self.m_dataRank:getData();
end

-- 获取下一页好友排行数据
MatchRecordDataInterface.getMatchRecordRankListNext = function(self)
    self.m_dataRank:getDataNext();
end

-- 是否还有好友排行数据
MatchRecordDataInterface.hasMatchRecordRankNext = function(self)
    return self.m_dataRank:hasDataNext();
end

-- 返回好友排行数据
MatchRecordDataInterface.onGetMatchRecordRankList = function(self, data, isUpdate)
	self:notify(MatchRecordDataInterface.Delegate.onGetMatchRecordRankList, data, isUpdate);
end

-- 获取邀请好友口令数据
MatchRecordDataInterface.getInviteData = function(self)
    return PasswordDataInterface.getInstance():generateData(PasswordConstants.TYPE_ADD_FRIENDS);
end

-- 请求口令
MatchRecordDataInterface.getPasswordByInfo = function(self, data)
	if not string.isEmpty(self.m_password) then
		self:notify(MatchRecordDataInterface.Delegate.onGetPasswordByInfoCallback, true, self.m_password);
    elseif not table.isEmpty(data) then
        local info = table.verify(data);
        PasswordDataInterface.getInstance():getPasswordByInfo(info, 0);
    end
end

-- 返回口令
MatchRecordDataInterface.onGetPasswordByInfoCallback = function(self, isSuccess, password)
	if isSuccess then
		self.m_password = password;
	end

	self:notify(MatchRecordDataInterface.Delegate.onGetPasswordByInfoCallback, isSuccess, password);
end

-- 获取通讯录列表
MatchRecordDataInterface.getContactList = function(self)
	CommunityDataInterface.getInstance():getContactList();
end

-- 返回通讯录列表
MatchRecordDataInterface.onGetContactListCallBack = function(self, data)
	local list = self:_operateContactListData(data);
	self:notify(MatchRecordDataInterface.Delegate.onGetContactListCallBack, list);
end

-- 处理是否已邀请
MatchRecordDataInterface._operateContactListData = function(self, data)
    local tmp = {};

    for k, v in ipairs(table.verify(data)) do
        local item = {
            name = v.name,
            number = v.phoneNumber,
            isInvited = self:_isInvitedMessage(v.phoneNumber),
        };
        table.insert(tmp, item);
    end
    return tmp;
end

MatchRecordDataInterface._isInvitedMessage = function(self, number)
    return self.m_invitedListMessage[number];
end

-- 邀请好友
MatchRecordDataInterface.inviteContactFriends = function(self, list, text)
    if table.isEmpty(list) then
        return;
    end

    for k,v in pairs(list) do
        self.m_invitedListMessage[v] = true;
    end

   CommunityDataInterface.getInstance():inviteContactFriends(list, text);
	Log.d("MatchRecordDataInterface.inviteContactFriends", "inviteList", self.m_invitedListMessage);
end

-- 邀请好友回调
MatchRecordDataInterface.onInviteContactFriendsCallback = function(self, isSuccess, info)
    self:notify(MatchRecordDataInterface.Delegate.onInviteContactFriendsCallback, isSuccess, info);
end


-----------------------------大师分-----------------------------------
MatchRecordDataInterface.getMyMasterPoint = function(self)
    return self.m_myMasterPoint or 0;
end

MatchRecordDataInterface.setMyMasterPoint = function(self, masterpoint)
    self.m_myMasterPoint = masterpoint;
end

MatchRecordDataInterface.getMasterPointDesc = function(self)
	local str = "大师分是竞技实力的体现，是一个牌手荣誉的象征。只有在特定比赛取得名次再能获得大师分。获得一定数量的大师分之后，可以提升对应等级，还可以参加专属“大师分回馈赛”。";
	return str;
end

MatchRecordDataInterface.getMatchJumpInfo = function(self)
    return MatchHallDataInterface.getInstance():getMatchJumpInfo();    
end

MatchRecordDataInterface.getHistoryViewNumberPerPage = function(self)
    return self.m_dataHistory.VIEW_NUMBER_PER_PAGE;
end

MatchRecordDataInterface.getHistoryDataNumberPerPage = function(self)
    return self.m_dataHistory.DATA_NUMBER_PER_PAGE;
end

MatchRecordDataInterface.getRankViewNumberPerPage = function(self)
    return self.m_dataRank.VIEW_NUMBER_PER_PAGE;
end

MatchRecordDataInterface.getRankDataNumberPerPage = function(self)
    return self.m_dataRank.DATA_NUMBER_PER_PAGE;
end

MatchRecordDataInterface.s_socketCmdFuncMap = {
}
