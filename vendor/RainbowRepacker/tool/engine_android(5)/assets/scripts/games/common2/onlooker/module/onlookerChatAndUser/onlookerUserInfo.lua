require("common/commonGameLayer");
require("isolater/interface/regionConfigIsolater");
require("games/common2/module/logic/communityLogic");
require("isolater/interface/propIsolater");
require("games/common2/module/logic/dialogLogic");

local OnlookerUserInfo = class(CommonGameLayer,false)

OnlookerUserInfo.s_controls = {
	shiled = ToolKit.getIndex();
	bg = ToolKit.getIndex();
	head = ToolKit.getIndex();	
	icon_vip = ToolKit.getIndex();
	btn_report = ToolKit.getIndex();
	btn_report_name = ToolKit.getIndex();
	btn_friend = ToolKit.getIndex();
	btn_friend_name = ToolKit.getIndex();
	icon_sex = ToolKit.getIndex();
	nick = ToolKit.getIndex();
	city = ToolKit.getIndex();
	propsTxt = ToolKit.getIndex();
	propsView = ToolKit.getIndex();
	btn_close = ToolKit.getIndex();
};

OnlookerUserInfo.Delegate = {
    sendUserProps = "sendUserProps";
    sendReport = "sendReport";
};

OnlookerUserInfo.ctor = function(self)
	local config = require("view/kScreen_1280_800/games/common2/onlooker/onlooker_user_layout");
	super(self, config);
	self.m_ctrls = OnlookerUserInfo.s_controls;	
	self:setFillParent(true,true);

	self:_initView();
end

OnlookerUserInfo.dtor = function(self)
	self.m_data = nil;
	self:_stopReportWaitTimer();
	if self:getVisible() then
		DialogLogic.getInstance():popDialogStack();
	end
end

OnlookerUserInfo.show = function(self,data)
	self.m_data = table.verify(data);
	self:_refreshData(self.m_data);
	self:setVisible(true);
	DialogLogic.getInstance():pushDialogStack(self,function(self)
		self:setVisible(false);
	end);
end

-----------------------------------------------------------------------------------
OnlookerUserInfo._initView = function(self,data)	
	local shiled = self:findViewById(self.m_ctrls.shiled);
	shiled:setEventDrag(self,self.onEmpty);

	local bg = self:findViewById(self.m_ctrls.bg);
	bg:setEventDrag(self,self.onEmpty);

	local propsView = self:findViewById(self.m_ctrls.propsView);
    local w,h = propsView:getSize();
    self.m_popsGridView = UIFactory.createGridView(0, 0, w, h); 
	propsView:addChild(self.m_popsGridView);
end 

--data = {
--  sex = 0;
--  avatar = "";
-- 	nick = "123433";
-- 	isVip = true;	
-- 	isFriend = true;
-- 	city = "";
-- 	cid = 11;
-- 	mid = 11;
-- };
OnlookerUserInfo._refreshData = function(self,data)
	self:_setNick(data.nick);
	self:_setUserIdentity(data.isVip);
	self:_setUserSex(data.sex);
	self:_setUserRelationship(data.isFriend);

	local myUserId = UserBaseInfoIsolater.getInstance():getUserId();
	self.m_data.isSelf = data.mid == myUserId;
	self:_setIsUserSelf(self.m_data.isSelf);
	self:_setCity(data.city);
		
	self:_refreshPropsView();

	local defaultHeadFile = UserBaseInfoIsolater.getInstance():getHeadBySex(data.sex); 
	self:_setHeadImage(defaultHeadFile);
	if not string.isEmpty(data.avatar) then
		ImageCache.getInstance():request(data.avatar, self, self.onImageDownload);
	end 
end

OnlookerUserInfo._setHeadImage = function (self, image)
	local head = self:findViewById(self.m_ctrls.head);	
    if self.m_headImage then
		head:removeChild(self.m_headImage);
	end
	delete(self.m_headImage);
	local onlooker_chat_user_pin_map = require("qnFiles/qnPlist/games/onlooker_chat_user_pin");
	self.m_headImage = new(Mask, image, onlooker_chat_user_pin_map["user_head_mask.png"]);
	head:addChild(self.m_headImage);
	self.m_headImage:setFillParent(true,true);
	self.m_headImage:setAlign(kAlignCenter);
end

OnlookerUserInfo.onImageDownload = function(self,url,fileName)	
	if not string.isEmpty(fileName) then
        self:_setHeadImage(fileName);
    end
end

OnlookerUserInfo._setNick = function(self,name)
	local nick = self:findViewById(self.m_ctrls.nick);
	nick:setText(string.subUtfStrByCn(name or "", 1, 6, ".."));
