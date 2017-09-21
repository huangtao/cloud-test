--secrecyData.lua
--隐私策略和服务协议数据管理

require("core/object");

SecrecyData = class();

SecrecyData.cleanup = function()
    SecrecyData.releaseInstance();
    kSecrecyData = SecrecyData.getInstance();
end

SecrecyData.getInstance = function()
    if not SecrecyData.s_instance then
        SecrecyData.s_instance = new(SecrecyData);
    end

    return SecrecyData.s_instance;
end

SecrecyData.releaseInstance = function()
    delete(SecrecyData.s_instance);
    SecrecyData.s_instance = nil;
end

SecrecyData.setCurView = function(self,viewName)
    self.m_CurView = viewName;
end 

SecrecyData.getCurView = function(self)
    return self.m_CurView or "";
end

SecrecyData.setWebViewPos = function(self,x,y)
    self.m_WebViewPosX = x;
    self.m_WebViewPosY = y;
end 

SecrecyData.getWebViewPos = function(self)
    return self.m_WebViewPosX or 0 , self.m_WebViewPosY or 100*System.getLayoutScale() ;
end

SecrecyData.setWebViewSize = function(self,w,h)
    self.m_WebViewWidth = w;
    self.m_WebViewHeight= h;
end 

SecrecyData.getWebViewSize = function(self)
    return self.m_WebViewWidth , self.m_WebViewHeight;
end

----------------------------------
kSecrecyData = SecrecyData.getInstance();