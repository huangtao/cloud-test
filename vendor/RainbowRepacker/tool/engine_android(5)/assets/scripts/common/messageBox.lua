require("common/commonGameLayer");
require("common/uiFactory");
local messageBox = require(ViewPath.."common/messageBox")

MessageBox = class(CommonGameLayer,false);

MessageBox.s_width = 600;
MessageBox.s_height = 200;
MessageBox.s_level = 15;

MessageBox.s_defaultSheildBgImage = "hall/common/bg_shiled.png";


MessageBox.setDefaultImage = function(sheildBgImg)
	MessageBox.s_defaultSheildBgImage = sheildBgImg or MessageBox.s_defaultSheildBgImage;
end 


MessageBox.s_controls = 
{
	Title = 1;
	TwoButtonView = 2;
	SingleButtonView = 3;

	SingleButton = 4;

	ButtonOK = 5;
	ButtonCancle = 6;

	CloseButton = 7;

	MainView = 8;

	SingleButtonText = 9;
	ButtonOkText = 10;
	ButtonCancleText = 11;
	Bg = 12;
	ContentTextCentre = 13;
	ContentText = 14;
	ContentBg = 15;
	shadeBg = 16;
	topView = 17;
	smallTips = 18;
	centerView = 19;
	titleBg		= 20;
};


MessageBox.ctor = function(self, title, content, button1Text, button2Text, doNeedCloseBtn, subView, smallTips, width, height, textAlign, textColor, textSize)
	super(self,messageBox);
	self.m_ishowing = true;
	self.m_root:setAlign(kAlignCenter);
	self:setLevel(MessageBox.s_level);
	
	self.m_ctrls = MessageBox.s_controls;

	self:findViewById(self.m_ctrls.CloseButton):setVisible(doNeedCloseBtn);

	if button2Text then
		self:initTwoButtonsView(title, button1Text, button2Text);
	else
		self:initSingleButtonsView(title, button1Text);
	end
	local doubleContent = self:findViewById(self.m_ctrls.MainView);
	local singleContent = self:findViewById(self.m_ctrls.ContentTextCentre);
	local titleText = self:findViewById(self.m_ctrls.Title);
	local contentText = self:findViewById(self.m_ctrls.ContentText);
	local topView = self:findViewById(self.m_ctrls.topView);
	local centerView = self:findViewById(self.m_ctrls.centerView);
	local titleBg = self:findViewById(self.m_ctrls.titleBg);
	local topTitle = titleBg:getChildByName("title");
	self.m_shadeBg = self:findViewById(self.m_ctrls.shadeBg);
	self.m_shadeBg:setFile(MessageBox.s_defaultSheildBgImage);
	if subView then
		topView:setVisible(false);
		doubleContent:setVisible(true);
		singleContent:setVisible(false);
		titleText:setVisible(false);
		contentText:setVisible(false);
		if title then 
			topTitle:setText(title);
		end
		self:initSubView(subView);
	else
		if title and content then
			doubleContent:setVisible(true);
			singleContent:setVisible(false);
			topView:setVisible(false);
			titleText:setText(title);
			contentText:setText(content);
			topTitle:setText(title);
			if textAlign or textColor or textSize then 
				contentText:setVisible(false);
				local w, h = contentText:getSize();
				local x, y = contentText:getPos();

				textAlign = textAlign or kAlignCenter;
				textSize = textSize or 34;
				textColor = textColor or {118,72,18};
				local newContentText = new(TextView, content, w, h, textAlign, nil, textSize, textColor[1], textColor[2], textColor[3]);
				newContentText:setPos(x, y);
				newContentText:setAlign(kAlignCenter);
				doubleContent:addChild(newContentText);
			end
		else
			topView:setVisible(false);
			doubleContent:setVisible(false);
			singleContent:setVisible(true);
			singleContent:setText(title or content);
		end
	end
	if doNeedCloseBtn then
		self:findViewById(self.m_ctrls.Bg):setEventTouch(self,MessageBox.onShadeBgClick);
	else
		self:findViewById(self.m_ctrls.Bg):setEventTouch(self,MessageBox.onEmptyFunc);
	end
	self:findViewById(self.m_ctrls.Bg):setEventDrag(self,MessageBox.onEmptyFunc);
	
	if smallTips and string.len(smallTips) > 0 then 
		local txtSmallTips = self:findViewById(self.m_ctrls.smallTips);
		txtSmallTips:setText(smallTips);
		txtSmallTips:setVisible(true);
	end
	if number.valueOf(width) > 0 then 
		centerView:setSize(width, nil);
	end

	if number.valueOf(height) > 0 then  
		centerView:setSize(nil, height);
	end
end

MessageBox.dtor = function(self)
	IPopDialogManager.getInstance():removePopDialog(self);
end

MessageBox.setIsShowDirect = function(isShow)
	-- body
	MessageBox.s_isShowDirect = isShow;
end

MessageBox.isShowDirect = function()
	-- body
	if MessageBox.s_isShowDirect == false then
		return false;
	end
	return true;
end

