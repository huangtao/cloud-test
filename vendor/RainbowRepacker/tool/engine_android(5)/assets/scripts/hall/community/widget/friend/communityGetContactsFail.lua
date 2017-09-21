local communityGetContactsFail = require(ViewPath.."hall/community/friend/communityGetContactsFail");
local community_pin_map = require("qnFiles/qnPlist/hall/community_pin")
local CommunityGetContactsFail = class(CommonGameLayer,false);

CommunityGetContactsFail.Delegate = {
   
}

local h_index = 0;
local getIndex = function(self)
	h_index = h_index + 1;
	return h_index;
end

local dict_name = "exchange_may_know_friend_dict_name";

CommunityGetContactsFail.s_controls =
{
    name = getIndex(),
    description = getIndex(),
    addFriend = getIndex(),
    headBg = getIndex(),
    exchange = getIndex(),
    recommendView = getIndex(),
    btnBg = getIndex(),
    imgAddFriend = getIndex(),
    notRecommend = getIndex(),
};

CommunityGetContactsFail.ctor = function(self)
	super(self,communityGetContactsFail);
    self:setSize( self.m_root:getSize() );
    self:setFillParent(true, true);
    self:setEventTouch(self, self.onEmptyFunc);
    self:setEventDrag(self, self.onEmptyFunc);
	self.m_ctrls = CommunityGetContactsFail.s_controls;
    self.m_name = self:findViewById(self.m_ctrls.name);
    self.m_description = self:findViewById(self.m_ctrls.description);
    self.m_addFriend = self:findViewById(self.m_ctrls.addFriend);
    self.m_headBg = self:findViewById(self.m_ctrls.headBg);
    self.m_btnBg = self:findViewById(self.m_ctrls.btnBg);
    self.m_imgAddFriend = self:findViewById(self.m_ctrls.imgAddFriend);
    self.m_recommendView = self:findViewById(self.m_ctrls.recommendView);
    self.m_notRecommend = self:findViewById(self.m_ctrls.notRecommend);
    CommunityDataInterface.getInstance():setObserver(self);
end

CommunityGetContactsFail.dtor = function (self)
    CommunityDataInterface.getInstance():clearObserver(self);
    ImageCache.getInstance():cleanRef(self);
end

CommunityGetContactsFail.onExchangeClick = function (self)
    LoadingView.getInstance():showText("正在推荐中...", 88, 20);
    CommunityDataInterface.getInstance():requestMaybeFamiliar(self:__getLastCid());
end

CommunityGetContactsFail.__getLastCid = function (self)
    dict_load(dict_name);
    local lastCid = dict_get_int(dict_name, "lastCid",kFalse);
    return lastCid;
end

CommunityGetContactsFail.onGetMaybeFamiliarCallBack = function (self,isSuccess,data)
    if isSuccess then
        self.m_recommendView:setVisible(true);
        self:updataRecommendFriend(data);
        self.m_notRecommend:setVisible(false);
    else
        self.m_recommendView:setVisible(false);
        self.m_notRecommend:setVisible(true);
    end
    LoadingView.getInstance():hidden();
end


CommunityGetContactsFail.__saveLastCid = function (self,lastCid)
    local cid  = lastCid or 0;
    dict_load(dict_name);
    dict_set_int(dict_name, "lastCid", cid);
    dict_save(dict_name);
end
 
CommunityGetContactsFail.show = function (self)
    self:setVisible(true);

    if table.isEmpty(self.m_data) then
        self:onExchangeClick();
    else
        self:updataRecommendFriend(self.m_data);
    end
end

CommunityGetContactsFail.hide = function (self)
    self:setVisible(false)
end


CommunityGetContactsFail.updataRecommendFriend = function(self,data)
     self.m_data = data;
     self:refreshBtnStatus(true);
     self.m_description:setText("你和TA有"..data.common_friend_num.."位共同好友");
     self.m_name:setText(data.nickname);
     self:__saveLastCid(data.cid);
     self:setHeadImage(kUserInfoData:getHallHeadBySex(data.sex));
     ImageCache.getInstance():request(data.avatar_url, self, self.onUpdateHeadImage);
end

CommunityGetContactsFail.onUpdateHeadImage = function(self,url,imagePath)
     if not url or not imagePath then
        return;
    end
    self:setHeadImage(imagePath);   
end

CommunityGetContactsFail.onAddFriendClick = function (self)
    if not self.m_data.addFriend then
        local  dst_cid = tonumber(self.m_data.cid or 0);
        CommunityDataInterface.getInstance():requestAddFriend(dst_cid);
        self.m_data.addFriend = true;
        self:refreshBtnStatus(false);
    end
end

CommunityGetContactsFail.refreshBtnStatus = function (self,isClick)
    if isClick then
        self.m_btnBg:setFile(community_pin_map["btn_sendInvite.png"]);
        self.m_imgAddFriend:setFile(community_pin_map["addFreindsText.png"]);
    else
        self.m_btnBg:setFile(community_pin_map["btn_knows.png"]);
        self.m_imgAddFriend:setFile(community_pin_map["applyed.png"]);
    end
    self.m_imgAddFriend:setSize(self.m_imgAddFriend.m_res:getWidth(),self.m_imgAddFriend.m_res:getHeight());
    self.m_addFriend:setEnable(isClick)
end

CommunityGetContactsFail.onRequestAddFriendCallBack = function(self, isSuccess,msg)
    Toast.setDefaultDisplayTime(ImSdkConstants.toastDisplayTime);
    Toast.getInstance():showTextView(msg,width or 640, height or 60,kAlignCenter,"",30,200,175,115);
    Toast.setDefaultDisplayTime();
end


CommunityGetContactsFail.setHeadImage = function(self,image)
    
	if self.m_headImage then
		self.m_headBg:removeChild(self.m_headImage);
	end
	delete(self.m_headImage);

	self.m_headImage = new(Mask, image, community_pin_map["mask.png"]);
	self.m_headBg:addChild(self.m_headImage);
	self.m_headImage:setAlign(kAlignCenter);
end

CommunityGetContactsFail.s_controlConfig =
{
    [CommunityGetContactsFail.s_controls.name] 			        = {"getContactsFailView","recommendView","bg","name"}, 
    [CommunityGetContactsFail.s_controls.description] 			= {"getContactsFailView","recommendView","bg","description"},
    [CommunityGetContactsFail.s_controls.addFriend] 			= {"getContactsFailView","recommendView","bg","addFriend"}, 
    [CommunityGetContactsFail.s_controls.headBg] 			    = {"getContactsFailView","recommendView","bg","headView","headBg"}, 
    [CommunityGetContactsFail.s_controls.exchange] 			    = {"getContactsFailView","recommendView","exchange"}, 
    [CommunityGetContactsFail.s_controls.recommendView] 			    = {"getContactsFailView","recommendView"}, 
    [CommunityGetContactsFail.s_controls.btnBg] 			= {"getContactsFailView","recommendView","bg","addFriend","btnBg"}, 
    [CommunityGetContactsFail.s_controls.notRecommend] 			= {"getContactsFailView","notRecommend"}, 
    [CommunityGetContactsFail.s_controls.imgAddFriend] 			= {"getContactsFailView","recommendView","bg","addFriend","imgAddFriend"}, 
    
};

CommunityGetContactsFail.s_controlFuncMap =
{
    [CommunityGetContactsFail.s_controls.addFriend] 	            = CommunityGetContactsFail.onAddFriendClick,
    [CommunityGetContactsFail.s_controls.exchange] 	                = CommunityGetContactsFail.onExchangeClick,
    
};

return CommunityGetContactsFail;