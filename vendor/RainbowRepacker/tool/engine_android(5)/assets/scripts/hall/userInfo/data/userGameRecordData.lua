--[[
	相应游戏的胜负情况
]]

require("gameData/gameData");

local UserGameRecordData = class(GameData);

UserGameRecordData.eRecordItemType = {
    Lose = -1;--输
    Draw = 0; --平局
    Win  = 1; --赢
    WinMax = 2; --最大赢钱数
}

UserGameRecordData.Delegate = {
    onGetGamePlayInfoCallBack = "onGetGamePlayInfoCallBack";
}

UserGameRecordData.initData = function(self)
	self.m_recordData = {};
end

UserGameRecordData.cleanup = function(self)
    self:initData();
end

UserGameRecordData.__requestData = function(self, gameId)
    if not self.m_recordData[gameId] then
        OnlineSocketManager.getInstance():sendMsg(PHP_GAME_PLAY_INFO, {["game_id"] = gameId});
    end
end

UserGameRecordData.onGetGamePlayInfoCallBack = function(self, isSuccess, info, sendParam)
    Log.d("UserGameRecordData.onGetGamePlayInfoCallBack","isSuccess = ",isSuccess,"info = ",info,"sendParam = ",sendParam);
    if not isSuccess then
        self:execDelegate(UserGameRecordData.Delegate.onGetGamePlayInfoCallBack, false);
        return;
    end

    local game_id, recordData = self:__analysisData(info);
    self:execDelegate(UserGameRecordData.Delegate.onGetGamePlayInfoCallBack, true, game_id, Copy(recordData) );
end

UserGameRecordData.__analysisData = function(self, info)
    local data = {};
    data.extParam = {};
    for key, v in pairs(info) do
        if key == "losetimes" then
            data.loseTimes = tonumber(v) or 0; --输的次数
        elseif key == "wintimes" then
            data.winTimes = tonumber(v) or 0; --赢的次数
        elseif key == "drawtimes" then
            data.drawTimes = tonumber(v) or 0; --平局次数
        elseif key == "winmax" then
            data.winMax = tonumber(v) or 0; --最高赢钱
        else
            data.extParam[key] = v;
        end
    end

    local game_id = tonumber(info.game_id) or -1;

    self.m_recordData[game_id] = data;

    return game_id, data;
end

--获取游戏记录数据
UserGameRecordData.getGameRecordData = function(self, gameId)
    if gameId and gameId > 0 then
        self:__requestData(gameId);
        return Copy(self.m_recordData[gameId]) or {};
    else
        return {};
    end
end

--根据Key来获取数据
--@note 如果公共部分未找到，则回去extParam里面寻找
UserGameRecordData.getGameRecordItemValueWithKey = function(self, gameId, key)
    local data = self.m_recordData[gameId];
    if table.isEmpty(data) then
        return 0;
    end

    if data[key] then
        return data[key];
    else
        return data.extParam and data.extParam[key] or 0;
    end
end

--根据Key来设置数据
UserGameRecordData.setGameItemValueWithKey = function(self, gameId, key, newValue)
    local data = self.m_recordData[gameId];
    if table.isEmpty(data) or not newValue then
        return false;
    end

    if data[key] then
        data[key] = newValue;
    else
        data.extParam = table.verify(data.extParam);
        data.extParam[key] = newValue;
    end

    return true;
end

--此接口负责获取公共部分的数据
--@note 此接口只支持获取eRecordItemType
UserGameRecordData.getGameRecordItemValue = function(self, gameId, itemType)
   if kAppData:isInPrivateRoom() then
        return 0;
    end 

    local data = table.verify(self.m_recordData[gameId]);
    local key = self:__getKeyWithItemType(itemType);
    if not key then
        return 0;
    end

    return data[key] or 0;
end

--此接口负责获取公共部分的数据
--@param: newValue 不传则会在原来基础上+1
UserGameRecordData.refreshGameRecordItemValue = function(self, gameId, itemType, newValue)
    if not (gameId and itemType) then
        return;
    end

    local oldValue = self:getGameRecordItemValue(gameId, itemType);
    newValue = newValue or number.valueOf(oldValue)+1;

    local data = table.verify(self.m_recordData[gameId]);
    local key = self:__getKeyWithItemType(itemType);
    if not key then
        return;
    end

    data[key] = newValue;
    self.m_recordData[gameId] = data;
end

--强制刷新某个游戏的所有记录
UserGameRecordData.refreshGameAllRecord = function(self,gameId)
    if not gameId then
        return;
    end

    self.m_recordData[gameId] = nil;
    self:__requestData(gameId);
end

UserGameRecordData.__getKeyWithItemType = function(self, itemType)
    if itemType == UserGameRecordData.eRecordItemType.Lose then
        return "loseTimes"

    elseif itemType == UserGameRecordData.eRecordItemType.Draw then
        return "drawTimes";

    elseif itemType == UserGameRecordData.eRecordItemType.Win then
        return "winTimes";

    elseif itemType == UserGameRecordData.eRecordItemType.WinMax then
        return "winMax";
    end
end

UserGameRecordData.s_socketCmdFuncMap = {
    [PHP_GAME_PLAY_INFO] = UserGameRecordData.onGetGamePlayInfoCallBack;
}

return UserGameRecordData;