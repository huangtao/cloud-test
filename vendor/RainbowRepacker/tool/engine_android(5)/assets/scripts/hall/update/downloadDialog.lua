require("common/commonGameLayer");
require("util/StringLib");
local downloadDialog = require("view/kScreen_1280_800/hall/update/downloadDialog");
require("common/IBaseDialog");


--[[
	子游戏下载弹框，如大厅游戏下载，更多游戏等
]]

DownloadDialog = class(IBaseDialog,false);

DownloadDialog.strings_zh = 
{
	["topText"] = "%s资源下载";
	["tipText"]	= "进入%s前需要先下载资源文件(大小为%.2fM),您现在就下载资源文件包吗?";
	["downloadingText"]	= "资源下载中";
}

DownloadDialog.s_downloadedGame = EventDispatcher.getInstance():getUserEvent();

DownloadDialog.s_controls = 
{
	bg = 1;
	topText = 2;
	View1 = 3;
	tipText = 4;
	View2 = 5;
	cancelBtn = 6;
	okBtn = 7;
	View3 = 8;
	percent = 9;
	slider = 10;
	View4 = 11;
	cancelBtn2 = 12; 
	maskView =14;

	View5=15;
	reDownloadBtn=16;
	cancelBtn3=17;
};

DownloadDialog.ctor = function(self,token,level,data)
	super(self,downloadDialog,token,level);
	self.m_ctrls = DownloadDialog.s_controls;
	self.data = table.verify(data); 
	self:init();

	Log.v("DownloadDialog.ctor",self.data);
end

DownloadDialog.dtor = function(self)
	UpdateMgr.getInstance():unRegistDownloadListener();
	UpdateMgr.getInstance():unRegistDownloadProgdressListener();
    UpdateMgr.getInstance():cancelAllHttpDownload();
	self.data = nil;
end

DownloadDialog.init = function(self)
	
	self.mView_topText=self:findViewById(self.m_ctrls.topText);
	self.mView_tipText=self:findViewById(self.m_ctrls.tipText);
	self.mView_View1=self:findViewById(self.m_ctrls.View1);
	self.mView_View2=self:findViewById(self.m_ctrls.View2);
	self.mView_View3=self:findViewById(self.m_ctrls.View3);
	self.mView_View4=self:findViewById(self.m_ctrls.View4);
	self.mView_View5=self:findViewById(self.m_ctrls.View5);
	self.mView_slider=self:findViewById(self.m_ctrls.slider);
	self.mView_percent=self:findViewById(self.m_ctrls.percent);

	local name = self.data["name"] or "";
	self.mView_topText:setText(string.format(DownloadDialog.strings_zh.topText,name));
	local size=self.data["size"] or 0;
	self.mView_tipText:setText(string.format(DownloadDialog.strings_zh.tipText,name,math.max(size/1024/1024,0.01)));

	self.mView_View1:setVisible(true);--下载内容提示区域
	self.mView_View2:setVisible(true);--两个按钮区域
	self.mView_View3:setVisible(false);--进度
	self.mView_View4:setVisible(false);--取消按钮
	self.mView_View5:setVisible(false);--重新下载

	self:setEventTouch(self,self.onShadeBgClick);
	self:setEventDrag(self,self.onShadeBgClick);

end

DownloadDialog.onCancelClick = function(self)
	DownloadDialog.hide();
end

DownloadDialog.onCancelTaskClick = function(self)
	UpdateMgr.getInstance():unRegistDownloadListener();
	UpdateMgr.getInstance():unRegistDownloadProgdressListener();
	UpdateMgr.getInstance():cancelAllHttpDownload();
	DownloadDialog.hide();
end

DownloadDialog.onOkClick = function(self)
	Log.d("----------------DownloadDialog.onOkClick---------------------------------");
	
	self.mView_topText:setText(DownloadDialog.strings_zh.downloadingText);
	self.mView_slider:setFgFillBg(15,15,15,15,5);
	self.mView_slider:setImages("hall/common/progress_bg_l15_r15_t15_b15.png","hall/common/progress_fg2_l15_r15_t15_b15.png");
	self.mView_slider:setProgress(0);
	self.mView_slider:setButtonVisible(false);
	self.mView_percent:setText("0%");

	self.mView_View1:setVisible(false);
	self.mView_View2:setVisible(false);
	self.mView_View3:setVisible(true);
	self.mView_View4:setVisible(true);
	self.mView_View5:setVisible(false);

	--点击确定
	UpdateMgr.getInstance():registDownloadListener(self,self.onDownloadListener);
	UpdateMgr.getInstance():registDownloadProgressListener(self,self.onDownloadProgressListener);
	UpdateMgr.getInstance():downloadGame(self.data);
end


