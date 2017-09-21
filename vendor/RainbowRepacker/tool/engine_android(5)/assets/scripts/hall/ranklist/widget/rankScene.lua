require("core/dict");
require("common/commonScene");
require("ui/listView");
require("ui/textView");
require("ui/toast");
require("common/loadingView");
require("ui/adapter");
local rankListItem = require(ViewPath .. "hall/ranklist/rankListItem");
require("hall/main/widget/hallCommonHeadView");
local RankManInfo = require("hall/ranklist/widget/rankManInfo")
local RankAwardMsgDialog = require("hall/ranklist/widget/rankAwardMsgDialog");
local ranklist_pin_map = require("qnFiles/qnPlist/hall/ranklist_pin")
require("hall/ranklist/data/rankListConstants");

-------------------- ranklistitem ---------------------------
local RankListItem = class(Node);

RankListItem.ctor = function(self, data)
	if not table.isTable(data) then
		return;
	end
	self:setFillParent(true,false);
	self.m_data = data;
	self.m_index = data.index;
	self.m_curTypeItem = data.tabType;
	local view = SceneLoader.load(rankListItem);
	self:setSize(view:getSize());
	view:setFillParent(true, false);
	self.m_newNode = view:getChildByName("content");

	local left = self.m_newNode:getChildByName("left");
	local left_crown = left:getChildByName("left_crown");
	local left_view = left:getChildByName("left_view");
	left_crown:setVisible(true);
	left_view:setVisible(false);
	local pos = data["pos"] or -1;
	if pos == 1 then
		left_crown:setFile( ranklist_pin_map["rank_1.png"] );
	elseif pos == 2 then
		left_crown:setFile( ranklist_pin_map["rank_2.png"] );
	elseif pos == 3 then
		left_crown:setFile( ranklist_pin_map["rank_3.png"] );
	else
		left_crown:setVisible(false);
		left_view:setVisible(true);
	end
    left_view:getChildByName("left_rank_num"):setText(pos);
    local icon;
    if data.mid == kUserInfoData:getUserId() then
       icon = kUserInfoData:getAvatar_s() or kUserInfoData:getAvatar_b();
    else
       icon = data["icon"] or "";
    end
	self:setHeadImage( kUserInfoData:getHallHeadBySex(data.sex) );
    ImageCache.getInstance():request(icon, self, self.onUpdateHeadImage);

	local nameText = self.m_newNode:getChildByName("name");
	local coinText = self.m_newNode:getChildByName("right_coins"):getChildByName("coins_num");
	local nick = data["nick"] or "--";
	local cid = data.cid or "0";
	nameText:setText(string.concat(nick , " ID:" , cid));
	local coinTextHead = "%s";
	local coinNum = tonumber(data["account"]) or 0;
	if coinNum < 0 then
		coinNum = 0;
	end	
	local coinNumStr = coinNum .. "";
	if self.m_curTypeItem == RankListConstants.eRankType.Money then
		coinTextHead = "赚%s银币";
		coinNumStr = ToolKit.skipMoneyEx4(coinNum);
	elseif self.m_curTypeItem == RankListConstants.eRankType.Exp then
		coinTextHead = "%s经验";
	elseif self.m_curTypeItem == RankListConstants.eRankType.Rich then
		coinTextHead = "%s银币";
		coinNumStr = ToolKit.skipMoneyEx4(coinNum);
	elseif self.m_curTypeItem == RankListConstants.eRankType.Vip then
		coinTextHead = "积分:%s";
		coinNumStr = ToolKit.skipMoneyEx4(coinNum);
	elseif self.m_curTypeItem == RankListConstants.eRankType.RedEnvelope then
		coinTextHead = "发出%s个红包";
		coinNumStr = ToolKit.skipMoneyEx4(coinNum);	
	else

	end
	coinText:setText(string.format(coinTextHead,coinNumStr));
	
	self:addChild(view);

	local isVip = number.valueOf(data.isVip,0)==1 and true or false;
	local headView = self.m_newNode:getChildByName("head")
	local vipImage = headView:getChildByName("vip_corner_mark");
	vipImage:setVisible(isVip);
	local w = nameText:getSize();
	local x = nameText:getPos();
	local xHead = headView:getPos();
	local curentX = vipImage:getPos();
	local newX = x - xHead + w;
	vipImage:setPos(newX > curentX and newX or curentX);
