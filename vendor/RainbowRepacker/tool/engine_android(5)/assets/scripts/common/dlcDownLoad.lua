require("common/nativeEvent");
require("common/httpFileGrap");

DlcDownLoad = class();

DlcDownLoad.s_maxDownLoadCount = 5;

--下载类型
DlcDownLoad.s_types = {
	audio = 1;
	image = 2;
	code  = 3;
};

DlcDownLoad.getInstance = function()
	if not DlcDownLoad.s_instance then 
		DlcDownLoad.s_instance = new(DlcDownLoad);
	end
	return DlcDownLoad.s_instance;
end

DlcDownLoad.releaseInstance = function(self)
	delete(DlcDownLoad.s_instance);
	DlcDownLoad.s_instance = nil;
end


DlcDownLoad.ctor = function(self)
	EventDispatcher.getInstance():register(Event.Call,self,self.onNativeEvent);
end

DlcDownLoad.dtor = function(self)
	EventDispatcher.getInstance():unregister(Event.Call,self,self.onNativeEvent);
end

-----------------------------------public-------------------------------
DlcDownLoad.startDownLoad = function(self)
	local existTypes = {};
	for _,config in pairs( DlcDownLoad.s_config ) do
		if self:downLoadFileByConfig(config) then
			local key = config.type;
			existTypes[key] = existTypes[key] or key;
		end
	end

	for _,key in pairs(existTypes) do
		DlcDownLoad.s_typeFucMap[key](self);
	end
end

DlcDownLoad.downLoadFileByConfig = function(self , config)
	if not config or type(config) ~= "table" then
		return;
	end

	--避免无限下载
	config.downloadCount = config.downloadCount and (config.downloadCount+1) or 1;
	if config.downloadCount > DlcDownLoad.s_maxDownLoadCount then
		return false;
	end

	local url = config.url or "";
	local fileName = config.fileName or "";
	local unCompressFilePath = config.unCompressFilePath or "";
	local md5 = config.md5 or "";

	if self:checkIsFileExit(unCompressFilePath .. md5 ..".txt") then
		--表明文件已经存在
		return true;
	elseif self:checkIsFileExit(fileName) then
		NativeEvent.getInstance():unZipFileForLua(fileName,unCompressFilePath);

	elseif NativeEvent.getInstance():getNetworkType() == 1 then
			
		HttpFileGrap.getInstance():grapFile(
		url,
		fileName,
		15000,
		self,
		self.onFileDownloadCallback);
	else
		--do nothing;
	end

	return false;
end

DlcDownLoad.onFileDownloadCallback = function(self , isSucessed, fileName, url)
	local config = self:getFileConfigByFileName(fileName);
	if not config then
		return;
	end

	if isSucessed then
		--应该验证MD5
		NativeEvent.getInstance():unZipFileForLua(fileName , config.unCompressFilePath or "");
	else
		self:downLoadFileByConfig(config);
	end
end

DlcDownLoad.onUnCompressFinishCallback = function(self ,status , jsonTable)
	if not (status and jsonTable) then 
		return;
	end

	local fileName = GetStrFromJsonTable(jsonTable, "zipFilePath","");
	local config = self:getFileConfigByFileName(fileName);
	if not config then
		return;
	end

	local result = GetNumFromJsonTable(jsonTable, "result",0);--1:成功 0:失败

	local unCompressHandleFuc = config.unCompressHandleFuc or DlcDownLoad.defaultUnCompressHandle;
	unCompressHandleFuc(self,tonumber(result) == 1,fileName);
end

--------------------------------------------private---------------------------------
--解压文件成功后的回调函数
DlcDownLoad.defaultUnCompressHandle = function(self,isSucessed,fileName)
	local config = self:getFileConfigByFileName(fileName);
	if not isSucessed then
		if config then
			self:downLoadFileByConfig(config);
		end
	else
		if config then
			self:createFile( config.unCompressFilePath .. config.md5 ..".txt" );
			if config.type and DlcDownLoad.s_typeFucMap[config.type] then
				DlcDownLoad.s_typeFucMap[config.type](self);
			end
		end
	end
end

--下载声音前的初始化
DlcDownLoad.preDownLoadAudio = function(self)
	local effectSearchPath = System.getStorageAudioPath();
	System.pushFrontAudioSearchPath(effectSearchPath);
end

--下载图片前的初始化
DlcDownLoad.preDownLoadImage = function(self)
	local imageSearchPath = System.getStorageImagePath();
	System.pushFrontImageSearchPath(imageSearchPath);
end

--下载代码前的初始化
DlcDownLoad.preDownLoadCode = function(self)
end
-----------------------------------------------------------------------------------
--检查文件是否存在 note:不能检查文件夹
DlcDownLoad.checkIsFileExit = function(self , filePath)
	local f = io.open(filePath or "");
	if f then
		io.close(f);
		return true;
	else
		return false;
	end
end

DlcDownLoad.createFile = function(self , filePath)
	local f = io.open(filePath,'w');
	if f then
		io.close(f);
	end
end

DlcDownLoad.getFileConfigByFileName = function(self , fileName)
	for _,config in pairs( DlcDownLoad.s_config ) do
		if config.fileName == fileName then
			return config;
		end
	end

	return nil;
end

DlcDownLoad.onNativeEvent = function(self,param,...)
	if self.s_nativeEventFuncMap[param] then
		self.s_nativeEventFuncMap[param](self,...);
	end
end


DlcDownLoad.s_typeFucMap = {
	[DlcDownLoad.s_types.audio] = DlcDownLoad.preDownLoadAudio;
	[DlcDownLoad.s_types.image] = DlcDownLoad.preDownLoadImage;
	[DlcDownLoad.s_types.code] = DlcDownLoad.preDownLoadCode;		
};


DlcDownLoad.s_config = {
	-- [1] = {
	-- 	["type"] = DlcDownLoad.s_types.audio;
	-- 	["url"] =  ServerConfig.getInstance():getCDN() .."effect_v2/chat.zip";
	-- 	["fileName"] = System.getStorageUserPath() .. "audio/chat.zip";
	-- 	["unCompressFilePath"] = System.getStorageUserPath() .. "audio/ogg/effect/chat/";
	-- 	["md5"] = "5171df1c8e0058c7db4b4bbc0d711f4d";
	-- 	--["unCompressHandleFuc"] = 
	-- };
};

DlcDownLoad.s_nativeEventFuncMap = {
	["unZipFileForLua"] = DlcDownLoad.onUnCompressFinishCallback;
};
