require("common/nativeEvent");

WeixinShareUtil = class(DataInterfaceBase);

WeixinShareUtil.eShareChannel = {
    QQ = "qq";
    WEIXIN = "weixin";
}


WeixinShareUtil.Delegate = {
    getWeiChatCallback = "getWeiChatCallback";
    onOpenShareAppCallBack = "onOpenShareAppCallBack";
    onTakeScreenShotAndSaveToLocal = "onTakeScreenShotAndSaveToLocal";
    onSaveImageToPhotoAlbumCallBack = "onSaveImageToPhotoAlbumCallBack";
}

WeixinShareUtil.getInstance = function()
    if not WeixinShareUtil.s_instance then
        WeixinShareUtil.s_instance = new(WeixinShareUtil);
    end

    return WeixinShareUtil.s_instance;
end

WeixinShareUtil.ctor = function(self)
    EventDispatcher.getInstance():register(Event.Call,self,self.onNativeEvent);
end

WeixinShareUtil.dtor = function(self)
    EventDispatcher.getInstance():unregister(Event.Call,self,self.onNativeEvent);
end


----------------------------------------qq分享----------------------------------------
--@brief 打开qq
WeixinShareUtil.openQQ = function(self)
    NativeEvent.getInstance():openQQ();
end

--@brief 分享图片和网页
--@param isSendToFriendCircle 是否分享到空间 true:是 false:分享到朋友
--@param imageUrl 图片地址
--@param title 标题
--@param desc 文本描述
--@param targetUrl 跳转地址
WeixinShareUtil.qqShareWebPage = function(self, targetUrl, title, desc, imageUrl, isSendToFriendsCircle, customParam)
    self:__setCustomParam(customParam, isSendToFriendsCircle);
    NativeEvent.getInstance():qqShareWebPage(targetUrl, title, desc, imageUrl, isSendToFriendsCircle);  
end


----------------------------------------微信分享----------------------------------------
--@brief
WeixinShareUtil.openWeiXin = function(self)
    NativeEvent.getInstance():openWeiXin();
end

-- 微信分享文本
-- @param 分享的文本
-- @param isSendToFriendsCircle 是否分享到朋友圈，boolean
WeixinShareUtil.weixinSendText = function(self, text, isSendToFriendsCircle, customParam)
    self:__setCustomParam(customParam, isSendToFriendsCircle);
    NativeEvent.getInstance():weixinSendText(text, isSendToFriendsCircle);
end

-- 微信游戏屏幕并分享图片，时间上和内存上有可能会有问题
-- @param isSendToFriendsCircle 是否分享到朋友圈，boolean
WeixinShareUtil.weixinTakeScreenShotAndSendImage = function(self, isSendToFriendsCircle, customParam)
    self:__setCustomParam(customParam, isSendToFriendsCircle);
    local image_path = System.captureFullScreenAndReturnPath();
    NativeEvent.getInstance():weixinSendImage(image_path, isSendToFriendsCircle);
end

--微信分享图片
--@param isSendToFriendsCircle 是否分享到朋友圈，boolean
WeixinShareUtil.weixinSendImage = function(self, imagePath, isSendToFriendsCircle, customParam)
    self:__setCustomParam(customParam, isSendToFriendsCircle);
    NativeEvent.getInstance():weixinSendImage(imagePath, isSendToFriendsCircle);
end

--微信合成图片然后再进行分享
--@param imageBgPath 图片背景路径
--@param tilesets 图块集合 eg { {x=2,y=3,imagePath="xxx"} }
--@param isSendToFriendsCircle 是否分享到朋友圈，boolean
--@note 如果width height 有一个没有传值 则会采用imageBgPath的宽和高
WeixinShareUtil.weixinMergeAndSendImage = function(self, imageBgPath, tilesets, isSendToFriendsCircle, customParam)
    self:__setCustomParam(customParam, isSendToFriendsCircle);
    NativeEvent.getInstance():weixinMergeAndSendImage(imageBgPath, tilesets, isSendToFriendsCircle);
end

-- 微信分享网页
-- @param url 网页的url
-- @param title 分享的标题
-- @param desc 分享的描述
-- @param headPath 
-- @param isSendToFriendsCircle 是否分享到朋友圈，boolean
WeixinShareUtil.weixinSendWebPage = function(self, url, title, desc,headPath,isSendToFriendsCircle, customParam)
    self:__setCustomParam(customParam, isSendToFriendsCircle);
    NativeEvent.getInstance():weixinSendWebPage(url, title, desc,headPath,isSendToFriendsCircle);
end

-- 微信分享网页，带口令
-- @param password 网页携带的口令
-- @param url 网页的url
-- @param title 分享的标题
-- @param desc 分享的描述
-- @param headPath 
-- @param isSendToFriendsCircle 是否分享到朋友圈，boolean
WeixinShareUtil.weixinSendWebPageWithPassword = function(self, password, url, title, desc,headPath,isSendToFriendsCircle, customParam)
    local shareUrl = PasswordDataInterface.getInstance():generateUrlWithPassword(url, password);
    self:__setCustomParam(customParam, isSendToFriendsCircle);
    NativeEvent.getInstance():weixinSendWebPage(shareUrl, title, desc,headPath,isSendToFriendsCircle);
