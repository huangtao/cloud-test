require("gameData/gameData");

LastLoginInfo = class(GameData);

LastLoginInfo.ctor = function(self)
end

LastLoginInfo.dtor = function(self)
end

LastLoginInfo.initData = function(self)
	self.m_recordInfo = {};
end

LastLoginInfo.loadDictData = function(self, dict)
	local data = dict:getString("lastLoginInfo");
	local info = json.decode(data);
	if not table.isEmpty(info) then
		self:analysisData(info);
	end 
end

LastLoginInfo.saveDictData = function(self, dict)
	local info = json.encode(self.m_recordInfo)
	dict:setString("lastLoginInfo",info);
end

LastLoginInfo.getLocalDictName = function(self)
	return "lastLoginInfo";
end

LastLoginInfo.updateMemData = function(self,data)
	if not table.isTable(data) then 
		return;
	end 

	self.m_recordInfo = {};
	self:analysisData(data);
end

LastLoginInfo.analysisData = function(self,data)
	data = table.verify(data);

	data.uType = tonumber(data.uType) or -1;
	data.mid = tonumber(data.mid) or 0;
	data.byacc = data.byacc or "";
	data.nick = data.nick or "";
	data.sex = tonumber(data.sex) or 0;
	data.token = data.token or "";
	data.bid = data.bid or "";
	data.phoneNum = data.phoneNum or "";
	data.imsi = data.imsi or "";
	data.loginType = data.loginType or 4;
    data.cid = tonumber(data.cid) or data.mid;
	
	self.m_recordInfo = data;
end

LastLoginInfo.getLastLoginInfo = function(self)
	if not table.isEmpty(self.m_recordInfo) then
		return self.m_recordInfo;
	else
		return self:__getCompatibleLoginInfo();
	end
end

LastLoginInfo.clearLastLoginInfo = function(self)
	local dict = new(Dict, self:getLocalDictName() );
	dict:delete();
	dict:save();
	delete(dict);
end



--兼容宜宾、四川以前的版本
--以前的版本登录信息存放在loginInfo中
--兼容策略-> 先读取lastLoginInfo，再读取loginInfo
LastLoginInfo.__getCompatibleLoginInfo = function(self)
	if not table.isEmpty(self.m_compatibleLoginInfo) then
		return self.m_compatibleLoginInfo;
	end

	local info = {};
	local dict = new(Dict, "loginInfo");
	dict:load();

	info.uType = dict:getInt("lastUType",-1);
	info.mid = dict:getInt("lastMid",0);
	info.byacc = dict:getString("lastbyacc");
	info.nick = dict:getString("lastNickName");
	info.token = dict:getString("lastToken");
	info.bid = dict:getString("bid");
	info.phoneNum = dict:getString("lastPhoneNum");
	info.imsi = dict:getString("imsi");

	delete(dict);
	dict = nil;

	self.m_compatibleLoginInfo = info;

	return self.m_compatibleLoginInfo;
end