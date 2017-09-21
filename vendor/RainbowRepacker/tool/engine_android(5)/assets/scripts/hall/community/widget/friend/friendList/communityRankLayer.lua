local communityRankLayer = require(ViewPath.."hall/community/friend/friendlist/communityRankLayer");
local CommunityRankTypeList = require("hall/community/widget/friend/friendList/communityRankTypeList");
local community_pin_map = require("qnFiles/qnPlist/hall/community_pin")


local NVerticalListView = require("ui2/NVerticalListView");

local CommunityRankLayer = class(CommonGameLayer,false);

CommunityRankLayer.s_eachCreateItemNum = 8;

CommunityRankLayer.eViewStatus = {
    FRIEND_LIST = 1;
    SEARCH_FRIEND_LIST = 2;
}

local h_index = 0;
local getIndex = function(self)
	h_index = h_index + 1;
	return h_index;
end

CommunityRankLayer.s_controls =
{
    listView = getIndex(),
	searchEdit = getIndex(),
    typeView = getIndex(),
    notFriend = getIndex(),
    delBtn   = getIndex(),
    searchIcon = getIndex(),
};

CommunityRankLayer.ctor = function(self)
	super(self,communityRankLayer);
    self:setFillParent(true, true);
	self.m_ctrls = CommunityRankLayer.s_controls;
    self.m_notFriend = self:findViewById(self.m_ctrls.notFriend);
    self.m_delBtn = self:findViewById(self.m_ctrls.delBtn);
    CommunityDataInterface.getInstance():setObserver(self);
    self:__initRankTypeList();
    self.m_searchEdit = self:findViewById(self.m_ctrls.searchEdit);
    self.m_searchEdit:setReturnTypeEx(EditText.s_EX_RETURNTYPE_SEARCH);
    self.m_hintWords = "输入好友昵称或ID";
    self.m_searchEdit:setHintText(self.m_hintWords,132,135,126);
    self.m_friendList = {};

    self.m_searchEdit:setMaxLength(20);
end

CommunityRankLayer.dtor = function(self)
   CommunityDataInterface.getInstance():clearObserver(self);
   self:cleanUpLoadingAnim();
end

CommunityRankLayer.__initListItemPos = function (self)
    if not self.m_friendListView then
        return;
    end
    for index = 1, self.m_friendListView:getItemCount() do
        local item = self.m_friendListView:getItem(index);
        local x  = item:getPos();
        if x~= 0 then
            item:setPos(0,nil);
        end
    end
end

CommunityRankLayer.__setBtnStatus = function (self, status)
    self:findViewById(self.m_ctrls.searchIcon):setPickable(status);
    self:findViewById(self.m_ctrls.searchEdit):setPickable(status);
    self:findViewById(self.m_ctrls.typeView):setPickable(status);
end

CommunityRankLayer.show = function(self)
    CommonGameLayer.show(self);
    if table.isEmpty(self.m_friendList) then
        local isSuccess;
        self.m_friendList, isSuccess = CommunityDataInterface.getInstance():getFriendList(true,"在线");

        if not table.isEmpty(self.m_friendList) then
            self:__showFriendRankListView("在线");
        elseif isSuccess then
            LoadingView.getInstance():showText("正在获取好友排行...", 70, 90, true);
        end
    end
    
    self:__initListItemPos();
    self:__setViewsStatus(CommunityRankLayer.eViewStatus.FRIEND_LIST, true);
end

--@detegate
CommunityRankLayer.onGetFriendListCallBack = function(self, isSuccess, friendList, rankType)
    if CommunityDataInterface.getInstance():getFriendRankLayout() == "friendRankLayout" then
        LoadingView.getInstance():hidden();
    end

    if isSuccess then
        self.m_friendList = table.verify(friendList);
    end

    self:__showFriendRankListView(rankType);
end

CommunityRankLayer.__initRankTypeList = function(self)
    self.m_rankTypelistData = {};
    local name = {"在线","银币","钻石","经验","等级","大师分"};
    for i = 1, #name do
        self.m_rankTypelistData[i] = {};
        self.m_rankTypelistData[i].name = name[i];
    end

	if not self.m_rankTypeList then
		self.m_rankTypeList = new(CommunityRankTypeList, CommunityRankTypeList.kDirectionUp, self.m_rankTypelistData);
		self:findViewById(self.m_ctrls.typeView):addChild(self.m_rankTypeList);
	end
end

CommunityRankLayer.__showFriendRankListView = function(self, rankType)
    self.m_rankType = rankType;
    local parent = self:findViewById(self.m_ctrls.listView);
    parent:setVisible(true);
    if not self.m_friendListView then
        local w,h = parent:getSize();
        self.m_friendListView = NVerticalListView.create();
        self.m_friendListView:setAlign(kAlignCenter);
        self.m_friendListView:setSize(w,h);
        parent:addChild(self.m_friendListView);
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
        self.m_friendListView:setTopBanner(self.m_bannerNode);
        self.m_friendListView:setOnScroll(self.onMsgListScroll, self);
        self.m_friendListView:setBottomBanner(self:createLoadingText());
        self.m_friendListView:setOnStop(function ()
            self:__needCreateItem();
        end)

        self.m_needCreateItem = true;
        self:__needCreateItem();
    else
        self:__updateItem();
    end

    self:__setViewsStatus(CommunityRankLayer.eViewStatus.FRIEND_LIST);
