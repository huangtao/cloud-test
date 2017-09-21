require("gameData/dataInterfaceBase");
require("hall/onlineSocket/onlineSocketManager");
require("hall/userInfo/data/userInfoData");
require("hall/gameData/appData");
require("hall/password/data/passwordConstants");
require("hall/gameData/txtMgr");

-- 口令接口
PasswordDataInterface = class(DataInterfaceBase);

PasswordDataInterface.s_codeKey = "dfqpcode";

PasswordDataInterface.Delegate = {
    -- 获取口令回调
    onGetPasswordByInfoCallback = "onGetPasswordByInfoCallback";
};

PasswordDataInterface.getInstance = function()
    if not PasswordDataInterface.s_instance then
        PasswordDataInterface.s_instance = new(PasswordDataInterface);
    end

    return PasswordDataInterface.s_instance;
end

PasswordDataInterface.releaseInstance = function()
    delete(PasswordDataInterface.s_instance);
    PasswordDataInterface.s_instance = nil;
end

PasswordDataInterface.ctor = function(self)
    self:initSocketManager();

    EventDispatcher.getInstance():register(Event.Resume , self, self.onResume);

    self.m_passwordData = new(require("hall/password/data/passwordData"), self);
end 

PasswordDataInterface.dtor = function(self)
    EventDispatcher.getInstance():unregister(Event.Resume , self, self.onResume);

    delete(self.m_passwordData);
    self.m_passwordData = nil;
end

PasswordDataInterface.initSocketManager = function(self)
    self.m_socket = OnlineSocketManager.getInstance();
end 

-- 切前台检查口令
PasswordDataInterface.onResume = function(self)
    self:_log("onResume");
    self:_checkPasswordHtmlAndCipboard();
end

-- 登录检查口令
PasswordDataInterface.checkPasswordOnLogin = function(self)
    self:_checkPasswordHtmlAndCipboard();
end

-- 扫码检查口令
PasswordDataInterface.checkPasswordOnQr = function(self, password)
    self:_checkPasswordQR(password);
end

-- 检查H5和剪贴板口令
PasswordDataInterface._checkPasswordHtmlAndCipboard = function(self)
    -- 未登录不处理H5和剪贴板口令
    -- 扫码中不处理H5和剪贴板口令
    if not kLoginDataInterface:getIsLoginSuccess() then
        return;
    elseif QRUtil.getInstance():isScanning() then
        QRUtil.getInstance():setScanning(false)
        return;
    elseif self:_checkHtml() then
        return;
    elseif self:_checkClipboard() then
        return;
    end
end

-- 检查二维码口令
PasswordDataInterface._checkPasswordQR = function(self, password)
    -- 未登录不处理扫码口令
    if not kLoginDataInterface:getIsLoginSuccess() then
        return;
    elseif self:_checkQrCode(password) then
        return;
    end
end

-- 检查剪贴板口令
PasswordDataInterface._checkClipboard = function(self)
    local password = string.trim(self:getTextFromClipboard());
    self:_log("_checkClipboard", password);
    if not string.isEmpty(password) then
        -- 剪贴板口令过滤
        if not self:_isCachePassword(password) then
            return self:_analysePassword(password, PasswordConstants.TYPE_SOURCE_CLIPBOARD);
        end
    end
    return false;
end

-- 检查H5口令
PasswordDataInterface._checkHtml = function(self)
    local param = NativeEvent.getInstance():getCallAppParam();
    self:_log("_checkHtml", param);
    local data = table.verify(json.decode(param));
    local password = tostring(data.boyaadfqpcode or "") or "";

    if not string.isEmpty(password) then
        return self:_analysePassword(password, PasswordConstants.TYPE_SOURCE_HTML);
    end
    return false;
end

-- 检查二维码口令
PasswordDataInterface._checkQrCode = function(self, password)
    self:_log("_checkQrCode", password);
    if not string.isEmpty(password) then
        return self:_analysePassword(password, PasswordConstants.TYPE_SOURCE_QR);
    end
    return false;
end

----------------------------------口令数据逻辑-----------------------------------
-- 通过口令码获取口令
PasswordDataInterface.getPasswordByCode = function(self, type, code)
    local codeCommonData = self:_encodeCommonData(type, code);
    local codeEncode = self:_encodexor(codeCommonData, PasswordDataInterface.s_codeKey);
    self:_log("getPasswordByCode", "code", code, "codeCommonData", codeCommonData, "codeEncode", codeEncode);
    return self:_encode(codeEncode, type);
end

-- 请求口令
PasswordDataInterface.getPasswordByInfo = function(self, info, expired)
    info = self:_generateDataCommon(info);

    local param = {
        content = json.encode(info);
        expired = expired or 0;
        type = info.type;
    };
    self.m_socket:sendMsg(PHP_PASSWORD_PUSH_INFO, param);
