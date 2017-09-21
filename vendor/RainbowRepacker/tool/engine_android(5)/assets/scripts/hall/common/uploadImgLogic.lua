require("core/object");
require("core/eventDispatcher");
require("core/system");
require("common/nativeEvent");
require("ubReport/ubReport");
require("netWork/ServerConfig");
require("util/log");
require("common/httpModule");
require("common/commonLogic")

UploadImgLogic = class(CommonLogic);

UploadImgLogic.s_event = EventDispatcher.getInstance():getUserEvent();
UploadImgLogic.s_imagesPath = System.getStorageImagePath();

UploadImgLogic.Delegate = {
	onUploadHeadImageCallback = "onUploadHeadImageCallback";
    onUploadFeedbackImgCallback = "onUploadFeedbackImgCallback";
	onChooseImageCallback = "onChooseImageCallback";
};

UploadImgLogic.ctor = function(self)
	EventDispatcher.getInstance():register(Event.Call,self,self.onNativeEvent);
end 

UploadImgLogic.dtor = function(self)
	EventDispatcher.getInstance():unregister(Event.Call,self,self.onNativeEvent);
end

-------------------------------------------------------------------------------------------------------
UploadImgLogic.startUploadHeadImage = function(self)
	local info = {};
	info.app = string.concat(kClientInfo:getAppId() , "");
	info.action = "user.upicon";
	info.ssid = kUserInfoData:getSsid();
	info.url = ServerConfig.getInstance():getHostUrl();
	info.imagePath = UploadImgLogic.s_imagesPath;
    info.upLoadFileCallBack = "UploadHeadImage"
	local param_data = json.encode(info);

	self:_log("startUploadHeadImage ===> info = ",info);
	NativeEvent.getInstance():UploadHeadImage(param_data);
end

UploadImgLogic.onUploadHeadImageCallback = function(self, status, jsonTable)
	Log.v("onUploadHeadImageCallback ===> status = ",status,"jsonTable = ",jsonTable);
	if System.getPlatform() == kPlatformIOS then
		self:onUploadImageCallbackIOS(status,jsonTable);
		return;
	end

	if not status then
		self:_log("onUploadHeadImageCallback ===>Failed status is nil ");
		self:_dispatchUploadHeadResult(false);
	else
		if not jsonTable then
			self:_log("onUploadHeadImageCallback ===>Failed jsonTable is nil");
			self:_dispatchUploadHeadResult(false);
			return;
		end
		
		local imgName = GetStrFromJsonTable(jsonTable,"Name");
		local info = GetStrFromJsonTable(jsonTable,"Info");
		if info then
			local infoTable = json.decode(info);
			if not table.isTable(infoTable) then 
				self:_log("onUploadHeadImageCallback ===>Failed  jsonTable.Info is not a table");
				self:_dispatchUploadHeadResult(false);
				return; 
			end
			if not table.isTable(infoTable.result) then 
				self:_log("onUploadHeadImageCallback ===>Failed jsonTable.Info.result is not a table");
				self:_dispatchUploadHeadResult(false);
				return; 
			end
			local picInfo = infoTable.result;--是否操作成功 0:失败 成功:icon小图，icon_big大图	
			local avatar_s = picInfo.icon or "";
			local avatar_b = picInfo.icon_big or "";				

			kUserInfoData:setAvatar_s(avatar_s);
			kUserInfoData:setAvatar_b(avatar_b);

			local filePath = UploadImgLogic.s_imagesPath;
			local srcFile = filePath..imgName;
			local name = string.concat(md5_string(avatar_b) , ".png");
			local destFile = string.concat(filePath, name);
			System.moveFile(srcFile,destFile);
			System.removeFile(srcFile);

			self:_log("onUploadHeadImageCallback ===>Successed");
			self:_dispatchUploadHeadResult(true);
		end
	end
end 

--ios上传头像
UploadImgLogic.onUploadImageCallbackIOS = function(self,status,jsonTable)
	if not table.isTable(jsonTable) then 
		self:_log("onUploadImageCallbackIOS ===>Failed jsonTable is not a table");
		self:_dispatchUploadHeadResult(false);
		return; 
	end
	if not table.isTable(jsonTable.result) then 
		self:_log("onUploadImageCallbackIOS ===>Failed jsonTable.result is not a table");
		self:_dispatchUploadHeadResult(false);
		return; 
	end

	local picInfo = jsonTable.result;--是否操作成功 0:失败 成功:icon小图，icon_big大图	
	local avatar_s = GetStrFromJsonTable(picInfo,"icon");
	local avatar_b = GetStrFromJsonTable(picInfo,"icon_big");			
	kUserInfoData:setAvatar_s(avatar_s);
	kUserInfoData:setAvatar_b(avatar_b);

	local imagesPath = UploadImgLogic.s_imagesPath;
	local name = string.concat(md5_string(avatar_b) , ".png");
	local filePath = string.concat(imagesPath, name);
	TextureCache.instance():remove(filePath); --清除掉纹理缓存，防止相同类型的不同图片加载错乱

	self:_log("onUploadImageCallbackIOS ===>Successed");
	self:_dispatchUploadHeadResult(true);
