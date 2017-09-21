-- editTextex.lua
require("ui/editText");
require("util/toolKit");
require("common/nativeEvent");

-- 扩充布局方式
EditText.s_EX_LAYOUT_LINEARLAYOUT_FULL_WIDTH = 1;			-- 宽满屏
EditText.s_EX_LAYOUT_RELATIVELAYOUT_NOT_FULL_WIDTH = 2;		-- 宽半屏
-- 扩充MODE
kEditBoxInputModeMultLine	= 7;
if System.getPlatform() == kPlatformIOS then
	EditText.s_defaultMaxClickOffset = 20;
end

-- 扩充FLAG
kEditBoxInputFlagVisiblePassword					 = 5;

-- 扩充输入格式
EditText.s_EX_INPUT_TYPE_NUMBER = 1;						-- 1234 1234 1234
EditText.s_EX_INPUT_TYPE_PHONE_NUMBER = 2;					-- 123 1234 1234

EditText.s_ex_dict_table_name = "inputEditExTable";
EditText.s_ex_dict_key_layoutEx = "layoutEx";
EditText.s_ex_dict_key_mode   = "mode";
EditText.s_ex_dict_key_modeEx = "modeEx";
EditText.s_ex_dict_key_inputTips = "inputTips";
EditText.s_ex_dict_key_minLength = "minLength";
EditText.s_ex_dict_key_minLengthTips = "minLengthTips";

-- 事件类型
EditText.s_EX_RETURNTYPE_DEFAULT = 0;
EditText.s_EX_RETURNTYPE_DONE = 1;
EditText.s_EX_RETURNTYPE_SEND = 2;
EditText.s_EX_RETURNTYPE_SEARCH = 3;
EditText.s_EX_RETURNTYPE_GO = 4;

-- 输入框关闭类型
EditText.s_EX_CLOSE_CANCLE = 0;
EditText.s_EX_CLOSE_DONE = 1;

EditText.ctor = function(self, str, width, height, align, fontName, fontSize, r, g, b)
	self.m_textColorR = r or 0;
	self.m_textColorG = g or 0;
	self.m_textColorB = b or 0;

	self.m_hintText = EditText.s_hintText or EditText.s_defaultHintText;
	self.m_hintTextColorR = EditText.s_hintTextColorR or EditText.s_defaultHintTextColorR;
	self.m_hintTextColorG = EditText.s_hintTextColorG or EditText.s_defaultHintTextColorG;
	self.m_hintTextColorB = EditText.s_hintTextColorB or EditText.s_defaultHintTextColorB;

	self.m_maxClickOffset = EditText.s_maxClickOffset or EditText.s_defaultMaxClickOffset;
	
	EditText.setEventTouch(self,self,self.onEventTouch);

	self.m_textChangeCallback = {};

	self.m_enable = true;

	self.m_inputMode = kEditBoxInputModeSingleLine;
	self.m_inputFlag = kEditBoxInputFlagInitialCapsSentence;

    EventDispatcher.getInstance():register(Event.Call,self,self.onNativeEvent);
end

-- 输入框布局
EditText.setInputLayoutEx = function(self, layoutEx)
	self.m_inputLayoutEx = layoutEx;
end

-- 扩充输入类型
EditText.setInputModeEx = function(self, modeEx)
	self.m_inputModeEx = modeEx;
end

-- 扩充事件类型
EditText.setReturnTypeEx = function(self, returnType)
	self.m_returnType = returnType;
end

-- 设置Android端显示的title
EditText.setInputTitle = function(self, title)
	self.m_inputTitle = title;
end

-- 设置Android端显示的输入tips
EditText.setInputTips = function(self, tips)
	self.m_inputTips = tips or "";
end

-- 设置最小输入的字符长度minLength, 若为-1，则没有最小长度限制
-- 若确认输入的时候未达到相应的长度，则显示minLengthTips的Toast
EditText.setMinLength = function(self, minLength, minLengthTips)
	self.m_minLength = minLength or -1;
	self.m_minLengthTips = minLengthTips or "";
end

--设置是否屏蔽敏感词 默认为屏蔽
EditText.setFilterSensitiveWordFlag = function(self, isFilter)
	self.m_filterSensitiveWord = isFilter;
end
--获取是否屏蔽敏感词 默认为屏蔽
EditText.getFilterSensitiveWordFlag = function(self)
	return self.m_filterSensitiveWord;
end

