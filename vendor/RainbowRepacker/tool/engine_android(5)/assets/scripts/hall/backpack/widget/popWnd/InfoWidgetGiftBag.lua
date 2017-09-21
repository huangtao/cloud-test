--------------------------------------
--------------礼包物品界面--------------
--------------------------------------
local InfoWidgetBase = require("hall/backpack/widget/popWnd/InfoWidgetBase");
local InfoWidgetGiftBag = class(InfoWidgetBase,false);

InfoWidgetGiftBag.s_layerName = "case_giftBag_use";

InfoWidgetGiftBag.ctor = function(self,p_data)	
    self.m_data = p_data;
	super(self,InfoWidgetGiftBag.s_layerName);
end

InfoWidgetGiftBag.dtor = function(self)	
	
end

--初始化
InfoWidgetGiftBag.init = function(self)

	InfoWidgetBase.init(self);

    self.mm_Text_numOrday:setText("数量： "..self.m_data.number);
    self.mm_btnDescribe:setText("使用");

end

--关闭按钮绑定
InfoWidgetGiftBag.onbutton_CloseClick = function(self)
	InfoWidgetBase.onbutton_CloseClick(self);
end


--使用按钮绑定
InfoWidgetGiftBag.onbutton_useClick = function(self)
    --分解请求
	 BackpackDataInterface.getInstance():useGiftBag(self.m_data);
     --self:onbutton_CloseClick();
end


return InfoWidgetGiftBag;