end

RankListItem.isHeadClick = function(self, x, y)
	local x1, y1 = self.m_newNode:getChildByName("head"):getUnalignPos();
	local w, h = self.m_newNode:getChildByName("head"):getSize();
	if x >= x1 and x <= x1+w and y >= y1 and y <= y1+h then
		return true;
	end

	return false;
end

RankListItem.onUpdateHeadImage = function(self, url, imagePath)
	if url == self.m_data.icon then
		self:setHeadImage(imagePath);
	end
end

RankListItem.setHeadImage = function(self, image)
	local headBg = self.m_newNode:getChildByName("head");

	if self.m_headImage then
		headBg:removeChild(self.m_headImage);
	end

	delete(self.m_headImage);

	self.m_headImage = new(Mask, image, "hall/common/list_head_mask.png");
	headBg:addChild(self.m_headImage);
	self.m_headImage:setAlign(kAlignCenter);
	self.m_headImage:setLevel(-1);
end


RankListItem.dtor = function(self)
	ImageCache.getInstance():cleanRef(self);
end




local RankScene = class(CommonScene);

local h_index = 0;
local getIndex = function(self)
	h_index = h_index + 1;
	return h_index;
end

-- 一些界面控件的index
RankScene.s_controls = 
{
	backBtn = getIndex(),
	rankListView = getIndex(),
	rankLeft = getIndex(),
	rankRight = getIndex(),
	errorText = getIndex(),
	noticeTime = getIndex(),
	notice = getIndex(),
	dayChagngeBtn = getIndex(),
	dayChagngeBtnText = getIndex(),
	headArea = getIndex();
	tabExp = getIndex();
	tabEarn = getIndex();
	tabRich = getIndex();
	tabRedEnvelope = getIndex();
};

RankScene.s_requestRankTabTimeOut = 1;
RankScene.s_requestRankListTimeOut = 2;
RankScene.s_requestRankInfoTimeOut = 3;

RankScene.s_tabConfig = {
	[RankListConstants.eRankType.Exp] = { 
		ctrlId = RankScene.s_controls.tabExp,
		normalImg = ranklist_pin_map["exp_list.png"],
		selectImg = ranklist_pin_map["exp_list_sel.png"] 
	};

	[RankListConstants.eRankType.Money] = { 
		ctrlId = RankScene.s_controls.tabEarn,
		normalImg = ranklist_pin_map["earn_list.png"],
		selectImg = ranklist_pin_map["earn_list_sel.png"] 
	};
	
	[RankListConstants.eRankType.Rich] = { 
		ctrlId = RankScene.s_controls.tabRich,
		normalImg = ranklist_pin_map["rich_list.png"],
		selectImg = ranklist_pin_map["rich_list_sel.png"] 
	};

	[RankListConstants.eRankType.RedEnvelope] = { 
		ctrlId = RankScene.s_controls.tabRedEnvelope,
		normalImg = ranklist_pin_map["redEnvelope_list.png"],
		selectImg = ranklist_pin_map["redEnvelope_list_sel.png"] 
	};
}

-- 指令
RankScene.s_cmds = 
{
	LoadRankList = getIndex(),
	LoadRankTabList = getIndex(),
	LoadMyRankInfo = getIndex(),
	PreRankList = getIndex(),
	PreRankInfo = getIndex(),
	RankRequestTimeOut = getIndex(),
	RankDayChange = getIndex(),
	ShowUserInfo = getIndex(),
	showToast = getIndex(),
	SetHeadMenuSelect = getIndex(),
	updateTabs = getIndex();
};

-- 构造器
RankScene.ctor = function(self, viewConfig, controller)
	self.m_controller = controller;
	self.m_ctrl = RankScene.s_controls;

   self.currentCeck = 2 ; 
end

RankScene.resume = function(self)
	CommonScene.resume(self);
end

RankScene.__onDelayResumeScene = function(self)
	CommonScene.__onDelayResumeScene(self);

	if not self.m_hasEnter then
		self.m_hasEnter = true;
		self:requestCtrlCmd(RankController.s_cmds.getRankTabList);
		self:initView();
	end
end

RankScene.pause = function(self)
	CommonScene.pause(self)
