require("php/phpCmd");

-----------------------------宝箱相关--------------------------------------
PHP_ROOM_TASK = PHP_CMD_CONSTANT + 0x1070;
PHP_ROOM_TASK_GET_REWARD = PHP_CMD_CONSTANT + 0x1071;--获取奖励

-----------------------------比赛相关 ---------------------------------------
PHP_MATCH_MASTER_POINT = PHP_CMD_CONSTANT + 0x1112;			-- 大师分排行榜
PHP_MATCH_MYMASTER_POINT = PHP_CMD_CONSTANT + 0x1113;		-- 个人排名

PHP_REQUEST_SILVER_DATA =   PHP_CMD_CONSTANT + 0x2070;
PHP_ROOM_SILVER_GET_REWARD = PHP_CMD_CONSTANT + 0x2071;

CommonGamePhpCmdMap = {
	[PHP_ROOM_TASK]            = "diamond.show";
	[PHP_ROOM_TASK_GET_REWARD] = "diamond.take";

	[PHP_MATCH_MASTER_POINT]					= "rank.getranklist";			-- 大师分排行榜
	[PHP_MATCH_MYMASTER_POINT]					= "rank.getrank";				-- 大师分排行榜

	[PHP_REQUEST_SILVER_DATA] = "silver.show"; -- 银元场任务
    [PHP_ROOM_SILVER_GET_REWARD] = "silver.take"; -- 银元场任务领取
};

PhpSocketCmdMap = CombineTables(PhpSocketCmdMap or {}, CommonGamePhpCmdMap or {});