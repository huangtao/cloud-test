require("gameData/dataInterfaceBase");
require("hall/login/data/loginDataInterface");

local userInfo_pin_map = require("qnFiles/qnPlist/hall/userInfo_pin")

--用户数据：用户登录成功后获取到的信息，不要添加任务临时数据到这里面！！！
UserInfoData = class(DataInterfaceBase);

--用户身份
UserInfoData.eIdentity = {
    Normal = 0;     --普通用户
    Rmb = 1;        --付费用户
    Vip = 2;        --vip用户
    RmbAndVip = 3;  --既是付费用户又是vip用户
};

--0 - 保密，1 - 男 ,2 - 女
UserInfoData.eSex = {
    Secret = 0,
    Male = 1,
    Female = 2,
}

UserInfoData.Delegate = {
    refreshUserInfoData = "onRefreshUserInfoData";--用户信息更新
    refreshUserProperty = "refreshUserProperty";--用户资产更新
    refreshUserIdentity = "refreshUserIdentity";--用户身份更新
    refreshUserPayPrivilege = "refreshUserPayPrivilege";--用户充值特权更新
    onGetGamePlayInfoCallBack = "onGetGamePlayInfoCallBack";  --获取用户游戏记录回调
};

UserInfoData.getInstance = function()
    if not UserInfoData.s_instance then
        UserInfoData.s_instance = new(UserInfoData);
    end

    return UserInfoData.s_instance;
end

--------------------------------------------------------
UserInfoData.ctor = function(self)
	self.m_info = {};
    self.m_isNotify = true;
    self.m_cacheInfo = new(require("hall/userInfo/data/userCacheInfo"));
    self.m_userGameRecordData = new(require("hall/userInfo/data/userGameRecordData"), self);
    self.m_cityData = new(require("hall/userInfo/data/cityData"));
end

UserInfoData.dtor = function(self)
    delete(self.m_cacheInfo);
    self.m_cacheInfo = nil;

    delete(self.m_userGameRecordData);
    self.m_userGameRecordData = nil;

    delete(self.m_cityData);
    self.m_cityData = nil;

    self.m_info = {};
    self.m_isNotify = nil;
end

UserInfoData.setNotifyStatus = function(self,isNotify)
    self.m_isNotify = isNotify;
end

UserInfoData.getUserInfo = function(self)
    return self.m_info;
end

UserInfoData.cleanup = function(self)
    self.m_info = {};

    self.m_userGameRecordData:cleanup();
    self.m_cacheInfo:cleanup();
end

UserInfoData.setInfoByType = function(self,key,value)
    self:_set(key,value);
end
UserInfoData.getInfoByType = function(self,key,defaultValue)
    return self:_get(key,defaultValue);
end

UserInfoData.setUserInfo = function(self,infoMap)
    if type(infoMap) == "table" then 
        for k,v in pairs(infoMap) do 
            self:_set(k,v);
        end 
    end 
end

-- 城市数据
UserInfoData.getCityData = function(self)
    return self.m_cityData:getCityData();
end

--客服SDK
UserInfoData.setkefuGid = function(self, kefuGid)
    self.m_kefuGid = kefuGid;
end
UserInfoData.getkefuGid = function(self)
    return self.m_kefuGid;
end
UserInfoData.setkefuSid = function(self, kefuSid)
    self.m_kefuSid = kefuSid;
end
UserInfoData.getkefuSid = function(self)
    return self.m_kefuSid;
end

---------------------------------------------------------------
--代理商id
UserInfoData.setAgentCode = function(self, agentCode)
    self.m_agentCode = number.valueOf(agentCode);
end
UserInfoData.getAgentCode = function(self)
    return number.valueOf(self.m_agentCode);
end

--代理商电话号码
UserInfoData.setAgentPhone = function(self, phone)
    self:_set("m_agentPhone",tostring(phone))

end
UserInfoData.getAgentPhone = function(self)
    return self:_get("m_agentPhone","")
