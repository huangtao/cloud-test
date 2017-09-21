
--[[
    分享接口层，目前支持 微信 + QQ 分享
]]

require("gameData/dataInterfaceBase");
require("hall/task/data/taskRewardDataInterface");
require("hall/gameData/share/shareDataInterface");
require("gameData/weixinShareUtil");

WeiXinIsolater = class(DataInterfaceBase);

WeiXinIsolater.Delegate = {
    onOpenShareAppCallBack      = "onOpenShareAppCallBack";
    getWeiChatCallback          = "onGetWeiChatCallback";
    onDownloadShareImageCallBack = "onDownloadShareImageCallBack";
    onTakeScreenShotAndSaveToLocal = "onTakeScreenShotAndSaveToLocal";
    onSaveImageToPhotoAlbumCallBack = "onSaveImageToPhotoAlbumCallBack";
};

WeiXinIsolater.getInstance = function()
    if not WeiXinIsolater.s_instance then
        WeiXinIsolater.s_instance = new(WeiXinIsolater); 
    end
    return WeiXinIsolater.s_instance;
end

WeiXinIsolater.ctor = function(self)
    ShareDataInterface.getInstance():setObserver(self);
    WeixinShareUtil.getInstance():setObserver(self);
end

WeiXinIsolater.dtor = function(self)
    ShareDataInterface.getInstance():clearObserver(self);
    WeixinShareUtil.getInstance():clearObserver(self);
end
-----------------------------------------------------------------------------------
--[[
    @brief 获取微信分享信息
    @return 分享内容
        t = {
            friend_url     微信好友分享地址
            space_url      微信朋友圈分享地址
            desc           分享内容
            title          分享标题
            share_icon     分享icon地址  注意icon大小不能超过32k 否则会分享失败
        }
--]] 
WeiXinIsolater.getWeiXinChatInfo = function(self)
    return ShareDataInterface.getInstance():getWeiXinChatInfo();
end

--[[
    @brief 获取QQ分享信息
    @return 分享内容
        t = {
            friend_url     QQ好友分享地址
            space_url      QQ空间分享地址
            desc           分享内容
            title          分享标题
            share_icon     分享icon地址  注意icon大小不能超过32k 否则会分享失败
        }
--]] 
WeiXinIsolater.getQQShareInfo = function(self)
    return ShareDataInterface.getInstance():getQQShareInfo();
end

--[[
    @brief 获取结算分享模板
    @return 分享模板  主要用于比赛分享 + 子游戏分享
        t = {
            [key] = {
                share_icon  分享Icon
                share_url   分享url
                desc        分享内容
            }
        }

        key --> eg: match_win、match_failed、game_win、game_failed、free_failed 等等
--]]
WeiXinIsolater.getGameOverShareTemplate = function(self)
    return ShareDataInterface.getInstance():getShareTemplate();
end

--[[
    @brief 通过http请求，下载分享图片
    @param params 请求参数 
            t = {
                scene  场景type值，php会根据这个值来判断当前是哪个场景
                ...    这个场景对应的参数，具体的值需要和php进行约定
            }
    @note 下载地址：ServerConfig.getInstance():getHostUrl() .. "?action=simpleimg.png"
            请求下载图片的参数, 当下载成功后的回调中，会将这个参数返回给调用者，调用者应该校验这个参数是否合法(是否是目前场景的)
--]]
WeiXinIsolater.requestDownloadShareImage = function(self, params)
    ShareDataInterface.getInstance():requestDownloadShareImage(params);
end

--[[
    @brief 获取分享图片回调
    @param isSuccess 是否获取成功
    @param downloadShareImageParams (table) 调用时传给php的参数
    @param filePath (string) 如果isSuccess为true，则filePath代表的是图片路径
    @param fileName (string) 如果isSuccess为true，则fileName代表的是图片文件名
--]]
WeiXinIsolater.onDownloadShareImageCallBack = function(self, isSuccess, downloadShareImageParams, filePath, fileName)
    self:notify(WeiXinIsolater.Delegate.onDownloadShareImageCallBack, isSuccess, downloadShareImageParams, filePath, fileName);
end

--[[
    @WARNING 不要用这个接口了!!!!
    @brief 向PHP发送微信邀请完成标识
]]

WeiXinIsolater.sendWeiXinInviteFlag = function(self)
    self:sendDayTaskShareFlagByShareChannel(WeixinShareUtil.eShareChannel.WEIXIN, false);
