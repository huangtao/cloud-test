-- 公共call_native 方法
NativeEvent.callNativeEvent = function(self , keyParm , data)
    if data then
        dict_set_string(keyParm,keyParm..kparmPostfix,data);
    end
    dict_set_string(NativeEvent.s_luaCallEvent,NativeEvent.s_luaCallEvent,keyParm);
    call_native(NativeEvent.s_luaCallNavite);
end

NativeEvent.getWriteLogPath = function(self)
    self:callNativeEvent("getWriteLogPath");
    return dict_get_string("getLogPath","getLogPath") or "";
end

NativeEvent.Exit = function(self)
    --self:callNativeEvent("Exit");
end

NativeEvent.setFPS = function(self, fps)
end

NativeEvent.StartSystemTimer = function(self,id,time)
    dict_set_int("SystemTimer", "Id", id);
    dict_set_int("SystemTimer", "Time", time);
    
    self:callNativeEvent("StartSystemTimer");
end 

NativeEvent.StopSystemTimer = function(self,id)
    dict_set_int("SystemTimer", "Id", id);
    self:callNativeEvent("StopSystemTimer");
end

NativeEvent.getVersion = function(self,httpUrl,savePath,timeout)
    dict_set_string("getVersion","httpUrl",httpUrl);
    dict_set_string("getVersion","savePath",savePath);
    dict_set_int("getVersion","timeout",timeout or 5000);

    self:callNativeEvent("getVersion");
end

NativeEvent.getUpdate = function(self,httpUrl,savePath,timeout)
    dict_set_string("getUpdate","httpUrl",httpUrl);
    dict_set_string("getUpdate","savePath",savePath);
    dict_set_int("getUpdate","timeout",timeout or 5000);

    self:callNativeEvent("getUpdate");
end

NativeEvent.showDownloadFileDialog = function(self, str)
    dict_set_string("showDownloadFileDialog","tips",str or "");
    self:callNativeEvent("showDownloadFileDialog");
end

NativeEvent.closeDownloadFileDialog = function(self)
    self:callNativeEvent("closeDownloadFileDialog");
end

NativeEvent.GuestLogin = function(self)
    self:callNativeEvent("GuestLogin");
end

NativeEvent.getMachineId = function(self)
    self:callNativeEvent("getMachineId");
end

NativeEvent.getDeviceId = function(self)
    self:callNativeEvent("getDeviceId");
end


NativeEvent.sendSmsByRegister = function(self,data)
    self:callNativeEvent("sendSmsByRegister" , data);
end

NativeEvent.openBrowser = function(self , data)
    self:callNativeEvent("openBrowser" , data);
end

NativeEvent.sendSmsByGetNewPW = function(self)
    self:callNativeEvent("sendSmsByGetNewPW", data);
end

--data = {number=num,content=""}
NativeEvent.openSmsEdit = function(self, data)
    self:callNativeEvent("openSmsEdit", data)
end

NativeEvent.openNetSettings = function(self)
    self:callNativeEvent("openNetSettings")
end

NativeEvent.CloseStartScreen = function(self)
    self:callNativeEvent("CloseStartScreen");
end

NativeEvent.getPhoneInfo = function(self)
    self:callNativeEvent("getPhoneInfo");
    return dict_get_string("systemInfo", "phoneInfo") or "";
end

NativeEvent.openIosWebPay = function (self,data)
    -- body
    self:callNativeEvent("openIosWebPay",data);
end

NativeEvent.IosPayResultCallback = function (self,orderId)
    self:callNativeEvent("IosPayResultCallback",orderId);
end

NativeEvent.checkUnfinishIAP = function(self)
    self:callNativeEvent("checkUnfinishIAP");
end

NativeEvent.closeIosWebPay = function (self)
    -- body
    self:callNativeEvent("closeIosWebPay");
end


NativeEvent.backIosWebPay = function (self)
    -- body
    self:callNativeEvent("backIosWebPay");
end


NativeEvent.DeviceShake = function(self)
    self:callNativeEvent("DeviceShake");
end

NativeEvent.UploadHeadImage = function(self,data)--上传头像
    self:callNativeEvent("UploadHeadImage",data);
end

NativeEvent.chooseImage = function(self, data)
   self:callNativeEvent("chooseImage", data);
end

NativeEvent.uploadFeedbackImage = function(self, data)
   self:callNativeEvent("uploadFeedbackImage", data);
end

NativeEvent.sendFeedbackInfo = function ( self,data)
    self:callNativeEvent("sendFeedbackInfo",data);
end