end

--int 用户ID(地区id 用于区分不同地区，一般逻辑参数之类的都使用这个id)
UserInfoData.setUserId = function(self,id)
   self:_set("userId",id);
end
UserInfoData.getUserId = function(self)
    return self:_get("userId",kLoginDataInterface:getLastMid() or 0);
end

--用户公共id(2.0.1添加的)，此id只是用于显示给用户看
UserInfoData.setUserCid = function(self, cid)
    self:_set("userCid", cid);
end
UserInfoData.getUserCid = function(self)
    return self:_get("userCid", self:getUserId() );
end

-- 昵称
UserInfoData.setNickname = function(self,mnick)
	if mnick == "" then
		return;
	end
    self:_set("nick",mnick);
end
UserInfoData.getNickname = function(self)
    return self.m_cacheInfo:getName() or self:_get("nick","");
end

--应用ID, !!!! --> 登录成功后php会刷新这个appid，如果代码需要用appid进行区分的话，需斟酌使用kAppId还是getAppId <-!!!
UserInfoData.setAppId  = function(self,appid)
    self:_set("appid",appid);
end
UserInfoData.getAppId  = function(self)
    return self:_get("appid", kClientInfo:getAppId());
end

--int 性别：0 - 保密，1 - 男 ,2 - 女（默认显示男头像）
UserInfoData.setSex = function(self,sex)
    sex = number.valueOf(sex); 
    self:_set("sex",sex);
end
UserInfoData.getSex = function(self)
    return self.m_cacheInfo:getSex() or self:_get("sex",0);
end

--默认为男
UserInfoData.getHeadBySex = function(self, sex, isBigHead)
    if isBigHead then
        return tonumber(sex) == UserInfoData.eSex.Female and "isolater/big_female_head.png" or "isolater/big_male_head.png";        
    else
        return tonumber(sex) == UserInfoData.eSex.Female and "isolater/female_head.png" or "isolater/male_head.png";
    end
end

UserInfoData.getHallHeadBySex = function(self, sex)
   return tonumber(sex) == UserInfoData.eSex.Female and "isolater/big_female_head.png" or "isolater/big_male_head.png";
end

--默认为男
UserInfoData.getSexIconBySex = function(self, sex)
    return tonumber(sex) == UserInfoData.eSex.Female and "hall/common/sex_girl.png" or "hall/common/sex_boy.png";
end

--int 银币
UserInfoData.setMoney = function(self,money)
    local lastMoney = self:getMoney();
    money = number.valueOf(money);
    local id = RechargeDataInterface.getInstance():getPropertySilverCoinID();
    self:_set("money",money);
    self:_notifyRefreshProperty(id, money, lastMoney);
end

UserInfoData.getMoney = function(self)
    return self:_get("money",0);
end

--0:银币，1：水晶或者银元 2：钻石
UserInfoData.setMoneyById = function(self,moneyId,money)
    moneyId = tonumber(moneyId);
    if moneyId == RechargeDataInterface.getInstance():getPropertySilverCoinID() then
        self:setMoney(money);
    elseif  moneyId == RechargeDataInterface.getInstance():getPropertyGoldBarID() then
        self:setCrystal(money);
    elseif  moneyId == RechargeDataInterface.getInstance():getPropertyDiamondID() then
        self:setDiamond(money);
    end
end

--0:银币，1：水晶或者银元 2：钻石
UserInfoData.getMoneyById = function(self,moneyId,isAllGold)
    moneyId = tonumber(moneyId);
    if moneyId == RechargeDataInterface.getInstance():getPropertySilverCoinID() then
        if isAllGold then
            return self:getTotalMoney();
        else
            return self:getMoney();
        end      
    elseif  moneyId == RechargeDataInterface.getInstance():getPropertyGoldBarID() then
        if isAllGold then
            return self:getTotalCrystal()
        else
            return self:getCrystal();
        end
    elseif  moneyId == RechargeDataInterface.getInstance():getPropertyDiamondID() then
        return self:getDiamond();
    end

    return 0;