end

--[[
    @WARNING 不要用这个接口了!!!!
    @brief 向PHP发送微信分享完成标识
]]
WeiXinIsolater.sendWeiXinShareFlag = function(self)
    self:sendDayTaskShareFlagByShareChannel(WeixinShareUtil.eShareChannel.WEIXIN, true);
end

--[[
    @WARNING 不要用这个接口了!!!!
    @note 子游戏分享不作为分享任务，该接口对子游戏屏蔽
]]
WeiXinIsolater.sendDayTaskShareFlagByShareChannel = function(self, shareChannel, isSendToFriendsCircle)
    -- TaskRewardDataInterface.getInstance():sendDayTaskShareFlagByShareChannel(shareChannel, isSendToFriendsCircle);
end

--[[
    @brief 打开微信APP
]]
WeiXinIsolater.openWeiXin = function(self)
    WeixinShareUtil.getInstance():openWeiXin();
end

--[[
    @brief 打开QQAPP
--]]
WeiXinIsolater.openQQ = function(self)
    WeixinShareUtil.getInstance():openQQ();
end

--[[
    @brief 打开分享app(qq/weixin)回调
    @param isSuccess (boolean) 是否打开分享app成功
    @param shareChannel (string) 分享渠道标识 微信:WeixinShareUtil.eShareChannel.WEIXIN  QQ:WeixinShareUtil.eShareChannel.QQ
--]]
WeiXinIsolater.onOpenShareAppCallBack = function(self, isSuccess, shareChannel)
    self:notify(WeiXinIsolater.Delegate.onOpenShareAppCallBack, isSuccess, shareChannel);
end

--[[
    @brief 分享图片和网页
    @param isSendToFriendCircle (boolean) 是否分享到空间 true:是 false:分享到朋友
    @param imageUrl (string) 图片地址
    @param title (string) 标题
    @param desc (string) 文本描述
    @param targetUrl (string) 跳转地址
    @param customParam (table) 自定义参数 分享回调会将这个参数透传回来
--]]
WeiXinIsolater.qqShareWebPage = function(self, targetUrl, title, desc, imageUrl, isSendToFriendsCircle, customParam)
    WeixinShareUtil.getInstance():qqShareWebPage(targetUrl, title, desc, imageUrl, isSendToFriendsCircle, customParam); 
end

--[[
    @brief 微信分享文本
    @param text (string) 分享的文本
    @param isSendToFriendsCircle (boolean) 是否分享到朋友圈
    @param customParam (table) 自定义参数 分享回调会将这个参数透传回来
--]]
WeiXinIsolater.weixinSendText = function(self, text, isSendToFriendsCircle, customParam)
    WeixinShareUtil.getInstance():weixinSendText(text, isSendToFriendsCircle, customParam);
end

--[[
    @brief 微信游戏屏幕并分享图片，时间上和内存上有可能会有问题
    @param isSendToFriendsCircle (boolean) 是否分享到朋友圈
    @param customParam (table) 自定义参数 分享回调会将这个参数透传回来
--]]
WeiXinIsolater.weixinTakeScreenShotAndSendImage = function(self, isSendToFriendsCircle, customParam)
    WeixinShareUtil.getInstance():weixinTakeScreenShotAndSendImage(isSendToFriendsCircle, customParam);
end

--[[
    @brief 微信分享图片
    @param isSendToFriendsCircle (boolean) 是否分享到朋友圈
    @param customParam (table) 自定义参数 分享回调会将这个参数透传回来
]]
WeiXinIsolater.weixinSendImage = function(self, imagePath, isSendToFriendsCircle, customParam)
    WeixinShareUtil.getInstance():weixinSendImage(imagePath, isSendToFriendsCircle, customParam);
end

--[[
    @brief 微信合成图片然后再进行分享
    @param imageBgPath (string) 图片背景路径
    @param tilesets (table) 图块集合 eg { {imagePath="xxx",x=2,y=3,width=10,height=20} }  注: width,height 如果不传则采用图片本身的宽高
    @param isSendToFriendsCircle (boolean) 是否分享到朋友圈
    @param customParam (table) 自定义参数 分享回调会将这个参数透传回来
--]]
WeiXinIsolater.weixinMergeAndSendImage = function(self, imageBgPath, tilesets, isSendToFriendsCircle, customParam)
    WeixinShareUtil.getInstance():weixinMergeAndSendImage(imageBgPath, tilesets, isSendToFriendsCircle, customParam);
