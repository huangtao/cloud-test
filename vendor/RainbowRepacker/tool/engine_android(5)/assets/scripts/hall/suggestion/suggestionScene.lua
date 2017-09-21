require("common/loadingView");
require("hall/suggestion/widget/historySuggestionListAdapter");
require("hall/suggestion/logic/suggestionLogic");

local SuggestionScene = class(CommonScene);

SuggestionScene.s_feedbackDescription = {
	[1]	= "请详细描述登录遇到的问题，失败提示信息，或者上传截图。方便客服为您处理。",
	[2] = "请描述您充值遇到的问题，失败提示信息，或者上传截图。请留下您的联系电话便于客服及时处理您的问题。",
	[3] = "请详细描述您遇到的问题，"..tostring(RegionConfigDataInterface.getInstance():getSuggestionTimeText()).."和操作，或者上传截图。方便客服为您处理。",
	[4] = "如对游戏有任何建议都可提交，建议被采纳会有额外奖励。",
	[5] = "留下联系方式，方便客服联系您",
};

local h_index = 0;
local getIndex = function(self)
	h_index = h_index + 1;
	return h_index;
end

SuggestionScene.s_controls = {
	backBtn 				= getIndex();
	pb_radiogroup 			= getIndex();
	pb_login 				= getIndex();
	pb_gold 				= getIndex();
	pb_game 				= getIndex();
	pb_other 				= getIndex();
	pb_editText 			= getIndex();
	commitBtn 				= getIndex();
	historySuggestionList 	= getIndex();
	phone_editTxt_bg 		= getIndex();
	phone_editTxt 			= getIndex();
	chooseImgBtn 			= getIndex();
	previewImg				= getIndex();
	hotlineBtn				= getIndex();
	hotlineNumber			= getIndex();
	suggestionPhone 		= getIndex();
	img_line				= getIndex();
};

SuggestionScene.ctor = function(self,viewConfig,control)
	self.m_controller = control;
	self.m_ctrl = SuggestionScene.s_controls;
	SuggestionDataInterface.getInstance():setObserver(self);

	self:_init();
end

SuggestionScene.resume = function (self)
	CommonScene.resume(self);
	
	self:_getFeedbackInfo(); -- 请求历史反馈记录
end

SuggestionScene.pause = function(self)
	CommonScene.pause(self);
	LoadingView.getInstance():hidden();
end

SuggestionScene.dtor = function(self)
	SuggestionDataInterface.getInstance():clearObserver(self);
	delete(self.m_suggestionLogic);
	self.m_suggestionLogic = nil;
end
------------------------------------------------------------------------------------------------
--返回键
SuggestionScene.onBackBtnClick = function(self)
	self:requestCtrlCmd(SuggestionController.s_cmds.goBack);
end

--提交按钮
SuggestionScene.onCommitBtnClick = function(self)
	self:_sendFeedBackInfo();
end

SuggestionScene.onRadioGroupChange = function(self,curIndex,lastIndex)
	local scroller = self.pbContentCtrl:getScroller();
	if scroller then 
		scroller:setOffset(0);
	end
	local content = self.pbContentCtrl:getText();
	if string.len(string.trim(content)) <= 0 then 
		local strDescription = SuggestionScene.s_feedbackDescription[curIndex];
		self.pbContentCtrl:setText("");
		self.pbContentCtrl:setHintText(strDescription,215,171,127);
		self.m_curFType = curIndex;
	end
end

SuggestionScene.onPbContentChange = function(self)
	local str = self.pbContentCtrl:getText();
end

SuggestionScene.onChooseImgBtnClick = function(self)
	self:_requestChooseImage();
end
------------------------------------------------------------------------------------------------
SuggestionScene._init = function(self)
	self.m_suggestionLogic = new(SuggestionLogic,self);

	local defaultPbType = 3;
	self.m_curFType = defaultPbType;
	self:findViewById(self.m_ctrl.pb_radiogroup):setSelected(defaultPbType);

	self.pbContentCtrl = self:findViewById(self.m_ctrl.pb_editText);
	self.pbContentCtrl:setBackgroundColor("#FFFFFF");
	self.pbContentCtrl:setHintText(SuggestionScene.s_feedbackDescription[defaultPbType],215,171,127);
	self.pbContentCtrl:setScrollBarWidth(0);
	self.m_phone_editTxt = self:findViewById(self.m_ctrl.phone_editTxt);
	self.m_phone_editTxt:setHintText(SuggestionScene.s_feedbackDescription[5], 215,171,127);
	if System.getPlatform() == kPlatformAndroid then
		self.m_phone_editTxt:setInputMode(kEditBoxInputModeNumeric);
	else
		self.m_phone_editTxt:setInputModeEx(kEditBoxInputModePhoneNumber);
	end
    self.m_phone_editTxt:setBackgroundColor("#FFFFFF");

	self.m_hotline = self:findViewById(self.m_ctrl.hotlineNumber);
	self.m_hotline:setText(SuggestionDataInterface.getInstance():getHotline());
	self:__initUnderline();
	self.listview = self:findViewById(self.s_controls.historySuggestionList);

	self.m_previewImg = self:findViewById(self.m_ctrl.previewImg);
	self:_displayPreviewImage(false);

	self:findViewById(self.m_ctrl.suggestionPhone):setVisible(RegionConfigDataInterface.getInstance():getShowSuggestionPhoneTextFlag());