end

UserInfoData.addSafeBoxMoneyById = function(self,moneyId,num)
    moneyId = tonumber(moneyId) or 0;
    num = tonumber(num) or 0;
    local __lastNum = self:getSafeBoxCurMoneyById(moneyId);
    self:setSafeBoxCurMoneyById(moneyId,__lastNum + num);
end

UserInfoData.setSafeBoxCurMoneyById = function(self,moneyId,num)
    moneyId = tonumber(moneyId) or 0;
    num = tonumber(num) or 0;
    if moneyId == RechargeDataInterface.getInstance():getPropertySilverCoinID() then
        self:setSafeBoxCurMoney(num);
    elseif  moneyId == RechargeDataInterface.getInstance():getPropertyGoldBarID() then
        self:setSafeBoxCurCrystal(num);
    end
end

UserInfoData.getSafeBoxCurMoneyById = function(self,moneyId)
    moneyId = tonumber(moneyId) or 0;
    if moneyId == RechargeDataInterface.getInstance():getPropertySilverCoinID() then
        return self:getSafeBoxCurMoney();
    elseif  moneyId == RechargeDataInterface.getInstance():getPropertyGoldBarID() then
        return self:getSafeBoxCurCrystal();
    end
    return 0;
end

--保险箱中的银币
UserInfoData.setSafeBoxCurMoney = function(self,money)
    money = number.valueOf(money);
    self:_set("safeBoxCurMoney",money);
end 
UserInfoData.getSafeBoxCurMoney = function(self)
    return self:_get("safeBoxCurMoney",0);
end

--用户总银币
UserInfoData.getTotalMoney = function(self)  
    return (self:getMoney() + self:getSafeBoxCurMoney());
end

--用户的钻石
UserInfoData.setDiamond = function(self,diamond)
    local lastNum = self:getDiamond();
    diamond = number.valueOf(diamond);
    local id = RechargeDataInterface.getInstance():getPropertyDiamondID()
    self:_set("diamond",diamond);  
    self:_notifyRefreshProperty(id, diamond, lastNum);  
end
UserInfoData.getDiamond = function(self)
    return self:_get("diamond",0);
end

--用户的金条
UserInfoData.setCrystal = function(self, crystal)
    local lastNum = self:getCrystal();
    crystal = number.valueOf(crystal);
    local id = RechargeDataInterface.getInstance():getPropertyGoldBarID();
    self:_set("crystal", crystal);
    self:_notifyRefreshProperty(id, crystal, lastNum);  
end
UserInfoData.getCrystal = function(self)
   return self:_get("crystal",0); 
end

UserInfoData.setSafeBoxCurCrystal = function(self,crystal)
    crystal = number.valueOf(crystal);
    self:_set("safeBoxCurCrystal",crystal);
end 
UserInfoData.getSafeBoxCurCrystal = function(self)
    return self:_get("safeBoxCurCrystal",0);
end

UserInfoData.getTotalCrystal = function(self)  
    return (self:getCrystal() + self:getSafeBoxCurCrystal());
end

--级别
--useless method only for compatible
UserInfoData.setLevel = function(self,level)
    --do nothing
end
UserInfoData.getLevel = function(self)
   local level ,levelName = kUserLevelConfigInterface:countLevelByExp( self:getExp() );
   return tonumber(level) or 0;
end

--经验
UserInfoData.setExp = function(self,exp)
    self:_set("exp",exp);
end
UserInfoData.getExp = function(self)
    return self:_get("exp",0);
end

------小头像------------
UserInfoData.setAvatar_s = function(self,avatar_s)
    self:_set("avatar_s",avatar_s);
end
UserInfoData.getAvatar_s = function(self)
    return self:_get("avatar_s","");
end

------中头像--------------
UserInfoData.setAvatar_m = function(self,avatar_m)
    self:_set("avatar_m",avatar_m);
