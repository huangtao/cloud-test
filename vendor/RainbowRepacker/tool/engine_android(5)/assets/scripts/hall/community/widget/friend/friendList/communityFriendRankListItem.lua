local communityFriendRankListItem = require(ViewPath.."hall/community/friend/friendlist/communityFriendRankListItem");
local community_pin_map = require("qnFiles/qnPlist/hall/community_pin")
local CommunityNearByLayer = require("hall/community/widget/friend/nearbyList/communityNearByLayer");
local CommunityFriendRankListItem = class(CommonGameLayer,false);

CommunityFriendRankListItem.s_isItemOffset = false;

local h_index = 0;
local getIndex = function(self)
    h_index = h_index + 1;
    return h_index;
end



CommunityFriendRankListItem.s_controls = { 
    rankBg = getIndex();
    rankNum = getIndex();
    headBg = getIndex();
    name = getIndex(),
    sex = getIndex();
    money = getIndex();
    btnWord = getIndex();
    btnPresent = getIndex(), 
    btnSide = getIndex(),
    btnCircle = getIndex(),
    btnDelete = getIndex(),
    listBg = getIndex(),
    moveView = getIndex(),
    deleteBg = getIndex(),
    cup = getIndex(),
    is_online = getIndex();
};

CommunityFriendRankListItem.ctor = function(self,pos,data,listView,rankType)
    super(self, communityFriendRankListItem);
    self:setSize( self.m_root:getSize() );
    self:setFillParent(false, false);
    
    self.m_ctrl = CommunityFriendRankListItem.s_controls;
    self.m_name = self:findViewById(self.m_ctrl.name);
    self.m_headBg = self:findViewById(self.m_ctrl.headBg);
    self.m_rankNum = self:findViewById(self.m_ctrl.rankNum);
    self.m_rankBg = self:findViewById(self.m_ctrl.rankBg);
    self.m_sex = self:findViewById(self.m_ctrl.sex);
    self.m_money = self:findViewById(self.m_ctrl.money);
    self.m_btnDelete = self:findViewById(self.m_ctrl.btnDelete);
    self.m_btnWord = self:findViewById(self.m_ctrl.btnWord);
    self.m_btnPresent = self:findViewById(self.m_ctrl.btnPresent);
    self.m_btnCircle = self:findViewById(self.m_ctrl.btnCircle);
    self.m_btnSide = self:findViewById(self.m_ctrl.btnSide);
    self.m_listBg = self:findViewById(self.m_ctrl.listBg);
    self.m_moveView = self:findViewById(self.m_ctrl.moveView);
    self.m_deleteBg = self:findViewById(self.m_ctrl.deleteBg);
    self.m_cup = self:findViewById(self.m_ctrl.cup);
    self.m_onlineStateText = self:findViewById(self.m_ctrl.is_online);
    self.m_deleteBgWidth = self.m_deleteBg:getSize();
    self.m_listView = listView;
    self:updateListItem(pos,data,rankType);
    
    CommunityDataInterface.getInstance():setObserver(self);
   
    self.m_dx = 0;
    self.m_dy = 0;
    self.m_direction = 0;
end

CommunityFriendRankListItem.dtor = function(self)
    ImageCache.getInstance():cleanRef(self);
    CommunityDataInterface.getInstance():clearObserver(self);

    local x = self:getPos();
    if x < 0 then
        CommunityFriendRankListItem.s_isItemOffset = false;
    end
end

CommunityFriendRankListItem.getTextSize = function(self, label)
    local text = new(Text, label:getText(), nil, nil, nil, nil, 30);
    local w,h = text:getSize();
    delete(text);
    return w,h;
end


