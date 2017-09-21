require("gameData/dataInterfaceBase");
require("hall/userInfo/data/userInfoData");

--用户身份信息
UserIdentityIsolater = class(DataInterfaceBase);

UserIdentityIsolater.Delegate = {
	refreshUserIdentity = "refreshUserIdentity";
};

UserIdentityIsolater.eIdentity = {
    Normal = UserInfoData.eIdentity.Normal;     --普通用户
    Rmb = UserInfoData.eIdentity.Rmb;        --付费用户
    Vip = UserInfoData.eIdentity.Vip;        --vip用户
    RmbAndVip = UserInfoData.eIdentity.RmbAndVip;  --既是付费用户又是vip用户
};

UserIdentityIsolater.getInstance = function()
	if not UserIdentityIsolater.s_instance then
		UserIdentityIsolater.s_instance = new(UserIdentityIsolater); 
	end
	return UserIdentityIsolater.s_instance;
end

UserIdentityIsolater.ctor = function(self)
	kUserInfoData:setObserver(self);
end

UserIdentityIsolater.dtor = function(self)
	kUserInfoData:clearObserver(self);
end
------------------------------------------------------------------------
--将用户身份设置为普通用户
UserIdentityIsolater.setNormalIdentity = function(self)
    kUserInfoData:setIdentity(UserInfoData.eIdentity.Normal);
    kUserInfoData:setVipTime(0);
end

--用户身份标识 
--0标识普通用户，1标识付费用户，2标识vip用户, 3标识即是付费用户又vip用户
UserIdentityIsolater.getIdentity = function(self)
	return kUserInfoData:getIdentity();
end

--玩家自己是否是vip用户
UserIdentityIsolater.getIsVip = function(self)
	return kUserInfoData:getIsVip();
end

--玩家自己是否是付费用户
UserIdentityIsolater.getIsPayUser = function(self)
	return kUserInfoData:getIsPayUser();
end

--玩家自己的vip剩余时间描述
UserIdentityIsolater.getVipTimeDesc = function(self)
	return kUserInfoData:getVipTimeDesc();
end
------------------------------------------------------------------------
--用户身份变化
UserIdentityIsolater.refreshUserIdentity = function(self,curIdentity,lastIdentity)
	self:notify(UserInfoData.Delegate.refreshUserIdentity,curIdentity,lastIdentity);
end

--检查玩家是否是VIP
UserIdentityIsolater.checkIsVip = function(self,identity)
	return identity == UserInfoData.eIdentity.Vip or identity == UserInfoData.eIdentity.RmbAndVip;
end

--检查玩家是否是付费用户
UserIdentityIsolater.checkIsPayUser = function(self,identity)
	return identity == UserInfoData.eIdentity.Rmb or identity == UserInfoData.eIdentity.RmbAndVip;
end

--既是付费用户又是vip用户
UserIdentityIsolater.checkIsPayAndVip = function(self,identity)
	return identity == UserInfoData.eIdentity.RmbAndVip;
end

--时间描述
UserIdentityIsolater.getTimeDesc = function(self,time)
	time = number.valueOf(time);

	if time ==-1 then
       return "无限制";
    elseif time == 0 then
       return "0";
    else 
        local leftHour = time/3600   --获取剩余小时
        if leftHour > 23 then
            return string.concat(math.ceil(leftHour/24),"天");     --获取剩余天数
        else
            return string.concat(math.ceil(leftHour),"小时");
        end
    end 
end