end
UserInfoData.getAvatar_m = function(self)
    return self:_get("avatar_m","");
end

--------大头像-------------------
UserInfoData.setAvatar_b = function(self,avatar_b)
    self:_set("avatar_b",avatar_b);
end
UserInfoData.getAvatar_b = function(self)
    return self:_get("avatar_b","");
end

----用户类型--------
UserInfoData.setUType = function(self,utype)
    self:_set("utype",utype);
end
UserInfoData.getUType = function(self)
	local utype = self:_get("utype");
    if not utype then 
		utype = kLoginDataInterface:getLastUType();
	end
    if utype ~= 0 then
        return LoginConstants.uType.BoyaaPassport;
    end
    return utype;
end

--用户状态 0:正常 1:被禁用
UserInfoData.setStatus = function(self,status)
    self:_set("status",status);
end
UserInfoData.getStatus = function(self)
    return self:_get("status",0);
end

--上次登录时间
UserInfoData.setLastLoginTime = function(self,lastLoginTime)
    self:_set("lastLoginTime",lastLoginTime);
end
UserInfoData.getLastLoginTime = function(self)
    return self:_get("lastLoginTime",0);
end

--注册时间
UserInfoData.setRegisterTime = function(self,registerTime)
    self:_set("registerTime",registerTime);
end
UserInfoData.getRegisterTime = function(self)
    return self:_get("registerTime",0);
end

--头像二维码名字
UserInfoData.setQRImageName = function(self, qRImageName)
    self:_set("qRImageName",qRImageName)
end

UserInfoData.getQRImageName = function(self)
    return self:_get("qRImageName")
end

--资料完善情况
-------0:资料未完善 1: 资料完善可以领取奖励 2:已经领取完奖励
UserInfoData.setIsPerfect = function(self,isperfect)
    self:_set("isperfect",isperfect);
end
UserInfoData.getIsPerfect = function(self)
    return self:_get("isperfect",0);
end

--用户身份标识 
--0标识普通用户，1标识付费用户，2标识vip用户, 3标识即是付费用户又vip用户
UserInfoData.setIdentity = function(self,identity)
    local lastIdentity = self:getIdentity();
    identity = number.valueOf(identity);
    self:_set("identity",identity);
    self:_notifyRefreshIdentity(identity,lastIdentity);
end
UserInfoData.getIdentity = function(self)
    return self:_get("identity",UserInfoData.eIdentity.Normal);
end
--是否是vip用户
UserInfoData.getIsVip = function(self)
    local identity = self:getIdentity();
    return identity == UserInfoData.eIdentity.Vip or identity == UserInfoData.eIdentity.RmbAndVip;
end

--是否付费用户
UserInfoData.getIsRmb = function(self)
    local identity = self:getIdentity();
    return identity == UserInfoData.eIdentity.Rmb or identity == UserInfoData.eIdentity.RmbAndVip;
end


UserInfoData.setVipInfo = function(self, vipInfo)
    if table.isEmpty(vipInfo) then
        self:setIdentity(UserInfoData.eIdentity.Normal);
    elseif vipInfo.type == PropManager.propTypeMap.TYPE_VIP then
        local isPayUser = self:getIsPayUser();
        self:setVipTime(vipInfo.expires);
        if isPayUser then 
            self:setIdentity(UserInfoData.eIdentity.RmbAndVip);
        else 
            self:setIdentity(UserInfoData.eIdentity.Vip);
        end 
    end
end 
--viptime vip到期时间 -1表示无限制， 0表示过期  
UserInfoData.setVipTime = function(self, vipTime)
    local leftTime = number.valueOf(vipTime); --单位为秒
    self:_set("vipTime",leftTime);
end
UserInfoData.getVipTime = function(self)
    return self:_get("vipTime",0);