end

RankScene.initView = function(self)
	self:findViewById(self.m_ctrl.notice):setText(string.format(GameString.get("rankUpdateTimeTip"),os.date("%H")) or "");
end

-- 预加载某一个tab的list，此时局部做一个loading
RankScene.onPrepareRankList = function(self, updateFlag)
    if not updateFlag then
        LoadingView.getInstance():showText(GameString.get("rankLoadingText"));
        self:findViewById(self.m_ctrl.errorText):setVisible(false);
        self.m_isRankListLoaded = false
    else
        self:findViewById(self.m_ctrl.errorText):setVisible(true);
        self.m_isRankListLoaded = true
    end
    self:findViewById(self.m_ctrl.rankListView):setVisible(false);	
end

-- 预加载某一个tab的个人排名信息，此时局部做一个loading
RankScene.onPrepareRankInfo = function(self)
	self.m_isRankInfoLoaded = false;
	if not LoadingView.getInstance():isShowing() then
		LoadingView.getInstance():showText(GameString.get("rankLoadingText"));
	end
	LoadingView.getInstance():showText(GameString.get("rankLoadingText"));
	if self.m_showRankMineBottomView then
        self.m_showRankMineBottomView:refreshErrorTextAndRankArea(false, false);
    end
end

-- load界面信息，包括自定义的控件，事件等等
RankScene.onLoadRankList = function(self, data, dtype)
	self.m_isRankListLoaded = true;
	if self.m_isRankListLoaded and self.m_isRankInfoLoaded then
		LoadingView.getInstance():hidden();
	end
	if table.isEmpty(data) then 
		self:findViewById(self.m_ctrl.rankListView):setVisible(false);
		self:findViewById(self.m_ctrl.errorText):setVisible(true);
	else
		self:findViewById(self.m_ctrl.rankListView):setVisible(true);
		self:findViewById(self.m_ctrl.errorText):setVisible(false);
		if not self.m_rankListAdapter then 
			self.m_rankListAdapter = new(CacheAdapter, RankListItem, data);				--数据缓存器
			local listview = self:findViewById(self.s_controls.rankListView);
			listview:setAdapter(self.m_rankListAdapter);							--设置adapter
			listview:setOnItemClick(self, self.onRankItemClick);
		else 
			self.m_rankListAdapter:changeData(data);
		end
	end
end

RankScene.onLoadMyRankInfo = function(self, data, rankType, flag)
    self.m_isRankInfoLoaded = true;
	if self.m_isRankListLoaded and self.m_isRankInfoLoaded then
		LoadingView.getInstance():hidden();
	end

	self:__showRankMineBottomView(data, rankType, flag);
end

RankScene.__showRankMineBottomView = function(self, data, rankType, flag)
   if not self.m_showRankMineBottomView then
        self.m_showRankMineBottomView = new(require("hall/ranklist/widget/rankMineBottomView"));
		self.m_showRankMineBottomView:setFillParent(true, true);
		self.m_showRankMineBottomView:setDelegate(self);
    	self.m_root:addChild(self.m_showRankMineBottomView);
   end
   self.m_showRankMineBottomView:refreshMineRankInfo(data, rankType, flag);
end

RankScene.dtor = function(self)
    require("isolater/widget/layerManagerIsolater");
    LayerManagerIsolater.getInstance():hide("commonReport");

	LoadingView.getInstance():hidden();
	delete(self.m_rewardMsgDialog);
	self.m_rewardMsgDialog = nil;
	if self.ani then
		self.ani:onTimerShop();
	end
end

-- 返回事件
RankScene.onBackBtnClick = function(self)
	self:requestCtrlCmd(RankController.s_cmds.goBack);
end

RankScene.onMineRankBtnClick = function(self)
	self:requestCtrlCmd(RankController.s_cmds.mineRankBtnClick);
end

RankScene.onDayChangeBtnClick = function(self)
	self:requestCtrlCmd(RankController.s_cmds.DayChangeBtnClick);
end

RankScene.showRewardMsgDialog = function(self,data)
    if not table.isEmpty(data) then
        delete(self.m_rewardMsgDialog);
        self.m_rewardMsgDialog = nil;
        self.m_rewardMsgDialog = new(RankAwardMsgDialog, data);
        self.m_root:addChild(self.m_rewardMsgDialog);
    end
