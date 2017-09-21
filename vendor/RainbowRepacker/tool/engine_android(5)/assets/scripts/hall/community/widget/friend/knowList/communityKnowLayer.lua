local communityKnowLayer = require(ViewPath.."hall/community/friend/knowlist/communityKnowLayer");
local NVerticalListView = require("ui2/NVerticalListView");
local CommunityKnowLayer = class(CommonGameLayer,false);

CommunityKnowLayer.s_reatePageMaxNum = 8;

local h_index = 0;
local getIndex = function(self)
	h_index = h_index + 1;
	return h_index;
end

CommunityKnowLayer.s_controls =
{
    gotoLookView = getIndex(),
	knowListView = getIndex(),
    contentView = getIndex(),
    btnGotoLook = getIndex(),
    listView = getIndex(),
    searchEditText = getIndex(),
    notKnowFriend  = getIndex(),
    delBtn = getIndex(),
    searchIcon = getIndex(),
    knowPlayText = getIndex();
};

CommunityKnowLayer.ctor = function(self)
	super(self,communityKnowLayer);
    self:setEventTouch(self, self.onEmptyFunc);
    self:setEventDrag(self, self.onEmptyFunc);
	self.m_ctrls = CommunityKnowLayer.s_controls;
	self.m_gotoLookView = self:findViewById(self.m_ctrls.gotoLookView);
    self.m_knowView = self:findViewById(self.m_ctrls.knowListView);
    self.m_contentView = self:findViewById(self.m_ctrls.contentView);
    self.m_btnGotoLook = self:findViewById(self.m_ctrls.btnGotoLook);
    self.m_listView = self:findViewById(self.m_ctrls.listView);
    self.m_searchEdit = self:findViewById(self.m_ctrls.searchEditText);
    self.m_hintWords = "输入联系人名称或手机号";
    self.m_searchEdit:setReturnTypeEx(EditText.s_EX_RETURNTYPE_SEARCH);
    self.m_searchEdit:setHintText(self.m_hintWords,132,135,126);
    self.m_searchEdit:setMaxLength(20);
    self.m_notKnowFriend = self:findViewById(self.m_ctrls.notKnowFriend);
    self.m_delBtn = self:findViewById(self.m_ctrls.delBtn);
    self.m_knowList = {};
    self:__init();
    CommunityDataInterface.getInstance():setObserver(self);
end

CommunityKnowLayer.dtor = function(self)
    self:_stopTimeOutTimer();
   CommunityDataInterface.getInstance():clearObserver(self);
end

CommunityKnowLayer.__init = function (self)
   local toSeeIsShow = CommunityDataInterface.getInstance():getKonwToSeeIsShow()
   self:setIsVisible(toSeeIsShow,not toSeeIsShow);

   local text = string.format("想知道你的通讯录中谁在玩%s吗？", RegionConfigDataInterface.getInstance():getRegionProductName());
   self:findViewById(self.m_ctrls.knowPlayText):setText(text);
end

CommunityKnowLayer.__createKnowList = function (self)
    if table.isEmpty(self.m_knowList) then
        return;
    else
        self:__setBtnStatus(true);
    end
    if not self.m_knowListView then
        local w,h = self.m_listView:getSize();
        self.m_knowListView = NVerticalListView.create();
        self.m_listView:addChild(self.m_knowListView);   
        self.m_knowListView:setAlign(kAlignCenter);
        self.m_knowListView:setSize(w,h);
        self.m_knowListView:setScrollBarWidth(0);

        self.m_knowListView:setOnScroll(self.onMsgListScroll, self);
        self.m_knowListView:setBottomBanner(self:showLoadingText());
        self.m_knowListView:setOnStop(function ()
            self:__needCreateItem();
        end)
        self.m_needCreateItem = true;
        self:__needCreateItem();
    else
        self:__updateItem();
    end
    if #self.m_knowList == 0 then
        self.m_knowListView:setFingerActionEnabled(false);
    else
        self.m_knowListView:setFingerActionEnabled(true);
    end
   self:__showKnowOrSearchListView(true);
end

CommunityKnowLayer.__showKnowOrSearchListView = function (self,setVisible)
    if self.m_knowListView then
        self.m_knowListView:setVisible(setVisible);
    end
    if self.m_searchListView then
        self.m_searchListView:setVisible(not setVisible);
    end
end