end
UserInfoData.getVipTimeDesc = function(self)
    local leftTime = self:getVipTime();
    if leftTime ==-1 then
       return "无限制";
    elseif leftTime == 0 then
       return "0";
    else 
        local leftHour = leftTime/3600   --获取剩余小时
        if leftHour > 23 then
            return string.concat(math.ceil(leftHour/24),"天");     --获取剩余天数
        else
            return string.concat(math.ceil(leftHour),"小时");
        end
    end 
end

--是否是付费用户
UserInfoData.getIsPayUser = function(self)
    local identity = self:getIdentity();
    return identity == UserInfoData.eIdentity.Rmb or identity == UserInfoData.eIdentity.RmbAndVip;
end
---- 0未充值,1普通充值,2二次特权充值
UserInfoData.setPayStatus = function(self,payStatus)
    local lastStatus = self:getPayStatus();
    payStatus = number.valueOf(payStatus, lastStatus);
    if payStatus > 0 then
        local isVip = self:getIsVip();
        if isVip then 
            self:setIdentity(UserInfoData.eIdentity.RmbAndVip);
        else
            self:setIdentity(UserInfoData.eIdentity.Rmb);
        end 
    end 
    self:_set("payStatus",payStatus);

    self:_notifyRefreshPayPrivilege(payStatus,lastStatus);
end
UserInfoData.getPayStatus = function(self)
    return self:_get("payStatus");
end
--是否有首充特权
UserInfoData.getIsFirstPayPrivilege = function(self)
    local payStatus = self:getPayStatus();
    return payStatus == 0;
end
--是否有二次特权充值
UserInfoData.getIsSecondPayPrivilege = function(self)
    local payStatus = self:getPayStatus();
    return payStatus == 2;
end
--是否有充值特权
UserInfoData.getIsPayPrivilege = function(self)
    return self:getIsFirstPayPrivilege() or self:getIsSecondPayPrivilege();
end

--会话ID
UserInfoData.setSsid = function(self,ssid)
    self:_set("ssid",ssid);
end
UserInfoData.getSsid = function(self)
    return self:_get("ssid","");
end

--身份证号
UserInfoData.setIdCard = function(self,idcard)
    self:_set("idcard",idcard);
end
UserInfoData.getIdCard = function(self)
    return self:_get("idcard","");
end

--真实姓名
UserInfoData.setRealName = function(self,realname)
    self:_set("realname",realname);
end
UserInfoData.getRealName = function(self)
    return self:_get("realname","");
end

--家乡
UserInfoData.setHometown = function(self,hometown)
    self:_set("hometown",hometown);
end
UserInfoData.getHometown = function(self)
    return self:_get("hometown","");
end

--当前居住地
UserInfoData.setCity = function(self,city)
    self:_set("city",city);
end
UserInfoData.getCity = function(self)
    local city = self:_get("city", RegionConfigDataInterface.getInstance():getRegionDefaultCity() );
    if city == "" then 
        city = RegionConfigDataInterface.getInstance():getRegionDefaultCity();
    end 
    return city;
end

--是否刚注册成功
UserInfoData.setIsCurRegister = function(self,isCurRegister)
    self:_set("isCurRegister",isCurRegister);
end
UserInfoData.getIsCurRegister = function(self)
    return self:_get("isCurRegister");
end

--是否首日登录
UserInfoData.setIsTodayFirstLogin = function(self,isTodayFirstLogin)
    self:_set("isTodayFirstLogin",isTodayFirstLogin);
end
UserInfoData.getIsTodayFirstLogin = function(self)
    return self:_get("isTodayFirstLogin");
end

-----------------------------------------------------------------------------
--临时的名字
UserInfoData.setCacheNick = function(self,nick)
    self.m_cacheInfo:setName(nick);
end

--临时的性别
UserInfoData.setCacheSex = function(self,sex)
    self.m_cacheInfo:setSex(sex);
end

UserInfoData.setCacheCity = function(self,city)
    self.m_cacheInfo:setCity(city);
end

