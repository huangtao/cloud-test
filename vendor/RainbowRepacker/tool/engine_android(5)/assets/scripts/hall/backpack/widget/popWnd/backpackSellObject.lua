-- BackpackSellObject.lua
-- Author:Demon
-- Date:2016/12/28
-- Last modification:
-- Description:回兑物品
-- Note:
require("hall/backpack/data/backpackDataInterface");

local hallLayerBaseWithName = require("hall/widget/hallLayerBaseWithName");
local BackpackSellObject = class(hallLayerBaseWithName,false);
BackpackSellObject.s_layerName = "case_sell_object";


BackpackSellObject.ctor = function(self,p_data)   
    local __layout = require(ViewPath .. "hall/newObjectCase/newObjectCaseSell");
    super(self,__layout,nil,BackpackSellObject.s_layerName );
    self:declareLayoutVar(ViewPath.."hall/newObjectCase/newObjectCaseSell".."_layout_var");
 
    self.m_data = p_data;
    self.m_sellMoneyId = tonumber(self.m_data.reverse[1].moneytype) or 0;
    self.m_sellPrice = tonumber(self.m_data.reverse[1].num) or 0;

    self:setFillParent(true, true);
    self:addToRoot();

    BackpackDataInterface.getInstance():setObserver(self);

    self:getHandle();
    self:init();

    self:__initSellInfoByNum(1);
    self:setListenBackEvent(true);
end

BackpackSellObject.dtor = function(self) 
    BackpackDataInterface.getInstance():clearObserver(self); 
    self:cleanAnim();
end

--得到相关句柄
BackpackSellObject.getHandle = function(self)
    self:getComponent();
    self:runUiAction(UiAnimConfig.ACTION.BEGIN, self.mm_ImageBack);
end 

BackpackSellObject.init = function(self)
    ImageCache.getInstance():request(self.m_data.iconPath,self,self.onGetImage);
    self.mm_name:setText(self.m_data.name);
    self.mm_Text_numOrday:setText("数量： "..self.m_data.number);
    local _iconImagePaht = self.IMAGE.iso_gold;
    if self.m_sellMoneyId == 1 then
        _iconImagePaht = self.IMAGE.iso_crystal;
    end
    self.mm_Image_money:setFile(_iconImagePaht);

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

BackpackSellObject.onGetImage = function(self,url,imagePath)
   local icon = UIFactory.createImage(imagePath);
    if icon then
        local w,h = self.mm_icon:getSize();
        local iconW , iconH = icon:getSize();
        local scaleW = iconW>iconH and w or h*iconW/iconH;
        local scaleH = iconW>iconH and w*iconH/iconW or h;
        icon:setSize(scaleW,scaleH);
        icon:setAlign(kAlignCenter);
        self.mm_iconFrame:removeChild(self.mm_icon,true);
        self.mm_iconFrame:addChild(icon);
        self.mm_icon = icon;
    end
end

BackpackSellObject.__initSellInfoByNum = function(self,p_num)
    if p_num< 1 then
        return -1;
    end
    if p_num > self.m_data.number then
        return -2;
    end
    self.m_changeNum = p_num;
    self.mm_Text_num:setText(p_num);
    local __getMoneyNum = p_num * self.m_sellPrice;
    self.mm_Text_money:setText(__getMoneyNum);

    return 0;
end

BackpackSellObject.onChangeGoldButton = function(self,finger_action,isAdd)
    if finger_action == kFingerDown then
        self:cleanAnim();
        BackpackSellObject.ainm =  new(AnimInt , kAnimRepeat, 0, 1 ,200, 0);
        BackpackSellObject.ainm:setDebugName("BackpackSellObject.ainmSub");
        local flag = 1 ;
        BackpackSellObject.ainm:setEvent(nil, function() 
            flag = flag + 1;

            if flag > 3 then
                --得到增加后的数量，并检查合法性
                local _addedNum;
                if isAdd then
                    _addedNum = tonumber(self.m_changeNum) + 1;
                else
                    _addedNum = tonumber(self.m_changeNum) - 1;
                end 
                
                local _isOk = self:__initSellInfoByNum(_addedNum);
                if _isOk then
                    
                else
                    self:cleanAnim();
                end 
            end
        end);
    elseif finger_action == kFingerUp or finger_action == kFingerCancel then
        local _addedNum ;
        if isAdd then
            _addedNum = tonumber(self.m_changeNum) + 1;
        else
            _addedNum = tonumber(self.m_changeNum) - 1;
        end 
        local _isOk = self:__initSellInfoByNum(_addedNum);
        self:cleanAnim();
    end
end

BackpackSellObject.cleanAnim = function(self)
    if BackpackSellObject.ainm then
        delete(BackpackSellObject.ainm)
        BackpackSellObject.ainm= nil;
    end
end

BackpackSellObject.oncloseBtnClick = function(self)
    self:close();
end

BackpackSellObject.onBindToSell = function(self)
    BackpackDataInterface.getInstance():requestSell(self.m_data,self.m_changeNum,self.m_sellMoneyId);
end

BackpackSellObject.onSellCallBack = function(self,isSuccess,data,sendParam)
    if isSuccess then
        local __moneyName = self.m_sellMoneyId == 0 and "银币" or "金条";
        local __moneyNum = self.m_changeNum*self.m_sellPrice;
        Toast.getInstance():showText("恭喜获得"..__moneyNum..__moneyName,50,30,kAlginLeft,"",26,255,255,255);
        self:close();
        -- self.m_data.number = self.m_data.number - self.m_changeNum;
        -- self:__initSellInfoByNum(1);
    else
        --Toast.getInstance():showText("兑换失败",50,30,kAlginLeft,"",26,255,255,255);
        self:close();
    end
end
 
BackpackSellObject.onBindSub = function(self,finger_action)
    self:onChangeGoldButton(finger_action,false);
end

BackpackSellObject.onBindAdd = function(self,finger_action)
    self:onChangeGoldButton(finger_action,true);
end

return BackpackSellObject;