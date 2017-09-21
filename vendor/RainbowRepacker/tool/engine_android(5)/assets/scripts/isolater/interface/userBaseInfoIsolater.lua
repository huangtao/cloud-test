require("gameData/dataInterfaceBase");
require("hall/userInfo/data/userInfoData");
require("hall/login/data/loginDataInterface");
require("hall/main/data/hallDataInterface");
require("isolater/interface/gameInfoIsolater");

--玩家基础信息
UserBaseInfoIsolater = class(DataInterfaceBase);

UserBaseInfoIsolater.Delegate = {
};

UserBaseInfoIsolater.getInstance = function()
	if not UserBaseInfoIsolater.s_instance then
		UserBaseInfoIsolater.s_instance = new(UserBaseInfoIsolater); 
	end
	return UserBaseInfoIsolater.s_instance;
end

UserBaseInfoIsolater.ctor = function(self)
end

UserBaseInfoIsolater.dtor = function(self)
end
--------------------------------------------------------
--大厅是否登录成功
UserBaseInfoIsolater.getIsLoginSuccess = function(self)
    return kLoginDataInterface:getIsLoginSuccess();
end

--用户ID
UserBaseInfoIsolater.getUserId = function(self)
	return kUserInfoData:getUserId();
end

--用户公共id
UserBaseInfoIsolater.getUserCid = function(self)
	return kUserInfoData:getUserCid();
end

--用户类型
UserBaseInfoIsolater.getUType = function(self)
	return kUserInfoData:getUType();
end

-- 昵称
UserBaseInfoIsolater.getNickname = function(self)
	return kUserInfoData:getNickname();
end

--性别：0 - 保密，1 - 男 ,2 - 女（默认显示男头像）
UserBaseInfoIsolater.getSex = function(self)
	return kUserInfoData:getSex();
end

--小头像
UserBaseInfoIsolater.getAvatar_s = function(self)
	return kUserInfoData:getAvatar_s();
end

--中头像
UserBaseInfoIsolater.getAvatar_m = function(self)
	return kUserInfoData:getAvatar_m();
end

--大头像
UserBaseInfoIsolater.getAvatar_b = function(self)
	return kUserInfoData:getAvatar_b();
end

--当前居住地
UserBaseInfoIsolater.getCity = function(self)
	return kUserInfoData:getCity();
end

--家乡
UserBaseInfoIsolater.getHometown = function(self)
	return kUserInfoData:getHometown();
end

--真实姓名
UserBaseInfoIsolater.getRealName = function(self)
	return kUserInfoData:getRealName();
end

--身份证号
UserBaseInfoIsolater.getIdCard = function(self)
	return kUserInfoData:getIdCard();
end

--应用ID
UserBaseInfoIsolater.getAppId = function(self)
	return kUserInfoData:getAppId();
end

--会话ID
UserBaseInfoIsolater.getSsid = function(self)
	return kUserInfoData:getSsid();
end
----------------------------------------------------------
--获取玩家基础信息
UserBaseInfoIsolater.getInfoByType = function(self,key,defaultValue)
	return kUserInfoData:getInfoByType(key,defaultValue);
end

UserBaseInfoIsolater.getUserInfo = function(self)
	return kUserInfoData:getUserInfo();
end
----------------------------------------------------------
--根据性别获取玩家默认男女头像
UserBaseInfoIsolater.getHeadBySex = function(self,sex,isBigHead)
	return kUserInfoData:getHeadBySex(sex,isBigHead);
end

--@brief 处理用户头像信息，
--如果在审核期间，则返回默认头像
--如果是防作弊期间，则返回男性头像
--@param userHeadUrl:用户头像地址
UserBaseInfoIsolater.formatUserHeadUrl = function(self, userHeadUrl)
	if HallDataInterface.getInstance():isTakePhotoSwitchOpen() then
		return userHeadUrl or "";
	else
		return "";
	end
end

--根据性别获取性别标志图片
UserBaseInfoIsolater.getSexIconBySex = function(self,sex)
	return kUserInfoData:getSexIconBySex(sex);
end

--性别是否保密
UserBaseInfoIsolater.checIsSecret = function(self,sex)
	return sex == UserInfoData.eSex.Secret;
end

--是否是男
UserBaseInfoIsolater.checIsMale = function(self,sex)
	return sex == UserInfoData.eSex.Male;
end

--是否是女
UserBaseInfoIsolater.checIsFemale = function(self,sex)
	return sex == UserInfoData.eSex.Female;
end

UserBaseInfoIsolater.getIsVip = function(self)
	return kUserInfoData:getIsVip();
end

UserBaseInfoIsolater.getHallHeadBySex = function(self, sex)
	return kUserInfoData:getHallHeadBySex(sex);
end

--获取男头像
UserBaseInfoIsolater.getMaleHead = function(self,isBigHead)
	return self:getHeadBySex(UserInfoData.eSex.Male,isBigHead);
end

--获取女头像
UserBaseInfoIsolater.getFemaleHead = function(self,isBigHead)
	return self:getHeadBySex(UserInfoData.eSex.Female,isBigHead);
end