end

-- 微信分享网页，有一个当前调用时的屏幕截图
-- @param url 网页的url
-- @param title 分享的标题
-- @param desc 分享的描述
-- @param isSendToFriendsCircle 是否分享到朋友圈，boolean
WeixinShareUtil.weixinTakeScreenShotAndSendWebPage = function(self, url, title, desc, isSendToFriendsCircle, customParam)
    self:__setCustomParam(customParam, isSendToFriendsCircle);
    NativeEvent.getInstance():weixinTakeScreenShotAndSendWebPage(url, title, desc, isSendToFriendsCircle);
end

-- 截图并保存到相册
-- @param filePath 文件存储名(不需要带后缀 默认会存储为.png格式)  如果值为空，则默认采用时间戳为文件名
WeixinShareUtil.takeScreenShotAndSaveToLocal = function(self, filePath, customParam)
    self:__setCustomParam(customParam);

    if string.isEmpty(fileSaveName) then
        fileSaveName = "dfqp" .. os.time();
    end

    NativeEvent.getInstance():takeScreenShotAndSaveToLocal(fileSaveName);
end

--截屏并保存到相册回调
WeixinShareUtil.onTakeScreenShotAndSaveToLocal = function(self, flag, info)
    Log.v("WeixinShareUtil.onTakeScreenShotAndSaveToLocal", " flag = ", flag, " info = ", info);
    self.m_customParam = table.verify(self.m_customParam);
    self:notify(WeixinShareUtil.Delegate.onTakeScreenShotAndSaveToLocal, true, self.m_customParam);
    self.m_customParam = nil;
end

--@brief 保存图片到相册
WeixinShareUtil.saveImageToPhotoAlbum = function(self, imagePath, customParam)
    self:__setCustomParam(customParam);

    NativeEvent.getInstance():saveImageToPhotoAlbum(imagePath);
end

--@brief 保存图片到相册回调
WeixinShareUtil.onSaveImageToPhotoAlbumCallBack = function(self, flag, info)
    Log.v("WeixinShareUtil.onSaveImageToPhotoAlbumCallBack", "flag = ", flag, "info = ", info);
    self.m_customParam = table.verify(self.m_customParam);

    local imagePath = "";
    local imageName = "";
    local isSuccess = false;
    if flag and not table.isEmpty(info) then
        if GetNumFromJsonTable(info, "isSuccess") == 1  then
            isSuccess = true;
            imagePath = GetStrFromJsonTable(info, "imagePath"); --图片保存路径
            imageName = GetStrFromJsonTable(info, "photoName"); --图片名
        end
    end

    self:notify(WeixinShareUtil.Delegate.onSaveImageToPhotoAlbumCallBack, isSuccess, imagePath, imageName, self.m_customParam);
    self.m_customParam = nil;
end

WeixinShareUtil.__setCustomParam = function(self, customParam, isSendToFriendsCircle)
    self.m_customParam = table.verify(customParam);
    self.m_customParam.isSendToFriendsCircle = isSendToFriendsCircle;
end

WeixinShareUtil.onNativeEvent = function(self,param,...)
    if self.s_nativeEventFuncMap[param] then
        self.s_nativeEventFuncMap[param](self,...);
    end
end

WeixinShareUtil.getWeiChatCallback = function ( self, flag, info )
    Log.v("WeixinShareUtil.getWeiChatCallback", " flag = ", flag, " info = ", info);

    self.m_customParam = table.verify(self.m_customParam);
    local shareChannel = "";
    if flag and not table.isEmpty(info) then
        shareChannel = GetStrFromJsonTable(info, "shareChannel");
        if GetNumFromJsonTable(info, "isSuccess") == 1 then
            Log.v("shareChannel = ", shareChannel);
            self:notify(WeixinShareUtil.Delegate.getWeiChatCallback, true, self.m_customParam, shareChannel);
            return;
        end
    end

    self:notify(WeixinShareUtil.Delegate.getWeiChatCallback, false, self.m_customParam, shareChannel);
    self.m_customParam = nil;
end

WeixinShareUtil.onOpenShareAppCallBack = function( self, flag, info )
    Log.v("WeixinShareUtil.onOpenShareAppCallBack", " flag = ", flag, " info = ", info);

    local shareChannel = "";
    if flag and not table.isEmpty(info) then
        shareChannel = GetStrFromJsonTable(info, "shareChannel");
        if GetNumFromJsonTable(info, "isSuccess") == 1 then
            Log.v("shareChannel = ", shareChannel);
            self:notify(WeixinShareUtil.Delegate.onOpenShareAppCallBack, true, shareChannel);
            return;
        end
    end

    self:notify(WeixinShareUtil.Delegate.onOpenShareAppCallBack, false, shareChannel);
end

WeixinShareUtil.s_nativeEventFuncMap = {
    ["getWeiChatCallback"] = WeixinShareUtil.getWeiChatCallback,
    ["openShareAppCallBack"] = WeixinShareUtil.onOpenShareAppCallBack;
    ["takeScreenShotAndSaveToLocal"] = WeixinShareUtil.onTakeScreenShotAndSaveToLocal;
    ["saveImageToPhotoAlbumCallBack"] = WeixinShareUtil.onSaveImageToPhotoAlbumCallBack;
};