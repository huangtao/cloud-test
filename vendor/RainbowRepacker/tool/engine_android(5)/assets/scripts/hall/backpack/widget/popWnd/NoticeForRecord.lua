-- NoticeForRecord.lua
-- Author:Demon
-- Date:2016/3/8
-- Last modification:
-- Description:
-- Note:
local newObjectCaseRecordNotice = require(ViewPath .. "hall/newObjectCase/newObjectCaseRecordNotice");
require("common/IPopDialogManager");

local hallLayerBaseWithName = require("hall/widget/hallLayerBaseWithName")
local NoticeForRecord = class(hallLayerBaseWithName,false);
NoticeForRecord.s_layerName = "case_congratulation";

NoticeForRecord.ctor = function(self,p_data,p_clientType)	
 	
 	local __layout = require(ViewPath .. "hall/newObjectCase/newObjectCaseRecordNotice");
    super(self,__layout,nil,NoticeForRecord.s_layerName );
    self:declareLayoutVar(ViewPath.."hall/newObjectCase/newObjectCaseRecordNotice".."_layout_var");
    self.m_data = p_data;

    --数据补全
    self.m_data.name = self.m_data.name or self.m_data.prizeName;
    if self.m_data.prizeImage == "" or self.m_data.prizeImage == nil then
        if type(self.m_data.boxItemID) == 'number' then
            local propInfo = RechargeDataInterface.getInstance():getGoodInfoByTypeIdWithMap(tonumber(self.m_data.boxItemID));
            propInfo = table.verify(propInfo); --后台很有可能没有配清所有的物品
            --icon补全
            self.m_data.prizeImage = propInfo.item_icon or "";
        end
    end
   
    self.m_clientType = p_clientType ;
    --如果数据源不是来自记录，，应该补全数据
    if not self.m_data.status then
        if self.m_clientType == BagTypeAdapter.s_offline then
            self.m_data.status = "已领奖";
        elseif self.m_clientType == BagTypeAdapter.s_onlineEntity then
            self.m_data.status = "审核中";
        elseif self.m_clientType == BagTypeAdapter.s_onlineVirtual then
            self.m_data.status = "充值中";
        end
    end

	self:setFillParent(true, true);
    self:addToRoot();
    self:getHandle();
	self:init();
    self:setListenBackEvent(true);
end

NoticeForRecord.dtor = function(self)	
	ImageCache.getInstance():cleanRef(self);
end


--得到相关句柄
NoticeForRecord.getHandle = function(self)
	self:getComponent();
    self:runUiAction(UiAnimConfig.ACTION.BEGIN, self.mm_ImageBack);
end	

NoticeForRecord.init = function(self)


    --充值失败
    if self.m_data.status == "已退还" then
        self:__failInit();
    else
        self:__successInit();
    end 

    self:__initDes();   

    local __commonFunction = require("hall/backpack/commonFunction/commonFunction");
	local __phoneWidget = __commonFunction.createClientPhoneWidget();
    if not __phoneWidget then
        self.mm_View_clientPhone:setVisible(false);
    else
        self.mm_View_phoneNumber:addChild(__phoneWidget);
        local __w,__ = __phoneWidget:getSize();
        self.mm_phoneLogo:setPos(__w+5 ,nil);
    end
end

NoticeForRecord.__failInit = function(self)
    self.mm_Image_tittle:setVisible(false);
    self.mm_Image_tittle__fail:setVisible(true);

    self.mm_Image_succes:setVisible(false);
    self.mm_ImageFail:setVisible(true);

    self.mm_Button_share_circle:setVisible(false);
    self.mm_Button_share_friend:setVisible(false);

    self.mm_describeFrame:setPos(nil,160);

    self.mm_Text_fail_name:setText(self.m_data.name);

    ImageCache.getInstance():request(self.m_data.prizeImage,self,self.onFailGetImage);

end

NoticeForRecord.__successInit = function(self)
    local __prefix = "恭喜获得";
    if self.m_clientType == BagTypeAdapter.s_shard then
        self.mm_Image_tittle:setVisible(false);
        self.mm_Image_tittle_shard:setVisible(true);
        __prefix = "恭喜合成"
    end
    local __string = __prefix..self.m_data.name;
    self.mm_Text_congratulation:setText(__string);

    ImageCache.getInstance():request(self.m_data.prizeImage,self,self.onGetImage);
    ImageCache.getInstance():request(self.m_data.twoDimensionCode,self,self.onGetImage2);
end

