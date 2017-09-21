local ReadyDegradeSavedMoneyTipsWnd = class(CommonGameLayer,false);

ReadyDegradeSavedMoneyTipsWnd.s_controls = {
	takeTipsBg 		= ToolKit.getIndex();
	saveTips 		= ToolKit.getIndex();
	confirmBtn 		= ToolKit.getIndex();
	closeBtn 		= ToolKit.getIndex();
	shadeBg 		= ToolKit.getIndex();
};

ReadyDegradeSavedMoneyTipsWnd.ctor = function(self,layoutConfig)
	local readyDegradeSavedMoneyTipsWnd = require("view/kScreen_1280_800/games/common2/readyDegradeSavedMoneyTipsWnd");
	super(self,readyDegradeSavedMoneyTipsWnd);
	self:setFillParent(true,true);

	self.m_ctrl = ReadyDegradeSavedMoneyTipsWnd.s_controls;
end

ReadyDegradeSavedMoneyTipsWnd.dtor = function (self)
	self:_stopTimer();
end

ReadyDegradeSavedMoneyTipsWnd.onConfirmBtnClick = function(self)
	self:_stopTimer();
	self:setVisible(false);
end

ReadyDegradeSavedMoneyTipsWnd.onEmpty = function(self)
end

ReadyDegradeSavedMoneyTipsWnd.show = function(self,savedMoney)
	savedMoney = tonumber(savedMoney) or "";
	local userMoney = RoomPropertyData.getInstance():getCurPropertyNum();
	local moneyName = RoomPropertyData.getInstance():getCurPropertyName();

	local takeFormat = "#c9D3F01您将携带#cEC551A%s%s#c9D3F01在本场次游戏";
	local takeStr = string.format(takeFormat,ToolKit.skipMoneyEx2(userMoney),moneyName);
	local takeTipsBg = self:findViewById(self.m_ctrl.takeTipsBg);
	local w, h = takeTipsBg:getSize();
    if self.m_richText then
        delete(self.m_richText);
        self.m_richText = nil;
    end
    self.m_richText = new(RichText, takeStr, w-38*2, h, kAlignCenter, nil, 30);
    self.m_richText:setAlign(kAlignCenter);
    takeTipsBg:addChild(self.m_richText);

    local saveStr = string.format("其余的%s%s已安全存入保险箱",ToolKit.skipMoneyEx2(savedMoney),moneyName);
    local saveTips = self:findViewById(self.m_ctrl.saveTips);
    saveTips:setText(saveStr);

    self:_startTimer();
	self:setVisible(true);
end

ReadyDegradeSavedMoneyTipsWnd._startTimer = function(self)
	self:_stopTimer();

	self.m_waitingTimer = AnimFactory.createAnimInt(kAnimNormal, 0, 1, 10000, 0);
	self.m_waitingTimer:setDebugName("ReadyDegradeView|waitingTimer");
	self.m_waitingTimer:setEvent(self,self.onConfirmBtnClick);
end

ReadyDegradeSavedMoneyTipsWnd._stopTimer = function(self)
	delete(self.m_waitingTimer);
	self.m_waitingTimer = nil;
end

ReadyDegradeSavedMoneyTipsWnd.s_controlConfig =
{   
  [ReadyDegradeSavedMoneyTipsWnd.s_controls.takeTipsBg]         = {"centerView","infoTipsView","takeTipsBg"};  
  [ReadyDegradeSavedMoneyTipsWnd.s_controls.saveTips]        	= {"centerView","infoTipsView","saveTips"};  
  [ReadyDegradeSavedMoneyTipsWnd.s_controls.confirmBtn]       	= {"centerView","bottomView","confirmBtn"}; 
  [ReadyDegradeSavedMoneyTipsWnd.s_controls.closeBtn]         	= {"centerView","closeBtn"};  
  [ReadyDegradeSavedMoneyTipsWnd.s_controls.shadeBg]			= {"shadeBg"};
};

ReadyDegradeSavedMoneyTipsWnd.s_controlFuncMap =
{
  [ReadyDegradeSavedMoneyTipsWnd.s_controls.confirmBtn]         = ReadyDegradeSavedMoneyTipsWnd.onConfirmBtnClick;
  [ReadyDegradeSavedMoneyTipsWnd.s_controls.closeBtn]        	= ReadyDegradeSavedMoneyTipsWnd.onConfirmBtnClick;
  [ReadyDegradeSavedMoneyTipsWnd.s_controls.shadeBg]			= ReadyDegradeSavedMoneyTipsWnd.onEmpty;  
};

return ReadyDegradeSavedMoneyTipsWnd;