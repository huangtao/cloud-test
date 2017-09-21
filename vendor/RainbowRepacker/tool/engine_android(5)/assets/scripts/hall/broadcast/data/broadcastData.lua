require("gameData/gameData");

local BroadcastData = class(GameData);

BroadcastData.Delegate = {
	refreshRadioList = "refreshRadioList";	
};

--大厅上面的广播、跑马灯
BroadcastData.ctor = function(self)
end
BroadcastData.dtor = function(self)
end

----最新广播列表-----
BroadcastData.getRadioMsgList = function(self)
	self:requestData();

	return self.m_radioMsgList;
end

BroadcastData.addRadioMsg = function(self,data)
	self:_addRadioMsg(data,true);
end

BroadcastData.addRadioMsgWithoutNotify = function(self,data)
	self:_addRadioMsg(data,false);
end

BroadcastData.setRadioMsgList = function(self,data)
	data = table.verify(data);
	self.m_radioMsgList = data;
end

-------过期广播-------
BroadcastData.getOverRadioMsgList = function(self)
	return self.m_overRadioMsgList;
end

BroadcastData.setOverRadioMsgList = function(self,data)
	if table.isEmpty(data) then
		return;
	end
	self.m_overRadioMsgList = data;
end


--发一条消息的费用
BroadcastData.getRadioMoney = function(self)
	return self.m_radioCost or 3000;
end

BroadcastData.setRadioMoney = function(self, money)
	self.m_radioCost = number.valueOf(money,3000);
	self:saveData();
end
-----------------------------------------------------------------------------------

BroadcastData.initData = function(self)
	self.m_radioMsgList = {};
	self.m_overRadioMsgList = {};
end

BroadcastData.requestData = function(self)
	if self:_isNeedRefresh() then 
		local info = {};
		info.timestamp = self.m_radioRefreshTime or "";
		OnlineSocketManager.getInstance():sendMsg(PHP_Radio_List, info);
	end 
end

-----获取广播列表
BroadcastData.onGetRadioList = function (self,isSuccess,info)
	if isSuccess then
		self:updateData(true,info);
	end 

	self:execDelegate(BroadcastData.Delegate.refreshRadioList,isSuccess,self.m_radioMsgList);
end

BroadcastData.updateMemData = function(self,data)
	if table.isEmpty(data) then
		return;
	end

	self.m_radioMsgList = self.m_radioMsgList or {};
	for k,v in pairs(data) do 
		if table.isTable(v) then 
			v = self:__formatData(v);
			if not table.isEmpty(data) then
				self.m_radioRefreshTime = v.send_time;
				table.insert(self.m_radioMsgList,v);
			end 					
		end 
	end 
end

BroadcastData.__formatData = function(self, data)
	if not table.isTable(data) then 
		return {};
	end 

	data.msgid = data.msgid or "";
	data.mid = data.mid or "";
	data.content = data.content or "";
	data.type = tonumber(data.type) or 0;
	data.send_time = data.send_time or "";
	data.nick = data.nick or "";
	data.icon = data.icon or "";

	return data;
end

BroadcastData._isNeedRefresh = function(self)
	if self.m_isTouched then 
		return false;
	else 
		if not self.m_lastRefreshTime then 
			self.m_lastRefreshTime = os.time();
			return true;
		else 
			local curTime = os.time();
			local lastTime = self.m_lastRefreshTime;
			local time = curTime - lastTime;
			if time > 60 then 
				self.m_lastRefreshTime = os.time();
				return true
			else 
				return false;
			end 
		end 
	end 
end

BroadcastData._addRadioMsg = function(self,data,isNotify)
	data = self:__formatData(data);
	if table.isEmpty(data) then
		return;
	end 

	self.m_radioRefreshTime = data.send_time;
	table.insert(self.m_radioMsgList,1,data);

	self:saveData();

	Log.i("BroadcastData._addRadioMsg refreshRadioList","isNotify = ",isNotify,"radioMsgList = ",self.m_radioMsgList);

	if isNotify then 
		self:execDelegate(BroadcastData.Delegate.refreshRadioList,true,self.m_radioMsgList);
	end 
end

BroadcastData.loadDictData = function(self, dict)
	self.m_radioRefreshTime  = dict:getString("refreshTime");
	self.m_radioCost = dict:getInt("radioCost",3000);
end

BroadcastData.saveDictData = function(self, dict)
	dict:setString("refreshTime", self.m_radioRefreshTime or "");
	dict:setInt("radioCost", self.m_rodioCost or 3000);
end

BroadcastData.getLocalDictName = function(self)
	self.m_userId = self.m_userId or kUserInfoData:getUserId();
	return "broadcast_" .. self.m_userId;
end

BroadcastData.s_socketCmdFuncMap = {
	[PHP_Radio_List] 		         = BroadcastData.onGetRadioList;
};

return BroadcastData;