end

--改变underline的宽度。
SuggestionScene.__initUnderline = function(self)
    local textWidth = self.m_hotline.m_res:getWidth();
    self:findViewById(self.m_ctrl.img_line):setSize(textWidth,nil);
end

SuggestionScene.handleSuggestionLogicCmd = function(self,cmd,...)
	if self.m_suggestionLogic then 
		self.m_suggestionLogic:handleCmd(cmd,...);
	end 
end

SuggestionScene._getFeedbackInfo = function(self)
	--LoadingView.getInstance():showText("获取反馈历史记录...",0,215);

	local feedbackList = SuggestionDataInterface.getInstance():getFeedbackList();
	if not table.isEmpty(feedbackList) then 
		self:onGetFeedbackCallBack(true,feedbackList);
	end 
end

-- @description : 获取反馈历史记录回调 
SuggestionScene.onGetFeedbackCallBack = function(self,isSuccess,data)
    --LoadingView.getInstance():hidden();
	if isSuccess then
		self:_updateSuggestionListView(data);
		self:_requestMarkAllFeedback();
	else
    	Toast.getInstance():showText(kTextGetInformationError,50,30,kAlignLeft,"",24,255,255,255);
    end
end

SuggestionScene._requestMarkAllFeedback = function(self)
	SuggestionDataInterface.getInstance():requestMarkAllFeedback();
end

-- @description : 评论回复
SuggestionScene.onMarkFeedbackCallBack = function(self,isSuccess)
	LoadingView.getInstance():hidden();
	if not isSuccess then
		Toast.getInstance():showText("处理失败,请重试！",50,30,kAlignLeft,"",24,255,255,255);
	end
end

SuggestionScene._sendFeedBackInfo = function(self)
	local fwords = self.pbContentCtrl:getText();
	local phoneTxt = self.m_phone_editTxt:getText();

	if not fwords or string.trim(fwords)=="" then
		Toast.getInstance():showText("亲，请输入反馈内容~~",50,30,kAlignLeft,"",24,255,255,255);
		return;
	else
		local resultStr,bCount = ToolKit.utf8_substring(tostring(fwords),1,12);
		if bCount > 90 then
			Toast.getInstance():showText("亲，不能超过90个字符哦~~",50,30,kAlignLeft,"",24,255,255,255);
			return;
		end
	end

	if self:_checkPhone() then
		return;
	end
	LoadingView.getInstance():showText("提交中...");

	SuggestionDataInterface.getInstance():requestSendFeedback(self.m_curFType,fwords,phoneTxt);
end

-- @description : 发送反馈回调
SuggestionScene.onSendFeedbackCallBack = function(self,isSuccess,data,curFeedbackId)
	LoadingView.getInstance():hidden();
	if isSuccess then
		self:_updateSuggestionListView(data);
		
        self.pbContentCtrl:setText("");
		local index = self:findViewById(self.m_ctrl.pb_radiogroup):getResult();
        self.pbContentCtrl:setHintText(SuggestionScene.s_feedbackDescription[index or 1],215,171,127);
	    
        self.m_phone_editTxt:setText("");
	    self.m_phone_editTxt:setHintText(SuggestionScene.s_feedbackDescription[5],215,171,127);

	    self:_requestUploadFeedbackImg(curFeedbackId);
	else
		Toast.getInstance():showText("提交失败，请重试！",50,30,kAlignLeft,"",24,255,255,255);
	end
end

-- @description : 验证手机
SuggestionScene._checkPhone = function(self)
	local telStr = string.trim(self.m_phone_editTxt:getText());
	if telStr ~= "" then
		local n = tonumber(telStr);
		if not n then
			local msg = "请您输入数字";
			Toast.getInstance():showText(msg, 50, 30, kAliginCenter, "", 24, 255, 255, 255);
			return true;
		end

		if string.len(telStr) > 11  then
			local msg = "请您输入正确的手机号或QQ号";
			Toast.getInstance():showText(msg, 50, 30, kAliginCenter, "", 24, 255, 255, 255);
		 	return true;
		end
	end

	return false;
end

SuggestionScene._updateSuggestionListView = function(self,data)
	data = table.verify(data);
	self.m_data = data;
	if #self.m_data > 0 then
		if not self.m_suggestionListAdapter then 
			self.m_suggestionListAdapter = new(SuggestionListAdapter, self.m_data, self);--数据缓存器
			self.listview:setAdapter(self.m_suggestionListAdapter);
			self.listview:setScrollBarWidth(2);								--滚动条宽带，小于1不显示滚动条
			self.listview:setMaxClickOffset(5);								--设置点击范围，即当手指按下和松开时的偏移小于offset时响应子条目点击事件,默认为5
		else 
			self.m_suggestionListAdapter:changeData(self.m_data);
		end

		for i=1,#self.m_data do
			self.m_suggestionListAdapter:updateData(i,self.m_data[i]);
		end
	else 
		self.listview:setAdapter(nil);
		self.m_suggestionListAdapter = nil;
	end 	