--刷新临时数据
UserInfoData.refreshUserCacheInfo = function(self)
    if self.m_cacheInfo:isChanged() then
        local name = self:getNickname();
        local sex = self:getSex();
        local city = self:getCity();
        local info = {["nick"] = name;["sex"] = sex;["city"] = city};
        OnlineSocketManager.getInstance():sendMsg(PHP_UPDATE_USERINFO,info);
    end 
end

UserInfoData.onUpdateUserInfoCallback = function(self,isSuccess)
    if isSuccess then 
        self:setCacheNick();
        self:setCacheSex();
        self:setCacheCity();
    end 
end

--------------------------------游戏输赢记录接口--------------------
--获得的历史最高分
UserInfoData.updateHighestScore = function(self,score)
    self.m_highestScore = score;
end

UserInfoData.getHighestScore = function(self)
    return self.m_highestScore or 0;
end

--根据游戏ID获取游戏输赢记录
UserInfoData.getGameRecordData = function(self, gameId)
    return self.m_userGameRecordData:getGameRecordData(gameId);
end

--call back
UserInfoData.onGetGamePlayInfoCallBack = function(self, isSuccess,gameId, gameRecordInfo)
    self:notify(UserInfoData.Delegate.onGetGamePlayInfoCallBack, isSuccess,gameId, gameRecordInfo);
end

--根据Key来获取数据
UserInfoData.getGameRecordItemValueWithKey = function(self, gameId, key)
    return self.m_userGameRecordData:getGameRecordItemValueWithKey(gameId, key);
end

--根据Key来设置数据
UserInfoData.setGameItemValueWithKey = function(self, gameId, key, newValue)
    return self.m_userGameRecordData:setGameItemValueWithKey(gameId, key, newValue)
end

--获取用户游戏中某项数据的值(输、赢、平、最大赢钱数)
UserInfoData.getGameRecordItemValue = function(self, gameId, recordItemType)
    return self.m_userGameRecordData:getGameRecordItemValue(gameId,recordItemType);
end

--刷新用户游戏记录(输、赢、平、最大赢钱数)
--@param: newValue 不传则会在原来基础上+1
UserInfoData.refreshGameRecordItemValue = function(self, gameId, recordItemType, newValue)
    self.m_userGameRecordData:refreshGameRecordItemValue(gameId, recordItemType, newValue);
end

--强制刷新某个游戏的所有记录
UserInfoData.refreshGameAllRecord = function(self, gameId)
    self.m_userGameRecordData:refreshGameAllRecord(gameId);
end

UserInfoData.s_socketCmdFuncMap = {
    [PHP_UPDATE_USERINFO]              = UserInfoData.onUpdateUserInfoCallback;
};
------------------------------------------------------------------------------
UserInfoData._set = function(self,key,value)
    if key then 
        self.m_info[key] = value;
    end 

    if self.m_isNotify then 
        self:notify(UserInfoData.Delegate.refreshUserInfoData);
    end 
end

UserInfoData._get = function(self,key,defaultValue)
    if key and self.m_info[key] then 
        return self.m_info[key];
    else
        return defaultValue;
    end 
end

UserInfoData._notifyRefreshProperty = function(self,propertyType,curNum,lastNum)
    if self.m_isNotify and curNum ~= lastNum then 
        self:notify(UserInfoData.Delegate.refreshUserProperty,propertyType,curNum,lastNum);        
    end 
end

UserInfoData._notifyRefreshIdentity = function(self,curIdentity,lastIdentity)
    if self.m_isNotify and curIdentity ~= lastIdentity then 
        self:notify(UserInfoData.Delegate.refreshUserIdentity,curIdentity,lastIdentity);        
    end 
end

UserInfoData._notifyRefreshPayPrivilege = function(self,curPrivilege,lastPrivilege)
    if self.m_isNotify and curPrivilege ~= lastPrivilege then 
        self:notify(UserInfoData.Delegate.refreshUserPayPrivilege,curPrivilege,lastPrivilege);        
    end 
end
-------------------------------------------------------------------------------
kUserInfoData = UserInfoData.getInstance();