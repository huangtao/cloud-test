require("games/common2/match/socket/matchSocketCmd");

MatchSocketWriter = class(CommonSocketWriter);

MatchSocketWriter.ctor = function(self)
    local name = "MatchSocketWriter";
end 

MatchSocketWriter.onReqDingjusaiJion = function(self,packetId,info)
    Log.d("MatchSocketWriter.onReqDingjusaiJion",info);
    self.m_socket:writeInt(packetId,info.uid or 0);
    self.m_socket:writeInt(packetId,info.matchRoomId or 0);
    self.m_socket:writeString(packetId,info.key or "");
    self.m_socket:writeString(packetId,info.userInfo or "");
    self.m_socket:writeInt(packetId,info.flag or 0);
    self.m_socket:writeString(packetId,info.matchentrycode or "");
    self.m_socket:writeByte(packetId,info.matchOnlookerType or 1);--比赛能否被围观：1可以被围观，0不能被围观
end


MatchSocketWriter.onRequestUpdatePeoleCount = function(self, packetId, info)
    -- body
    self.m_socket:writeInt(packetId, info.mid or 0);
    self.m_socket:writeInt(packetId, info.matchRoomId or 0);
end

MatchSocketWriter.onClientSendChatMsg = function(self, packetId, info)
    self.m_socket:writeString(packetId, info.msgInfo or "");
end

MatchSocketWriter.onRequestWithDraw = function(self, packetId, info)
--  self.m_socket:writeInt(packetId, info.mid or 0);
    self.m_socket:writeInt(packetId, info.matchId or 0);
end

MatchSocketWriter.onReviveResquest = function(self, packetId, info)
    self:log("MatchSocketWriter.onReviveResquest", "info", info);
    -- info = {
    -- flag : 是否复活，是为1，否为0
    -- prop_type : 选择的复活类型     
    -- }
    self.m_socket:writeString(packetId, json.encode(info) or "");
end

MatchSocketWriter.onClientChatReport = function(self,packetId, info)
    self.m_socket:writeInt(packetId, info.mid or 0);
    self.m_socket:writeInt(packetId, info.otherMid or 0);
end

MatchSocketWriter.onRequestRankDetail = function(self,packetId,info)
    self.m_socket:writeInt(packetId,info.matchId or 0);--比赛id
    self.m_socket:writeInt(packetId,info.userId or 0);  --正常比赛：请求排名的玩家id;围观房：被围观者id 
end

MatchSocketWriter.onRequestRule = function(self,packetId,info)
end

MatchSocketWriter.onRequestGroupInfo = function(self, packetId, info)
    self.m_socket:writeInt(packetId, info.userId or 0);
end

MatchSocketWriter.s_clientCmdFunMap = {    
    [MatchSocketCmd.MATCH_DINGJU_RQUEST_SIGHUP]                = MatchSocketWriter.onReqDingjusaiJion;

    [MatchSocketCmd.MATCH_DINGJU_MATCH_UPDATEPEOPLE_REQUEST]   = MatchSocketWriter.onRequestUpdatePeoleCount;--更新房间人数
    [MatchSocketCmd.MATCH_DINGJU_MATCH_WITHDRAW_REQUEST]       = MatchSocketWriter.onRequestWithDraw;--退赛

    [MatchSocketCmd.CLIENT_CMD_SEND_CHAT_MSG]                  = MatchSocketWriter.onClientSendChatMsg;
    [MatchSocketCmd.CLIENT_CMD_MATCH_CHAT_COMPLAINT]           = MatchSocketWriter.onClientChatReport;

    ---------------------------------------- 复活赛 --------------------------------------------
    [MatchSocketCmd.MATCH_REVIVE_REQUEST] = MatchSocketWriter.onReviveResquest;

    [MatchSocketCmd.MATCH_RANK_DETAIL_REQUEST] = MatchSocketWriter.onRequestRankDetail;
    [MatchSocketCmd.MATCH_RULE_REQUEST] = MatchSocketWriter.onRequestRule;
    [MatchSocketCmd.MATCH_GROUP_INFO_REQUEST] = MatchSocketWriter.onRequestGroupInfo;
};