end

CommunityRankLayer.createLoadingText = function (self)
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
    local width = self.m_friendListView:getSize();
    node:setSize(width, 40);
    return node;
end

CommunityRankLayer.cleanUpLoadingAnim = function(self)
    delete(self.m_loadingAnim); 
    self.m_loadingAnim = nil;
    
    delete(self.m_loadingImage);
    self.m_loadingImage = nil;
end 

CommunityRankLayer.updateBottomBanner = function (self)
    if  self.m_friendListView:isBouncingToBottom() then
        self.m_needCreateItem = true;
    end
end

CommunityRankLayer.__setViewsStatus = function(self, curViewStatus, isLoading)
    local bVisible = {};
    if curViewStatus == CommunityRankLayer.eViewStatus.FRIEND_LIST then
        local isNoFriend = table.isEmpty(self.m_friendList);
        bVisible = {isNoFriend, not isNoFriend, false};
    else
        bVisible = {false, false, true};
    end

    if self.m_notFriend then
        self.m_notFriend:setVisible(bVisible[1] and not isLoading );
    end

    if self.m_friendListView then
        self.m_friendListView:setVisible(bVisible[2]);
    end

    if self.m_searchListView then
        self.m_searchListView:setVisible(bVisible[3]);
    end

    self:__setBtnStatus(not bVisible[1]);
end

