require("games/common2/onlooker/data/onlookerPlayerManager");
local ViewBase = require("games/common2/module/viewBase");

local OnlookerSpinnerView = class(ViewBase,false);

OnlookerSpinnerView.s_controls = {
	infoView = ToolKit.getIndex();
	listInfoView = ToolKit.getIndex();	
	listInfoBg = ToolKit.getIndex();
	listInfoDetailView = ToolKit.getIndex();
	spinnerBtn = ToolKit.getIndex();
	onlookerNumInfo = ToolKit.getIndex();
	spinnerArrow = ToolKit.getIndex();
	shiled = ToolKit.getIndex();
	spinnerBtnEx = ToolKit.getIndex();
};

OnlookerSpinnerView.ctor = function(self, seat, layoutConfig)
    super(self,layoutConfig);
	self.m_ctrls = OnlookerSpinnerView.s_controls;
    self:setFillParent(true,true);
    self.m_seat = seat;
    self.m_onlookerListData = {};

    self:_initView();
end 

OnlookerSpinnerView.dtor = function(self)
	if self.m_listInfoView:getVisible() then
		DialogLogic.getInstance():popDialogStack();
	end
end
-----------------------------------------------------------------------------
OnlookerSpinnerView.parseConfig = function(self,config)
	config = table.verify(config);

	local infoView = self:findViewById(self.m_ctrls.infoView);
	if config.align then 
    	infoView:setAlign(config.align);
    end 

    if config.x or config.y then 
		infoView:setPos(config.x,config.y);
	end
end
-----------------------------------------------------------------------------
OnlookerSpinnerView._initView = function(self)
	self.m_listInfoView = self:findViewById(self.m_ctrls.listInfoView);
	self.m_spinnerArrow = self:findViewById(self.m_ctrls.spinnerArrow);
	self.m_onlookerNumInfo = self:findViewById(self.m_ctrls.onlookerNumInfo);

	self:_setShowListInfo(false);
	self:_refreshOnlookersInfo();
end

OnlookerSpinnerView._setShowListInfo = function(self,isShow,isNeedAnim)
	self.m_listInfoView:setVisible(isShow);
	
	if isNeedAnim then 
		self.m_spinnerArrow:removeProp(0);
		local anim = self.m_spinnerArrow:addPropRotate(0, kAnimNormal, 200, 0, 0, 90, kCenterDrawing);
		anim:setEvent(nil,function()
			self.m_spinnerArrow:removeProp(0);
			self.m_spinnerArrow:setMirror(false,isShow);
		end);
	else 
		self.m_spinnerArrow:setMirror(false,isShow);
	end

	local shiled = self:findViewById(self.m_ctrls.shiled);
	shiled:setVisible(isShow);
end

OnlookerSpinnerView._refreshOnlookersInfo = function(self)
	self.m_onlookerListData = self:_getSortLookersData();
	self:_refreshOnlookersNumInfo();

	if #self.m_onlookerListData > 0 then 
		self:_refreshOnlookersListInfo();
		self:setVisible(true);
	else 
		self:setVisible(false);
	end 
end

OnlookerSpinnerView._refreshOnlookersNumInfo = function(self)
	local count = #self.m_onlookerListData;
	count = count > 99 and "99+" or count;
	local str = string.format("%s人正在围观",count);
	self.m_onlookerNumInfo:setText(str);
end

OnlookerSpinnerView._refreshOnlookersListInfo = function(self)
	local count = #self.m_onlookerListData;
	local data = {};
	local info = self.m_onlookerListData;
	for i = 1,count,2 do 
		local tmp = {};
		tmp[1] = info[i];
		tmp[2] = info[i + 1];
		table.insert(data,tmp);
	end 

	local listInfoDetailView = self:findViewById(self.m_ctrls.listInfoDetailView);
	if not self.m_adapter then
		local OnlookerSpinnerItem = require("games/common2/onlooker/module/onlookerSpinner/onlookerSpinnerItem");
        self.m_adapter = new(CacheAdapter, OnlookerSpinnerItem, data);
        listInfoDetailView:setAdapter(self.m_adapter);
    else
        self.m_adapter:changeData(data);
    end

    local view = self.m_adapter:getView(1);
    local itemWidth ,itemHeight = view:getSize();
    local listInfoBg = self:findViewById(self.m_ctrls.listInfoBg);
    local height = listInfoBg.m_res:getHeight();
    local diff = 0;
    local itemCount = #data;
    if itemCount > 1 and itemCount < 5 then 
    	diff = (itemCount - 1)*itemHeight;
    elseif itemCount >= 5 then 
    	diff = 3.5 * itemHeight;
    end 
    listInfoBg:setSize(nil,height+diff);