CommunityKnowLayer.showLoadingText = function (self)
    local node  = new(Node);
    self.m_loadingText = new(Text, "正在加载...", nil, nil, kAlignLeft, nil, 20, 255,255,255)
    self.m_loadingText:setAlign(kAlignCenter) 
    node:addChild(self.m_loadingText);
    self.m_loadingImage  = new(Image,"hall/common/loading.png");
    self.m_loadingImage:setPos(-100);
    self.m_loadingImage:addPropRotate(0,kAnimRepeat,1440,0,0,360,kCenterDrawing);
    node:addChild(self.m_loadingImage)
    self.m_loadingImage:setAlign(kAlignCenter);
    node:setAlign(kAlignCenter);
    local width = self.m_listView:getSize();
    node:setSize(width, 40);
    return node;
end

CommunityKnowLayer.cleanUpLoadingAnim = function(self)
    if self.m_loadingImage then
        local parent = self.m_loadingImage:getParent();
        if parent then
            parent:removeChild(self.m_loadingImage);
        end
        delete(self.m_loadingImage);
        self.m_loadingImage = nil;
    end
end 

CommunityKnowLayer.onMsgListScroll = function (self,offset)
   self:updateBottomBanner();
end

CommunityKnowLayer.updateBottomBanner = function (self)
    if  self.m_knowListView:isBouncingToBottom() then
        self.m_needCreateItem = true;
    end
end

--每组创建五个item
CommunityKnowLayer.__needCreateItem = function (self)
    if  not self.m_needCreateItem or not self.m_knowListView then
        return;
    end
    
    local maxItem = CommunityKnowLayer.s_reatePageMaxNum;
    local itemCount = self.m_knowListView:getItemCount();
    local data = self.m_knowList;
    local len = #data;
    local diff = len-itemCount;
    if len == 0 then --暂无好友
        self.m_needCreateItem = false;
        return;
    end
    local index  = 0;
    if diff > 0 then --创建
        if diff  >= maxItem then
            index = maxItem;
        else
            index = diff;
        end 
    elseif diff == 0 then
        self.m_loadingText:setText("没有更多认识的人了");
        self:cleanUpLoadingAnim();         
    end
    local maxIndex = index+itemCount;
    for k = itemCount+1,maxIndex do
        self.m_knowListView:addInvokeOnStop(function ()
            local actualIndex = k;
            local obj = data[actualIndex];
            if obj then
                self:__createKnowListItem(obj);
            end
            if actualIndex == maxIndex then
                LoadingView.getInstance():hidden();  
                self.m_needCreateItem = false;
            end
            if actualIndex == len then
                self.m_loadingText:setText("没有更多认识的人了");
                self:cleanUpLoadingAnim();
            end
        end)
    end
end

--创建一个item
CommunityKnowLayer.__createKnowListItem = function (self,v)
    local item = new(require("hall/community/widget/friend/knowList/communityContactListItem"),v,"knowList");
    self.m_knowListView:addItem(item);
end

--刷新状态 未注册  注册（好友 非好友）
CommunityKnowLayer.__updateItem = function (self)
    local data = self.m_knowList;
    local len = #data;
    if table.isEmpty(data) then
        return;
    end
    --刷新item属性
    local itemCount = self.m_knowListView:getItemCount();
    for index = 1,itemCount do
        self.m_knowListView:addInvokeOnStop(function ()
        local actualIndex = index;
        local obj = data[actualIndex];
        local item = self.m_knowListView:getItem(actualIndex)
            if obj then
                item:updateListItem(obj,"knowList");
            end
        end)
    end

    if len - itemCount > 0 and itemCount < CommunityKnowLayer.s_reatePageMaxNum then --添加
       self.m_needCreateItem = true;
       self:__needCreateItem(); 
    elseif len - itemCount < 0 then --删除   
        for index = itemCount, len+1, -1 do
            self.m_knowListView:addInvokeOnStop(function ()
                self.m_knowListView:removeItem(index, true);
            end);    
        end
    end
end

CommunityKnowLayer.__setBtnStatus = function (self, status)
    self:findViewById(self.m_ctrls.searchEditText):setPickable(status);
    self:findViewById(self.m_ctrls.searchIcon):setPickable(status);
end

CommunityKnowLayer.show = function (self)
    CommonGameLayer.show(self);
    self:__showKnowOrSearchListView(true);
    if not CommunityDataInterface.getInstance():getKonwToSeeIsShow() then
        self:__jumpKnowListOrMayKnowFriend();
    end
end

CommunityKnowLayer.setIsVisible = function (self,gotoVisible,searchVisible)
    self.m_gotoLookView:setVisible(gotoVisible);
    self.m_knowView:setVisible(searchVisible);
end


CommunityKnowLayer.onSearchEditClick = function (self)

end

CommunityKnowLayer.onEmptyFunc = function (self)
  
end

