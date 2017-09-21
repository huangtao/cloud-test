local hallLayerBaseWithName = require("hall/widget/hallLayerBaseWithName");
local RechargePropLayer = class(hallLayerBaseWithName,false);

RechargePropLayer.Delegate = {
    goBack = "goBack";
    requestPayByCrystal = "requestPayByCrystal";
}

RechargePropLayer.s_layerName = "shop_gold_pay_info";

RechargePropLayer.ctor = function(self,goodInfo,num)

    local __layout = require(ViewPath .. "hall/shortCutRecharge/rechargePayPropLayout");
    super(self,__layout,nil,RechargePropLayer.s_layerName );
    self:declareLayoutVar(ViewPath .. "hall/shortCutRecharge/rechargePayPropLayout".."_layout_var");
    self:setSize( self.m_root:getSize() );
    kPropManager:setObserver(self);
    self:getHandle();
    self:init(goodInfo,num);
end

RechargePropLayer.dtor = function(self)
    self:setParent();
    self:execDelegate(RechargePropLayer.Delegate.goBack);
    kPropManager:clearObserver(self);
    RechargeDataInterface.getInstance():clearObserver(self);
end

RechargePropLayer.getHandle = function(self)
   self:getComponent(); 
   self:runUiAction(UiAnimConfig.ACTION.BEGIN, self.mm_ImageBack);
end

RechargePropLayer.init = function(self,goodInfo,num)
    self:show(goodInfo,num);

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

RechargePropLayer.show = function(self, goodInfo, num)

    if table.isEmpty(goodInfo) then
        self:onCloseBtnClick();
        return;
    end

    self:__showGoodsInfo(goodInfo, num);
end

RechargePropLayer.__showGoodsInfo = function(self, goodInfo, num)
    self.m_goodInfo = goodInfo;
    self.m_price = 0;
    self.m_currency = "";
    if self.m_goodInfo.crystal > 0 then
        self.m_price = self.m_goodInfo.crystal;
        self.m_currency = "金条";
    else
        self.m_price = self.m_goodInfo.pamount;
        self.m_currency = "银币";
    end

    local __moneyImagePath = self.IMAGE.iso_gold;
    if self.m_currency == "金条" then
        __moneyImagePath = self.IMAGE.iso_crystal;
    end
    self.mm_Image_money:setFile(__moneyImagePath);

    self:__refreshNumAndCost(1);
    self.mm_name:setText(self.m_goodInfo.name);

    self.onGetGoodsClassifyDetailInfoCallBack = function(self,id,goodInfo)
        if id == self.m_goodInfo.goods_id then
             self:__refreshDes(goodInfo);
            RechargeDataInterface.getInstance():clearObserver(self);
        end
    end
    require("hall/recharge/data/rechargeDataInterface");
    RechargeDataInterface.getInstance():setObserver(self);
    RechargeDataInterface.getInstance():requestGoodsDetailInfoById(self.m_goodInfo.goods_id);
    
    self:onGetImage(nil,"hall/common/goodIcon.png");
    ImageCache.getInstance():request(self.m_goodInfo.icon,self,self.onGetImage);

end

RechargePropLayer.onGetImage = function(self,url,imagePath)
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

RechargePropLayer.__refreshDes = function(self,goodInfo)
    typeDes = goodInfo.type_desc or "";
    objectDes = goodInfo.item_desc or "";
    self.mm_Text_type_des:setText(typeDes);
    self.mm_describeText:setText(objectDes);
    if typeDes == "" or typeDes == nil then
        self.mm_describeText:setPos(nil,30);
    end
end

