local BaseLoginDialog = require("hall/login/widget/baseLoginDialog");
local login_forbiddenAccount = require(ViewPath.."hall/login/login_forbiddenAccount");
require("uilibs/richText");

--禁用账号
local DisableAccountDialog = class(BaseLoginDialog,false);

local h_index = 0;
local getIndex = function(self)
	h_index = h_index + 1;
	return h_index;
end
DisableAccountDialog.s_controls = 
{
	closeBtn = getIndex();
	shiled = getIndex();
	changeAccount = getIndex();
    phoneNumber = getIndex();
    phoneLine = getIndex();
    contentView = getIndex();
};

DisableAccountDialog.ctor = function(self, data)	
	super(self,login_forbiddenAccount);
	self.m_ctrls = DisableAccountDialog.s_controls;
    self.m_data = data;
    self:__initViews();
	self:__init();
    self:setLevel(1000);
end

DisableAccountDialog.__initViews = function (self)
    self.m_shiled = self:findViewById(self.m_ctrls.shiled);
    self.m_phoneNumber = self:findViewById(self.m_ctrls.phoneNumber);
    self.m_phoneLine = self:findViewById(self.m_ctrls.phoneLine);
    self.m_contentView = self:findViewById(self.m_ctrls.contentView);
end

DisableAccountDialog.__init = function(self)
    self.m_shiled:setEventTouch(self,function()end);
    self.m_shiled:setEventDrag(self,function()end);
    local phoneNum = HallDataInterface.getInstance():getHotline();
    self.m_phoneNumber:setText(phoneNum, 1);
    local numberW,_ = self.m_phoneNumber:getSize();
    self.m_phoneLine:setSize(numberW, nil);
    local cid = self.m_data.cid;
    local str = "#c764812（请向客服说明游戏ID：".."#c0000ff"..cid.."#c764812)";
    local richText = new(RichText, str, 500, 34, kAlignCenter, nil, 32, nil, nil, nil);
	richText:setAlign(kAlignCenter);
	self.m_contentView:addChild(richText);
end

DisableAccountDialog.dtor = function(self)	
	
end

DisableAccountDialog.onCloseClick = function(self)
	DisableAccountDialog.hide();
end

DisableAccountDialog.onChangeAccountClick = function(self)	 
	self:onCloseClick();
    local OldAccountLoginDialog = require("hall/login/widget/oldAccountLoginDialog");
	OldAccountLoginDialog.show();
end

DisableAccountDialog.onPhoneNumberClick = function(self, finger_action, x, y, drawing_id_first, drawing_id_current)
    if finger_action == kFingerUp then
        HallDataInterface.getInstance():callHotline();
    end
end

----------------------------------全     局-----------------------------------------------
DisableAccountDialog.show = function( ... )		
	DisableAccountDialog.hide(true);
	DisableAccountDialog.s_instance = new(DisableAccountDialog , ... );
	DisableAccountDialog.s_instance:addToRoot();
	DisableAccountDialog.s_instance:setFillParent(true,true);
	return DisableAccountDialog.s_instance;
end

DisableAccountDialog.hide = function()	
	delete(DisableAccountDialog.s_instance);
	DisableAccountDialog.s_instance = nil;
end

DisableAccountDialog.s_controlConfig = 
{	
    [DisableAccountDialog.s_controls.shiled] = {"shiled"};	    
	[DisableAccountDialog.s_controls.closeBtn] = {"contentView","closeBtn"};	 
	[DisableAccountDialog.s_controls.changeAccount] = {"contentView","view","changeAccount"}; 
    [DisableAccountDialog.s_controls.phoneNumber] = {"contentView","view","phoneNumber"}; 
    [DisableAccountDialog.s_controls.phoneLine] = {"contentView","view","phoneLine"}; 
    [DisableAccountDialog.s_controls.contentView] = {"contentView"};
};


DisableAccountDialog.s_controlFuncMap =
{
	[DisableAccountDialog.s_controls.closeBtn] = DisableAccountDialog.onCloseClick;
    [DisableAccountDialog.s_controls.changeAccount] = DisableAccountDialog.onChangeAccountClick;
    [DisableAccountDialog.s_controls.phoneNumber] = DisableAccountDialog.onPhoneNumberClick;
};

return DisableAccountDialog