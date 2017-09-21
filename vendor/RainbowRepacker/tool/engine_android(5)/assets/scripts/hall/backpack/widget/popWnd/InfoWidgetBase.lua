-- InfoWidgetBase.lua
-- Author:Demon
-- Date:2016/3/8
-- Last modification:
-- Description:
-- Note:子类定义layer的名字,重写构造方法以及3个virtual函数即可

require("common/IPopDialogManager");
require("hall/backpack/data/backpackDataInterface")


local hallLayerBaseWithName = require("hall/widget/hallLayerBaseWithName")
local InfoWidgetBase = class(hallLayerBaseWithName,false);


InfoWidgetBase.ctor = function(self,p_layerName)	

    local __layout = require(ViewPath .. "hall/newObjectCase/newObjectCaseInfo");
    super(self,__layout,nil,p_layerName);
    self:declareLayoutVar(ViewPath.."hall/newObjectCase/newObjectCaseInfo".."_layout_var");

	self:setFillParent(true, true);
    self:addToRoot();
    self:getHandle();
	self:init();
    self:setListenBackEvent(true);
end

InfoWidgetBase.dtor = function(self)	
	RechargeDataInterface.getInstance():clearObserver(self);
end

--得到相关句柄
InfoWidgetBase.getHandle = function(self)
	self:getComponent();
    self:runUiAction(UiAnimConfig.ACTION.BEGIN, self.mm_ImageBack);
end	

InfoWidgetBase.onGetImage = function(self,url,imagePath)
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

--根据不同的物品类型做不同的初始化，绑定不同函数。

--virtual
InfoWidgetBase.init = function(self)
	self.mm_closeBtn:setOnClick(self,self.onbutton_CloseClick); 		--绑定
    self.mm_useBtn:setOnClick(self,self.onbutton_useClick); 		--绑定

    if self.m_data.canExchange then

    else
    	self.mm_Button_sell:setVisible(false);
    	self.mm_useBtn:setAlign(kAlignBottom);
    	self.mm_useBtn:setPos(0,nil);
    end

    self.mm_Text__bindPhoneNumberTip:setVisible(false);

    ImageCache.getInstance():request(self.m_data.iconPath,self,self.onGetImage);
    self.mm_name:setText(self.m_data.name);

    self.onGetGoodsClassifyDetailInfoCallBack = function(self,id,goodInfo)
        if id == self.m_data.id then
             self:__refreshDes(goodInfo);
            RechargeDataInterface.getInstance():clearObserver(self);
        end
    end
    
    require("hall/recharge/data/rechargeDataInterface");
    RechargeDataInterface.getInstance():setObserver(self);
    RechargeDataInterface.getInstance():requestGoodsDetailInfoById(self.m_data.id);
    

end

InfoWidgetBase.__refreshDes = function(self,goodInfo)
    typeDes = goodInfo.type_desc or "";
    objectDes = goodInfo.item_desc or "";
    self.mm_describeText:setText(objectDes);
    self.mm_Text_type_des:setText(typeDes);
    if typeDes == "" or typeDes == nil then
        self.mm_describeText:setPos(nil,25);
    end
end


--virtual
--关闭按钮绑定
InfoWidgetBase.onbutton_CloseClick = function(self)
	self:close();
end

--virtual
--使用按钮绑定
InfoWidgetBase.onbutton_useClick = function(self)
	
end

--去兑换界面
InfoWidgetBase.onBindToSell = function(self)
    self:close();
    LayerManagerIsolater.getInstance():show("case_sell_object",self.m_data);
end

InfoWidgetBase.onBindBlankFunc = function(self)

end

return InfoWidgetBase;