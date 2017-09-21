require("common/commonGameLayer");
local login_editText = require("view/kScreen_1280_800/hall/login/login_editText");
local login_pin_map = require("qnFiles/qnPlist/hall/login_pin")


----------------------------------------------------------------------------------------
local login_editText_item = require("view/kScreen_1280_800/hall/login/login_editText_item");

local ListEditText = class(CommonGameLayer,false);
local AccountItem = class(CommonGameLayer,false);

AccountItem.width = 200;
AccountItem.height = 60;

local l_index = 0;
local getNewIndex = function(self)
	l_index = l_index + 1;
	return l_index;
end
AccountItem.s_controls = 
{
	selectIcon = getNewIndex();
	leftBtn = getNewIndex();
	rightBtn = getNewIndex();
	phoneNumber = getNewIndex();
};

---------------------------------------------------------------------
----------------- -------------------------------------
---------------------------------------------------------------------
AccountItem.ctor = function(self,data)	
	super(self,login_editText_item);
	self:setSize(AccountItem.width,AccountItem.height);
	self.m_data = data;
	self.m_ctrls = AccountItem.s_controls;
	local account = data and (data.loginAccount or "") or "";
	self:findViewById(self.m_ctrls.phoneNumber):setText(account);
end

AccountItem.dtor = function(self)	
	self.m_data = nil;
end
---------------------------------------------------------------------
----------------- Button event response functions -------------------
---------------------------------------------------------------------
AccountItem.onSelectClick = function(self)
	Log.v("-------------AccountItem onSelectClick------------");
	EventDispatcher.getInstance():dispatch(ListEditText.s_event,1,self.m_data);
end

AccountItem.onDeleteClick = function(self)
	Log.v("-------------AccountItem onDeleteClick------------");
	EventDispatcher.getInstance():dispatch(ListEditText.s_event,2,self.m_data);
end

AccountItem.s_controlConfig = 
{	
	[AccountItem.s_controls.selectIcon] = {"selectIcon"};
	[AccountItem.s_controls.leftBtn] = {"leftBtn"};
	[AccountItem.s_controls.rightBtn] = {"rightBtn"};
	[AccountItem.s_controls.phoneNumber] = {"phoneNumber"};
};

AccountItem.s_controlFuncMap =
{
	[AccountItem.s_controls.leftBtn] = AccountItem.onSelectClick;
	[AccountItem.s_controls.rightBtn] = AccountItem.onDeleteClick;
};



local h_index = 0;
local getIndex = function(self)
	h_index = h_index + 1;
	return h_index;
end
ListEditText.s_controls = 
{
	phoneNum = getIndex();
	listView = getIndex();
	rightView = getIndex();
	triangleBtn = getIndex();
	packUp = getIndex();
	deleteText = getIndex();
	deleteBtn = getIndex();
	pullView = getIndex();
};

ListEditText.ctor = function(self,w,h)	
	super(self,login_editText);
	self:setSize(w,h);

	self.m_data = kLoginDataInterface:getAccountHistory();

	self.m_ctrls = ListEditText.s_controls;
	AccountItem.width = w;

	EventDispatcher.getInstance():register(ListEditText.s_event,self,self.onItemClick); 
	self:_init();
end


ListEditText.dtor = function(self)	
	self.m_data = nil;
	self.accountClick_obj=nil;
	self.accountClick_fun=nil;
	EventDispatcher.getInstance():unregister(ListEditText.s_event,self,self.onItemClick); 
end
---------------------------------------------------------------------
----------------- Button event response functions -------------------
---------------------------------------------------------------------
ListEditText.s_event = EventDispatcher.getInstance():getUserEvent();
ListEditText.onExpandClick = function(self)
	if self.m_status == 0 then--0.展开;1.关闭
		self.m_status = 1;
		self:findViewById(self.m_ctrls.packUp):setFile(login_pin_map["expand.png"]);
		self:findViewById(self.m_ctrls.pullView):setVisible(false);
		
	elseif self.m_status == 1 then
		self.m_status = 0;
		self:findViewById(self.m_ctrls.packUp):setFile(login_pin_map["packup.png"]);
		self:findViewById(self.m_ctrls.pullView):setVisible(true);
	end
end

ListEditText.onItemClick = function(self,status,data)	
	if status == 1 then		
		self:onAccountClick(data);

		
		
	elseif status == 2 then
		for k,v in ipairs(self.m_data) do
			if v == data then
				table.remove(self.m_data,k);
				kLoginDataInterface:delLoginInfoByAccount(data.loginAccount);
				break;
			end
		end

		self:_init();

		local isDataEmpty = table.isEmpty(self.m_data);
		if isDataEmpty then
			self:onClearAccountClick();
		else 
			self:onAccountClick(self.m_data[1]);
		end
		return;
	end

	self:onExpandClick();
