require("core/object");
require("common/httpDownload");

HttpFileGrap = class();

HttpFileGrap.getInstance = function()
	if not HttpFileGrap.s_instance then
		HttpFileGrap.s_instance = new(HttpFileGrap);
	end
	return HttpFileGrap.s_instance;
end

HttpFileGrap.releaseInstance = function()
	delete(HttpFileGrap.s_instance);
	HttpFileGrap.s_instance = nil;
end

HttpFileGrap.ctor = function(self)
    self.m_httpDownload = new(HttpDownload);
end

HttpFileGrap.dtor = function(self)
    delete(self.m_httpDownload);
    self.m_httpDownload = nil;
end

HttpFileGrap.grapFile = function(self,url,file,timeout,obj,func,periodFunc,isResume)
	self.m_httpDownload:download(url,file,timeout,obj,func,periodFunc,isResume)
end

HttpFileGrap.cancleGrapFile = function(self,url,file)
	self.m_httpDownload:cancleGrapFile(url, file)
end