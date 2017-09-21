--------------------------------------
-----------老背包道具物品信息界面---------
--------------------------------------

local InfoWidgetBase = require("hall/backpack/widget/popWnd/InfoWidgetBase");
local InfoWidgetGeneral = class(InfoWidgetBase,false);

InfoWidgetGeneral.s_layerName = "case_general_use";

InfoWidgetGeneral.ctor = function(self,p_data)	
    self.m_data = p_data;
	super(self,InfoWidgetGeneral.s_layerName);
end

InfoWidgetGeneral.dtor = function(self)	
	
end

--初始化
InfoWidgetGeneral.init = function(self)

	InfoWidgetBase.init(self);

    self.mm_Text_numOrday:setText("数量： "..self.m_data.number);
    self.mm_btnDescribe:setText("丢弃");
end

--关闭按钮绑定
InfoWidgetGeneral.onbutton_CloseClick = function(self)
	InfoWidgetBase.onbutton_CloseClick(self);
end


--使用按钮绑定
InfoWidgetGeneral.onbutton_useClick = function(self)
    --二次确认
	LayerManagerIsolater.getInstance():show("case_abandonTips",self.m_data);
    self:onbutton_CloseClick();
end


return InfoWidgetGeneral;