NoticeForRecord.__initDes = function(self)
	if self.m_clientType == BagTypeAdapter.s_offline then
        if self.m_data.status == "已领奖" then
            self.mm_TextView_des:setText("奖品已领取，祝游戏愉快！");
        end
	elseif self.m_clientType == BagTypeAdapter.s_shard then
        self.mm_TextView_des:setText("合成成功，祝游戏愉快！");
    elseif self.m_clientType == BagTypeAdapter.s_onlineEntity then   
        if self.m_data.status == "已发货" then
            self.mm_TextView_des:setVisible(false);
            self.mm_View_forOrder:setVisible(true);
            self.mm_Text_company:setText("承运公司:"..self.m_data.company);

            local _tips = string.format("#ca26c40#u%s",""..self.m_data.oddNum);
            local __w,__h = self.mm_View_orderFrame:getSize();
            local richText = new(RichText,_tips, __w, __h, kAlignBottomLeft, nil, 20,nil,nil,nil,true);
            richText:setAlign(kAlignBottomLeft);
            self.mm_View_orderFrame:addChild(richText);
        elseif self.m_data.status == "审核中" then
            self.mm_TextView_des:setText("您的资料已提交，通过审核后，我们将在3个工作日内为您发货");   
        end

    elseif self.m_clientType == BagTypeAdapter.s_onlineVirtual then    

        if self.m_data.status == "已退还" then
             self.mm_TextView_des:setText("由于运营商原因未充值成功，已通过私信退还话费券，请注意查收。");   
        elseif self.m_data.status == "充值中" then
             self.mm_TextView_des:setText("运营商充值到帐可能有延迟，请耐心等待。若7个工作日仍未充值成功将返回话费券。");   
        elseif self.m_data.status == "已充值" then
             self.mm_TextView_des:setText("充值已成功，运营商充值到帐可能有延迟，请留意到帐短信。");   
        end
  
	end
end

NoticeForRecord.onFailGetImage = function(self,url,imagePath)
    local icon = UIFactory.createImage(imagePath);
    if icon then
        self.m_imagePrizeDownloadOk = true;
        local w,h = self.mm_Image_icon_fail:getSize();
        local iconW , iconH = icon:getSize();
        local scaleW = iconW>iconH and w or h*iconW/iconH;
        local scaleH = iconW>iconH and w*iconH/iconW or h;
        icon:setSize(scaleW,scaleH);
        icon:setAlign(kAlignCenter);
        self.mm_Image_icon_fail:addChild(icon);
    end
end


NoticeForRecord.onGetImage = function(self,url,imagePath)
    local icon = UIFactory.createImage(imagePath);
    if icon then
    	self.m_imagePrizeDownloadOk = true;
        local w,h = self.mm_View_icon_bg:getSize();
        local iconW , iconH = icon:getSize();
        local scaleW = iconW>iconH and w or h*iconW/iconH;
        local scaleH = iconW>iconH and w*iconH/iconW or h;
        icon:setSize(scaleW,scaleH);
        icon:setAlign(kAlignCenter);
        self.mm_View_icon_bg:addChild(icon);
    end
end

NoticeForRecord.onGetImage2 = function(self,url,imagePath)
	if type(imagePath) == 'string' and imagePath ~= "" then
		self.m_imageTowCodeDownloadOk = true;
	end
end


NoticeForRecord.oncloseBtnClick = function(self)
    self:close();
end

--调用打电话系统
NoticeForRecord.onBindToCallPhone = function(self,finger_action,x,y,drawing_id_first,drawing_id_current, event_time)
    if finger_action ==  kFingerUp then
        BackpackDataInterface.getInstance():callHotline();
    end
end

NoticeForRecord.onBindToCopyOrder = function(self,finger_action,x,y,drawing_id_first,drawing_id_current, event_time)
	if finger_action ==  kFingerUp then
        local orderNumber = tostring(self.m_data.oddNum) or "";   
    	PasswordDataInterface.getInstance():setTextToClipboard(orderNumber);
        Toast.getInstance():showText("运单号已复制", 50, 30, kAlignLeft, "", 24, 200, 175, 110);  
    end
end

NoticeForRecord.onBindToCircle = function(self)
	if self.m_imagePrizeDownloadOk and self.m_imageTowCodeDownloadOk then
        local __wnd = LayerManagerIsolater.getInstance():show("case_Share_Result",self.m_data);
        local __shareImagePath = __wnd:createShareImage();
        delete(__wnd);
        if not string.isEmpty(__shareImagePath) then
            Clock.instance():schedule_once(function()
                WeixinShareUtil.getInstance():weixinSendImage(__shareImagePath, true);
                end, 1);
        end
    end
end

NoticeForRecord.onBindToShareFried = function(self)
	if self.m_imagePrizeDownloadOk and self.m_imageTowCodeDownloadOk then
        local __wnd = LayerManagerIsolater.getInstance():show("case_Share_Result",self.m_data);
        local __shareImagePath = __wnd:createShareImage();
        delete(__wnd);
        if not string.isEmpty(__shareImagePath) then
            Clock.instance():schedule_once(function()
                WeixinShareUtil.getInstance():weixinSendImage(__shareImagePath, false);
                end, 1);
        end
    end
end

return NoticeForRecord;
 