CommunityKnowLayer.onGetKnowListCallBack = function(self, isSuccess, knowList,page)
    self:_stopTimeOutTimer();
    
    if isSuccess then
        UBReport.getInstance():report(UBConfig.kHallCommunityKnowContactsDone);
        self.m_knowList = knowList;
        self.m_notKnowFriend:setVisible(false);
        self:__createKnowList(); 
    end

    if  not table.isEmpty(self.m_knowList) then --显示认识的人
        self:setIsVisible(false,true);
        if self.m_recommendFriend then
            self.m_recommendFriend:hide();
        end
    else
        self:__recommendFriend(); --显示推荐好友
    end

    if  CommunityDataInterface.getInstance():getFriendRankLayout() == "knowLayout" then
        LoadingView.getInstance():hidden();
    end
end

--如果获取认识人列表为空，就直接跳到暂无认识的人界面 
CommunityKnowLayer.__jumpKnowListOrMayKnowFriend = function (self)
    local isSuccess = false
    if table.isEmpty(self.m_knowList) then
        self.m_notKnowFriend:setVisible(false);
        isSuccess, self.m_knowList = CommunityDataInterface.getInstance():getKnowList(true);
        if table.isEmpty(self.m_knowList) then
            self:__setBtnStatus(false);
            LoadingView.getInstance():showText("正在获取认识的人...", 70, 90, true);
        else
            self:__createKnowList();
        end
    end

    if not table.isEmpty(self.m_knowList) then
        self:setIsVisible(false,true);
        if self.m_recommendFriend then
            self.m_recommendFriend:hide();
        end
    else
        if not isSuccess then
            LoadingView.getInstance():hidden();
            self:__recommendFriend(); --显示推荐好友             
        else
            self:_startTimeOutTimer();
        end
    end
end

CommunityKnowLayer._startTimeOutTimer = function(self)
    self:_stopTimeOutTimer();
    self.m_timeOutTimer = AnimFactory.createAnimInt(kAnimNormal, 0, 1, 6000, -1);
    self.m_timeOutTimer:setDebugName("CommunityKnowLayer.m_timeOutTimer");
    self.m_timeOutTimer:setEvent(self, function()
            self:_stopTimeOutTimer();
            LoadingView.getInstance():hidden();
            self:__recommendFriend(); --显示推荐好友 
        end );
end

CommunityKnowLayer._stopTimeOutTimer = function(self)
    delete(self.m_timeOutTimer);
    self.m_timeOutTimer = nil;
end

--推荐好友
CommunityKnowLayer.__recommendFriend = function (self)
    self:setIsVisible(false,false);
    if not self.m_recommendFriend then
        self.m_recommendFriend = new(require("hall/community/widget/friend/communityGetContactsFail"));
        self.m_recommendFriend:setDelegate(self);
        self.m_contentView:addChild(self.m_recommendFriend);
    end
    
    self.m_recommendFriend:show();        
end


CommunityKnowLayer.onBtnGotoLookClick = function(self)
    UBReport.getInstance():report(UBConfig.kHallCommunityKnowContacts);
   self:__jumpKnowListOrMayKnowFriend();     
   CommunityDataInterface.getInstance():setKonwToSeeIsShow(false);
end

CommunityKnowLayer.showNoticeView = function (self,msg,width ,height)
    Toast.setDefaultDisplayTime(ImSdkConstants.toastDisplayTime);
    Toast.getInstance():showTextView(msg,width or 640, height or 60,kAlignCenter,"",30,200,175,115);    
    Toast.setDefaultDisplayTime();
end

CommunityKnowLayer.__showSearchResult = function (self,str)
    if not self.m_knowListView then
        return;
    end
    if table.isEmpty(self.m_knowList) then
        local msg = str;
        if table.isEmpty(self.m_knowList) then
            msg = "暂无联系人";
        end
        self:showNoticeView(msg);
        return;
    end
    local data = {};
    for k,v in ipairs(self.m_knowList)do
       local pos; 
       pos = string.find(tostring(v.phone_number),str);
       if pos == 1 then
            table.insert(data,v);
       else
           pos = string.find(v.name,tostring(str));  
           if pos == 1 then
               table.insert(data,v);
           end
       end
    end
    if table.isEmpty(data) then 
        self:showNoticeView("该联系人不存在");
    else
        self:__createshowSearchResultItem(data);
        self:__showKnowOrSearchListView(false);
    end
end

--清楚记录
CommunityKnowLayer.cleanUpSearchRecord = function (self)
    if table.isEmpty(self.m_knowList) then
        return;
    end
    self.m_delBtn:setVisible(false);
    self:__showKnowOrSearchListView(true);
    self.m_searchEdit:setText(self.m_hintWords);
end

