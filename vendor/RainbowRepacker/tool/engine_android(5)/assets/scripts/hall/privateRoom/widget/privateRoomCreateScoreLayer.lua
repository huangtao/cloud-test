local interface = require("isolater/abstractInterface/privateRoomCreateViewInterface");

local privateRoomCreateScoreLayout = require(ViewPath .. "hall/privateRoom/privateRoomCreateScoreLayout");
-- 积分房创建层
local PrivateRoomCreateScoreLayer = class(interface, false);

PrivateRoomCreateScoreLayer.s_controls = 
{
    bg = ToolKit.getIndex(),
    confirmBtn = ToolKit.getIndex(),
    customView = ToolKit.getIndex(),
    contentView = ToolKit.getIndex(),
};

PrivateRoomCreateScoreLayer.s_cmds = 
{
};

PrivateRoomCreateScoreLayer.ctor = function(self, data, comfirmCallback)
    super(self, privateRoomCreateScoreLayout);
    self:setFillParent(true, true);

    self:_initData(data, comfirmCallback);
    self:_initView();
    self:_showData();
end

PrivateRoomCreateScoreLayer.dtor = function(self)
end

PrivateRoomCreateScoreLayer._initData = function(self, data, comfirmCallback)
    self.m_data = data;
    self.m_comfirmCallback = comfirmCallback;
end

PrivateRoomCreateScoreLayer._initView = function(self)
    self:_initBackground();
end

PrivateRoomCreateScoreLayer._initBackground = function(self)
    local bg = self:findViewById(self.s_controls.bg);
    ShaderManager.addBlur(bg, {intensity=10});
end

PrivateRoomCreateScoreLayer._showData = function(self)
    local data = self.m_data;
    self:_initCustomParamSetView(data);
end

PrivateRoomCreateScoreLayer.getCustomParamData = function(self)
    if self.m_customParamSetView then
        return self.m_customParamSetView:getCustomParamData();
    end
    return false, {};
end

PrivateRoomCreateScoreLayer.resetParamData = function(self, data)
    if self.m_customParamSetView then
        self.m_customParamSetView:resetParamData(data);
    end
end

PrivateRoomCreateScoreLayer._initCustomParamSetView = function(self,data)
    data = table.verify(data);
    if self.m_curCustomData and table.equal(self.m_curCustomData,data) then 
        return;
    end 

    self.m_curCustomData = data;

    local customView = self:findViewById(self.s_controls.customView);
    if self.m_customParamSetView then
        customView:removeChild(self.m_customParamSetView);
        delete(self.m_customParamSetView);
        self.m_customParamSetView = nil;
    end

    local customParamSetView = kGameManager:getRivateRoomCustomParamSetViewScore(data.id);
    self.m_customParamSetView = new(customParamSetView,data);   
    customView:addChild(self.m_customParamSetView);
end

PrivateRoomCreateScoreLayer.onConfirmBtnClick = function(self)
    if self.m_comfirmCallback then
        self.m_comfirmCallback();
    end
end

PrivateRoomCreateScoreLayer.s_controlConfig = 
{
    [PrivateRoomCreateScoreLayer.s_controls.bg] = {"bg"};
    [PrivateRoomCreateScoreLayer.s_controls.contentView] = {"centerView"};
    [PrivateRoomCreateScoreLayer.s_controls.confirmBtn] = {"centerView", "content", "confirmBtn"};
    [PrivateRoomCreateScoreLayer.s_controls.customView] = {"centerView", "contentView", "customView"};
}

PrivateRoomCreateScoreLayer.s_controlFuncMap = 
{
    [PrivateRoomCreateScoreLayer.s_controls.confirmBtn] = PrivateRoomCreateScoreLayer.onConfirmBtnClick;
};

PrivateRoomCreateScoreLayer.s_cmdConfig = 
{
};

return PrivateRoomCreateScoreLayer;