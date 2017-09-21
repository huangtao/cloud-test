--region *.lua
--Date
--此文件由[BabeLua]插件自动生成

--针对各CMD的服务器业务逻辑代码写这里

--endregion
local DB = {};    --用来存放数据。
local Handle = {};

----------------------金条-------------------------

DB[PHP_GOLDBAR_CONFIG] = {
		max = 100000;
};

Handle[PHP_GOLDBAR_CONFIG] = function(cmd,param)
	local tmp = {};
	tmp.data = {
		rate_goldBar = 1,
		rate_gold = 100,
		least = 100,
		max = DB[cmd].max;
	}

	tmp.isSuccess = true;

	tmp.waitTime = 500;
    return tmp;
end

Handle[PHP_GOLDBAR_EXCHANGE] = function(cmd,param)
	local tmp = {};
	tmp.data = {
		gold = UserInfoData.getInstance():getMoney() - param.num,
		goldBar = UserInfoData.getInstance():getCrystal() + param.num/100,
		max = DB[PHP_GOLDBAR_CONFIG].max -param.num,
	}

    DB[PHP_GOLDBAR_CONFIG].max =DB[PHP_GOLDBAR_CONFIG].max -param.num;
	tmp.isSuccess = true;

	tmp.waitTime = 500;
    return tmp;
end


return Handle;