-- ShareResult.lua
-- Author:Demon
-- Date:2016/3/11
-- Last modification:
-- Description:
-- Note:

local hall_pin_map = require("qnFiles/qnPlist/hall/hall_pin");
require("uilibs/richText");
require("util/StringLib");
require("util/TableLib");
require("isolater/interface/regionConfigIsolater");


local hallLayerBaseWithName = require("hall/widget/hallLayerBaseWithName")
local ShareResult = class(hallLayerBaseWithName,false);
ShareResult.s_layerName = "case_Share_Result";


ShareResult.ctor = function(self,p_data)

    local __layout = require(ViewPath .. "hall/newObjectCase/newObjectCaseNoticeShareResult");
    super(self,__layout,nil,ShareResult.s_layerName );
    self:declareLayoutVar(ViewPath.."hall/newObjectCase/newObjectCaseNoticeShareResult".."_layout_var");

    self.m_data = p_data;

	self:setLevel(21);
	self:setFillParent(true, true);
    self:addToRoot();

    self:getHandle();
    local formatData = self:dataAdapter();
	self:init(formatData);
    
end

ShareResult.dtor = function(self)	
   
end

--得到相关句柄
ShareResult.getHandle = function(self)
    self:getComponent();
end	


ShareResult.dataAdapter = function(self)
    local formatData = {}
    formatData.name = kUserInfoData:getNickname();
    formatData.id = "ID:"..kUserInfoData:getUserCid();
    formatData.iconPath = self.m_data.prizeImage;
    formatData.iconPathForTwoDimensionCode = self.m_data.twoDimensionCode;
    formatData.iconPathForHead = kUserInfoData:getAvatar_b();
    formatData.desc = self.m_data.desc;
    formatData.prizeName = self.m_data.name;
    return formatData;
end

ShareResult.init = function(self,p_data)
    --给奖品图片一张默认的通用图片
    self:onGetImage(nil,"hall/common/shareGooddefault.png");
	ImageCache.getInstance():request(p_data.iconPath,self,self.onGetImage);
    ImageCache.getInstance():request(p_data.iconPathForTwoDimensionCode,self,self.onGetImageForTwoDimensionCode);
    
    self.mm_Text_prize_name:setText(p_data.prizeName);
    self.mm_Text_name:setText(p_data.name);
    self.mm_Text_id:setText(p_data.id);
    local __gameName = RegionConfigIsolater.getInstance():getRegionProductName() or "";
    self.mm_Text_gameName:setText("更多精彩尽在"..__gameName);
    --没取到图片前设置默认头像图片
    local sex = kUserInfoData:getSex();
    local headImg = kUserInfoData:getHallHeadBySex(sex)

    local headBtn = self.mm_Image_headIconFrame;
    if self.m_Image_headIcon then
        headBtn:removeChild(self.m_Image_headIcon,true);
    end

    self.m_Image_headIcon = new(Mask, headImg, hall_pin_map["head_mask.png"] );
    headBtn:addChild(self.m_Image_headIcon);
    self.m_Image_headIcon:setAlign(kAlignCenter);

    ImageCache.getInstance():request(p_data.iconPathForHead,self,self.onGetImageForHead);
end

ShareResult.createShareImage = function(self)
    local path = System.offscreenRender(self.mm_Image_hallBack);
    return path;
end

ShareResult.onGetImage = function(self,url,imagePath)
    local icon = UIFactory.createImage(imagePath);
    if icon then
        local w,h = self.mm_Image_icon:getSize();
        local iconW , iconH = icon:getSize();
        local scaleW = iconW>iconH and w or h*iconW/iconH;
        local scaleH = iconW>iconH and w*iconH/iconW or h;
        icon:setSize(scaleW,scaleH);
        icon:setAlign(kAlignCenter);
        self.mm_Image_iconFrame:removeChild(self.mm_Image_icon,true);
        self.mm_Image_iconFrame:addChild(icon);
        self.mm_Image_icon = icon;
    end
end

ShareResult.onGetImageForTwoDimensionCode = function(self,url,imagePath)
    local icon = UIFactory.createImage(imagePath);
    if icon then
        local w,h = self.mm_Image_twoDimensionCodeFrame:getSize();
        local iconW , iconH = icon:getSize();
        local scaleW = iconW>iconH and w or h*iconW/iconH;
        local scaleH = iconW>iconH and w*iconH/iconW or h;
        icon:setSize(scaleW,scaleH);
        icon:setAlign(kAlignCenter);
        self.mm_Image_twoDimensionCodeFrame:removeChild(self.mm_Image_twoDimensionCode,true);
        self.mm_Image_twoDimensionCodeFrame:addChild(icon);
        self.mm_Image_twoDimensionCode = icon;
    end
end

ShareResult.onGetImageForHead = function(self,url,file)
    local sex = kUserInfoData:getSex();
    local headImg = string.isEmpty(file) and kUserInfoData:getHallHeadBySex(sex) or file;

    local headBtn = self.mm_Image_headIconFrame;
    if self.mm_Image_headIcon then
        headBtn:removeChild(self.mm_Image_headIcon,true);
    end

    self.mm_Image_headIcon = new(Mask, headImg, hall_pin_map["head_mask.png"] );
    headBtn:addChild(self.mm_Image_headIcon);
    self.mm_Image_headIcon:setAlign(kAlignCenter);
end

return ShareResult;