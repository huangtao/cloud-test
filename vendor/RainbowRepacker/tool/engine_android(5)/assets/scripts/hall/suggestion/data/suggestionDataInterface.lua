require("gameData/dataInterfaceBase");
require("common/httpModule");
require("hall/suggestion/data/suggestionParamData");
require("hall/userInfo/data/userInfoData");

SuggestionDataInterface = class(DataInterfaceBase);

SuggestionDataInterface.Delegate = {
	onGetFeedbackListCallback = "onGetFeedbackListCallback";

	onGetFeedbackCallBack = "onGetFeedbackCallBack";
	onSendFeedbackCallBack = "onSendFeedbackCallBack";
	onMarkFeedbackCallBack = "onMarkFeedbackCallBack";
};

SuggestionDataInterface.getInstance = function()
	if not SuggestionDataInterface.s_instance then
		SuggestionDataInterface.s_instance = new(SuggestionDataInterface);
	end

	return SuggestionDataInterface.s_instance;
end

SuggestionDataInterface.ctor = function(self)
	EventDispatcher.getInstance():register(HttpModule.s_event,self,self.onHttpRequestCallBack);
end

SuggestionDataInterface.initData = function(self)
    local hotline = HallDataInterface.getInstance():getHotline();
    local defaultHotLine = RegionConfigDataInterface.getInstance():getDefaultHotline();
    self.m_hotline = string.isEmpty(hotline) and defaultHotLine or hotline;
end

SuggestionDataInterface.dtor = function(self)
	EventDispatcher.getInstance():unregister(HttpModule.s_event,self,self.onHttpRequestCallBack);
    self.m_hotline = nil;
    self.m_refreshTime = nil;
    self.m_feedbackList = {}; 
	self.m_unreadIdArr = {};
	self.m_tempSendParamData = nil;
	self.m_userId = nil;
end
------------------------------------------------------------------------------------------------
-- @description : 获取反馈历史记录
SuggestionDataInterface.getFeedbackList = function(self)
	self:_requestFeedbackData();

	return self.m_feedbackList;
end

-- @description : 发送反馈信息
SuggestionDataInterface.requestSendFeedback = function(self,fType,fWords,phone)
	self:_sendFeedback(fType,fWords,phone);
end 

-- @description : 获取未读反馈记录
SuggestionDataInterface.getUnreadFeedbackIds = function(self)
	self:_requestFeedbackData();

	return self.m_unreadIdArr;
end

-- @description : 获取未读反馈条数
SuggestionDataInterface.getUnreadFeedbackNum = function(self)
	self:_requestFeedbackData();

	return #self.m_unreadIdArr;
end

-- @description : 标记所有反馈为已读
SuggestionDataInterface.requestMarkAllFeedback = function(self)
	self:_markAllFeedback();
end

-- @description : 标记反馈为已读
SuggestionDataInterface.requestMarkFeedback = function(self,feedbackId)
	self:_markFeedback(feedbackId);
end 

SuggestionDataInterface.getHotline = function(self)
	return self.m_hotline or "";
end

--------------------------------------------------------------------------------------
-- @description : 获取反馈历史记录
SuggestionDataInterface._requestFeedbackData = function(self)
	if self:_isNeedRefresh() then 
		local param_data = {};
		param_data.appid = SuggestionParamData.getFeedbackAppid();
		param_data.game = SuggestionParamData.getFeedbackGame();
		param_data.deviceno = kClientInfo:getDeviceId();
		HttpModule.getInstance():execute(HttpModule.s_cmds.GetFeedback,param_data);
	end 
end

-- @description : 获取反馈历史记录回调
SuggestionDataInterface._onGetFeedbackCallBack = function(self,isSuccess,data)
	if isSuccess then
		if table.isEmpty(data) then
			isSuccess = false;
		else
			local itemIdArr = {}; -- 未读的反馈ID
			local flag = GetNumFromJsonTable(data,"flag");
			if flag == 1 then
				local temp = {};
				for k,v in pairs(table.verify(data.ret)) do 
				    temp[k] = {};
				    temp[k].question = GetStrFromJsonTable(v,"msgtitle","");
				    temp[k].time = GetNumFromJsonTable(v,"msgtime",0);
				    temp[k].id = GetStrFromJsonTable(v,"id",-1);
				    temp[k].reply = GetStrFromJsonTable(v,"rptitle","");
				    temp[k].rptime = GetStrFromJsonTable(v,"rptime","");
				    temp[k].status = GetNumFromJsonTable(v,"closed", 0);
					temp[k].readed = GetNumFromJsonTable(v, "readed", 0);

				   if temp[k].readed == 0 and temp[k].status == 0 and temp[k].reply ~= "" then 
				    	table.insert(itemIdArr, temp[k].id);
				   end
				end

				local size = #temp;
				if size > 0 then
					table.sort(temp,function(item1,item2)
						return item1.time < item2.time;
					end);
				end
				self:_onGetFeedbackListCallback(temp,itemIdArr);
			end	
		end 
    end

    self:notify(SuggestionDataInterface.Delegate.onGetFeedbackCallBack,isSuccess,self.m_feedbackList);