end

--[[
    @brief 微信分享网页
    @param url (string) 网页的url
    @param title (string) 分享的标题
    @param desc (string) 分享的描述
    @param headPath (string) 分享icon地址
    @param isSendToFriendsCircle (boolean) 是否分享到朋友圈
    @param customParam (table) 自定义参数 分享回调会将这个参数透传回来
--]]
WeiXinIsolater.weixinSendWebPage = function(self, url, title, desc, headPath, isSendToFriendsCircle, customParam)
    WeixinShareUtil.getInstance():weixinSendWebPage(url, title, desc, headPath, isSendToFriendsCircle, customParam);
end

--[[
    @brief 微信分享网页，有一个当前调用时的屏幕截图
    @param url (string) 网页的url
    @param title (string) 分享的标题
    @param desc (string) 分享的描述
    @param isSendToFriendsCircle (boolean) 是否分享到朋友圈
    @param customParam (table) 自定义参数 分享回调会将这个参数透传回来
    @note 实现原理是将当前GL里面的pixel buffer中的值转成bitmap进行分享，所以需要延迟一帧进行调用，从而使buffer中值得到更新
--]]
WeiXinIsolater.weixinTakeScreenShotAndSendWebPage = function(self, url, title, desc, isSendToFriendsCircle, customParam)
    WeixinShareUtil.getInstance():weixinTakeScreenShotAndSendWebPage(url, title, desc, isSendToFriendsCircle, customParam);
end

--[[
    @brief 截图并保存到相册
    @param fileSaveName (string) 文件存储名
    @param customParam (table) 自定义参数 分享回调会将这个参数透传回来
    @note 实现原理是将当前GL里面的pixel buffer中的值转成bitmap进行分享，所以需要延迟一帧进行调用，从而使buffer中值得到更新
--]]
WeiXinIsolater.takeScreenShotAndSaveToLocal = function(self, fileSaveName, customParam)
    WeixinShareUtil.getInstance():takeScreenShotAndSaveToLocal(title, customParam);
end

--[[
    @brief 截屏回调(还未保存到相册)
    @param isSuccess (boolean) 是否截屏成功
    @param customParam (table) 调用时传的customParam
]]
WeiXinIsolater.onTakeScreenShotAndSaveToLocal = function(self, isSuccess, customParam)
    self:notify(WeiXinIsolater.Delegate.onTakeScreenShotAndSaveToLocal, isSuccess, customParam);
end

--[[
    @brief 保存图片至相册
    @param 图片路径
]]
WeiXinIsolater.saveImageToPhotoAlbum = function(self, imagePath, customParam)
    WeixinShareUtil.getInstance():saveImageToPhotoAlbum(imagePath, customParam);
end

--[[
    @param imagePath 需要保存到相册图片的路径
    @param imageName 保存到相册后的图片名
]]
WeiXinIsolater.onSaveImageToPhotoAlbumCallBack = function(self, isSuccess, imagePath, imageName, customParam)
    Log.v("WeixinShareUtil.onSaveImageToPhotoAlbumCallBack","isSuccess = ",isSuccess, "imagePath = ", imagePath, "imageName = ", imageName);
    self:notify(WeiXinIsolater.Delegate.onSaveImageToPhotoAlbumCallBack, isSuccess, imagePath, imageName, customParam);
end

--[[
    @brief 微信/QQ分享回调
    @param isSuccess (boolean) 是否分享成功
    @param customParam (table) 调用时传的customParam
    @param shareChannel (string) 分享tag eg:WeixinShareUtil.eShareChannel.QQ or WeixinShareUtil.eShareChannel.WEIXIN
--]]
WeiXinIsolater.getWeiChatCallback = function(self, isSuccess, customParam, shareChannel)
    self:notify(WeiXinIsolater.Delegate.getWeiChatCallback, isSuccess, customParam, shareChannel);
end

---------------------------------- 微信分享副标题 ----------------------------------
WeiXinIsolater.setPrivateRoomShareSubTitle = function(self, subTitle)
    ShareDataInterface.getInstance():setPrivateRoomShareSubTitle(subTitle);
end

WeiXinIsolater.getPrivateRoomShareSubTitle = function(self)
   return ShareDataInterface.getInstance():getPrivateRoomShareSubTitle(); 
end