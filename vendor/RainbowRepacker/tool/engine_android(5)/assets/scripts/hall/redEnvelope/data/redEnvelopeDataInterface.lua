require("gameData/dataInterfaceBase");
require("common/loadingView");

RedEnvelopDataInterface = class(DataInterfaceBase);

RedEnvelopDataInterface.Delegate = {
    onGetRedEnvelopConfig = "onGetRedEnvelopConfig",
    onGetRedEnvelopSendRecord  = "onGetRedEnvelopSendRecord" ,
    onSendRedEnvelop  = "onSendRedEnvelop" ,
    onGetRedEnvelop  = "onGetRedEnvelop" ,
    onGetRedEnvelopRecordDetail  = "onGetRedEnvelopRecordDetail" ,
    onRecieverGetRedEnvelope = "onRecieverGetRedEnvelope",
};

RedEnvelopDataInterface.getInstance = function()
    if not RedEnvelopDataInterface.s_instance then
        RedEnvelopDataInterface.s_instance = new(RedEnvelopDataInterface);
    end

    return RedEnvelopDataInterface.s_instance;
end

RedEnvelopDataInterface.releaseInstance = function()
    delete(RedEnvelopDataInterface.s_instance);
    RedEnvelopDataInterface.s_instance = nil;
end

RedEnvelopDataInterface.ctor = function(self)

    local __localDataClass = require("hall/redEnvelope/data/redEnvelopeLocalData");
    self.m_local_data = new(__localDataClass);                  --本地数据   
    
    local __configDataClass = require("hall/redEnvelope/data/redEnvelopConfigData");
    self.m_configData = new(__configDataClass,self);                 --配置对象

    local __recordDataClass = require("hall/redEnvelope/data/redEnvelopRecordData");
    self.m_server_dataRecord = new(__recordDataClass,self);                  --历史纪录    

    local __blessConfigClass = require("hall/redEnvelope/data/redEnvelopeBlessConfig");
    self.m_blessConfig = new(__blessConfigClass, self);

    self.m_isActivityShowing = false;

    CommunityDataInterface.getInstance():setObserver(self);
end 

RedEnvelopDataInterface.dtor = function(self)
    delete(self.m_configData);
    self.m_configData = nil;

    delete(self.m_server_dataRecord);
    self.m_server_dataRecord = nil;

    delete(self.m_local_data);
    self.m_local_data = nil;

    delete(self.m_blessAnim);
    self.m_blessAnim = nil;

    CommunityDataInterface.getInstance():clearObserver(self);
end

RedEnvelopDataInterface.isActivityShowing = function(self)
    return self.m_isActivityShowing;
end

RedEnvelopDataInterface.setActivityShowing = function(self,p_bool)
    self.m_isActivityShowing = p_bool;
end

RedEnvelopDataInterface.setRecieverPos = function(self,p_x,p_y)
    if type(p_x) == "number" and type(p_y) == "number" then
        self.m_local_data:setValue("pos_x",tostring(p_x));
        self.m_local_data:setValue("pos_y",tostring(p_y));
    end
end

RedEnvelopDataInterface.getRecieverPos = function(self)
    local x,y;
    x = self.m_local_data:getValue("pos_x");
    x = tonumber(x) or 1101;  --默认1101
    y = self.m_local_data:getValue("pos_y");
    y = tonumber(y) or 52;  --默认 52

    return x,y;
end

RedEnvelopDataInterface.setIsNeverGetRedEnvelop = function(self,p_isNeerGet)
    if p_isNeerGet then
        local serverTime = os.time();
        self.m_local_data:setValue("isNeverGet",tostring(serverTime));
    else
        self.m_local_data:setValue("isNeverGet",tostring(0));
    end
end

RedEnvelopDataInterface.getIsNeverGetRedEnvelop = function(self)
    local time  = self.m_local_data:getValue("isNeverGet");
    local time = tonumber(time) or 0;
    if time <= 0 then
        return false;
    else

        local serverTime = os.time();
        if serverTime - time > 24*3600 then
            self:setIsNeverGetRedEnvelop(false);
            return false;
        end       

        local  __today = os.date("%d",serverTime); 
        local __lastDay = os.date("%d",time); 

        if __today ~= __lastDay then
             self:setIsNeverGetRedEnvelop(false);
            return false;
        end
        return true;
    end