end

-- 请求口令回调
PasswordDataInterface.onGetPasswordByInfoCallback = function(self, isSuccess, info, param)
    local password = "";
    if isSuccess and not table.isEmpty(param) then
        password = self:_encode(info.code, param.type);
    end

    self:notify(PasswordDataInterface.Delegate.onGetPasswordByInfoCallback, isSuccess, password);
end

-- 请求口令内容
PasswordDataInterface._analysePassword = function(self, password, sourceType)
    -- 解析口令内容
    local code, codeType = self:_decode(password);

    if string.isEmpty(code) then
        return false;
    elseif kGameManager:isInRoom() then -- 房间内不处理口令，提示用户
        Toast.getInstance():showText(kTextPasswordTipsUserInRoom,50,30,kAlginLeft,"",26,250,210,70);
        return false;
    end

    local analyseType = PasswordConstants.analyseConfig[codeType] or PasswordConstants.analyseConfig[PasswordConstants.TYPE_EMPTY];
    local analyseCodeFunc = PasswordDataInterface.s_analyseConfig[analyseType];
    if analyseCodeFunc then
        return analyseCodeFunc(self, sourceType, codeType, code);
    end
    return true;
end

-- php解析口令码
PasswordDataInterface._analyseCodeByPhp = function(self, sourceType, codeType, code)
    -- 口令处理中提示
    local tips = PasswordConstants.analyseTipsConfig[codeType] or PasswordConstants.analyseTipsConfig[PasswordConstants.TYPE_EMPTY];
    LoadingView.getInstance():showText(tips);

    local param = {
        code = tostring(code) or "";
        sourceType = sourceType;
    };
    self.m_socket:sendMsg(PHP_PASSWORD_POP_INFO, param);

    return true;
end

-- 自定义解析口令码
PasswordDataInterface._analyseCodeByCustom = function(self, sourceType, codeType, code)
    local codeDecode = self:_decodexor(code, PasswordDataInterface.s_codeKey);
    local data = self:_decodeCommonData(codeType, codeDecode);
    self:_log("_analyseCodeByCustom", "code", code, "codeDecode", codeDecode, "data", data);
    self:_checkShowPasswordView(sourceType, data);
    return true;
end

-- 请求口令内容回调,成功弹出口令弹框
PasswordDataInterface.onGetInfoByPasswordCallback = function(self, isSuccess, info, param)
    self:_log("onGetInfoByPasswordCallback");
    if isSuccess and not table.isEmpty(info) and not table.isEmpty(param) then
        local data = self:_analyseData(info);
        local sourceType = tonumber(param.sourceType) or 0;

        self:_checkShowPasswordView(sourceType, data);
    end

    LoadingView.getInstance():hidden();
end

PasswordDataInterface._checkShowPasswordView = function(self, sourceType, data)
    if self:_checkEnterEnable(data, sourceType) then
        self:_log("show PasswordView");
        local passwordView = require("hall/password/passwordView");
        UBReport.getInstance():report(UBConfig.kPsswordViewShow);
        passwordView.showDialog(data, sourceType);
    end
    
    self:_cleanup(sourceType);
end

-- 数据清理
PasswordDataInterface._cleanup = function(self, sourceType)
    -- 剪贴板口令处理后清空剪贴板内容
    if sourceType == PasswordConstants.TYPE_SOURCE_CLIPBOARD then
        self:_cleanClipboard();
    end    
end

-- 校验口令是否可用
PasswordDataInterface._checkEnterEnable = function(self, data, sourceType)
    if kGameManager:isInRoom() then
        return false;
    end

    if not table.isEmpty(data) then
        local filterConfig = PasswordConstants.filterConfig[sourceType];
        if not table.isEmpty(filterConfig) then
            local typeFilter = filterConfig[data.type] or 0;
            -- 过滤不同地区，判断过滤类型
            if data.region == kClientInfo:getRegionId() and 
                not (typeFilter == PasswordConstants.TYPE_FILTER_USER and data.mid == kUserInfoData:getUserId()) then
                return true;
            end
        end
    end
    return false;
end

-- 校验
PasswordDataInterface._analyseData = function(self, info)
    local data = table.verify(json.decode(info.content));
    if table.isEmpty(data) then
        return {};
    end

    local objType = number.valueOf(data.type);
    local obj, _ = self:getPasswordTypeObjectByType(objType);
    local dataCommon = self:_analyseDataCommon(data); -- 校验口令内容必要数据
    local dataType = obj:analyseData(dataCommon); -- 校验口令内容自定义数据
    return dataType;
end

