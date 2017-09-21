require("hall/redEnvelope/data/redEnvelopeDataInterface");
require("hall/community/data/communityDataInterface");
local RankManInfo = require("hall/redEnvelope/widget/personalInfo")
local hallLayerBaseWithName = require("hall/widget/hallLayerBaseWithName")
local RedEnvelopeGetLayer = class(hallLayerBaseWithName,false);
RedEnvelopeGetLayer.s_layerName = "redenvelope_get";

RedEnvelopeGetLayer.ctor = function(self,p_data)   
    RedEnvelopDataInterface.getInstance():setObserver(self);
    CommunityDataInterface.getInstance():setObserver(self);

    local __configTab = require(ViewPath.."hall/redEnvelope/closed_red_envelope");

    super(self,__configTab,nil,RedEnvelopeGetLayer.s_layerName);
    self:declareLayoutVar(ViewPath.."hall/redEnvelope/closed_red_envelope".."_layout_var");

    self:getBgBlur(10);

    self.m_data = p_data or {};
  
    self:setFillParent(true, true);

    self:getHandle();

    self:init();

    self.m_isPlaying = false;

    self.onHideUserInfo = function(self, popStack)
	    if self.manInfo then
		    delete(self.manInfo);
		    self.manInfo = nil;
	    end
    end

    self:setListenBackEvent(true);

    --预加载祝贺界面
    self.m_congratulationLayer = LayerManagerIsolater.getInstance():show("redenvelope_congratulation",{});
    self.m_congratulationLayer:setVisible(false);
    self.m_isNeedDeleteCongratulationLayer = true;
end

RedEnvelopeGetLayer.dtor = function(self) 
    RedEnvelopDataInterface.getInstance():clearObserver(self);
    CommunityDataInterface.getInstance():clearObserver(self);
    if self.m_isNeedDeleteCongratulationLayer == true then
        delete(self.m_congratulationLayer);
    end

    local __isNeerGetForToday = self.mm_CheckBoxGroup_never_get:isChecked(1);

    if __isNeerGetForToday then
        RedEnvelopDataInterface.getInstance():setIsNeverGetRedEnvelop(true);
        local __isExist,__wnd = LayerManagerIsolater.getInstance():isExist("redenvelope_reciever");
        if __isExist then
            delete(__wnd);
        end
    end 
    
end

--得到相关句柄
RedEnvelopeGetLayer.getHandle = function(self)
    --编辑器里控件的句柄
    self:getComponent();
end 

RedEnvelopeGetLayer.init = function(self)
    self.mm_Text_name:setText(self.m_data.nick);
    self.mm_Text_id:setText("ID:"..self.m_data.cid);

    --头像处理
    self:onGetImageForHead();
    ImageCache.getInstance():request(self.m_data.icon,self,self.onGetImageForHead);
    --根据数据初始化复选框
    self.mm_CheckBoxGroup_never_get:setChecked(1,false);
end

 
--------------------------------private----------------------------
RedEnvelopeGetLayer.onGetImageForHead = function(self,url,file)
    local headImg = string.isEmpty(file) and kUserInfoData:getHallHeadBySex(self.m_data.sex) or file;

    if self.m_Image_headIcon then
        self.mm_View_head_root:removeChild(self.m_Image_headIcon,true);
    end

    self.m_Image_headIcon = new(Mask, headImg, hall_pin_map["head_mask.png"] );
    self.mm_View_head_root:addChild(self.m_Image_headIcon);
    self.m_Image_headIcon:setSize(108,108);
    self.m_Image_headIcon:setAlign(kAlignCenter);
end

--打开红包
RedEnvelopeGetLayer.__callOpen = function(self)

    if self.m_data.money > 0 then
        self.m_isNeedDeleteCongratulationLayer = false;
    end

    self:close();
    if self.m_data.money <= 0 then
        LayerManagerIsolater.getInstance():show("redenvelope_fail",self.m_data);
    else
        self.m_data.mode = "open";
        self.m_congratulationLayer:setVisible(true);
        self.m_congratulationLayer:initByData(self.m_data);
    end
end

RedEnvelopeGetLayer.onCustomGetUserInfoCallBack = function(self, isSuccess, info)
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


--------------------------------点击回掉函数--------------------------------

RedEnvelopeGetLayer.onBindToClose = function(self)
    if not self.m_isPlaying then
        self:close();
    end
end

RedEnvelopeGetLayer.onBindOpen = function(self)
    if not self.m_isPlaying then
        self.mm_Swf_wait:setVisible(false);
        self.mm_Swf_fly:play(1,false,1,0,true);
        self.mm_Swf_fly:setFrameEvent(self, self.__callOpen,17);
        self.m_isPlaying = true;
    end
end


RedEnvelopeGetLayer.onBindInfo = function(self)
    CommunityDataInterface.getInstance():requestUserInfoCustom(nil,self.m_data.mid,",silver");
end


return RedEnvelopeGetLayer;