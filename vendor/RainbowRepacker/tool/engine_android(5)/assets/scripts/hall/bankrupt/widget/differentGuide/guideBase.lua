--在基类里面把所有的句柄，提取出来。。
-- GuideBase.lua
-- Author:Demon
-- Date:2016/1/6
-- Last modification:
-- Description:
-- Note:
local brokeAllowanceComponent = require(BrokeAllowanceViewPath .."brokeAllowanceComponent");
require("hall/bankrupt/data/bankruptInterface");

local _index = 0;
local function getIndex()
	_index = _index + 1;
	return _index;
end	

local GuideBase = class(CommonGameLayer,false);

GuideBase.s_controls =
{
	Image_frame       = getIndex(),
	Image_iconMatch   = getIndex(),
	Button_go         = getIndex(),
	Text_button       = getIndex(),
	Text_tittleRight  = getIndex(),
	Text_tittleLeft   = getIndex(),
	Text_tittleMiddle = getIndex(),
	Image_iconGold    = getIndex(),
	Image_iconShare   = getIndex(),
	Image_iconSafeBox = getIndex(),
	View_upTip        = getIndex(),
	Text_tips         = getIndex(),
	View_downTip      = getIndex(),
	View_money_count   = getIndex(),
	Text_money_count  = getIndex(),
	Image_cut_cd	  = getIndex(),
};

GuideBase.ctor = function(self)
    super(self,brokeAllowanceComponent);
	self:_init();
end

GuideBase.dtor = function(self)	
	BrokeTimerCountDown.stop();
end

GuideBase._getHandle = function(self)
	self.m_Image_frame = self:findViewById(self.s_controls.Image_frame);
	self.m_Text_tips = self:findViewById(self.s_controls.Text_tips);
    self.m_Button_go = self:findViewById(self.s_controls.Button_go);
    self.m_Text_button = self:findViewById(self.s_controls.Text_button);
    self.m_Text_tittleRight = self:findViewById(self.s_controls.Text_tittleRight);
    self.m_Text_tittleLeft = self:findViewById(self.s_controls.Text_tittleLeft);
    self.m_Text_tittleMiddle = self:findViewById(self.s_controls.Text_tittleMiddle);

    self.m_Image_iconMatch = self:findViewById(self.s_controls.Image_iconMatch);
    self.m_Text_Image_iconGold = self:findViewById(self.s_controls.Image_iconGold);
    self.m_Image_iconShare = self:findViewById(self.s_controls.Image_iconShare);
    self.m_Image_iconSafeBox = self:findViewById(self.s_controls.Image_iconSafeBox);
    self.m_View_upTip = self:findViewById(self.s_controls.View_upTip);
    self.m_View_downTip = self:findViewById(self.s_controls.View_downTip);
    self.m_View_money_count = self:findViewById(self.s_controls.View_money_count);
    self.m_Text_money_count = self:findViewById(self.s_controls.Text_money_count);
    self.m_Image_cut_cd = self:findViewById(self.s_controls.Image_cut_cd);
end	

--virtual 子类可在继承父类的基础上，根据自身的情况初始化控件
GuideBase._init = function(self)
	self:_getHandle(); 		
    self:setSize(self.m_root:getSize());
    self.m_Button_go:setOnClick(self,self._onbutton_goClick);									
end	

--virtual 子类根据自己的需要定义
GuideBase._onbutton_goClick = function(self)
    if self.m_data.func and type(self.m_data.func) == "function" then
        self.m_data.func();
    end
end

GuideBase._countDownTime = function(self,startTime,endTime)
    require("hall/bankrupt/widget/brokeTimerCountDown");
    BrokeTimerCountDown.stop();
    if kUserInfoData:getIsVip() then ---是VIP用户	
		local actualTime = kBankruptDataInterface:getVipActualTime();		
		BrokeTimerCountDown.play(actualTime, endTime, self, self._onTimer,1,30);
	else  ---不是VIP的情况
		BrokeTimerCountDown.play(startTime, endTime, self, self._onTimer,1000,1);
	end
end

GuideBase._onTimer = function(self, dtype, time)

    if tonumber(time) < 0 then 
		time = 0;
	end
	self:setTimeCountText(time);

    if dtype == BrokeTimerCountDown.type_going then 
	elseif dtype == BrokeTimerCountDown.type_stop then
		BrokeTimerCountDown.stop();
		--触发刷新
		kBankruptDataInterface:freshView();
	end
end

GuideBase.setTimeCountText = function(self, time)
	local minute = math.floor(time/ 60);
	local minute01 = 0;
	local minute02 = 0;
	if minute>=10 then
		minute01 = math.floor(minute/10);
		minute02 = minute % 10;
	else
		minute02 = minute;
	end
	local second = time % 60;
	local second01 = 0;
	local second02 = 0;
	if second>=10 then
		second01 = math.floor(second/10);
		second02 = second % 10;
	else
		second02 = second;
	end
	
    local _text = ""..minute01..minute02..":"..second01..second02;
    self.m_Text_tittleRight:setText(_text);
end

GuideBase.s_controlConfig = 
{
	[GuideBase.s_controls.Image_frame]       = {"Image_frame"},
	[GuideBase.s_controls.Image_iconMatch]   = {"Image_frame", "Image_iconMatch"},
	[GuideBase.s_controls.Button_go]         = {"Image_frame", "Button_go"},
	[GuideBase.s_controls.Text_button]       = {"Image_frame", "Button_go", "Text_button"},
	[GuideBase.s_controls.Text_tittleRight]  = {"Image_frame", "Text_tittleRight"},
	[GuideBase.s_controls.Text_tittleLeft]   = {"Image_frame", "Text_tittleLeft"},
	[GuideBase.s_controls.Text_tittleMiddle] = {"Image_frame", "Text_tittleMiddle"},
	[GuideBase.s_controls.Image_iconGold]    = {"Image_frame", "Image_iconGold"},
	[GuideBase.s_controls.Image_iconShare]   = {"Image_frame", "Image_iconShare"},
	[GuideBase.s_controls.Image_iconSafeBox] = {"Image_frame", "Image_iconSafeBox"},
	[GuideBase.s_controls.View_upTip]        = {"Image_frame", "View_upTip"},
	[GuideBase.s_controls.Text_tips]         = {"Image_frame", "View_upTip", "Text_tips"},
	[GuideBase.s_controls.View_downTip]      = {"Image_frame", "View_downTip"},
	[GuideBase.s_controls.View_money_count]   = {"Image_frame", "View_money_count"},
	[GuideBase.s_controls.Text_money_count]  = {"Image_frame", "View_money_count","Text_money_count"},
	[GuideBase.s_controls.Image_cut_cd]  	 = {"Image_frame", "Image_cut_cd"},

};


return GuideBase;