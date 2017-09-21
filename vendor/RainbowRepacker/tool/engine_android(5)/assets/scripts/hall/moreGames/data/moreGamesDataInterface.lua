require("gameData/clientInfo");
require("gameData/dataInterfaceBase");

MoreGamesDataInterface = class(DataInterfaceBase);

MoreGamesDataInterface.Delegate = {
	onGetMoreGamesListCallBack = "onGetMoreGamesListCallBack"; -- 更多游戏列表回调
	updateGameInstallStatusCallBack = "updateGameInstallStatusCallBack"; -- 安装状态更新回调
};

MoreGamesDataInterface.getInstance = function()
	if not MoreGamesDataInterface.s_instance then
		MoreGamesDataInterface.s_instance = new(MoreGamesDataInterface);
	end

	return MoreGamesDataInterface.s_instance;
end

MoreGamesDataInterface.hasInstance = function()
	return MoreGamesDataInterface.s_instance;
end

MoreGamesDataInterface.releaseInstance = function()
	delete(MoreGamesDataInterface.s_instance);
	MoreGamesDataInterface.s_instance = nil;
end

MoreGamesDataInterface.ctor = function(self)
	self.m_moreGamesListConfig = new(require("hall/moreGames/data/moreGamesListConfig"), self);
end

MoreGamesDataInterface.dtor = function(self)
	delete(self.m_moreGamesListConfig);
	self.m_moreGamesListConfig = nil;
end

---------------------------------------------------------------------------------------
MoreGamesDataInterface.getMoreGamesList = function(self)
	return self.m_moreGamesListConfig:getGameList();
end

MoreGamesDataInterface.setGameList = function(self,isSuccess,info)
	self.m_moreGamesListConfig:setGameList(isSuccess,info)
end

MoreGamesDataInterface.onGetMoreGamesListCallBack = function(self,isSuccess,data)
	self:notify(MoreGamesDataInterface.Delegate.onGetMoreGamesListCallBack, isSuccess, data);
end

MoreGamesDataInterface.updateGameDownloadStatus = function(self,gameId,status)
	self.m_moreGamesListConfig:updateGameDownloadStatus(gameId,status);
end

MoreGamesDataInterface.getDataByDownloadStatus = function(self,status)
	return Copy(self.m_moreGamesListConfig:getDataByDownloadStatus(status));
end

MoreGamesDataInterface.updateOpenStatus = function(self)
	self.m_moreGamesListConfig:updateOpenStatus();
end

MoreGamesDataInterface.getOpenStatus = function(self)
	return self.m_moreGamesListConfig:getOpenStatus();
end
---------------------------------------------------------------------------------------
MoreGamesDataInterface.updateGameInstallStatus = function(self,gameId)
	if not gameId then 
		self:notify(MoreGamesDataInterface.Delegate.updateGameInstallStatusCallBack,false);
		return;
	end 
	local param = {};
	param.gameid = gameId;
	param.guid = kClientInfo:getGuid();
	OnlineSocketManager.getInstance():sendMsg(PHP_MOREGAMES_UPDATEINSTALL,param);
end

MoreGamesDataInterface.updateGameInstallStatusCallBack = function(self,isSuccess,info,requestParam)
	Log.d("MoreGamesDataInterface.updateGameInstallStatusCallBack","isSuccess = ",isSuccess,"info = ",info,"requestParam = ",requestParam);
	if not isSuccess then 
		self:notify(MoreGamesDataInterface.Delegate.updateGameInstallStatusCallBack,false,requestParam.gameid);
	else 
		local status = tonumber(info.info) or 0;
		self:notify(MoreGamesDataInterface.Delegate.updateGameInstallStatusCallBack,status == 1,requestParam.gameid);
	end 
end

---------------------------------------------------------------------------------------
MoreGamesDataInterface.packePageList = function(self,gameList,pageNum)	
	gameList = table.verify(gameList);
	pageNum = tonumber(pageNum) or 1;

	local pageList = {};
	local size = #gameList;
	local intValue,floatValue = math.modf(size/pageNum);
	local pageCount = intValue + (floatValue > 0 and 1 or 0);

	local level = size;
	for i = 1, pageCount do
		pageList[i] = {};

		for j = 1, pageNum do
			if (i-1)*pageNum+j <= size then
				pageList[i][j] = gameList[(i-1)*pageNum+j];

                local preItem = pageList[i][j-1];
				local curItem = pageList[i][j];
				curItem.level = level;
				if j == pageNum then
					curItem.levelPre = preItem.level;
					curItem.isPageEnd = true;
				else
					curItem.isPageEnd = false;
				end
				level = level - 1;
			else
				break;
			end
		end
	end

	return pageList;
end

MoreGamesDataInterface.s_socketCmdFuncMap = {
	[PHP_MOREGAMES_UPDATEINSTALL]	 = MoreGamesDataInterface.updateGameInstallStatusCallBack;
};