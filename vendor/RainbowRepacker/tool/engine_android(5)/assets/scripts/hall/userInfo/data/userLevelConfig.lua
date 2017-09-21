require("core/object");
require("gameData/gameData");
require("libs/json_wrap");

--------------------------------
--用户等级配置
-----------------------------------
local UserLevelConfig = class(GameData);

UserLevelConfig.initData = function(self)
    self.m_localVersion = -1;
	self.m_level = {};
end 

UserLevelConfig.loadDictData = function(self, dict)
    self.m_localVersion = dict:getInt("version", -1);
    local strData = dict:getString("levelData") or "";
    local levelData = json.decode(strData);
    if table.isTable(levelData) then
        self:analysisData(levelData);
    end
end

UserLevelConfig.saveDictData = function(self, dict)
    dict:setInt("version", self:getLocalVersion() );
    local strLevelData = json.encode(self.m_level or {} );
    if strLevelData then
        dict:setString("levelData", strLevelData);
    end
end

UserLevelConfig.getLocalDictName = function(self)
    return "userLevelConfig";
end

UserLevelConfig.getLocalVersion = function(self)
    return self.m_localVersion or -1;
end

UserLevelConfig.requestData = function(self)
    if not self.m_isTouched or table.isEmpty(self.m_level) then
        local param = {
            ["cli_ver"] = self:getLocalVersion();
        };
        OnlineSocketManager.getInstance():sendMsg(PHP_LEVEL_MEDEL_CONFIG,param);
    end   
end

UserLevelConfig.onLevelConfigCallBack = function(self,isSuccess,info)
    Log.v("UserLevelConfig.onLevelConfigCallBack","isSuccess = ",isSuccess,"info = ",info);
    if isSuccess then 
        self:updateDataByCompareVersion(info.svr_ver, info.isrefresh, info.level);
    end     
end

UserLevelConfig.updateMemData = function(self, serverVersion, levelData)
    if table.isEmpty(levelData) then
        return;
    end

    self.m_localVersion = serverVersion;
    self:analysisData(levelData);    
end

UserLevelConfig.analysisData = function(self, levelData)
    if type(levelData) ~= "table" then
        return;
    end   

    self.m_level = {};
    for k,v in pairs(levelData) do
        v.exp = tonumber(v.exp) or 0;
        v.name = tostring(v.name) or "";
        v.levelId = tonumber(k) or 0;
        self.m_level[number.valueOf(k)] = v;
    end

    table.sort(self.m_level, function(a, b)
        return a.levelId < b.levelId;
    end );   
end

UserLevelConfig.s_socketCmdFuncMap = {
    [PHP_LEVEL_MEDEL_CONFIG] = UserLevelConfig.onLevelConfigCallBack;
};
----------------------------------------------------
UserLevelConfig.getUserLevelConfig = function(self)
    self:requestData();

    local config = self.m_level;
    if table.isEmpty(config) then 
        config = self:_getDefaultLevelConfig();
    end 

    return config;
end

UserLevelConfig._getDefaultLevelConfig = function(self)
	return UserLevelConfig.defaultLevelConfig ;
end

