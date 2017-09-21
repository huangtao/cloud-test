require("common/httpFileGrap");
require("common/serialize");

ImageCache = class();

ImageCache.s_imagesPath = System.getStorageImagePath();
ImageCache.s_cacheFileName = "ImageCache.lua";
ImageCache.s_cacheDuring = 7;--缓存保存时限（天）
ImageCache.s_cacheFiles = new(Serialize, ImageCache.s_cacheFileName, ImageCache.s_cacheDuring);

ImageCache.ctor = function ( self )
	self.requestTask={};
end

ImageCache.dtor = function(self)
end

ImageCache.getInstance = function()
	if not ImageCache.instance then
		ImageCache.instance = new(ImageCache);
	end
	return ImageCache.instance;
end

ImageCache.request =function (self, url, respObj, respMethod, ...)
	if string.isEmpty(url) then
		return;
	end

	local imageName = self:getImageName(url);
	local imagePath = string.concat(ImageCache.s_imagesPath , imageName);

	if self:isFileExist(imagePath) and table.isEmpty(self.requestTask[url]) then
		--防止图片还未下载完成的时候，回调给界面，导致setFile出问题
		if respMethod and respObj then
			respMethod(respObj, url, imageName, ...);
		end
		return imagePath;
	end

	local taskItem = {
		["respObj"] = respObj,
		["respMethod"] = respMethod,
		["args"] = { ... }
	};

	local needDownload = false
	if table.isEmpty( self.requestTask[url] ) then
		self.requestTask[url] = {};
		self.requestTask[url].taskStack = {};
		self.requestTask[url].imageName = imageName;
		self.requestTask[url].downloadTimes = 1;

		needDownload = true;
	end

	table.insert(self.requestTask[url].taskStack, taskItem);

	if needDownload then
		HttpFileGrap.getInstance():grapFile(url, self:getImageTempPathByName(imageName) , 15000, self, self.onResponse);
	end
end

ImageCache.onResponse = function(self, isSucessed, path, url)
	Log.v("ImageCache.onResponse", " isSucessed = ", isSucessed, " path = ", path, " url = ", url);
	if  string.isEmpty(url) or table.isEmpty( self.requestTask[url] ) then
		return;
	end

	local taskStack = self.requestTask[url].taskStack;
	local imageName = self.requestTask[url].imageName;
	local imagePath = string.concat(ImageCache.s_imagesPath , imageName);

	if isSucessed then--下载成功
		self:renameImageTempName(path, imagePath);
		
		for k, v in pairs(taskStack) do
			if v.respObj and v.respMethod then
				v.respMethod(v.respObj, url, imageName, unpack(v.args));
			end
		end
		self.requestTask[url]=nil;

		self:serializeImageInfo(url);

	else --下载失败
		self.requestTask[url].downloadTimes = number.valueOf(self.requestTask[url].downloadTimes, 1) + 1;

		if self.requestTask[url].downloadTimes < 4 then--最多下载3次
			HttpFileGrap.getInstance():grapFile(url, self:getImageTempPathByName(imageName), 15000, self, self.onResponse);
		else
			self.requestTask[url]=nil;
		end
	end
end

ImageCache.cleanRef =function (self, respObj)
  	if not respObj then
		return;
	end

	for k,v in pairs(self.requestTask) do

		local hadOtherObj=false;
		for _, taskItem in pairs(v.taskStack) do
			if taskItem.respObj == respObj then
				taskItem.respObj = nil;
				taskItem.respMethod = nil;
				taskItem = nil;
			else
				hadOtherObj = true;
			end
		end

		if not hadOtherObj then
			v=nil;
		end
	end
end

ImageCache.isFileExist = function(self,filePath)
	return os.isexist(filePath);
end

ImageCache.getImageName = function(self, url)
	return string.concat(md5_string(url), ".png");
end

ImageCache.getImageTempPathByName = function(self, imageName)
	local tempName = string.gsub(imageName, ".png", "temp.png");
	local tempPath = string.concat(ImageCache.s_imagesPath, tempName);
	return tempPath;
end

ImageCache.renameImageTempName = function(self, imageTempPath, imagePath)
	os.rename(imageTempPath, imagePath);
end

ImageCache.serializeImageInfo = function(self, url)
	local imageSaveTime = string.format("%s.png", os.time() );
	ImageCache.s_cacheFiles:set(url, imageSaveTime);
	ImageCache.s_cacheFiles:save();
end

--url对应的图片是否在本地。
ImageCache.isExsitInLocal = function(self, url)
	if string.isEmpty(url) then
		return false;
	end

	local imageName = self:getImageName(url);
	local imagePath = string.concat(ImageCache.s_imagesPath , imageName);

	return self:isFileExist(imagePath) ;

end