-- 校验口令内容必要数据：口令版本，地区，口令类型，玩家mid
PasswordDataInterface._analyseDataCommon = function(self, data)
    data.version = tonumber(data.version) or 0;
    data.region = tonumber(data.region) or 0;
    data.type = tonumber(data.type) or 0;
    data.mid = tonumber(data.mid) or 0;
    return data;
end

------------------------------------剪贴板逻辑-----------------------------------
-- 复制到剪贴板
PasswordDataInterface.setTextToClipboard = function(self, text)
    self:_log("setTextToClipboard", text);
    self:_cachePassword(text);
    NativeEvent.getInstance():clipboardSetText(text);
end

-- 获取剪贴板文本
PasswordDataInterface.getTextFromClipboard = function(self)
    self:_log("getTextFromClipboard");
    return NativeEvent.getInstance():clipboardGetText();
end

-- 清空剪贴板文本
PasswordDataInterface._cleanClipboard = function(self)
    self:_log("_cleanClipboard");
    NativeEvent.getInstance():clipboardClean();
end

-- 是否为缓存口令，对自己发出的口令不作处理
PasswordDataInterface._isCachePassword = function(self, password)
    local savePassword = self.m_passwordData:getData();
    local isCache = savePassword == password;
    self:_log("_isCachePassword", "savePassword", savePassword, "password", password, isCache);
    return isCache;
end

-- 缓存自己发出的口令
PasswordDataInterface._cachePassword = function(self, text)
    self:_log("_cachePassword", text);
    if not string.isEmpty(text) then
        self.m_passwordData:setData(text);
    end
end

-------------------------------口令分享逻辑---------------------------------------
-- 分享微信
PasswordDataInterface.shareByWechat = function(self, type, ...)
    local objType = number.valueOf(type);
    local obj = self:getPasswordTypeObjectByType(objType);
    return obj:shareByWechat(...);
end

-- 分享QQ
PasswordDataInterface.shareByQQ = function(self, type, ...)
    local objType = number.valueOf(type);
    local obj = self:getPasswordTypeObjectByType(objType);
    return obj:shareByQQ(...);
end

-- 分享短信
PasswordDataInterface.shareByMessage = function(self, type, ...)
    local objType = number.valueOf(type);
    local obj = self:getPasswordTypeObjectByType(objType);
    return obj:shareByMessage(...);
end

-- 分享二维码
PasswordDataInterface.shareByQr = function(self, type, ...)
    local objType = number.valueOf(type);
    local obj = self:getPasswordTypeObjectByType(objType);
    return obj:shareByQr(...);
end

-- 打开短信编辑
PasswordDataInterface.openSms = function(self, text)
    NativeEvent.getInstance():openSms(text);
end

---------------------------------口令类型逻辑----------------------------------------
-- 生成口令数据
PasswordDataInterface.generateData = function(self, type)
    local obj, objType = self:getPasswordTypeObjectByType(type);
    local data = obj:generateData();
    data = self:_generateDataCommonByType(data, objType);
    return data;
end

-- 生成口令数据
PasswordDataInterface._generateDataCommonByType = function(self, data, type)
    data.type = type;
    return data;
end

-- 生成口令公共数据，region，version，mid
PasswordDataInterface._generateDataCommon = function(self, info)
    local type = tonumber(info.type) or 0;
    local region = kClientInfo:getRegionId();
    info.region = region;
    info.version = PasswordConstants.versionConfig[type] or 0;
    info.mid = info.mid or kUserInfoData:getUserId();
    return info;
end

-- 获取口令类型对象
PasswordDataInterface.getPasswordTypeObjectByType = function(self, objType)
    if objType then
        local config = PasswordConstants.typeConfig[objType];
        if config and config.path then
            local className = require(config.path);
            local obj = new(className);
            return obj, objType;
        end
    end
    return self:getPasswordTypeObjectByType(PasswordConstants.TYPE_EMPTY), PasswordConstants.TYPE_EMPTY;
end

-- 获取口令类型对象，初始化数据
PasswordDataInterface.getPasswordTypeObjectAndInitData = function(self, data)
    if not table.isEmpty(data) and data.type then
        local config = PasswordConstants.typeConfig[data.type];
        if config and config.path then
            local className = require(config.path);
            local obj = new(className);
            obj:init(data);
            return obj;
        end
    end
    return self:getPasswordTypeObjectByType(PasswordConstants.TYPE_EMPTY);
end