--显示搜索结果
CommunityKnowLayer.__createshowSearchResultItem = function (self,data)
     if not self.m_searchListView then
        self.m_searchListView = NVerticalListView.create();
        self.m_searchListView:setAlign(kAlignCenter);
        self.m_searchListView:setSize(self.m_listView:getSize());
        self.m_searchListView:setScrollBarWidth(0);
        self.m_listView:addChild(self.m_searchListView);
    end
    self.m_searchListView:addInvokeOnStop(function ()
        self.m_searchListView:removeAllItems();    
    end)
    for index,v in ipairs(table.verify(data)) do
        self.m_searchListView:addInvokeOnStop(function ()
            local actualIndex = index;
            local obj = v;
            local item = new(require("hall/community/widget/friend/knowList/communityContactListItem"),obj,"knowList");
            self.m_searchListView:addItem(item);
        end)
    end    
end

CommunityKnowLayer.onSearchEditTextClick = function (self,p_string,flag)
    local str = string.trim(self.m_searchEdit:getText());
    self.m_delBtn:setVisible(true);
    if string.isEmpty(str) then
        self.m_delBtn:setVisible(false);
        self:__showKnowOrSearchListView(true);
        self.m_searchEdit:setText(self.m_hintWords,nil,nil,132,135,126);
    else
         self.m_searchEdit:setText(str,nil,nil,255,255,255);
         if flag == EditText.s_EX_CLOSE_DONE then
            self:onSearchClick();
         end
    end
end

CommunityKnowLayer.onSearchClick = function(self)
    UBReport.getInstance():report(UBConfig.kHallCommunityKnowSearch);
    local str = string.trim(self.m_searchEdit:getText());
    if string.isEmpty(str) then
        self:showNoticeView(self.m_hintWords);
        return;
    end
    self:__showSearchResult(str);
end

CommunityKnowLayer.onRequestAddFriendCallBack = function(self, isSuccess,msg)
    self:showNoticeView(msg);
end

CommunityKnowLayer.onAddFriendResultCallBack = function (self,isSuccess,data)
	UBReport.getInstance():report(UBConfig.kHallCommunityKnowAddFriend);
    if isSuccess then
        local status = data.result == 1 and true or false;
        if self.m_knowListView then
            if self:__setIsFriendFlag(data.cid,status) then
                self:__updateItem();-- 刷新
            end
        end
    end
end

CommunityKnowLayer.__setIsFriendFlag = function(self,cid,status)
    local flag = false;
    if table.isEmpty(self.m_knowList)  then
       return;
    end
    for k,v in pairs(table.verify(self.m_knowList)) do
        if v.cid == cid then
            if status then
                v.is_friend = 1;
            else
                v.is_friend = 0;
                v.addFriend = false;
                CommunityDataInterface.getInstance():refreshKnowAddFriendBtnStatus(cid);
            end
            flag = true;
        end
    end
    return flag;
end


CommunityKnowLayer.s_controlConfig =
{
	[CommunityKnowLayer.s_controls.gotoLookView] 			= {"knowView","gotoLookView"},
    [CommunityKnowLayer.s_controls.knowListView] 	        = {"knowView","knowListView"},
    [CommunityKnowLayer.s_controls.knowPlayText]            = {"knowView","gotoLookView","knowPlay"},
    [CommunityKnowLayer.s_controls.listView] 	            = {"knowView","knowListView","listView"},
    [CommunityKnowLayer.s_controls.contentView]             = {"knowView","contentView"},
    [CommunityKnowLayer.s_controls.btnGotoLook] 			= {"knowView","gotoLookView","btnGotoLook"},
    [CommunityKnowLayer.s_controls.searchEditText] 		    = {"knowView","knowListView","editView","searchBg","searchEditText"},
    [CommunityKnowLayer.s_controls.notKnowFriend] 			= {"knowView","notKnowFriend"},
    [CommunityKnowLayer.s_controls.delBtn] 		            = {"knowView","knowListView","editView","searchBg","delBtn"},
    [CommunityKnowLayer.s_controls.searchIcon] 		        = {"knowView","knowListView","editView","searchBg","searchIcon"},
    
};

CommunityKnowLayer.s_controlFuncMap =
{
	[CommunityKnowLayer.s_controls.btnGotoLook] 	        = CommunityKnowLayer.onBtnGotoLookClick,
	[CommunityKnowLayer.s_controls.searchEditText] 	        = CommunityKnowLayer.onSearchEditTextClick,
    [CommunityKnowLayer.s_controls.delBtn] 	                = CommunityKnowLayer.cleanUpSearchRecord,
    [CommunityKnowLayer.s_controls.searchIcon] 	            = CommunityKnowLayer.onSearchClick,
};

return CommunityKnowLayer;