CommunityFriendRankListItem.updateListItem = function(self,pos,data,rankType)
    Log.v("data.avatar_url",data.avatar_url);
    self.m_data = data;
    self:setPos(0,nil);
    self.m_name:setText(data.nickname);
    local image = data.sex == "2" and community_pin_map["female.png"] or community_pin_map["male.png"] ;
    local x = self.m_name:getPos() + self:getTextSize(self.m_name) + 5 ;
    self.m_sex:setPos(x,nil);
    self.m_sex:setFile(image);

    rankType = rankType or "银币";
    if rankType == "银币" or rankType == "在线" then
       self.m_money:setText("银币："..data.gold);     
    elseif rankType == "钻石" then
       self.m_money:setText("钻石："..data.diamond);
    elseif rankType == "经验" then
        self.m_money:setText("经验："..data.experience);
    elseif rankType == "等级" then
        self.m_money:setText("等级："..data.level);
    elseif rankType == "大师分" then
        self.m_money:setText("大师分："..data.master_points);
    end
    
    self:rankingShow(pos);
    if data.is_online == 0 then 
        self.m_headBg:setColor(128,128,128);
        self.m_onlineStateText:setText("[离线]", nil, nil, 207, 207, 207);
    else 
        self.m_onlineStateText:setText("[在线]", nil, nil, 0, 255, 0);
        self.m_headBg:setColor(255,255,255);
    end 
    self:setHeadImage(kUserInfoData:getHallHeadBySex(data.sex));
    ImageCache.getInstance():request(data.avatar_url, self, self.onUpdateHeadImage);
end

CommunityFriendRankListItem.rankingShow = function (self,pos)
    self.m_pos = pos;
    self.m_cup:setVisible(true);
	self.m_rankBg:setVisible(false);
	if self.m_pos == 1 then
		self.m_cup:setFile(community_pin_map["cup1.png"] );
	elseif self.m_pos == 2 then
		self.m_cup:setFile(community_pin_map["cup2.png"] );
	elseif self.m_pos == 3 then
		self.m_cup:setFile(community_pin_map["cup3.png"] );
	else
        self.m_cup:setVisible(false);
	    self.m_rankBg:setVisible(true);	
		self.m_rankNum:setText(tostring(self.m_pos));
	end
end


CommunityFriendRankListItem.onUpdateHeadImage = function(self,url,imagePath)
    if not url or not imagePath then
        return;
    end
    self:setHeadImage(imagePath);  
end

CommunityFriendRankListItem.setHeadImage = function(self,image)
	if self.m_headImage then
		self.m_headBg:removeChild(self.m_headImage);
	end
	delete(self.m_headImage);

	self.m_headImage = new(Mask, image, community_pin_map["mask.png"]);
	self.m_headBg:addChild(self.m_headImage);
	self.m_headImage:setAlign(kAlignCenter);
end

CommunityFriendRankListItem.__showDeleteFriendLayer = function(self)
    UBReport.getInstance():report(UBConfig.kHallCommunityDelFriend);
    MessageBox.show("温馨提示", "确定删除该好友？删除后将无法与TA聊天，相应聊天记录也将立即清除", "确定", "取消", true, self, self.onConfirmDeleteFriend);
end

CommunityFriendRankListItem.onBtnDeleteClick = function (self)
    self:__showDeleteFriendLayer();
end

CommunityFriendRankListItem.onConfirmDeleteFriend = function(self)
    if table.isEmpty(self.m_data) then
        return;
    end
    LoadingView.getInstance():showText("请稍候...");
    CommunityDataInterface.getInstance():requestDeleteFriend(self.m_data.cid);
end

CommunityFriendRankListItem.onDeleteFriendCallBack = function (self,isSuccess,cid)
    LoadingView.getInstance():hidden();
    if cid == self.m_data.cid then
        EventDispatcher.getInstance():dispatch(CommunityNearByLayer.s_onDelFriendFormRankEvent,cid);
    end
end

CommunityFriendRankListItem.onBtnWordClick = function (self)
    UBReport.getInstance():report(UBConfig.kHallCommunityRankBtnWord);
    local CommunityScene = require("hall/community/communityScene");
    EventDispatcher.getInstance():dispatch(CommunityScene.s_event_changeToFriendChatLayout, self.m_data);
end

CommunityFriendRankListItem.onBtnPresentClick = function (self)
    self:showNoticeView("暂未开放，敬请期待");
end

