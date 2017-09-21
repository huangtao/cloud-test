--------------------------------------
-------------线上实物信息界面------------
--------------------------------------
local InfoWidgetBase = require("hall/backpack/widget/popWnd/InfoWidgetBase");
local InfoWidgetOnlineEntity = class(InfoWidgetBase,false);

InfoWidgetOnlineEntity.s_layerName = "case_onlineEntity_use";

InfoWidgetOnlineEntity.ctor = function(self,p_data)	
    self.m_data = p_data;
	super(self,InfoWidgetOnlineEntity.s_layerName);
end

InfoWidgetOnlineEntity.dtor = function(self)	
	
end

--初始化
InfoWidgetOnlineEntity.init = function(self)

	InfoWidgetBase.init(self);
    local __commonFunction = require("hall/backpack/commonFunction/commonFunction");
    local __timeString = __commonFunction.getTimeString(self.m_data.expiresSec);
    self.mm_Text_numOrday:setText("有效期： "..__timeString);
    self.mm_btnDescribe:setText("使用");

    if LoginDataInterface.getInstance():getLastUType() == LoginConstants.uType.Guest then
        self.mm_btnDescribe:setText("绑定手机");
        self.mm_Text__bindPhoneNumberTip:setVisible(true);
    end

end


--关闭按钮绑定
InfoWidgetOnlineEntity.onbutton_CloseClick = function(self)
	InfoWidgetBase.onbutton_CloseClick(self);
end


--使用按钮绑定
InfoWidgetOnlineEntity.onbutton_useClick = function(self)

    if LoginDataInterface.getInstance():getLastUType() == LoginConstants.uType.Guest then
        local RegisterAccountDialog = require("hall/login/widget/registerAccountDialog");
        local function __call()
            LayerManagerIsolater.getInstance():show("case_list_ui");
        end
        RegisterAccountDialog.show({closeCall = __call});
        LayerManagerIsolater.getInstance():hide("case_list_ui");
        delete(self);
        return ;
    end

    local _instance = kCaseOperationInstance:getInterfaceByType(self.m_data.clientType);
    if _instance then
        _instance:showAndFillDetailInfo(self.m_data);
    end
    self:onbutton_CloseClick();
end


return InfoWidgetOnlineEntity;
