require("hall/redEnvelope/data/redEnvelopeDataInterface");
require("hall/community/data/communityDataInterface");
local RankManInfo = require("hall/redEnvelope/widget/personalInfo")
local hallLayerBaseWithName = require("hall/widget/hallLayerBaseWithName")
local RedEnvelopeFailLayer = class(hallLayerBaseWithName,false);
RedEnvelopeFailLayer.s_layerName = "redenvelope_fail";

RedEnvelopeFailLayer.ctor = function(self,p_data)   
    RedEnvelopDataInterface.getInstance():setObserver(self);
    CommunityDataInterface.getInstance():setObserver(self);
    CheckBox.setDefaultImages({"games/common/checkbox/report_select_back.png","games/common/checkbox/report_select.png"});                        --恢复默认值
    local __configTab = require(ViewPath.."hall/redEnvelope/no_red_envelope");
    super(self,__configTab,nil,RedEnvelopeFailLayer.s_layerName);
    CheckBox.setDefaultImages(nil);   
    self:declareLayoutVar(ViewPath.."hall/redEnvelope/no_red_envelope".."_layout_var");

    self:getBgBlur(10);

    self.m_data = p_data or {};
  
    self:setFillParent(true, true);

    self:getHandle();

    self:init();

    self.onHideUserInfo = function(self, popStack)
	if self.manInfo then
		delete(self.manInfo);
		self.manInfo = nil;
	end
    end

    self:setListenBackEvent(true);

end

RedEnvelopeFailLayer.dtor = function(self)  

    local __isNeerGetForToday = self.mm_CheckBoxGroup_never_get:isChecked(1);

    if __isNeerGetForToday then
        RedEnvelopDataInterface.getInstance():setIsNeverGetRedEnvelop(true);
        local __isExist,__wnd = LayerManagerIsolater.getInstance():isExist("redenvelope_reciever");
        if __isExist then
            delete(__wnd);
        end
    end

    RedEnvelopDataInterface.getInstance():clearObserver(self);
    CommunityDataInterface.getInstance():clearObserver(self);
end

--得到相关句柄
RedEnvelopeFailLayer.getHandle = function(self)
    --编辑器里控件的句柄
    self:getComponent();
    local _tips = string.format("#cffffff#u%s","回到游戏");
    local w,h = self.mm_Button_close2:getSize();
    local richText = new(RichText, _tips, w, h, kAlignCenter, nil, 22,nil,nil,nil,true);
    richText:setAlign(kAlignCenter);
    self.mm_Button_close2:addChild(richText);
end 

RedEnvelopeFailLayer.init = function(self)
    self.mm_Text_name:setText(self.m_data.nick);
    self.mm_Text_id:setText("ID:"..self.m_data.cid);

    --头像处理
    self:onGetImageForHead();
    ImageCache.getInstance():request(self.m_data.icon,self,self.onGetImageForHead);

    --根据数据初始化复选框
    self.mm_CheckBoxGroup_never_get:setChecked(1,false);
end

RedEnvelopeFailLayer.onCustomGetUserInfoCallBack = function(self, isSuccess, info)
	if isSuccess then
		if not self.manInfo  then
		    self.manInfo = new(RankManInfo,info,self);
		    self.manInfo:setFillParent(true, true);
		    self.manInfo:setDelegate(self);
            self.manInfo:setReportBtnVisible(false);
    	    self.m_root:addChild(self.manInfo);
	    end
	end 
end

--------------------------------private----------------------------
RedEnvelopeFailLayer.onGetImageForHead = function(self,url,file)
    local headImg = string.isEmpty(file) and kUserInfoData:getHallHeadBySex(self.m_data.sex) or file;

    if self.m_Image_headIcon then
        self.mm_View_head_root:removeChild(self.m_Image_headIcon,true);
    end

    self.m_Image_headIcon = new(Mask, headImg, hall_pin_map["head_mask.png"] );
    self.mm_View_head_root:addChild(self.m_Image_headIcon);
    self.m_Image_headIcon:setSize(108,108);
    self.m_Image_headIcon:setAlign(kAlignCenter);
end

--------------------------------点击回掉函数--------------------------------

RedEnvelopeFailLayer.onBindToClose = function(self)
    self:close();
end

RedEnvelopeFailLayer.onBindInfo = function(self)
    CommunityDataInterface.getInstance():requestUserInfoCustom(nil,self.m_data.mid,",silver");
end

return RedEnvelopeFailLayer;