CommunityFriendRankListItem.onBtnSideClick = function (self)
    self:showNoticeView("暂未开放，敬请期待");
end

CommunityFriendRankListItem.onBtnCircleClick = function (self)
    self:showNoticeView("暂未开放，敬请期待");
end

CommunityFriendRankListItem.showNoticeView = function(self,msg,width ,height)
    Toast.setDefaultDisplayTime(ImSdkConstants.toastDisplayTime);
    Toast.getInstance():showTextView(msg,width or 640, height or 60,kAlignCenter,"",30,200,175,115);
    Toast.setDefaultDisplayTime();
end 



 --滑动处理事件
CommunityFriendRankListItem.onMoveViewClick = function(self, finger_action, x, y, drawing_id_first, drawing_id_current)
   
	if finger_action == kFingerDown then
        self.m_data.m_isClick = 0;
        self.m_direction = 0;
        self.m_dx = 0;
        self.m_dy = 0;
		self.m_touchx = x;
        self.m_touchy = y;
        self.m_listView:setFingerActionEnabled(false,false);
        self.m_timer = os.time();
	elseif finger_action == kFingerMove then
        self.m_data.m_isClick = 1;
    	self.m_dx = x - self.m_touchx;
        self.m_dy = y - self.m_touchy;
        if self.m_direction == 0 then
            if math.abs(self.m_dx) > 0 and math.abs(self.m_dx) > math.abs(self.m_dy)  then --水平动
                self.m_direction = 1;
            elseif  math.abs(self.m_dy) > 0 and math.abs(self.m_dy) > math.abs(self.m_dx) then --上下动
                self.m_listView:setFingerActionEnabled(true,true);        
                self.m_direction = 2;
            end
        end
	elseif finger_action == kFingerUp or finger_action == kFingerCancel then
        self.m_direction = 0;
        self.m_data.m_isClick = 2;
        self.m_listView:setFingerActionEnabled(true,false);     
	end

    if self.m_direction <= 1 then
        if finger_action == kFingerUp and os.time()-self.m_timer < 2 then
            if math.abs(self.m_dx) < 20 and math.abs(self.m_dy) < 20 then
                if not CommunityFriendRankListItem.s_isItemOffset then
                   self:onHeadBgClick();
                end
            end
        end
        for index=1,self.m_listView:getItemCount() do
            local item = self.m_listView:getItem(index);
            if item.m_data.cid == self.m_data.cid then
                if item.m_data.m_isClick == 1  then
                    item:dragListItem();
                elseif item.m_data.m_isClick ==2 then
                    item:recurrenceAxiom();
                end
            else
                if finger_action == kFingerDown then
                    item:recurrenceAxiom(true);
                end
            end
        end
    end
end



CommunityFriendRankListItem.dragListItem = function (self)
    local tmpx = 0;
    local dx  = 0;
    tmpx = self:getPos();
    local isMove  = CommunityFriendRankListItem.s_isItemOffset;
    if self.m_dx <= 0  then
        if tmpx >  - self.m_deleteBgWidth  then
            if self.m_dx >  - self.m_deleteBgWidth then
		        self:setPos(self.m_dx,nil);
            else
                self:setPos(-self.m_deleteBgWidth,nil);    
            end 
        end
    else
        if tmpx < 0  then
            if self.m_dx <  self.m_deleteBgWidth then
               if isMove then
                    dx = self.m_dx - self.m_deleteBgWidth;
               else
                    dx = self.m_dx;
               end
               self:setPos(dx,nil); 
            else
                self:setPos(0,nil);    
            end 
        end
    end 
end

