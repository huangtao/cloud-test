local communityMainLayout = require(ViewPath .. "hall/community/communityMainLayout");
local communityFriendCircleLayout = require(ViewPath.."hall/community/friendCircle/communityFriendCircleLayout");

local community_pin_map = require("qnFiles/qnPlist/hall/community_pin")




require("hall/community/widget/friendCircle/communityFriendCircleLayout");
require("hall/community/widget/forum/communityForumLayout");

require("isolater/interface/communityIsolater");


local CommunityScene = class(CommonScene);

CommunityScene.s_event_changeToFriendChatLayout = EventDispatcher.getInstance():getUserEvent();


local h_index = 0;
local getIndex = function(self)
    h_index = h_index + 1;
    return h_index;
end

CommunityScene.s_controls =
{
    tabFriends = getIndex(),
    tabMessage = getIndex(),
    tabSelected = getIndex(),
    centerView = getIndex(),
    topBarView = getIndex(),
    redHot = getIndex(),
    messageNumView = getIndex(),
    spot = getIndex(),
    bg  = getIndex();
    canvas = getIndex();
    Button_return = getIndex();
    Image__tittle = getIndex();
};

CommunityScene.s_cmds =
{
    refreshUnReadMessageNum = getIndex();
};

CommunityScene.ctor = function(self, viewConfig, controller)
    self.m_blurNode = nil;
    self.m_controller = controller;
    self.m_ctrls = CommunityScene.s_controls;
    self:__init();
    self:findViewById(self.m_ctrls.Image__tittle):restoreSize();
    EventDispatcher.getInstance():register(CommunityScene.s_event_changeToFriendChatLayout, self, self.onShowFriendChatLayout);
end

CommunityScene.__init = function(self)
    self.m_redHot = self:findViewById(self.m_ctrls.redHot);
    self:__isShowRedHot();
    self:__initBg()
end

CommunityScene.__initBg = function(self)
    HolidaysBgDataInterface.getInstance():showImg(HolidaysBgDataInterface.ImgType.Bg, self:findViewById(self.m_ctrls.canvas))
end

CommunityScene.dtor = function(self)

    if self.m_blurNode then
        local blur = require("libEffect/shaders/blur");
        blur.removeEffect(self.m_blurNode);
    end

    delete(self.m_chatLayer);
    ImageCache.getInstance():cleanRef(self);
    EventDispatcher.getInstance():unregister(CommunityScene.s_event_changeToFriendChatLayout, self, self.onShowFriendChatLayout);
end

CommunityScene.refreshBlurNode = function(self,isFriendChat)
    local __bg = self:findViewById(self.s_controls.canvas);
    if self.m_blurNode then
        local blur = require("libEffect/shaders/blur");
        blur.removeEffect(self.m_blurNode);
        __bg:removeChild(self.m_blurNode,true);
        self.m_blurNode = nil;
    end

    local __getRect = function(isFriendChat)
        local __xx,__yy = self:findViewById(self.s_controls.centerView):getAbsolutePos();
        if isFriendChat then
            __xx = __xx + 0;
            __yy = __yy + 80;
            return __xx,__yy,1016,496
        else
            return __xx,__yy,1016,580
        end
    end

    local __x,__y,__width,__height = __getRect(isFriendChat);
    self.m_blurNode  = ShaderManager.getPartBlurNode(__bg,10,1,__x,__y,__width,__height);
end

CommunityScene.resume = function(self)
    CommonScene.resume(self);
    self:onTabFriendClick();
end

CommunityScene.pause = function(self)
    CommonScene.pause(self);
    LoadingView.getInstance():hidden();
end

CommunityScene.__isShowRedHot = function (self)
    local  redNum = CommunityDataInterface.getInstance():hasNewMessage();
    Log.v("CommunityScene.__isShowRedHot","redNum = ",redNum)
    if redNum > 0 then
        self.m_redHot:setVisible(true);
    else
        self.m_redHot:setVisible(false);
    end
end

--显示红点
CommunityScene.refreshUnReadMessageNum = function (self)
    self:__isShowRedHot();
end

CommunityScene.onNativeTabFriendClick = function(self)
    UBReport.getInstance():report(UBConfig.kHallCommunityTabFriend);
    self:onTabFriendClick()
end

--点击好友tab
CommunityScene.onTabFriendClick = function(self)
    self:refreshBlurNode(true);
   Toast.getInstance():hidden();
   LoadingView.getInstance():hidden();
   self:__setTabSelect(self.m_ctrls.tabFriends);
   self.m_friendView = self:__addLayerToCenterView(self.m_friendView, require("hall/community/widget/friend/friendMainLayout"));
   CommunityDataInterface.getInstance():setChatLayerStatus();
end

