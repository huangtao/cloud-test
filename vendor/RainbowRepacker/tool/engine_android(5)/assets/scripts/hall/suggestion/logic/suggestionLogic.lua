require("common/commonLogic");
require("hall/suggestion/data/suggestionParamData");
require("hall/common/uploadImgLogic");

SuggestionLogic = class(CommonLogic);

SuggestionLogic.Delegate = {
	onChooseImageCallback = "onChooseImageCallback";
	onUploadFeedbackImgCallback = "onUploadFeedbackImgCallback";
};

local h_index = 0;
local getIndex = function(self)
	h_index = h_index + 1;
	return h_index;
end

SuggestionLogic.s_cmds = 
{
	RequestChooseImage = getIndex();
	RequestUploadFeedbackImg = getIndex();
};

SuggestionLogic.ctor = function(self)
	self.m_uploadImgLogic = new(UploadImgLogic,self);
end

SuggestionLogic.dtor = function(self)
	delete(self.m_uploadImgLogic);
	self.m_uploadImgLogic = nil;
end

-- @description : 选择图片
SuggestionLogic.requestChooseImage = function(self)
	self.m_uploadImgLogic:startChooseImage();
end

SuggestionLogic.onChooseImageCallback = function(self,isSuccess,fileName)
	if isSuccess and fileName ~= "" then 
		self.m_chooseImgFile = fileName;
	end 
	self:execDelegate(SuggestionLogic.Delegate.onChooseImageCallback,isSuccess,self.m_chooseImgFile);
end

-- @description : 上传图片
SuggestionLogic.requestUploadFeedbackImg = function(self,feedbackId)
	if feedbackId and self.m_chooseImgFile then
		local apiInfo = {};
		apiInfo.fid = feedbackId;
		apiInfo.appid = SuggestionParamData.getFeedbackAppid();
		apiInfo.game = SuggestionParamData.getFeedbackGame();
		self.m_uploadImgLogic:startUploadFeedbackImage(self.m_chooseImgFile,apiInfo);
	end 
end

-- @description 上传反馈图片回调
SuggestionLogic.onUploadFeedbackImgCallback = function(self,isSuccess)
	self.m_chooseImgFile = nil;
	self:execDelegate(SuggestionLogic.Delegate.onUploadFeedbackImgCallback,isSuccess);
end
---------------------------------------------------------------------------------------------------------


SuggestionLogic.s_cmdConfig = 
{
    [SuggestionLogic.s_cmds.RequestChooseImage] 		= SuggestionLogic.requestChooseImage;
    [SuggestionLogic.s_cmds.RequestUploadFeedbackImg] 	= SuggestionLogic.requestUploadFeedbackImg;
};