NativeEvent.openFeedback = function ( self,userId)
    local info = {};
    info.mid = userId;
    local infoStr = json.encode(info);
    self:callNativeEvent("openFeedback",infoStr);
end

NativeEvent.notifygetFeedback = function ( self,data )
    self:callNativeEvent("notifygetFeedback",data);
end

NativeEvent.openHelp = function ( self,userId )
    local info = {};
    info.mid = userId;
    local infoStr = json.encode(info);
    self:callNativeEvent("openHelp",infoStr);
end

NativeEvent.openSecrecy = function ( self,data)
    self:callNativeEvent("openSecrecy",data);
end

NativeEvent.closeSecrecy = function ( self )
    self:callNativeEvent("closeSecrecy");
end

NativeEvent.sendFeedbackResult = function ( self , data )
    self:callNativeEvent("sendFeedbackResult" , data);
end

NativeEvent.getFeedbackListResult = function ( self , data)
    self:callNativeEvent("getFeedbackListResult" , data);
end

NativeEvent.closeTicketResult = function ( self , data)
    self:callNativeEvent("closeTicketResult" , data);
end

NativeEvent.isWXAppSupportPaymentForLua = function(self)
    self:callNativeEvent("isWXAppSupportPaymentForLua");
end

NativeEvent.openWeiXin = function(self)
    self:callNativeEvent("openWeiXin");
end

NativeEvent.weixinCheckSupportSendToFriendsCirCleForLua = function(self)
    self:callNativeEvent("weixinCheckSupportSendToFriendsCirCleForLua");
end

    -- 微信分享文本
-- @param 分享的文本
-- @param isSendToFriendsCircle 是否分享到朋友圈，boolean
NativeEvent.weixinSendText = function(self, text, isSendToFriendsCircle)
    local params = {};
    params.text = text;
    params.isSendToFriendsCircle = isSendToFriendsCircle;
    self:callNativeEvent("weixinSendText", json.encode(params));
end

-- 微信游戏屏幕并分享图片，时间上和内存上有可能会有问题
-- @param isSendToFriendsCircle 是否分享到朋友圈，boolean
NativeEvent.weixinTakeScreenShotAndSendImage = function(self, isSendToFriendsCircle)
    local params = {};
    params.isSendToFriendsCircle = isSendToFriendsCircle;
    self:callNativeEvent("weixinTakeScreenShotAndSendImage", json.encode(params));
end

--微信分享图片
--@param isSendToFriendsCircle 是否分享到朋友圈，boolean
NativeEvent.weixinSendImage = function(self, imagePath, isSendToFriendsCircle)
    local params = {};
    params.imagePath = imagePath;
    params.isSendToFriendsCircle = isSendToFriendsCircle;
    self:callNativeEvent("weixinSendImage", json.encode(params));
end

--微信合成图片然后再进行分享
NativeEvent.weixinMergeAndSendImage = function(self, imageBgPath, tilesets, isSendToFriendsCircle, x, y, width, height)
    local params = {};
    params.imageBgPath = imageBgPath;
    params.tilesets = tilesets;
    params.isSendToFriendsCircle = isSendToFriendsCircle;
    params.x = x;
    params.y = y;
    params.width = width;
    params.height = height
    self:callNativeEvent("weixinMergeAndSendImage", json.encode(params));
end

-- 微信分享网页
-- @param url 网页的url
-- @param title 分享的标题
-- @param desc 分享的描述
-- @param headPath 
-- @param isSendToFriendsCircle 是否分享到朋友圈，boolean
NativeEvent.weixinSendWebPage = function(self, url, title, desc,headPath,isSendToFriendsCircle)
    local params = {};
    params.url = url;
    params.title = title;
    params.desc = desc;
    params.headPath = tostring(headPath);
    params.isSendToFriendsCircle = isSendToFriendsCircle;
    self:callNativeEvent("weixinSendWebPage", json.encode(params));
end

-- 微信分享网页，有一个当前调用时的屏幕截图
-- @param url 网页的url
-- @param title 分享的标题
-- @param desc 分享的描述
-- @param isSendToFriendsCircle 是否分享到朋友圈，boolean
NativeEvent.weixinTakeScreenShotAndSendWebPage = function(self, url, title, desc, isSendToFriendsCircle)
    local params = {};
    params.url = url;
    params.title = title;
    params.desc = desc;
    params.isSendToFriendsCircle = isSendToFriendsCircle;
    self:callNativeEvent("weixinTakeScreenShotAndSendWebPage", json.encode(params));
end