UserLevelConfig.defaultLevelConfig = {
    [0]= {
        ["name"]= "初出茅庐",
        ["exp"]= 0,
    },
    [1]= {
        ["name"]= "入世未深",
        ["exp"]= 1,
    },
    [2]= {
        ["name"]= "入世未深",
        ["exp"]= 4,
    },
    [3]= {
        ["name"]= "入世未深",
        ["exp"]= 8,
    },
    [4]= {
        ["name"]= "入世未深",
        ["exp"]= 14,
    },
    [5]= {
        ["name"]= "入世未深",
        ["exp"]= 21,
    },
    [6]= {
        ["name"]= "闯荡江湖",
        ["exp"]= 30,
    },
    [7]= {
        ["name"]= "闯荡江湖",
        ["exp"]= 40,
    },
    [8]= {
        ["name"]= "闯荡江湖",
        ["exp"]= 53,
    },
    [9]= {
        ["name"]= "闯荡江湖",
        ["exp"]= 69,
    },
    [10]= {
        ["name"]= "闯荡江湖",
        ["exp"]= 87,
    },
    [11]= {
        ["name"]= "小试身手",
        ["exp"]= 167,
    },
    [12]= {
        ["name"]= "小试身手",
        ["exp"]= 292,
    },
    [13]= {
        ["name"]= "小试身手",
        ["exp"]= 512,
    },
    [14]= {
        ["name"]= "小试身手",
        ["exp"]= 927,
    },
    [15]= {
        ["name"]= "小试身手",
        ["exp"]= 1732,
    },
    [16]= {
        ["name"]= "初露头角",
        ["exp"]= 3322,
    },
    [17]= {
        ["name"]= "初露头角",
        ["exp"]= 6482,
    },
    [18]= {
        ["name"]= "初露头角",
        ["exp"]= 12787,
    },
    [19]= {
        ["name"]= "初露头角",
        ["exp"]= 25387,
    },
    [20]= {
        ["name"]= "初露头角",
        ["exp"]= 50582,
    },
    [21]= {
        ["name"]= "略有小成",
        ["exp"]= 56917,
    },
    [22]= {
        ["name"]= "略有小成",
        ["exp"]= 63282,
    },
    [23]= {
        ["name"]= "略有小成",
        ["exp"]= 69737,
    },
    [24]= {
        ["name"]= "略有小成",
        ["exp"]= 76462,
    },
    [25]= {
        ["name"]= "略有小成",
        ["exp"]= 84002,
    },
    [26]= {
        ["name"]= "一鸣惊人",
        ["exp"]= 93997,
    },
    [27]= {
        ["name"]= "一鸣惊人",
        ["exp"]= 111367,
    },
    [28]= {
        ["name"]= "一鸣惊人",
        ["exp"]= 150862,
    },
    [29]= {
        ["name"]= "一鸣惊人",
        ["exp"]= 256732,
    },
    [30]= {
        ["name"]= "一鸣惊人",
        ["exp"]= 561727,
    },
    [31]= {
        ["name"]= "赫赫有名",
        ["exp"]= 579137,
    },
    [32]= {
        ["name"]= "赫赫有名",
        ["exp"]= 596587,
    },
    [33]= {
        ["name"]= "赫赫有名",
        ["exp"]= 614157,
    },
    [34]= {
        ["name"]= "赫赫有名",
        ["exp"]= 632087,
    },
    [35]= {
        ["name"]= "赫赫有名",
        ["exp"]= 651107,
    },
    [36]= {
        ["name"]= "威震四方",
        ["exp"]= 673407,
    },
    [37]= {
        ["name"]= "威震四方",
        ["exp"]= 705547,
    },
    [38]= {
        ["name"]= "威震四方",
        ["exp"]= 767207,
    },
    [39]= {
        ["name"]= "威震四方",
        ["exp"]= 917437,
    },
    [40]= {
        ["name"]= "威震四方",
        ["exp"]= 1333387,
    },
    [41]= {
        ["name"]= "天下无敌",
        ["exp"]= 1365557,
    },
    [42]= {
        ["name"]= "天下无敌",
        ["exp"]= 1397757,
    },
    [43]= {
        ["name"]= "天下无敌",
        ["exp"]= 1430052,
    },
    [44]= {
        ["name"]= "天下无敌",
        ["exp"]= 1462662,
    },
    [45]= {
        ["name"]= "天下无敌",
        ["exp"]= 1496287,
    },
    [46]= {
        ["name"]= "至尊霸主",
        ["exp"]= 1533162,
    },
    [47]= {
        ["name"]= "至尊霸主",
        ["exp"]= 1580437,
    },
    [48]= {
        ["name"]= "至尊霸主",
        ["exp"]= 1660997,
    },
    [49]= {
        ["name"]= "至尊霸主",
        ["exp"]= 1848072,
    },
    [50]= {
        ["name"]= "至尊霸主",
        ["exp"]= 2375992,
    }
}

return UserLevelConfig;