EditText.onSetExParams = function(self)
    dict_set_int(EditText.s_ex_dict_table_name,"inputMode",self.m_inputMode);
	dict_set_int(EditText.s_ex_dict_table_name,"inputFlag",self.m_inputFlag);
	dict_set_int(EditText.s_ex_dict_table_name,"returnType", self.m_returnType or kKeyboardReturnTypeDone);
	-- x,y,width,height
	dict_set_double(EditText.s_ex_dict_table_name,"editTextRectX",self.m_inputTextBox_x or 0);
    dict_set_double(EditText.s_ex_dict_table_name,"editTextRectY",self.m_inputTextBox_y or 0);
	dict_set_double(EditText.s_ex_dict_table_name,"editTextRectW",self.m_inputTextBox_width or 0);
	dict_set_double(EditText.s_ex_dict_table_name,"editTextRectH",self.m_inputTextBox_height or 0);
	-- size,color
	local fontColor=self.m_textColorR*256*256+self.m_textColorG*256+self.m_textColorB
	dict_set_int(EditText.s_ex_dict_table_name,"editTextFontSize",self.m_res.m_fontSize*System.getLayoutScale());
	dict_set_int(EditText.s_ex_dict_table_name,"editTextFontColor",fontColor);
	dict_set_string(EditText.s_ex_dict_table_name,"TextBoxBackgroundColor",self.m_backgroundColor or "");
end

EditText.setBackgroundColor = function(self, color)
   self.m_backgroundColor = color;
end

EditText.setText = function(self , str, width, height, r, g, b)
	self.m_textColorR = r or self.m_textColorR;
	self.m_textColorG = g or self.m_textColorG;
	self.m_textColorB = b or self.m_textColorB;

	if not str or str == self.m_hintText then
		EditText.setRealTextValue(self , " ");

		str = self.m_hintText;
		r = self.m_hintTextColorR;
		g = self.m_hintTextColorG;
		b = self.m_hintTextColorB;
	else
		EditText.setRealTextValue(self , str);

		if self.m_inputFlag == kEditBoxInputFlagVisiblePassword or self.m_inputFlag == kEditBoxInputFlagPassword then
			--如果是密码 则进行转换再显示
			str = EditText.maskTextValue(self , str);
		end

		r = self.m_textColorR;
		g = self.m_textColorG;
		b = self.m_textColorB;
	end

	Text.setText(self,str,width,height,r,g,b);
end

EditText.maskTextValue = function(self , beforeValue)
	beforeValue = beforeValue or "";
	beforeValue = string.gsub(beforeValue," ",'');
	local len = string.len(beforeValue);
	local afterValue = "";
	for i = 1,len do
		afterValue = afterValue .."*";
	end

	return afterValue;
end

EditText.getText = function(self)
	local text = Text.getText(self);

	if self.m_inputFlag == kEditBoxInputFlagVisiblePassword or self.m_inputFlag == kEditBoxInputFlagPassword then
		text = self.m_realTextValue or text;
	end

	text = (text == self.m_hintText) and " " or text;

	return text;
end

EditText.setRealTextValue = function(self , realTextValue)
	self.m_realTextValue = Text.convert2SafeString(self , realTextValue);
end

EditText.onEventTouch = function(self, finger_action, x, y, drawing_id_first, drawing_id_current)
	if finger_action == kFingerDown then
	    self.m_startX = x;
	    self.m_startY = y;
	    self.m_touching = true;
	elseif finger_action == kFingerUp then
	    if not self.m_touching then return end;

	    self.m_touching = false;
	    
	    local diffX = math.abs(x - self.m_startX);
	    local diffY = math.abs(y - self.m_startY);
	    if diffX > self.m_maxClickOffset 
	    	or diffY > self.m_maxClickOffset 
	    	or (not self.m_enable) 
	    	or (drawing_id_first ~= drawing_id_current) then
	        return;
	    end

	    self:openEdit();
    end
end

EditText.openEdit = function(self)

	EditTextGlobal = self;
  
	if not ( self.m_inputTextBox_width and self.m_inputTextBox_height 
			and self.m_inputTextBox_x and self.m_inputTextBox_y ) then

		local x,y = self:getAbsolutePos();
    	self.m_inputTextBox_x = x * System.getLayoutScale();
    	self.m_inputTextBox_y = y * System.getLayoutScale();

		local w,h = self:getSize();
	    self.m_inputTextBox_width = w * System.getLayoutScale();
	    if System.getPlatform() == kPlatformAndroid then
	    	self.m_inputTextBox_y = self.m_inputTextBox_y + 6; 
	   		self.m_inputTextBox_height = (h+12) * System.getLayoutScale();
		else 
	        self.m_inputTextBox_height = h * System.getLayoutScale();
		end
	end

    -- 扩充传值
    self:onSetExParams();

	local textStr=EditText.getText(self)
    if textStr == self.m_hintText then
    	textStr=""
    end
    textStr = string.trim(textStr)
    ime_open_edit(textStr,
		"",
		self.m_inputMode,
		self.m_inputFlag,
		self.m_returnType or kKeyboardReturnTypeDone,
		self.m_maxLength or -1,"global",self.m_fontName or "",(self.m_res.m_fontSize or 24)* System.getLayoutScale(),
        self.m_textColorR,self.m_textColorG,self.m_textColorB,
        self.m_inputTextBox_x,self.m_inputTextBox_y,self.m_inputTextBox_width,self.m_inputTextBox_height);
	EditTextGlobal.setText(EditTextGlobal,"");