-- 截图并保存到相册
-- @param title 标题
-- @param desc 描述
NativeEvent.takeScreenShotAndSaveToLocal = function(self, title)
    local params = {};
    params.title = title;
    params.desc = "";
    self:callNativeEvent("takeScreenShotAndSaveToLocal", json.encode(params));
end

NativeEvent.saveImageToPhotoAlbum = function(self, imagePath)
    local params = {};
    params.imagePath = imagePath;
    self:callNativeEvent("saveImageToPhotoAlbum", json.encode(params));
end

NativeEvent.openQQ = function(self)
    self:callNativeEvent("openQQ");
end

    --QQ分享 图文分享
NativeEvent.qqShareWebPage = function(self, targetUrl, title, desc, imageUrl, isSendToFriendsCircle)
    local params = {};
    params.isSendToFriendsCircle = isSendToFriendsCircle;
    params.imageUrl = imageUrl;
    params.title = title;
    params.desc = desc;
    params.targetUrl = targetUrl;

    self:callNativeEvent("qqShareWebPage", json.encode(params) );
end

-- Umeng调用onEvent统计事件，事件ID需要先在Umeng控制台配置
NativeEvent.umengEvent = function(self, eventId)
    local tab = {};
    tab.eventId = eventId;
    local json_data = json.encode(tab);
    self:callNativeEvent("umengEvent", json_data);
end

--友盟错误上报
NativeEvent.umengError = function(self, errType , errContext)
    local tab = {};
    tab.errType = errType;
    tab.errContext = errContext;
    local json_data = json.encode(tab);
    self:callNativeEvent("umengError", json_data);
end

--检测是否有网络，返回json格式
NativeEvent.GetNetworkAvailability = function(self)
    self:callNativeEvent("GetNetworkAvailability");
end

--活动网络是否有效，返回json格式
NativeEvent.GetNetworkActivity = function(self)
    self:callNativeEvent("GetNetworkActivity");
end

NativeEvent.downloadFile = function(self, loadUrl , savaPath)
    local tab = {};
    tab.loadUrl = "http://mvfbll01.ifere.com/landlord/download/config.xml";
    tab.savePath = System.getStorageRoot() .. "/config.xml";
    --tab.loadUrl = loadUrl;
    --tab.savePath = savaPath;
    local json_data = json.encode(tab);
    self:callNativeEvent("downloadFile", json_data);
end

--预加载声音
NativeEvent.preloadSound = function(self)
    local soundPath = {};
    soundPath.effect = Effects.getEffectPath();
    soundPath.music = Music.getMusicPath();
    Log.d("NativeEvent.preloadSound -musicPath" ,soundPath.musicPath);
    local json_data = json.encode(soundPath);
    Log.d("preloadSound**********************:" , json_data);
    self:callNativeEvent("preloadSound" , json_data);
end

--获取电量
NativeEvent.getBatteryLevel = function(self)
    self:callNativeEvent("GetBatteryLevel");        
end

NativeEvent.getSignalStrength = function(self)
    -- self:callNativeEvent("getSignalStrength");       
end

--获取内存
NativeEvent.getMemory = function(self)
    self:callNativeEvent("getMemory");      
end
--获取网络类型
--返回值为整型 1：wifi  2:2G  3:3G  4:4G  -1:未知或无网络
NativeEvent.getNetworkType = function(self)
    self:callNativeEvent("getNetworkType");
    return dict_get_int("networkType", "type" , -1);
end;

NativeEvent.uploadLogFile = function(self,json_data)    
end

NativeEvent.autoDial = function(self,json_data)
    self:callNativeEvent("autoDial",json_data);
end

NativeEvent.autoSelectDial = function(self,json_data)
    self:callNativeEvent("autoSelectDial",json_data);
end

NativeEvent.NewWebView = function(self, info)
    local json_data = json.encode(info);
    self:callNativeEvent("NewWebView",json_data);
end

NativeEvent.SetWebViewUrl = function(self,handle, url)
    local param = {["handle"] = handle,["url"] = url};
    local json_data = json.encode(param);
    self:callNativeEvent("SetWebViewUrl",json_data);
end

NativeEvent.GoBackWebView = function(self)
    self:callNativeEvent("GoBackWebView");
end

NativeEvent.DelView = function(self, handle)
    self:callNativeEvent("DelView");
end

NativeEvent.ShowEmbedWebView = function ( self )
    self:callNativeEvent("ShowEmbedWebView");
end

NativeEvent.HideEmbedWebView = function ( self )
    self:callNativeEvent("HideEmbedWebView");
end

NativeEvent.hideWebView = function ( self )
    self:callNativeEvent("hideWebView");
end