end

RedEnvelopDataInterface.setSelectedId = function(self,p_id)
    p_id = tonumber(p_id) or 0;
    self.m_local_data:setValue("lucky_id",tostring(p_id));
end

RedEnvelopDataInterface.getSelectedId = function(self)
    local id;
    id = self.m_local_data:getValue("lucky_id");
    id = tonumber(id) or 0;
    return id;
end


RedEnvelopDataInterface.getConfigById = function(self,p_id)

    local __stringId = tostring(p_id);
    local __config = self.m_configData:getConfig();
    for k,v in pairs(__config) do
        if v.id == p_id then
            return v;
        end
    end
    return {};
end

RedEnvelopDataInterface.cleanup = function()
    local lastObserverMap = RedEnvelopDataInterface.getInstance():getObserverMap();
    delete(RedEnvelopDataInterface.s_instance);
    RedEnvelopDataInterface.s_instance = nil;
    RedEnvelopDataInterface.getInstance():setObserverMap(lastObserverMap);
end

--请求配置
RedEnvelopDataInterface.requestConfig = function(self)
    self.m_configData:requestConfig();
end

RedEnvelopDataInterface.onGetRedEnvelopConfig = function(self, isSuccess, data, sendParam)
    self:notify(RedEnvelopDataInterface.Delegate.onGetRedEnvelopConfig, isSuccess, data);
end

RedEnvelopDataInterface.getConfigInfoById = function(self,p_id)
    p_id = tonumber(p_id) or 0;
   local __dataList = self.m_configData:getConfig();
   for kk,vv in pairs(__dataList) do
        if vv.id == p_id then
            return Copy(vv);
        end
   end
end

--请求红包记录
RedEnvelopDataInterface.requestRecord = function(self)
    self.m_server_dataRecord:requestData();
end

RedEnvelopDataInterface.onGetRedEnvelopSendRecord = function(self, isSuccess, data, sendParam)
    self:notify(RedEnvelopDataInterface.Delegate.onGetRedEnvelopSendRecord, isSuccess, data);
end

--请求发红包
RedEnvelopDataInterface.requestSendRedEnvelop = function(self, configId)
     local param = {
        ["id"] = configId;
    };
    OnlineSocketManager.getInstance():sendMsg(PHP_REDENVELOPE_SEND, param, 6000);
end

RedEnvelopDataInterface.onSendRedEnvelop = function(self, isSuccess, data, sendParam)
    --成功扣钱
    if isSuccess then
    if not table.isEmpty(data) then
        local __moneyId = tonumber(data.type) or 0; --币种类型
        local __moneyNum = tonumber(data.money) or 0;--红包金额

        local __lastMoneyNum = UserInfoData.getInstance():getMoneyById(__moneyId);
         UserInfoData.getInstance():setMoneyById(__moneyId,__lastMoneyNum - __moneyNum);
        local __call = function()
            LayerManagerIsolater.getInstance():show("redenvelope_record");
        end
        local __isExist = LayerManagerIsolater.getInstance():isExist("redenvelope_anim_send");
        if not __isExist then
                LayerManagerIsolater.getInstance():show("redenvelope_detail",{
                    id = tonumber(data.luckyId) or 0,--红包类型id
                    func_back = __call ,
                    isNeedShowAllTakeMoneyNum = true,
                    isJustSendRedEnvelop = true;
                    takenum = 0,
                    num = tonumber(data.num) or 0,--红包数量
                    takemoney = 0,
                    totalmoney = tonumber(data.money) or 0,
                    type = tonumber(data.type) or 0;----币种类型
                    });
        end
    end
    Toast.getInstance():showText("成功发出红包",50,30,kAlignLeft,"",24,200,175,110)
    end
    self:notify(RedEnvelopDataInterface.Delegate.onSendRedEnvelop, isSuccess, data);
end

