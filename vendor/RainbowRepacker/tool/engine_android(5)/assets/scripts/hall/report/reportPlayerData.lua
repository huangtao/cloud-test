
require("gameData/dataInterfaceBase");
--[[
	作者：demon
	描述：举报网络数据处理类
	日期：2016/1/7
]]
ReportPlayerData = class(DataInterfaceBase);

ReportPlayerData.s_reportTryCountMax = 1;

ReportPlayerData.ctor = function(self)
	self.m_reportTryCount = 0;
	self.m_againReportEnable = false; 						--是否重连开关，当开启了重连开关时，利用保存的参数重连
	self.m_otherid = "";
	self.m_otherName = "";
	self.m_otherHead = "";
	self.m_reportType = "";
	
	--游戏里面界面需要缓存的数据
	self.lastRepeatedIds = {};
end

ReportPlayerData.dtor = function(self)

end

ReportPlayerData.getInstance = function()
	if not ReportPlayerData.s_instance then
		ReportPlayerData.s_instance = new(ReportPlayerData);
	end

	return ReportPlayerData.s_instance;
end

ReportPlayerData.requestReport = function(self,id,name,head,reportType) --id:被举报人ID,name:被举报的昵称，head；被举报头像链接，reportType:举报内容
	
	if not self.m_againReportEnable then
		self.m_otherid = id;
		self.m_otherName = name;
		self.m_otherHead = head;
		self.m_reportType = reportType;
	end
	self.m_againReportEnable = false
	
	local data = {};
	data.type = self.m_reportType;
	data.othermid = self.m_otherid;
    data.gameId = GameInfoIsolater.getInstance():getCurGameId();
    OnlineSocketManager.getInstance():sendMsg(PHP_REPORT_PLAYER, data);
end

ReportPlayerData.onGetReportResultCallBack = function(self,isSuccess, info)
	if not isSuccess then
		self:reportResultShow(false);
		self.m_reportTryCount = self.m_reportTryCount + 1
		
		if self.m_reportTryCount < ReportPlayerData.s_reportTryCountMax then
			self.m_againReportEnable = true;
			self:requestReport();
		end
		return;
	end

	self.m_reportTryCount = 0;
	
	local result = info.result;
    result = result == 1 and true or false ;
    self:reportResultShow(result);
end

ReportPlayerData.reportResultShow = function(self,isSuccess)
    if isSuccess then
		local tmpSuccesString = GameString.get("kReportSucces")
        Toast.getInstance():showText(tmpSuccesString,50,30,kAlignLeft,"",24,200,175,110);
    else
		local tmpFailString = GameString.get("kReportFail")
        Toast.getInstance():showText(tmpFailString,50,30,kAlignLeft,"",24,200,175,110);
    end
end

ReportPlayerData.isOldId = function(self,otherId)
	return self.lastRepeatedIds[otherId] or false;
end

ReportPlayerData.cleanIds = function(self)
	self.lastRepeatedIds = {};
end

ReportPlayerData.pushLastIds = function(self,id)
	if type(id) == "number"  and id > 0 then
		self.lastRepeatedIds[id] = true;
	end	
end

ReportPlayerData.s_socketCmdFuncMap = {
	[PHP_REPORT_PLAYER]				= ReportPlayerData.onGetReportResultCallBack;
};

