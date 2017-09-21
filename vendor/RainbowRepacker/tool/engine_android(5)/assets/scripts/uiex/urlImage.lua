require("core/object");
require("ui/image");
require("libs/json_wrap");
require("common/httpFileGrap");
require("common/serialize");

-- UrlImage = class(Image,false);

-- UrlImage.s_index = 1;
-- UrlImage.s_maxDownloadTimes = 3;
-- UrlImage.s_cacheFileName = "urlImageCaches.lua";

-- UrlImage.s_downloading = {};
-- UrlImage.s_cacheDuring = 7;--缓存保存时限（天）
-- UrlImage.s_cacheFiles = new(Serialize, UrlImage.s_cacheFileName, UrlImage.s_cacheDuring);

-- UrlImage.ctor = function(self,defaultFile,url,fmt,filter)
-- 	super(self,defaultFile,fmt,filter);
	
-- 	self.m_downloadCount = 0;
-- 	self:beginDownload(url);
-- end

-- UrlImage.setUrl = function(self,url)
-- 	self.m_downloadCount = 0;
-- 	self:beginDownload(url);
-- end

-- UrlImage.saveInfo = function(url,fileName,obj)
-- 	if UrlImage.s_downloading[url] then 
-- 		local temp = UrlImage.s_downloading[url].obj;
-- 		temp[#temp + 1] = obj;
-- 	else
-- 		UrlImage.s_downloading[url] = {["name"] = fileName, ["obj"] = {obj}}; 
-- 	end
-- end 

-- UrlImage.beginDownload = function(self,url)
-- 	if type(url) ~= "string" then
-- 		return;
-- 	end

-- 	url = url or "";
-- 	self.m_url = url;

-- 	local cacheName = UrlImage.s_cacheFiles:get(self.m_url);
-- 	if cacheName then
-- 		self:setFile(cacheName);
-- 		return;
-- 	end

-- 	local downloadName = "" .. os.time() .. UrlImage.s_index .. ".png";
-- 	local fileName = System.getStorageImagePath() .. downloadName;	
-- 	Log.i("UrlImage.beginDownload filename==" , fileName);
-- 	self.m_downloadCount = self.m_downloadCount + 1;

-- 	if self.m_downloadCount == 1 then 
-- 		UrlImage.saveInfo(url,downloadName,self);
-- 	end
	
-- 	if not UrlImage.s_downloading[url].isDownloading then 	
-- 		Log.i("UrlImage.s_downloading[url].isnotDownloading");		
-- 		UrlImage.s_index = UrlImage.s_index + 1;
-- 		UrlImage.s_downloading[url].isDownloading = true;
-- 		HttpFileGrap.getInstance():grapFile(url,fileName,15000,nil,UrlImage.onDownloaded);
-- 	end 
-- end

-- UrlImage.onDownloaded = function(_,isSucessed, fileName, url)
-- 	if not isSucessed then
-- 		if UrlImage.s_downloading[url] then 

-- 			UrlImage.s_downloading[url].isDownloading = false;

-- 			local objs = UrlImage.s_downloading[url].obj;
-- 			for _,v in pairs(objs) do 
-- 				if v.m_downloadCount <= UrlImage.s_maxDownloadTimes - 1 then 
-- 					v:beginDownload(url);
-- 					break;
-- 				end
-- 			end 

-- 			return;
-- 		end
-- 	else
-- 		if UrlImage.s_downloading[url] then 
-- 			local objs = UrlImage.s_downloading[url].obj;	
-- 			local name = UrlImage.s_downloading[url].name;
-- 			UrlImage.s_cacheFiles:set(url, name);
-- 			UrlImage.s_cacheFiles:save();
		
-- 			for i=1,table.maxn(objs) do 
-- 				local obj = objs[i];
-- 				if obj then
-- 					obj:setFile(name);			
-- 					obj.m_downloadCount = 0;
-- 				end
-- 			end 		
-- 			UrlImage.s_downloading[url] = nil;
-- 		end		
-- 	end	
-- end

-- UrlImage.dtor = function(self)
-- 	for k,v in pairs(UrlImage.s_downloading) do 
-- 		if self.m_url == k then 
-- 			for kk,_ in pairs(v.obj) do 
--    				v.obj[kk] = nil;
-- 			end
-- 		end 
-- 	end 
-- end



UrlImage = class(Image,false);

UrlImage.ctor = function(self,defaultFile,url,fmt,filter)
	super(self,defaultFile,fmt,filter);
	self:beginDownload(url);
end

UrlImage.setUrl = function(self,url)
	self:beginDownload(url);
end

UrlImage.beginDownload = function(self,url)
	if type(url) ~= "string" then
		return;
	end

	if string.isEmpty(url) then
		return;
	end

	self.m_url = url;

	ImageCache.getInstance():request(self.m_url, self, self.onUpdateListHeadImage);
end


UrlImage.onUpdateListHeadImage = function(self, url, imagePath)
	-- body
	if url == self.m_url and not string.isEmpty(imagePath) then
		self:setFile(imagePath);
	end
end

UrlImage.dtor = function(self)
	-- body
	ImageCache.getInstance():cleanRef(self);
end