DownloadDialog.showReDownloadView = function(self)
	Log.v("----------------DownloadDialog.showReDownloadView---------------------------------");

	self.mView_topText:setText(string.format(DownloadDialog.strings_zh.topText,self.data["name"] or ""));
	local size=self.data["size"] or 0;
	self.mView_tipText:setText(string.format(DownloadDialog.strings_zh.tipText,self.data["name"] or "",math.max(size/1024/1024,0.01)));

	self.mView_View1:setVisible(true);
	self.mView_View2:setVisible(false);
	self.mView_View3:setVisible(false);
	self.mView_View4:setVisible(false);
	self.mView_View5:setVisible(true);
end

DownloadDialog.onReDownload = function(self)
	Log.d("----------------DownloadDialog.onReDownload---------------------------------");
	self:onOkClick();
end


DownloadDialog.onDownloadListener = function(self,data,isSuccess)

	Log.v("DownloadDialog.onDownloadListener data:",data,"self.data:",self.data);

	if data and data.id and (self.data.id == data.id) then

		if isSuccess then

	    	UpdateMgr.getInstance():unRegistDownloadListener();
			UpdateMgr.getInstance():unRegistDownloadProgdressListener();
			UpdateMgr.getInstance():installLua(false);
			EventDispatcher.getInstance():dispatch(DownloadDialog.s_downloadedGame,self.data);
			DownloadDialog.hide();

		else
			self:showReDownloadView();
		end
	end

end

DownloadDialog.onDownloadProgressListener = function(self,data,progress)
	Log.v("DownloadDialog.onDownloadProgressListener");
	if data and  data.id and self.data.id == data.id then
		self:updateProgress(progress);
		Log.v("DownloadDialog.onDownloadProgressListener progress：" , (progress and progress or "0"));
		return;
	end
end
----------------------------更新进度条------------------------------------------------------
DownloadDialog.updateProgress = function(self,progress)
	Log.v("-----------------DownloadDialog.updateProgress----------------------");
	progress = progress or 0 ;
	self.mView_slider:setProgress(progress/100);
	local progressText = string.format("%d%%",math.min(progress or 0,100));
	self.mView_percent:setText(progressText);
end

----------------------------下载完毕--------------------------------------------

DownloadDialog.onBgClick = function(self)
	Log.v("--------------DownloadDialog.onBgClick-----------------------------");
end

DownloadDialog.onMaskViewClick = function(self , finger_action , x , y, drawing_id_first , drawing_id_current)
	
	if finger_action == kFingerUp then
		Log.v("-------------DownloadDialog.onMaskViewClick------------");
    end
end

DownloadDialog.onShadeBgClick = function(self)
	--屏蔽作用
end

----------------------------------------------
DownloadDialog.s_controlConfig =
{
	[DownloadDialog.s_controls.maskView]	= {"maskView"};
	[DownloadDialog.s_controls.bg] 			= {"contentView","bg"};

	[DownloadDialog.s_controls.topText] 	= {"contentView","titleBg","title"};

	[DownloadDialog.s_controls.View1] 		= {"contentView","centerView","View1"};
	[DownloadDialog.s_controls.tipText] 	= {"contentView","centerView","View1","tipText"};

	[DownloadDialog.s_controls.View2]		= {"contentView","bottomView","View2"};
	[DownloadDialog.s_controls.cancelBtn]	= {"contentView","bottomView","View2","cancelBtn"};
	[DownloadDialog.s_controls.okBtn]		= {"contentView","bottomView","View2","okBtn"};

	[DownloadDialog.s_controls.View3] 		= {"contentView","centerView","View3"};
	[DownloadDialog.s_controls.percent]		= {"contentView","centerView","View3","percent"};
	[DownloadDialog.s_controls.slider] 		= {"contentView","centerView","View3","slider"};

	[DownloadDialog.s_controls.View4] 		= {"contentView","bottomView","View4"};
	[DownloadDialog.s_controls.cancelBtn2]	= {"contentView","bottomView","View4","cancelBtn2"};

	[DownloadDialog.s_controls.View5]		= {"contentView","bottomView","View5"};
	[DownloadDialog.s_controls.reDownloadBtn]	= {"contentView","bottomView","View5","reDownloadBtn"};
	[DownloadDialog.s_controls.cancelBtn3]	= {"contentView","bottomView","View5","cancelBtn3"};
};

DownloadDialog.s_controlFuncMap = 
{
	[DownloadDialog.s_controls.bg] 			= DownloadDialog.onBgClick;
	[DownloadDialog.s_controls.maskView] 	= DownloadDialog.onMaskViewClick;

	[DownloadDialog.s_controls.cancelBtn] 	= DownloadDialog.onCancelClick;
	[DownloadDialog.s_controls.okBtn] 		= DownloadDialog.onOkClick;

	[DownloadDialog.s_controls.cancelBtn2] 	= DownloadDialog.onCancelTaskClick;

	[DownloadDialog.s_controls.reDownloadBtn] 	= DownloadDialog.onReDownload;
	[DownloadDialog.s_controls.cancelBtn3] 		= DownloadDialog.onCancelClick;
	
}
