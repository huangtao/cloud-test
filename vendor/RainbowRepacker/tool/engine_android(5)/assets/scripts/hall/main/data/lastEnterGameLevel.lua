require("gameData/gameData");
require("core/dict");

local LastEnterGameLevel = class(GameData);



LastEnterGameLevel.ctor = function(self)
 
end

LastEnterGameLevel.dtor = function(self)
   
end

LastEnterGameLevel.getCurGameLevelTab = function(self,gameId)
    gameId = tostring(gameId);
	if self.m_recordList and self.m_recordList[gameId] then
        return self.m_recordList[gameId]; 
    else
        return 1;   
    end
end

LastEnterGameLevel.setCurGameLevelTab = function(self,gameId,whichTab)

    gameId = tostring(gameId) ;

    if not gameId then
        return;
    end

    whichTab = tonumber(whichTab) or 1;

    


    if self.m_recordList[gameId] == whichTab then
    	return;
    end

    self.m_recordList[gameId] = whichTab;
    self:saveData();
end

LastEnterGameLevel.updateMemData = function(self, data, sendParam) 
    
end


-------------------------------------------------------------------
--virtual
LastEnterGameLevel.loadDictData = function(self, dict)
    self.m_recordList = table.verify(json.decode(dict:getString("lastEnterGameLevel_recordData")));
end

--virtual
LastEnterGameLevel.saveDictData = function(self, dict)
    local data = json.encode(self.m_recordList) or "";
    dict:setString("lastEnterGameLevel_recordData", data);
end

LastEnterGameLevel.getLocalDictName = function(self)
    return "dic_lastEnterGameLevel_recordData";
end

-------------------------------------------------------------------

return LastEnterGameLevel;
