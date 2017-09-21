local communityNearByLayer = require(ViewPath.."hall/community/friend/nearbylist/communityNearByLayer");
local community_pin_map = require("qnFiles/qnPlist/hall/community_pin")

local NVerticalListView = require("ui2/NVerticalListView");

local CommunityNearByLayer = class(CommonGameLayer,false);

CommunityNearByLayer.s_createPageMaxNum = 16;

local dict_name = "auto_get_location_switch_dict_name";

CommunityNearByLayer.s_onClickPersonRelationEvent = EventDispatcher.getInstance():getUserEvent();
CommunityNearByLayer.s_onConfirmCleanUpLocationEvent = EventDispatcher.getInstance():getUserEvent();
CommunityNearByLayer.s_onDelFriendFormRankEvent    = EventDispatcher.getInstance():getUserEvent();

CommunityNearByLayer.Delegate = {
}

local h_index = 0;
local getIndex = function(self)
    h_index = h_index + 1;
    return h_index;
end

CommunityNearByLayer.setLocationIsOpen = {
    OPEND = 0;
    CLOSE = 1;       
}

CommunityNearByLayer.s_controls =
{
    getLocationView = getIndex(),
    btnGotoLook = getIndex(),
    checkBoxGroup = getIndex(),

    nearbyPersonView = getIndex(),
    contentView = getIndex(),
    notNearByFriend = getIndex(),
    notOpenLocationView = getIndex(),
    openLocationtextView = getIndex(),
    btnCleanUpLocation = getIndex(),
    btnOpenLocation = getIndex(),
};

CommunityNearByLayer.ctor = function(self)
    super(self,communityNearByLayer);
    self.m_ctrl = CommunityNearByLayer.s_controls;
    self:setEventTouch(self, self.onEmptyFunc);
    self:setEventDrag(self, self.onEmptyFunc);

    self:__init();

    self.m_contentView = self:findViewById(self.m_ctrl.contentView);
    self.m_notOpenLocationView = self:findViewById(self.m_ctrl.notOpenLocationView);
    local openLocationtextView = self:findViewById(self.m_ctrl.openLocationtextView);
    openLocationtextView:setText(string.format("开放位置信息，你可以在这里找到同样在玩%s游戏的人。斗斗牌、交交友，其乐无穷！", RegionConfigDataInterface.getInstance():getRegionProductName() or ""));
    openLocationtextView:setScrollBarWidth(0);
    
    CommunityDataInterface.getInstance():setObserver(self);
    EventDispatcher.getInstance():register(CommunityNearByLayer.s_onConfirmCleanUpLocationEvent, self, self.onConfirmCleanUpLocation)
    EventDispatcher.getInstance():register(CommunityNearByLayer.s_onDelFriendFormRankEvent, self, self.onDelFriendFormRankCallBack)
end

CommunityNearByLayer.dtor = function (self)
   self:cleanUpLoadingAnim();
   self:stopCheckTimer();
   self:_stopTimeOutTimer();

   CommunityDataInterface.getInstance():clearObserver(self); 
   EventDispatcher.getInstance():unregister(CommunityNearByLayer.s_onConfirmCleanUpLocationEvent, self, self.onConfirmCleanUpLocation);
   EventDispatcher.getInstance():unregister(CommunityNearByLayer.s_onDelFriendFormRankEvent, self, self.onDelFriendFormRankCallBack);
end

CommunityNearByLayer.__init = function (self)
    self.m_nearBylist = {};
    self.m_needCreateItem = true;
end

CommunityNearByLayer.show = function(self)
    local switchState = self:__getAutoGetLocationSwitchState();
    local lat,lon = CommunityDataInterface.getInstance():getCurrentLocation(); --每次进来获取
    self.m_lat = lat;
    self.m_lon = lon;
    self.m_getIosLocation = true;
    self:findViewById(self.m_ctrl.btnCleanUpLocation):setPickable(false);
    if switchState == 0 then
        self:__showGetLocationView();
    else
        self:__showNearbyPersonList(lat,lon);
    end

    self:stopCheckTimer();
end

--跳转到gps后 返回依然显示去看看
CommunityNearByLayer.onOpenLocationClick = function (self)
    CommunityDataInterface.getInstance():imOpenGps();
    self:stopCheckTimer();
    self.m_checkTimer = new(Timer,"CommunityNearByLayer|onOpenLocationClick",1,self,self.show);
end

CommunityNearByLayer.stopCheckTimer = function(self)
    if self.m_checkTimer then
        delete(self.m_checkTimer);
    end
    self.m_checkTimer = nil;
