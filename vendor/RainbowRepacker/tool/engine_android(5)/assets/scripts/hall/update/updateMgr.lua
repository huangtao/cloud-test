require("core/object");
require("common/httpDownload");
require("util/TableLib");
 local IosReplaceInstallLogic = require("hall/update/iosReplaceInstallLogic");

-----------------------------------全局函数-----------------------------------
KTaskType_Update_APK_Patch 	=1;--APK增量更新
KTaskType_Update_APK 		=2;--APK全量更新
KTaskType_Update_APK_Third 	=3;--第三方自更新
KTaskType_Update_HALL		=4;--更新大厅
KTaskType_Update_GAME		=5;--更新游戏
KTaskType_Download_GAME		=6;--下载新游戏

KDownloadStatus_NotStart	=1;--未开始
KDownloadStatus_begin		=2;--未开始
KDownloadStatus_Success 	=3;--下载失败
KDownloadStatus_Failed  	=4;--下载成功

--更新功能相关的逻辑类
UpdateMgr = class();

UpdateMgr.getInstance = function()
	if not UpdateMgr.s_instance then
		UpdateMgr.s_instance = new(UpdateMgr);
	end
	return UpdateMgr.s_instance;
end

UpdateMgr.releaseInstance = function(self)
	delete(UpdateMgr.s_instance);
	UpdateMgr.s_instance = nil;
end

UpdateMgr.ctor = function(self)
	self.listeners={
		["downloadListener"]={};
		["downloadProgressListener"]={};
	};

	self.tasks={};
	self.tasksDownloadSuccess={};
	self.tasksUpdateSuccess={};
end

UpdateMgr.dtor = function(self)
	self.listeners=nil;
	self.tasks=nil;
	self.tasksDownloadSuccess=nil;
	self.tasksUpdateSuccess=nil;
end

-----------------------监听器-------------------------------
--@brief 注册下载监听器
UpdateMgr.registDownloadListener=function(self, obj ,func)
	Log.v("UpdateMgr.registDownloadListener");
	local callback = self.listeners["downloadListener"];
	callback.obj = obj;
	callback.func = func;
end

--@brief 反注册监听器
UpdateMgr.unRegistDownloadListener=function(self )
	Log.v("UpdateMgr.unRegistDownloadListener");
	local callback = self.listeners["downloadListener"];
	if not table.isEmpty(callback) then
		callback.obj = nil;
		callback.func = nil;
		callback=nil;
	end
end

--@brief 注册下载进度监听器
UpdateMgr.registDownloadProgressListener=function(self , obj ,func)
	Log.v("UpdateMgr.registDownloadProgressListener");
	local callback = self.listeners["downloadProgressListener"];
	callback.obj = obj;
	callback.func = func;
end

--@brief 反注册下载进度监听器
UpdateMgr.unRegistDownloadProgdressListener=function(self )
	Log.v("UpdateMgr.unRegistDownloadProgdressListener");
	local callback = self.listeners["downloadProgressListener"];
	if not table.isEmpty(callback) then
		callback.obj = nil;
		callback.func = nil;
		callback=nil;
	end
end

--@brief 更新大厅 or APK
UpdateMgr.update = function(self)
	Log.v("UpdateMgr.update");
	if UpdateData.getInstance():isApkUpdated() then
		self:__onUpdateAPK();
	elseif UpdateData.getInstance():isHallUpdated() then
		self:__onUpdateHall();
	end
	self:startUpdateTask();
end

