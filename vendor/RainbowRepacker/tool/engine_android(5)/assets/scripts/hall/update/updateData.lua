require("core/object");
require("util/TableLib");

UpdateData = class();

UpdateData.getInstance = function()
	if not UpdateData.s_instance then
		UpdateData.s_instance = new(UpdateData);
		UpdateData.s_instance:loadTask();
	end
	return UpdateData.s_instance;
end

UpdateData.releaseInstance = function(self)
	delete(UpdateData.s_instance);
	UpdateData.s_instance = nil;
end

UpdateData.ctor = function(self)
	
end

UpdateData.dtor = function(self)
	self:unloadTask();
end

UpdateData.dictName="update";
UpdateData.dict_key_hallVersion="system_update_hallVersion";
UpdateData.dict_key_apkVersion="system_update_apkVersion";
UpdateData.dict_key_task="system_update";

UpdateData.loadTask = function(self)
Log.v("UpdateData.loadTask");

	if not self.m_dict then
		self.m_dict = new(Dict,UpdateData.dictName);
		self.m_dict:load();
	end

	local m_updateData = self.m_dict:getString(UpdateData.dict_key_task);
	if m_updateData and m_updateData~="" then
		self.data=json.decode(m_updateData);

		local isShouldDelete=false;--只要更新了apk或者更新了大厅，以前的更新文件就不能用了
		
		if not isShouldDelete then
			local hallVersion=kGameManager:getGameVersion(GameType.HALL);
			isShouldDelete = (self.m_dict:getInt(UpdateData.dict_key_hallVersion) or 0)~= hallVersion;
		end
		
		if not isShouldDelete then
			local apkVersion=kClientInfo:getApkVersion();
			isShouldDelete = (self.m_dict:getString(UpdateData.dict_key_apkVersion) or "") ~= apkVersion;
		end

		if isShouldDelete then
			self.m_dict:delete();
			self.m_dict:save();
			return;
		end

		self:initData(self.data);
	end
end

UpdateData.unloadTask = function(self)
	Log.v("UpdateData.unloadTask");
	delete(self.m_dict);
	self.m_dict = nil;
end
---------------------------------------------------------------
UpdateData.initData = function(self,data)
	Log.v("UpdateData.initData",data);

	if not data then
		return;
	end

	self.isApkUpdate=false;
	self.isHallUpdate=false;

	if table.isTable(data) and table.isTable(data.app) then
		self.isApkUpdate  = (data.app.flag == 1 or false);
	end

	if table.isTable(data) and table.isTable(data.hall) then
		self.isHallUpdate = (data.hall.flag == 1 or false);
	end
	--增强判断

	if self.isApkUpdate then
		local currentApkVersionCode=dict_get_string("android_app_info","version_name") or "1.0.0";
		 self.isApkUpdate = not (currentApkVersionCode == data.app.version);

		 if not self.isApkUpdate then
		 	HallUpdateConfig.getInstance():setHallUpdateStatus(0);
		 	Log.v("UpdateData.initData you must installed apk just now !");
		 end
	end

	if self.isHallUpdate then
		local hallCode=kGameManager:getGameVersion(GameType.HALL);
		 self.isHallUpdate = not (hallCode == data.hall.version);

		 if not self.isHallUpdate then
		 	HallUpdateConfig.getInstance():setHallUpdateStatus(0);
		 	Log.v("UpdateData.initData you must installed apk/update hall just now !");
		 end
	end

	if not self.isApkUpdate and not self.isHallUpdate then
		HallUpdateConfig.getInstance():setHallUpdateStatus(0);
	end

	data = table.verify(data);
	self.data=data;
	self.apkData=data.app or {};
	self.hallData=data.hall or {};
	self.gameData=data.games or {};
	self.updateTotalSize=0;

	if self.isApkUpdate then

		self.apkData.downloadstatus=KDownloadStatus_NotStart;

	elseif self.isHallUpdate then

		self.hallData.downloadstatus=KDownloadStatus_NotStart;

		self.updateTotalSize=number.valueOf(self.hallData.size);
		for k,v in pairs(table.verify(data.games)) do
			if v.flag ==1 then
				self.updateTotalSize=self.updateTotalSize+v.size;
			end
			v.downloadstatus=KDownloadStatus_NotStart;
		end
	else
		
		for k,v in pairs(table.verify(data.games)) do
			if v.flag ==1 then
				self.updateTotalSize=self.updateTotalSize+v.size;
			end
			v.downloadstatus=KDownloadStatus_NotStart;
		end
	end
