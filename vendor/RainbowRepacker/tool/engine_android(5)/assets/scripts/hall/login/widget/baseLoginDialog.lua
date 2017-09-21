require("common/commonGameLayer");
require("util/StringLib");


local BaseLoginDialog = class(CommonGameLayer);

BaseLoginDialog.s_LoginCallBack = EventDispatcher.getInstance():getUserEvent(); 
BaseLoginDialog.s_SmsCallBack = EventDispatcher.getInstance():getUserEvent(); 

BaseLoginDialog.api_checkregister=1;
BaseLoginDialog.api_getVerifyCode=2;
BaseLoginDialog.api_reSetPsd=3;
BaseLoginDialog.api_regAndSetPsd=4;
BaseLoginDialog.api_boyaaLogin=5;
BaseLoginDialog.api_guestLogin=6;
BaseLoginDialog.api_bindPhone=7;
BaseLoginDialog.api_reLogin=8;

BaseLoginDialog.s_dialogStack = {};

BaseLoginDialog.ctor = function(self,data)	
	Log.v("BaseLoginDialog","ctor");
	table.insert(BaseLoginDialog.s_dialogStack, self);
	self:setEventDrag(nil, function () end); --设置拖动监听，防止事件被下层穿透
end

BaseLoginDialog.dtor = function(self)	
	Log.v("BaseLoginDialog","dtor");

	for k, v in pairs(BaseLoginDialog.s_dialogStack) do
		if v == self then
			table.remove(BaseLoginDialog.s_dialogStack, k);
			break;
		end
	end
end

BaseLoginDialog.onOpenToast = function(self,msg)
	NativeEvent.getInstance():ShowLoadingDialog(msg or "登录中");
end

BaseLoginDialog.onCloseToast = function(self)
	NativeEvent.getInstance():HideLoadingDialog();
end


-------------------------静态函数-----------------------------
--virtual
BaseLoginDialog.show = function()
	Log.v("BaseLoginDialog.show sub class must override me !");
end

--virtual
BaseLoginDialog.hide = function()
	Log.v("BaseLoginDialog.hide sub class must override me !");
end

BaseLoginDialog.hideAllDialog = function()
	local tmp = BaseLoginDialog.s_dialogStack;
	BaseLoginDialog.s_dialogStack = {};

	for k, v in pairs(tmp) do
		delete(v);
		v = nil;
	end
end

BaseLoginDialog.hideTopDialog = function()
	if #BaseLoginDialog.s_dialogStack > 0 then
		BaseLoginDialog.s_dialogStack[#BaseLoginDialog.s_dialogStack]:hide();
	end
end

BaseLoginDialog.isDialogShowing = function()
	return #BaseLoginDialog.s_dialogStack > 0;
end

function onSmsResponse()
	local number = dict_get_string("smsResult","number") or "";
	Log.v("onSmsResponse","number",number);
	EventDispatcher.getInstance():dispatch(BaseLoginDialog.s_SmsCallBack,number);
end

return BaseLoginDialog