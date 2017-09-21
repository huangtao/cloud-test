require("gameData/gameData");

AccountHistory = class(GameData);

AccountHistory.ctor = function(self)

end

AccountHistory.dtor = function(self)
end

AccountHistory.initData = function(self)
	self.m_accountList = {};
end

AccountHistory.loadDictData = function(self, dict)
	local data = dict:getString("accountList");
	local info = json.decode(data);
	if not table.isEmpty(info) then
		self.m_accountList = info;
	end 
end

AccountHistory.saveDictData = function(self, dict)
	local accountListString = json.encode(self.m_accountList)
	dict:setString("accountList",accountListString);
end

AccountHistory.getLocalDictName = function(self)
	return "accountHistory";
end

AccountHistory.getAccount = function(self)
	return table.verify(Copy(self.m_accountList));
end

AccountHistory.updateMemData = function(self,data)
	if not table.isTable(data) then 
		return;
	end 

	self.m_accountList = {};
	for k,v in ipairs(data) do 
		if table.isTable(v) then 
			v.loginAccount = v.loginAccount or "";
			v.loginPsd = v.loginPsd;
			v.bid = v.bid;
			v.access_token = v.access_token;

			if v.loginAccount ~= "" then 
				table.insert(self.m_accountList,v);
			end 
		end 
	end 
end

-------------------------------------------------------------------------------------------
