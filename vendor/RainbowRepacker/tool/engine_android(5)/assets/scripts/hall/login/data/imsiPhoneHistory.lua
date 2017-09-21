require("gameData/gameData");

ImsiPhoneHistory = class(GameData);

ImsiPhoneHistory.ctor = function(self)

end

ImsiPhoneHistory.dtor = function(self)
end

ImsiPhoneHistory.initData = function(self)
	self.m_imsiPhoneList = {};
end

ImsiPhoneHistory.loadDictData = function(self, dict)
	local data = dict:getString("imsiPhoneList");
	local info = json.decode(data);
	if not table.isEmpty(info) then
		self.m_imsiPhoneList = info;
	end 
end

ImsiPhoneHistory.saveDictData = function(self, dict)
	local listStr = json.encode(self.m_imsiPhoneList)
	dict:setString("imsiPhoneList",listStr);
end

ImsiPhoneHistory.getLocalDictName = function(self)
	return "imsiPhoneHistory";
end

ImsiPhoneHistory.getImsiPhone = function(self)
	return table.verify(self.m_accountList);
end

ImsiPhoneHistory.updateMemData = function(self,data)
	if not table.isTable(data) then 
		return;
	end 

	self.m_imsiPhoneList = {};
	for k,v in ipairs(data) do 
		if table.isTable(v) then 
			v.imsi = v.imsi or "";
			v.phone = v.phone or "";
			if v.imsi ~= "" and v.phone ~= "" then 
				table.insert(self.m_imsiPhoneList,v);
			end 
		end 
	end 
end