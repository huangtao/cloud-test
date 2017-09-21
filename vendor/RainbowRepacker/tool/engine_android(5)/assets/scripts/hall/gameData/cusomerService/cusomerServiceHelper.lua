
CusomerServiceHelper = class()


CusomerServiceHelper.Delegate = {
    onCustomerServiceCallBack = "onCustomerServiceCallBack",
}

CusomerServiceHelper.getInstance = function(DataInterfaceBase)
    if not CusomerServiceHelper.s_instance then
        CusomerServiceHelper.s_instance = new(CusomerServiceHelper)
    end
    return CusomerServiceHelper.s_instance
end

CusomerServiceHelper.ctor = function(self)
    EventDispatcher.getInstance():register(Event.Call, self, self.onNativeEvent)
end

CusomerServiceHelper.dtor = function(self)
    EventDispatcher.getInstance():unregister(Event.Call, self, self.onNativeEvent)
end


--进入客服聊天
--gameId 游戏ID，德州、斗地主、麻将等；对应客服后台数据库的gid，由客服部提供，业务需在接入前向客服部申请
--siteId 站点ID，简体、德语、繁体等；对应客服后台数据库的sid,由客服部提供，业务需在接入前向客服部申请
--options为可选参数表，以下为参数表可选key,value类型全为string
--gameName 游戏名称，如我爱斗地主，由开发者提供,不传的话默认由SDK获取,获取值默认为AndroidManifest中application标签中app_name指定的值。
--gameVersion 游戏版本，在AndroidManifest中由versionName指定的，由开发者提供,不传的话默认由SDK获取
--userID 用户ID,由开发者提供,例如，用户游戏的mid，不传的话默认由SDK获取
--deviceType 设备类型,由开发者提供，代指什么类型的设备，如，iphone、android、windowsphone、pc，SDK中默认值为“Android”，由开发者提供,不传的话默认由SDK获取
--deviceDetail 设备详情,代指用户使用的设备名称及型号如，Iphone6s、Xiaomi MI 4LTE等，由开发者提供,不传的话默认由SDK获取
--connectivity 网络连接类型，取值范围：2g，3g，4g，wifi，如果不传，SDK会自动去获取，有开发者提供
--ip 用户IP地址，由开发者提供,不传的话默认由SDK获取
--mac 用户MAC地址，由开发者提供,不传的话默认由SDK获取
--browser 用户手机的浏览器,移动端默认为“其他”,pc端显示浏览器，比如chrome、ie10等，移动端没有的话显示为其他由开发者提供，不传的话默认由SDK获取
--screen 户屏幕分辨率，格式要求为x*y，比如 1280*720,由开发者提供，不传的话默认由SDK获取
--OSVersion 操作系统版本,通过调用 android.os.Build.VERSION.RELEASE 获得，由开发者提供，不传的话默认由SDK获取
--jailbreak 用户手机操作系统是否root，或者获得root权限，取值true或false,由开发者提供，是否root适合Android类型手机，不传的话默认由SDK获取， 默认为false
--operator 用户SIM卡所述的运营商，由开发者提供， 取值-1~9，"无卡"(-1), Wifi(0),, ChinaMobile(1), ChinaUnion(2), ChinaTelecom(3), 台湾大哥大(4), 台湾远传电信(5), 台湾威宝(6), 台湾亚太(7), 台湾中华电信(8),"其他运营商"(9)。如果不知如何获取SIM卡所述的运营商，可以联系本文作者(CoulsonChen/JerryTan)。如果不传，SDK会自动去获取
CusomerServiceHelper.enter = function(self, gameId, siteId, options)
    if not gameId or not siteId then
        return
    end
    local tab = {}
    if not table.isEmpty(options) then
        for k, v in pairs(options) do
            tab[k] = v
        end
    end
    tab.gameId = tostring(gameId)
    tab.siteId = tostring(siteId)
    tab.stationId = tostring(kUserInfoData:getUserId()) --终端ID，每一个连接到Broker的终端都有一个唯一的ID。一般采用游戏里面的mid,由开发者提供
    tab.nickName = tostring(kUserInfoData:getNickname()) --用户昵称，即游戏昵称
    tab.accountType = tostring(kUserInfoData:getUType()) --账号类型，即用户在游戏界面选择的登陆类型
    tab.client = ""--客户端,代指当前的游戏渠道版本名称，由开发者提供

    tab.avatarUri = kUserInfoData:getAvatar_s() --用户头像图片的Uri，即图片的文件路径
    tab.role = kUserInfoData:getIsVip() and "3" or "2" --角色，客户端只需传入普通用户还是vip用户，“2”为普通用户，“3”表示VIP用户
    if tab.role == "3" then
        tab.vipLevel = "1" --用户的VIP等级，由开发者提供,取值为[0,1,2,3,...], 0表示为普通用户，大于0表示为vip用户，
    end
    NativeEvent.getInstance():enterServiceChat(tab)
end

CusomerServiceHelper.onCustomerServiceCallBack =  function(self, isSuccess, data)
    Log.v("CusomerServiceHelper.onCustomerServiceCallBack=======", isSuccess, data)
    self:notify(CusomerServiceHelper.Delegate.onCustomerServiceCallBack, isSuccess, data)
end

CusomerServiceHelper.onNativeEvent = function(self,param,...)
    if self.s_nativeEventFuncMap[param] then
        self.s_nativeEventFuncMap[param](self,...)
    end
end

CusomerServiceHelper.s_nativeEventFuncMap = {
    ["onCustomerServiceCallBack"] = CusomerServiceHelper.onCustomerServiceCallBack,
}