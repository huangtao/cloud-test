
QRUtil = class(DataInterfaceBase);

QRUtil.eQRType = {
    PRIVATE_ROOM                = 1;  --私人房
    BIND_ANGECY_URL             = 2;  --绑定代理商(特指扫描PHP生成的二维码 urr&mid=xxx&dfqp_qrType=2)
    BIND_ANGECY_USERINFO        = 3;  --个人信息二维码
    RECHARGEABLE_CARD           = 4;  --充值卡
    AGENT_LUA                   = 5;  --代理商lua版本
    EXCHANGE_AWARD              = 6;  --兑换奖品
    INVITATIONAL_SHARE          = 7;  --邀请赛分享
}

QRUtil.eScanQRParamType = {
    VALID_PARAM         = 0; --合法参数
    ERROR_PARAM         = 1; --参数错误
    ERROR_SCENE         = 2; --场景扫描错误
    ERROR_REGION        = 3; --不是本地区
    ERROR_VERSION       = 4; --版本不兼容
};

--客户端创建的二维码版本号
QRUtil.CREATE_QR_VERSION = {
    [QRUtil.eQRType.PRIVATE_ROOM] = 1;
    [QRUtil.eQRType.BIND_ANGECY_USERINFO] = 1;
    [QRUtil.eQRType.INVITATIONAL_SHARE] = 1;
}

QRUtil.Delegate = {
    onCreateQRCallBack = "onCreateQRCallBack";
    onScanQRCallBack = "onScanQRCallBack";
}

QRUtil.getInstance = function()
    if not QRUtil.s_instance then
        QRUtil.s_instance = new(QRUtil);
    end

    return QRUtil.s_instance;
end

QRUtil.ctor = function(self)
    self.m_qrType = nil;
    EventDispatcher.getInstance():register(Event.Call,self,self.onNativeEvent);
end

QRUtil.dtor = function(self)
    EventDispatcher.getInstance():unregister(Event.Call,self,self.onNativeEvent);
end

--@brief 创建二维码
--@param qrType 二维码类型 用于标识这个二维码是干啥的
--@param sideLength 二维码正方形边长
--@param extParams table或string, 带上二维码扫描参数
QRUtil.createQR = function(self, dfqp_qrType, sideLength, extParams)
    self.m_qrType = dfqp_qrType;
    if table.isTable(extParams) then
        extParams.dfqp_qrType = dfqp_qrType;
        extParams.dfqp_createQrVersion = QRUtil.CREATE_QR_VERSION[dfqp_qrType];
        extParams = json.encode(extParams);
    end

    local params = {
        extParams = extParams;
        sideLength = sideLength;
        imagePath = self:_getQRImagePath();
        needIcon = false;
    };

    NativeEvent.getInstance():createQR( json.encode(params) or "" );
end

--@brief 扫描二维码
QRUtil.scanQR = function(self)
    self:setScanning(true);
    NativeEvent.getInstance():scanQR();
end

--@brief 创建二维码回调
QRUtil.onCreateQRCallBack = function(self, flag, info)
    Log.v("QRUtil", "onCreateQRCallBack --> ", " flag = ", flag, " info = ", info);
    
    if flag and not table.isEmpty(info) then
        local isSuccess = GetNumFromJsonTable(info, "isSuccess") == 1;
        local isFileExist = self:isFileExist( self:_getQRImagePath() );
        isSuccess = isSuccess and isFileExist;
        local imageName = self:_getQRImageNameByType(self.m_qrType)
        self:notify(QRUtil.Delegate.onCreateQRCallBack, isSuccess, self.m_qrType, imageName);
    else
        self:notify(QRUtil.Delegate.onCreateQRCallBack, false, self.m_qrType);
    end
end

--@brief 扫描二维码回调
QRUtil.onScanQRCallBack = function(self, flag , info)
    Log.v("QRUtil", "onScanQRCallBack --> ", " flag = ", flag, " info = ", info);

    if flag and not table.isEmpty(info) then
        local isSuccess = GetNumFromJsonTable(info, "isSuccess") == 1;
        local strData = GetStrFromJsonTable(info, "data");
        if isSuccess then
            self:notify(QRUtil.Delegate.onScanQRCallBack, true, strData);
            return;
        end
    end
    self:notify(QRUtil.Delegate.onScanQRCallBack, false);
end

--@brief 获取二维码图片路径
QRUtil._getQRImagePath = function(self)
    local qrName = self:_getQRImageNameByType(self.m_qrType)
    TextureCache.instance():remove(qrName); --清除掉纹理缓存，防止相同类型的不同图片加载错乱
    return System.getStorageImagePath() .. qrName;
end

--@brief 根据类型获取二维码图片名称
QRUtil._getQRImageNameByType = function(self, typ)
    return string.format("QR_DFQP_QR%s.png", typ or "")
end

--@brief 判断文件是否存在
QRUtil.isFileExist = function(self, filePath)
    return os.isexist(filePath);
end

QRUtil.isScanning = function(self)
    return self.m_isSanning;
end

QRUtil.setScanning = function(self, isScanning)
    self.m_isSanning = isScanning;
end

QRUtil.onNativeEvent = function(self,param,...)
    if self.s_nativeEventFuncMap[param] then
        self.s_nativeEventFuncMap[param](self,...);
    end
end

QRUtil.s_nativeEventFuncMap = {
    ["onCreateQRCallBack"] = QRUtil.onCreateQRCallBack;
    ["onScanQRCallBack"] = QRUtil.onScanQRCallBack;
}