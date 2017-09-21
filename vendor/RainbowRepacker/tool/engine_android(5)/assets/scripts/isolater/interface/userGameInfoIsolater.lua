require("gameData/dataInterfaceBase");
local UserGameRecordData = require("hall/userInfo/data/userGameRecordData");
require("hall/userInfo/data/userInfoData");

--玩家游戏信息
UserGameInfoIsolater = class(DataInterfaceBase);

UserGameInfoIsolater.eRecordItemType = {
	Lose = UserGameRecordData.eRecordItemType.Lose;--输
    Draw = UserGameRecordData.eRecordItemType.Draw; --平局
    Win  = UserGameRecordData.eRecordItemType.Win; --赢
    WinMax = UserGameRecordData.eRecordItemType.WinMax; --最大赢钱数
};

UserGameInfoIsolater.Delegate = {
	onGetGamePlayInfoCallBack = "onGetGamePlayInfoCallBack";
};

UserGameInfoIsolater.getInstance = function()
	if not UserGameInfoIsolater.s_instance then
		UserGameInfoIsolater.s_instance = new(UserGameInfoIsolater); 
	end
	return UserGameInfoIsolater.s_instance;
end

UserGameInfoIsolater.ctor = function(self)
	kUserInfoData:setObserver(self);
end

UserGameInfoIsolater.dtor = function(self)
	kUserInfoData:clearObserver(self);
end
----------------------------------------------------------------------
--根据游戏ID获取游戏输赢记录
UserGameInfoIsolater.getGameRecordData = function(self,gameId)
	return kUserInfoData:getGameRecordData(gameId);
end

--根据Key来获取数据
UserGameInfoIsolater.getGameRecordItemValueWithKey = function(self,gameId,key)
	return kUserInfoData:getGameRecordItemValueWithKey(gameId,key);
end

--根据Key来设置数据
UserGameInfoIsolater.setGameRecordItemValueWithKey = function(self,gameId,key,newValue)
	kUserInfoData:setGameItemValueWithKey(gameId,key,newValue);
end

--获取用户游戏中某项数据的值(输、赢、平、最大赢钱数)
UserGameInfoIsolater.getGameRecordItemValue = function(self,gameId,recordItemType)
	return kUserInfoData:getGameRecordItemValue(gameId,recordItemType);
end

----刷新用户游戏记录(输、赢、平、最大赢钱数)
--@param: newValue 不传则会在原来基础上+1
UserGameInfoIsolater.refreshGameRecordItemValue = function(self,gameId,recordItemType,newValue)
	return kUserInfoData:refreshGameRecordItemValue(gameId,recordItemType,newValue);
end
------------------------------------------------------------------------------
UserGameInfoIsolater.onGetGamePlayInfoCallBack = function(self,isSuccess,gameId, gameRecordInfo)
    self:notify(UserGameInfoIsolater.Delegate.onGetGamePlayInfoCallBack, isSuccess,gameId, gameRecordInfo);
end
------------------------------------------------------------------------------
--获得的历史最高分
UserGameInfoIsolater.updateHighestScore = function(self,score)
    kUserInfoData:updateHighestScore(score);
end
UserGameInfoIsolater.getHighestScore = function(self)
    return kUserInfoData:getHighestScore();
end
