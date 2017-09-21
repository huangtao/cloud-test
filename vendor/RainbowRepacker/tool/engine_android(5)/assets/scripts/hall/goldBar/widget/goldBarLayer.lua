-- GoldBarLayer.lua
-- Author:Demon
-- Date:2016/7/27
-- Last modification:
-- Description:
-- Note:
local goldBarLayout = require(ViewPath .. "hall/goldBar/goldBarLayout");
require('hall/goldBar/data/goldBarDataInterface');

local _index = 0;
local function getIndex()
	_index = _index + 1;
	return _index;
end	

local hallLayerBaseWithName = require("hall/widget/hallLayerBaseWithName")
local GoldBarLayer = class(hallLayerBaseWithName,false);
GoldBarLayer.s_layerName = "goldBar";

GoldBarLayer.animAdd = nil;
GoldBarLayer.animSub = nil;


GoldBarLayer.s_controls =
{
	closeBtn             = getIndex(),	
	Text_rate_gold       =getIndex(),
	Text_needGold	     =getIndex(),
	Text_rate_goldBar      =getIndex(),
	Button_least         =getIndex(),
	Button_sub           =getIndex(),
	Button_add           =getIndex(),
	Button_max           =getIndex(),
	Text_goldBar_num       =getIndex(),
	Button_exchange      =getIndex(),
	Text_tip             =getIndex(),
};



GoldBarLayer.ctor = function(self,p_data)	
 
	super(self,goldBarLayout,nil,GoldBarLayer.s_layerName);
	self.m_data = p_data or {};
    self.m_changeNum = 0;
	self:setLevel(21);
	self:setFillParent(true, true);
    self:addToRoot();
    GoldBarDataInterface.getInstance():setObserver(self);
    self:getHandle();
	self:init();
end

GoldBarLayer.dtor = function(self)	
    GoldBarDataInterface.getInstance():clearObserver(self);
	self:cleanAnim();
end


--得到相关句柄
GoldBarLayer.getHandle = function(self)

	self:getComponent(GoldBarLayer);

	--重写增加和减少银币按钮的onClick
	local _onClick = function(self, finger_action, x, y, drawing_id_first, drawing_id_current)
        if not self.m_enable then
		    return;
	    end
	
	    if finger_action == kFingerDown then
	       self.m_showEnbaleFunc(self,false);
           
	    elseif finger_action == kFingerMove then

	    elseif finger_action == kFingerUp then
		    self.m_showEnbaleFunc(self,true);
		 
		    kEffectPlayer:play(EffectsCommon.AudioButtonClick);

	    elseif finger_action==kFingerCancel then
		    self.m_showEnbaleFunc(self,true)
	    end

        if self.m_eventCallback.func then
                 self.m_eventCallback.func(self.m_eventCallback.obj,finger_action,x,y,
                	drawing_id_first,drawing_id_current,unpack(self.bindData));
        end	
       
	end

	self.mm_Button_add.onClick = _onClick;
    self.mm_Button_add:setEventTouch(self.mm_Button_add,self.mm_Button_add.onClick);

	self.mm_Button_sub.onClick = _onClick;
    self.mm_Button_sub:setEventTouch(self.mm_Button_sub,self.mm_Button_sub.onClick);

end	

GoldBarLayer.init = function(self) 
	GoldBarDataInterface.getInstance():getGoldBarConfig(true);
	self:refresh();
end

GoldBarLayer.refresh = function(self) 
	self.m_data.config = GoldBarDataInterface.getInstance():getGoldBarConfig();
    
	if table.isEmpty(self.m_data.config) then 
		return ;
	end
 
	self.mm_Text_rate_gold:setText(self:changeStringFormat(self.m_data.config.rate_gold));
	self.mm_Text_rate_goldBar:setText(self:changeStringFormat(self.m_data.config.rate_goldBar));

	if (self.m_changeNum == 0) or (self:_goldNumIsOk(self.m_changeNum)~= 0) then
		self.m_changeNum = self.m_data.config.least;
	end	
    
    self.mm_Text_needGold:setText("需要："..self.m_changeNum.."银币");
	self.mm_Text_goldBar_num:setText(self:changeStringFormat(self.m_changeNum*self.m_data.config.rate_goldBar/self.m_data.config.rate_gold));

	local setButtonState = function(p_bool)
		self.mm_Button_exchange:setEnable(p_bool);
		--self.mm_Button_least:setEnable(p_bool);
		--self.mm_Button_sub:setEnable(p_bool);
		--self.mm_Button_add:setEnable(p_bool);
		--self.mm_Button_max:setEnable(p_bool);
	end

	--是否可以兑换

    local _state = self:_goldNumIsOk(self.m_data.config.least);

    if _state == 0 then
    	local goldBarNum = self.m_data.config.max*self.m_data.config.rate_goldBar/self.m_data.config.rate_gold;
    	goldBarNum = math.ceil(goldBarNum);
        self.mm_Text_tip:setVisible(true);
        self.mm_Text_tip:setText("您今天还可兑换"..goldBarNum.."金条");
		setButtonState(true);
    elseif _state == 2 or _state == 1 then
        self.mm_Text_tip:setVisible(true);
		setButtonState(false);
		local leastMoney = BankruptDataInterface.getInstance():getBankruptLowestMoney() + self.m_data.config.least;
		self.mm_Text_tip:setText("您需要达到"..leastMoney.."银币，才可进行兑换");
    elseif  _state == 3 then 
        self.mm_Text_tip:setVisible(true);
		setButtonState(false);
		local __num = self.m_data.config.maxForEveryDay*self.m_data.config.rate_goldBar/self.m_data.config.rate_gold;
		self.mm_Text_tip:setText("每天只可兑换"..__num.."金条，今日已达兑换上限。");
    end

