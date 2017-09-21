local communityAddFriendLayer = require(ViewPath.."hall/community/friend/friendlist/communityAddFriendLayer");
local community_pin_map = require("qnFiles/qnPlist/hall/community_pin")
local CommunityAddFriendLayer = class(IBaseDialog,false);

CommunityAddFriendLayer.Delegate = {

}

local h_index = 0;
local getIndex = function(self)
	h_index = h_index + 1;
	return h_index;
end

CommunityAddFriendLayer.btnStatus = {
    ADD = 0,
    APPLYED = 1,
    ADDED = 2,
}
    
CommunityAddFriendLayer.s_controls =
{
    btnCheck = getIndex(),
	checkEditText = getIndex(),
    headBg = getIndex(),
    name = getIndex(),
    btnAdd = getIndex(),
    btnClose = getIndex(),
    itemView = getIndex(),
    textView = getIndex(),
    addText = getIndex(),
    addBtnBg = getIndex(),
    btnAdd = getIndex(),
};

CommunityAddFriendLayer.ctor = function(self, cid)
	super(self,communityAddFriendLayer);
    self:setSize( self.m_root:getSize() );
    self:setFillParent(true, true);

    self:setEventTouch(self, self.onEmptyFunc);
    self:setEventDrag(self, self.onEmptyFunc);

	self.m_ctrls = CommunityAddFriendLayer.s_controls;
    CommunityDataInterface.getInstance():setObserver(self);

    self.m_itemView  =  self:findViewById(self.m_ctrls.itemView);
	self.m_textView = self:findViewById(self.m_ctrls.textView);
    self.m_name = self:findViewById(self.m_ctrls.name);
    self.m_headBg = self:findViewById(self.m_ctrls.headBg);
    self.m_name = self:findViewById(self.m_ctrls.name);
    self.m_btnAdd = self:findViewById(self.m_ctrls.btnAdd);
    self.m_addText = self:findViewById(self.m_ctrls.addText);
    self.m_addBtnBg = self:findViewById(self.m_ctrls.addBtnBg);
    self.m_checkEditText = self:findViewById(self.m_ctrls.checkEditText);
    self.m_checkEditText:setMaxLength(9)
    self.m_checkEditText:setReturnTypeEx(EditText.s_EX_RETURNTYPE_SEARCH);
    self:__initData(cid);
    self.m_checkId = true;
end


CommunityAddFriendLayer.__initData = function (self, cid)
    local str = "";
    if cid then
        str = string.valueOf(cid);
        self.m_checkEditText:setText(str);
        self:onCheckEditClick(str, EditText.s_EX_CLOSE_DONE);
    else
        str = "请输入要查找的ID"; 
    end
    self.m_checkEditText:setHintText(str);
    self.m_checkEditText:setInputMode(kEditBoxInputModeNumeric);
    self.m_itemView:setVisible(false);
    self.m_textView:setVisible(false);
    self.m_data  = {};
end

CommunityAddFriendLayer.dtor = function(self)
   ImageCache.getInstance():cleanRef(self);
   CommunityDataInterface.getInstance():clearObserver(self);
   Toast.getInstance():hidden();
end

CommunityAddFriendLayer.onCloseCheckFriendLayer = function (self)
    self:hide();
end

CommunityAddFriendLayer.onCheckEditClick = function (self,p_string,flag)
    local dst_cid = number.valueOf(self.m_checkEditText:getText());
    if dst_cid == 0 then
        self:showNoticeView("请输入正确ID");
        self.m_itemView:setVisible(false);
        self.m_textView:setVisible(true);
        self.m_checkEditText:setText("请输入要查找的ID");
    else
        self.m_checkId = true;
        if flag ==  EditText.s_EX_CLOSE_DONE then
            self:requestCheckFriendInfo();
        end
    end
end

CommunityAddFriendLayer.requestCheckFriendInfo = function (self)
    UBReport.getInstance():report(UBConfig.kHallCommunitySearchBtn);
	local dst_cid = number.valueOf(self.m_checkEditText:getText());
    if dst_cid ~= 0 and self.m_checkId then
        if dst_cid ~= kUserInfoData:getUserCid() then
            CommunityDataInterface.getInstance():requestFriendInfo(dst_cid);
            LoadingView.getInstance():showText("正在查找好友...");
        else
            self:showNoticeView("请输入正确的id(不能填写自己)");
        end
    end
end

CommunityAddFriendLayer.onGetUserDetailInfoCallBack = function(self, isSuccess, friendData)
    LoadingView.getInstance():hidden();
    self.m_checkId = false;
    if isSuccess and not table.isEmpty(friendData) then
        UBReport.getInstance():report(UBConfig.kHallCommunitySearchDone);
        self.m_data = friendData;
        self.m_itemView:setVisible(true);
        self.m_textView:setVisible(false);
        self.m_name:setText(friendData.nickname)
        if friendData.is_friend == 1 then
           self:refreshBtnStatus(CommunityAddFriendLayer.btnStatus.ADDED);
        else
            self:refreshBtnStatus(CommunityAddFriendLayer.btnStatus.ADD);
        end
        self:setHeadImage(kUserInfoData:getHallHeadBySex(self.m_data.sex));
        ImageCache.getInstance():request(self.m_data.avatar_url, self, self.onUpdateHeadImage);
    else
        self:showNoticeView("无效ID");
        self.m_textView:setVisible(true);
        self.m_itemView:setVisible(false);
    end
