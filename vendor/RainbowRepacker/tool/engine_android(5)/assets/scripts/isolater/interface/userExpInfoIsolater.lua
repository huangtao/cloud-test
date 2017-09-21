require("gameData/dataInterfaceBase");
require("hall/userInfo/data/userInfoData");
require("hall/userInfo/data/userLevelConfigInterface");

UserExpInfoIsolater = class(DataInterfaceBase);

UserExpInfoIsolater.Delegate = {
};

UserExpInfoIsolater.getInstance = function()
	if not UserExpInfoIsolater.s_instance then
		UserExpInfoIsolater.s_instance = new(UserExpInfoIsolater); 
	end
	return UserExpInfoIsolater.s_instance;
end

UserExpInfoIsolater.ctor = function(self)
end

UserExpInfoIsolater.dtor = function(self)
end
--------------------------------------------------------
--等级
UserExpInfoIsolater.setLevel = function(self,level)
	kUserInfoData:setLevel(level);
end
UserExpInfoIsolater.getLevel = function(self)
	return kUserInfoData:getLevel();
end

--经验
UserExpInfoIsolater.setExp = function(self,exp)
	kUserInfoData:setExp(exp);
end
UserExpInfoIsolater.getExp = function(self)
	return kUserInfoData:getExp();
end
--------------------------------------------------------
--获取指定等级的称号
UserExpInfoIsolater.getLevelName = function(self,level)
	return UserLevelConfigInterface.getInstance():getSpecifyLevelName(level);
end

--获取指定等级的经验
UserExpInfoIsolater.getLevelExp = function(self,level)
	return UserLevelConfigInterface.getInstance():getSpecifyLevelExp(level);
end

--根据经验获取等级和称号
UserExpInfoIsolater.countLevelByExp = function(self,exp)
	return UserLevelConfigInterface.getInstance():countLevelByExp(exp);
end

--计算经验百分比
UserExpInfoIsolater.countLevelPercent = function(self,exp)
	return UserLevelConfigInterface.getInstance():countLevelPercent(exp);
end