end

GoldBarLayer.changeStringFormat = function(self,p_num) 
	local numString = "";
	numString = ToolKit.skipMoney(p_num);
	return numString;
end

GoldBarLayer.onGetGoldBarConfig = function(self,isSuccess, data) 
	if isSuccess then
		self:refresh();
	end	
end

GoldBarLayer.onExchangeCallBack = function(self,isSuccess, data) 
	self:refresh();
	if isSuccess then
		Toast.getInstance():showText(self.changeSuccseDes, 50, 30, kAlignLeft, "", 24, 200, 175, 110);
	else
		local __str = data.errorTips or "兑换失败！";
		Toast.getInstance():showText(__str, 50, 30, kAlignLeft, "", 24, 200, 175, 110);
	end	
end

GoldBarLayer.getRealMax = function(self) 
    local _max = self.m_data.config.max;

    if _max < self.m_data.config.least then
        _max = self.m_data.config.least;
    else
        if UserInfoData.getInstance():getMoney() -  BankruptDataInterface.getInstance():getBankruptLowestMoney() < _max then
            if UserInfoData.getInstance():getMoney() -  BankruptDataInterface.getInstance():getBankruptLowestMoney() < self.m_data.config.least then
                _max = self.m_data.config.least;
            else
                local _tmpNum = math.fmod(UserInfoData.getInstance():getMoney() -  BankruptDataInterface.getInstance():getBankruptLowestMoney(),self.m_data.config.rate_gold);
                _max = UserInfoData.getInstance():getMoney() -  BankruptDataInterface.getInstance():getBankruptLowestMoney() - _tmpNum;
            end
        end
    end

    return _max;
end

GoldBarLayer.setExchangeGold = function(self,p_num)
	if p_num and type(p_num) == 'number' then
		self.mm_Text_needGold:setText("需要："..p_num.."银币");
        self.m_changeNum = p_num;
		self.mm_Text_goldBar_num:setText(self:changeStringFormat(p_num*self.m_data.config.rate_goldBar/self.m_data.config.rate_gold));
	end
end

GoldBarLayer._goldNumIsOk = function(self,p_num)  -- -1:输入类型错误
                                                --  0：正常
                                                --  1：小于最小值
                                                --  2：导致破产
                                                --  3：大于最大值

    local _state = 0;

    if (not p_num) or type(p_num) ~= 'number' then
		Log.v("GoldBarLayer.goldNumIsOk","必须输入数字");
		_state = -1 ;
        return _state ;
	end 

    --不能大于每天上线
	if p_num > self.m_data.config.max then
        _state = 3;
	end

    --不能小于最小值
    if p_num < self.m_data.config.least then
       _state = 1;
	end

    	--不能导致破产
	if UserInfoData.getInstance():getMoney() - p_num < BankruptDataInterface.getInstance():getBankruptLowestMoney() then
        _state = 2;
	end

    return _state;

end

GoldBarLayer.goldNumIsOk = function(self,p_num)

    local state = self:_goldNumIsOk(p_num);

    if state == 0 then
        return true;
    else   
        if state == 1 then
			local __num = self.m_data.config.least*self.m_data.config.rate_goldBar/self.m_data.config.rate_gold;
            Toast.getInstance():showText("最少兑换"..__num.."金条！", 50, 30, kAlignLeft, "", 24, 200, 175, 110);
        elseif state == 2 then 
            Toast.getInstance():showText("再兑换，要破产了！", 50, 30, kAlignLeft, "", 24, 200, 175, 110);	   
        elseif state == 3 then
            Toast.getInstance():showText("已经超过上限！", 50, 30, kAlignLeft, "", 24, 200, 175, 110);		
        end    		
        return false; 
    end
end

