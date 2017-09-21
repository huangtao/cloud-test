local ReadyDegradeTipsWnd = class(CommonGameLayer,false);

ReadyDegradeTipsWnd.Delegate = {
    onSelecteChange = "onSelecteChange";
    onSelecteWait = "onSelecteWait";
};

ReadyDegradeTipsWnd.s_controls = {
	baseChipTips 		= ToolKit.getIndex();
	baseChipTipsSuffix 	= ToolKit.getIndex();
	changeBtn 			= ToolKit.getIndex();
	waitBtn 			= ToolKit.getIndex();
	noTipsCheck 		= ToolKit.getIndex();
	shadeBg 			= ToolKit.getIndex();
};

ReadyDegradeTipsWnd.ctor = function(self,layoutConfig)
	local checkBoxDefaultImgs = { 	"isolater/check_un2.png",
							    	"isolater/check_sel2.png"
							  	};
	CheckBox.setDefaultImages(checkBoxDefaultImgs);
	local readyDegradeTipsWnd = require("view/kScreen_1280_800/games/common2/readyDegradeTipsWnd");
	super(self,readyDegradeTipsWnd);
	CheckBox.setDefaultImages();

	self:setFillParent(true,true);

	self.m_ctrl = ReadyDegradeTipsWnd.s_controls;
	self:setVisible(false);
end

ReadyDegradeTipsWnd.dtor = function (self)
	DialogLogic.getInstance():popDialogStack();
end

ReadyDegradeTipsWnd.onChangeBtnClick = function(self)
	self:hide();

	self:execDelegate(ReadyDegradeTipsWnd.Delegate.onSelecteChange);
end

ReadyDegradeTipsWnd.onWaitBtnClick = function(self)
	local noTipsCheck = self:findViewById(self.m_ctrl.noTipsCheck);
	local isSelected;
	if noTipsCheck then 
		isSelected = noTipsCheck:isChecked(1);
	end

	self:hide();

	self:execDelegate(ReadyDegradeTipsWnd.Delegate.onSelecteWait,isSelected);
end

ReadyDegradeTipsWnd.onEmpty = function(self)
end

ReadyDegradeTipsWnd.setData = function(self,baseChip)
	baseChip = tonumber(baseChip);
	local baseChipStr = baseChip and "("..baseChip.."底注)" or "";

	local baseChipTips = self:findViewById(self.m_ctrl.baseChipTips);
	baseChipTips:setText(baseChipStr,10);
	local w = baseChipTips:getSize();
	local x = baseChipTips:getPos();
	local baseChipTipsSuffix  = self:findViewById(self.m_ctrl.baseChipTipsSuffix);
    baseChipTipsSuffix:setPos(x+w,nil);    
end

ReadyDegradeTipsWnd.show = function(self)
	local noTipsCheck = self:findViewById(self.m_ctrl.noTipsCheck);
	if noTipsCheck then 
		noTipsCheck:setChecked(1,false);
	end 

	self:setVisible(true);

	DialogLogic.getInstance():pushDialogStack(self,self.onWaitBtnClick);
end

ReadyDegradeTipsWnd.hide = function(self)
	self:setVisible(false);
	DialogLogic.getInstance():popDialogStack();
end

ReadyDegradeTipsWnd.s_controlConfig =
{   
  [ReadyDegradeTipsWnd.s_controls.baseChipTips]     		= {"centerView","infoTipsView","baseChipTips"};  
  [ReadyDegradeTipsWnd.s_controls.baseChipTipsSuffix]     	= {"centerView","infoTipsView","baseChipTipsSuffix"};  
  [ReadyDegradeTipsWnd.s_controls.changeBtn]      			= {"centerView","bottomView","btnsView","changeBtn"}; 
  [ReadyDegradeTipsWnd.s_controls.waitBtn]      			= {"centerView","bottomView","btnsView","waitBtn"};  
  [ReadyDegradeTipsWnd.s_controls.noTipsCheck]     			= {"centerView","bottomView","noTipsView","noTipsCheck"}; 
  [ReadyDegradeTipsWnd.s_controls.shadeBg]					= {"shadeBg"};
};

ReadyDegradeTipsWnd.s_controlFuncMap =
{
  [ReadyDegradeTipsWnd.s_controls.changeBtn]        = ReadyDegradeTipsWnd.onChangeBtnClick;
  [ReadyDegradeTipsWnd.s_controls.waitBtn]     		= ReadyDegradeTipsWnd.onWaitBtnClick;
  [ReadyDegradeTipsWnd.s_controls.shadeBg]			= ReadyDegradeTipsWnd.onEmpty;  
};

return ReadyDegradeTipsWnd;