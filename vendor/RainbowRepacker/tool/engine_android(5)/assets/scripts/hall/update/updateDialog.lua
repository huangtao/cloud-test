require("common/commonGameLayer");
require("common/uiFactory");
require("hall/hallConfig");
require("common/IBaseDialog");
local updateDialog = require(HallViewPath .. "update/updateDialog")
-- update 界面属于大厅 ，暂时先放这里吧
UpdateDialog = class(IBaseDialog,false);

UpdateDialog.s_width = 670;
UpdateDialog.s_height = 253;
UpdateDialog.s_level = 15;

UpdateDialog.s_controls = 
{
	Title = 1;
	area_newVersion_desc = 3;
	descText=4;

	area_bottom_twoBtnsView = 5;
	confirmBtn = 6;
	cancelBtn = 7;
	confirmBtnText = 8;
	cancelBtnText = 9;

	area_bottom_singleBtnView = 10;
	singleConfirmBtn = 11;
	singleConfirmBtnText = 12;

	area_bottom_completeView = 13;
	completeBtn = 14;
	
	area_bottom_progressView = 15;
	progressText = 16;
	progressSlider = 17;
	CloseButton = 18;
	completeText=19;
};


UpdateDialog.s_localConfig = 
{
	bgImage = "hall/common/progress_bg_l15_r15_t15_b15.png";
	fgImage = "hall/common/progress_fg_l15_r15_t15_b15.png";
	buttonImage = "";
};


UpdateDialog.ctor = function(self, token,level,version ,desc , update_type,size)
	super(self,updateDialog,token,level);
	self:initView(version ,desc , update_type ,size);
	self:setCancelable(false);
end

UpdateDialog.initView = function(self , version , desc , update_type,size)
	self.m_root:setAlign(kAlignCenter);
	self:setLevel(UpdateDialog.s_level);
	
	self.m_ctrls = UpdateDialog.s_controls;

	self:findViewById(self.m_ctrls.descText):setText(desc or "升级新特性！");

	self.m_completeText = self:findViewById(self.m_ctrls.completeText);
	self.m_completeBtn = self:findViewById(self.m_ctrls.completeBtn);
	self.m_closeButton = self:findViewById(self.m_ctrls.CloseButton);
	self.m_area_bottom_twoBtnsView = self:findViewById(self.m_ctrls.area_bottom_twoBtnsView);
	self.m_area_bottom_singleBtnView = self:findViewById(self.m_ctrls.area_bottom_singleBtnView);
	self.m_area_bottom_progressView = self:findViewById(self.m_ctrls.area_bottom_progressView);
	self.m_area_bottom_completeView = self:findViewById(self.m_ctrls.area_bottom_completeView);


	self.m_closeButton:setVisible(update_type~=2);
	self.m_progressSlider = self:findViewById(self.m_ctrls.progressSlider);
	self.m_progressSlider:setImages(UpdateDialog.s_localConfig.bgImage,
					                UpdateDialog.s_localConfig.fgImage,
					                UpdateDialog.s_localConfig.buttonImage);
	self.m_progressSlider:setProgress(0);
    self.m_progressSlider:setButtonVisible(false);
	if update_type==2 then
		self:initsingleConfirmBtnsView(size);
	else
		self:initTwoButtonsView(size);
	end
    
	self:setEventTouch(self,UpdateDialog.onShadeBgClick);
	self:setEventDrag(self,UpdateDialog.onShadeBgClick);
end


-- UpdateDialog.show = function(version ,desc , update_type,size) --FIXME 为何不加self？
	
-- 	UpdateDialog.hide(true);
	
-- 	UpdateDialog.s_instance = new(UpdateDialog,version ,desc , update_type,size);
-- 	UpdateDialog.s_instance:addToRoot();
-- 	UpdateDialog.s_instance:setFillParent(true,true);

-- 	return UpdateDialog.s_instance;
-- end

-- UpdateDialog.hide = function(isShowing) --FIXME isShowing 有用？
-- 	if not isShowing then
-- 		HallPopupManager.getInstance():closeWindow(HallPopupManager.UpdateState);	
-- 		HallPopupManager.getInstance():popWindow();
-- 	end 
	
-- 	delete(UpdateDialog.s_instance);
-- 	UpdateDialog.s_instance = nil;
-- end