end

ListEditText.onClearAccountClick = function(self)	
	self:onDeleteTextClick();	
end

ListEditText.onTextChange = function(self)
	local text = string.trim(self:getText());
	local isNil = (text == nil or text == "");

	self:findViewById(self.m_ctrls.deleteText):setVisible(not isNil);
	self:findViewById(self.m_ctrls.deleteBtn):setVisible(not isNil);
end

ListEditText.isShowing = function(self,status,data)	
	return self.m_status == 0 ;
end

ListEditText.hide = function(self,status,data)	
	self.m_status = 1;
	self:findViewById(self.m_ctrls.packUp):setFile(login_pin_map["expand.png"]);
	self:findViewById(self.m_ctrls.pullView):setVisible(false);
end

ListEditText.getText = function(self)	
	return self:findViewById(self.m_ctrls.phoneNum):getText();
end

ListEditText.setOnAccountClickListener = function(self, obj , fun)		
	self.accountClick_obj = obj;
	self.accountClick_fun = fun;

	if not table.isEmpty(self.m_data) and self.m_data[1] then--代码放在这里不是很好，纯粹是为了简单实现产品提的一个需求：若记录已有帐号，默认展示出来。目前需要用户点击下拉才能看到记录
		self.m_status = 0;
		EventDispatcher.getInstance():dispatch(ListEditText.s_event,1,self.m_data[1]);
	end
end

ListEditText.onAccountClick = function(self , data )	
	local account = data and (data.loginAccount or "") or "";
	self:findViewById(self.m_ctrls.phoneNum):setText(account);
	self:findViewById(self.m_ctrls.deleteText):setVisible(true);
	self:findViewById(self.m_ctrls.deleteBtn):setVisible(true);

	if self.accountClick_obj and self.accountClick_fun then
		self.accountClick_fun(self.accountClick_obj,data);
	end
end

ListEditText.setOnDeleteTextClickListener = function(self, obj , fun)	
	self.deleteTextClick_obj = obj;
	self.deleteTextClick_fun = fun;
end

ListEditText.onDeleteTextClick = function(self )	
	self:findViewById(self.m_ctrls.phoneNum):setText("");
	self:findViewById(self.m_ctrls.deleteText):setVisible(false);
	self:findViewById(self.m_ctrls.deleteBtn):setVisible(false);

	if self.deleteTextClick_obj and self.deleteTextClick_fun then
		self.deleteTextClick_fun(self.deleteTextClick_obj,self.m_data)
	end
end



ListEditText._init = function(self)	
	self.m_status = 1;
	local isDataEmpty = table.isEmpty(self.m_data);
	self:findViewById(self.m_ctrls.phoneNum):setInputMode(kEditBoxInputModePhoneNumber);
	self:findViewById(self.m_ctrls.phoneNum):setBackgroundColor("#EEE4CA");
	self:findViewById(self.m_ctrls.triangleBtn):setVisible(not isDataEmpty);
	self:findViewById(self.m_ctrls.packUp):setVisible(not isDataEmpty);
	self:findViewById(self.m_ctrls.packUp):setFile(login_pin_map["expand.png"]);

	self:findViewById(self.m_ctrls.rightView):setPos(isDataEmpty and -52 or 0);
	self:findViewById(self.m_ctrls.rightView):reviseSize();
	local pullView = self:findViewById(self.m_ctrls.pullView);
	pullView:setVisible(false);
	self:onTextChange();
	if not isDataEmpty then
		local adapter = new(CacheAdapter,AccountItem,self.m_data or {});
		local w,h = self:getSize();
		self:findViewById(self.m_ctrls.listView):setAdapter(adapter);	
	end
end


---------------------------------------------------------------------
----------------- config tables -------------------------------------
---------------------------------------------------------------------

ListEditText.s_controlConfig = 
{
	[ListEditText.s_controls.phoneNum] = {"editBg","phoneNum"};
	[ListEditText.s_controls.listView] = {"pullView","listView"};
	[ListEditText.s_controls.rightView] = {"rightView"};
	[ListEditText.s_controls.triangleBtn] = {"rightView","triangleBtn"};
	[ListEditText.s_controls.packUp] = {"rightView","packUp"};
	[ListEditText.s_controls.deleteText] = {"rightView","deleteText"};
	[ListEditText.s_controls.deleteBtn] = {"rightView","deleteBtn"};
	[ListEditText.s_controls.pullView] = {"pullView"};
};

ListEditText.s_controlFuncMap =
{
	[ListEditText.s_controls.phoneNum] = ListEditText.onTextChange;
	[ListEditText.s_controls.triangleBtn] = ListEditText.onExpandClick;
	[ListEditText.s_controls.deleteBtn] = ListEditText.onClearAccountClick;
};

return ListEditText