CommunityRankLayer.onMsgListScroll = function (self,offset) 
    local removeArrowProp = function()
        if self.m_arrow:checkAddProp(0) then
            self.m_arrow:removeProp(0);
        end
    end

    if(offset >= 10 and offset < 130) then
        if not self.m_requestFriendList then
            self.m_load_text:setText("下拉即可刷新");
            self.m_arrow:setFile(community_pin_map["pullIcon.png"]);
            self.m_refresh = false;
            self.m_animFinish = false;
        end
    elseif offset >= 130 then
        if not self.m_refresh then
            self.m_load_text:setText("释放即可刷新");
            removeArrowProp();
            local anim = self.m_arrow:addPropRotate(0,kAnimNormal,100,0,0,360,kCenterDrawing);
            if anim then
               anim:setDebugName("CommunityRankLayer.onMsgListScroll| anim");
               anim:setEvent(self,function ()
                    removeArrowProp();
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
        self.m_requestFriendList = false;
        removeArrowProp();
        self.m_load_text:setText("");
        self.m_arrow:setFile(community_pin_map["pullIcon.png"]);
    end
    if self.m_refresh and self.m_animFinish then
        if not self.m_requestFriendList and  self.m_friendListView:isBouncingToTop() then
            self.m_load_text:setText("刷新中");
            self.m_arrow:setFile(community_pin_map["refreshicon.png"]);    
            self.m_requestFriendList = true;
            CommunityDataInterface.getInstance():getFriendList(true,self.m_rankType);
        end
     end
     self:updateBottomBanner();
end

--每次创建五个item
CommunityRankLayer.__needCreateItem = function (self)
    if not self.m_needCreateItem then
        return;
    end

    local itemCount = self.m_friendListView:getItemCount();
    local len = #self.m_friendList;
    local diff = len-itemCount;
    local index = 0;
    if len == 0 then --暂无好友
        self.m_notFriend:setVisible(true);
        return;
    end
    if diff > 0 then --创建
        if diff  >= CommunityRankLayer.s_eachCreateItemNum then
            index = CommunityRankLayer.s_eachCreateItemNum;
        else
            index = diff;
        end 
    elseif diff == 0 then
        self.m_loadingText:setText("没有更多好友了");
        self:cleanUpLoadingAnim();         
    end
    local maxIndex = index+itemCount;
    for k = itemCount+1,maxIndex do
        self.m_friendListView:addInvokeOnStop(function ()
            local actualIndex = k;
            local obj = self.m_friendList[actualIndex];
            if obj then
                self:__createRankListItem(actualIndex,obj);
            end
            if actualIndex == maxIndex then
                self.m_needCreateItem = false;
            end
            if actualIndex == len then
                self.m_loadingText:setText("没有更多好友了");
                self:cleanUpLoadingAnim();
            end
        end);
    end
end

CommunityRankLayer.__createRankListItem = function (self,k,v) 
    local item = new(require("hall/community/widget/friend/friendList/communityFriendRankListItem"),k,v,self.m_friendListView,self.m_rankType);
    self.m_friendListView:addItem(item);
end

CommunityRankLayer.__updateItem = function (self)
    local data  = self.m_friendList;
    local len = #data;
   
    local itemCount = self.m_friendListView:getItemCount();
    for index = 1, itemCount do
        self.m_friendListView:addInvokeOnStop(function () 
            local obj = data[index];
            if obj then
                local item = self.m_friendListView:getItem(index)
                item:updateListItem(index,obj,self.m_rankType);
            end
        end)
    end

    if len > itemCount then --添加
       self.m_needCreateItem = true;
       self:__needCreateItem();         

    elseif len < itemCount then --删除
        
        for index = itemCount, len+1, -1 do
            self.m_friendListView:addInvokeOnStop(function ()
                self.m_friendListView:removeItem(index, true);
            end);          
        end
    end

    if len == 0 then
        self.m_notFriend:setVisible(true);
    end
end

CommunityRankLayer.showNoticeView = function(self,msg,width ,height)
    Toast.setDefaultDisplayTime(ImSdkConstants.toastDisplayTime);
    Toast.getInstance():showTextView(msg,width or 640, height or 60,kAlignCenter,"",30,200,175,115);
    Toast.setDefaultDisplayTime();
end 

CommunityRankLayer.__showSearchResult = function (self,str)
    if not self.m_friendListView then
         return;
    end
    if table.isEmpty(self.m_friendList) then
        local msg = str;
        if table.isEmpty(self.m_friendList) then
            msg = "暂无好友";
        end
        self:showNoticeView(msg);
        return;
    end
    local data = {};
    for k,v in ipairs(self.m_friendList)do
       local pos; 
       pos = string.find(tostring(v.cid),str);
       if pos == 1 then
            table.insert(data,v);
       else
           pos = string.find(v.nickname,tostring(str));  
           if pos == 1 then
               table.insert(data,v); 
           end
       end
    end
    if table.isEmpty(data) then 
        self:showNoticeView("该好友不存在");
    else
        self:__createshowSearchResultItem(data);
        self:__setViewsStatus(CommunityRankLayer.eViewStatus.SEARCH_FRIEND_LIST);
    end
end

CommunityRankLayer.__createshowSearchResultItem = function (self,data)
    if not self.m_searchListView then
        local parent = self:findViewById(self.m_ctrls.listView);
        local w,h = parent:getSize();
        self.m_searchListView = NVerticalListView.create();
        self.m_searchListView:setAlign(kAlignCenter);
        self.m_searchListView:setSize(w,h);
        self.m_searchListView:setScrollBarWidth(0);
        parent:addChild(self.m_searchListView);
    end
    self.m_searchListView:addInvokeOnStop(function ()
        self.m_searchListView:removeAllItems();    
    end)
    for index,v in ipairs(table.verify(data)) do
        self.m_searchListView:addInvokeOnStop(function ()
            local actualIndex = index;
            local obj = v;
            local item = new(require("hall/community/widget/friend/friendList/communityFriendRankListItem"),actualIndex,obj,self.m_searchListView, "银币");
            self.m_searchListView:addItem(item); 
        end)
    end 
end

CommunityRankLayer.onSearchEditClick = function(self,p_string,flag)
    UBReport.getInstance():report(UBConfig.kHallCommunityRankSearch);
    local str = string.trim(self.m_searchEdit:getText());
    self.m_delBtn:setVisible(true);
    if string.isEmpty(str) then
        self.m_delBtn:setVisible(false);

        self:__setViewsStatus(CommunityRankLayer.eViewStatus.FRIEND_LIST);
    else
        self.m_searchEdit:setText(str,640,58,255,255,255);
        if flag == EditText.s_EX_CLOSE_DONE then
            self:onSearchClick();
        end
    end
end

CommunityRankLayer.onSearchClick = function (self)
    local str = string.trim(self.m_searchEdit:getText());
    if string.isEmpty(str)then
        self:showNoticeView(self.m_hintWords);
        return;
    end
    self:__showSearchResult(str);
end

--清楚记录
CommunityRankLayer.cleanUpSearchRecord = function (self)
    self.m_delBtn:setVisible(false);
    self.m_searchEdit:setText(nil);
    self:__setViewsStatus(CommunityRankLayer.eViewStatus.FRIEND_LIST);
end

CommunityRankLayer.s_controlConfig =
{
	[CommunityRankLayer.s_controls.searchEdit] 			= {"freindRankView","searchView","search","searchEdit"},
    [CommunityRankLayer.s_controls.listView] 	        = {"freindRankView","listView"},
    [CommunityRankLayer.s_controls.typeView] 	        = {"freindRankView","typeView"},
    [CommunityRankLayer.s_controls.notFriend] 	        = {"freindRankView","notFriend"}, 
    [CommunityRankLayer.s_controls.delBtn] 	            = {"freindRankView","searchView","search","delBtn"},
    [CommunityRankLayer.s_controls.searchIcon] 	        = {"freindRankView","searchView","search","searchIcon"},
    
};

CommunityRankLayer.s_controlFuncMap =
{
    [CommunityRankLayer.s_controls.searchEdit] 	    = CommunityRankLayer.onSearchEditClick,
    [CommunityRankLayer.s_controls.delBtn] 	        = CommunityRankLayer.cleanUpSearchRecord,
    [CommunityRankLayer.s_controls.searchIcon] 	    = CommunityRankLayer.onSearchClick,
};

return CommunityRankLayer;