UpdateDialog.dtor = function(self)

	self.data = nil;

	self.m_okFunc = nil;
	self.m_okObj = nil;
	self.m_cancleFunc = nil;
	self.m_cancleObj = nil;

	self.m_closeFunc = nil;
	self.m_closeObj = nil;

	self.m_singleObj=nil;
	self.m_singleFunc=nil;
end

UpdateDialog.setOnClickListener = function(self,okObj, okFunc, cancleObj, cancleFunc)
	self.m_okFunc = okFunc;
	self.m_okObj = okObj;
	self.m_cancleFunc = cancleFunc;
	self.m_cancleObj = cancleObj;

end

UpdateDialog.setOnCloseListener = function(self,closeObj, closeFunc)
	self.m_closeFunc = closeFunc;
	self.m_closeObj = closeObj;
end


UpdateDialog.onShadeBgClick = function(self)
	--屏蔽作用
	-- Log.d("UpdateDialog.onShadeBgClick");
end

UpdateDialog.onSingleConfirmBtnClicked = function(self)
	
	if self.m_okObj and self.m_okFunc then
		self.m_okFunc(self.m_okObj);
	end
	-- UpdateDialog.hide();
end

UpdateDialog.onOkButtonClicked = function(self)
	if self.m_okObj and self.m_okFunc then
		self.m_okFunc(self.m_okObj);
	end
	-- UpdateDialog.hide();
end

UpdateDialog.onCancleButtonClicked = function(self)
	
	if self.m_cancleObj and self.m_cancleFunc then
		self.m_cancleFunc(self.m_cancleObj);
	end
	UpdateDialog.hide();
end

UpdateDialog.onCloseButtonClicked = function(self)
	if self.m_closeObj and self.m_closeFunc then
		self.m_closeFunc(self.m_closeObj);
	end
	UpdateDialog.hide();
end

UpdateDialog.hideCloseBtn = function(self)
	self.m_closeButton:setVisible(false);
end

UpdateDialog.initTwoButtonsView = function(self,size)
	self:reFreshView(self.m_ctrls.area_bottom_twoBtnsView);
	size = size or -1;
	local text = "更新";
	if size >= 0 then
		text=string.format("更新(%.2fM)",math.max(size/1024/1024,0.01)) or "更新";
	end 
	self:findViewById(self.m_ctrls.confirmBtnText):setText(text);
end

UpdateDialog.initsingleConfirmBtnsView = function(self,size)
	self:reFreshView(self.m_ctrls.area_bottom_singleBtnView);
	size = size or -1;
	local text = "更新";
	if size >= 0 then
		text=string.format("更新(%.2fM)",math.max(size/1024/1024,0.01)) or "更新";
	end 
	self:findViewById(self.m_ctrls.singleConfirmBtnText):setText(text);
end

UpdateDialog.initProgressView = function(self)
	self:reFreshView(self.m_ctrls.area_bottom_progressView);
end

UpdateDialog.initCompleteView = function(self)
	self:reFreshView(self.m_ctrls.area_bottom_completeView);
end

UpdateDialog.reFreshView = function(self,s_controlsID)

	local ids=
	{	
		{self.m_ctrls.area_bottom_twoBtnsView , self.m_area_bottom_twoBtnsView},
		{self.m_ctrls.area_bottom_singleBtnView, self.m_area_bottom_singleBtnView},
		{self.m_ctrls.area_bottom_progressView, self.m_area_bottom_progressView},
		{self.m_ctrls.area_bottom_completeView, self.m_area_bottom_completeView},
	};
	for k,v in pairs(ids) do
		if v[1] and v[2] then
			v[2]:setVisible(v[1]==s_controlsID);
		end
	end
end

UpdateDialog.setTexts = function(self,ctrls,texts)
	for k,v in ipairs(ctrls) do
		self:findViewById(v):setText(texts[k] or "");
	end
end

UpdateDialog.updateProgress = function(self, progress)
	Log.v("UpdateDialog.updateProgress");
	progress = progress or 0 ;
	local len = 100;
	self:findViewById(self.m_ctrls.area_bottom_progressView):setVisible(true);
	self.m_progressSlider:setProgress(progress/len);
	local text=string.format("已下载:%d%%",math.min(progress or 0,100));
	self.m_progressText = self:findViewById(self.m_ctrls.progressText);
	if self.m_progressText then
		self.m_progressText:setText(text);
		if progress == 100 then
			self.m_progressText:setText("正在验证中");
		end
	end
end