-------------------------------------------------------------------------------------
-- 生成H5调起链接，拼接regionId，appId，hallVersion，mid，口令
PasswordDataInterface.generateUrlWithPassword = function(self, url, password)
    local str = tostring(url or "") or "";
    local urlParam = {
        boyaadfqpcode = tostring(password or "") or "",
        regionId = kClientInfo:getRegionId(),
        appId = kClientInfo:getAppId(),
        hallVersion = kGameManager:getGameVersion(GameType.HALL),
        mid = kUserInfoData:getUserId(),
    }

    for k, v in pairs(urlParam) do
        if k and v then
            local strFormat = "%s&%s=%s";
            if string.endsWith(str, "?") then
                strFormat = "%s%s=%s"
            end
            str = string.format(strFormat, str, string.valueOf(k), string.valueOf(v));
        end
    end
    return str;
end

-- 生成微信扫码调起链接，拼接regionId，appId，hallVersion，mid，口令，扫码类型
PasswordDataInterface.generateUrlWithPasswordAndQrType = function(self, url, password, qrType)
    local str = tostring(url or "") or "";
    local urlParam = {
        boyaadfqpcode = tostring(password or "") or "",
        regionId = kClientInfo:getRegionId(),
        appId = kClientInfo:getAppId(),
        hallVersion = kGameManager:getGameVersion(GameType.HALL),
        mid = kUserInfoData:getUserId(),
        dfqp_qrType = qrType or 0,
    }

    for k, v in pairs(urlParam) do
        if k and v then
            local strFormat = "%s&%s=%s";
            if string.endsWith(str, "?") then
                strFormat = "%s%s=%s"
            end
            str = string.format(strFormat, str, string.valueOf(k), string.valueOf(v));
        end
    end
    return str;
end
-------------------------------------------------------------------------------------
PasswordDataInterface._log = function(self, ...)
    Log.d("PasswordDataInterface", ...);
end

-- 口令封装
PasswordDataInterface._encode = function(self, password, type)
    local content = table.verify(TxtMgr.getInstance():getDescByKey("token_content_format"));
    local token = content.token or "★"
    password = tostring(password or "") or ""
    type = tonumber(type) or 0;
    local str = string.format("%s%s%s%s%s", token, password, token, type, token);
    self:_log("_encode", str)
    return str;
end

-- 口令解封
PasswordDataInterface._decode = function(self, password)
    password = tostring(password or "") or ""
    local content = table.verify(TxtMgr.getInstance():getDescByKey("token_content_format"));
    local token = content.token or "★"
    local strTable = password:split(token);
    local code = strTable[2] or ""
    local codeType = tonumber(strTable[3]) or 0
    self:_log("_decode", code, codeType);
    return code, codeType;
end

-- 异或加密，输出16进制
PasswordDataInterface._encodexor = function(self, code, key)
    local str = "";
    for j = 1, string.len(code) do
        temp = bit.bxor(string.byte(code, j), string.byte(string.sub(key, 1, 1)))
        for i = 2, string.len(key) do
            temp = bit.bxor(temp, string.byte(string.sub(key, i, i)))
        end
        str = str..string.format("%.2x", temp)
    end
    return str;
end

-- 异或解密，转为字符
PasswordDataInterface._decodexor = function(self, code, key)
    key = string.reverse(key)
    local str = "";
    for j = 1, string.len(code), 2 do
        local strByte = tonumber(string.sub(code, j, j+1), 16) or 0
        temp = bit.bxor(strByte, string.byte(string.sub(key, 1, 1)))
        for i = 2, string.len(key) do
            temp = bit.bxor(temp, string.byte(string.sub(key, i, i)))
        end
        str = str..string.char(temp)
    end
    return str;
end

-- 口令码封装
PasswordDataInterface._encodeCommonData = function(self, type, code)
    code = tostring(code or "") or "";
    local region = kClientInfo:getRegionId();
    local version = PasswordConstants.versionConfig[type] or 0;
    return string.format("%s_%s_%s",region, version, code);
end

-- 口令码解封
PasswordDataInterface._decodeCommonData = function(self, type, code)
    code = tostring(code or "") or "";
    local tmp = string.split(code, "_");
    local data = {
        type = tonumber(type) or 0,
        region = tonumber(tmp[1]) or 0,
        version = tonumber(tmp[2]) or 0,
        mid = 0,
        code = tostring(tmp[3] or "") or "",
    }
    return data;
end

PasswordDataInterface.s_socketCmdFuncMap = {
    [PHP_PASSWORD_PUSH_INFO] = PasswordDataInterface.onGetPasswordByInfoCallback;
    [PHP_PASSWORD_POP_INFO] = PasswordDataInterface.onGetInfoByPasswordCallback;
};

PasswordDataInterface.s_analyseConfig = {
    [PasswordConstants.TYPE_ANALYSE_CODE_BY_PHP] = PasswordDataInterface._analyseCodeByPhp;
    [PasswordConstants.TYPE_ANALYSE_CODE_BY_CUSTOM] = PasswordDataInterface._analyseCodeByCustom;
}