end

EditText.dtor = function(self)
    EventDispatcher.getInstance():unregister(Event.Call,self,self.onNativeEvent);
    if kPlatformIOS == System.getPlatform() and EditTextGlobal == self then
    	NativeEvent.getInstance():hideEditTextView();
    	self:__moveRootView(0, 1);
    end
	EditTextGlobal = nil;
	self.m_textChangeCallback = nil;
	ime_close_edit();
end

EditText.hideEditTextView = function(self)
	if kPlatformIOS == System.getPlatform() and EditTextViewGlobal == self then
		NativeEvent.getInstance():hideEditTextView();
	    self:__moveRootView(0, 1);
    end
	ime_close_edit();
end

EditText.setPos = function(self, x, y)
	Text.setPos(self, x, y);
	self.m_inputTextBox_x = nil;
	self.m_inputTextBox_y = nil;
end

EditText.setSize = function(self, w, h)
	Text.setSize(self, w, h);
	self.m_inputTextBox_width = nil;
	self.m_inputTextBox_height = nil;
end

--重写，参数扩张
EditText.onTextChange = function(self,...)
	if self.m_textChangeCallback.func then
		self.m_textChangeCallback.func(self.m_textChangeCallback.obj,EditText.getText(self),...);
	end
end

function event_ime_close_global(strNewValue, flag)
	if EditTextGlobal then

		if EditTextGlobal.getFilterSensitiveWordFlag(EditTextGlobal) then
			Log.i("----------------EditText strNewValue=",strNewValue," flag=",flag)
			strNewValue = ToolKit.shieldSensitiveWord(strNewValue);
			Log.v("................EditText after shild strNewValue = ",  strNewValue);
		else
			Log.v("................EditText do not filter sensitive word");
		end

        EditTextGlobal:setVisible(true)
		strNewValue = string.gsub((strNewValue or ""), "\\", "\\\\");
		EditTextGlobal.setText(EditTextGlobal,strNewValue);
		if (not strNewValue) or strNewValue == "" or strNewValue == EditTextGlobal.m_hintText then
			EditTextGlobal.setText(EditTextGlobal,EditTextGlobal.m_hintText,nil,nil,EditTextGlobal.m_hintTextColorR,EditTextGlobal.m_hintTextColorG,EditTextGlobal.m_hintTextColorB);
		else
			EditTextGlobal.setText(EditTextGlobal,strNewValue,nil,nil,EditTextGlobal.m_textColorR,EditTextGlobal.m_textColorG,EditTextGlobal.m_textColorB);
		end
		
        --扩张一个参数，让客户端自己取舍
	    EditTextGlobal.onTextChange(EditTextGlobal,flag);
		
	end
	EditTextGlobal = nil;
end

EditText.nativeEditViewMove = function(self,status,json_data)
    if not (status and json_data) then
		return;
    end
    local offset = GetNumFromJsonTable(json_data,"offset",75);
    Log.v("EditText.nativeEditViewMove offset=",offset); 
    local isHidekeyboard = GetNumFromJsonTable(json_data,"isHideKeyboard",0);
   	self:__moveRootView(offset, isHidekeyboard);
end

EditText.__moveRootView = function(self, offset, isHidekeyboard)
 	local root = DrawingBase.getRootNode();
    if isHidekeyboard == 1 then
        root:setPickable(true);
    else
		root:setPickable(false);
    end
    
    if type(offset) == "number" then
		if offset > 0 then
			local y = offset /System.getLayoutScale();
			root:setPos(0, -y);
		else
			root:setPos(0, 0);
		end
    end	
end

EditText.onNativeEvent = function(self,param,...)
	if self.s_nativeEventFuncMap[param] then
		self.s_nativeEventFuncMap[param](self,...);
	end
end

EditText.s_nativeEventFuncMap = {
	["moveView"]       = EditText.nativeEditViewMove;
};
