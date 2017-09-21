require("gameData/dataInterfaceBase")
require("hall/holidaysBg/data/holidaysBgData")

HolidaysBgDataInterface = class(DataInterfaceBase)

HolidaysBgDataInterface.ImgType = {
    SplashScreen = 1, --闪屏
    Bg = 2, --背景
}

HolidaysBgDataInterface.s_defaultBg = {"hall/hall/start_screen.jpg","hall/hall/bg.jpg"}

HolidaysBgDataInterface.Delegate = {

}

HolidaysBgDataInterface.getInstance = function()
	if not HolidaysBgDataInterface.s_instance then
		HolidaysBgDataInterface.s_instance = new(HolidaysBgDataInterface)
	end
	return HolidaysBgDataInterface.s_instance
end

HolidaysBgDataInterface.ctor = function(self)
	self.m_holidays_data = new(HolidaysBgData, self)
end

HolidaysBgDataInterface.dtor = function(self)
	delete(self.m_holidays_data)
	self.m_holidays_data = nil
end

HolidaysBgDataInterface.requestHolidaysBg = function(self)
	self.m_holidays_data:requestHolidaysBg()
end

HolidaysBgDataInterface.refreshHolidaysBg = function(self, new_info)
    ImageCache.getInstance():request(new_info and new_info.splashScreen)
	ImageCache.getInstance():request(new_info and new_info.background)
end

HolidaysBgDataInterface.clearSplashScreen = function(self)
    local isImgExist, imageName, imagePath = self:isImgExist(HolidaysBgDataInterface.ImgType.SplashScreen)
    if isImgExist and imageName and imagePath then
        os.remove(imagePath)
    end
end

HolidaysBgDataInterface.clearBackground = function(self)
    local isImgExist, imageName, imagePath = self:isImgExist(HolidaysBgDataInterface.ImgType.Bg)
    if isImgExist and imageName and imagePath then
        os.remove(imagePath)
    end
end

HolidaysBgDataInterface.isImgExist = function(self, img_type)
    if img_type == HolidaysBgDataInterface.ImgType.SplashScreen then 
        url = self.m_holidays_data:getSplashUrl()
    elseif img_type == HolidaysBgDataInterface.ImgType.Bg then
        url = self.m_holidays_data:getBgUrl()
    end
    if url then
        local imageName = ImageCache.getInstance():getImageName(url)
        local imagePath = string.concat(ImageCache.s_imagesPath, imageName)
        if ImageCache.getInstance():isFileExist(imagePath) then
            return true, imageName, imagePath
        end
    end
    return false
end

HolidaysBgDataInterface.isImgValidity = function(self)
    local stime = self.m_holidays_data:getStartTime()
    local etime = self.m_holidays_data:getEndTime()
    local cur_time = os.time()
    if stime and etime and cur_time < etime and cur_time > stime then
        return true
    end
    return false
end

HolidaysBgDataInterface.isLocalImgExist = function(self, fileName)
    local m_resID = res_alloc_id()
    local result = res_create_image(0, m_resID, fileName, kRGBA8888, kFilterNearest)
    res_delete(m_resID)
    return result ~= -1
end

HolidaysBgDataInterface.isShowSplashScreen = function(self)
    local imgType = HolidaysBgDataInterface.ImgType.SplashScreen
    local fileName = HolidaysBgDataInterface.s_defaultBg[imgType]
    if (self:isImgExist(imgType) and self:isImgValidity()) or self:isLocalImgExist(fileName) then
        return true
    end
    return false
end

--显示闪屏或背景
HolidaysBgDataInterface.showImg = function(self, img_type, img_obj)
    local isImgExist, imageName, imagePath = self:isImgExist(img_type)
    if isImgExist then
        local isImgValidity = self:isImgValidity()
        if isImgValidity then
            img_obj:setFile(imageName)
        else
            os.remove(imagePath)
            self:setImgFile(img_type, img_obj)
        end
    else
        self:setImgFile(img_type, img_obj)
    end
end

HolidaysBgDataInterface.setImgFile = function(self, img_type, img_obj)
    local fileName = HolidaysBgDataInterface.s_defaultBg[img_type]
    if self:isLocalImgExist(fileName) then
        img_obj:setFile(fileName)
    end
end

HolidaysBgDataInterface.s_socketCmdFuncMap = {

}