MessageBox.show = function(title, content, button1Text, button2Text, doNeedCloseBtn, okObj, okFunc, cancleObj, cancleFunc, closeObj, closeFunc, smallTips, width, height, textAlign)
	MessageBox.hide();
	if not MessageBox.isShowDirect() then
		return;
	end
	MessageBox.s_instance = new(MessageBox, title, content, button1Text, button2Text,doNeedCloseBtn, nil, smallTips, width, height, textAlign);
	MessageBox.s_instance:setCallbackFunc(okObj, okFunc, cancleObj, cancleFunc, closeObj, closeFunc);
	MessageBox.s_instance:addToRoot();
	MessageBox.s_instance:setFillParent(true,true);

	return MessageBox.s_instance;
end

MessageBox.showWithParams = function(params)
	MessageBox.hide();
	if not MessageBox.isShowDirect() then
		return;
	end

	if not (params.title or params.subView) then
		return;
	end

	local title = params.title; --标题

	local text = params.text; --文本
	local textAlign = params.textAlign; --文本对齐方式
	local textColor = params.textColor; --文本颜色(eg {200,200,200})
	local textSize = params.textSize;--文本字体大小

	local subView = params.subView; --子控件 会添加到MainView上， 对齐方式以及位置由subView自己控制

	local okBtnText = params.okBtnText;--2个时指左边那个， 一个时就是它
	local okObj = params.okObj;
	local okFunc = params.okFunc;
	local cancleBtnText = params.cancleBtnText;
	local cancleObj = params.cancleObj;
	local cancleFunc = params.cancleFunc;
	local doNeedCloseBtn = params.doNeedCloseBtn or (params.doNeedCloseBtn == nil); --是否需要关闭按钮 默认为true
	local closeObj = params.closeObj;
	local closeFunc = params.closeFunc;

	local smallTips = params.smallTips; --弹框底部提示语

	local width = params.width; --弹框宽
	local height = params.height; -- 弹框高

	if text then
		--如果text存在，则认为是显示文本
		MessageBox.s_instance = new(MessageBox, title, text, okBtnText, cancleBtnText, doNeedCloseBtn, nil, smallTips, width, height, textAlign, textColor, textSize);
	else
		--subView
		MessageBox.s_instance = new(MessageBox, title, nil, okBtnText, cancleBtnText, doNeedCloseBtn, subView, smallTips, width, height);
	end
	MessageBox.s_instance:setCallbackFunc(okObj, okFunc, cancleObj, cancleFunc, closeObj, closeFunc);
	MessageBox.s_instance:addToRoot();
	MessageBox.s_instance:setFillParent(true,true);
end

MessageBox.showView = function(title, button1Text, button2Text, subView, doNeedCloseBtn, okObj, okFunc, cancleObj, cancleFunc, closeObj, closeFunc, smallTips, width, height)
	MessageBox.hide();
	if not MessageBox.isShowDirect() then
		return;
	end
	MessageBox.s_instance = new(MessageBox,title, nil, button1Text, button2Text,doNeedCloseBtn,subView, smallTips, width, height);
	MessageBox.s_instance:setCallbackFunc(okObj, okFunc, cancleObj, cancleFunc, closeObj, closeFunc);
	MessageBox.s_instance:addToRoot();
	MessageBox.s_instance:setFillParent(true,true);
end



MessageBox.hide = function()
	delete(MessageBox.s_instance);
	MessageBox.s_instance = nil;
end

MessageBox.isShowing = function()
	-- body
	if MessageBox.s_instance then
		return MessageBox.s_instance.m_ishowing;
	end
	return false;
end

MessageBox.setButtonOK = function(filePath)
    MessageBox.s_instance.m_ButtonOK = MessageBox.s_instance:findViewById(MessageBox.s_instance.m_ctrls.ButtonOK);
    MessageBox.s_instance.m_ButtonOK:setFile(filePath or "");
end

MessageBox.setButtonCancle = function(filePath)
    MessageBox.s_instance.m_ButtonCancle = MessageBox.s_instance:findViewById(MessageBox.s_instance.m_ctrls.ButtonCancle);
    MessageBox.s_instance.m_ButtonOK:setFile(filePath or "");
end

MessageBox.setSingleButton = function( filePath)
    MessageBox.s_instance.m_SingleButton = MessageBox.s_instance:findViewById(MessageBox.s_instance.m_ctrls.SingleButton);
    MessageBox.s_instance.m_ButtonOK:setFile(filePath or "");
end

MessageBox.setCloseButton = function(filePath)
    MessageBox.s_instance.m_CloseButton = MessageBox.s_instance:findViewById(MessageBox.s_instance.m_ctrls.CloseButton);
    MessageBox.s_instance.m_ButtonOK:setFile(filePath or "");
end

MessageBox.setCallbackFunc = function(self,okObj,okFunc,cancleObj,cancleFunc,closeObj,closeFunc)
	self.m_okFunc = okFunc;
	self.m_okObj = okObj;
	self.m_cancleFunc = cancleFunc;
	self.m_cancleObj = cancleObj;
	self.m_closeFunc = closeFunc;
	self.m_closeObj = closeObj;
end


MessageBox.onShadeBgClick = function(self)
	--屏蔽作用