end

OnlookerUserInfo._setCity = function(self,city)
	local cityStr = city or RegionConfigIsolater.getInstance():getRegionDefaultCity();
    if string.isEmpty(cityStr) then 
        cityStr = RegionConfigIsolater.getInstance():getRegionDefaultCity();
    end

    local cityTxt = self:findViewById(self.m_ctrls.city);
	cityTxt:setText(cityStr);
end

OnlookerUserInfo._setUserSex = function(self,sex)
	local icon_sex = self:findViewById(self.m_ctrls.icon_sex);
	local genderImageFile = UserBaseInfoIsolater.getInstance():getSexIconBySex(sex);
	icon_sex:setFile(genderImageFile);
end

OnlookerUserInfo._setIsUserSelf = function(self,isSelf)
	local str = isSelf and "物品箱:" or "对ta使用:";
	local propsTxt = self:findViewById(self.m_ctrls.propsTxt);
	propsTxt:setText(str);

	local btn_report = self:findViewById(self.m_ctrls.btn_report);
	local btn_friend = self:findViewById(self.m_ctrls.btn_friend);
	btn_friend:setVisible(not isSelf);
	btn_report:setVisible(not isSelf);
end

OnlookerUserInfo._setUserIdentity = function(self,isVip)
	local icon_vip = self:findViewById(self.m_ctrls.icon_vip);
	icon_vip:setLevel(1);
	icon_vip:setVisible(isVip);
end

OnlookerUserInfo._setUserRelationship = function(self,isFriend)
	local btn_friend = self:findViewById(self.m_ctrls.btn_friend);
	local btn_friend_name = self:findViewById(self.m_ctrls.btn_friend_name);
	btn_friend:setPickable(not isFriend);
	local name = isFriend and "已是好友" or "加好友";
	btn_friend_name:setText(name);
end

OnlookerUserInfo._getPropsInfoData = function(self)
	local propsData = {		
		PropIsolater.getInstance():getPropInfoByType(203),
		PropIsolater.getInstance():getPropInfoByType(202),
		PropIsolater.getInstance():getPropInfoByType(201),
		PropIsolater.getInstance():getPropInfoByType(200)
	};
	return propsData;
end

OnlookerUserInfo._refreshPropsView = function(self)
	local data = self:_getPropsInfoData();
	if not self.m_adapter then
		local OnlookerPropsItem = require("games/common2/onlooker/module/onlookerChatAndUser/onlookerPropsItem");
        self.m_adapter = new(CacheAdapter, OnlookerPropsItem, data);
        self.m_popsGridView:setAdapter(self.m_adapter);
        self.m_popsGridView:setOnItemClick(self, self._onPropsItemClick);
    else
        self.m_adapter:changeData(data);
    end
end

OnlookerUserInfo._onPropsItemClick = function(self,adapter, item, index, x, y)
	if self.m_data.isSelf then 
		return;
	end

	local data = item:getData();
	if table.isEmpty(data) then 
		return;
	end 
	if number.valueOf(data.allowTimes) <= 0 then 
		self:_showToast(kTextNoTypeProp);
	else 
		local myUserId = UserBaseInfoIsolater.getInstance():getUserId();
		local targets = string.format("-1,-1,%d,%d",myUserId,self.m_data.mid);
		PropIsolater.getInstance():requestUseProp(data.type, 1,targets);

		-- local info = {};
		-- info.propsType = data.type;
		-- info.tNick = self.m_data.nick;
		-- inf0.tMid = self.m_data.mid;
		-- self:execDelegate(OnlookerUserInfo.Delegate.sendUserProps,info);

		self:_close();
	end 
end

OnlookerUserInfo._showToast = function(self,msg)
	if not string.isEmpty(msg) then 
		Toast.getInstance():showText(msg,50,30,kAlignLeft,"",26,200,175,110);
	end 
end

OnlookerUserInfo._close = function(self)
	DialogLogic.getInstance():popDialog();
	self:setVisible(false); 
end
------------------------------------------------------------------------------------------
OnlookerUserInfo._startReportWaitTimer = function(self)
	self:_stopReportWaitTimer();
	self.m_reportWaitTime = 15;
	self:_showReportWaitTimer(self.m_reportWaitTime);

	self.m_reportWaitTimer = Clock.instance():schedule(function(dt)
            self:_onReportWaitTimerEvent();
        end,1);
end