end

CommunityNearByLayer.onBtnGotoLookClick = function(self)
    UBReport.getInstance():report(UBConfig.kHallCommunityNearbyClick);
    if NativeEvent.s_platform == kPlatformIOS then
        if self.m_lat == 0 and self.m_lon == 0 then
            LoadingView.getInstance():showText("正在获取当前位置...", 70, 90, true)
            self.m_getIosLocation = false;
            self.m_lat ,self.m_lon = CommunityDataInterface.getInstance():getCurrentLocation();
        else
            self:__switchGpsOrPersonListView();
        end
    else
         self:__switchGpsOrPersonListView();
    end
end

CommunityNearByLayer.__switchGpsOrPersonListView = function (self)
    if self.m_lat == 0 and self.m_lon == 0 then --如果 0,0 没权限
       self:__showOpenGpsView();
    else 
        self:__setGetLocationSwitchState(kTrue);
        self:__showNearbyPersonList(self.m_lat,self.m_lon);
    end
end

CommunityNearByLayer.onOpenGpsFinishCallBack = function (self,isSuccess,lon,lat)
    if  self.m_getIosLocation  then
        return;
    end
    LoadingView.getInstance():hidden();
    self.m_lat = lat;
    self.m_lon = lon;
    self:__switchGpsOrPersonListView();
end

CommunityNearByLayer.__showOpenGpsView = function(self)
    self.m_notOpenLocationView:setVisible(true);
    self:findViewById(self.m_ctrl.getLocationView):setVisible(false);
    self:findViewById(self.m_ctrl.nearbyPersonView):setVisible(false);
end

CommunityNearByLayer.__showGetLocationView = function(self)
    self:findViewById(self.m_ctrl.getLocationView):setVisible(true);
    self:findViewById(self.m_ctrl.nearbyPersonView):setVisible(false);
    self.m_notOpenLocationView:setVisible(false);
end

CommunityNearByLayer.__showNearbyPersonList = function(self,lat,lon)
    self.m_notOpenLocationView:setVisible(false);
    self:findViewById(self.m_ctrl.getLocationView):setVisible(false);
    self:findViewById(self.m_ctrl.nearbyPersonView):setVisible(true);

    self.m_cleanUpLocation = false;

    local isSuccess = false;
    if table.isEmpty(self.m_nearBylist) then
        isSuccess , self.m_nearBylist = CommunityDataInterface.getInstance():getNearByList(true,lat,lon);
        if table.isEmpty(self.m_nearBylist) then
            LoadingView.getInstance():showText("正在获取附近的人...", 70, 90, true);
        end
    end

    if not table.isEmpty(self.m_nearBylist) then
        self:__createOrRefreshNearByItem();
    else
        if not isSuccess then
            LoadingView.getInstance():hidden();
            self:__showRecommendFriendView();--推荐好友
        else          
            self:_startTimeOutTimer();
        end
    end
end

CommunityNearByLayer._startTimeOutTimer = function(self)
    self:_stopTimeOutTimer();
    self.m_timeOutTimer = AnimFactory.createAnimInt(kAnimNormal, 0, 1, 6000, -1);
    self.m_timeOutTimer:setDebugName("CommunityNearByLayer.m_timeOutTimer");
    self.m_timeOutTimer:setEvent(self, function()
            self:_stopTimeOutTimer();
            LoadingView.getInstance():hidden();
            self:__showRecommendFriendView();--推荐好友
        end );
end

CommunityNearByLayer._stopTimeOutTimer = function(self)
    delete(self.m_timeOutTimer);
    self.m_timeOutTimer = nil;
end

CommunityNearByLayer.__cleanUpAllItems = function (self)
    self:__init();
    
    delete(self.m_persionListView);
    self.m_persionListView = nil;
end

CommunityNearByLayer.onGetNearByListCallBack = function (self,isSuccess,nearByList) --获取附近人列表成功
    Log.v("gaojie", "onGetNearByListCallBack", nearByList);
    UBReport.getInstance():report(UBConfig.kHallCommunityNearbyDone);

    self:_stopTimeOutTimer();
    if  CommunityDataInterface.getInstance():getFriendRankLayout() == "nearByLayout" then
        LoadingView.getInstance():hidden();
    end

    if isSuccess and not table.isEmpty(nearByList) then 
        self.m_nearBylist = nearByList;
        self:__createOrRefreshNearByItem();  
    else
        CommunityDataInterface.getInstance():CleanUpNearByList();
        self:__cleanUpAllItems();
        self:__showRecommendFriendView();--推荐好友
    end
