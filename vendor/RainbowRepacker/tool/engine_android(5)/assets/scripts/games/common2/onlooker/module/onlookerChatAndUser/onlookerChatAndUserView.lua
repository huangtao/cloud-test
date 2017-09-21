require("games/common2/onlooker/data/onlookerPlayerManager");
local ViewBase = require("games/common2/module/viewBase");
require("games/common2/onlooker/data/onlookerRecordData");

local OnlookerChatAndUserView = class(ViewBase,false);

OnlookerChatAndUserView.s_controls = {
	shield = ToolKit.getIndex();	
	infoView = ToolKit.getIndex();
	chatSelTabView = ToolKit.getIndex();
	userSelTabView = ToolKit.getIndex();
	userTabBtn = ToolKit.getIndex();
	chatTabBtn = ToolKit.getIndex();
	userNum1 = ToolKit.getIndex();
	userNum2 = ToolKit.getIndex();
	chatView = ToolKit.getIndex();
	chatDetail = ToolKit.getIndex();	
	infoView = ToolKit.getIndex();
	newMsgView = ToolKit.getIndex();
	newMsgTips = ToolKit.getIndex();
	hideNickSwitch = ToolKit.getIndex();
	barrageSwitch = ToolKit.getIndex();
	chatEdit = ToolKit.getIndex();
	chatSendBtn = ToolKit.getIndex();
	chatSendBtnName = ToolKit.getIndex();
	userView = ToolKit.getIndex();
	userDetail = ToolKit.getIndex();
};

OnlookerChatAndUserView.ctor = function(self, seat, layoutConfig)
    super(self,layoutConfig);
	self.m_ctrls = OnlookerChatAndUserView.s_controls;
    self:setFillParent(true,true);

    self.m_seat = seat;
    self.m_onlookerListData = {};
    self.m_newChatCount = 0;

    self:_initView();
end 

OnlookerChatAndUserView.dtor = function(self)
	self:_stopSendChatWaitTimer();
	self:_stopRefreshOnlookersTimer();
	local chatEdit = self:findViewById(self.m_ctrls.chatEdit);
	if chatEdit then
        chatEdit:hideEditTextView();
    end
	if self:getVisible() then
		DialogLogic.getInstance():popDialogStack();
	end
end

-----------------------------------------------------------------------------
OnlookerChatAndUserView._initView = function(self)
	self:onChatTabBtnClick();

	local isHideNick = OnlookerRecordData.getInstance():isHideNick();
	local hideNickSwitch = self:findViewById(self.m_ctrls.hideNickSwitch);
	hideNickSwitch:setChecked(1,isHideNick);
	local isOpenBarrage = OnlookerRecordData.getInstance():isOpenBarrage();
	local barrageSwitch = self:findViewById(self.m_ctrls.barrageSwitch);
	barrageSwitch:setChecked(1,isOpenBarrage);

	local chatEdit = self:findViewById(self.m_ctrls.chatEdit);
	chatEdit:setReturnTypeEx(EditText.s_EX_RETURNTYPE_SEND);
	chatEdit:setFilterSensitiveWordFlag(true);
	chatEdit:setText("");
    chatEdit:setHintText("最多输入20个字", 157, 121, 71);
    chatEdit:setMaxLength(20);

    self.m_sendChatWaitTime = 0;

    local newMsgView = self:findViewById(self.m_ctrls.newMsgView);
    newMsgView:setVisible(false);

    local chatDetail = self:findViewById(self.m_ctrls.chatDetail);
    chatDetail:setScrollBarWidth(5);
    chatDetail:setOnMarginRebounding(self,self._onChatDetailRebound);

    local userDetail = self:findViewById(self.m_ctrls.userDetail);
    local w,h = userDetail:getSize();
    self.m_userGridView = UIFactory.createGridView(0, 0, w, h); 
	userDetail:addChild(self.m_userGridView);

	self.m_isOnlookersChange = true;
	self:_refreshOnlookersInfo();
	self:setVisible(false);
end

OnlookerChatAndUserView._setShowViews = function(self,isUserView)
	local chatSelTabView = self:findViewById(self.m_ctrls.chatSelTabView);
	local userSelTabView = self:findViewById(self.m_ctrls.userSelTabView);
	local chatView = self:findViewById(self.m_ctrls.chatView);
	local userView = self:findViewById(self.m_ctrls.userView);

	chatSelTabView:setVisible(not isUserView);
	userSelTabView:setVisible(isUserView);
	chatView:setVisible(not isUserView);
	userView:setVisible(isUserView);
