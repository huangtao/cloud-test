require("gameData/dataInterfaceBase");

ShareDataInterface = class(DataInterfaceBase);

ShareDataInterface.Delegate = {
    onGetWeiChatInfoCallBack = "onGetWeiChatInfoCallBack";
}

ShareDataInterface.Delegate = {
    onDownloadShareImageCallBack = "onDownloadShareImageCallBack";
}

ShareDataInterface.getInstance = function()
    if not ShareDataInterface.s_instance then
        ShareDataInterface.s_instance = new(ShareDataInterface);
    end

    return ShareDataInterface.s_instance;
end


ShareDataInterface.initData = function(self)
    self.m_taskShareInfo = {};

    self.m_shareTemplateVersion = -1;
    self.m_shareTemplate = {};
end

--@brief 获取微信分享信息
ShareDataInterface.getWeiXinChatInfo = function(self)
    return Copy(self.m_taskShareInfo.weixin) or {};
end

--@brief 获取QQ分享信息
ShareDataInterface.getQQShareInfo = function(self)
    return Copy(self.m_taskShareInfo.qq) or {};
end

--@brief 获取分享模板
ShareDataInterface.getShareTemplate = function(self)
    return Copy(self.m_shareTemplate) or {};
end

--@brief 请求分享配置
ShareDataInterface.requestShareInfo = function(self)
    self:__requestTaskShareInfo();
    self:__requestShareTemplate();
end

ShareDataInterface.setPrivateRoomShareSubTitle = function(self, subTitle)
    self.m_privateRoomShareSubTitle = subTitle;
end

ShareDataInterface.getPrivateRoomShareSubTitle = function(self)
    return self.m_privateRoomShareSubTitle or "";
end

------------------------------------任务相关的分享配置---------------------------------
--@brief 获取任务分享信息
ShareDataInterface.__requestTaskShareInfo = function(self)
    OnlineSocketManager.getInstance():sendMsg(PHP_TASK_GETWEICHATINFO,{type="all"});
end

--@brief 获取任务分享信息回调
ShareDataInterface.onGetTaskShareInfoCallBack = function(self, isSuccess, info)
    if not isSuccess or table.isEmpty(info) then
        return;
    end

    local parseShareInfo = function(item)
        local t = {};
        t.friend_url = tostring(item.friend_url or "") or ""; --好友分享链接
        t.space_url = tostring(item.space_url or "") or ""; --空间分享链接
        t.desc = tostring(item.desc or "") or ""; --分享内容
        t.title = tostring(item.title or "") or ""; --分享标题
        t.share_icon = tostring(item.share_icon or "") or ""; --分享icon地址

        return t;
    end

    if not table.isEmpty(info.qq) then
        self.m_taskShareInfo.qq = parseShareInfo(info.qq);
    end

    if not table.isEmpty(info.weixin) then
        self.m_taskShareInfo.weixin = parseShareInfo(info.weixin);
    end

    self:saveData();
end

-------------------------------------比赛结算、游戏结算分享配置模板------------------------
--@brief 请求分享模板
ShareDataInterface.__requestShareTemplate = function(self)
    OnlineSocketManager.getInstance():sendMsg(PHP_SHARE_TEMPLE, {});
end

--@brief 获取分享模板回调
ShareDataInterface.onGetShareTemplateCallBack = function(self, isSuccess, info)
    if isSuccess and not table.isEmpty(info) then

        self.m_shareTemplate = {};
        for k, v in pairs(info) do
            if k and v then
                v.share_icon = tostring(v.share_icon or "") or "";
                v.share_url = tostring(v.share_url or "") or "";
                v.desc = tostring(v.desc or "") or "";
                v.subdesc = tostring(v.subdesc or "") or "";

                self.m_shareTemplate[k] = v;
            end
        end

        self:saveData();
    end
end


---------------------------------获取自定义生成的分享图片------------------------
--@brief 向PHP请求分享图片url
--@param params 传给php的参数
--@note  每个场景需要传的参数不同，需要跟php进行约定
--@WARINIG 只有微信朋友圈才支持分享纯图片
ShareDataInterface.requestDownloadShareImage = function(self, params)
    Log.v("ShareDataInterface.requestDownloadShareImage", "params = ", params);

    self.m_downloadShareImageParams = params;

    HttpFileGrap.getInstance():grapFile(
    self:__getShareImageUrl(params),
    self:__getShareImagePath(),
    15000,
    self,
    self.onDownloadShareImageCallBack);
end

--@brief 下载分享图片回调
ShareDataInterface.onDownloadShareImageCallBack = function(self , isSucessed, fileName, url)
    Log.v("ShareDataInterface.onDownloadShareImageCallBack", " isSucessed = ", isSucessed, " url = ", url);

    if isSucessed then
        self:notify(ShareDataInterface.Delegate.onDownloadShareImageCallBack, true, self.m_downloadShareImageParams, self:__getShareImagePath(), self:__getShareImageName() );
    else
        self:notify(ShareDataInterface.Delegate.onDownloadShareImageCallBack, false, self.m_downloadShareImageParams);
    end
end

--@brief 获取分享图片地址
ShareDataInterface.__getShareImageUrl = function(self, params)
    local url = ServerConfig.getInstance():getHostUrl() .. "?action=simpleimg.png";
    url = string.format("%s&mid=%s", url, kUserInfoData:getUserId() );
    for k, v in pairs( table.verify(params) ) do
        if k and v then
            url= string.format("%s&%s=%s", url, string.valueOf(k), string.valueOf(v) );
        end
    end

    Log.v("ShareDataInterface.__getShareImageUrl", " final url = ", url);
    return url;
end

--@brief 获取分享图片路径
ShareDataInterface.__getShareImagePath = function(self)
    return System.getStorageImagePath() .. self:__getShareImageName();
end

--@brief 获取分享图片名称
ShareDataInterface.__getShareImageName = function(self)
    return "DFQP_GAME_OVER_SHARE_IMAGE.png";
end


------------------------缓存数据-------------------------------
ShareDataInterface.saveDictData = function(self, dict)
    --任务分享
    local strTaskShare = json.encode(self.m_taskShareInfo) or "";
    dict:setString("strTaskShare", strTaskShare);

    --分享模板
    dict:setString("shareTemplateVersion", self.m_shareTemplateVersion);
    local strShareTemplate = json.encode(self.m_shareTemplate) or "";
    dict:setString("strShareTemplate", strShareTemplate);
end

ShareDataInterface.loadDictData = function(self, dict)
    local strTaskShare = dict:getString("strTaskShare");
    local taskShare = json.decode(strTaskShare);
    if not table.isEmpty(taskShare) then
        self.m_taskShareInfo = taskShare;
    end

    self.m_shareTemplateVersion = dict:getString("shareTemplateVersion");
    self.m_shareTemplateVersion = number.valueOf(self.m_shareTemplateVersion, -1);

    local strShareTemplate = dict:getString("strShareTemplate");
    local shareTemplate = json.decode(strShareTemplate);
    if not table.isEmpty(shareTemplate) then
        self.m_shareTemplate = shareTemplate;
    end
end

ShareDataInterface.getLocalDictName = function(self)
    return "ShareDataInterfaceConfig";
end


ShareDataInterface.s_socketCmdFuncMap = {
    [PHP_TASK_GETWEICHATINFO] = ShareDataInterface.onGetTaskShareInfoCallBack;
    [PHP_SHARE_TEMPLE]        = ShareDataInterface.onGetShareTemplateCallBack;
}