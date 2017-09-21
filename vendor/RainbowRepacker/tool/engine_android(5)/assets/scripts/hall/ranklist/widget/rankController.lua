require("isolater/common/commonController");
require("hall/onlineSocket/onlineSocketManager");
require("common/nativeEvent");
require("util/TableLib");
require("hall/ranklist/socket/rankSocketProcesser");
require("hall/ranklist/data/rankListDataInterface");
require("hall/community/data/communityDataInterface");
local RankScene = require("hall/ranklist/widget/rankScene");

-- 排行榜列表controler
-- 作者：JasonWang

RankController = class(CommonController);

RankController.s_cmds = 
{
	goBack = 1,
	rankTabItemClick = 3,
	mineRankBtnClick = 4,
	DayChangeBtnClick = 5,
	requestUserInfo = 6;
	AddConfirmClick = 7;
	getRankTabList = 8;
};

RankController.ctor = function(self, state, viewClass, viewConfig)
	self.m_state = state;
	self.m_curTab = nil;
	self.m_curFlag = RankListConstants.eFlag.Today;

	RankListDataInterface.getInstance():setObserver(self);
	CommunityDataInterface.getInstance():setObserver(self);
end

RankController.resume = function(self)
	CommonController.resume(self);
end

RankController.dtor = function(self)
	RankListDataInterface.getInstance():clearObserver(self);
    CommunityDataInterface.getInstance():clearObserver(self);
end

--获取rank的tab
RankController.getRankTabList = function(self)
	local rankTabList = RankListDataInterface.getInstance():getRankTabList();
	self:updateView(RankScene.s_cmds.updateTabs, rankTabList);

	local getBundleData = self:getBundleData();
	local rankType = getBundleData or RankListDataInterface.getInstance():getPreferDisplayRankType();
	self:onRankTabItemClick(rankType);
end

--获取tab回调
RankController.onGetRankListTabCallBack = function(self, isSuccess, rankTabList)
	if isSuccess then
		self:updateView(RankScene.s_cmds.updateTabs, rankTabList);
		self:onRankTabItemClick( RankListDataInterface.getInstance():getPreferDisplayRankType() );
	end
end

--获取某个rank的list
RankController.getRankList = function(self, mid, rankType, flag)
	local info, updateFlag = RankListDataInterface.getInstance():getRankListData(rankType, flag, mid);
	if table.isEmpty(info) then
		self:updateView(RankScene.s_cmds.PreRankList, updateFlag);
	else
		self:updateView(RankScene.s_cmds.LoadRankList, info, rankType);
	end
end

--@delegate
RankController.onRankListDataCallBack = function(self, isSuccess, rankType,flag, info)
	LoadingView.getInstance():hidden();
	self:updateView(RankScene.s_cmds.LoadRankList, info, rankType);
end

--获取某个rank某个mid对应的info
RankController.getRankInfo = function(self, mid, rankType, flag)
	local info = RankListDataInterface.getInstance():getUserRankInfo(rankType, flag, mid);
	if table.isEmpty(info) then
		self:updateView(RankScene.s_cmds.PreRankInfo);
	else
		self:updateView(RankScene.s_cmds.LoadMyRankInfo, info, rankType, flag);
	end
end

--@delegate
RankController.onUserRankInfoCallBack = function(self, isSuccess, mid, rankType, flag,info)
	LoadingView.getInstance():hidden();
	self:updateView(RankScene.s_cmds.LoadMyRankInfo, info, rankType, flag)
end

--返回
RankController.onGoBack = function(self)
	self.m_state:popState();
end

--点击提升排名
RankController.onMineRankBtnClick = function(self)
	UBReport.getInstance():report(UBConfig.kHallRankQuickUp, string.format("curTab_%s", self.m_curTab or ""));
	
	--去商城
	RechargeDataInterface.getInstance():setToRechargeMode( RechargeDataInterface.getInstance():getTabMoneyId() ); ---直接跳转到银币
	self.m_state:pushState(States.Recharge);
end

--切换排行榜tab
RankController.onRankTabItemClick = function(self, rankType)
	if not rankType then 
		return; 
	end

	if self.m_curTab == rankType then
		return;
	end

	-- 显示当前选中的
	self.m_curTab = rankType;
	self:updateView(RankScene.s_cmds.SetHeadMenuSelect, self.m_curTab);

	local mid = kUserInfoData:getUserId();
	self:getRankList(mid, rankType, self.m_curFlag);
	self:getRankInfo(mid, rankType, self.m_curFlag);
end

--请求超时
RankController.onRequestTimeOut = function(self, timeOutType)
	self:updateView(RankScene.s_cmds.RankRequestTimeOut, timeOutType);
end

--点击今日/昨日按钮
RankController.onDayChangeBtnClick = function(self)
	local mid = kUserInfoData:getUserId();
	self.m_curFlag = 0 - self.m_curFlag;
	if (self.m_curFlag == RankListConstants.eFlag.Today) then
		UBReport.getInstance():report(UBConfig.kHallRankToday);
	elseif (self.m_curFlag == RankListConstants.eFlag.LastDay) then
		UBReport.getInstance():report(UBConfig.kHallRankYesterday);
	end
	self:updateView(RankScene.s_cmds.RankDayChange, self.m_curFlag);
	self:getRankList(mid, self.m_curTab, self.m_curFlag);
	self:getRankInfo(mid, self.m_curTab, self.m_curFlag);
end

--请求用户信息
RankController.onRequestUserInfo = function(self, data)
    CommunityDataInterface.getInstance():requestUserInfoCustom(data.cid,nil,",silver");
end

--@delegate
RankController.onCustomGetUserInfoCallBack = function(self, isSuccess, info)
	if isSuccess then
		self:updateView(RankScene.s_cmds.ShowUserInfo, info);
	end
end

---添加好友
RankController.onAddConfirmClick = function(self,param)
     CommunityDataInterface.getInstance():requestAddFriend(param.dst_cid,param.message);
end

--@delegate
RankController.onRequestAddFriendCallBack = function(self, isSuccess, msg)
	msg = isSuccess and "发送成功，等待验证" or  "发送失败，请稍后重试";
	self:updateView(RankScene.s_cmds.showToast,msg);
end

RankController.onAddFriendResultCallBack = function (self,isSuccess,data)
    if isSuccess then
        local msg = data.result == 1 and data.nickname.."已添加为好友" or data.nickname.."拒绝加为好友";
        Toast.getInstance():showTextView(msg,width or 640, height or 60,kAlignCenter,"",size,200,175,115);
    end
end

RankController.s_cmdConfig = 
{
	[RankController.s_cmds.goBack] = RankController.onGoBack,
	[RankController.s_cmds.rankTabItemClick] = RankController.onRankTabItemClick,
	[RankController.s_cmds.mineRankBtnClick] = RankController.onMineRankBtnClick,
	[RankController.s_cmds.DayChangeBtnClick] = RankController.onDayChangeBtnClick,
	[RankController.s_cmds.requestUserInfo] = RankController.onRequestUserInfo,
	[RankController.s_cmds.AddConfirmClick] = RankController.onAddConfirmClick,
	[RankController.s_cmds.getRankTabList] = RankController.getRankTabList,
};


RankController.s_socketCmdFuncMap = {
};

RankController.s_nativeEventFuncMap = {
	
};
