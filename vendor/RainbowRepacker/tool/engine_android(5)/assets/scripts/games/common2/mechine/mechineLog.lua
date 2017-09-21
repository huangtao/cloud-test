--[[
	记录状态机日志，保存到SD卡目录
]]

MechineLog = class();


MechineLog.TAG1 = "GameMechine";
MechineLog.TAG2 = "NoneMechine";
MechineLog.TAG3 = "PlayingMechine";
MechineLog.TAG4 = "MatchMechine";

function MechineLog:getInstance()
	if not MechineLog.s_instance then
		MechineLog.s_instance = new(MechineLog);
	end
	return MechineLog.s_instance;
end

function MechineLog:releaseInstance()
	delete(MechineLog.s_instance);
	MechineLog.s_instance = nil;
end

----------------------------------------------------
function MechineLog:ctor()
	self.m_logs = {};
end

function MechineLog:dtor()
	self.m_logs = {};
end

function MechineLog:d(tag, uid, info)
	if _DEBUG then
		self.m_logs[tag] = self.m_logs[tag] or {};
		self.m_logs[tag][uid] = self.m_logs[tag][uid] or {};
		if #self.m_logs[tag][uid] > 10 then
			self.m_logs[tag][uid] = {};
		end
		self.m_logs[tag][uid][#self.m_logs[tag][uid] +1] = info;
	end
end

function MechineLog:reportLog(tag,uid,needReport)
	if _DEBUG then
		local fileName = (tag or "") .. "_" .. "error" .. "_" .. uid;
		if self.m_logs[tag] and self.m_logs[tag][uid] and #self.m_logs[tag][uid] > 1 then
			local data = {tag=tag};
			table.insert(self.m_logs[tag][uid],1,data);
			self:recordErrorLog(fileName,self.m_logs[tag][uid])
			self.m_logs[tag][uid] = {};
		end
	end
end

function MechineLog:recordErrorLog(tag,...)
	if not _DEBUG then 
		return;
	end
	local datePreFix = os.date("%Y-%m-%d %H:%M:%S") or "";
	local strInfo = string.format("%s%s%s%s",datePreFix , " : ", Log.__getData("",tag, ...) , "\n");
	local fileFullPath = self:getLogFileFullPath(tag);
	local file = io.open(fileFullPath,"a");
	if file then
		file:write(strInfo);
		file:close();
	end
end

function MechineLog:getLogFileFullPath(tag)

	if string.isEmpty(self.m_logPath) then
		self.m_logPath = System.getStorageLogPath();
		if NativeEvent.s_platform == kPlatformIOS then
			self.m_logPath = NativeEvent.getInstance():getWriteLogPath();
		end
	end
	local dateFileName = tag or os.date("%Y_%m_%d") or "";
	local fileFullPath = string.format("%s%s%s%s", self.m_logPath, "/log_" , dateFileName , ".log");
	return fileFullPath;
end