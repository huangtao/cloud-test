-- DetailWidgetOffline.lua
-- Author:Demon
-- Date:2016/3/8
-- Last modification:
-- Description:线下物品详细信息界面
-- Note:
local offlineAddressItem = require(ViewPath.."hall/newObjectCase/offlineAddressItem");
local newObjectCase_pin_map = require("qnFiles/qnPlist/hall/newObjectCase_pin")
require("common/IPopDialogManager");

local AddressItem = class(CommonGameLayer,false);

AddressItem.ctor = function(self,p_data)
    self.m_data = p_data;
    local __layout = require(ViewPath.."hall/newObjectCase/offlineAddressItem");
    super(self,__layout);
    self:declareLayoutVar(ViewPath.."hall/newObjectCase/offlineAddressItem".."_layout_var");
    self:setSize(self.m_root:getSize());
    self:getHandle();
    self:init();
end

AddressItem.getHandle = function(self)
    self.m_View_address_bg = self:findViewById(self.s_controls.View_address_bg);
    self.m_Text_phoneNum = self:findViewById(self.s_controls.Text_phoneNum);
end

AddressItem.init = function(self)
    self.m_Text_phoneNum:setText(self.m_data.phone or "");

    local __w,__h = self.m_View_address_bg:getSize();
    local addressText = UIFactory.createTextView(self.m_data.address or "",22,__w,nil,kAlignTopLeft,143,92,31,nil);
    addressText:setAlign(kAlignTopLeft);
    self.m_View_address_bg:addChild(addressText);

    local __address_w,__address_h = addressText:getSize();
    local __offSet = __address_h - __h;

    if __offSet > 0 then
        local __rootW,__rootH = self.m_root:getSize(); 
        self.m_root:setSize(__rootW,__rootH + __offSet);
        self:setSize(self.m_root:getSize());
    end
end

AddressItem.onBindToCall = function(self)
    NativeEvent.getInstance():autoSelectDial(json.encode(self.m_data.phone));
end

AddressItem.dtor = function(self)

end


----------------------------线下物品详细信息-------------------------------

local hallLayerBaseWithName = require("hall/widget/hallLayerBaseWithName")
local DetailWidgetOffline = class(hallLayerBaseWithName,false);
DetailWidgetOffline.s_layerName = "case_detail_offline";


DetailWidgetOffline.ctor = function(self,p_data)	
    local __layout = require(ViewPath .. "hall/newObjectCase/newObjectCaseOffline");
    super(self,__layout,nil,DetailWidgetOffline.s_layerName);
    self:declareLayoutVar(ViewPath.."hall/newObjectCase/newObjectCaseOffline".."_layout_var");
    self.m_data = p_data;
	self:setFillParent(true, true);
    self:addToRoot();
    self:getHandle();
	self:init();
    self:setListenBackEvent(true);
end

DetailWidgetOffline.dtor = function(self)	
	
end

--得到相关句柄
DetailWidgetOffline.getHandle = function(self)
    self:getComponent();
    self:runUiAction(UiAnimConfig.ACTION.BEGIN, self.mm_ImageBack);
end	

DetailWidgetOffline.init = function(self)
	ImageCache.getInstance():request(self.m_data.twoDimensionCodePath,self,self.onGetImage)

    if self.m_data then
        local matchName = self.m_data.matchName
        self.mm_Text_name:setText((matchName and matchName ~= "") and matchName or "兑换信息")
        self.mm_Text_title:setText(self.m_data.name or "")
        self.mm_Text_redeemCode:setText(self.m_data.twoDimensionCodeText or "")
        --self.m_validity:setText(string.format("%s天", self.m_data.day or "0"))
        self:showExpiresSec(self.mm_Text_day, self.m_data.expiresSec)

        self.mm_TextView_prizeDes:setText(self.m_data.prizeDesc or "")
    end
    local cid = kUserInfoData:getUserCid()
    self.mm_Text_userId:setText(cid or "")

    local sizeX,sizeY = self.mm_View_list_bg:getSize();

    self.m_addressList = UIFactory.createScrollView(0,0,sizeX,sizeY,true);

    self.m_addressList:setScrollBarWidth(0);

    local __formatAddressData = self:getFormatAddessData();    
    for kk,vv in pairs(__formatAddressData) do 
        local __item = new(AddressItem,vv);
        self.m_addressList:addChild(__item);
    end
    self.mm_View_list_bg:addChild(self.m_addressList);

end

DetailWidgetOffline.getFormatAddessData = function(self)
    local __data = {};
    local phoneCount = #self.m_data.phone;
    local adressCount = #self.m_data.address;
    if phoneCount == adressCount then
        for i=1,phoneCount,1 do
            local __itemData = {};
            __itemData.phone = self.m_data.phone[i];
            __itemData.address = self.m_data.address[i];
            table.insert(__data,__itemData);
        end
    end
    return __data;
end

DetailWidgetOffline.showExpiresSec = function(self, obj, expiresSec)
    expiresSec = tonumber(expiresSec)
    if not obj or not expiresSec then
        return
    end
    local day = math.floor(expiresSec / (60 * 60 * 24))
    local hour = math.floor((expiresSec % (60 * 60 * 24)) / (60 * 60))
    if day >= 3 then
        obj:setText(string.format("%s天%s小时", day, hour), 250, 40, 164, 92, 22)
    else
        obj:setText(string.format("%s天%s小时", day, hour), 250, 40, 255, 22, 22)
    end
end

DetailWidgetOffline.onGetImage = function(self, url, imagePath)
    self.mm_Image_icon:setFile(imagePath)
end


DetailWidgetOffline.oncloseBtnClick = function(self)
    self:close();
end

return DetailWidgetOffline;