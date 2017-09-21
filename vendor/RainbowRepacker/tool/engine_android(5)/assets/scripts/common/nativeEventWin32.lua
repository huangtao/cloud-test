NativeEvent.callNativeEvent = function(self , keyParm , data)
    if data then
        dict_set_string(keyParm,keyParm..kparmPostfix,data);
    end
    dict_set_string(NativeEvent.s_luaCallEvent,NativeEvent.s_luaCallEvent,keyParm);
    call_native(NativeEvent.s_luaCallNavite);
end

NativeEvent.getWriteLogPath = function(self)
end

NativeEvent.setFPS = function(self, fps)
end

NativeEvent.IosPayResultCallback = function (self,orderId)
end

NativeEvent.checkUnfinishIAP = function (self,orderId)
end

NativeEvent.Exit = function(self)
end

NativeEvent.StartSystemTimer = function(self,id,time)
end 

NativeEvent.StopSystemTimer = function(self,id)
end

NativeEvent.getVersion = function(self,httpUrl,savePath,timeout)
    EventDispatcher.getInstance():dispatch(Event.Call,"getVersion",false);
end

NativeEvent.getUpdate = function(self,httpUrl,savePath,timeout)
   EventDispatcher.getInstance():dispatch(Event.Call,"getUpdate",false);
end

NativeEvent.showDownloadFileDialog = function(self, str)
    
end

NativeEvent.closeDownloadFileDialog = function(self)
    
end

NativeEvent.GuestLogin = function(self)

end
NativeEvent.getMachineId = function(self)
end

NativeEvent.getDeviceId = function(self)
end


NativeEvent.sendSmsByRegister = function(self)
end

NativeEvent.openBrowser = function(self)
end

NativeEvent.sendSmsByGetNewPW = function(self)
end

NativeEvent.openSmsEdit = function(self, data)
end

NativeEvent.openNetSettings = function(self)
end

NativeEvent.CloseStartScreen = function(self)

end
NativeEvent.getPhoneInfo = function(self)

end

NativeEvent.StartMobilePay = function(self)

end

NativeEvent.StartHuaJianPay = function(self)
end

NativeEvent.StartWoPay = function(self)

end

NativeEvent.StartTelecomPay = function(self)

end

NativeEvent.StartAlixPay = function(self)

end

NativeEvent.StartUnionPay = function(self)

end

NativeEvent.StartYiBaoPay = function(self)

end

NativeEvent.StartMMbillingPay = function(self)

end

NativeEvent.openIosWebPay = function (self,data)
    -- body

end


NativeEvent.closeIosWebPay = function (self)
    -- body

end


NativeEvent.backIosWebPay = function (self)
    -- body

end


NativeEvent.StartQianChiPay = function(self)

end

NativeEvent.StartHuaFuBaoPay = function(self)

end

NativeEvent.DeviceShake = function(self)
end


NativeEvent.chooseImage = function(self, data)
end

NativeEvent.uploadFeedbackImage = function(self, data)
end 

NativeEvent.UploadHeadImage = function(self,data)
end

NativeEvent.sendFeedbackInfo = function ( self,data)
end

NativeEvent.openFeedback = function ( self )

end

NativeEvent.notifygetFeedback = function ( self,data )
    
end

NativeEvent.openHelp = function ( self )
    
end

NativeEvent.openSecrecy = function ( self,data )
    
end

NativeEvent.closeSecrecy = function ( self )
    
end

NativeEvent.sendFeedbackResult = function ( self , data )
    
end

NativeEvent.getFeedbackListResult = function ( self , data)
    
end
NativeEvent.closeTicketResult = function ( self , data)
    
end

-- Umeng调用onEvent统计事件，事件ID需要先在Umeng控制台配置
NativeEvent.umengEvent = function(self, eventId)

end

--检测是否有网络，返回json格式
NativeEvent.GetNetworkAvailability = function(self)
    
end

--活动网络是否有效，返回json格式
NativeEvent.GetNetworkActivity = function(self)
    
end

NativeEvent.downloadFile = function(self, loadUrl , savaPath)

end

NativeEvent.preloadSound = function(self)
end

    --友盟错误上报
NativeEvent.umengError = function(self, errType , errContext)

end
--获取电量
NativeEvent.getBatteryLevel = function(self)
end

NativeEvent.getSignalStrength = function(self)
end

NativeEvent.getMemory = function(self)
        
end
NativeEvent.getNetworkType = function(self)
end

NativeEvent.uploadLogFile = function(self,json_data)    
end
        
NativeEvent.NewWebView = function(rect)
end

NativeEvent.SetWebViewUrl = function(handle, url)
end

NativeEvent.GoBackWebView = function(self, handle)
end

NativeEvent.DelView = function(self, handle)
end

NativeEvent.ShowEmbedWebView = function ( self )
end

NativeEvent.HideEmbedWebView = function ( self )
end

NativeEvent.hideWebView = function(self, handle)
end


NativeEvent.autoDial = function(self,json_data)
end

NativeEvent.autoSelectDial = function(self,json_data)
end

NativeEvent.getContacts = function(self)
    
end

NativeEvent.updateAPK = function ( self, download_path, save_path )
end

NativeEvent.installApk = function (self , apk_path)
end

NativeEvent.ShowLoadingScene = function(self,msg)
end

NativeEvent.HideLoadingScene = function(self)
end

NativeEvent.ShowLoadingDialog = function(self,msg,displayTime)
    LoadingView.setDefaultDisplayTime(displayTime);
    LoadingView.getInstance():showText(msg);
end