--请求抢红包
RedEnvelopDataInterface.requestGetRedEnvelop = function(self,p_id)
    local param = {
        ["id"] = p_id;
        ["app"] = kClientInfo:getAppId();
        ["ssid"] = kUserInfoData:getSsid();
        ["hall_version"] = GameManager.getInstance():getGameVersion(GameType.HALL);
    };
    CommunityDataInterface.getInstance():requestSendProxyMessage({}, ImSdkConstants.eProxyMessageType.ROB_RED_ENVELOPE, param);
end

--im 消息透传 监听CommunityDataInterface回调
RedEnvelopDataInterface.onGetProxyMessage = function(self, isSuccess, mtype, data)
    Log.v("RedEnvelopDataInterface.onGetProxyMessage", "isSuccess = ", isSuccess, "mtype = ", mtype, "data = ", data);
    if isSuccess then
        if mtype == ImSdkConstants.eProxyMessageType.ROB_RED_ENVELOPE then
            --data 里面需要加个标识代表发送成功还是失败|以及失败原因
            self:__onGetRedEnvelop(data);
        elseif mtype == ImSdkConstants.eProxyMessageType.BROAD_NEW_RED_ENVELOPE then
            self:__onRecieverRedEnvelopeInfo(data);
        elseif mtype == ImSdkConstants.eProxyMessageType.NOTIFY_RED_ENVELOP_BLESS then
            self:__onRecieverGetRedEnvelope(data);
        end
    end
end

RedEnvelopDataInterface.__onGetRedEnvelop = function(self, data)
    Log.v("RedEnvelopDataInterface.onGetRedEnvelop",data, " time = ", os.time() );
    if table.isEmpty(data) then
        return;
    end

    if number.valueOf(data.code) == 200 and not table.isEmpty(data.result) then
        local t = {};
        t.id = number.valueOf(data.result.id);--红包id
        t.type = number.valueOf(data.result.type);--红包货币类型
        t.money = number.valueOf(data.result.money);---抢到金额
        t.nick = string.valueOf(data.result.nick);--红包发放玩家呢称
        t.mid = number.valueOf(data.result.mid);--红包发放玩家mid
        t.cid = number.valueOf(data.result.cid);--红包发放玩家cid
        t.sex = number.valueOf(data.result.sex, 1);--性别
        t.icon = string.valueOf(data.result.icon);--头像地址

        kUserInfoData:addSafeBoxMoneyById(t.type, t.money);

        local broadItem = {
                        type = 0,
                        send_time = os.time(),
                        nick = t.nick,
                        content = string.format("你抢到了【%s（ID：%d）】的红包，获得%d银币，已存入保险箱", t.nick, t.cid,t.money);
                    };
        BroadcastDataInterface.getInstance():addRadioMsg(broadItem);

        LayerManagerIsolater.getInstance():show("redenvelope_get",t);
    else
        Toast.getInstance():showText(string.valueOf(data.error), 50, 30, kAlignLeft, "", 24, 200, 175, 110);
    end
end

--请求红包详情
RedEnvelopDataInterface.requesRedEnvelopDetail = function(self,p_id)
    local param = {
        ["id"] = p_id;
    };
    OnlineSocketManager.getInstance():sendMsg(PHP_REDENVELOPE_DETAIL, param, 6000);

    local _tmpText = "正在加载...";
    LoadingView.getInstance():showText(_tmpText);

end

RedEnvelopDataInterface.onGetRedEnvelopRecordDetail = function(self, isSuccess, data, sendParam)

    if isSuccess then
        data = self:__formatDetailData(data);
    end

    self:notify(RedEnvelopDataInterface.Delegate.onGetRedEnvelopRecordDetail, isSuccess, data);
    
    LoadingView.getInstance():hidden();
end

