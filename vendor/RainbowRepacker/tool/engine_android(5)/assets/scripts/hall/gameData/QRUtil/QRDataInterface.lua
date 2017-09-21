QRDataInterface = class(DataInterfaceBase)

QRDataInterface.ErrorStr = {
    qrTypeError = "无法识别该类型二维码！",
    urlError = "无法识别该网址二维码！",
    angecyError = "无法识别该代理商二维码！",
    userInfoError = "无法识别该用户信息二维码！",
    rechargeError = "无法识别该充值卡二维码！",
    privateError = "无法识别该私人房",
    invitationalError = "无法识别该邀请赛二维码",
}

QRDataInterface.ctor = function(self)
    QRUtil.getInstance():setObserver(self)
    RechargeCardDataInterface.getInstance():setObserver(self)
    CommunityDataInterface.getInstance():setObserver(self)
    BackpackDataInterface.getInstance():setObserver(self)
end

QRDataInterface.dtor = function(self)
    QRUtil.getInstance():clearObserver(self)
    RechargeCardDataInterface.getInstance():clearObserver(self)
    CommunityDataInterface.getInstance():clearObserver(self)
    BackpackDataInterface.getInstance():clearObserver(self)
    self.m_requestFriendInfo = false
end

QRDataInterface.onCreateQRCallBack = function(self, isSuccess, dfqp_qrType, imageName)
    if dfqp_qrType and QRDataInterface.s_createCBConfig[dfqp_qrType] then
        QRDataInterface.s_createCBConfig[dfqp_qrType](self, isSuccess, dfqp_qrType, imageName)
    end
end