end

-------------------------------------------------------------------------------------------------------
-- @description : 上传图片
UploadImgLogic.startUploadFeedbackImage = function(self,fileName,feedbackParam)
	self:_log("startUploadFeedbackImage ===> fileName = ",fileName);
	if fileName then 
		local info = {};
		info.api = HttpModule.postOrganizerData("Feedback.mSendFeedBackPicture",feedbackParam);
		info.uploadFileName = fileName;
		info.imagePath = UploadImgLogic.s_imagesPath;
		local infoStr = json.encode(info);

		self:_log("startUploadFeedbackImage ===> info = ",info);
		NativeEvent.getInstance():uploadFeedbackImage(infoStr);
	end 
end

-- @description 上传反馈图片回调
UploadImgLogic.onUploadFeedbackImgCallback = function(self,status,jsonTable)
	self:_log("onUploadFeedbackImgCallback ===>status = ",status,"jsonTable = ",jsonTable);
	local isSuccess = false;
	if not (status and jsonTable)then
		isSuccess = false;
	else
		local isSave = GetNumFromJsonTable(jsonTable, "isSave",0);
		isSuccess = isSave == 1;
	end

	self:_log("onUploadFeedbackImgCallback ===>",isSuccess);

	self:execDelegate(UploadImgLogic.Delegate.onUploadFeedbackImgCallback,isSuccess);
end
-------------------------------------------------------------------------------------------------------
-- @description : 选择图片
UploadImgLogic.startChooseImage = function(self)
	if self.m_chooseImageFile then
		TextureCache.instance():remove(self.m_chooseImageFile); --清除掉纹理缓存，防止相同类型的不同图片加载错乱
	end

	local aspectX = System.getScreenScaleWidth() / System.getScreenScaleHeight(); -- 裁剪比例
	local aspectY = 1;
	local info = {};
	info.imagePath = UploadImgLogic.s_imagesPath;
	info.isNeedCamera = false; -- 是否拍照
	info.isReturnData = true; -- 是否返回数据
	info.aspectX = aspectX; -- 裁剪比例
	info.aspectY = aspectY;
	info.outputX = System.getScreenScaleWidth(); -- 输出大小
	info.outputY = System.getScreenScaleHeight();
	info.isCrop = true; -- 是否裁剪
  	local infoStr = json.encode(info)

  	self:_log("startChooseImage ===> info = ",info);
	NativeEvent.getInstance():chooseImage(infoStr);
end

UploadImgLogic.onChooseImageCallback = function(self,status,jsonTable)
	self:_log("onChooseImageCallback ===> status = ",status,"jsonTable = ",jsonTable);
	local isSuccess = false;
	local chooseImageFile;
	if status and not table.isEmpty(jsonTable) then 
		isSuccess = true;
		local fileName = GetStrFromJsonTable(jsonTable,"Name","");

		if fileName ~= "" then 
			chooseImageFile = fileName;
			self.m_chooseImageFile = chooseImageFile;
		end 
	end
	self:_log("onChooseImageCallback ===>",isSuccess,"chooseImageFile = ",chooseImageFile);
	self:execDelegate(UploadImgLogic.Delegate.onChooseImageCallback,isSuccess,chooseImageFile);
end

-------------------------------------------------------------------------------------------------------
UploadImgLogic.ubReport = function(self, actionId, param)
	UBReport.getInstance():report(actionId, param);
end 

UploadImgLogic._log = function(self,...)
	Log.v("UploadImgLogic ",...);
end

UploadImgLogic._dispatchUploadHeadResult = function(self,isSuccess)
	self:execDelegate(UploadImgLogic.Delegate.onUploadHeadImageCallback,isSuccess);
end 

UploadImgLogic.onNativeEvent = function(self,param,...)
	if self.s_nativeEventFuncMap[param] then
		self.s_nativeEventFuncMap[param](self,...);
	end
end

UploadImgLogic.s_nativeEventFuncMap = {
	["UploadHeadImage"] 			 = UploadImgLogic.onUploadHeadImageCallback;
	["chooseImage"]					 = UploadImgLogic.onChooseImageCallback;
    ["uploadFeedbackImage"]			 = UploadImgLogic.onUploadFeedbackImgCallback;
};