end
----------------------------------------------------------------------------------------
OnlookerChatAndUserView._refreshChatMsg = function(self,data)
	local OnlookerChatItem = require("games/common2/onlooker/module/onlookerChatAndUser/onlookerChatItem");
	local chatItem = new(OnlookerChatItem,data);	
	chatItem:setEventTouch({self,data},self._onChatItemTouch);

	local chatDetail = self:findViewById(self.m_ctrls.chatDetail);
	chatDetail:addChild(chatItem);

    local scroller = chatDetail:getScroller();
    if not scroller then
        return;
    end
    chatDetail:stop();

    local isNeedToBottom = true;
    if chatDetail.m_mainNode then 
		local _,itemY = chatItem:getPos();
		local frameLength = chatDetail:getFrameLength();
		local _,y = chatDetail.m_mainNode:getPos();

		if (itemY+y) > frameLength then 
			isNeedToBottom = false;
		end 
	end

    if isNeedToBottom then 
    	self.m_newChatCount = 0;
    	chatDetail:gotoBottom();
    else 
    	self.m_newChatCount = number.valueOf(self.m_newChatCount);
    	self.m_newChatCount = self.m_newChatCount + 1;
    end 
    self:_refreshNewMsgInfo();
end

OnlookerChatAndUserView._onChatItemTouch = function(arg,finger_action,x, y, drawing_id_first, drawing_id_current)
	if finger_action == kFingerUp and drawing_id_first == drawing_id_current then
		local self = arg[1];
		
		local chatDetail = self:findViewById(self.m_ctrls.chatDetail);
		local scroller = chatDetail:getScroller();
	    if scroller and scroller.m_status ~= kScrollerStatusStop then
	        return;
	    end
		
		local data = table.verify(arg[2]);
		if data.msgType == -1 then 
			return;
		end

		local info;
		for _,v in pairs(self.m_onlookerListData) do 
			if v.mid == data.userId then
				info = Copy(v);
				break;
			end 
		end 
		local myUid = UserBaseInfoIsolater.getInstance():getUserId();
		if info and info.mid ~= myUid then 
			self:_createOnlookerUserInfo();
			self.m_onlookerUserInfo:show(info);
		end 
	end 
end

OnlookerChatAndUserView._onChatDetailRebound = function(self,scroll_status,align)
	if kScrollerStatusStop == scroll_status and align == kAlignBottom then
		self.m_newChatCount = 0;
		self:_refreshNewMsgInfo();
	end
end

OnlookerChatAndUserView._refreshNewMsgInfo = function(self)   	  
    local newMsgTips = self:findViewById(self.m_ctrls.newMsgTips);
    local count = number.valueOf(self.m_newChatCount);
	local countStr = count > 99 and "99+" or count;
	newMsgTips:setText(string.format("%s条未读消息",countStr));

	local newMsgView = self:findViewById(self.m_ctrls.newMsgView);
	newMsgView:setVisible(count > 0);
end

OnlookerChatAndUserView._sendChatMsg = function(self,msg)
	if not string.isEmpty(msg) then 
		self:_sendBarrage(0,msg);
	end 
end

OnlookerChatAndUserView.sendUserProps = function(self,info)
	info = table.verify(info);
	if info.propsType then 
		self:_sendBarrage(1,"",info);
	end 
end

OnlookerChatAndUserView.sendReport = function(self,info)
	if table.isEmpty(info) then 
		return;
	end 

	self:_refreshChatMsg(info); 
end

OnlookerChatAndUserView._sendBarrage = function(self,msgType,msg,arg)
	if (not msgType) then
		return;
	end 
	arg = table.verify(arg);

	local hideNickSwitch = self:findViewById(self.m_ctrls.hideNickSwitch);
	local isHideNick = hideNickSwitch:isChecked(1);
	local nick = UserBaseInfoIsolater.getInstance():getNickname();

	local data = {};
	data.msgType = msgType;
	data.msg = msg;
	data.userId = UserBaseInfoIsolater.getInstance():getUserId();
	data.nick = isHideNick and "" or nick;
	data.isVip = UserBaseInfoIsolater.getInstance():getIsVip();
	data.propsType = arg.propsType or 0;
	data.sNick = nick;
	data.tUserId = arg.tMid or 0;
	data.tNick = arg.tNick or "";

	local OnlookerSocketCmd = require("games/common2/onlooker/socket/onlookerSocketCmd");
	local param = {};
	param.msgType = msgType;
	param.msg = json.encode(data);
	SocketIsolater.getInstance():sendMsg(OnlookerSocketCmd.C_REQUEST_SEND_BARRAGE,param);

	local action = msgType == 1 and UBConfig.kOnlookerSendProps or UBConfig.kOnlookerSendMsg; 
	UBReport.getInstance():report(action);