UpdateDialog.updateDownloadSuccessClick = function(self, singleObj ,singleFunc)
	Log.v("UpdateDialog.updateDownloadSuccessClick");
	self.m_completeText:setText("安    装");
	self:initCompleteView();
	self.m_singleObj=singleObj;
	self.m_singleFunc=singleFunc;
	self.m_completeBtn:setOnClick(self,UpdateDialog.onDownloadSuccess);
end

UpdateDialog.onDownloadSuccess = function(self)
	Log.v("UpdateDialog.onDownloadSuccess");
	Log.v(self.m_singleFunc and "full" or "empty");
	if self.m_singleFunc then
		self.m_singleFunc(self.m_singleObj);
	end
	UpdateDialog.hide();
end

UpdateDialog.updateDownloadFaildClick = function(self, singleObj ,singleFunc)
	Log.v("UpdateDialog.updateDownloadFaildClick");
	self.m_completeText:setText("重新下载");
	self:initCompleteView();
	self.m_closeButton:setVisible(true);
	self.m_singleObj=singleObj;
	self.m_singleFunc=singleFunc;
	self.m_completeBtn:setOnClick(self,UpdateDialog.onDownloadFailed);
end

UpdateDialog.onDownloadFailed = function(self, singleObj ,singleFunc)
	Log.v("UpdateDialog.onDownloadFailed");
	Log.v(self.m_singleFunc and "full" or "empty");
	if self.m_singleFunc then
		self.m_singleFunc(self.m_singleObj);
	end
end


UpdateDialog.s_controlConfig = 
{
	[UpdateDialog.s_controls.Title] = {"contentView" ,  "title"};
	[UpdateDialog.s_controls.area_newVersion_desc] = {"contentView" ,  "area_newVersion_desc"};
	[UpdateDialog.s_controls.descText] = {"contentView" ,  "area_newVersion_desc","descText"};

	[UpdateDialog.s_controls.area_bottom_twoBtnsView] = {"contentView" ,  "area_bottom_twoBtnsView"};
	[UpdateDialog.s_controls.confirmBtn] = {"contentView" ,  "area_bottom_twoBtnsView","confirmBtn"};
	[UpdateDialog.s_controls.cancelBtn] = {"contentView" ,  "area_bottom_twoBtnsView","cancelBtn"};
	[UpdateDialog.s_controls.confirmBtnText] = {"contentView" ,  "area_bottom_twoBtnsView","confirmBtn","confirmBtnText"};
	[UpdateDialog.s_controls.cancelBtnText] = {"contentView" ,  "area_bottom_twoBtnsView","cancelBtn","cancelBtnText"};

	[UpdateDialog.s_controls.area_bottom_singleBtnView] = {"contentView" ,  "area_bottom_singleBtnView"};
	[UpdateDialog.s_controls.singleConfirmBtn] = {"contentView" ,  "area_bottom_singleBtnView","singleConfirmBtn"};
	[UpdateDialog.s_controls.singleConfirmBtnText] = {"contentView" ,  "area_bottom_singleBtnView","singleConfirmBtn","singleConfirmBtnText"};

	[UpdateDialog.s_controls.area_bottom_completeView] = {"contentView" ,  "area_bottom_completeView"};
	[UpdateDialog.s_controls.completeBtn] = {"contentView" ,  "area_bottom_completeView","completeBtn"};
	[UpdateDialog.s_controls.completeText] = {"contentView",  "area_bottom_completeView","completeBtn","completeText"};

	[UpdateDialog.s_controls.area_bottom_progressView] = {"contentView" ,"area_bottom_progressView" };
	[UpdateDialog.s_controls.progressText] = {"contentView" ,"area_bottom_progressView" , "progressText"};
	[UpdateDialog.s_controls.progressSlider] = {"contentView" ,"area_bottom_progressView" , "progressSlider"};
	[UpdateDialog.s_controls.CloseButton] = {"contentView" ,  "closeBtn"};
};

UpdateDialog.s_controlFuncMap = 
{
	[UpdateDialog.s_controls.confirmBtn] = UpdateDialog.onOkButtonClicked;
	[UpdateDialog.s_controls.cancelBtn] = UpdateDialog.onCancleButtonClicked;
	[UpdateDialog.s_controls.singleConfirmBtn] = UpdateDialog.onSingleConfirmBtnClicked;
	[UpdateDialog.s_controls.CloseButton]= UpdateDialog.onCloseButtonClicked;
};