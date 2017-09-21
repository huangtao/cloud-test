--二维码工具类接口

require("hall/gameData/QRUtil/QRUtil");

QRUtilIsolater = class(DataInterfaceBase);

--二维码类型
QRUtilIsolater.eQRType = {
    PRIVATE_ROOM = QRUtil.eQRType.PRIVATE_ROOM;  
    AGENT_LUA = QRUtil.eQRType.AGENT_LUA;  
}

QRUtilIsolater.Delegate = {
    onCreateQRCallBack = "onCreateQRCallBack";
}

--获取实例
QRUtilIsolater.getInstance = function()
    if not QRUtilIsolater.s_instance then
        QRUtilIsolater.s_instance = new(QRUtilIsolater);
    end

    return QRUtilIsolater.s_instance;
end

QRUtilIsolater.ctor = function(self)
    QRUtil.getInstance():setObserver(self);
end

QRUtilIsolater.dtor = function(self)
    QRUtil.getInstance():clearObserver(self);
end

--创建二维码
--dfqp_qrType 类型
--sideLength 边长
--extParams 二维码信息，可以为table，如：{key1=val1,key2=val2,...}
--或string(如果此二维码需要大厅扫描，则string必须为url，包不包含主机名均可，大厅会去解析后面的参数，dfqp_qrType为必传字段，如："?dfqp_qrType=xx&key1=val1&key2")
QRUtilIsolater.createQR = function(self, dfqp_qrType, sideLength, extParams)
    QRUtil.getInstance():createQR(dfqp_qrType, sideLength, extParams);
end

--创建二维码回调
--isSuccess 创建结果
--dfqp_qrType 类型
--qrImageName 二维码图片名字，创建失败时为空
QRUtilIsolater.onCreateQRCallBack = function(self, isSuccess, dfqp_qrType, qrImageName)
    self:notify(QRUtilIsolater.Delegate.onCreateQRCallBack, isSuccess, dfqp_qrType, qrImageName);
end