end

--清楚地理位置
CommunityNearByLayer.onCleanUpLocationClick = function (self,finger_action)
    UBReport.getInstance():report(UBConfig.kHallCommunityNearbyCleanUp);
    if finger_action ~= kFingerUp or #self.m_nearBylist == 0 then
        return;
    end
    IBaseDialog.remove("CommunityCleanUpLayout");
    IBaseDialog.pushDialog(new(require("hall/community/widget/friend/nearbyList/communityCleanUpLayout")));
end

--确定清楚地理位置
CommunityNearByLayer.onConfirmCleanUpLocation = function (self)
    CommunityDataInterface.getInstance():setCleanUpLocation(self.setLocationIsOpen.CLOSE,0,0);
    self:__setGetLocationSwitchState();
    self:__cleanUpAllItems();
    self:show();
end

--每组创建五个item
CommunityNearByLayer.__needCreateItem = function (self)
    if  not self.m_needCreateItem or not self.m_persionListView then
        return;
    end
    
    local maxItem = CommunityNearByLayer.s_createPageMaxNum;
    local itemCount = self.m_persionListView:getItemCount();
    local data = self.m_nearBylist;
    local len = #data;
    local diff = len-itemCount;
    local index  = 0;
    if len == 0 then --暂无好友
        self.m_needCreateItem = false;
        return;
    end
    if diff > 0 then --创建
        if diff  >= maxItem then
            index = maxItem;
        else
            index = diff;
        end
    else
        self:__showNoMoreFriendText(len);
    end
    local maxIndex = index+itemCount;
    for k = itemCount+1,maxIndex do
        self.m_persionListView:addInvokeOnStop(function ()
            local obj = data[k];
            if obj then
                self:__createNearByListItem(obj);
            end
            if k == maxIndex then
                LoadingView.getInstance():hidden();  
                self.m_needCreateItem = false;
            end
            self:__showNoMoreFriendText(k);
        end)
    end
end

--创建一个item
CommunityNearByLayer.__createNearByListItem = function (self,v)
    local item = new(require("hall/community/widget/friend/knowList/communityContactListItem"),v,"nearByList");
    self.m_persionListView:addItem(item);
end

CommunityNearByLayer.onRequestAddFriendCallBack = function(self, isSuccess,msg)
	UBReport.getInstance():report(UBConfig.kHallCommunityNearbyAddFriend);
    self:showNoticeView(msg);
end

CommunityNearByLayer.__showNoMoreFriendText = function (self,curIndex)
    local show = curIndex == #self.m_nearBylist and true or false;
    self.m_loadingImage:setVisible(not show);
    if not show then
        self.m_loadingText:setText("正在加载...");
    else
        self.m_loadingText:setText("没有更多好友了");
    end
end

--刷新状态 未注册  注册（好友 非好友）
CommunityNearByLayer.__updateItem = function (self)
   local data = self.m_nearBylist;
   local len = #data; 
   if not self.m_persionListView then
        return;
   end
   local itemCount = self.m_persionListView:getItemCount();
   
   for index = 1,itemCount do
        self.m_persionListView:addInvokeOnStop(function ()
            local obj = data[index];
            if obj then
                local item = self.m_persionListView:getItem(index)
                item:updateListItem(obj,"nearByList");
            end
        end)
    end
    
    if len > itemCount and itemCount < CommunityNearByLayer.s_createPageMaxNum then --添加
       self.m_needCreateItem = true;
       self:__needCreateItem(); 
    elseif len < itemCount then --删除
        for index = itemCount, len+1, -1 do
            self.m_persionListView:addInvokeOnStop(function () 
                self.m_persionListView:removeItem(index, true);
            end);
        end
    end
end

CommunityNearByLayer.onAddFriendResultCallBack = function (self,isSuccess,data)
    if isSuccess then
        local status = data.result == 1 and true or false
        if self.m_persionListView then
            if self:__setIsFriendFlag(data.cid,status) then
                self:__updateItem();
            end
        end
    end
end

--@brief 从好友排行中删除好友
CommunityNearByLayer.onDelFriendFormRankCallBack = function (self,cid)
    if self.m_persionListView then
        if self:__setIsFriendFlag(cid,false) then
            self:__updateItem();
        end
    end
end

CommunityNearByLayer.onBeRemoveFromFriendCallBack = function (self,cid)
    self:onDelFriendFormRankCallBack(cid);
