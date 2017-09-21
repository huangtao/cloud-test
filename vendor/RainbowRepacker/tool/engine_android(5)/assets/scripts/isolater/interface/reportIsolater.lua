--数据上报接口

require("gameData/dataInterfaceBase");
require("ubReport/ubReport");
require("isolater/interface/gameInfoIsolater");

ReportIsolater = class(DataInterfaceBase);

--获取实例
ReportIsolater.getInstance = function()
	if not ReportIsolater.s_instance then
		ReportIsolater.s_instance = new(ReportIsolater); 
	end
	return ReportIsolater.s_instance;
end

ReportIsolater.releaseInstance = function()
	delete(ReportIsolater.s_instance);
	ReportIsolater.s_instance = nil;
end

--@brief 游戏内上报数据中心
--@param actionID 事件id
--@param addGame:是否区分游戏
--@param addLevel:是否区分等级
ReportIsolater.report = function(self, actionID, addGame, addLevel)
	if type(actionID)~="string" then
		return;
	end

	if addGame then
		if addLevel then
			UBReport.getInstance():report(actionID, string.format("gameId%s_levelId%s", GameInfoIsolater.getInstance():getCurGameId() or "",
				GameInfoIsolater.getInstance():getCurRoomLevelId() or ""));
		else
			UBReport.getInstance():report(actionID, string.format("gameId%s", GameInfoIsolater.getInstance():getCurGameId() or ""));
		end
	else
		if addLevel then
			UBReport.getInstance():report(actionID, string.format("levelId%s", GameInfoIsolater.getInstance():getCurRoomLevelId() or ""));
		else
			UBReport.getInstance():report(actionID);
		end
	end
end

--@brief 游戏内上报数据中心
--@actionID 事件id
--@val 参数值
ReportIsolater.reportWithVal = function(self, actionID, val)
	if type(actionID) ~= "string" then
		return;
	end

	UBReport.getInstance():report(actionID, val);
end

-- 游戏内上报umeng
--@errorMsg 错误信息
ReportIsolater.umengError = function(self, errorMsg)
	if (not errorMsg) then
		return;
	end
	local info = "";
	if type(errorMsg) == "table" then 
		info = Log.__getStrInfo("--ERROR--","",errorMsg);
	else
		info = tostring(errorMsg);
	end

	local gameId = GameInfoIsolater.getInstance():getCurGameId() or "";
	local levelId = GameInfoIsolater.getInstance():getCurRoomLevelId() or "";
	local hallVersion = GameInfoIsolater.getInstance():getHallVersion() or 0;
	local gameVersion = GameInfoIsolater.getInstance():getGameVersion(gameId) or 0;
	local uid = UserBaseInfoIsolater.getInstance():getUserId() or "";
	local msg = "uid=%s,hallVersion=%s,gameId=%s,gameVersion=%s,levelId=%s,info=%s"
	local errorInfo = string.format(msg,uid,hallVersion,gameId,gameVersion,levelId,info);
	NativeEvent.getInstance():umengError("lua" , errorInfo);
end