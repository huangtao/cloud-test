local messageItemInfo = require(ViewPath .. "hall/notice/messageItemInfo");
local userInfo_pin_map = require("qnFiles/qnPlist/hall/userInfo_pin");

local MessageItemInfo = class(CommonGameLayer, false);

MessageItemInfo.s_controls = 
{
    txtCount        = 1,
    imgBackground   = 2,
    havegot         = 3,
};

MessageItemInfo.s_cmds = 
{

};

MessageItemInfo.ctor = function(self, data)
    super(self, messageItemInfo);
    self.m_data = data;
   
    local w,h = self.m_root:getSize();
    self:setSize(w,h);
    self:setFillParent(false, false);

    if self.m_data then
        self:_initUI();
    end
end

MessageItemInfo.onUpdateImage = function(self, url, imagePath)
    if self.m_good then
        self.m_background:removeChild(self.m_good, true);
    end

    local isDefaultImage = string.isEmpty(imagePath);
    local imageFile = isDefaultImage and userInfo_pin_map["default_icon.png"] or imagePath;
    self.m_good = new(Image, imageFile);
    self.m_good:setAlign(kAlignCenter);
    self.m_good:setLevel(self.m_count:getLevel() - 1);
    self.m_background:addChild(self.m_good);

    local parentWidth, parentHeight = self.m_background:getSize();
    local width, height = self.m_good:getSize();

    local ratio = isDefaultImage and 0.65 or 0.8;
    local scale = 1.0;
    if width <= height then
        scale = parentWidth * ratio / height;
    else
        scale = parentHeight * ratio / width;
    end

    self.m_good:setSize(width * scale, height * scale);
end

MessageItemInfo.dtor = function(self)

end

MessageItemInfo._initUI = function(self)
    
    self.m_count        = self:findViewById(self.s_controls.txtCount);
    self.m_background   = self:findViewById(self.s_controls.imgBackground);
    self.m_havegot      = self:findViewById(self.s_controls.havegot);
    if self.m_data.havegot == MessageConstants.eAwardStatus.GOT then
        --已领取
        self.m_havegot:setVisible(true);
        self.m_background:setColor(150, 150, 150);
    end

    self:onUpdateImage();
    local goodInfo = table.verify(RechargeDataInterface.getInstance():getGoodInfoByTypeId(self.m_data.type));
    if number.valueOf(self.m_data.num) <= 1 then
        self.m_count:setText(goodInfo.item_name or "");
    else
        self.m_count:setText((goodInfo.item_name or "")..MessageConstants.text.AWARD_COUNT_TEXT..self.m_data.num);
    end
    if goodInfo and goodInfo.item_icon then
        ImageCache.getInstance():request(goodInfo.item_icon, self, self.onUpdateImage);
    end
end


MessageItemInfo.s_controlConfig =
{   
    [MessageItemInfo.s_controls.txtCount]       = {"count"};
    [MessageItemInfo.s_controls.imgBackground]  = {"bg"};
    [MessageItemInfo.s_controls.havegot]        = {"havegot"};
};

MessageItemInfo.s_controlFuncMap =
{

};

MessageItemInfo.s_cmdConfig =
{

};

return MessageItemInfo;