--@brief 更新大厅
UpdateMgr.__onUpdateHall = function(self)
	Log.v("UpdateMgr.__onUpdateHall");

	local data=UpdateData.getInstance():getHallData();
	
	local downloadData={};
	downloadData.type=KTaskType_Update_HALL;
	downloadData.downloadstatus=KDownloadStatus_begin;

	downloadData.gameId=GameType.HALL;
	downloadData.url=data.url;
	downloadData.oldVersion=kGameManager:getGameVersion(GameType.HALL);
	downloadData.newVersion=data.version;
	downloadData.hash=data.hash;
	downloadData.data=data;

	if not self:isTaskInQueen(downloadData.url) then
		self.tasks[#self.tasks+1]=downloadData;
	end
end

--@brief 更新apk
UpdateMgr.__onUpdateAPK = function(self)
	Log.v("UpdateMgr.__onUpdateAPK");

	kClientInfo:getPhoneInfo();

	local data=UpdateData.getInstance():getApkData();

	if data.update_mode == 1 then
		--KTaskType_Update_APK_Third 第三方自更新
		local info = {};
		info.url = data.url or "";
		local json_data = json.encode(info);
		NativeEvent.getInstance():openBrowser(json_data);
		return;
	else
		local _type=nil;
		if data.update_mode ==0 then
			_type=KTaskType_Update_APK_Patch;
		elseif data.update_mode ==2 then
			_type=KTaskType_Update_APK;
		end

		if _type then
			local downloadData={}; 
			downloadData.type= _type;
			downloadData.downloadstatus=KDownloadStatus_begin;

			downloadData.gameId=-1;
			downloadData.url=data.url;
			downloadData.oldVersion=kClientInfo:getApkVersion();
			downloadData.newVersion=data.version;
			downloadData.hash=data.hash;
			downloadData.data=data;

			if not self:isTaskInQueen(downloadData.url) then
				self.tasks[#self.tasks+1]=downloadData;
			end
		end
	end
end

--@brief 更新游戏
UpdateMgr.updateGame = function(self,gameid)
	local ret = false;
	local data=UpdateData.getInstance():getGameData();
	for k,v in pairs(data) do
		if gameid == v.id then
			ret=true;

			local downloadData={};
			downloadData.type=KTaskType_Update_GAME;
			downloadData.downloadstatus=KDownloadStatus_begin;
			
			downloadData.gameId=v.id;
			downloadData.url=v.url;
			downloadData.oldVersion=kGameManager:getGameVersion(gameid);
			downloadData.newVersion=v.version;
			downloadData.hash=v.hash;
			downloadData.data=v;

			if not self:isTaskInQueen(downloadData.url) then
				self.tasks[#self.tasks+1]=downloadData;
			end
			break;
		end
	end

	Log.v("UpdateMgr.updateGame", ret);
	if not ret then
		local callback = self.listeners["downloadListener"];
		if not table.isEmpty(callback) then
			if callback.func and callback.obj then
				callback.func(callback.obj , {id=gameid} , false);
			end
		end
	end

	self:startUpdateTask();
end

--@brief 下载游戏
UpdateMgr.downloadGame = function(self, data)
	Log.v("UpdateMgr.downloadGame");

	local downloadData={};
	downloadData.type=KTaskType_Download_GAME;
	downloadData.downloadstatus=KDownloadStatus_begin;

	downloadData.gameId=data.id;
	downloadData.url=data.url;
	downloadData.oldVersion=kGameManager:getGameVersion(data.id);
	downloadData.newVersion=0;
	downloadData.hash=data.hash;
	downloadData.data=data;

	if not self:isTaskInQueen(downloadData.url) then
		self.tasks[#self.tasks+1]=downloadData;
	end
	
	self:startUpdateTask();
end

--开始更新任务
UpdateMgr.startUpdateTask = function(self)
	Log.v("UpdateMgr.startUpdateTask()");

	if not self.isDownloading then

		self.downloadData=table.remove(self.tasks,1);
		
		if self.downloadData then
			
			Log.v("UpdateMgr.startUpdateTask()",self.downloadData);

			self.isDownloading=true;

			if self.downloadData.type == KTaskType_Download_GAME then

				self:downloadLuaZipFile(self.downloadData)

			elseif self.downloadData.type == KTaskType_Update_APK_Patch then

				self:downloadPatchFile(self.downloadData);

			elseif self.downloadData.type == KTaskType_Update_APK then

				self:downloadApkFile(self.downloadData);

			elseif self.downloadData.type == KTaskType_Update_HALL then
				
				self:downloadLuaZipFile(self.downloadData)

			elseif self.downloadData.type == KTaskType_Update_GAME then

				self:downloadLuaZipFile(self.downloadData)
			else
				self.isDownloading=false;
			end 
			return;
		else
			self.isDownloading=false;
		end
	end
end

--下载结果回调
UpdateMgr.onDownloadResponse=function(self ,success ,file ,url)
	if not self.downloadData then
		return
	end	
	Log.v("UpdateMgr.onDownloadResponse","success:",success);

	self.downloadData.downloadstatus = success and KDownloadStatus_Success or KDownloadStatus_Failed;

	if self.downloadData.type == KTaskType_Download_GAME then

		Log.v("UpdateMgr.onDownloadResponse KTaskType_Download_GAME");
		
		if success then
			self.tasksDownloadSuccess[#self.tasksDownloadSuccess+1]=self.downloadData;
		end

	elseif self.downloadData.type == KTaskType_Update_APK_Patch then

		Log.v("UpdateMgr.onDownloadResponse KTaskType_Update_APK_Patch");

	elseif self.downloadData.type == KTaskType_Update_APK then

		Log.v("UpdateMgr.onDownloadResponse KTaskType_Update_APK");

	elseif self.downloadData.type == KTaskType_Update_HALL then

		Log.v("UpdateMgr.onDownloadResponse KTaskType_Update_HALL");
		if success then
			self.tasksUpdateSuccess[#self.tasksUpdateSuccess+1]=self.downloadData;
		end

		if success then--大厅下载成功后，接着下载
			local data=UpdateData.getInstance():getGameData();
			local isHaveUpdateGame=false;
			for k,v in pairs(table.verify(data)) do
				if v.flag == 1 and (v.update_type ==3 or (v.update_type ~=3 and (v.size or 0) <300*1024)) then
					local downloadData={};
					downloadData.type=KTaskType_Update_GAME;
					downloadData.downloadstatus=KDownloadStatus_begin;
					
					downloadData.gameId=v.id;
					downloadData.url=v.url;
					downloadData.oldVersion=kGameManager:getGameVersion(downloadData.gameId);
					downloadData.newVersion=v.version;
					downloadData.hash=v.hash;
					downloadData.data=v;

					self.tasks[#self.tasks+1]=downloadData;
					
					isHaveUpdateGame=true;
				end
			end

			if isHaveUpdateGame then
				Log.v("UpdateMgr onDownloadResponse hallUpdate by itSelf ,because hall update has more then one task!");
				self.isDownloading=false;
				self:startUpdateTask();
				return;
			end
		else
			Log.v("UpdateMgr.onDownloadResponse KTaskType_Update_HALL Failed");
		end
	elseif self.downloadData.type == KTaskType_Update_GAME then

		Log.v("UpdateMgr.onDownloadResponse() KTaskType_Update_GAME");
		if success then
			self.tasksUpdateSuccess[#self.tasksUpdateSuccess+1]=self.downloadData;
		end

		if UpdateData.getInstance():isHallUpdated() then
			
			local isAllDownload=#self.tasks==0;
			if self.isAllDownloadSuccess == nil then
				self.isAllDownloadSuccess=true;
			end
			self.isAllDownloadSuccess = self.isAllDownloadSuccess and success;

			Log.v("UpdateMgr onDownloadResponse() isAllDownload:" , (isAllDownload and "true" or "false"));
			
			if isAllDownload then
				Log.v("UpdateMgr onDownloadResponse() isAllDownloadSuccess:" , (self.isAllDownloadSuccess and "true" or "false"));

				local callback = self.listeners["downloadListener"];
				if not table.isEmpty(callback) then
					if callback.func and callback.obj then
						-- callback.func(callback.obj,self.downloadData.data,isAllDownloadSuccess ,file ,url);
						callback.func(callback.obj,self.downloadData.data , true , file , url);
					end
				end
			end

			self.isAllDownloadSuccess=nil;
			self.isDownloading=false;
			self:startUpdateTask();
			return;
		end

	end

	local responseData=self.downloadData.data or {};
	self.isDownloading=false;
	self:startUpdateTask();

	local callback = self.listeners["downloadListener"];
	if not table.isEmpty(callback) then
		if callback.func and callback.obj then
			callback.func(callback.obj,responseData,success ,file ,url);
		end
	end

end

--下载结果进度回调
UpdateMgr.onDownloadProgressResponse=function(self,progress,file,url)
	Log.v("UpDateMgr.onDownloadProgressResponse progress:" , progress);
	if not self.downloadData then
		return;
	end
	
	local isUpdateHall=UpdateData.getInstance():isHallUpdated() and (self.downloadData.type == KTaskType_Update_HALL or self.downloadData.type == KTaskType_Update_GAME);
	if isUpdateHall then
		Log.v("UpdateMgr onDownloadProgressResponse hallUpdate by itSelf ,because hall update has more then one task!");
		self:onHallDownloadProgressResponse(progress,file,url);
		return;
	end 

	local callback = self.listeners["downloadProgressListener"];
	if not table.isEmpty(callback) then
		if callback.func and callback.obj then
			callback.func(callback.obj,self.downloadData.data,progress);
		end
	end
end

--下载大厅进度回调(因为下载大厅的同时，可能将子游戏的更新文件一次性下载了)
UpdateMgr.onHallDownloadProgressResponse=function(self,progress,file,url)
	Log.v("UpDateMgr.onHallDownloadProgressResponse progress:" );

	local data=self.downloadData.data;
	if data then

		Log.v("onHallDownloadProgressResponse","data:" , json.encode(data));

		local hallData=UpdateData.getInstance():getHallData();
		hallData.downloadingSize=(hallData.downloadingSize or 0)+((progress/100)*(data.size));

		local allSize=UpdateData.getInstance():getUpdateSize();
		if allSize == 0 then
			allSize=1;
		end

		local realProgress= math.floor( hallData.downloadingSize*100/allSize );
		realProgress=math.min(realProgress,100);

		local callback = self.listeners["downloadProgressListener"];
		if not table.isEmpty(callback) then
			if callback.func and callback.obj then
				callback.func(callback.obj,data,realProgress);
			end
		end
	end
end

-------------------------lua升级相关--------------------------
--app的跟目录，在Android中即:/sdcard/.com.boyaa.engineqpsc
UpdateMgr.getRootPath = function(self)
	Log.v("UpdateMgr.getRootPath");
	self.root=self.root or System.getStorageOuterRoot();
	return self.root;
end

--下载luazip时，zip包的文件详细路径，在Android中即:/sdcard/.com.boyaa.engineqpsc/luaUpdate/update_gameid_1_version_10_11.zip
--文件名的含义：gameid为1的游戏，从版本10更新到11
UpdateMgr.getUpdateLuaZipName = function(self , gameId , oldVersion ,newVersion)
	Log.v("UpDateMgr.getUpdateLuaZipName");
    local luaPath = self:getRootPath() .. "luaUpdate/"
    if not os.isexist(luaPath) then
        os.mkdir(luaPath) 
    end
	local fileName = string.format("%supdate_gameid_%s_ver_%s_%s.zip",luaPath ,gameId or 0,oldVersion or 0,newVersion or 1);
    return fileName;
end

--更新luazip包时，会将zip包从luaUpdate移动到update目录（利用引擎的更新功能，引擎会将update目录下的zip包进行解压），在Android中即:/sdcard/.com.boyaa.engineqpsc/update/update_gameid_1_version_10_11.zip
UpdateMgr.getUpdateLuaZipNameInUpdateDir = function(self , gameId , oldVersion ,newVersion)
	Log.v("UpDateMgr.getUpdateLuaZipNameInUpdateDir");
    local luaPath = System.getStorageUpdatePath();
    if not os.isexist(luaPath) then
        os.mkdir(luaPath) 
    end
	local fileName = string.format("%supdate_gameid_%s_ver_%s_%s.zip",luaPath ,gameId or 0,oldVersion or 0,newVersion or 1);
    return fileName;
end

--@brief 下载LUA ZIP
UpdateMgr.downloadLuaZipFile = function(self,downloadData)
	Log.v("UpdateMgr.downloadLuaZipFile");
	if type(downloadData) ~= "table" then 
		return;
	end

	local zipPath=self:getUpdateLuaZipName(downloadData.gameId,downloadData.oldVersion,downloadData.newVersion);
    HttpDownload.getInstance():download(
    		downloadData.url,zipPath,nil,self,
			self.onDownloadLuaZipResponse,
			self.onDownloadProgressResponse,
			true
	);
end

UpdateMgr.onDownloadLuaZipResponse = function(self ,isSucessed ,file,url)	
	Log.v("UpdateMgr.onDownloadLuaZipResponse isSucessed==",isSucessed);
	if not self.downloadData then
		return;
	end
	local zipPath=self:getUpdateLuaZipName(self.downloadData.gameId,self.downloadData.oldVersion,self.downloadData.newVersion);
	if isSucessed then
		self:verifyMd5(zipPath,self.downloadData.hash);
	else
		self:onDownloadResponse(false,nil,self.downloadData and self.downloadData.url or "");
	end
end

--取消所有的任务
UpdateMgr.cancelAllHttpDownload = function(self)	
	self.isDownloading=false;
	self.downloadData=nil;
	HttpDownload.getInstance():releaseInstance();
end


--更新Lua程序调用此程序
--isHallUpdated 是否是大厅更新，如果是大厅更新，则需要重启虚拟机，如果是游戏更新，则不需要重启(即热更新)
UpdateMgr.installLua = function(self, isHallUpdated)
		
    self:cancelAllHttpDownload();

	UpdateData.getInstance():save();
	
	local data = UpdateData.getInstance():getUpdateData();
	Log.v("UpdateMgr.installLua the data==",data);


	--note: 这里需要先解压子游戏，再解压大厅,防止解压游戏包含某些文件时，导致有些文件引用的是老大厅
	--的代码，有些代码引用的是新大厅的代码，从而crash的问题
	self:__unzipAllDownloadGames(); --这里解压的是从游戏列表中点击下载游戏包

	if not table.isEmpty(data) then
		self:__unzipAllUpdateGames(data); --这里解压的是从system.update返回的游戏更新包
		if isHallUpdated then
			self:__unzipHall(data);
		end
	end

	if not isHallUpdated then
		return;
	end

	self:__restartLuaVM();
end

--@brief 解压大厅
UpdateMgr.__unzipHall = function(self, data)
	Log.v("UpdateMgr.__unzipHall -------A-------");

	local oldVersion = kGameManager:getGameVersion(GameType.HALL);
	local zipPath = self:getUpdateLuaZipNameInUpdateDir(GameType.HALL, oldVersion, data.hall.version);
	Log.v("UpdateMgr.__unzipHall zipPath:" , (zipPath or "null "));
    
	local unzip = require("core/zip");
    local ret = unzip.unzipWholeFile(zipPath, System.getStorageInnerRoot());
    Log.v("UpDateMgr.__unzipHall ret = ", ret);
	if ret then
		System.removeFile(zipPath);
	end
end

--@brief 解压所有更新的游戏
UpdateMgr.__unzipAllUpdateGames = function(self, data)
	local games = table.verify(data.games);
	for k,v in pairs(games) do
		if v.flag ==1 then
			local oldVersion = kGameManager:getGameVersion(v.id);

			local src_file=self:getUpdateLuaZipNameInUpdateDir(v.id,oldVersion,v.version);
			local dest_file = System.getStorageInnerRoot();
            local unzip = require("core/zip");
	        local ret = unzip.unzipWholeFile(src_file, dest_file);

			Log.v("UpdateMgr.__unzipAllUpdateGames src_file = ", src_file);
			Log.v("UpdateMgr.__unzipAllUpdateGames dest_file = ", dest_file);
			Log.v("UpdateMgr.__unzipAllUpdateGames ret = ", ret, " v = ", v);

			if ret then
				System.removeFile(src_file);

				v.flag =0;
				IosReplaceInstallLogic.recordCompleteGameInfo(v.update_mode, v.game_pkg, v.version);
				kGameManager:reInitGame(v.id);
			end
		end
	end
end

--@brief 解压所有下载的游戏
UpdateMgr.__unzipAllDownloadGames = function(self)
	Log.v("UpdateMgr.__unzipAllDownloadGames");
	for k,v in pairs(self.tasksDownloadSuccess) do
		
		local src_file=self:getUpdateLuaZipNameInUpdateDir(v.gameId, v.oldVersion, v.newVersion);
		local dest_file = System.getStorageInnerRoot();
        local unzip = require("core/zip");
		local ret = unzip.unzipWholeFile(src_file, dest_file);

		Log.v("UpdateMgr.__unzipAllDownloadGames src_file = ", src_file);
		Log.v("UpdateMgr.__unzipAllDownloadGames dest_file = ", dest_file);
		Log.v("UpdateMgr.__unzipAllDownloadGames ret = ", ret, " v = ", v);
		
		if ret  then	
			System.removeFile(src_file);
			if table.isTable(v.data) and v.data.game_pkg then
				IosReplaceInstallLogic.recordCompleteGameInfo(2, v.data.game_pkg);
			end
			kGameManager:reInitGame(v.gameId);
		end
	end
	self.tasksDownloadSuccess={};
end

--@brief 重启虚拟机，只会在大厅强制或可选更新时才会调用
UpdateMgr.__restartLuaVM = function(self)
	mainHandle_restartVM();	
end

UpdateMgr.moveZip = function(self , srcFile ,destFile )
	System.moveFile(srcFile,destFile);
	System.removeFile(srcFile);
end

-------------------------APK升级相关--------------------------
--获取apk更新路径，在Android中即:/sdcard/.com.boyaa.engineqpsc/apkUpdate
UpdateMgr.getApkUpdatePath = function(self)
	Log.v("UpdateMgr.getApkUpdatePath");
    local path = self:getRootPath() .. "apkUpdate/";
    if not os.isexist(path) then
        os.mkdir(path);
    end
    return path;
end

--获取apk增量更新文件名
UpdateMgr.getPathchName = function(self ,oldVersion,newVersion)
	Log.v("UpdateMgr.getPathchName");
	local rootPath = self:getApkUpdatePath();
	local fileName = string.format("%supdate_apk_%s_%s.patch",rootPath,oldVersion or 1,newVersion or 1);
    return fileName;
end

UpdateMgr.getNewApkName = function(self ,newVersion)
	Log.v("UpdateMgr.getNewApkName");
	local rootPath = self:getApkUpdatePath();
	local fileName = string.format("%s%s.apk",rootPath ,newVersion);
    return fileName;
end

UpdateMgr.downloadPatchFile = function(self,downloadData)
	Log.v("UpdateMgr.downloadPatchFile");
	self.patchPath=self:getPathchName(downloadData.oldVersion,downloadData.newVersion);
	self.apkPath=self:getNewApkName(downloadData.newVersion);

	System.removeFile(self.apkPath);

    HttpDownload.getInstance():download(
    		downloadData.url,self.patchPath,nil,self,
			self.onDownloadPatchResponse,
			self.onDownloadProgressResponse,
			true
	);
end

UpdateMgr.onDownloadPatchResponse = function(self ,isSucessed, file , url)	
	Log.v("UpdateMgr.onDownloadPatchResponse");
	if not self.downloadData then
		return;
	end

	if isSucessed then
		self:mergeNewApk();
	else
		System.removeFile(self.apkPath);
		self:onDownloadResponse(false,nil,self.downloadData and self.downloadData.url or "");
	end
end

UpdateMgr.downloadApkFile = function(self,downloadData)
	Log.v("UpdateMgr.downloadApkFile");
	if type(downloadData) ~= "table" then 
		return;
	end 
	self.apkPath=self:getNewApkName(downloadData.newVersion);

    HttpDownload.getInstance():download(
    		downloadData.url,self.apkPath,nil,self,
			self.onDownloadApkResponse,
			self.onDownloadProgressResponse,
			true
	);
end

UpdateMgr.onDownloadApkResponse = function(self ,isSucessed, file , url)	
	Log.v("UpdateMgr.onDownloadApkResponse");
	if not self.downloadData then
		return;
	end

	if isSucessed then
		--验证一下
		self:verifyMd5(self.apkPath,self.downloadData.hash);
	else
		self:onDownloadResponse(false,nil,self.downloadData and self.downloadData.url or "");
	end
end

--安装apk
UpdateMgr.installNewApk = function(self)
	Log.v("UpdateMgr.installNewApk");
	dict_set_string("patchUpdate","newApkPath",self.apkPath);

	if System.getPlatform() == kPlatformAndroid then
		dict_set_string("LuaCallEvent","LuaCallEvent","PatchApkInstall");
		call_native("OnLuaCall");
	end
end

UpdateMgr.getDownloadData = function(self)
	return self.downloadData;
end
----------------------------验证所下载的文件的合法性以及接受回调------------------
--合成新的apk
UpdateMgr.mergeNewApk = function(self)	---apk升级必须
	Log.v("UpdateMgr.mergeNewApk");
	dict_set_string("patchUpdate","patchPath",self.patchPath); 
	dict_set_string("patchUpdate","newApkPath",self.apkPath);
	dict_set_int("patchUpdate","isVerifyMD5",0); --0标示为不校验MD5，其他校验

	if System.getPlatform() == kPlatformAndroid then
		dict_set_string("LuaCallEvent","LuaCallEvent","MergeNewApk");
		call_native("OnLuaCall");
	end
end

--合成新apk的结果
function event_merge_new_apk() ---apk升级必须

	local result = dict_get_int("patchUpdate","result", -1);
	Log.v((result == 1) and "merge success" or "merge failed");
	local downloadData = UpdateMgr.getInstance():getDownloadData();
	UpdateMgr.getInstance():onDownloadResponse(result == 1,nil,downloadData and downloadData.url or "");

	if UpdateMgr.getInstance().patchPath then
		System.removeFile(UpdateMgr.getInstance().patchPath);
		if result ~=1 then
			System.removeFile(UpdateMgr.getInstance().apkPath);
		end
	end
end

--验证patch增量文件，Lua增量zip包 MD5值正确性
UpdateMgr.verifyMd5 = function(self,path,md5)---Lua升级必须
   	Log.v("verifyMd5: A" ,"path:" , (path and path or "path is null"));
   	Log.v("verifyMd5: B" ,"md5:" , (md5 and md5 or "md5 is null"));

    local md5_util = require("core/md5");
    local file_md5 = md5_util.md5File(path);
    self:verify_md5(file_md5 == md5);
end

--验证MD5值正确性
UpdateMgr.verify_md5 = function(self, result) ---Lua升级必须
	Log.v(result  and "verifyMD5 success" or "verifyMD5 failed");

	local downloadData = self:getDownloadData();
	if not downloadData then 
		Log.v("event_verify_md5: downloadData is nil ==> return"); 
		return;
	end 

	local isApkUpdate = downloadData.type == KTaskType_Update_APK;
	local isLuaUpdate = downloadData.type == KTaskType_Update_HALL 
											or downloadData.type == KTaskType_Update_GAME 
											or downloadData.type == KTaskType_Download_GAME;

	if  isApkUpdate then
		Log.v("event_verify_md5: isApkUpdate A "); 
		if not result then
			System.removeFile(self.apkPath);
		end

	elseif isLuaUpdate then

		if result then
			--将zip包从luaUpdate目录移动到update目录中
			Log.v("event_verify_md5: A"); 

			local zipSrcPath  = self:getUpdateLuaZipName(downloadData.gameId,downloadData.oldVersion,downloadData.newVersion);
			local zipDestPath = self:getUpdateLuaZipNameInUpdateDir(downloadData.gameId,downloadData.oldVersion,downloadData.newVersion);
			self:moveZip(zipSrcPath,zipDestPath);

		else
			if downloadData then
				local infoStr = json.encode(downloadData);
				Log.v("event_verify_md5: B" , (infoStr and infoStr or "A null")); 

				local zipPath=self:getUpdateLuaZipName(downloadData.gameId,downloadData.oldVersion,downloadData.newVersion);
				System.removeFile(zipPath);
			else
				Log.v("event_verify_md5: C" , "B null"); 
			end
		end
	end
	

	self:onDownloadResponse(result, nil,downloadData and downloadData.url or "");
end

--此方法暂时没有用
function event_pack_newLuaZip()---Lua升级必须
	local result = dict_get_int("packnewLuaZip","result", -1)
	Log.v((result == 1) and "packnewLuaZip success" or "packnewLuaZip failed");
end

------------------------------------安装------------------------------
--安装，如果是apk更新，则安装apk;如果是lua更新，则更新lua zip包
UpdateMgr.install = function(self)
	Log.v("UpdateMgr.install");
	if UpdateData.getInstance():isApkUpdated() then
		self:installNewApk();
	else
		NativeEvent.getInstance():ShowLoadingDialog(GameString.get("installing"));
		self:installLua(true);
	end
end

--检查游戏的更新数据是否正确
UpdateMgr.checkGameUpdateData = function(self, gameid)
	local data = UpdateData.getInstance():getGameUpdateDataByGameId(gameid);
	if table.isEmpty(data) or string.isEmpty(data.url) then
		return false;
	else
		return true;
	end 
end

--任务队列是否还有任务
UpdateMgr.hasUpdateTask = function(self)
	Log.v("UpdateMgr.hasUpdateTask");
	return  self.isDownloading or (#self.tasks > 0);
end

--游戏是否下载成功
UpdateMgr.isGameDownloadSuccess = function(self,gameid)
	Log.v("UpdateMgr.isDownloadSuccess");
	local find=false;
	local data=UpdateData.getInstance():getUpdateData();
	if data then
		local games=data.games or {};
		for k,v in pairs(games) do
			if v.id == gameid then
				find=(v.downloadstatus == KDownloadStatus_Success);
				break;
			end
		end
	end
	return find;
end

--当前任务是否处于队列中
UpdateMgr.isTaskInQueen = function(self,url)
	
	Log.v("UpdateMgr.isTaskInQueen");

	local ret=false;
	if url and url ~= "" then

		--正在下载的
		if self.downloadData then
			ret=(self.downloadData.url==url);
		end

		--已经下载成功的
		if not ret then
			for k,v in pairs(self.tasksDownloadSuccess) do
				if v.url == url then
					ret =true;
					break;
				end
			end
		end

		--还在队列中的
		if not ret then
			for k,v in pairs(self.tasks) do
				if v.url == url then
					ret =true;
					break;
				end
			end
		end

	end

	Log.v("UpdateMgr.isTaskInQueen ret:",ret ," url:" , url);
	return ret;
end