end

UpdateData.setUpdateData = function(self,data)
	Log.v("UpdateData.setUpdateData");
	self:initData(data);

	local m_updateData=json.encode(data);
	self.m_dict:setInt(UpdateData.dict_key_hallVersion,kGameManager:getGameVersion(GameType.HALL));
	self.m_dict:setString(UpdateData.dict_key_apkVersion,kClientInfo:getApkVersion());
	self.m_dict:setString(UpdateData.dict_key_task,m_updateData);
	self.m_dict:save();
end

UpdateData.getUpdateData = function(self)
	Log.v("UpdateData.getUpdateData");
	return table.verify(self.data);
end

UpdateData.getApkData = function(self)
	Log.v("UpdateData.getApkData");
	return table.verify(self.apkData);
end

UpdateData.getHallData = function(self)
	Log.v("UpdateData.getHallData");
	return table.verify(self.hallData);
end

UpdateData.getGameData = function(self)
	return table.verify(self.gameData);
end

UpdateData.getGameUpdateDataByGameId = function(self, gameId)
	for k, v in pairs( self:getGameData() ) do
		if gameId == v.id then
			return v;
		end
	end

	return {};
end


UpdateData.isApkUpdated = function(self)
	Log.v("UpdateData.isApkUpdated");
	return self.isApkUpdate or false ;
end

UpdateData.isHallUpdated = function(self)
	Log.v("UpdateData.isHallUpdated");
	return self.isHallUpdate or false ;
end

--这里当非静默更新才提示有更新，即可选更新和强制更新默认左上角显示更新，但静默更新左上角不显示更新
UpdateData.isGameUpdated = function(self,gameId)
	Log.v("UpdateData.isGameUpdated");
	
	for k,v in pairs(self:getGameData()) do
		if gameId == v.id then
			return (v.flag ==1 and v.version ~= kGameManager:getGameVersion(gameId) and v.update_type ~= 3);
		end
	end
	return false;
end

UpdateData.isForceGameUpdated = function(self,gameId)
	Log.v("UpdateData.isForceGameUpdated");
	
	for k,v in pairs(self:getGameData()) do
		if gameId == v.id then
			return (v.flag ==1 and v.version ~= kGameManager:getGameVersion(gameId) and v.update_type == 2);
		end
	end
	return false;
end

UpdateData.getDataByUrl = function(self,url)
	Log.v("UpdateData.getDataByUrl");
	if not self.data or not url then
		return;
	end

	if table.isTable(self.data.app) and self.data.app.url == url then
		return self.data.app;
	elseif table.isTable(self.data.hall) and self.data.hall.url == url then
		return self.data.hall;
	else
		local games=table.verify(self.data.games);
		for k,v in pairs(games) do
				if v.url == url then
					return v;
				end
		end
	end

	return nil;
end

UpdateData.save = function(self)
	Log.v("UpdateData.save");
	if self.data then

		if table.isTable(self.data.app) then
			self.data.app.downloadstatus=nil;
		end
		
		if table.isTable(self.data.hall) then
			self.data.hall.downloadstatus=nil;
		end
		
		local games=table.verify(self.data.games);
		for k,v in pairs(games) do
				v.downloadstatus=nil;
		end
		local m_updateData=json.encode(self.data);
		self.m_dict:setInt(UpdateData.dict_key_hallVersion,kGameManager:getGameVersion(GameType.HALL));
		self.m_dict:setString(UpdateData.dict_key_apkVersion,kClientInfo:getApkVersion());
		self.m_dict:setString(UpdateData.dict_key_task,m_updateData);
		self.m_dict:save();
	end
end

UpdateData.getUpdateSize = function(self)
	Log.v("UpdateData.getUpdateSize");
	return self.updateTotalSize or 0;
end

UpdateData.deleteConfig = function(self)
	self.m_dict:delete();
	self.m_dict:save();
end