QRDataInterface.onScanQRCallBack = function(self, isSuccess, strData)
    if not strData then
        return
    end
    local tb = json.decode(strData)
    local dfqp_qrType, data = nil, nil
    if tb then
        dfqp_qrType = tonumber(tb.dfqp_qrType)
        data = tb
    elseif type(strData) == "string" then
        local url_tb = string.split(strData, "?")
        if #url_tb ~= 2 then
            Toast.getInstance():showText(QRDataInterface.ErrorStr.urlError, 50, 30, kAlignCenter,"",24,200, 175, 115)
            return
        end
        url_tb = url_tb[#url_tb]
        if type(url_tb) ~= "string" then
            Toast.getInstance():showText(QRDataInterface.ErrorStr.urlError, 50, 30, kAlignCenter,"",24,200, 175, 115)
            return
        end
        url_tb = string.split(url_tb, "&")
        local kv_tb, tmp_tb = {}, {}
        for k,v in pairs(url_tb) do
            tmp_tb = string.split(v, "=")
            if #tmp_tb == 2 then
                kv_tb[tmp_tb[1]] = tmp_tb[2]
            end
        end
        dfqp_qrType = tonumber(kv_tb.dfqp_qrType)
        data = kv_tb
    else
        Toast.getInstance():showText(QRDataInterface.ErrorStr.qrTypeError, 50, 30, kAlignCenter,"",24,200, 175, 115)
        return
    end
    if dfqp_qrType and QRDataInterface.s_scanCBConfig[dfqp_qrType] then
        QRDataInterface.s_scanCBConfig[dfqp_qrType](self, isSuccess, dfqp_qrType, data)
    else
        Toast.getInstance():showText(QRDataInterface.ErrorStr.qrTypeError, 50, 30, kAlignCenter,"",24,200, 175, 115)
    end
end

--创建私人房二维码回调
QRDataInterface.privateRoomQRCreateCB = function(self, isSuccess, dfqp_qrType, imageName)
    
end

--创建个人信息二维码回调
QRDataInterface.bindAngecyUserinfoQRCreateCB = function(self, isSuccess, dfqp_qrType, imageName)
    if isSuccess then
        kUserInfoData:setQRImageName(imageName)
    end
end

--扫描私人房二维码回调
QRDataInterface.privateRoomQRScanCB = function(self, isSuccess, dfqp_qrType, data)
    if isSuccess and data then
        if not string.isEmpty(data.boyaadfqpcode) then
            PasswordDataInterface.getInstance():checkPasswordOnQr(data.boyaadfqpcode);
        else
            JumpInterfacePrivateRoom.getInstance():enterPrivateRoom(data, nil, nil, PrivateRoomConstant.ENTER_TYPE_QR_CODE)
        end
    else
        Toast.getInstance():showText(QRDataInterface.ErrorStr.privateError, 50, 30, kAlignCenter,"",24,200, 175, 115)
    end
end

--扫描代理商二维码回调
QRDataInterface.bindAngecyUrlQRScanCB = function(self, isSuccess, dfqp_qrType, data)
    if isSuccess and data and data.mid then
        local param = {
            ssid = kUserInfoData:getSsid(),
            aid = data.mid,
        }
        OnlineSocketManager.getInstance():sendMsg(PHP_BINDATOM, param)
    else
        Toast.getInstance():showText(QRDataInterface.ErrorStr.angecyError, 50, 30, kAlignCenter,"",24,200, 175, 115)
    end
end

--扫描用户信息二维码回调
QRDataInterface.bindAngecyUserinfoQRScanCB = function(self, isSuccess, dfqp_qrType, data)
    if isSuccess and data.cid then
        if tonumber(data.dfqp_createQrVersion) ~= QRUtil.CREATE_QR_VERSION[dfqp_qrType] then
            Toast.getInstance():showText("版本不兼容，请升级版本后再试", 50, 30, kAlignCenter,"",24,200, 175, 115)
            return
        end
        if not CommunityDataInterface.getInstance():isImLoginSuccess() then
            Toast.getInstance():showText("社交模块正在加载中，请稍候再试", 50, 30, kAlignCenter,"",24,200, 175, 115)
            return
        end
        if data.cid ~= kUserInfoData:getUserCid() then
            self.m_requestFriendInfo = true
            CommunityDataInterface.getInstance():requestFriendInfo(data.cid)
            LoadingView.getInstance():showText("正在读取玩家信息")
            LoadingView.getInstance():setTimerFinishFunc(self, self.onRequestFriendInfoTimeout)
        else
            Toast.getInstance():showText("不能添加自已为好友哦", 50, 30, kAlignCenter,"",24,200, 175, 115)
        end
    else
        Toast.getInstance():showText(QRDataInterface.ErrorStr.userInfoError, 50, 30, kAlignCenter,"",24,200, 175, 115)
    end
end

QRDataInterface.onRequestFriendInfoTimeout = function(self)
    self.m_requestFriendInfo = false
    MessageBox.show("提示",  "获取玩家信息失败，请重试。", "确定", nil, true)
end

--查找用户信息回调
QRDataInterface.onGetUserDetailInfoCallBack = function(self, isSuccess, friendData)
    if self.m_requestFriendInfo then
        self.m_requestFriendInfo = false
        LoadingView.getInstance():hidden()
        local QRTipsDialog = require("hall/gameData/QRUtil/widget/QRTipsDialog")
        local dialog = QRTipsDialog.show()
        local function onBtnClick(dialog, friendData)
            if not dialog then
                return
            end
            if isSuccess and friendData and friendData.cid then
                if friendData.is_friend == 1 then
                    dialog:onCloseClick()
                else
                    CommunityDataInterface.getInstance():requestAddFriend(friendData.cid, "")
                    dialog:setBtnText("已申请")
                    dialog:setBtnEnable(false)
                end
            else
                dialog:onCloseClick()
            end
        end
        local function onUserInfoUpdateHead(dialog, url, imagePath)
            if dialog and url and imagePath then
                dialog:setUserInfoHeadImage(imagePath)
            end
        end
        dialog:initUserInfo(isSuccess, friendData, onBtnClick, onUserInfoUpdateHead)
    end
end

--扫描充值卡二维码回调
QRDataInterface.rechargeableCardQRScanCB = function(self, isSuccess, dfqp_qrType, data)
    if isSuccess and data and data.pw and data.card and data.cardtype and data.rmb and data.gold then
        local function confirmRecharge()
            RechargeCardDataInterface.getInstance():requestUseRechargeCard(data.card, data.pw, data.cardtype)
        end
        local str = string.format("#c8F5C1F充值卡号：%s#l#l#cF9600D充值卡金额为%s元，成功充值后可获得%s", data.card, data.rmb, data.gold)
        local richTextTable = new(RichText, str, 400, 40, kAlignCenter, nil, 30)
        MessageBox.showView("立即充值", "立即充值", nil, richTextTable, true, nil, confirmRecharge)
    else
        Toast.getInstance():showText(QRDataInterface.ErrorStr.rechargeError, 50, 30, kAlignCenter,"",24,200, 175, 115)
    end
end

--充值卡使用结果
QRDataInterface.onUseRechargeCardCallBack = function(self, isSuccess, msg, rmb, gold)
    if isSuccess then
        local data = {};
        data.title = "充值成功";
        data.rightTitle = "内容说明";
        data.topTips = string.format("充值卡金额为%s元，成功获得%s", rmb, gold); 
        data.rightContent = "充值卡使用成功";
        data.adUrl = ""; 
        data.jumpcode = ""; 
        RechargeSucPop.show(data);
    else
        msg = string.isEmpty(msg) and "充值失败" or msg;
        Toast.getInstance():showText(msg, 50, 30, kAlignCenter,"",24,200, 175, 115)
    end
end

--绑定代理商结果
QRDataInterface.onBindaToM = function(self, isSuccess, info)
    if isSuccess then
        Toast.getInstance():showText(info and info.errorTips or "已经成功绑定代理商", 50, 30, kAlignCenter,"",24,200, 175, 115)
    else
        if not info then
            Toast.getInstance():showText("绑定失败，请重试", 50, 30, kAlignCenter,"",24,200, 175, 115)
        else
            if tonumber(info.errorType) == 1054 then
                Toast.getInstance():showText("该账号已经绑定代理商！", 50, 30, kAlignCenter,"",24,200, 175, 115)
            else
                Toast.getInstance():showText(info.errorTips or "绑定失败", 50, 30, kAlignCenter,"",24,200, 175, 115)
            end
        end
    end
end

--扫描商家二维码回调
QRDataInterface.exchangeAwardQRScanCB = function(self, isSuccess, dfqp_qrType, data)
    if isSuccess and data and data.uid then
        local param = {
            ssid = kUserInfoData:getSsid(),
            uid = data.uid,
        }
        OnlineSocketManager.getInstance():sendMsg(PHP_SCAN_SHANGJIA, param)
        LoadingView.getInstance():showText("正在获取商家兑换券信息")
        LoadingView.getInstance():setTimerFinishFunc(self, self.onRequestExchangeAwardTimeout)
    end
end

QRDataInterface.onRequestExchangeAwardTimeout = function(self)
    MessageBox.show("提示",  "获取商家兑换券信息失败，请重试。", "确定", nil, true)
end

--获取线下商家商品列表
QRDataInterface.onScanShangjia = function(self, isSuccess, info)
    LoadingView.getInstance():hidden()
    if not self.m_scanShangjiaDialog then
        local QRTipsDialog = require("hall/gameData/QRUtil/widget/QRTipsDialog")
        self.m_scanShangjiaDialog = QRTipsDialog.show()
        self.m_scanShangjiaDialog:setOnCloseCallBack(self, self.onScanShangjiaDialogClose)
        self.m_scanShangjiaDialog:initExchange(isSuccess, info)
    end
end

--关闭商家商品列表弹窗回调
QRDataInterface.onScanShangjiaDialogClose = function(self)
    self.m_scanShangjiaDialog = nil
end

--商家物品兑换申请审核通知
QRDataInterface.onExchangeApplyExamine = function(self, isSuccess, data)
    if data.gcode and data.type then
        if self.m_scanShangjiaDialog then
            self.m_scanShangjiaDialog:updateExchangeItem(data.gcode, data.type, data.msg)
        end
    else
        Toast.getInstance():showText("商家物品审核结果异常", 50, 30, kAlignCenter,"",24,200, 175, 115)
    end
end

--申请兑换商家物品结果
QRDataInterface.onExchangeApply = function(self, isSuccess, info)
    if isSuccess then
        if info and info.gcode and self.m_scanShangjiaDialog then
            self.m_scanShangjiaDialog:onExchangeApply(info.gcode)
        end
    else
        Toast.getInstance():showText("申请兑换失败，请稍候重试", 50, 30, kAlignCenter,"",24,200, 175, 115)
    end
end

--线下兑换成功
QRDataInterface.onUseCallBack = function(self, isSuccess, data, sendParam)
    if isSuccess and sendParam and sendParam.clientType == BagTypeAdapter.s_offline and data then
        require("isolater/widget/layerManagerIsolater")
        LayerManagerIsolater.getInstance():show("case_Share_Notice", data)
    end
end

--扫描邀请赛分享二维码回调
QRDataInterface.invitationalShareQRScanCB = function(self, isSuccess, dfqp_qrType, data)
    if isSuccess and data and data.matchid then
        StateMachine.getInstance():pushState(States.Invitational)
        InvitationalDataInterface.getInstance():enterMatch({code = data.matchid})
    else
        Toast.getInstance():showText(QRDataInterface.ErrorStr.invitationalError, 50, 30, kAlignCenter,"",24,200, 175, 115)
    end
end

QRDataInterface.s_createCBConfig = {
    [QRUtil.eQRType.PRIVATE_ROOM] = QRDataInterface.privateRoomQRCreateCB,
    [QRUtil.eQRType.BIND_ANGECY_USERINFO] = QRDataInterface.bindAngecyUserinfoQRCreateCB,
}

QRDataInterface.s_scanCBConfig = {
    [QRUtil.eQRType.PRIVATE_ROOM] = QRDataInterface.privateRoomQRScanCB,
    [QRUtil.eQRType.BIND_ANGECY_URL] = QRDataInterface.bindAngecyUrlQRScanCB,
    [QRUtil.eQRType.BIND_ANGECY_USERINFO] = QRDataInterface.bindAngecyUserinfoQRScanCB,
    [QRUtil.eQRType.RECHARGEABLE_CARD] = QRDataInterface.rechargeableCardQRScanCB,
    [QRUtil.eQRType.EXCHANGE_AWARD] = QRDataInterface.exchangeAwardQRScanCB,
    [QRUtil.eQRType.INVITATIONAL_SHARE] = QRDataInterface.invitationalShareQRScanCB,
}

QRDataInterface.s_socketCmdFuncMap = {
    [PHP_BINDATOM]              = QRDataInterface.onBindaToM;
    [PHP_SCAN_SHANGJIA]         = QRDataInterface.onScanShangjia;
    [PHP_EXCHANGE_APPLY]        = QRDataInterface.onExchangeApply;
}