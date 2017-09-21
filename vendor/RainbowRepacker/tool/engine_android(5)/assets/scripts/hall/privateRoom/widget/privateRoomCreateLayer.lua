local interface = require("isolater/abstractInterface/privateRoomCreateViewInterface");

local privateRoomCreateLayout = require(ViewPath .. "hall/privateRoom/privateRoomCreateLayout");

-- 游戏币房创建层
local PrivateRoomCreateLayer = class(interface, false);

PrivateRoomCreateLayer.s_controls = 
{
    bg = ToolKit.getIndex(),
    confirmBtn = ToolKit.getIndex(),
    customView = ToolKit.getIndex(),
    contentView = ToolKit.getIndex(),
};

PrivateRoomCreateLayer.s_cmds = 
{
};

PrivateRoomCreateLayer.ctor = function(self, data, comfirmCallback)
    super(self, privateRoomCreateLayout);
    self:setFillParent(true, true);
    
    self:_initData(data, comfirmCallback);
    self:_initView();
    self:_showData();
end

PrivateRoomCreateLayer.dtor = function(self)
end

PrivateRoomCreateLayer._initData = function(self, data, comfirmCallback)
    self.m_data = data;
    self.m_comfirmCallback = comfirmCallback;
end

PrivateRoomCreateLayer._initView = function(self)
    self:_initBackground();
end

PrivateRoomCreateLayer._initBackground = function(self)
    local bg = self:findViewById(self.s_controls.bg);
    ShaderManager.addBlur(bg, {intensity=10});
end

PrivateRoomCreateLayer._showData = function(self)
    local data = self.m_data;
    self:_initCustomParamSetView(data);
end

PrivateRoomCreateLayer.getCustomParamData = function(self)
    if self.m_customParamSetView then
        return self.m_customParamSetView:getCustomParamData();
    end
    return false, {};
end

PrivateRoomCreateLayer.resetParamData = function(self, data)
    if self.m_customParamSetView then
        self.m_customParamSetView:resetParamData(data);
    end
end

PrivateRoomCreateLayer._initCustomParamSetView = function(self,data)
    data = table.verify(data);
    if self.m_data and table.equal(self.m_data,data) then 
        return;
    end 

    self.m_data = data;

    local customView = self:findViewById(self.s_controls.customView);
    if self.m_customParamSetView then
        customView:removeChild(self.m_customParamSetView);
        delete(self.m_customParamSetView);
        self.m_customParamSetView = nil;
    end

    local customParamSetView = kGameManager:getRivateRoomCustomParamSetView(data.id);
    self.m_customParamSetView = new(customParamSetView,data);   
    customView:addChild(self.m_customParamSetView);
end

PrivateRoomCreateLayer.onConfirmBtnClick = function(self)
    if self.m_comfirmCallback then
        self.m_comfirmCallback();
    end
end

PrivateRoomCreateLayer.s_controlConfig = 
{
    [PrivateRoomCreateLayer.s_controls.bg] = {"bg"};
    [PrivateRoomCreateLayer.s_controls.contentView] = {"centerView"};
    [PrivateRoomCreateLayer.s_controls.confirmBtn] = {"centerView", "content", "confirmBtn"};
    [PrivateRoomCreateLayer.s_controls.customView] = {"centerView", "contentView", "customView"};
}

PrivateRoomCreateLayer.s_controlFuncMap = 
{
    [PrivateRoomCreateLayer.s_controls.confirmBtn] = PrivateRoomCreateLayer.onConfirmBtnClick;
};

PrivateRoomCreateLayer.s_cmdConfig = 
{
};

return PrivateRoomCreateLayer;