end

OnlookerChatAndUserView._startSendChatWaitTimer = function(self)
	self:_stopSendChatWaitTimer();
	self.m_sendChatWaitTime = 3;
	self:_showSendChatWaitTimer(self.m_sendChatWaitTime);

	self.m_sendChatWaitTimer = Clock.instance():schedule(function(dt)
            self:_onSendChatWaitTimerEvent();
        end,1);
end

OnlookerChatAndUserView._onSendChatWaitTimerEvent = function(self)
	self.m_sendChatWaitTime = number.valueOf(self.m_sendChatWaitTime,3);

	self.m_sendChatWaitTime = self.m_sendChatWaitTime - 1;
	self:_showSendChatWaitTimer(self.m_sendChatWaitTime);

	if self.m_sendChatWaitTime == 0 then 
		self:_stopSendChatWaitTimer();
	end
end 

OnlookerChatAndUserView._stopSendChatWaitTimer = function(self)
    if self.m_sendChatWaitTimer then 
        self.m_sendChatWaitTimer:cancel();
    end 
    self.m_sendChatWaitTimer = nil;
    self.m_sendChatWaitTime = 0;
end

OnlookerChatAndUserView._showSendChatWaitTimer = function(self,waitTime)
	waitTime = number.valueOf(waitTime);
	local str = waitTime == 0 and "发  送" or string.format("发送(%s)",waitTime);
	local chatSendBtnName = self:findViewById(self.m_ctrls.chatSendBtnName);
	chatSendBtnName:setText(str);
end
----------------------------------------------------------------------------------

OnlookerChatAndUserView._refreshOnlookersInfo = function(self)
	if not self.m_isOnlookersChange then 
		return;
	end 
	self.m_isOnlookersChange = nil;

	self.m_onlookerListData = self:_getSortLookersData();
	local count = #self.m_onlookerListData;
	self:_refreshOnlookersNumInfo(count);
	if count > 0 then 
		self:_refreshOnlookersListInfo();
	end 
	self.m_userGridView:setVisible(count > 0);
end

OnlookerChatAndUserView._refreshOnlookersNumInfo = function(self,count)
	count = number.valueOf(count);
	count = count > 99 and "99+" or count;
	local userNum1 = self:findViewById(self.m_ctrls.userNum1);
	local userNum2 = self:findViewById(self.m_ctrls.userNum2);
	userNum1:setText(count);
	userNum2:setText(count);
end

OnlookerChatAndUserView._refreshOnlookersListInfo = function(self)
	local data = self.m_onlookerListData;
	if not self.m_adapter then
		local OnlookerUserItem = require("games/common2/onlooker/module/onlookerChatAndUser/onlookerUserItem");
        self.m_adapter = new(CacheAdapter, OnlookerUserItem, data);
        self.m_userGridView:setAdapter(self.m_adapter);
        self.m_userGridView:setOnItemClick(self, self._onUserItemClick);
    else
        self.m_adapter:changeData(data);
    end
end

OnlookerChatAndUserView._onUserItemClick = function(self,adapter, item, index, x, y)
	local data = item:getData();
	Log.d("OnlookerChatAndUserView._onUserItemClick","index = ",index,"data = ",data);
	local myUid = UserBaseInfoIsolater.getInstance():getUserId();
	if data.mid == myUid then 
		return;
	end 

	self:_createOnlookerUserInfo();
	self.m_onlookerUserInfo:show(data);
end

OnlookerChatAndUserView._createOnlookerUserInfo = function(self)
	if not self.m_onlookerUserInfo then
		local OnlookerUserInfo = require("games/common2/onlooker/module/onlookerChatAndUser/onlookerUserInfo");
		self.m_onlookerUserInfo = new(OnlookerUserInfo);
		self.m_onlookerUserInfo:setDelegate(self);
		self:addChild(self.m_onlookerUserInfo);
	end 
