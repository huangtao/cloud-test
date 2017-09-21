require("util/ImageCache");

local ImageCacheBatch = class();

ImageCacheBatch.eStatu = {
	DO = 1,			--还没开始下载
	DOING = 2,		--正在下载
	DONE = 3		--下载完毕
}

ImageCacheBatch.ctor = function(self) 
	self.m_delay = false		--如果有图是在sever down了下来的，，下完后是否下次回掉。默认马上更新。
	self.m_tasks = {};
	self.m_urlCount = 0;
	self.m_okUrlCount = 0;
	self.m_statu = self.eStatu.DO;
	self.m_isAllInLocal = true;  --是否全部图片在本地。
end

ImageCacheBatch.dtor = function(self)
	ImageCache.getInstance():cleanRef(self);
end

--添加任务
ImageCacheBatch.addTask = function(self,url, respObj, respMethod, ...)
	if type(url) ~= "string" then
		return ;
	end

	if self.m_statu ~= self.eStatu.DO then
		Log.v("ImageCacheBatch.addTask","can not add");
		return ;
	end

	if table.isEmpty(self.m_tasks[url]) then
		self.m_tasks[url] = {
			callFuncInfo = {};
		};

		self.m_urlCount = self.m_urlCount + 1;

	end

	local __callFuncInfo = {obj = respObj,func = respMethod,args = {...}};

	table.insert(self.m_tasks[url].callFuncInfo,__callFuncInfo);

	--判断是否全部在本地
	if self.m_isAllInLocal then
		if not ImageCache.getInstance():isExsitInLocal(url) then
			self.m_isAllInLocal = false;
		end
	end 

end

--开始任务
ImageCacheBatch.startTask = function(self)

	for k,v in pairs(self.m_tasks) do
		ImageCache.getInstance():request(k, self, self.__response);
	end

	self.m_statu = self.eStatu.DOING;

end

--开始任务之前请确定是否需要延迟到下次更新
ImageCacheBatch.setDelay= function(self,p_isDelay)
	self.m_delay = p_isDelay;
end

ImageCacheBatch.getIsDelay= function(self)
	return self.m_delay;
end

--取消部分任务
ImageCacheBatch.CancelTaskByObj = function(self,p_obj)
	for k,v in pairs(self.m_tasks) do
		local _count = table.getn(v.callFuncInfo);
		for i = _count,1,-1 do
			if v.callFuncInfo[i].obj == p_obj then
				table.remove(v.callFuncInfo,i);
			end 
		end
	end
end

ImageCacheBatch.__response = function(self, url, imageName)
	if type(url) == "string" and type(imageName) == "string" then
		self.m_tasks[url].imagePath = imageName;
		self.m_okUrlCount = self.m_okUrlCount + 1;
		if self:__isCompleted() then
			self:__CallAllFunc();
		end
	end
end

ImageCacheBatch.__isCompleted = function(self)
	if self.m_okUrlCount == self.m_urlCount then
		self.m_statu = self.eStatu.DONE;
		return true;
	else
		return false;
	end
end

ImageCacheBatch.__isNeedCallBack = function(self)
	if self.m_isAllInLocal then
		return true;
	else
		if self.m_delay then
			return false;
		else
			return true;
		end
	end
end

ImageCacheBatch.__CallAllFunc = function(self)

	if not self:__isNeedCallBack() then
		return ;
	else
		for k,v in pairs(self.m_tasks) do
			for kk,vv in pairs(v.callFuncInfo) do
				vv.func(vv.obj,k,v.imagePath,unpack(vv.args));
			end
		end	
	end

	--清空引用
	self.m_tasks = {};
end

return ImageCacheBatch;