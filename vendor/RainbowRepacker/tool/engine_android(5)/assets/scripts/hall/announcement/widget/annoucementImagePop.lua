local announcementImageLayout = require(ViewPath .. "hall/announcement/announcementImageLayout")
require("hall/common/commonJumpLogic")
require("common/IBaseDialog")

local AnnoucementImagePop = class(IBaseDialog, false)

AnnoucementImagePop.s_controls = 
{ 
    shiled = 1,
    closeBtn = 2,
    img = 3,
    contentView = 4,
}

AnnoucementImagePop.ctor = function(self, data) 
    super(self,announcementImageLayout, "AnnoucementImagePop", 999)
    self:setSize(self.m_root:getSize())
    self:setFillParent(true, true)
    self.m_ctrl = AnnoucementImagePop.s_controls
    self.m_closeBtn = self:findViewById(self.m_ctrl.closeBtn)
    self.m_img = self:findViewById(self.m_ctrl.img)
    self.m_data = data
    self:setLevel(100)
end 

AnnoucementImagePop.onShow = function(self)
    if not self.m_data then
        return
    end
    local contentTable = self:getContentTable()
    if not contentTable then
        return
    end
    ImageCache.getInstance():request(contentTable.htmlpic, self, self.onImgResp)
end

AnnoucementImagePop.setOnCloseCallBack = function(self,obj,callback)
	self.m_obj = obj
    self.m_callback = callback
end

AnnoucementImagePop.setOnExecuteJsCallBack = function(self, obj, callback)
    self.m_executeObj = obj
    self.m_executeCallBack = callback
end

AnnoucementImagePop.dtor = function(self)
    ImageCache.getInstance():cleanRef(self)
    self:removeAllChildren()
end 

AnnoucementImagePop.onClose = function(self)
	if self.m_obj then
		if self.m_callback then
			self.m_callback(self.m_obj)
			self.m_callback = nil
		end 
		self.m_obj = nil
	end 
    self:setVisible(false)
end

AnnoucementImagePop.release = function()
    if AnnoucementImagePop.s_instance then 
        AnnoucementImagePop.s_instance:setVisible(false)
        delete(AnnoucementImagePop.s_instance)
        AnnoucementImagePop.s_instance = nil
    end
end

AnnoucementImagePop.onBgTouch = function(self)
    self:onClose()
end

AnnoucementImagePop.onContentViewTouch = function (self)
    
end

AnnoucementImagePop.getContentTable = function(self)
    local content = self.m_data and self.m_data.content
    if not content then
        return nil
    end
    return json.decode(content)
end

AnnoucementImagePop.onImgTouch = function (self)
    local contentTable = self:getContentTable()
    if not contentTable then
        return
    end
    if contentTable.cmd and contentTable.cmd ~= 0 then
        self:onClose()
    end
    local isNeedBackToHall = CommonJumpLogic.getInstance():executeJsCall(contentTable)
    if isNeedBackToHall then
        if self.m_executeObj and self.m_executeCallBack then
            self.m_executeCallBack(self.m_executeObj)
            self.m_executeObj = nil
            self.m_executeCallBack = nil
        end
    end
end

AnnoucementImagePop.onImgResp = function(self, url, imagePath)
    self.m_img:setFile(imagePath)
    --self:sizeAdaptation(self.m_img)
    self.m_img:setVisible(true)
    self.m_closeBtn:setVisible(true)
end

AnnoucementImagePop.sizeAdaptation = function(self, img)
    if not img or not img.m_res then
        return
    end
    local img_width, img_height = img:getSize()
    local res_width, res_height = img.m_res:getWidth(), img.m_res:getHeight()
    if not img_width or not img_height or not res_width or not res_height
        or img_width <= 0 or img_height <= 0 or res_width <= 0 or res_height <= 0 then
        return
    end
    local width, height = res_width, res_height
    local w_scale, h_scale = res_width / img_width, res_height / img_height
    if w_scale > 1 or h_scale > 1 then
        if w_scale > h_scale then
            width = img_width
            height = res_height / w_scale
        else
            width = res_width / h_scale
            height = img_height
        end
    end
    --local width, height = (res_width < img_width) and res_width or img_width, (res_height < img_height) and res_height or img_height
    img:setSize(width, height)
end

AnnoucementImagePop.s_controlConfig =
{   
    [AnnoucementImagePop.s_controls.shiled] = {"shiled"},
    [AnnoucementImagePop.s_controls.closeBtn] = {"contentView","closeBtn"},
    [AnnoucementImagePop.s_controls.img] = {"contentView","img"},
    [AnnoucementImagePop.s_controls.contentView] = {"contentView"},
}

AnnoucementImagePop.s_controlFuncMap =
{
    [AnnoucementImagePop.s_controls.closeBtn] = AnnoucementImagePop.onClose,
    [AnnoucementImagePop.s_controls.shiled] = AnnoucementImagePop.onBgTouch,
    [AnnoucementImagePop.s_controls.contentView] = AnnoucementImagePop.onContentViewTouch,
    [AnnoucementImagePop.s_controls.img] = AnnoucementImagePop.onImgTouch,
}

return AnnoucementImagePop;