require("common/commonGameLayer");
local loading = require("view/kScreen_1280_800/hall/loading/loading");
require("hall/animation/animUpdateProgress");
require("hall/animation/animUpdatePokerShake");


LoadingDialog = class(CommonGameLayer,false);

----------------------------下载完毕--------------------------------------------
LoadingDialog.onShadeBgClick = function(self)
	--屏蔽作用
end

LoadingDialog.onBgClick = function(self)
	--屏蔽作用
end
----------------------------------------------
LoadingDialog.s_controls = 
{
	bg 				= 1;
	slider 			= 2;
	progressText	= 3;
	animView        = 4;
	progressView    = 5;
};

----------------------------------------------
LoadingDialog.ctor = function(self)
	super(self,loading);
	self.m_ctrls = LoadingDialog.s_controls;
	
	self:setEventTouch(self,self.onShadeBgClick);
	self:setEventDrag(self,self.onShadeBgClick);
	
	self.mView_progressText=self:findViewById(self.m_ctrls.progressText);

	self:updateProgress(0);
	self:findViewById(self.m_ctrls.animView):addChild( AnimUpdatePokerShake.play() );
	self:findViewById(self.m_ctrls.progressView):addChild( AnimUpdateProgress.play(0) );
end

LoadingDialog.dtor = function(self)
	AnimUpdateProgress.release();
	AnimUpdatePokerShake.release();
end

LoadingDialog.updateProgress = function(self, progress)
	progress = progress or 0 ;
	self.mView_progressText:setText( math.floor(progress) .. "%");
	AnimUpdateProgress.play(progress/100);
end

LoadingDialog.show = function(data)	
	LoadingDialog.hide(true);
	LoadingDialog.s_instance = new(LoadingDialog, data);
	LoadingDialog.s_instance:addToRoot();
	LoadingDialog.s_instance:setFillParent(true,true);
	LoadingDialog.s_instance:setLevel(99);
	return LoadingDialog.s_instance;

end

LoadingDialog.hide = function()	
	delete(LoadingDialog.s_instance);
	LoadingDialog.s_instance = nil;
end


LoadingDialog.s_controlConfig =
{
	[LoadingDialog.s_controls.bg] 				= {"bg"};
	[LoadingDialog.s_controls.slider] 			= {"slider"};
	[LoadingDialog.s_controls.progressText] 	= {"progressText"};
	[LoadingDialog.s_controls.animView]        =  {"animView"};
	[LoadingDialog.s_controls.progressView]    =  {"progressView"}
};

LoadingDialog.s_controlFuncMap = 
{
	[LoadingDialog.s_controls.bg] 			= LoadingDialog.onBgClick;
}