end

OnlookerChatAndUserView._formatOnlookersUserInfo = function(self,user)
	if user then 
		local tmp = {};
		tmp.nick = user:getNick();
		tmp.sex = user:getSex();
		tmp.avatar = user:getAvatar();
		tmp.city = user:getCity();
		tmp.mid = user:getMid();
		tmp.cid = user:getCid();
		tmp.isFriend = CommunityIsolater.getInstance():checkIsFriend(tmp.cid);
		local identity = user:getIdentity();
		tmp.isVip = UserIdentityIsolater.getInstance():checkIsVip(identity);

		return tmp;
	end  
end

OnlookerChatAndUserView._getSortLookersData = function(self)
	local all = OnlookerPlayerManager.getInstance():getAllOnlooker();
	all = table.verify(all);
	local data = {};

	local vip = {};
	local friend = {};
	local vipAndFriend = {};
	local normal = {};
	local mySelf = {};

	for k,v in pairs(all) do 			
		local tmp = self:_formatOnlookersUserInfo(v);
		if tmp then 
			local myUid = UserBaseInfoIsolater.getInstance():getUserId();
			if tmp.mid == myUid then 
				tmp.nick = "我";
				table.insert(mySelf,tmp);
			else 
				if tmp.isFriend and tmp.isVip then 
					table.insert(vipAndFriend,tmp);
				elseif (tmp.isFriend or tmp.isVip) then 
					if tmp.isFriend then 
						table.insert(friend,tmp);
					else
						table.insert(vip,tmp); 
					end 
				else 
					table.insert(normal,tmp);
				end 
			end 
		end 
	end 
	data = MegerTables(mySelf,vipAndFriend,friend,vip,normal);

	return data;
end

OnlookerChatAndUserView._show = function(self)
	DialogLogic.getInstance():pushDialogStack(self,function(self)
		self:setVisible(false);
	end);
	self:setVisible(true);
end 

OnlookerChatAndUserView._close = function(self)
	DialogLogic.getInstance():popDialog();
	local chatEdit = self:findViewById(self.m_ctrls.chatEdit);
	if chatEdit then
        chatEdit:hideEditTextView();
    end
	self:setVisible(false);
end

OnlookerChatAndUserView._stopRefreshOnlookersTimer = function(self)
	if self.m_refreshOnlookersTimer then 
        self.m_refreshOnlookersTimer:cancel();
    end 
    self.m_refreshOnlookersTimer = nil;
end

OnlookerChatAndUserView._showToast = function(self,msg)
	if not string.isEmpty(msg) then 
		Toast.getInstance():showText(msg,50,30,kAlignLeft,"",24,200,175,110);
	end 
end
-----------------------------------------------------------------------------
OnlookerChatAndUserView.onShieldTouch = function(self,finger_action)
	if finger_action == kFingerUp then
		self:_close();
	end
end

OnlookerChatAndUserView.onEmpty = function(self)
end

OnlookerChatAndUserView.onUserTabBtnClick = function(self)
	self:_refreshOnlookersInfo();

	self:_setShowViews(true);
end

OnlookerChatAndUserView.onChatTabBtnClick = function(self)
	self:_setShowViews(false);
end

OnlookerChatAndUserView.onChatEditChange = function(self,p_string,flag)
	local chatEdit = self:findViewById(self.m_ctrls.chatEdit);
    local txt = string.trim(chatEdit:getText());
    if string.len(txt) > 0 then
        chatEdit:setText(string.subUtfStrByCn(txt, 1, 20));
        if flag == EditText.s_EX_CLOSE_DONE then
            self:onChatSendBtnClick();
        end
    end
end

OnlookerChatAndUserView.onChatSendBtnClick = function(self)
	local chatEdit = self:findViewById(self.m_ctrls.chatEdit);
	local msg = chatEdit:getText();
    if string.trim(msg) == "" then
        return;
    end

	if self.m_sendChatWaitTime and self.m_sendChatWaitTime > 0 then 
		self:_showToast("老板，有话慢慢说，别着急");
		return;
	end 
	
    chatEdit:setText("");
    chatEdit:setHintText("最多输入20个字",157, 121, 71);

    self:_sendChatMsg(msg);

    self:_startSendChatWaitTimer();
end