end

SuggestionDataInterface._onGetFeedbackListCallback = function(self,feedbackList,unreadIds)
	if table.isTable(feedbackList) then
		self.m_feedbackList = {};
		for k,v in pairs(feedbackList) do 
			self:_addFeedbackData(v);
		end 
	end 

	if table.isTable(unreadIds) then
		self.m_unreadIdArr = unreadIds;
	end 
    
    self:saveData();
	self:notify(SuggestionDataInterface.Delegate.onGetFeedbackListCallback,self.m_feedbackList);
end

SuggestionDataInterface._formatFeedbackData = function(self,data)
	data = table.verify(data);
	data.id = number.valueOf(data.id,0);
	data.question = data.question or "";
	data.time = number.valueOf(data.time,os.time());
	data.reply = data.reply or "";
	data.rptime = number.valueOf(data.rptime,0);
	data.status = number.valueOf(data.status,0);
	data.readed = number.valueOf(data.readed,0);

	if data.id <= 0 then 
		data = {};
	end  
	return data;
end

SuggestionDataInterface._addFeedbackData = function(self,data)
	data = self:_formatFeedbackData(data);
	if (table.getSize(data) > 0) then  
		self.m_feedbackList = table.verify(self.m_feedbackList);
		table.insert(self.m_feedbackList,1,data);
	end 
end

-------------------------------------------------------------------------------------------------------
-- @description : 发送反馈信息
SuggestionDataInterface._sendFeedback = function(self,fType,fWords,phone)
	if not(fType and fWords and phone) then 
		return;
	end 

	local param_data = {};
	param_data.appid = SuggestionParamData.getFeedbackAppid();
	param_data.game = SuggestionParamData.getFeedbackGame();
	param_data.title = "游戏问题";

	param_data.ftype = self:_getRealFType(fType);
	param_data.fwords = string.gsub(fWords, "&", "");
	local clientName = RegionConfigDataInterface.getInstance():getRegionProductName();

	dict_load(kDFQPGame);
	local gamesVersionMap = dict_get_string(kDFQPGame,"GamesVersionMap") or "";
	local userId = dict_get_int(kDFQPGame , kUserId,0);

	param_data.fcontact = string.concat(RegionConfigDataInterface.getInstance():getRegionProductName(), " | ", 
		"用户id:",userId,
		",APK版本:", _dependApkVersion,
		", 大厅版本:", kGameManager:getGameVersion(GameType.HALL),
		",各游戏版本:",gamesVersionMap,
		", 系统版本:", kClientInfo:getOSVersion(),
		", 机型:", kClientInfo:getPhoneModel(),
		", 网络类型:", kClientInfo:getNetworkName(),
		", 手机号码:", string.trim(phone)," | ");

	param_data.vip = 0;

	self.m_tempSendParamData = param_data;
	HttpModule.getInstance():execute(HttpModule.s_cmds.SendFeedback,param_data);
end

-- @description : 发送反馈回调
SuggestionDataInterface._onSendFeedbackCallBack = function(self,isSuccess,data)
    local curFeedbackId;
	if isSuccess and table.isTable(data) then
		local param_data = {};
		local fid = GetStrFromJsonTable(data.ret ,"fid","0");
		param_data.fid = fid;
		curFeedbackId = fid;
		if fid ~= 0 then
			local temp = table.verify(self.m_tempSendParamData);
			local newData = {};
			newData.question = temp.fwords or "";
			newData.time = (table.verify(data.time).__value) or os.time();
			newData.reply = "";
			newData.rptime = 0;
			newData.status = 0;
			newData.readed = 1;
			newData.id = fid;

			self:_addFeedbackData(newData);
		end 
	end

	self:notify(SuggestionDataInterface.Delegate.onSendFeedbackCallBack,isSuccess,self.m_feedbackList,curFeedbackId);
end

