require("gameData/gameData");

HallUpdateConfig = class(GameData);

HallUpdateConfig.getInstance = function()
	if not HallUpdateConfig.s_instance then
		HallUpdateConfig.s_instance = new(HallUpdateConfig);
	end
	return HallUpdateConfig.s_instance;
end

HallUpdateConfig.initData = function(self)
	self.m_hallUpdateStatus = 0;
end

HallUpdateConfig.loadDictData = function(self, dict)
	self.m_hallUpdateStatus = dict:getInt("key_hallUpdateStatus", 1);
end

HallUpdateConfig.saveDictData = function(self, dict)
	dict:setInt("key_hallUpdateStatus", self.m_hallUpdateStatus or 1);
end

--status 0，没有更新；1，有升级 ；3，有升级并且设置没有点击
HallUpdateConfig.setHallUpdateStatus = function(self,status) 
	self.m_hallUpdateStatus = status or self.m_hallUpdateStatus or 0;
	self:saveData();
end

HallUpdateConfig.getHallUpdateStatus = function(self,status) 
	if self.m_hallUpdateStatus =="" or self.m_hallUpdateStatus == nil then
		self.m_hallUpdateStatus = 0 ;
	end
	return self.m_hallUpdateStatus;
end

HallUpdateConfig.getGameStatus = function(self, gameId)
	gameId = gameId or 0;
	local gameVersion=kGameManager:getGameVersion(gameId);--本地版本号
	local minVersionCanPlay= kGameManager:getGamePlayableMinVersion(gameId);

	local status= HallGameStatus.Expect;

	if gameId == 0    and gameVersion == 0 then
		status= HallGameStatus.Expect;--敬请期待
	elseif gameId >0  and gameVersion >0 and gameVersion >= minVersionCanPlay then
		status= HallGameStatus.CanPlay;--无变化，可以玩

		--游戏有更新时候，并且非强制更新提示更新
		if UpdateData.getInstance():isGameUpdated(gameId) then
			status= HallGameStatus.CanUpdate;

			--非强制更新，当大厅有更新时，游戏更新一律更改为可以玩（只有下载完大厅，才可以更新游戏）
			if UpdateData.getInstance():isHallUpdated() then
				status = HallGameStatus.CanPlay;
			end
		end

	elseif gameId >0  and gameVersion >0 and gameVersion < minVersionCanPlay then
		status = HallGameStatus.CanUpdate;--可更新
	elseif gameId >0  and gameVersion ==0 then
		status = HallGameStatus.CanInstall;--可以安装
	end

	--当大厅未下载失败的时候,游戏是否可以更新? 1,的确可以更新;2,只有在大厅更新成功后才可以更新；3，不可更新

	Log.v("HallUpdateConfig.getGameStatus"," gameId:" ,gameId ," minVersionCanPlay: " , minVersionCanPlay , " gameVersion:" , gameVersion , " status:" ,status );

	return status or HallGameStatus.Expect;
end