end

OnlookerSpinnerView._getSortLookersData = function(self)
	local all = OnlookerPlayerManager.getInstance():getAllOnlooker();
	all = table.verify(all);

	local data = {};
	local vip = {};
	local friend = {};
	local vipAndFriend = {};
	local normal = {};

	for k,v in pairs(all) do 
		local tmp = {};
		tmp.nick = v:getNick();
		local cid = v:getCid();
		tmp.isFriend = CommunityIsolater.getInstance():checkIsFriend(cid);

		local identity = v:getIdentity();
		tmp.isVip = UserIdentityIsolater.getInstance():checkIsVip(identity);

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
 
		data = MegerTables(vipAndFriend,friend,vip,normal);
	end 
	return data;
end
-----------------------------------------------------------------------------
OnlookerSpinnerView.onSpinnerBtnClick = function(self)
	if #self.m_onlookerListData > 0 then
		local isShowListInfo = self.m_listInfoView:getVisible();
		self:_setShowListInfo(not isShowListInfo,true);

		if isShowListInfo then 
			DialogLogic.getInstance():popDialog();
		else 
			DialogLogic.getInstance():pushDialogStack(self,function(self)
				self:_setShowListInfo(false,true);
			end);	
		end 
	end 
end

OnlookerSpinnerView.onShiledTouch = function(self,finger_action)
	if finger_action == kFingerUp then
		self:_setShowListInfo(false,true);
		DialogLogic.getInstance():popDialog();
	end
end

OnlookerSpinnerView.onEmpty = function(self)
end
-----------------------------------------------------------------------------
OnlookerSpinnerView.refreshOnlookersInfo = function(self,seat,uid,info,isFast)
	self:_refreshOnlookersInfo();
end
-----------------------------------------------------------------------------
OnlookerSpinnerView.s_controlConfig = 
{	
	[OnlookerSpinnerView.s_controls.infoView]				= {"infoView"};
	[OnlookerSpinnerView.s_controls.listInfoView]			= {"infoView","listView"};
	[OnlookerSpinnerView.s_controls.listInfoBg]				= {"infoView","listView","bg"};
	[OnlookerSpinnerView.s_controls.listInfoDetailView]		= {"infoView","listView","list_detail"};
	[OnlookerSpinnerView.s_controls.spinnerBtn]				= {"infoView","title_btn"};
	[OnlookerSpinnerView.s_controls.onlookerNumInfo]		= {"infoView","title_btn","num_info"};
	[OnlookerSpinnerView.s_controls.spinnerArrow]			= {"infoView","title_btn","btn","arrow"};
	[OnlookerSpinnerView.s_controls.shiled]					= {"shiled"};
	[OnlookerSpinnerView.s_controls.spinnerBtnEx]			= {"infoView","title_btn","title_btn_ex"};	
};

OnlookerSpinnerView.s_controlFuncMap = 
{
	[OnlookerSpinnerView.s_controls.spinnerBtn]			= OnlookerSpinnerView.onSpinnerBtnClick;
	[OnlookerSpinnerView.s_controls.shiled]				= OnlookerSpinnerView.onShiledTouch;
	[OnlookerSpinnerView.s_controls.infoView]			= OnlookerSpinnerView.onEmpty;
	[OnlookerSpinnerView.s_controls.spinnerBtnEx]		= OnlookerSpinnerView.onSpinnerBtnClick;
};

OnlookerSpinnerView.s_actionFuncMap = {
	[GameMechineConfig.ACTION_ONLOOKER_LOGIN] 			= "refreshOnlookersInfo";
	[GameMechineConfig.ACTION_ONLOOKER_LOGOUT] 			= "refreshOnlookersInfo";
	[GameMechineConfig.ACTION_NS_REFRESH_FRIENDS_LIST]  = "refreshOnlookersInfo";
	[GameMechineConfig.ACTION_NS_ADDFRIEND_CALLBACK]    = "refreshOnlookersInfo";
};

OnlookerSpinnerView.s_stateFuncMap = {
	[GameMechineConfig.STATUS_LOGIN]					= "refreshOnlookersInfo";
	[GameMechineConfig.STATUS_LOGOUT]					= "refreshOnlookersInfo";
};


return OnlookerSpinnerView;