RechargePropLayer.onChangeGoldButton = function(self,finger_action,isAdd)
    if finger_action == kFingerDown then
        self:cleanAnim();
        RechargePropLayer.ainm =  new(AnimInt , kAnimRepeat, 0, 1 ,200, 0);
        RechargePropLayer.ainm:setDebugName("RechargePropLayer.ainmSub");
        local flag = 1 ;
        RechargePropLayer.ainm:setEvent(nil, function() 
            flag = flag + 1;

            if flag > 3 then
                --得到增加后的数量，并检查合法性
                local _addedNum;
                if isAdd then
                    _addedNum = tonumber(self.m_changeNum) + 1;
                else
                    _addedNum = tonumber(self.m_changeNum) - 1;
                end 
                
                local _isOk = self:__refreshNumAndCost(_addedNum);
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
        local _isOk = self:__refreshNumAndCost(_addedNum);
        self:cleanAnim();
    end
end

RechargePropLayer.cleanAnim = function(self)
    if RechargePropLayer.ainm then
        delete(RechargePropLayer.ainm)
        RechargePropLayer.ainm= nil;
    end
end

---------------------------控件回调-----------------------
RechargePropLayer.onCloseBtnClick = function(self)
   self:close();
end

RechargePropLayer.onBindSub = function(self,finger_action)
    self:onChangeGoldButton(finger_action,false);
end

RechargePropLayer.onBindAdd = function(self,finger_action)
    self:onChangeGoldButton(finger_action,true);
end

RechargePropLayer.__refreshNumAndCost = function(self, num)
    if num < 100 and num >0 then
        self.m_changeNum = num;
        self.mm_Text_num:setText(num);
        local cost = self.m_price * num;
        cost = ToolKit.skipMoneyEx4(cost);
        self.mm_Text_money:setText(cost);
        return true;
    else
        return false;
    end  
end

RechargePropLayer.onBuyBtnClick = function(self)
    local num = self.m_changeNum;
    if num <= 0 then
        Toast.getInstance():showText("商品数量必须大于0",40,30,kAlignCenter,"",30,255,255,255);
        return;
    end

    local price = number.valueOf(self.m_price);
    if self.m_currency == "金条" then
        if kUserInfoData:getCrystal() < price * num then
            local total = price * num;
            Toast.getInstance():showText(string.concat(kTextAtLeastDoubleCoin,total,"金条才能购买该商品") ,40,30,kAlignCenter,"",30,255,255,255);
        else
            LoadingView.getInstance():showText("正在购买道具");
            self:execDelegate(RechargePropLayer.Delegate.requestPayByCrystal, self.m_goodInfo.id, num);
        end

    elseif self.m_currency == "银币" then

        local lowestMoney = kBankruptDataInterface:getBankruptLowestMoney();
        if kUserInfoData:getMoney() - price * num < lowestMoney then
            local total = price * num + lowestMoney;
            Toast.getInstance():showText(string.concat(kTextAtLeastDoubleCoin,total,"银币才能购买该商品"),40,30,kAlignCenter,"",30,255,255,255);
        else
            LoadingView.getInstance():showText("正在购买道具");
            kPropManager:requestBuyProp(self.m_goodInfo.id, num);
        end
    end
end

RechargePropLayer.onBuyPropCallBack = function(self, isSuccess, name, num)
    LoadingView.getInstance():hidden();

    if isSuccess then
        local tips = "道具"; 
        num = number.valueOf(num);
        if name and name ~= "" then 
            tips = ""..name;
            tips = num > 0 and tips.."*"..num or tips;
        end 
        local msg =  "成功购买"..tips .."，请在【物品箱】中查看";
        Toast.getInstance():showText(msg,50,30,kAlignLeft,"",24,255,255,255);
        self:onCloseBtnClick();
    else
       local info = name;
       local errMsg = info and info.msg or "购买道具失败！";
        Toast.getInstance():showText(errMsg,50,30,kAlignLeft,"",24,255,255,255);

        if info.flag == -2 then -- 背包已满，私信发放
            self:onCloseBtnClick();
        end
    end
end

RechargePropLayer.onBindBlankFunc = function(self)

end
return RechargePropLayer;