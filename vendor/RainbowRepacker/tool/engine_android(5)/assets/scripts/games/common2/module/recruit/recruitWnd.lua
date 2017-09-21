
local room_recruitWnd = require("view/kScreen_1280_800/games/common2/room_recruitWnd");


--[[
	招募玩家的确认弹框
]]

local RecruitWnd = class(CommonGameLayer,false);

---------------------------------------------------------------------
----------------- config tables -------------------------------------
---------------------------------------------------------------------

RecruitWnd.s_controls = 
{
	mask 				= ToolKit.getIndex();
	inviteInputView 	= ToolKit.getIndex();
	sendBtn 			= ToolKit.getIndex();
	editText 			= ToolKit.getIndex();
	broadcastTips 		= ToolKit.getIndex();
};

---------------------------------------------------------------------
----------------- 构造函数 -------------------------------------
---------------------------------------------------------------------
RecruitWnd.ctor = function(self)	
	super(self,room_recruitWnd);
	self:setFillParent(true,true)
	self.m_ctrls = RecruitWnd.s_controls;
	self:init();
end

RecruitWnd.dtor = function(self)
	self.data=nil;
    delete(self.m_listener);
    self.m_listener = nil;
end

RecruitWnd.init = function(self)
	self.inviteInputView = self:findViewById(self.m_ctrls.inviteInputView);	
    self.m_editText = self:findViewById(self.m_ctrls.editText);
    self.m_editText:setEnable(false);
    local radioMoney = RadioIsolater.getInstance():getRadioMoney();
    self:findViewById(self.m_ctrls.broadcastTips):setText(string.format("发送广播将扣除%s银币",radioMoney));
end

RecruitWnd.show = function(self, text)
    self.shareTxt = text;
	self.m_editText:setText(self.shareTxt);
    self:setVisible(true);
    DialogLogic.getInstance():pushDialogStack(self,self.colseWnd);
end

RecruitWnd.colseWnd = function(self)
    self:setVisible(false);
    DialogLogic.getInstance():popDialogStack();
    
    local action = GameMechineConfig.ACTION_NS_CLOSE_RECRUITEWND;
    MechineManage.getInstance():receiveAction(action);
end

---------------------------------------------------------------------
----------------- Button event response functions -------------------
---------------------------------------------------------------------
RecruitWnd.onMaskClick = function(self , finger_action , x , y, drawing_id_first , drawing_id_current)
	if finger_action == kFingerUp then
		self:colseWnd();
    end
end

RecruitWnd.onSendClck = function(self)
	local radioMoney = RadioIsolater.getInstance():getRadioMoney();
	local remainMoney = UserPropertyIsolater.getInstance():getMoney() - radioMoney;
	if BankruptIsolater.getInstance():checkIsBankrupt(remainMoney)  then
    	Toast.getInstance():showText(string.format(kTextFirstRecharger,radioMoney), 50, 30, kAliginCenter, "", 24, 255, 255, 255);
    	return;
    end

    if UserPropertyIsolater.getInstance():getMoney() < RadioIsolater.getInstance():getSendPrivateBroadcastLimitMoney() then
    	Toast.getInstance():showText(string.format(kTextSendBroadCastLimit,RadioIsolater.getInstance():getSendPrivateBroadcastLimitMoney()), 50, 30, kAliginCenter, "", 24, 255, 255, 255);
    	return;
	end

    local textView = self:findViewById(self.m_ctrls.editText);
	local inputContent = textView:getText();
	inputContent=string.trim(inputContent);

	local strNum =  string.count(inputContent);
	if strNum>60 or string.isEmpty(inputContent) then
		Toast.getInstance():showText("文字为1-60个字符", 50, 30, kAliginCenter, "", 24, 255, 255, 255);
		return;
	else
		RadioIsolater.getInstance():sendRadio(inputContent, RadioIsolater.getInstance():getPrivateRoomRadioType());
        self:colseWnd();
	end
end

---------------------------------------------------------------------
----------------- config tables -------------------------------------
---------------------------------------------------------------------

RecruitWnd.s_controlConfig = 
{	
	[RecruitWnd.s_controls.mask] 					= {"mask"};
	[RecruitWnd.s_controls.inviteInputView] 		= {"inviteInputView"};
	[RecruitWnd.s_controls.sendBtn] 				= {"inviteInputView","sendBtn"};
	[RecruitWnd.s_controls.editText] 				= {"inviteInputView","editBg","editText"};
	[RecruitWnd.s_controls.broadcastTips] 			= {"inviteInputView","tips"};	
};

RecruitWnd.s_controlFuncMap =
{
	[RecruitWnd.s_controls.mask] 			= RecruitWnd.onMaskClick;
	[RecruitWnd.s_controls.sendBtn] 		= RecruitWnd.onSendClck;
};

return RecruitWnd;