--收到红包广播通知
RedEnvelopDataInterface.__onRecieverRedEnvelopeInfo = function(self, data)
    Log.v("__onRecieverRedEnvelopeInfo", data);
    if table.isEmpty(data) or not data.luckyId then
        return;
    end

    local __isNeedNotice = RedEnvelopDataInterface.getInstance():getIsNeverGetRedEnvelop();
    if __isNeedNotice then
        return;
    end

    local __isExist = LayerManagerIsolater.getInstance():isExist("redenvelope_reciever");
    if not __isExist then
        LayerManagerIsolater.getInstance():show("redenvelope_reciever",{id = data.luckyId});
    end
end

--领取红包的广播反馈
RedEnvelopDataInterface.__onRecieverGetRedEnvelope = function(self, data)
    Log.v("__onRecieverGetRedEnvelope", data);
    if table.isEmpty(data) then
        return;
    end

    local luckyId = number.valueOf(data.id); 
    local moneyType = number.valueOf(data.mtype);

    self.m_blessBroadList = table.verify(self.m_blessBroadList);
    for k, vJson in pairs( table.verify(data.data) ) do
        local v = json.decode(vJson);
        if not table.isEmpty(v) then
            local t = {};
            t.mid = number.valueOf(v[1]);
            t.nick = string.valueOf(v[2]);
            t.money = number.valueOf(v[3]);

            t.type = moneyType;
            t.luckyId = luckyId;
            t.time = os.time();
            t.bless = self.m_blessConfig:randomGetBlessMsg();

            table.insert(self.m_blessBroadList, t);
        end
    end

    if not self.m_blessAnim then
        local diff = 0;
        self.m_blessAnim = AnimFactory.createAnimInt(kAnimRepeat, 0, 1, 5, -1);
        self.m_blessAnim:setDebugName("RedEnvelopDataInterface|m_blessAnim");
        self.m_blessAnim:setEvent(nil, function()
            if table.isEmpty(self.m_blessBroadList) then
                delete(self.m_blessAnim);
                self.m_blessAnim = nil;
            else
                diff = diff + 5;
                local num = #self.m_blessBroadList;
                local duration = num < 15 and 40 or 15;--动态控制播放速度
                if diff >= duration then
                    diff = 0;
                    local item = table.remove(self.m_blessBroadList, 1);
                    self:notify(RedEnvelopDataInterface.Delegate.onRecieverGetRedEnvelope, item);

                    local broadItem = {
                        type = 0,
                        send_time = os.time(),
                        nick = item.nick,
                        content = string.format("%s%s领取了你的红包。", item.bless, item.nick);
                    };
                    BroadcastDataInterface.getInstance():addRadioMsg(broadItem);
                end
            end    
        end);
    end
end

---------------------------------private-------------------------------------
RedEnvelopDataInterface.__formatDetailData = function(self,data)
    local __formatData = {};
    __formatData.base = {};
    __formatData.data = {};

    __formatData.base.num = tonumber(data.base.num) or 0; 
    __formatData.base.type = tonumber(data.base.type) or 0; 
    __formatData.base.takenum = tonumber(data.base.takenum) or 0; 
    __formatData.base.takemoney = tonumber(data.base.takemoney) or 0; 
    __formatData.base.specialUser = tonumber(data.base.specialUser) or -1; 
    __formatData.base.totalmoney = tonumber(data.base.totalmoney) or 0; 

    for k,v in pairs(data.data) do
        local __unitData = {};
        __unitData.nick = tostring(v.nick) or "";
        __unitData.type = __formatData.base.type or 0;
        __unitData.money = tonumber(v.money) or 0;
        __unitData.mid = tonumber(v.mid) or 0;
        __unitData.time = tonumber(v.time) or 0;

        --运气最佳的排在第一个
        if __unitData.mid == __formatData.base.specialUser  then
            __unitData.isFirst = true;
            table.insert(__formatData.data,1,__unitData);
        else 
            __unitData.isFirst = false;
            table.insert(__formatData.data,__unitData); 
        end
    end


    return __formatData;
end


RedEnvelopDataInterface.s_socketCmdFuncMap = {
    [PHP_REDENVELOPE_SEND]                           = RedEnvelopDataInterface.onSendRedEnvelop;
    [PHP_REDENVELOPE_DETAIL]                           = RedEnvelopDataInterface.onGetRedEnvelopRecordDetail;
};