end

MessageBox.onBgClick = function(self)
	-- body
	Log.v("------------MessageBox.onBgClick--------------");
end

MessageBox.onEmptyFunc = function(self)
	--屏蔽作用
	-- Log.d("MessageBox.onEmptyFunc");
end

MessageBox.onSingleButtonClicked = function(self)
	MessageBox.hide();
	if self.m_okFunc then
		self.m_okFunc(self.m_okObj);
	end
end

MessageBox.onOkButtonClicked = function(self)
	MessageBox.hide();
	if self.m_okFunc then
		self.m_okFunc(self.m_okObj);
	end
end

MessageBox.onCancleButtonClicked = function(self)
	MessageBox.hide();
	if self.m_cancleFunc then
		self.m_cancleFunc(self.m_cancleObj);
	end
end

MessageBox.onCloseButtonClicked = function(self)
	MessageBox.hide();
	if self.m_closeFunc and self.m_closeObj then
		self.m_closeFunc(self.m_closeObj);
	end
end

MessageBox.initSubView = function(self, subView)
	local mainView = self:findViewById(self.m_ctrls.MainView);
	mainView:addChild(subView);
	-- subView:setAlign(kAlignCenter);
end

MessageBox.initTwoButtonsView = function(self, title, button1Text, button2Text)
	self:findViewById(self.m_ctrls.SingleButtonView):setVisible(false);
	self:findViewById(self.m_ctrls.TwoButtonView):setVisible(true);

	local textCtrls = {
		self.m_ctrls.Title,
		self.m_ctrls.ButtonOkText,
		self.m_ctrls.ButtonCancleText,
	};

	local texts = {
		title,
		button1Text,
		button2Text
	};

	self:setTexts(textCtrls,texts);
end

MessageBox.initSingleButtonsView = function(self,title, button1Text)
	self:findViewById(self.m_ctrls.SingleButtonView):setVisible(true);
	self:findViewById(self.m_ctrls.TwoButtonView):setVisible(false);

	local textCtrls = {
		self.m_ctrls.Title,
		self.m_ctrls.SingleButtonText,
	};

	local texts = {
		title,
		button1Text,
	};

	self:setTexts(textCtrls,texts);
end

MessageBox.setTexts = function(self,ctrls,texts)
	for k,v in ipairs(table.verify(ctrls)) do
		self:findViewById(v):setText(texts[k]);
	end
end

MessageBox.s_controlConfig = 
{
	[MessageBox.s_controls.shadeBg] = {"shadeBg"};
	[MessageBox.s_controls.Bg] = {"centerView" ,"bg"};
	[MessageBox.s_controls.Title] = {"centerView" ,"topView","desc"};
	[MessageBox.s_controls.ContentText] = {"centerView" ,"mainView","content"};
	[MessageBox.s_controls.topView] = {"centerView" ,"topView"};
	[MessageBox.s_controls.ContentTextCentre] = {"centerView" ,"content_centre"};
	[MessageBox.s_controls.TwoButtonView] = {"centerView" , "bottomView", "twoBtnsView"};
	[MessageBox.s_controls.SingleButtonView] = {"centerView" , "bottomView", "singleBtnView"};

	[MessageBox.s_controls.SingleButton] = {"centerView" ,"bottomView",  "singleBtnView","btn1"};

	[MessageBox.s_controls.ButtonOK] = {"centerView" , "bottomView", "twoBtnsView","btn1"};
	[MessageBox.s_controls.ButtonCancle] = {"centerView" , "bottomView", "twoBtnsView","btn2"};

	[MessageBox.s_controls.CloseButton] = {"centerView" ,  "closeBtn"};

	[MessageBox.s_controls.MainView] = {"centerView" ,  "mainView"};

	[MessageBox.s_controls.SingleButtonText] = {"centerView" ,  "bottomView", "singleBtnView","btn1","btn1Text"};
	[MessageBox.s_controls.ButtonOkText] = {"centerView" ,  "bottomView", "twoBtnsView","btn1","btn1Text"};
	[MessageBox.s_controls.ButtonCancleText] = {"centerView" , "bottomView",  "twoBtnsView","btn2","btn2Text"};
	
	[MessageBox.s_controls.smallTips]		= {"centerView", "smallTips"};
	[MessageBox.s_controls.centerView]		= {"centerView"};
	[MessageBox.s_controls.titleBg]			= {"centerView", "titleBg"};

};

MessageBox.s_controlFuncMap = 
{
	[MessageBox.s_controls.SingleButton] = MessageBox.onSingleButtonClicked;
	[MessageBox.s_controls.ButtonOK] = MessageBox.onOkButtonClicked;
	[MessageBox.s_controls.ButtonCancle] = MessageBox.onCancleButtonClicked;
	[MessageBox.s_controls.CloseButton]= MessageBox.onCloseButtonClicked;
    [MessageBox.s_controls.Bg]= MessageBox.onShadeBgClick;
	[MessageBox.s_controls.ContentBg]= MessageBox.onEmptyFunc;
	[MessageBox.s_controls.shadeBg]= MessageBox.onShadeBgClick;
};