NativeEvent.HideLoadingDialog = function(self)
    LoadingView.getInstance():hidden();
end

NativeEvent.ShowToast = function(self,msg,long)
end

--解压新游戏
NativeEvent.unzipNewGames = function(self,msg,long)
    
end

--SD卡是否可用
NativeEvent.isSDCardAvailable = function(self)
    return true;
end

NativeEvent.openWebPage = function(self,json_data)
end

NativeEvent.startTongYiPay = function(self,json_data,userId)
end



NativeEvent.isCanReadFile = function(self,filePath)
end

NativeEvent.isCanWriteFile = function(self,filePath)
end

NativeEvent.isWXAppSupportPaymentForLua = function(self)
end

NativeEvent.openWeiXin = function(self)
end

NativeEvent.weixinCheckSupportSendToFriendsCirCleForLua = function(self)
end

NativeEvent.weixinSendText = function(self, text, isSendToFriendsCircle)
end

NativeEvent.weixinTakeScreenShotAndSendImage = function(self, isSendToFriendsCircle)
end

NativeEvent.weixinSendImage = function(self, imagePath, isSendToFriendsCircle)
end

--微信合成图片然后再进行分享
NativeEvent.weixinMergeAndSendImage = function(self, imageBgPath, tilesets, isSendToFriendsCircle)
end

NativeEvent.weixinSendWebPage = function(self, url, title, desc,headPath,isSendToFriendsCircle)
end

NativeEvent.weixinTakeScreenShotAndSendWebPage = function(self, url, title, desc, isSendToFriendsCircle)
end

NativeEvent.takeScreenShotAndSaveToLocal = function(self, title)
end

NativeEvent.saveImageToPhotoAlbum = function(self, imagePath)
end

NativeEvent.openQQ = function(self)
end

--QQ分享 图文分享
NativeEvent.qqShareWebPage = function(self, targetUrl, title, desc, imageUrl, isSendToFriendsCircle)
end

NativeEvent.CloseRoomPopu = function(self)
end

NativeEvent.ShowRoomFanHelp = function(self)
end

NativeEvent.StartOSTimeoutClock = function(self, isSocketOpen)
end

NativeEvent.RemoveTimeoutClock = function(self)
end

    --短信监听
NativeEvent.registerSmsObserver = function(self)
    
end

--取消短信监听
NativeEvent.unRegisterSmsObserver = function(self)

end
    
NativeEvent.getNetWorkTypeForLua = function(self)

end

NativeEvent.getNetWorkAvalible = function(self)
    return true;
end

NativeEvent.checkJsonValid = function(self)
    return 1;
end

NativeEvent.setGameUpdateInfo = function(self, gameUpdateInfo)
end
-------------------------------GodSDK相关-------------------------
-- 请求登录
NativeEvent.requestGodSDKLogin = function(self)
end

-- 请求GodSDK的支付
NativeEvent.requestGodSDKPay = function(self)
end

-- 同步判断GodSDKAccount是否支持切换账号
NativeEvent.isGodSDKSupportSwitchAccount = function(self)
end

-- 请求切换账号
NativeEvent.requestGodSDKSwitchAccount = function(self)
end

-- 同步判断GodSDKAccount是否支持退出
NativeEvent.isGodSDKSupportQuit = function(self)
end

-- 请求GodSDK的退出
NativeEvent.requestGodSDKQuit = function(self)
end

NativeEvent.callSpecialMethod = function(self)
end

NativeEvent.getGeTuiToken = function(self)
end

-- 获取metaData
NativeEvent.getMetaData = function(self)
  return kTestUmeng;
end;

NativeEvent.createDirectory = function(self,path)
    path = path or "";

    path = string.gsub(path, '/', '\\');
    os.execute(" if not exist "..path.." mkdir "..path);
end

NativeEvent.deleteDirectory = function(self,path)
    path = path or "";
    path = string.gsub(path, '/', '\\');
    os.execute("del /s/q "..path);
    os.execute("rd /s/q "..path);
end

NativeEvent.clearDirectory = function(self,path)
    path = path or "";
    path = string.gsub(path, '/', '\\');
    os.execute("del /s/q "..path);
    os.execute("rd /s/q "..path);
    os.execute("mkdir "..path);
end

-----------------------------videosdk相关-----------------------------
NativeEvent.videoLogin = function(self)
end

NativeEvent.videoLogout = function(self)
end

NativeEvent.videoOpenMicrophone = function(self)
end

NativeEvent.videoCloseMicrophone = function(self)
end

-----------------------------imsdk相关-----------------------------
NativeEvent.imGetCurrentLocation = function(self)
end

NativeEvent.imGetContractsInfo = function(self)
end

NativeEvent.imStopAudioRecord = function(self)
end

NativeEvent.imStartAudioRecord = function(self)
end

NativeEvent.imStartAudioPlay = function(self)
end

NativeEvent.imStopAudioPlay = function(self)
end

NativeEvent.imGetGotoGps = function(self)  
end

NativeEvent.clipboardSetText = function(self, text)
end

NativeEvent.clipboardGetText = function(self)
end

NativeEvent.clipboardClean = function(self)
end

NativeEvent.openSms = function(self, text)
end


------------------------二维码扫描--------------------
NativeEvent.createQR = function(self, str)
end

NativeEvent.scanQR = function(self)
end

NativeEvent.changeScreenOrientation = function(self, state)
end

NativeEvent.getCurScreenOrientation = function(self)
end
NativeEvent.getWifiState = function(self)
    return 1;
end

NativeEvent.enterServiceChat = function(self, tab)
end

NativeEvent.getCallAppParam = function(self)
    return "";
end