end

CommunityAddFriendLayer.onUpdateHeadImage = function(self,url,imagePath)
    if not url or not imagePath then
        return;
    end
    self.hasLoadHead = true;
    self:setHeadImage(imagePath);
end

CommunityAddFriendLayer.setHeadImage = function(self,image)
	if self.m_headImage then
		self.m_headBg:removeChild(self.m_headImage);
	end

	delete(self.m_headImage);
	self.m_headImage = new(Mask,image,community_pin_map["mask.png"]);
	self.m_headBg:addChild(self.m_headImage);
	self.m_headImage:setAlign(kAlignCenter);
end

CommunityAddFriendLayer.refreshBtnStatus = function (self,status)
    local enable = status < 1 and true or false;
    self.m_btnAdd:setEnable( enable);
    if status == CommunityAddFriendLayer.btnStatus.ADD then
        self.m_addBtnBg:setFile("hall/common/btns/btn_green_164x89_l25_r25_t25_b25.png");
        self.m_addText:setText("添加");
    elseif status == CommunityAddFriendLayer.btnStatus.APPLYED then
        self.m_addBtnBg:setFile("hall/common/btns/btn_gray_163x89_l25_r25_t25_b25.png");
        self.m_addText:setText("已申请");
    elseif status == CommunityAddFriendLayer.btnStatus.ADDED then
        self.m_addBtnBg:setFile("hall/common/btns/btn_gray_163x89_l25_r25_t25_b25.png");
        self.m_addText:setText("已添加");
    end
end

CommunityAddFriendLayer.onBtnAddClick = function(self)
    if not self.m_data.addFriend then
        UBReport.getInstance():report(UBConfig.kHallCommunitySearch);
        local  dst_cid = tonumber(self.m_data.cid or 0);
        CommunityDataInterface.getInstance():requestAddFriend(dst_cid, "");
        self:refreshBtnStatus(CommunityAddFriendLayer.btnStatus.APPLYED);
        self.m_data.addFriend = true;
    end
end

CommunityAddFriendLayer.onRequestAddFriendCallBack = function(self, isSuccess,msg)
    self:showNoticeView(msg);
end

CommunityAddFriendLayer.showNoticeView = function (self,msg)
    Toast.setDefaultDisplayTime(ImSdkConstants.toastDisplayTime);
    Toast.getInstance():showTextView(msg,width or 640, height or 60,kAlignCenter,"",30,200,175,115);
    Toast.setDefaultDisplayTime();
end

CommunityAddFriendLayer.onEmptyFunc = function (self)
end

CommunityAddFriendLayer.s_controlConfig =
{
	[CommunityAddFriendLayer.s_controls.btnCheck] 		= {"checkFriendView","btnCheck"},
    [CommunityAddFriendLayer.s_controls.checkEditText] 	= {"checkFriendView","editBg","checkEditText"},
    [CommunityAddFriendLayer.s_controls.headBg] 			= {"checkFriendView","itemView","headBg"},
    [CommunityAddFriendLayer.s_controls.name] 			= {"checkFriendView","itemView","name"},
    [CommunityAddFriendLayer.s_controls.btnAdd] 			= {"checkFriendView","itemView","btnAdd"},  
    [CommunityAddFriendLayer.s_controls.addText] 			= {"checkFriendView","itemView","btnAdd","addText"}, 
    [CommunityAddFriendLayer.s_controls.btnClose] 	    = {"checkFriendView","btnClose"},
    [CommunityAddFriendLayer.s_controls.itemView] 	    = {"checkFriendView","itemView"},
    [CommunityAddFriendLayer.s_controls.textView] 	    = {"checkFriendView","textView"},
    [CommunityAddFriendLayer.s_controls.addBtnBg] 			= {"checkFriendView","itemView","btnAdd","addBtnBg"},  
    [CommunityAddFriendLayer.s_controls.addText] 			= {"checkFriendView","itemView","btnAdd","addBtnBg","addText"},  
    
  } 

CommunityAddFriendLayer.s_controlFuncMap =
{
	[CommunityAddFriendLayer.s_controls.btnCheck] 	    = CommunityAddFriendLayer.requestCheckFriendInfo,
	[CommunityAddFriendLayer.s_controls.checkEditText] 	= CommunityAddFriendLayer.onCheckEditClick,
    [CommunityAddFriendLayer.s_controls.btnAdd] 	        = CommunityAddFriendLayer.onBtnAddClick,
    [CommunityAddFriendLayer.s_controls.btnClose] 	    = CommunityAddFriendLayer.onCloseCheckFriendLayer,
};

return CommunityAddFriendLayer;