CommunityScene.onTabMessageClick = function(self)
    self:refreshBlurNode();
    UBReport.getInstance():report(UBConfig.kHallCommunityTabMessage);
    Toast.getInstance():hidden();
    LoadingView.getInstance():hidden();
    self.m_messageView = self:__addLayerToCenterView(self.m_messageView,require("hall/community/widget/message/communityMessageLayer"));
    self:__setTabSelect(self.m_ctrls.tabMessage);  
    self.m_messageView:showMessageList();
end

CommunityScene.onShowFriendChatLayout = function(self, friendData)
    Toast.getInstance():hidden();
    self.m_messageView = self:__addLayerToCenterView(self.m_messageView,require("hall/community/widget/message/communityMessageLayer"));
    self:__setTabSelect(self.m_ctrls.tabMessage);
    self.m_messageView:showFriendChatList(friendData);
end

CommunityScene.__addLayerToCenterView = function(self, memberName, layerClass)
    if not memberName then
        memberName = new(layerClass);
        self:findViewById(self.m_ctrls.centerView):addChild(memberName);
        memberName:setFillParent(true, true);
        memberName:setDelegate(self);
    end
    return memberName;
end

--设置tab选中状态
CommunityScene.__setTabSelect = function(self, selectTabId)
    local tabs = {  
        self.m_ctrls.tabFriends,
        self.m_ctrls.tabMessage,
    };

    local views = {
        self.m_friendView,
        self.m_messageView,
    }

    local images = {  
        "tab_friends_selected.png","tab_friends_select.png",
        "tab_message_selected.png","tab_message_select.png",
    };
    local selectImg = {
       "selected_friend.png","selected_forum.png","selected_progress_bar.png", "selected_forum.png",  
       99, 99,111,99,
       -17, 131,276,418,
    }

    for index, tabId in pairs(tabs) do
        local tab = self:findViewById(tabId);
        local isSelect = selectTabId == tabId;
        local image = isSelect and community_pin_map[images[2*index-1]] or community_pin_map[images[2*index]];
        local title = tab:getChildByName("img_title");
        title:setFile(image);
        if views[index] then
            views[index]:setVisible(isSelect);
        end
        local tabBg = self:findViewById(self.m_ctrls.bg):getChildByName("bg"..index);
        if isSelect then
            local tabSelected = self:findViewById(self.m_ctrls.tabSelected);
            tabSelected:setPos(selectImg[index+4],selectImg[index+8]);
            tabSelected:setFile(community_pin_map[selectImg[index]]);
            tabSelected:setSize(tabSelected.m_res:getWidth(),tabSelected.m_res:getHeight());
            tabBg:setVisible(true);
        else    
            tabBg:setVisible(false);
        end
    end
end


--@delegate 点击大厅按钮
CommunityScene.onHallBtnClick = function(self)
    self:onChangeToOtherState(States.Hall);
end

--@delegate 点击比赛按钮
CommunityScene.onMatchBtnClick = function(self)
    self:onChangeToOtherState(States.GameMatchHall);
end

CommunityScene.onChangeToOtherState = function(self, state, ...)
    self:requestCtrlCmd(CommunityController.s_cmds.onChangeToOtherState, state, ...);
end

CommunityScene.onButton_returnClick = function(self)
    self:onChangeToOtherState(States.Hall);
end

CommunityScene.s_controlConfig =
{
    [CommunityScene.s_controls.tabFriends]      = {"content","leftTabView","tabFriends"};
    [CommunityScene.s_controls.tabMessage]      = {"content","leftTabView","tabMessage"};

    [CommunityScene.s_controls.tabSelected]     = {"content","leftTabView","tabSelected"};
    [CommunityScene.s_controls.centerView]      = {"content","centerView"};
    [CommunityScene.s_controls.topBarView]      = {"topBarView"};
    [CommunityScene.s_controls.redHot]          = {"content","leftTabView","tabMessage","redHot"};
    [CommunityScene.s_controls.bg]              = {"content","leftTabView","bg"};
    [CommunityScene.s_controls.canvas]          = {"bg"};
    [CommunityScene.s_controls.Button_return]   = {"Button_return"};
    [CommunityScene.s_controls.Image__tittle]   = {"Image_top_bg","Image__tittle"};
    
};

CommunityScene.s_controlFuncMap =
{
    [CommunityScene.s_controls.tabFriends]           = CommunityScene.onNativeTabFriendClick;
    [CommunityScene.s_controls.tabMessage]           = CommunityScene.onTabMessageClick;
    [CommunityScene.s_controls.Button_return]        = CommunityScene.onButton_returnClick; 
};

CommunityScene.s_cmdConfig =
{
    [CommunityScene.s_cmds.refreshUnReadMessageNum] = CommunityScene.refreshUnReadMessageNum;
}

return CommunityScene;