PlayersConfig = {};

PlayersConfig.s_defaultScreenW = 1280; --默认配置调整时的屏幕分辨率
PlayersConfig.s_defaultScreenH = 800;
PlayersConfig.mySeat = GamePlayerManager2.getInstance():getMyLocalSeat();

PlayersConfig.defaultHeadLocation = {
	["bottom"] = {
		["x"] = 60;
		["y"] = 290;
		["align"] = kAlignBottomLeft;
	};
	["right"] = {
		["x"] = 60;
		["y"] = 60;
		["align"] = kAlignTopRight;
	};
	["top"] = {
		["x"] = 0;
		["y"] = 60;
		["align"] = kAlignTop;
	};
	["left"] = {
		["x"] = 60;
		["y"] = 60;
		["align"] = kAlignTopLeft;
	};
};

PlayersConfig.defaultHeadPosConfig = {
	[PlayersConfig.mySeat] = PlayersConfig.defaultHeadLocation["bottom"];
};

PlayersConfig.defaultPlayerInfoLocation = {
	["bottom"] = {
		["x"] = 20;
		["y"] = 290;
		["align"] = kAlignBottomLeft;
	};
	["right"] = {
		["x"] = 20;
		["y"] = 40;
		["align"] = kAlignTopRight;
	};
	["top"] = {
		["x"] = 0;
		["y"] = 40;
		["align"] = kAlignTop;
	};
	["left"] = {
		["x"] = 20;
		["y"] = 40;
		["align"] = kAlignTopLeft;
	};
};

PlayersConfig.defaultPlayerInfoPosConfig = {
	[PlayersConfig.mySeat] = PlayersConfig.defaultPlayerInfoLocation["bottom"];
};
----------------------------------------------------------------------------------------------
--进入游戏前一定要调用，重置配置
PlayersConfig.initData = function()
	PlayersConfig.m_configMap = {};
	PlayersConfig.m_infoData = {};
end 

--退出游戏前一定要调用，重置配置
PlayersConfig.clear = function()
	PlayersConfig.initData();
end 

----------------------------------------------------------------------------------------------
PlayersConfig.setPlayerHeadClass = function(headClass)
	PlayersConfig._setInfoData("playerHeadClass",headClass);
end
PlayersConfig.getPlayerHeadClass = function()	
	local defaultPlayerHeadClass = require("games/common2/players/playerHeadView");
	local headClass = defaultPlayerHeadClass;
	local customClass = PlayersConfig._getInfoData("playerHeadClass");
	if customClass and typeof(customClass,defaultPlayerHeadClass) then 
		headClass = customClass;
	end 
	return headClass;
end

PlayersConfig.setHeadPosConfig = function(headPosConfig)
	PlayersConfig._setConfigMap("headPosConfig",headPosConfig);
end
PlayersConfig.getHeadPosConfig = function(seat)
	local headPosConfig = PlayersConfig._getConfigMap("headPosConfig") or PlayersConfig.defaultHeadPosConfig;
	return table.verify(headPosConfig[seat]);
end
----------------------------------------------------------------------------------------------
PlayersConfig.setPlayerInfoClass = function(playerInfoClass)
	PlayersConfig._setInfoData("playerInfoClass",playerInfoClass);
end
PlayersConfig.getPlayerInfoClass = function()	
	local defaultPlayerInfoClass = require("games/common2/players/playerInfoView");
	local playerInfoClass = defaultPlayerInfoClass;
	local customClass = PlayersConfig._getInfoData("playerInfoClass");
	if customClass and typeof(customClass,defaultPlayerInfoClass) then 
		playerInfoClass = customClass;
	end 
	return playerInfoClass;
end

PlayersConfig.setPlayerInfoPosConfig = function(playerInfoPosConfig)
	PlayersConfig._setConfigMap("playerInfoPosConfig",playerInfoPosConfig);
end
PlayersConfig.getPlayerInfoPosConfig = function(seat)
	local playerInfoPosConfig = PlayersConfig._getConfigMap("playerInfoPosConfig") or PlayersConfig.defaultPlayerInfoPosConfig;
	return table.verify(playerInfoPosConfig[seat]);
end

----------------------------------------------------------------------------------------------
--存储数据
PlayersConfig._setInfoData = function(name,value)
	if not(name and value) then 
		return;
	end 

	PlayersConfig.m_infoData = table.verify(PlayersConfig.m_infoData);
	PlayersConfig.m_infoData[name] = value;
end 
PlayersConfig._getInfoData = function(name)
	if not name then 
		return;
	end

	PlayersConfig.m_infoData = table.verify(PlayersConfig.m_infoData);
	return PlayersConfig.m_infoData[name];
end 

--存储配置表
--从该处获得的数据，如果存在的话一定为table
PlayersConfig._setConfigMap = function(name,config)
	if not(name and config) then 
		return;
	end 

	PlayersConfig.m_configMap = table.verify(PlayersConfig.m_configMap);
	if type(config) == "table" then 
		PlayersConfig.m_configMap[name] = config;
	end
end 
PlayersConfig._getConfigMap = function(name)
	if not name then 
		return;
	end 
	PlayersConfig.m_configMap = table.verify(PlayersConfig.m_configMap);
	return PlayersConfig.m_configMap[name];
end