end

SuggestionScene._requestChooseImage = function(self)
	self:handleSuggestionLogicCmd(SuggestionLogic.s_cmds.RequestChooseImage);
end

-- @description : 更新预览图
SuggestionScene.onChooseImageCallback = function(self,isSuccess,file)
	if isSuccess then 
		self.m_previewImg:setFile(file);
	end 
	self:_displayPreviewImage(isSuccess);
end

-- @description 显示预览图
SuggestionScene._displayPreviewImage = function(self,visible)
	self.m_previewImg:setVisible(visible);

	local width = visible and 650 or 730;
	self:findViewById(self.m_ctrl.phone_editTxt_bg):setSize(width,nil);
	self:findViewById(self.m_ctrl.phone_editTxt):setSize(width-60,nil);
end

-- @description 上传图片
SuggestionScene._requestUploadFeedbackImg = function(self,feedbackId)
	self:handleSuggestionLogicCmd(SuggestionLogic.s_cmds.RequestUploadFeedbackImg,feedbackId);
end

SuggestionScene.onUploadFeedbackImgCallback = function(self,isSuccess)
	local msg = isSuccess and "上传图片成功" or "上传图片失败";
	Toast.getInstance():showText(msg,50,30,kAlginLeft,"",26,255,255,255);
	self:_displayPreviewImage(false);
end

SuggestionScene.onHotlineBtnClick = function(self)
	local platformIOS = "ios";
	local platform = sys_get_string("platform") or "";

	local messageText = "是否拨打客服电话 "..SuggestionDataInterface.getInstance():getHotline().." ？";
	MessageBox.show(
		GameString.get("messageBoxTitle"),
		messageText,
		GameString.get("messageBoxOkBtnName"),
		GameString.get("messageBoxCancleBtnName"),
		false,
		self,
		self._callHotline
	);
end

SuggestionScene._callHotline = function(self)
	HallDataInterface.getInstance():callHotline();
end

SuggestionScene.s_controlConfig = 
{
	[SuggestionScene.s_controls.backBtn] = {"background", "main_bg", "backbtn"};
	
	[SuggestionScene.s_controls.pb_radiogroup] = {"background", "contentView", "questionView","problem_type"};
	[SuggestionScene.s_controls.pb_login] = {"background", "contentView", "questionView","problem_type","pb_login"};
	[SuggestionScene.s_controls.pb_gold] = {"background", "contentView", "questionView","problem_type","pb_gold"};
	[SuggestionScene.s_controls.pb_game] = {"background", "contentView", "questionView","problem_type","pb_game"};
	[SuggestionScene.s_controls.pb_other] = {"background", "contentView", "questionView","problem_type","pb_other"};

	[SuggestionScene.s_controls.pb_editText] = {"background", "contentView", "questionView","editView","suggestion_editor","ctrl_editor"};

	[SuggestionScene.s_controls.commitBtn] = {"background", "contentView", "questionView","phoneEditView","ctrl_commitbtn"};
	[SuggestionScene.s_controls.historySuggestionList] = {"background", "contentView", "bottom_bg", "suggestionList"};
	[SuggestionScene.s_controls.phone_editTxt_bg] = {"background", "contentView", "questionView", "phoneEditView", "suggestion_editor"};
	[SuggestionScene.s_controls.phone_editTxt] = {"background", "contentView", "questionView", "phoneEditView", "suggestion_editor", "phone_ctrl_editor"},
	[SuggestionScene.s_controls.chooseImgBtn]	= {"background", "contentView", "questionView","phoneEditView","uploadImgBtn"};
	[SuggestionScene.s_controls.previewImg]	= {"background", "contentView", "questionView","phoneEditView","previewImg"};
	[SuggestionScene.s_controls.hotlineBtn]	= {"background", "main_bg", "txt_tel","btn_hotline"};
	[SuggestionScene.s_controls.hotlineNumber]	= {"background", "main_bg", "txt_tel","btn_hotline","txt_hotline"};
	[SuggestionScene.s_controls.suggestionPhone]	= {"background", "main_bg", "txt_tel"};
	[SuggestionScene.s_controls.img_line]	= {"background", "main_bg", "txt_tel","btn_hotline","txt_hotline","img_line"};

};

SuggestionScene.s_controlFuncMap = 
{
	[SuggestionScene.s_controls.backBtn] 		= SuggestionScene.onBackBtnClick;
	[SuggestionScene.s_controls.commitBtn] 		= SuggestionScene.onCommitBtnClick;

	[SuggestionScene.s_controls.pb_radiogroup] 	= SuggestionScene.onRadioGroupChange;
	[SuggestionScene.s_controls.pb_editText] 	= SuggestionScene.onPbContentChange;

	[SuggestionScene.s_controls.chooseImgBtn]	= SuggestionScene.onChooseImgBtnClick;

	[SuggestionScene.s_controls.hotlineBtn]		= SuggestionScene.onHotlineBtnClick;
};

return SuggestionScene;