NativeEvent.getContacts = function(self)
    self:callNativeEvent("getContacts");
end

-- 更新apk
-- param: download_path 下载url
-- param: save_path     保存路径
NativeEvent.updateAPK = function ( self, download_path, save_path )
    local tab = {};
    tab.download_path = download_path;
    tab.save_path = save_path;
    local json_data = json.encode(tab);
    self:callNativeEvent("updateAPK", json_data);
end

-- 安装apk
-- param: apk_path      包含apk名称的绝对路径，例如/mnt/sdcard/xxx.apk
NativeEvent.installAPK = function (self , apk_path)
    local tab = {};
    tab.apk_path = apk_path;
    local json_data = json.encode(tab);
    self:callNativeEvent("installAPK", json_data);
end

--界面切换过渡动画
NativeEvent.ShowLoadingScene = function(self,msg)
    local info = {};
    info.msg = msg or "";
    local json_data = json.encode(info);
    self:callNativeEvent("ShowLoadingScene",json_data);
end

NativeEvent.HideLoadingScene = function(self)
    self:callNativeEvent("HideLoadingScene");
end

--界面切换loading框
NativeEvent.ShowLoadingDialog = function(self,msg,displayTime)

    LoadingView.setDefaultDisplayTime(displayTime);
    LoadingView.getInstance():showText(msg);
end

NativeEvent.HideLoadingDialog = function(self)
    -- self:callNativeEvent("HideLoadingDialog");
    LoadingView.getInstance():hidden();
end

--Toast
NativeEvent.ShowToast = function(self,msg,long)
    local info = {};
    info.msg = msg or "";
    info.long = long or 0;--1,长时间；0，短时间
    local json_data = json.encode(info);
    self:callNativeEvent("ShowToast",json_data);
end

--解压新游戏
NativeEvent.unzipNewGames = function(self,msg,long)
    self:callNativeEvent("unzipNewGames");
end

    --SD卡是否可用
NativeEvent.isSDCardAvailable = function(self)
    return true;
end

--打开指定地址网页  param: {"url":""}
NativeEvent.openWebPage = function(self,json_data)
    self:callNativeEvent("openWebPage",json_data);
end


--web支付集合
NativeEvent.webUnifyPay = function(self,info)

    self:callNativeEvent("webUnifyPay",info);
    

end

NativeEvent.createQR = function(self, str)
    self:callNativeEvent("createQR", str or "");
end

NativeEvent.scanQR = function(self)
    self:callNativeEvent("scanQR");
end

--统一支付
NativeEvent.startTongYiPay = function(self,info,userId)
    if System.getPlatform() == kPlatformIOS then
        self:callNativeEvent("startTongYiPay",info);
    else
         info.hideMsgPay = kHideMsgPay;
         info.tyPayVersion =  "";
         info.mid = userId;
         local json_data = json.encode(info);
         self:callNativeEvent("startTongYiPay",json_data);
    end
    
end

NativeEvent.isCanReadFile = function(self,filePath)
    self:callNativeEvent("isCanReadFile",filePath);
end

NativeEvent.isCanWriteFile = function(self,filePath)
    self:callNativeEvent("isCanWriteFile",filePath);
end

NativeEvent.CloseRoomPopu = function(self)
    local tab = {};
    tab.popuId = 1;
    local json_data = json.encode(tab);
    self:callNativeEvent("CloseRoomPopu" , json_data);
end

NativeEvent.ShowRoomFanHelp = function(self)
    local tab = {};
    tab.popuId = 1;
    local json_data = json.encode(tab);
    self:callNativeEvent("ShowRoomFanHelp" , json_data);
end

    --短信监听
NativeEvent.registerSmsObserver = function(self)
    
end

--取消短信监听
NativeEvent.unRegisterSmsObserver = function(self)
    
end

NativeEvent.getGeTuiToken = function(self)
    self:callNativeEvent("getGeTuiToken");
end

NativeEvent.hideEditTextView = function(self)
    self:callNativeEvent("hideEditTextView");
end

NativeEvent.checkJsonValid = function(self,str)
    return 1;
end

NativeEvent.setGameUpdateInfo = function(self, gameUpdateInfo)
    local strUpdateInfo = json.encode(gameUpdateInfo) or "";
    
    self:callNativeEvent("setGameUpdateInfo", strUpdateInfo);
end

------------------------------ios 生命周期------------------------------------
kRoomSocketCloseTimeoutId = 1001;
kExitGameTimeoutId = 1002;
kOSTimeout = "OSTimeout";
kClearOSTimeout = "ClearOSTimeout";
kSetOSTimeout = "SetOSTimeout";

