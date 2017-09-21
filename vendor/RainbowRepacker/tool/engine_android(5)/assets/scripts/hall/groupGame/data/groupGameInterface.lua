require("gameData/dataInterfaceBase");

GroupGameInterface = class(DataInterfaceBase);


GroupGameInterface.getInstance = function()
	if not GroupGameInterface.s_instance then
		GroupGameInterface.s_instance = new(GroupGameInterface);
	end

	return GroupGameInterface.s_instance;
end

GroupGameInterface.ctor = function(self)
	self.m_groupGameUrl = "";
end

--@override
GroupGameInterface.getLocalDictName = function(self)
	return "GroupGameInterface";
end

--@override
GroupGameInterface.loadDictData = function(self, dict)
	self.m_groupGameUrl = dict:getString("groupGameUrl") or "";
end

--@override
GroupGameInterface.saveDictData = function(self, dict)
	dict:setString("groupGameUrl", self.m_groupGameUrl or "");
end

--设置团队赛地址
GroupGameInterface.setGroupGameUrl = function(self, groupGameUrl)
	if not string.isEmpty(groupGameUrl) then
		self.m_groupGameUrl = groupGameUrl;
		self:saveData();
	end
end

--获取团队赛地址
GroupGameInterface.getGroupGameUrl = function(self)
	return self.m_groupGameUrl or "";
end