end

RankScene.onTabRichClick = function(self)
	UBReport.getInstance():report(UBConfig.kHallRankTabRich);
	self:requestCtrlCmd(RankController.s_cmds.rankTabItemClick, RankListConstants.eRankType.Rich);
end

RankScene.onTabEarnClick = function(self)
	UBReport.getInstance():report(UBConfig.kHallRankTabEarn);
	self:requestCtrlCmd(RankController.s_cmds.rankTabItemClick, RankListConstants.eRankType.Money);
end

RankScene.onTabExpClick = function(self)
	UBReport.getInstance():report(UBConfig.kHallRankTabExp);
	self:requestCtrlCmd(RankController.s_cmds.rankTabItemClick, RankListConstants.eRankType.Exp);
end

RankScene.onTabRedEnvelopeClick = function(self)
	UBReport.getInstance():report(UBConfig.kHallRankTabRedEnvelope);
	self:requestCtrlCmd(RankController.s_cmds.rankTabItemClick, RankListConstants.eRankType.RedEnvelope);
end

RankScene.onRankRequestTimeOut = function(self, timeOutype)
	LoadingView.getInstance():hidden();
	if timeOutype == self.s_requestRankTabTimeOut then 
		self:findViewById(self.m_ctrl.rankListView):setVisible(false);
		self:findViewById(self.m_ctrl.errorText):setVisible(true);
		if self.m_showRankMineBottomView then
            self.m_showRankMineBottomView:refreshErrorTextAndRankArea(false, false);
        end
	elseif timeOutype == self.s_requestRankListTimeOut then
		self:findViewById(self.m_ctrl.rankListView):setVisible(false);
		self:findViewById(self.m_ctrl.errorText):setVisible(true);
	elseif timeOutype == self.s_requestRankInfoTimeOut then
		if self.m_showRankMineBottomView then
            self.m_showRankMineBottomView:refreshErrorTextAndRankArea(true, false);
        end
	end
end

RankScene.onRankDayChange = function(self, flag)
	local DCBtnText = self:findViewById(self.m_ctrl.dayChagngeBtnText);
	if flag == RankListConstants.eFlag.Today then
		--此处更改界面为昨日
		DCBtnText:setText("昨日");
	elseif flag == RankListConstants.eFlag.LastDay then
	    --此处更改界面为今日
	   	DCBtnText:setText("今日");
	end
	self.flag = flag;
end

RankScene.onShowUserInfo = function(self, info)
	if not self.manInfo  then
		self:pushStateStack(self, self.onHideUserInfo);
		self.manInfo = new(RankManInfo,info,self);
		self.manInfo:setFillParent(true, true);
		self.manInfo:setDelegate(self);
    	self.m_root:addChild(self.manInfo);
	end
end

RankScene.onHideUserInfo = function(self, popStack)
	if popStack then
		self:popStateStack();
	end

	if self.manInfo then
		delete(self.manInfo);
		self.manInfo = nil;
	end
end

RankScene.sendDirectMsg = function(self,cid)
     --发送加好友的请求
     local param = {};
     param.dst_cid = cid;
     param.message = "";
     mid = tonumber(mid) or 0;
     if mid >= 9000000 and mid < 10000000 then
     	self:onShowToast("发送成功，等待验证");
     else
     	self:requestCtrlCmd(RankController.s_cmds.AddConfirmClick,param);
     end
end

RankScene.onShowToast = function(self,msg)
	Toast.getInstance():showText(msg, 400,60 , kAlignCenter, "", 30,200,175,115);
end

RankScene.onRankItemClick = function(self,adapter,view,index,x,y)				--点击回调函数：adatper表示Listview维护的adapter,view是当前点击的子条目对象,index是这个子条目在data中的索引。
	if view:isHeadClick(x, y) then	
		self:requestCtrlCmd(RankController.s_cmds.requestUserInfo, view.m_data);
	end
end

RankScene.onSetHeadMenuSelect = function(self, rankType)
	self:setSelectTab(rankType);
end

