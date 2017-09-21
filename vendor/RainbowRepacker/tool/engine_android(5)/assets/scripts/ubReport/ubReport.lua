require("core/object");
require("ubReport/ubConfig");
require("ubReport/dReport");

UBReport = class();

UBReport.isFirstReport = true

UBReport.getInstance = function()
	if not UBReport.s_instance then
		UBReport.s_instance = new(UBReport);
	end
	return UBReport.s_instance;
end

UBReport.releaseInstance = function()
	delete(UBReport.s_instance);
	UBReport.s_instance = nil;
end

UBReport.report = function(self, action, val)
    if not string.isEmpty(action) then
        action = tostring(action)
        self:doFirstReport(action, val)
        DReport.getInstance():report(action, false, val)
    end
end

UBReport.doFirstReport = function(self, action, val)
    if type(val) ~= "nil" and type(val) ~= "string" and type(val) ~= "number" then
        return
    end
    if UBReport.isFirstReport and UBFirstReport.Items[action] then
        UBReport.isFirstReport = false
        local isCurRegister = kUserInfoData:getIsCurRegister()
        local isRmb = kUserInfoData:getIsRmb()
        local firstAction = (val and val ~= "") and string.format("%s_%s_%s", action, "first", val) or string.format("%s_%s", action, "first")
        if isCurRegister then --新用户
            DReport.getInstance():report(firstAction, false, UBFirstReport.Type.New, true)
        else --老用户
            DReport.getInstance():report(firstAction, false, UBFirstReport.Type.Old, true)
            if isRmb then --人民币玩家
                DReport.getInstance():report(firstAction, false, UBFirstReport.Type.Rmb, true)
            else --非人民币玩家
                DReport.getInstance():report(firstAction, false, UBFirstReport.Type.Non_Rmb, true)
            end
        end
    end
end

--@brief 上报子游戏版本号
--@note 一次启动只会上报一次
UBReport.reportSubGameVersion = function(self, gameId)
    if not gameId  then
        return;
    end

    self.m_gameVersionReportRecord = table.verify(self.m_gameVersionReportRecord);
    if self.m_gameVersionReportRecord[gameId] then
        return;
    end

    self.m_gameVersionReportRecord[gameId] = true;

    local param = {
        gid = gameId;
        gameVer = kGameManager:getGameVersion(gameId);
    };

    OnlineSocketManager.getInstance():sendMsg(PHP_REPORT_GAME_VERSION, param);
end