OnlookerChatAndUserView.onNewMsgViewTouch = function(self,finger_action)
	if finger_action == kFingerUp then
		self.m_newChatCount = 0;
		self:_refreshNewMsgInfo();

		local chatDetail = self:findViewById(self.m_ctrls.chatDetail);
		local scroller = chatDetail:getScroller();
	    if not scroller then
	        return;
	    end
	    chatDetail:stop();
		chatDetail:gotoBottom();
	end
end

OnlookerChatAndUserView.onHideNickSwitchChange = function(self)
	local hideNickSwitch = self:findViewById(self.m_ctrls.hideNickSwitch);
	local isHideNick = hideNickSwitch:isChecked(1);

	OnlookerRecordData.getInstance():changeHideNickSwitch(isHideNick);
	
	local msg = isHideNick and "匿名已开启" or "匿名已关闭";
	Toast.getInstance():showText(msg,50,30,kAlignLeft,"",24,200,175,110);
end

OnlookerChatAndUserView.onBarrageSwitchChange = function(self)
	local barrageSwitch = self:findViewById(self.m_ctrls.barrageSwitch);
	local isOpen = barrageSwitch:isChecked(1);

	OnlookerRecordData.getInstance():changeBarrageSwitch(isOpen);

	local msg = isOpen and "弹幕已开启" or "弹幕已关闭";
	Toast.getInstance():showText(msg,50,30,kAlignLeft,"",24,200,175,110);

	local action = GameMechineConfig.ACTION_NS_BARRAGE_SWITCH_CHANGE;
	MechineManage.getInstance():receiveAction(action);
end

-----------------------------------------------------------------------------
OnlookerChatAndUserView.onReceiveChatMsg = function(self,seat,uid,info,isFast)
	if table.isEmpty(info) then 
		return;
	end 

	self:_refreshChatMsg(info); 
end

OnlookerChatAndUserView.onShowChatView = function(self,seat,uid,info,isFast)
	self:_refreshOnlookersInfo();
	self:onChatTabBtnClick();
	self:_show();
end 

OnlookerChatAndUserView.refreshOnlookersInfo = function(self,seat,uid,info,isFast) 
	self.m_isOnlookersChange = true;
	if not self:getVisible() then 	
		return;
	end

	self:_refreshOnlookersInfo();
end

OnlookerChatAndUserView.onAddFriendCallback = function(self,seat,uid,info,isFast)
	Log.d("OnlookerChatAndUserView","onAddFriendCallback","info = ",info);
	if table.isEmpty(info) then 
		return;
	end

	if info.isAgree then 
		self.m_isOnlookersChange = true;

		self:_stopRefreshOnlookersTimer();
		self.m_refreshOnlookersTimer = Clock.instance():schedule_once(function()
			self:refreshOnlookersInfo();
		end, 1);		
	end 
end

OnlookerChatAndUserView.onReceiveShutup = function(self,seat,uid,info,isFast)
	if table.isEmpty(info) then 
		return;
	end 

	local data = {};
	data.msgType = -1;
	data.msg = info.msgInfo;
	self:_refreshChatMsg(data); 
end 

OnlookerChatAndUserView.onUseProps = function(self,seat,uid,info,isFast)
	Log.d("OnlookerChatAndUserView.onUseProps","info = ",info);
	if table.isEmpty(info) then 
		return;
	end 

	local myUid = UserBaseInfoIsolater.getInstance():getUserId();
	if info.mid == myUid then 
		local tb = string.split(info.propTarget or "", ",");
		local smid = tonumber(tb[3]);
		local tmid = tonumber(tb[4]);
		
		if smid == myUid and tmid and info.propType then 
			local nick;
			for _,v in pairs(self.m_onlookerListData) do 
				if v.mid == tmid then
					nick = v.nick;
					break;
				end 
			end

			if nick then 
				local param = {};
				param.propsType = info.propType;
				param.tNick = nick;
				param.tMid = tmid;

				self:sendUserProps(param);
			end 
		end 		
	end 
end 

