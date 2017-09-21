require("hall/redEnvelope/data/redEnvelopeDataInterface");
require("hall/community/data/communityDataInterface");
local RankManInfo = require("hall/redEnvelope/widget/personalInfo")
local hallLayerBaseWithName = require("hall/widget/hallLayerBaseWithName")
local RedEnvelopeCongratulationLayer = class(hallLayerBaseWithName,false);
RedEnvelopeCongratulationLayer.s_layerName = "redenvelope_congratulation";

RedEnvelopeCongratulationLayer.ctor = function(self,p_data)   

    local __configTab = require(ViewPath.."hall/redEnvelope/geted_red_envelope");

    super(self,__configTab,nil,RedEnvelopeCongratulationLayer.s_layerName);
    self:declareLayoutVar(ViewPath.."hall/redEnvelope/geted_red_envelope".."_layout_var");
    self.m_data = p_data or {};
    self:getHandle();

    self:initByData(p_data);
end

RedEnvelopeCongratulationLayer.dtor = function(self)  
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

RedEnvelopeCongratulationLayer.initByData = function(self,p_data)
    self.m_data = p_data or {};

    if table.isEmpty(self.m_data) then
        return ;
    end

    RedEnvelopDataInterface.getInstance():setObserver(self);
    CommunityDataInterface.getInstance():setObserver(self);

    self:getBgBlur(10);

    self:setFillParent(true, true);

    self.m_isNumTurning = false;

    self:init();

    self.m_isPlaying = false;

    self.onHideUserInfo = function(self, popStack)

        if self.manInfo then
            delete(self.manInfo);
            self.manInfo = nil;
        end
    end
    self:setListenBackEvent(true);
    self.mm_Image_bg:setEventTouch(self,function() end); 
end

--得到相关句柄
RedEnvelopeCongratulationLayer.getHandle = function(self)
    --编辑器里控件的句柄
    self:getComponent();
end 

RedEnvelopeCongratulationLayer.init = function(self)
    self.mm_Text_name:setText(self.m_data.nick);
    self.mm_Text_id:setText("ID:"..self.m_data.cid);

    --头像处理
    self:onGetImageForHead();
    ImageCache.getInstance():request(self.m_data.icon,self,self.onGetImageForHead);

    --货币ICON
    local _iconImagePaht = self.IMAGE.redEnvelopeGold;
    if self.m_data.type == 1 then
        _iconImagePaht = self.IMAGE.red_envelope_goldBar;
    end
    self:findViewById(self.s_controls.Image_money):setFile(_iconImagePaht);

    --美术字
    self.m_imageNum = new(UserMoneyItem);
    self.mm_View_money_root:addChild(self.m_imageNum)
    UserMoneyItem.setFilePath( UserMoneyItem.s_redEnvelopeNumFilePath );
    self.m_imageNum:setNormalMoneyNum(self.m_data.money, 1);
    self.m_imageNum:setAlign(kAlignCenter);
    UserMoneyItem.setFilePath();

    if self.m_data.mode == "open" then
        self:__initForOpen();
    elseif self.m_data.mode == "look" then
        self:__initForLook();
    end

    local __isNeverGet = RedEnvelopDataInterface.getInstance():getIsNeverGetRedEnvelop();

     --根据数据初始化复选框
    self.mm_CheckBoxGroup_never_get:setChecked(1,__isNeverGet);
end

 
--------------------------------private----------------------------
RedEnvelopeCongratulationLayer.onGetImageForHead = function(self,url,file)
    local headImg = string.isEmpty(file) and kUserInfoData:getHallHeadBySex(self.m_data.sex) or file;

    if self.m_Image_headIcon then
        self.mm_View_head_root:removeChild(self.m_Image_headIcon,true);
    end

    self.m_Image_headIcon = new(Mask, headImg, hall_pin_map["head_mask.png"] );
    self.mm_View_head_root:addChild(self.m_Image_headIcon);
    self.m_Image_headIcon:setSize(108,108);
    self.m_Image_headIcon:setAlign(kAlignCenter);
end

RedEnvelopeCongratulationLayer.__initForOpen = function(self)
    self.m_imageNum:setVisible(false);
    self.mm_Swf_open_bg:play(1,true,1,0,false);
    self.mm_Swf_num_turn:play(1,false,1,0,true);
    self.mm_Swf_num_turn:setFrameEvent(self, self.__animFrameCall,44);
    self.m_isNumTurning = true;
    --self.mm_Swf_wait_fly:play(15,false,1,0,true);
end

RedEnvelopeCongratulationLayer.__initForLook = function(self)
    self.mm_Swf_open_bg:pause(60,true);
end

RedEnvelopeCongratulationLayer.__animFrameCall = function(self)
    self.m_isNumTurning = false;
    self.m_imageNum:setVisible(true);
end

RedEnvelopeCongratulationLayer.onCustomGetUserInfoCallBack = function(self, isSuccess, info)
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

RedEnvelopeCongratulationLayer.onBindToClose = function(self,finger_action,x,y,drawing_id_first,drawing_id_current)

    if finger_action then
        if finger_action == kFingerUp then
            if self.m_isNumTurning then
                self.mm_Swf_open_bg:pause(60,true);
                self.mm_Swf_num_turn:setVisible(false);
                self:__animFrameCall();
            else
                self:close();
            end
        end
    else
        self:close();
    end    
end

RedEnvelopeCongratulationLayer.onBindDetail = function(self)
    local function __call()
        self.m_data.mode = "look";
        LayerManagerIsolater.getInstance():show("redenvelope_congratulation",self.m_data);
    end
    self:close();
    LayerManagerIsolater.getInstance():show("redenvelope_detail",{
        id = self.m_data.id,
        func_back = __call,
        isNeedShowAllTakeMoneyNum = false ,
        isJustSendRedEnvelop = false;
        takenum = 0,
        num = tonumber(self.m_data.num) or 0,
        takemoney = 0,
        totalmoney = tonumber(self.m_data.money) or 0,
        type = tonumber(self.m_data.type) or 0
        });
end

RedEnvelopeCongratulationLayer.onBindInfo = function(self)
    CommunityDataInterface.getInstance():requestUserInfoCustom(nil,self.m_data.mid,",silver");
end


return RedEnvelopeCongratulationLayer;