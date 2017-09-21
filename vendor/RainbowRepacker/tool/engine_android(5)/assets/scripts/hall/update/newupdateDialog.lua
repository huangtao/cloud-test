require("common/commonGameLayer");
require("util/StringLib");
local updateDialogView = require("view/kScreen_1280_800/hall/update/updateDialogView");

--[[
	更新弹框，比如在自建场，比赛场这些地方
]]

NewUpdateDialog = class(IBaseDialog,false);

NewUpdateDialog.s_controls =
{	
	maskView = 1;
	updateContent = 3;
	updateText = 4;
	updateSlider = 5;
};

NewUpdateDialog.s_updatedGame = EventDispatcher.getInstance():getUserEvent();

NewUpdateDialog.ctor = function(self,token,level,gameid)
	super(self,updateDialogView,token,level);
	self.m_ctrls = NewUpdateDialog.s_controls;
	self.gameid = gameid;
	self:init();
end



NewUpdateDialog.init = function(self)
	self.updateContent = self:findViewById(self.m_ctrls.updateContent);
	self.updateText = self:findViewById(self.m_ctrls.updateText);
	self.updateSlider = self:findViewById(self.m_ctrls.updateSlider);
	self.updateSlider:setImages("hall/common/progress_bg_l15_r15_t15_b15.png",
						  "hall/common/progress_fg_l15_r15_t15_b15.png",
						  "");
	self.updateSlider:setProgress(0);
	self.updateSlider:setButtonVisible(false);

	UpdateMgr.getInstance():registDownloadListener(self,self.onUpdateDownloadListener);
	UpdateMgr.getInstance():registDownloadProgressListener(self,self.onUpdateGameDownloadProgressListener);
	UpdateMgr.getInstance():updateGame(self.gameid);
    self:setEventTouch(self,NewUpdateDialog.onShadeBgClick);
	self:setEventDrag(self,NewUpdateDialog.onShadeBgClick);
end


NewUpdateDialog.dtor = function (self)
    UpdateMgr.getInstance():unRegistDownloadListener();
    UpdateMgr.getInstance():unRegistDownloadProgdressListener();
end


NewUpdateDialog.onShadeBgClick = function(self)
	--屏蔽作用
	-- Log.d("NewUpdateDialog.onShadeBgClick");
end


NewUpdateDialog.onUpdateDownloadListener = function(self,data,isSuccess)
	if not UpdateMgr.getInstance():hasUpdateTask() then
    	UpdateMgr.getInstance():unRegistDownloadListener();
		UpdateMgr.getInstance():unRegistDownloadProgdressListener();
	end

	UpdateMgr.getInstance():installLua(false);
	EventDispatcher.getInstance():dispatch(NewUpdateDialog.s_updatedGame,self.gameid);
	NewUpdateDialog.hide();
end

NewUpdateDialog.onUpdateGameDownloadProgressListener = function(self,data,progress)
	--EventDispatcher.getInstance():dispatch(DownloadDialog.s_eventGameDownloadProgress,data,progress);
	self:updateProgress(progress);
end

NewUpdateDialog.updateProgress = function(self,progress)

	progress = progress or 0;
	self.updateSlider:setProgress(progress/100);
	progress = math.floor(progress);
	self.updateText:setText("正在更新中"..progress.."%");
end

---------------------------------------------------------------------------

NewUpdateDialog.s_controlConfig =
{
	[NewUpdateDialog.s_controls.maskView] = {"maskView"};
	[NewUpdateDialog.s_controls.updateContent]= {"contentView","updateContent"};
	[NewUpdateDialog.s_controls.updateText] = {"contentView","updateText"};
	[NewUpdateDialog.s_controls.updateSlider] = {"contentView","updateSlider"};
};