NativeEvent.StartOSTimeoutClock = function(self, isSocketOpen)
    dict_set_int(kOSTimeout, "id", kRoomSocketCloseTimeoutId);
    dict_set_int(kOSTimeout, "ms", 1000*10);
    call_native(kSetOSTimeout);
    
    dict_set_int(kOSTimeout, "id", kExitGameTimeoutId);
    --设置一个timeout,当其到达时关闭程序
    --6分钟后自动退出应用
    local timeout_exit = isSocketOpen and 1000*60 or 1000*60*6;  --在房间内时1分钟退出应用  否则6分退出
    dict_set_int(kOSTimeout,"ms", timeout_exit);
    call_native(kSetOSTimeout);
end 

NativeEvent.RemoveTimeoutClock = function(self)
    dict_set_int(kOSTimeout,"id", kRoomSocketCloseTimeoutId);
    call_native(kClearOSTimeout);
    dict_set_int(kOSTimeout,"id", kExitGameTimeoutId);
    call_native(kClearOSTimeout);
end

NativeEvent.getNetWorkTypeForLua = function(self)
    --self:callNativeEvent("getNetWorkTypeForLua");
end

NativeEvent.getNetWorkAvalible = function(self)
    self:callNativeEvent("getNetWorkAvalible");
    return dict_get_int("networkType", "avalible", 0) == 1;
end
 -- 获取metaData
NativeEvent.getMetaData = function(self)
    return kTestUmeng;
end;

NativeEvent.createDirectory = function(self,path)
end

NativeEvent.deleteDirectory = function(self,path)
end

NativeEvent.clearDirectory = function(self,path)
end

-----------------------------videosdk相关-----------------------------
NativeEvent.videoLogin = function(self)
    self:callNativeEvent("videoLogin");
end

NativeEvent.videoLogout = function(self)
    self:callNativeEvent("videoLogout");
end

NativeEvent.videoOpenMicrophone = function(self)
    self:callNativeEvent("videoOpenMicrophone");
end

NativeEvent.videoCloseMicrophone = function(self)
    self:callNativeEvent("videoCloseMicrophone");
end

-----------------------------imsdk相关-----------------------------
NativeEvent.imGetCurrentLocation = function(self)
    self:callNativeEvent("imGetCurrentLocation");
    return dict_get_string("boyaa_imsdk", "coordinate");
end

NativeEvent.imGetContractsInfo = function(self)
    self:callNativeEvent("imGetContractsInfo");
    return dict_get_string("boyaa_imsdk", "contracts");
end

NativeEvent.imStopAudioRecord = function(self)
    self:callNativeEvent("imStopAudioRecord");
end

NativeEvent.imStartAudioRecord = function(self)
    self:callNativeEvent("imStartAudioRecord");
end

NativeEvent.imStartAudioPlay = function(self)
    self:callNativeEvent("imStartAudioPlay");
end

NativeEvent.imStopAudioPlay = function(self)
    self:callNativeEvent("imStopAudioPlay");
end

NativeEvent.imGetGotoGps = function(self)
    self:callNativeEvent("imGetGotoGps");
end

NativeEvent.clipboardSetText = function(self, text)
    dict_set_string("boyaa_clipboard", "text", text);
    self:callNativeEvent("clipboardSetText");
end

NativeEvent.clipboardGetText = function(self)
    self:callNativeEvent("clipboardGetText");
    return dict_get_string("boyaa_clipboard", "text");
end

NativeEvent.clipboardClean = function(self)
    self:callNativeEvent("clipboardClean");
end

NativeEvent.openSms = function(self, text)
    dict_set_string("boyaa_sms", "text", text);
    self:callNativeEvent("openSms");
end

NativeEvent.changeScreenOrientation = function(self, isLandscapeState)
    local json_data = json.encode({isLandscapeState = isLandscapeState});
    self:callNativeEvent("changeScreenOrientation", json_data);
end

NativeEvent.getCurScreenOrientation = function(self)
    self:callNativeEvent("getScreenOrientation");
    return dict_get_int("orientationConfig", "orientation", 0);
end
NativeEvent.getWifiState = function(self)
    self:callNativeEvent("getWifiState");
    return dict_get_int("boyaa_network", "wifiState", 0);
end

NativeEvent.enterServiceChat = function(self, tab)
    local json_data = json.encode(tab);
    self:callNativeEvent("enterServiceChat", json_data);
end

NativeEvent.getCallAppParam = function(self)
    self:callNativeEvent("getCallAppParam");
    local param = dict_get_string("getCallAppParam", "param");
    return param;
end