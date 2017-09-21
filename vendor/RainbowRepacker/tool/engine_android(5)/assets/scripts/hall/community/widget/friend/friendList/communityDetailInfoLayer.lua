local communityDetailInfoLayer = require(ViewPath.."hall/community/friend/friendlist/communityDetailInfoLayer");
local community_pin_map = require("qnFiles/qnPlist/hall/community_pin")
local CommunityContactListItem = require("hall/community/widget/friend/knowList/communityContactListItem");
local CommunityDetailInfoLayer = class(IBaseDialog,false);
local userInfo_pin_map = require("qnFiles/qnPlist/hall/userInfo_pin");
CommunityDetailInfoLayer.Delegate = {
}

local h_index = 0;
local getIndex = function(self)
	h_index = h_index + 1;
	return h_index;
end

CommunityDetailInfoLayer.s_controls =
{
    btnClose = getIndex(),
	headBg = getIndex(),
    btnFriendCircle = getIndex(),
    btnSide = getIndex(),
    btnPresent = getIndex(),
    btnWold = getIndex(),
    sex = getIndex(),
    name = getIndex(),
    city = getIndex(),
    charmNum = getIndex(),
    coinNum = getIndex(),
    diamondNum = getIndex(),
    levelNum = getIndex(),
    levelProgessbg = getIndex(),
    levelProgessfg = getIndex(),
    btnDel = getIndex(),
    btnWoldText = getIndex(),
    btnDelText = getIndex(),
    btnApplyed = getIndex(),
    Id = getIndex(),
};

CommunityDetailInfoLayer.ctor = function(self,data,formLayout)
	super(self,communityDetailInfoLayer);
    self:setSize( self.m_root:getSize());
    self:setFillParent(true, true);

    self:setEventTouch(self, self.onEmptyFunc);
    self:setEventDrag(self, self.onEmptyFunc);
	self.m_ctrls = CommunityDetailInfoLayer.s_controls;

    self.m_formLayout = formLayout;
	self.m_headBg = self:findViewById(self.m_ctrls.headBg);
    self.m_sex = self:findViewById(self.m_ctrls.sex);
    self.m_name = self:findViewById(self.m_ctrls.name);
    self.m_city = self:findViewById(self.m_ctrls.city);
    self.m_charmNum = self:findViewById(self.m_ctrls.charmNum);
    self.m_coinNum = self:findViewById(self.m_ctrls.coinNum);
    self.m_diamondNum = self:findViewById(self.m_ctrls.diamondNum);
    self.m_levelNum = self:findViewById(self.m_ctrls.levelNum);
    self.m_levelProgessbg = self:findViewById(self.m_ctrls.levelProgessbg);
    self.m_levelProgessfg = self:findViewById(self.m_ctrls.levelProgessfg);
    self.m_btnWold = self:findViewById(self.m_ctrls.btnWold);
    self.m_btnDel = self:findViewById(self.m_ctrls.btnDel);
    self.m_btnWoldText = self:findViewById(self.m_ctrls.btnWoldText);
    self.m_btnDelText = self:findViewById(self.m_ctrls.btnDelText);
    self.m_btnApplyed = self:findViewById(self.m_ctrls.btnApplyed);
    self.m_Id = self:findViewById(self.m_ctrls.Id);
    self:__init(data)
    self:showCurrentBtn();
end

CommunityDetailInfoLayer.showCurrentBtn = function (self)
    self.m_btnApplyed:setVisible(false);
    self.m_btnWoldText:setVisible(true);
    if self.m_formLayout == "friendRank" or self.m_formLayout ==  "messageList" then
        self.m_btnDel:setVisible(true);
        self.m_btnWold:setPos(200,nil);
        self.m_btnDel:setPos(-200,nil);
        self.m_btnWoldText:setText("会话");
        self.m_btnDelText:setText("删除");
    elseif self.m_formLayout == "addMessage" then   
        self.m_btnDel:setVisible(true);
        self.m_btnWold:setPos(200,nil);
        self.m_btnDel:setPos(-200,nil);
        self.m_btnWoldText:setText("同意");
        self.m_btnDelText:setText("拒绝");
    elseif self.m_formLayout == "nearByList" or self.m_formLayout == "knowList" then   
        self:refreshBtnStatus();
    elseif self.m_formLayout == "friendChatList" or self.m_formLayout == "chatItemClickHeadBg"  then
        self.m_btnDel:setVisible(false);
        self.m_btnWold:setVisible(false);
    end
end
CommunityDetailInfoLayer.refreshBtnStatus = function(self) 
    self.m_btnWold:setPos(0,nil);
    self.m_btnDel:setVisible(false);
    if self.m_data.is_friend == 1 then
        self.m_btnWoldText:setText("会话");
    else
        if self.m_data.addFriend then
            self.m_btnApplyed:setVisible(true);
            self.m_btnWoldText:setText("已申请");
            self.m_btnWoldText:setVisible(false);
        else
            self.m_btnWoldText:setText("加好友");
        end
    end
