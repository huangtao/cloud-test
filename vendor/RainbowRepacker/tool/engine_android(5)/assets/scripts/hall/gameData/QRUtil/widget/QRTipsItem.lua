local qr_TipsItem = require("view/kScreen_1280_800/hall/gameData/QRUtil/qr_TipsItem")

local QRTipsItem = class(CommonGameLayer, false)

QRTipsItem.s_RefuseTimer = 2000

local h_index = 0
local getIndex = function(self)
    h_index = h_index + 1
    return h_index
end

QRTipsItem.s_controls = 
{
	icon = getIndex(),
	iconBg = getIndex(),
	name = getIndex(),
	textStr = getIndex(),
	textContent = getIndex(),
	btn = getIndex(),
	btnText = getIndex(),
	tipsText = getIndex(),
}

QRTipsItem.ctor = function(self, data)
	super(self, qr_TipsItem)
	self.m_data = data
	self:setSize(self.m_root:getSize())
	self.m_icon = self:findViewById(self.s_controls.icon)
	self.m_iconBg = self:findViewById(self.s_controls.iconBg)
	self.m_name = self:findViewById(self.s_controls.name)
	self.m_textStr = self:findViewById(self.s_controls.textStr)
	self.m_textContent = self:findViewById(self.s_controls.textContent)
	self.m_btn = self:findViewById(self.s_controls.btn)
	self.m_btnText = self:findViewById(self.s_controls.btnText)
	self.m_tipsText = self:findViewById(self.s_controls.tipsText)

	self.m_name:setText(data.goods_name or "")
	self.m_textContent:setText(data.expires or "")
	local exhange_apply = tonumber(data.exhange_apply)
	self:setBtnState((exhange_apply == 0))
	self:setTipsTextState((exhange_apply ~= 0))
	self:setTipsText((exhange_apply == 1) and "请等待商家确认" or "兑换成功")
	ImageCache.getInstance():request(data.coupon_pic, self, self.onIconCallBack)
end

QRTipsItem.dtor = function(self)
	self.m_onBtnClick = nil
	self:ctorRefuseTimer()
	ImageCache.getInstance():cleanRef(self)
end

QRTipsItem.onIconCallBack = function(self, url, imagePath)
	self.m_icon:setFile(imagePath)
end

QRTipsItem.onBtnClick = function(self)
	self:setBtnState(false)
	self:setTipsTextState(true)
	self:setTipsText("")
	if self.m_onBtnClick then
		self:m_onBtnClick()
	end
	local param = {
    	ssid = kUserInfoData:getSsid(),
    	code = self.m_data.goods_code,
    }
    OnlineSocketManager.getInstance():sendMsg(PHP_EXCHANGE_APPLY, param)
end

QRTipsItem.setBtnState = function(self, state)
	self.m_btn:setVisible(state)
end

QRTipsItem.setTipsTextState = function(self, state)
	self.m_tipsText:setVisible(state)
end

QRTipsItem.setTipsText = function(self, text, r, g, b)
	self.m_tipsText:setText(text, 200, 64, r or 143, g or 92, b or 31)
end

QRTipsItem.setBtnClickCallBack = function(self, cb)
	self.m_onBtnClick = cb
end

QRTipsItem.setRefuseTimer = function(self)
	delete(self.m_refuseTimer)
	self.m_refuseTimer = new(AnimDouble,kAnimNormal,0,1,QRTipsItem.s_RefuseTimer,-1)
    self.m_refuseTimer:setDebugName("AnimDouble|QRTipsItem.setRefuseTimer")
    self.m_refuseTimer:setEvent(self, self.onRefuseTimer)
end

QRTipsItem.ctorRefuseTimer = function(self)
	delete(self.m_refuseTimer)
	self.m_refuseTimer = nil
end

QRTipsItem.onRefuseTimer = function(self)
	self:ctorRefuseTimer()
	self:setTipsTextState(false)
	self:setBtnState(true)
end

QRTipsItem.s_controlConfig = {
    [QRTipsItem.s_controls.icon] = {"bg", "icon"},
    [QRTipsItem.s_controls.iconBg] = {"bg", "iconBg"},
    [QRTipsItem.s_controls.name] = {"bg", "name"},
    [QRTipsItem.s_controls.textStr] = {"bg", "textStr"},
    [QRTipsItem.s_controls.textContent] = {"bg", "textContent"},
    [QRTipsItem.s_controls.btn] = {"bg", "btn"},
    [QRTipsItem.s_controls.btnText] = {"bg", "btn", "btnText"},
    [QRTipsItem.s_controls.tipsText] = {"bg", "tipsText"},
}

QRTipsItem.s_controlFuncMap =
{
	[QRTipsItem.s_controls.btn] = QRTipsItem.onBtnClick,
}

return QRTipsItem