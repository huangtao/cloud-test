local privateRoomEnterTipsLayout = require(ViewPath .. "hall/privateRoom/privateRoomEnterTipsLayout");

-- 私人房人满提示
local PrivateRoomEnterTipsView = class(CommonGameLayer, false);

local h_index = 0;
local getIndex = function(self)
    h_index = h_index + 1;
    return h_index;
end

PrivateRoomEnterTipsView.Delegate = {
    onEnterTipsViewClose = "onEnterTipsViewClose",
    onEnterTipsViewConfirm = "onEnterTipsViewConfirm",
}

PrivateRoomEnterTipsView.s_controls = 
{
    closeBtn = getIndex(),
    confirmBtn = getIndex(),
};

PrivateRoomEnterTipsView.s_cmds = 
{
};

PrivateRoomEnterTipsView.ctor = function(self)
    super(self, privateRoomEnterTipsLayout);
    self:setFillParent(true, true);
    self:setEventTouch(self, function() end);
    self:setEventDrag(self, function() end);
end

PrivateRoomEnterTipsView.dtor = function(self)

end

PrivateRoomEnterTipsView.onCloseBtnClick = function(self)
    self:execDelegate(PrivateRoomEnterTipsView.Delegate.onEnterTipsViewClose, true);
end

PrivateRoomEnterTipsView.onConfirmBtnClick = function(self)
    self:execDelegate(PrivateRoomEnterTipsView.Delegate.onEnterTipsViewConfirm);
    self:execDelegate(PrivateRoomEnterTipsView.Delegate.onEnterTipsViewClose, true);
end

PrivateRoomEnterTipsView.s_controlConfig = 
{
    [PrivateRoomEnterTipsView.s_controls.closeBtn] = {"content", "closeBtn"};
    [PrivateRoomEnterTipsView.s_controls.confirmBtn] = {"content", "confirmBtn"};
};

PrivateRoomEnterTipsView.s_controlFuncMap = 
{
    [PrivateRoomEnterTipsView.s_controls.closeBtn] = PrivateRoomEnterTipsView.onCloseBtnClick;
    [PrivateRoomEnterTipsView.s_controls.confirmBtn] = PrivateRoomEnterTipsView.onConfirmBtnClick;
};

PrivateRoomEnterTipsView.s_cmdConfig = 
{
};

return PrivateRoomEnterTipsView;