CommunityFriendRankListItem.recurrenceAxiom  = function (self, isDirectBackToZero) --回归到原点
    local rankListAnim; 
    local tmpx = 0;
    local endX = 0;
    local maxDis = 90;
    tmpx = self:getPos();
    if tmpx == 0 then
        return;
    end

    if isDirectBackToZero then
        if not self:checkAddProp(0) then
            self:removeProp(0);
        end
        self:setPos(0);
        self.m_dx = 0;
        return;
    end

    if self.m_dx <= -maxDis then --回位
        endX = -self.m_deleteBgWidth;
        rankListAnim = self:addPropTranslate(1, kAnimNormal, 100, 0, 0, -self.m_deleteBgWidth-tmpx);
    else
        endX = 0;
        if CommunityFriendRankListItem.s_isItemOffset then
            tmpx = -self.m_deleteBgWidth;
        end
        rankListAnim = self:addPropTranslate(1, kAnimNormal, 100, 0, 0,-tmpx);
    end    
    if rankListAnim then
        rankListAnim:setDebugName("CommunityFriendRankListItem|rankListAnim");
        rankListAnim:setEvent(self, function ()
            self:removeProp(1);
            if endX >= 0 then
                CommunityFriendRankListItem.s_isItemOffset = false;
            else
                CommunityFriendRankListItem.s_isItemOffset = true;
            end
            self:setPos(endX,nil)
            self.m_dx = 0; 
        end);
    end
end

CommunityFriendRankListItem.onHeadBgClick = function (self)
    UBReport.getInstance():report(UBConfig.kHallCommunityRankInfo);
    UBReport.getInstance():report(UBConfig.kHallCommunityDetailInfo);
    IBaseDialog.remove("CommunityDetailInfoLayer");
    IBaseDialog.pushDialog(new(require("hall/community/widget/friend/friendList/communityDetailInfoLayer"),self.m_data,"friendRank"));
end


CommunityFriendRankListItem.s_controlConfig =
{   
    [CommunityFriendRankListItem.s_controls.rankBg] = {"listView","rankView","rankBg"};
    [CommunityFriendRankListItem.s_controls.rankNum] = {"listView","rankView","rankBg","rankNum"};
    [CommunityFriendRankListItem.s_controls.headBg] = {"listView", "headView", "headBg"};
    [CommunityFriendRankListItem.s_controls.name] = {"listView","name"};
    [CommunityFriendRankListItem.s_controls.sex] = {"listView","sex"};
    [CommunityFriendRankListItem.s_controls.money] = {"listView", "money"};
    [CommunityFriendRankListItem.s_controls.btnWord] = {"listView","btnWord"}; 
    [CommunityFriendRankListItem.s_controls.btnPresent] = {"listView","listBg","btnPresent"}; 
    [CommunityFriendRankListItem.s_controls.btnSide] = {"listView","listBg","btnSide"}; 
    [CommunityFriendRankListItem.s_controls.btnCircle] = {"listView","listBg","btnCircle"}; 
    [CommunityFriendRankListItem.s_controls.btnDelete] = {"listView","btnDelete"}; 
    [CommunityFriendRankListItem.s_controls.listBg] = {"listView","listBg"}; 
    [CommunityFriendRankListItem.s_controls.moveView] = {"listView","moveView"}; 
    [CommunityFriendRankListItem.s_controls.deleteBg] = {"listView","btnDelete","deleteBg"}; 
    [CommunityFriendRankListItem.s_controls.cup] = {"listView","rankView","cup"};
    [CommunityFriendRankListItem.s_controls.is_online] = {"listView","is_online"};
    
    
};

CommunityFriendRankListItem.s_controlFuncMap =
{
    
    [CommunityFriendRankListItem.s_controls.moveView] 	            = CommunityFriendRankListItem.onMoveViewClick,
	[CommunityFriendRankListItem.s_controls.btnWord] 	            = CommunityFriendRankListItem.onBtnWordClick,
	[CommunityFriendRankListItem.s_controls.btnPresent] 	        = CommunityFriendRankListItem.onBtnPresentClick,
    [CommunityFriendRankListItem.s_controls.btnSide] 	            = CommunityFriendRankListItem.onBtnSideClick,
    [CommunityFriendRankListItem.s_controls.btnCircle] 	            = CommunityFriendRankListItem.onBtnCircleClick,
    [CommunityFriendRankListItem.s_controls.btnDelete] 	            = CommunityFriendRankListItem.onBtnDeleteClick,
};

return CommunityFriendRankListItem;