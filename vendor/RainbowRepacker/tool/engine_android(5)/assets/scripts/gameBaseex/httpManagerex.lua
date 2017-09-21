require("gameBase/httpManager");

HttpConfigContants = 
{
    URL = 1,
    METHOD = 2,
    TYPE = 3,
    TIMEOUT = 4,
    REQUESTYPE = 5,
    ZIPTYPE = 6,
};

HttpManager.execute =  function(self,command,data)
    if not HttpManager.checkCommand(self,command) then
        return false;
    end

    HttpManager.destroyHttpRequest(self,self.m_commandHttpMap[command]);

    local config = self.m_configMap[command];
    local httpType = config[HttpConfigContants.TYPE] or kHttpPost;

    local url = self.m_urlOrganizer(config[HttpConfigContants.URL],
                                config[HttpConfigContants.METHOD],
                                httpType, config[HttpConfigContants.METHOD], config[HttpConfigContants.REQUESTYPE]);
    
    local httpRequest = new(Http,httpType,kHttpReserved,url)
    httpRequest:setEvent(self, self.onResponse);
    httpRequest:setTimeout(self.m_timeout,self.m_timeout);
    if httpType == kHttpPost then 
        local postData =  self.m_postDataOrganizer(config[HttpConfigContants.METHOD],data, 
                                config[HttpConfigContants.REQUESTYPE],config[HttpConfigContants.ZIPTYPE]);

        httpRequest:addHeader(config[HttpConfigContants.ZIPTYPE] or "");
        httpRequest:setData(postData);
    end

    local timeoutAnim = HttpManager.createTimeoutAnim(self,command,config[HttpConfigContants.TIMEOUT] or self.m_timeout);

    self.m_httpCommandMap[httpRequest] = command;
    self.m_commandHttpMap[command] = httpRequest;
    self.m_commandTimeoutAnimMap[command] = timeoutAnim;

    httpRequest:execute();
end