end

CommunityNearByLayer.__setIsFriendFlag = function(self,cid,status)
    local flag = false;
    if table.isEmpty(self.m_nearBylist)  then
       return;
    end
    for k,v in pairs(table.verify(self.m_nearBylist)) do
        if v.cid == cid then
            if status then
                v.is_friend = 1;  
            else
                v.addFriend = false;
                v.is_friend = 0;
                CommunityDataInterface.getInstance():refreshNearByAddFriendBtnStatus(cid);
            end
            flag = true;
        end
    end
    return flag;
end

CommunityNearByLayer.__showRecommendFriendView = function (self)
    self:__hidePersionListView();

    if not self.m_recommendFriend then
        self.m_recommendFriend = new(require("hall/community/widget/friend/communityGetContactsFail"));
        self.m_recommendFriend:setDelegate(self);
        self.m_contentView:addChild(self.m_recommendFriend);
    end
    
    self.m_recommendFriend:show();       
end

CommunityNearByLayer.__hideRecommendFriendView = function(self)
    if self.m_recommendFriend then
        self.m_recommendFriend:hide();
    end
end

CommunityNearByLayer.__createOrRefreshNearByItem = function(self)
    self:findViewById(self.m_ctrl.btnCleanUpLocation):setPickable(not table.isEmpty(self.m_nearBylist));
    if not self.m_persionListView then
        local contentView = self:findViewById(self.m_ctrl.contentView);
        local w,h = contentView:getSize();
        self.m_persionListView = NVerticalListView.create();
        self.m_persionListView:setAlign(kAlignCenter);
        self.m_persionListView:setSize(w,h);
        contentView:addChild(self.m_persionListView);
        
        self.m_bannerNode = new(Node);
        self.m_bannerNode:setSize(w,100);
        self.m_load_text = new(Text,"下拉即可刷新",nil,nil,kAlignCenter,nil,22,197,195,193); 
        self.m_arrow = new(Image,community_pin_map["pullIcon.png"]);
        self.m_arrow:setAlign(kAlignBottom);
        self.m_arrow:setPos(nil,60);
        self.m_bannerNode:addChild(self.m_load_text);
        self.m_bannerNode:addChild(self.m_arrow)
        self.m_load_text:setAlign(kAlignBottom);
        self.m_load_text:setPos(nil,30);
        self.m_persionListView:setTopBanner(self.m_bannerNode);
        self.m_persionListView:setOnScroll(self.onMsgListScroll, self);
        self.m_persionListView:setBottomBanner(self:showLoadingText());
        self.m_persionListView:setOnStop(function ()
            self:__needCreateItem();
        end)
        
        self.m_needCreateItem = true;
        self:__needCreateItem();
    else
        self:__updateItem();
    end

    self.m_persionListView:setVisible(true);

    self.m_persionListView:setFingerActionEnabled(true);
    self:__hideRecommendFriendView();
end

CommunityNearByLayer.__hidePersionListView = function(self)
    if self.m_persionListView then
        self.m_persionListView:setFingerActionEnabled(false);
    end
end

CommunityNearByLayer.cleanUpLoadingAnim = function(self)
    if self.m_loadingAnim then
       delete(self.m_loadingAnim); 
    end
    self.m_loadingAnim = nil;
    if self.m_loadingImage then
        delete(self.m_loadingImage);
    end
    self.m_loadingImage = nil;
end 

CommunityNearByLayer.showLoadingText = function (self)
    local node  = new(Node);
    self.m_loadingText = new(Text, "正在加载...", nil, nil, kAlignLeft, nil, 20, 255,255,255)
    self.m_loadingText:setAlign(kAlignCenter) 
    node:addChild(self.m_loadingText);
    self.m_loadingImage  = new(Image,"hall/common/loading.png");
    self.m_loadingImage:setPos(-100);
    self.m_loadingAnim = self.m_loadingImage:addPropRotate(0,kAnimRepeat,1440,0,0,360,kCenterDrawing);
    node:addChild(self.m_loadingImage)
    self.m_loadingImage:setAlign(kAlignCenter);
    node:setAlign(kAlignCenter);
    local width = self:findViewById(self.m_ctrl.contentView):getSize();
    node:setSize(width, 40);
    return node;
end