end

CommunityDetailInfoLayer.dtor = function (self)
    Toast.getInstance():hidden();
    ImageCache.getInstance():cleanRef(self);
end

CommunityDetailInfoLayer.__init = function (self,data)
    self.m_data = table.verify(data);

    local name = string.subUtfStrByCn(tostring(data.nickname),1,6,"...")

    self.m_name:setText(name);
    self.m_Id:setText("ID:"..tostring(data.cid));

    local image = data.sex == "2" and community_pin_map["female.png"]  or community_pin_map["male.png"];
    self.m_sex:setFile(image);
    self.m_diamondNum:setText(data.diamond);
    self.m_coinNum:setText(data.gold);
    self.m_levelNum:setText("LV"..kUserLevelConfigInterface:countLevelByExp(data.experience or 0));
    self.m_city:setText(data.city or "辽宁大连");

    local expValue = kUserLevelConfigInterface:countLevelPercent(data.experience);
    local w,h =  self.m_levelProgessfg:getSize();
    local pe_sizeWidth = w*expValue;
    if pe_sizeWidth < 40 then
        pe_sizeWidth = 40
    end
    self.m_levelProgessfg:setSize(pe_sizeWidth,nil);
    self.m_charmNum:setText("暂无");
    self:onUpdateHeadImage("", kUserInfoData:getHeadBySex(data.sex,true));
    ImageCache.getInstance():request(data.avatar_url, self, self.onUpdateHeadImage);
end

CommunityDetailInfoLayer.onUpdateHeadImage = function(self,url,imagePath)
    if not url or not imagePath then
        return;
    end
    self.hasLoadHead = true;
    self:setHeadImage(imagePath);
end

CommunityDetailInfoLayer.setHeadImage = function(self,file)
	if self.m_headImage then
		self.m_headBg:removeChild(self.m_headImage);
	end
	delete(self.m_headImage);
    local headImgFile = string.isEmpty(file) and kUserInfoData:getHeadBySex(self.m_sex, true) or file;

	self.m_headImage = new(Mask, headImgFile, userInfo_pin_map["head_mask.png"]);
    self.m_headImage:setSize(290,290);
    self.m_headImage:setPos(-6,-3);
	self.m_headBg:addChild(self.m_headImage);
	self.m_headImage:setAlign(kAlignCenter);
end

CommunityDetailInfoLayer.onBtnCloseClick = function (self)
    self:hide();
end

CommunityDetailInfoLayer.onGotoFriendChatBtnClick = function (self)
    
    
    if self.m_formLayout == "addMessage" then--加好友消息 点击同意按钮
        self:hide();
        self:agreeOrRefuseAddFriend(ImSdkConstants.HandleFriendRequestType.AGREE);
    else
        UBReport.getInstance():report(UBConfig.kHallCommunityDetailGotoChat);
        if self.m_data.is_friend == 1 or self.m_formLayout == "messageList" then
            self:hide();
            UBReport.getInstance():report(UBConfig.kHallCommunityRankBtnWord);
            local CommunityScene = require("hall/community/communityScene");
            EventDispatcher.getInstance():dispatch(CommunityScene.s_event_changeToFriendChatLayout, self.m_data);
        else
            if not self.m_data.addFriend then
                local  dst_cid = tonumber(self.m_data.cid or 0);
                local msg = ""
                CommunityDataInterface.getInstance():requestAddFriend(dst_cid,msg);
                self.m_data.addFriend = true;
                self:refreshBtnStatus();
                EventDispatcher.getInstance():dispatch(CommunityContactListItem.s_event_changeBtnStatusToDetailLayout, self.m_data);
            end
        end
    end 
end

CommunityDetailInfoLayer.getIsShowLayout = function (self)
    return self:getVisible();
end

CommunityDetailInfoLayer.onDelBtnClick = function (self)
    UBReport.getInstance():report(UBConfig.kHallCommunityDetailDel);
    if table.isEmpty(self.m_data)  then
        return;
    end
    if self.m_formLayout == "friendRank" then
        MessageBox.show("温馨提示", "确定删除该好友？删除后将无法与TA聊天，相应聊天记录也将立即清除", "确定", "取消", true, self, self.onConfirmDeleteFriend);
    elseif self.m_formLayout == "messageList" then
        MessageBox.show("删除提示",  "确定删除这条消息吗？", "确定",  "取消", true, self, self.onConfirmDeleteMessage);
    elseif self.m_formLayout == "addMessage" then
       self:agreeOrRefuseAddFriend(ImSdkConstants.HandleFriendRequestType.REFUSE);
    end
    self:hide();
end

CommunityDetailInfoLayer.onConfirmDeleteMessage = function (self)
    if table.isEmpty(self.m_data) then
        return;
    end
    CommunityDataInterface.getInstance():clearAllChatMessageWithFriend(self.m_data.cid);