-----------------------------------------------------------------------------
OnlookerChatAndUserView.s_controlConfig = 
{	
	[OnlookerChatAndUserView.s_controls.shield]			= {"shield"};
	[OnlookerChatAndUserView.s_controls.infoView]		= {"infoView"};
	[OnlookerChatAndUserView.s_controls.chatSelTabView]	= {"infoView","tabView","chatSelTabView"};
	[OnlookerChatAndUserView.s_controls.userSelTabView]	= {"infoView","tabView","userSelTabView"};
	[OnlookerChatAndUserView.s_controls.userTabBtn]		= {"infoView","tabView","chatSelTabView","userTabBtn"};
	[OnlookerChatAndUserView.s_controls.chatTabBtn]		= {"infoView","tabView","userSelTabView","chatTabBtn"};
	[OnlookerChatAndUserView.s_controls.userNum1]		= {"infoView","tabView","chatSelTabView","userTabBtn","titleInfoView","numInfo","num"};
	[OnlookerChatAndUserView.s_controls.userNum2]		= {"infoView","tabView","userSelTabView","userTab","titleInfoView","numInfo","num"};
	[OnlookerChatAndUserView.s_controls.chatView]		= {"infoView","chatView"};
	[OnlookerChatAndUserView.s_controls.chatDetail]		= {"infoView","chatView","chatDetail"};
	[OnlookerChatAndUserView.s_controls.newMsgView]		= {"infoView","chatView","bottomView","newMsgView"};
	[OnlookerChatAndUserView.s_controls.newMsgTips]		= {"infoView","chatView","bottomView","newMsgView","newMsgTips"};
	[OnlookerChatAndUserView.s_controls.hideNickSwitch]	= {"infoView","chatView","bottomView","hideNickSwitch"};
	[OnlookerChatAndUserView.s_controls.barrageSwitch]	= {"infoView","chatView","bottomView","barrageSwitch"};
	[OnlookerChatAndUserView.s_controls.chatEdit]		= {"infoView","chatView","bottomView","inputBg","chatEdit"};
	[OnlookerChatAndUserView.s_controls.chatSendBtn]	= {"infoView","chatView","bottomView","chatSendBtn"};
	[OnlookerChatAndUserView.s_controls.chatSendBtnName]	= {"infoView","chatView","bottomView","chatSendBtn","name"};
	[OnlookerChatAndUserView.s_controls.userView]		= {"infoView","userView"};
	[OnlookerChatAndUserView.s_controls.userDetail]		= {"infoView","userView","userDetail"};
};

OnlookerChatAndUserView.s_controlFuncMap = 
{
	[OnlookerChatAndUserView.s_controls.shield]			= OnlookerChatAndUserView.onShieldTouch;
	[OnlookerChatAndUserView.s_controls.infoView]		= OnlookerChatAndUserView.onEmpty;
	[OnlookerChatAndUserView.s_controls.userTabBtn]		= OnlookerChatAndUserView.onUserTabBtnClick;
	[OnlookerChatAndUserView.s_controls.chatTabBtn]		= OnlookerChatAndUserView.onChatTabBtnClick;
	[OnlookerChatAndUserView.s_controls.chatEdit]		= OnlookerChatAndUserView.onChatEditChange;
	[OnlookerChatAndUserView.s_controls.chatSendBtn]	= OnlookerChatAndUserView.onChatSendBtnClick;
	[OnlookerChatAndUserView.s_controls.newMsgView]		= OnlookerChatAndUserView.onNewMsgViewTouch;
	[OnlookerChatAndUserView.s_controls.hideNickSwitch]	= OnlookerChatAndUserView.onHideNickSwitchChange;
	[OnlookerChatAndUserView.s_controls.barrageSwitch]	= OnlookerChatAndUserView.onBarrageSwitchChange;
};

OnlookerChatAndUserView.s_actionFuncMap = {
	[GameMechineConfig.ACTION_NS_RECEIVE_BARRAGE_MSG] 		= "onReceiveChatMsg";
	[GameMechineConfig.ACTION_NS_SHOW_ONLOOKER_DETAIL_INFO] = "onShowChatView";
	[GameMechineConfig.ACTION_ONLOOKER_LOGIN] 				= "refreshOnlookersInfo";
	[GameMechineConfig.ACTION_ONLOOKER_LOGOUT] 				= "refreshOnlookersInfo";
	[GameMechineConfig.ACTION_NS_ADDFRIEND_CALLBACK]      	= "onAddFriendCallback";
	[GameMechineConfig.ACTION_NS_REFRESH_FRIENDS_LIST]      = "refreshOnlookersInfo";
	[GameMechineConfig.ACTION_NS_RECEIVE_SHUTUP] 			= "onReceiveShutup";
	[GameMechineConfig.ACTION_SHOWPROPNIM]					= "onUseProps";
};

OnlookerChatAndUserView.s_stateFuncMap = {
};


return OnlookerChatAndUserView;