GoldBarLayer.onChangeGoldButton = function(self,finger_action,isAdd)
	if finger_action == kFingerDown then
		self:cleanAnim();
		GoldBarLayer.ainm =  new(AnimInt , kAnimRepeat, 0, 1 ,200, 0);
		GoldBarLayer.ainm:setDebugName("GoldBarLayer.ainmSub");
		local flag = 1 ;
		GoldBarLayer.ainm:setEvent(nil, function() 
			flag = flag + 1;

			if flag > 3 then
				--得到增加后的数量，并检查合法性
				local _addedNum;
				if isAdd then
					_addedNum = tonumber(self.m_changeNum) + self.m_data.config.rate_gold;
				else
					_addedNum = tonumber(self.m_changeNum) - self.m_data.config.rate_gold;
				end	
				
				local _isOk = self:goldNumIsOk(_addedNum);
				if _isOk then
					self:setExchangeGold(_addedNum);
				else
					self:cleanAnim();
				end	
			end
		end);
	elseif finger_action == kFingerUp or finger_action == kFingerCancel then
		local _addedNum ;
        if isAdd then
			_addedNum = tonumber(self.m_changeNum) + self.m_data.config.rate_gold;
	    else
			_addedNum = tonumber(self.m_changeNum) - self.m_data.config.rate_gold;
	    end	
		local _isOk = self:goldNumIsOk(_addedNum);
		if _isOk then
			self:setExchangeGold(_addedNum);
		end	
		self:cleanAnim();
	end
end

GoldBarLayer.cleanAnim = function(self)
	if GoldBarLayer.ainm then
		delete(GoldBarLayer.ainm)
		GoldBarLayer.ainm= nil;
    end
end

--------------------------------------按钮回调---------------------------------------------
GoldBarLayer.oncloseBtnClick = function(self)
	self:close();
end

GoldBarLayer.onbutton_leastClick = function(self)
	self:setExchangeGold(self.m_data.config.least);
end

GoldBarLayer.onbutton_subClick = function(self,finger_action)
	self:onChangeGoldButton(finger_action,false);
end



GoldBarLayer.onbutton_addClick = function(self,finger_action)
	self:onChangeGoldButton(finger_action,true);
end

GoldBarLayer.onbutton_maxClick = function(self)
	self:setExchangeGold(self:getRealMax());
end

GoldBarLayer.onbutton_exchangeClick = function(self)
	local _num = tonumber(self.m_changeNum) or 0;
	local _isOk = self:goldNumIsOk(_num);
	if _isOk then
		local __goldBarNum = _num*self.m_data.config.rate_goldBar/self.m_data.config.rate_gold;
		GoldBarDataInterface.getInstance():exchangeGoldBar(__goldBarNum);
		self.changeSuccseDes = "成功使用".._num.."银币".."兑换了"..__goldBarNum.."金条";
	end
end
--------------------------------config and event---------------------------------
GoldBarLayer.s_controlConfig = 
{
	[GoldBarLayer.s_controls.closeBtn]             = {"ImageBack", "closeBtn"},
	[GoldBarLayer.s_controls.Text_rate_gold]       = { "ImageBack", "Image_textFrame", "Text_rate_gold"},
	[GoldBarLayer.s_controls.Text_needGold]        = { "ImageBack", "Text_needGold"},
	[GoldBarLayer.s_controls.Button_least]         = { "ImageBack", "View2", "Button_least"},
	[GoldBarLayer.s_controls.Text_rate_goldBar]      = { "ImageBack", "Image_textFrame", "Text_rate_goldBar"},
	[GoldBarLayer.s_controls.Button_sub]           = { "ImageBack", "View2", "Button_sub"},
	[GoldBarLayer.s_controls.Button_add]           = { "ImageBack", "View2", "Button_add"},
	[GoldBarLayer.s_controls.Button_max]           = { "ImageBack", "View2", "Button_max"},
	[GoldBarLayer.s_controls.Text_goldBar_num]       = { "ImageBack", "View2", "Image1", "Text_goldBar_num"},
	[GoldBarLayer.s_controls.Button_exchange]      = { "ImageBack", "Button_exchange"},
	[GoldBarLayer.s_controls.Text_tip]             = { "ImageBack", "Text_tip"},
};


GoldBarLayer.s_controlFuncMap = 
{
	
	[GoldBarLayer.s_controls.closeBtn]             = GoldBarLayer.oncloseBtnClick;
	[GoldBarLayer.s_controls.Button_least]         = GoldBarLayer.onbutton_leastClick;
	[GoldBarLayer.s_controls.Button_sub]           = GoldBarLayer.onbutton_subClick;
	[GoldBarLayer.s_controls.Button_add]           = GoldBarLayer.onbutton_addClick;
	[GoldBarLayer.s_controls.Button_max]           = GoldBarLayer.onbutton_maxClick;
	[GoldBarLayer.s_controls.Button_exchange]      = GoldBarLayer.onbutton_exchangeClick;
	
};


return GoldBarLayer;
