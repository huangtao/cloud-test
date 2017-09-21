-- 点击上报至数据中心公共类
-- 调用方法: DReport.getInstance():report(eventKey, isForceUpload);

require("ubReport/ubConfig");

DReport = class();

DReport.REPORT_INTERVAL	= 90 * 1000; -- 上传间隔时间。上传无则：从第一个点击上传事件开始计时，90秒后上传一次，上传后，计时器停止，直至下一次点击
DReport.REPORT_MAX_COUNT = 50; --最大上传条数 达到自动上传

DReport.getInstance = function ( )
	if not DReport.s_instance then
		DReport.s_instance = new(DReport);
	end
	return DReport.s_instance;
end

DReport.ctor = function (self)
	self.m_keyValues = {};
	self.m_reportArray = {};
	EventDispatcher.getInstance():register(HttpModule.s_event,self,self.onHttpRequestsCallBack);
end

DReport.dtor = function ( self )
	EventDispatcher.getInstance():unregister(HttpModule.s_event,self,self.onHttpRequestsCallBack);
end

-- key: 事件id，即et_id
-- isForceReport: 是否强制上传，默认false
-- ctrlVal 为操作数值
-- isFirst 是否首次点击上报
DReport.report = function ( self, key, isForceReport, ctrlVal, isFirst )
	if not self.m_reportAnim then
		self.m_reportAnim = AnimFactory.createAnimInt(kAnimRepeat, 0, 1, DReport.REPORT_INTERVAL, -1)
		self.m_reportAnim:setDebugName("DReport|self.m_reportAnim")
		self.m_reportAnim:setEvent(self, self._reportAll)
	end

	if key then
		key = string.concat("dfqp_", key)
		local item = self:ctorParam(key, ctrlVal, isFirst)
		table.insert(self.m_keyValues, item)
	end

	if isForceReport or #self.m_keyValues >= DReport.REPORT_MAX_COUNT then
		-- 强制上传
		self:_reportAll()
	end
end

DReport.ctorParam = function(self, key, ctrlVal, isFirst)
	local param = {}
	param.et_id = key; --事件ID 必传
	param.uid = UserBaseInfoIsolater.getInstance():getUserId(); --用户ID 必传
	param.lts_at = os.time(); --事件时间戳 必传

	local hallVersion = tostring(kGameManager:getGameVersion(GameType.HALL)) --大厅版本号
	if type(ctrlVal) == "number" or type(ctrlVal) == "string" then
		if isFirst then
			param[tostring(ctrlVal)] = hallVersion
		else
			param[hallVersion] = tostring(ctrlVal)
		end
	else
		param.hallVersion = hallVersion
	end

	return param
end

-- 上传数据到D后台
DReport._reportAll = function ( self )
	for _, v in ipairs(self.m_keyValues) do
		table.insert(self.m_reportArray, v);
	end

	self.m_keyValues = {};

	if not table.isEmpty(self.m_reportArray) then
		local param = {
			data = json.encode(self.m_reportArray);
			appid = UserBaseInfoIsolater.getInstance():getAppId();
		};

		HttpModule.getInstance():execute(HttpModule.s_cmds.UploadDReport, param, false);
	end

	self:_clearReportAnim();
end

-- 上传成功回调
DReport._onFinishReportAll = function (self, isSuccess, data)
	if not isSuccess then
		return;
	end

    if data and data.result then
		self.m_reportArray = {};
		self:_clearReportAnim();
	end
end

DReport._clearReportAnim = function(self)
	delete(self.m_reportAnim);
	self.m_reportAnim = nil;
end

DReport.onHttpRequestsCallBack = function(self,command,...)
	if DReport.s_httpRequestsCallBackFuncMap[command] then
     	DReport.s_httpRequestsCallBackFuncMap[command](self,...);
	end
end

DReport.s_httpRequestsCallBackFuncMap = {
	[HttpModule.s_cmds.UploadDReport]				= DReport._onFinishReportAll;
}