SuggestionDataInterface._getRealFType = function(self,typeId)
	local realTypeId = 1;
	if typeId == 1 then
		realTypeId = 10;
	elseif typeId == 2 then
		realTypeId = 11;
	elseif typeId == 3 then
		realTypeId = 2;
	elseif typeId == 4 then
		realTypeId = 4;
	end

	return realTypeId;
end
-------------------------------------------------------------------------------------------------------
-- @description : 标记所有反馈为已读
SuggestionDataInterface._markAllFeedback = function(self)
	local itemIdArr = self:getUnreadFeedbackIds();
	itemIdArr = table.verify(itemIdArr);
	for k, v in ipairs(itemIdArr) do
		self:_markFeedback(v);
	end

	self.m_unreadIdArr = {};
end

-- @description : 标记反馈为已读
SuggestionDataInterface._markFeedback = function(self,feedbackId)
	local param_data = {};
	param_data.appid = SuggestionParamData.getFeedbackAppid();
	param_data.game = SuggestionParamData.getFeedbackGame();
	param_data.deviceno = kClientInfo:getDeviceId();
	param_data.fid = feedbackId;
	param_data.solved = 1;
	HttpModule.getInstance():execute(HttpModule.s_cmds.CloseTicket,param_data);
	
	self:_markFeedbackReaded(feedbackId);
end

-- @description : 标记所有反馈为已读的回调
SuggestionDataInterface._onMarkFeedbackCallBack = function(self,isSuccess,data)
	self:notify(SuggestionDataInterface.Delegate.onMarkFeedbackCallBack,isSuccess);
end

SuggestionDataInterface._markFeedbackReaded = function(self,id)
	for k,v in pairs(self.m_unreadIdArr) do 
		if v == id then 
			table.remove(self.m_unreadIdArr,k);
			break;
		end 
	end 

	for k,v in pairs(self.m_feedbackList) do 
		if type(v) == "table" and v.id == id then 
			v.readed = 1;
		end 
	end 
end
-------------------------------------------------------------------------------------------------------
SuggestionDataInterface._isNeedRefresh = function(self)
	if not self.m_refreshTime then
		self.m_refreshTime = os.time();
		return true;
	else
		local lastRefreshTime = self.m_refreshTime;
		local interval = os.time() - lastRefreshTime;

		if (interval >= 30) then 
			if table.isEmpty(self.m_feedbackList) then
				self.m_refreshTime = os.time();
				return true;
			else 
				if interval >= 120 then
					self.m_refreshTime = os.time();
					return true;
				else 
					return false;
				end 
			end 
		else
			return false;
		end 
	end  
end 

--@override
SuggestionDataInterface.loadDictData = function(self, dict)
    self.m_feedbackList = {}; 	--反馈历史列表
	self.m_unreadIdArr = {};	--未读的反馈ID
	
	local strData = dict:getString("feedbackList");
	local listData = json.decode(strData);
	if table.isTable(listData) then
		self.m_feedbackList = listData;
	end
	
	local unreadIdArr = json.decode(dict:getString("unreadIdArr"));
	if table.isTable(unreadIdArr) then
		self.m_unreadIdArr = unreadIdArr;
	end

	local strHotline = dict.getString("hotline");
	if not string.isEmpty(strHotline) then
		self.m_hotline = strHotline;
	end
end

--@override
SuggestionDataInterface.saveDictData = function(self, dict)
	dict:setString("feedbackList", json.encode(self.m_feedbackList) or "");
	dict:setString("unreadIdArr", json.encode(self.m_unreadIdArr) or "");
	dict:setString("hotline", self:getHotline() );
end

--@override
SuggestionDataInterface.getLocalDictName = function(self)
	self.m_userId = self.m_userId or kUserInfoData:getUserId();
	return "SuggestionDataInterface" .. self.m_userId;
end
---------------------------------------------------------------------------------------------
SuggestionDataInterface.onHttpRequestCallBack = function(self,command,...)
	if SuggestionDataInterface.s_httpRequestCallBackFuncMap[command] then
     	SuggestionDataInterface.s_httpRequestCallBackFuncMap[command](self,...);
	end 
end

SuggestionDataInterface.s_httpRequestCallBackFuncMap = {
	[HttpModule.s_cmds.GetFeedback]		 	 = SuggestionDataInterface._onGetFeedbackCallBack,
	[HttpModule.s_cmds.SendFeedback]		 = SuggestionDataInterface._onSendFeedbackCallBack,	
	[HttpModule.s_cmds.CloseTicket]			 = SuggestionDataInterface._onMarkFeedbackCallBack,
};