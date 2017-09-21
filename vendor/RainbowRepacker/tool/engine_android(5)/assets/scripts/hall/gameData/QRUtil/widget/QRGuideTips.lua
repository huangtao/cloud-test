local qr_GuideTips = require("view/kScreen_1280_800/hall/gameData/QRUtil/qr_GuideTips")


local QRGuideTips = class(CommonGameLayer, false)

QRGuideTips.s_defaultTime = 15000

QRGuideTips.Delegate = {

}

QRGuideTips.s_controls = {

}

QRGuideTips.ctor = function(self, data)
	super(self, qr_GuideTips)
    self:setFillParent(true, true)

    self.m_ctrl = QRGuideTips.s_controls
end

QRGuideTips.dtor = function(self)

end

QRGuideTips.s_controlConfig = 
{
    
}

QRGuideTips.s_controlFuncMap =
{	
}

return QRGuideTips