OnlookerUserInfo._onReportWaitTimerEvent = function(self)
	self.m_reportWaitTime = number.valueOf(self.m_reportWaitTime,15);

	self.m_reportWaitTime = self.m_reportWaitTime - 1;
	self:_showReportWaitTimer(self.m_reportWaitTime);

	if self.m_reportWaitTime == 0 then 
		self:_stopReportWaitTimer();

		local btn_report = self:findViewById(self.m_ctrls.btn_report);
		btn_report:setGray(false);
		btn_report:setPickable(true);
	end
end

OnlookerUserInfo._showReportWaitTimer = function(self,waitTime)
	waitTime = number.valueOf(waitTime);
	local str = waitTime == 0 and "举  报" or string.format("举报(%s)",waitTime);
	local btn_report_name = self:findViewById(self.m_ctrls.btn_report_name);
	btn_report_name:setText(str);
end

OnlookerUserInfo._stopReportWaitTimer = function(self)
    if self.m_reportWaitTimer then 
        self.m_reportWaitTimer:cancel();
    end 
    self.m_reportWaitTimer = nil;
    self.m_reportWaitTime = 0;
end

OnlookerUserInfo._reportOnlooker = function(self)
	local myUserId = UserBaseInfoIsolater.getInstance():getUserId();
    local info = {mid = myUserId,otherMid = self.m_data.mid or 0};
    local OnlookerSocketCmd = require("games/common2/onlooker/socket/onlookerSocketCmd");
    SocketIsolater.getInstance():sendMsg(OnlookerSocketCmd.C_REQUEST_CHAT_COMPLAINT,info);

    -- local info = {};
    -- info.msgType = -1;
    -- info.msg = GameString.get("kReportNewSucces");
	-- self:execDelegate(OnlookerUserInfo.Delegate.sendReport,info);
	local msg = GameString.get("kReportNewSucces");
	Toast.getInstance():showText(msg,50,30,kAlignLeft,"",24,200,175,110);
end
-----------------------------------------------------------------------------------------
OnlookerUserInfo.onEmpty = function(self)
end

OnlookerUserInfo.onReportBtnClick = function(self)
	local btn_report = self:findViewById(self.m_ctrls.btn_report);
	btn_report:setGray(true);
	btn_report:setPickable(false);

 	self:_startReportWaitTimer();
	self:_reportOnlooker();
	self:_close();
end

OnlookerUserInfo.onFriendBtnClick = function(self)
	if not self.m_data.isFriend then
        CommunityLogic.getInstance():requestAddFriend(self.m_data.cid);

        self:_close();
    end
end

OnlookerUserInfo.onCloseBtnClick = function(self)
	self:_close();
end

OnlookerUserInfo.s_controlConfig = 
{	
	[OnlookerUserInfo.s_controls.shiled]			= {"shiled"};
	[OnlookerUserInfo.s_controls.bg]				= {"bg"};
	[OnlookerUserInfo.s_controls.head]				= {"bg","leftView","head_img"};
	[OnlookerUserInfo.s_controls.icon_vip]			= {"bg","leftView","head_img","icon_vip"};
	[OnlookerUserInfo.s_controls.btn_report]		= {"bg","leftView","btn_report"};
	[OnlookerUserInfo.s_controls.btn_report_name]	= {"bg","leftView","btn_report","name"};
	[OnlookerUserInfo.s_controls.btn_friend]		= {"bg","leftView","btn_friend"};
	[OnlookerUserInfo.s_controls.btn_friend_name]	= {"bg","leftView","btn_friend","name"};

	[OnlookerUserInfo.s_controls.icon_sex]			= {"bg","rightView","line1","ion_sex"};
	[OnlookerUserInfo.s_controls.nick]				= {"bg","rightView","line1","name_value"};
	[OnlookerUserInfo.s_controls.city]				= {"bg","rightView","line2","city"};
	[OnlookerUserInfo.s_controls.propsTxt]			= {"bg","rightView","propsTxt"};
	[OnlookerUserInfo.s_controls.propsView]			= {"bg","rightView","propsView"};
	[OnlookerUserInfo.s_controls.btn_close]			= {"bg","btn_close"};
};

OnlookerUserInfo.s_controlFuncMap = 
{
	[OnlookerUserInfo.s_controls.bg]				= OnlookerUserInfo.onEmpty;
	[OnlookerUserInfo.s_controls.shiled]			= OnlookerUserInfo.onEmpty;
	[OnlookerUserInfo.s_controls.btn_report]		= OnlookerUserInfo.onReportBtnClick;
	[OnlookerUserInfo.s_controls.btn_friend]		= OnlookerUserInfo.onFriendBtnClick;
	[OnlookerUserInfo.s_controls.btn_close]			= OnlookerUserInfo.onCloseBtnClick;
};

return OnlookerUserInfo;