CommunityNearByLayer.onMsgListScroll = function (self,offset)
    if(offset >= 10 and offset < 130) then
        if  not self.m_requestNearByList then
            self.m_load_text:setText("下拉即可刷新");
            self.m_arrow:setFile(community_pin_map["pullIcon.png"]);
            self.m_refresh = false;
            self.m_animFinish = false;
        end
    elseif offset >= 130 then
        if not self.m_refresh then
            self.m_load_text:setText("释放即可刷新");
            local anim = self.m_arrow:addPropRotate(0,kAnimNormal,100,0,0,360,kCenterDrawing);
            if anim then
               anim:setDebugName("CommunityNearByLayer.onMsgListScroll| anim");
               anim:setEvent(self,function ()
                    self.m_arrow:setFile(community_pin_map["loosenIcon.png"]);    
                    self.m_load_text:setText("释放即可刷新");
                    self.m_animFinish = true;
               end);
            end
            self.m_refresh = true;
        end
    else
        self.m_animFinish = false;
        self.m_refresh = false;
        self.m_requestNearByList = false;
        self.m_arrow:removeProp(0);
        self.m_load_text:setText("");
        self.m_arrow:setFile(community_pin_map["pullIcon.png"]);
    end

    if self.m_refresh and self.m_animFinish then
        if not self.m_requestNearByList and  self.m_persionListView:isBouncingToTop() then
            self.m_load_text:setText("刷新中");
            self.m_arrow:setFile(community_pin_map["refreshicon.png"]);    
            self.m_requestNearByList = true;
            CommunityDataInterface.getInstance():getNearByList(true,self.m_lat,self.m_lon);
        end
     end
     self:updateBottomBanner();
end

CommunityNearByLayer.updateBottomBanner = function (self)
    if  self.m_persionListView:isBouncingToBottom() then
        self.m_needCreateItem = true;
    end
end

CommunityNearByLayer.__getAutoGetLocationSwitchState = function(self)
    dict_load(dict_name);
    local state = dict_get_int(dict_name, "switch",kFalse);
    return state;
end

CommunityNearByLayer.__saveAutoSwitchState = function (self,switchState)
    dict_load(dict_name);
    dict_set_int(dict_name, "switch", switchState);
    dict_save(dict_name);
end

CommunityNearByLayer.__setGetLocationSwitchState = function(self,isChecked)
    local switchState = isChecked and kTrue or kFalse;
    self:__saveAutoSwitchState(switchState);
    
end

CommunityNearByLayer.showNoticeView = function(self,msg,width ,height)
    Toast.setDefaultDisplayTime(ImSdkConstants.toastDisplayTime);
    Toast.getInstance():showTextView(msg,width or 640, height or 60,kAlignCenter,"",30,200,175,115);
    Toast.setDefaultDisplayTime();
end 

CommunityNearByLayer.s_controlConfig =
{
    [CommunityNearByLayer.s_controls.getLocationView]       = {"nearByView","getLocationView"},    
    [CommunityNearByLayer.s_controls.btnGotoLook]           = {"nearByView","getLocationView","btnGotoLook"},
    [CommunityNearByLayer.s_controls.checkBoxGroup]         = {"nearByView","getLocationView","checkBoxGroup"},
    
    [CommunityNearByLayer.s_controls.nearbyPersonView]      =   {"nearByView","nearbyPersonView"},
    [CommunityNearByLayer.s_controls.contentView]           =   {"nearByView","nearbyPersonView","contentView"},
    [CommunityNearByLayer.s_controls.notNearByFriend]       =   {"nearByView","nearbyPersonView","notNearByFriend"},
    
    [CommunityNearByLayer.s_controls.notOpenLocationView]   =   {"nearByView","notOpenLocationView"},

    [CommunityNearByLayer.s_controls.openLocationtextView]      = {"nearByView","getLocationView","openLocationtextView"},  

    [CommunityNearByLayer.s_controls.btnCleanUpLocation]        = {"nearByView","nearbyPersonView","cleanUpLocationView","bg","btnCleanUpLocation"},  

    [CommunityNearByLayer.s_controls.btnOpenLocation]         =   {"nearByView","notOpenLocationView","btnOpenLocation"},
    
    
};

CommunityNearByLayer.s_controlFuncMap =
{
    [CommunityNearByLayer.s_controls.btnGotoLook]           = CommunityNearByLayer.onBtnGotoLookClick,
    [CommunityNearByLayer.s_controls.btnCleanUpLocation]            = CommunityNearByLayer.onCleanUpLocationClick,
    [CommunityNearByLayer.s_controls.btnOpenLocation]           = CommunityNearByLayer.onOpenLocationClick,
    
};

return CommunityNearByLayer;
