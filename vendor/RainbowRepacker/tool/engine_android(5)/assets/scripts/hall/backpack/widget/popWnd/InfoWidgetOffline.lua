--------------------------------------
------------线下实物信息界面-------------
--------------------------------------
local InfoWidgetBase = require("hall/backpack/widget/popWnd/InfoWidgetBase");
local InfoWidgetOffline = class(InfoWidgetBase,false);

InfoWidgetOffline.s_layerName = "case_offline_use";

InfoWidgetOffline.ctor = function(self, p_data)   
    self.m_data = p_data;
    super(self,InfoWidgetOffline.s_layerName);
end

InfoWidgetOffline.dtor = function(self)    
    
end


InfoWidgetOffline.init = function(self)
    InfoWidgetBase.init(self);

    self.mm_Text_numOrday:setText("有效期：0天 ");
    self.mm_btnDescribe:setText("查看");

    local __commonFunction = require("hall/backpack/commonFunction/commonFunction");
    local __timeString = __commonFunction.getTimeString(self.m_data.expiresSec);
    self.mm_Text_numOrday:setText("有效期： "..__timeString);
end

--关闭按钮绑定
InfoWidgetOffline.onbutton_CloseClick = function(self)
    InfoWidgetBase.onbutton_CloseClick(self);
end

--使用按钮绑定
InfoWidgetOffline.onbutton_useClick = function(self)
    local _instance = kCaseOperationInstance:getInterfaceByType(self.m_data.clientType);
    if _instance then
        _instance:showAndFillDetailInfo(self.m_data);
    end
    self:onbutton_CloseClick();
end

return InfoWidgetOffline;