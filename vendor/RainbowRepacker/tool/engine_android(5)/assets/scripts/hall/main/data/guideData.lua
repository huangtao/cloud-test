require("gameData/gameData");

local GuideData = class(GameData);


GuideData.initData = function(self)
	self.m_guidedInfo = {};
end

GuideData.loadDictData = function(self, dict)
	local info = dict:getString("guideInfo");
	self.m_guidedInfo = table.verify(json.decode(info));
end

GuideData.saveDictData = function(self, dict)
	local info = json.encode(self.m_guidedInfo);
	dict:setString("guideInfo",info);
end

GuideData.getLocalDictName = function(self)
	return "guide";
end

-------------------------------------------------------
GuideData.checkIsGuided = function(self,userId)
	for i,v in pairs(self.m_guidedInfo) do        
        if number.valueOf(v) == userId then
            return true;
        end
    end
    return false;
end

GuideData.setUserGuided = function(self,userId)
	if not userId then
		return;
	end 
	if not self:checkIsGuided(userId) then
		table.insert(self.m_guidedInfo,1,userId);
		self:saveData();
	end 
end

return GuideData;