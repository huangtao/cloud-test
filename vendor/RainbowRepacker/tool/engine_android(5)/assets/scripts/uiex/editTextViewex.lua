-- editTextViewex.lua
require("ui/editTextView");
require("util/toolKit");
require("common/nativeEvent");

if System.getPlatform() == kPlatformIOS then
	EditTextView.s_defaultMaxClickOffset = 20;
end
EditTextView.ctor = function(self, str, width, height, align, fontName, fontSize, r, g, b)
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

-- 设置Android端显示的title
EditTextView.setInputTitle = function(self, title)
	self.m_inputTitle = title;
end

-- 输入框布局
EditTextView.setInputLayoutEx = function(self, layoutEx)
	self.m_inputLayoutEx = layoutEx;
end

-- 扩充输入类型
EditTextView.setInputModeEx = function(self, modeEx)
	self.m_inputModeEx = modeEx;
end

-- 扩充事件类型
EditTextView.setReturnTypeEx = function(self, returnType)
	self.m_returnType = returnType;
end

-- 设置Android端显示的输入tips
EditTextView.setInputTips = function(self, tips)
	self.m_inputTips = tips or "";
end

EditTextView.setBackgroundColor = function(self, color)
   self.m_backgroundColor = color;
end

-- 设置最小输入的字符长度minLength, 若为-1，则没有最小长度限制
-- 若确认输入的时候未达到相应的长度，则显示minLengthTips的Toast
EditTextView.setMinLength = function(self, minLength, minLengthTips)
	self.m_minLength = minLength or -1;
	self.m_minLengthTips = minLengthTips or "";
end

--设置是否屏蔽敏感词 默认为屏蔽
EditTextView.setFilterSensitiveWordFlag = function(self, isFilter)
	self.m_filterSensitiveWord = isFilter;
end
--获取是否屏蔽敏感词 默认为屏蔽
EditTextView.getFilterSensitiveWordFlag = function(self)
	return self.m_filterSensitiveWord;
end

EditTextView.dtor = function(self)
    EventDispatcher.getInstance():unregister(Event.Call,self,self.onNativeEvent);
	-- if kPlatformIOS == System.getPlatform() and EditTextViewGlobal == self then
	-- 	NativeEvent.getInstance():hideEditTextView();
	--     self:__moveRootView(0, 1);
 --    end
	-- ime_close_edit();
	self.m_textChangeCallback = nil;
	EditTextViewGlobal = nil;
	self:hideEditTextView();
end

EditTextView.setPos = function(self, x, y)
	TextView.setPos(self, x, y);
	self.m_inputTextBox_x = nil;
	self.m_inputTextBox_y = nil;
end

EditTextView.setSize = function(self, w, h)
	TextView.setSize(self, w, h);
	self.m_inputTextBox_width = nil;
	self.m_inputTextBox_height = nil;
end

EditTextView.hideEditTextView = function(self)
	if kPlatformIOS == System.getPlatform() and EditTextViewGlobal == self then
		NativeEvent.getInstance():hideEditTextView();
	    self:__moveRootView(0, 1);
    end
	ime_close_edit();
end

EditTextView.onEventTouch = function(self, finger_action, x, y, drawing_id_first, drawing_id_current)
	TextView.onEventTouch(self,finger_action,x,y,drawing_id_first,drawing_id_current);
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

	    EditTextViewGlobal = self;
	    
	    local x,y = self:getAbsolutePos();
    	self.m_inputTextBox_x = x * System.getLayoutScale();
    	self.m_inputTextBox_y = y * System.getLayoutScale();

    	local w,h = self:getSize();
	    self.m_inputTextBox_width = w * System.getLayoutScale();
	    if System.getPlatform() == kPlatformAndroid then 
	   		self.m_inputTextBox_height = (h+12) * System.getLayoutScale();
		else 
	        self.m_inputTextBox_height = h * System.getLayoutScale();
		end

	    -- 扩充传值
	    self:onSetExParams();
	    --
	    local textStr=EditTextView.getText(self)
	    if textStr == self.m_hintText then
	    	textStr=""
	    end
		ime_open_edit(textStr,
			"",
			self.m_inputMode,
			self.m_inputFlag,
			self.m_returnType or kKeyboardReturnTypeDone,
			self.m_maxLength or -1,"global_view",self.m_fontName or "",(self.m_res.m_fontSize or 24)* System.getLayoutScale(),
            self.m_textColorR,self.m_textColorG,self.m_textColorB,
            self.m_inputTextBox_x,self.m_inputTextBox_y,self.m_inputTextBox_width,self.m_inputTextBox_height);
		EditTextViewGlobal.setText(EditTextViewGlobal,"");

    end
end

EditTextView.onSetExParams = function(self)
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

--重写，参数扩张
EditTextView.onTextChange = function(self,...)
	if self.m_textChangeCallback.func then
		self.m_textChangeCallback.func(self.m_textChangeCallback.obj,EditTextView.getText(self),...);
	end
end

function event_ime_close_global_view(strNewValue, flag)
	if EditTextViewGlobal then

		if EditTextViewGlobal.getFilterSensitiveWordFlag(EditTextViewGlobal) then
			Log.i("----------------EditTextView strNewValue=",strNewValue," flag=",flag)
			strNewValue = ToolKit.shieldSensitiveWord(strNewValue);
			Log.v("................EditTextView after shild strNewValue = ",  strNewValue);
		else
			Log.v("................EditTextView do not filter sensitive word");
		end

        EditTextViewGlobal:setVisible(true)
		strNewValue = string.gsub((strNewValue or ""), "\\", "\\\\");
		EditTextViewGlobal.setText(EditTextViewGlobal,strNewValue);
		if (not strNewValue) or strNewValue == "" or strNewValue == EditTextViewGlobal.m_hintText then
			EditTextViewGlobal.setText(EditTextViewGlobal,EditTextViewGlobal.m_hintText,nil,nil,EditTextViewGlobal.m_hintTextColorR,EditTextViewGlobal.m_hintTextColorG,EditTextViewGlobal.m_hintTextColorB);
		else
			EditTextViewGlobal.setText(EditTextViewGlobal,strNewValue,nil,nil,EditTextViewGlobal.m_textColorR,EditTextViewGlobal.m_textColorG,EditTextViewGlobal.m_textColorB);
		end
		EditTextViewGlobal.onTextChange(EditTextViewGlobal,flag);
	end
	EditTextViewGlobal = nil;
end

EditTextView.nativeEditViewMove = function(self,status,json_data)
    if not (status and json_data) then
		return;
    end
    local offset = GetNumFromJsonTable(json_data,"offset",75); 
    Log.v("EditTextView.nativeEditViewMove offset=",offset);
    local isHidekeyboard = GetNumFromJsonTable(json_data,"isHideKeyboard",0);
   	self:__moveRootView(offset, isHidekeyboard);
end

EditTextView.__moveRootView = function(self, offset, isHidekeyboard)
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

EditTextView.onNativeEvent = function(self,param,...)
	if self.s_nativeEventFuncMap[param] then
		self.s_nativeEventFuncMap[param](self,...);
	end
end

EditTextView.s_nativeEventFuncMap = {
	["moveView"]       = EditText.nativeEditViewMove;
};