RankScene.setSelectTab = function(self, rankType)
	--如果是红包隐藏"昨天"按钮
	if rankType == RankListConstants.eRankType.RedEnvelope then
		self:findViewById(self.m_ctrl.dayChagngeBtn):setVisible(false);
	else
		self:findViewById(self.m_ctrl.dayChagngeBtn):setVisible(true);
	end

	for id, tabConfig in pairs(RankScene.s_tabConfig) do
		local ctrl = self:findViewById(tabConfig.ctrlId);
		if id == rankType then
			ctrl:getChildByName("img_title"):setFile(tabConfig.selectImg);
			ctrl:setFile("hall/common/tab_bg_sel.png");
		else
			ctrl:getChildByName("img_title"):setFile(tabConfig.normalImg);
			ctrl:setFile("hall/common/bg_blank.png");
		end
	end
end

RankScene.updateTabs = function(self, tabsConfig)
	for k, v in pairs(RankScene.s_tabConfig) do
		ctrl = self:findViewById(v.ctrlId);
		ctrl:setVisible(false);
	end

	local startX = -30;
	local visibleNum = 0;
	local space = -100;
	for index = #tabsConfig, 1, -1 do
		local config = RankScene.s_tabConfig[ tabsConfig[index].type ];
		if config then
			local ctrl = self:findViewById(config.ctrlId);
			ctrl:setAlign(kAlignTopRight);
			ctrl:setVisible(true);
			local w,_ = ctrl:getSize();
			ctrl:setPos(startX + visibleNum*(w+space), nil);
			visibleNum = visibleNum + 1;
		end
	end
end

-- 控件的配置信息
RankScene.s_controlConfig = 
{
	[RankScene.s_controls.headArea] = {"top"};
	[RankScene.s_controls.backBtn] = {"top" , "back"},
	[RankScene.s_controls.dayChagngeBtn] = {"top", "day_change"},
	[RankScene.s_controls.dayChagngeBtnText] = {"top", "day_change", "day_change_text"},
	[RankScene.s_controls.rankListView] = {"content", "c_right" , "c_listview"},
    [RankScene.s_controls.rankLeft] = {"content", "c_left"},
	[RankScene.s_controls.rankRight] = {"content", "c_right"},
	[RankScene.s_controls.errorText] = {"content", "c_right" , "error_text"},
	[RankScene.s_controls.notice] = {"content", "c_left" , "rank_notice"},
	[RankScene.s_controls.noticeTime] = {"content", "c_left" , "rank_notice_time"},
	[RankScene.s_controls.tabRich]  = {"top", "tabRich"};
	[RankScene.s_controls.tabExp]  = {"top", "tabExp"};
	[RankScene.s_controls.tabEarn]  = {"top", "tabEarn"};
	[RankScene.s_controls.tabRedEnvelope]  = {"top", "tabRedEnvelope"};
};

RankScene.s_controlFuncMap = 
{
	[RankScene.s_controls.backBtn] = RankScene.onBackBtnClick,
	[RankScene.s_controls.dayChagngeBtn] = RankScene.onDayChangeBtnClick,
	[RankScene.s_controls.tabRich]  = RankScene.onTabRichClick;
	[RankScene.s_controls.tabEarn]  = RankScene.onTabEarnClick;
	[RankScene.s_controls.tabExp]   = RankScene.onTabExpClick;
	[RankScene.s_controls.tabRedEnvelope]   = RankScene.onTabRedEnvelopeClick;
	
};

-- 控件指令配置
RankScene.s_cmdConfig = 
{
	[RankScene.s_cmds.LoadRankList] = RankScene.onLoadRankList,
	[RankScene.s_cmds.LoadMyRankInfo] = RankScene.onLoadMyRankInfo,
	[RankScene.s_cmds.PreRankList] = RankScene.onPrepareRankList,
	[RankScene.s_cmds.PreRankInfo] = RankScene.onPrepareRankInfo,
	[RankScene.s_cmds.RankRequestTimeOut] = RankScene.onRankRequestTimeOut,
	[RankScene.s_cmds.RankDayChange] = RankScene.onRankDayChange,
	[RankScene.s_cmds.ShowUserInfo] = RankScene.onShowUserInfo,
	[RankScene.s_cmds.showToast] = RankScene.onShowToast,
	[RankScene.s_cmds.SetHeadMenuSelect] = RankScene.onSetHeadMenuSelect,
	[RankScene.s_cmds.updateTabs] = RankScene.updateTabs;
};

return RankScene