end

CommunityDetailInfoLayer.onConfirmDeleteFriend = function (self)
    if table.isEmpty(self.m_data) then
        return;
    end
    LoadingView.getInstance():showText("请稍候...");
    CommunityDataInterface.getInstance():requestDeleteFriend(self.m_data.cid);
end

CommunityDetailInfoLayer.agreeOrRefuseAddFriend = function(self, status)
    LoadingView.getInstance():showText("正在处理中...");
    CommunityDataInterface.getInstance():requestHandleAddFriendMessage(self.m_data.cid, status);
end

CommunityDetailInfoLayer.onEmptyFunc = function (self)
  
end


CommunityDetailInfoLayer.onFriendCircleBtnClick = function (self)
    self:showNoticeView("暂未开放，敬请期待");
end

CommunityDetailInfoLayer.onSideBtnClick = function (self)
    self:showNoticeView("暂未开放，敬请期待");
end

CommunityDetailInfoLayer.onPresentBtnClick = function (self)
    self:showNoticeView("暂未开放，敬请期待");
end

CommunityDetailInfoLayer.showNoticeView = function(self,msg,width ,height)
    Toast.setDefaultDisplayTime(ImSdkConstants.toastDisplayTime);
    Toast.getInstance():showTextView(msg,width or 640, height or 60,kAlignCenter,"",30,200,175,115);
    Toast.setDefaultDisplayTime();
end 

CommunityDetailInfoLayer.s_controlConfig =
{
	[CommunityDetailInfoLayer.s_controls.btnClose] 			= {"detailInfoView","btnClose"},
    [CommunityDetailInfoLayer.s_controls.headBg] 	        = {"detailInfoView","headBg"},
    [CommunityDetailInfoLayer.s_controls.btnFriendCircle] 	= {"detailInfoView","btnFriendCircle"},
    [CommunityDetailInfoLayer.s_controls.btnSide] 	        = {"detailInfoView","btnSide"},
    [CommunityDetailInfoLayer.s_controls.btnPresent] 	    = {"detailInfoView","btnPresent"},
    [CommunityDetailInfoLayer.s_controls.btnWold] 	        = {"detailInfoView","wordView","btnWold"},
    [CommunityDetailInfoLayer.s_controls.btnWoldText] 	        = {"detailInfoView","wordView","btnWold","btnWoldText"},
    [CommunityDetailInfoLayer.s_controls.sex] 	            = {"detailInfoView","sex"},
    [CommunityDetailInfoLayer.s_controls.name] 	            = {"detailInfoView","name"},
    [CommunityDetailInfoLayer.s_controls.city] 	            = {"detailInfoView","city"},
    [CommunityDetailInfoLayer.s_controls.charmNum] 	        = {"detailInfoView","charmNum"},
    [CommunityDetailInfoLayer.s_controls.coinNum] 	        = {"detailInfoView","coinNum"},
    [CommunityDetailInfoLayer.s_controls.diamondNum] 	    = {"detailInfoView","diamondNum"},
    [CommunityDetailInfoLayer.s_controls.levelNum] 	        = {"detailInfoView","levelNum"},
    [CommunityDetailInfoLayer.s_controls.levelProgessbg] 	= {"detailInfoView","levelProgessbg"},
    [CommunityDetailInfoLayer.s_controls.levelProgessfg] 	= {"detailInfoView","levelProgessfg"},
    [CommunityDetailInfoLayer.s_controls.btnDel] 	        = {"detailInfoView","wordView","btnDel"},
    [CommunityDetailInfoLayer.s_controls.btnDelText] 	    = {"detailInfoView","wordView","btnDel","btnDelText"},
    [CommunityDetailInfoLayer.s_controls.btnApplyed] 	    = {"detailInfoView","wordView","btnApplyed"},
    [CommunityDetailInfoLayer.s_controls.Id] 	        = {"detailInfoView","Id"},
    
};

CommunityDetailInfoLayer.s_controlFuncMap =
{
    [CommunityDetailInfoLayer.s_controls.btnClose] 	        = CommunityDetailInfoLayer.onBtnCloseClick,
    [CommunityDetailInfoLayer.s_controls.btnWold] 	        = CommunityDetailInfoLayer.onGotoFriendChatBtnClick,
    [CommunityDetailInfoLayer.s_controls.btnFriendCircle] 	= CommunityDetailInfoLayer.onFriendCircleBtnClick,
    [CommunityDetailInfoLayer.s_controls.btnSide] 	        = CommunityDetailInfoLayer.onSideBtnClick,
    [CommunityDetailInfoLayer.s_controls.btnPresent] 	    = CommunityDetailInfoLayer.onPresentBtnClick,
    [CommunityDetailInfoLayer.s_controls.btnDel] 	        = CommunityDetailInfoLayer.onDelBtnClick,
    
};

return CommunityDetailInfoLayer;
