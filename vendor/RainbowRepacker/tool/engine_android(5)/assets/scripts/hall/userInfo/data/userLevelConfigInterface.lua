

UserLevelConfigInterface = class(DataInterfaceBase);

UserLevelConfigInterface.getInstance = function()
	if not UserLevelConfigInterface.s_instance then
		UserLevelConfigInterface.s_instance = new(UserLevelConfigInterface);
	end
	
	return UserLevelConfigInterface.s_instance;
end

UserLevelConfigInterface.ctor = function(self)
	self.m_levelConfig = new(require("hall/userInfo/data/userLevelConfig"));
end

UserLevelConfigInterface.dtor = function(self)
	delete(self.m_levelConfig);
	self.m_levelConfig = nil;
end

UserLevelConfigInterface.getUserLevelConfig = function(self)
	return self.m_levelConfig:getUserLevelConfig();
end

--获取指定等级的配置
UserLevelConfigInterface.getSpecifyLevelConfig = function(self,level)
    local config = self:getUserLevelConfig();
    local levelConfig = table.verify(config[level]);

    return levelConfig;
end
--获取指定等级的称号
UserLevelConfigInterface.getSpecifyLevelName = function(self,level)
	local config = self:getSpecifyLevelConfig();

	return config.name or "";
end
--获取指定等级的经验
UserLevelConfigInterface.getSpecifyLevelExp = function(self,level)
    local config = self:getSpecifyLevelConfig();

	return config.exp or 0;
end

--根据经验获取等级配置
UserLevelConfigInterface.getLevelConfigByExp = function(self,exp)
    exp = tonumber(exp) or 0;
    local config = self:getUserLevelConfig();
    local specifyConfig = {};
    local level;

    for i = 0,#config do
        if number.valueOf(config[i].exp) > exp then
            if config[i-1] then
                level = i - 1;
            end  
            break;
        elseif number.valueOf(config[i].exp) == exp then
            level = i;
            break;
        end   
    end

    if level then 
        specifyConfig = config[level];
    else
        local k = table.maxn(config);
        local value = config[k];
        if number.valueOf(value.exp) < exp then
            level = k;
            specifyConfig = value;
        end
    end 

    return level,specifyConfig;
end

UserLevelConfigInterface.countLevelByExp = function(self,intExp)
    local level,levelConfig = self:getLevelConfigByExp(intExp);
    local levelName = levelConfig.name or "";

    return level or 0,levelName;
end

UserLevelConfigInterface.countLevelPercent = function(self,intExp)
    intExp = tonumber(intExp) or -1;

    if intExp < 0 then
        return 0;
    end

    local pe = 0;	
    local config = self:getUserLevelConfig();
    local level,levelConfig = self:getLevelConfigByExp(intExp);
    local nextLevelConfig = table.verify(config[level + 1]);   
    local levelEndExp = number.valueOf(nextLevelConfig.exp);
    if levelEndExp == intExp then 
        return 0;

    elseif levelEndExp > intExp then                          
        local levelStartExp = number.valueOf(levelConfig.exp);
        pe = (intExp - levelStartExp) / (levelEndExp - levelStartExp);

    elseif levelEndExp < intExp then --最高级的经验都已满了的情况
        return 1;
    end 
    if pe < 0 then
        pe = 0;
    end
    return pe;
end

kUserLevelConfigInterface = UserLevelConfigInterface.getInstance();