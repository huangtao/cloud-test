local privateRoomQrCode = require(ViewPath .. "hall/privateRoom/privateRoomQrCode");


local PrivateRoomQrCodeDialog = class(CommonGameLayer, false);
----------------------------------------------
PrivateRoomQrCodeDialog.s_controls =
{
	content = 1,
};

PrivateRoomQrCodeDialog.Delegate = {
	onQrCodeLayerClose = "onQrCodeLayerClose";
}

PrivateRoomQrCodeDialog.ctor = function(self)
    super(self, privateRoomQrCode);

    self:setFillParent(true, true);
    self:setAlign(kAlignCenter);

    self:_initView();

    self:setVisible(false);
end

PrivateRoomQrCodeDialog.dtor = function(self)
	
end

PrivateRoomQrCodeDialog.setContentPos = function(self, x, y)
	self.m_content:setAlign(kAlignTopLeft);
	self.m_content:setPos(x - self.m_content.m_width, y + 20);
end

PrivateRoomQrCodeDialog._initView = function(self)
	self.m_content = self:findViewById(self.s_controls.content);

	self:setEventTouch(self, self.onBgClick);
	self:setEventDrag(self, self.onEmptyFunc);
	self.m_content:setEventTouch(slef, self.onEmptyFunc);
end

PrivateRoomQrCodeDialog.onBgClick = function(self, finger_action, x, y, drawing_id_first, drawing_id_current)
	if finger_action == kFingerUp then
		self:execDelegate(PrivateRoomQrCodeDialog.Delegate.onQrCodeLayerClose, true);
	end
end

PrivateRoomQrCodeDialog.onEmptyFunc = function(self)
end

PrivateRoomQrCodeDialog.s_controlConfig =
{
	[PrivateRoomQrCodeDialog.s_controls.content]	= {"content"};
};

PrivateRoomQrCodeDialog.s_controlFuncMap =
{
}


return PrivateRoomQrCodeDialog;