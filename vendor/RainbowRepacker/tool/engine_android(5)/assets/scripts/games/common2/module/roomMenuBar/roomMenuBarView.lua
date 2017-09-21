

local viewBase = Import("games/common2/module/viewBase");
local RoomMenuBarView = class(viewBase,false);

RoomMenuBarView.Delegate = {};
RoomMenuBarView.DefaultItems = {
	MENU_EXIT 		= "menu_exit",		-- 退出
	MENU_AI 		= "menu_ai",		-- 托管
	MENU_RECHARGE 	= "menu_recharge",	-- 商城
	MENU_SETTING 	= "menu_setting",	-- 设置
	MENU_QUKUAN 	= "menu_qukuan",	-- 取款
};

RoomMenuBarView.s_controls =
{
	shield 			= ToolKit.getIndex();
	menu_btn 		= ToolKit.getIndex();
	more_view 		= ToolKit.getIndex();
	more_bg 		= ToolKit.getIndex();
	exit_btn 		= ToolKit.getIndex();
	setting_btn		= ToolKit.getIndex();
	ai_btn 			= ToolKit.getIndex();
	shop_btn 		= ToolKit.getIndex();
	qukuan_btn 		= ToolKit.getIndex();

	menu_view   	= ToolKit.getIndex();
};

RoomMenuBarView.ctor = function (self, seat, layoutConfig)
	super(self, layoutConfig);
	self:setFillParent(true,true);

	self:setVisible(false);
end

RoomMenuBarView.dtor = function (self)
	self:stopQuKuanTipsAnim();
	self.m_timeText = nil;
	if self.m_moreView:getVisible() then
		self:hideMoreView();
	end
end

RoomMenuBarView.init = function (self)
	self.m_menuItemCount = 0; -- 默认有四项
	self.m_ctrl = RoomMenuBarView.s_controls;
	self.m_shield = self:findViewById(self.m_ctrl.shield);
	self.m_moreView = self:findViewById(self.m_ctrl.more_view);
	self.m_moreBg = self:findViewById(self.m_ctrl.more_bg);

	self.m_exitBtn = self:findViewById(self.m_ctrl.exit_btn);
	self.m_aiBtn = self:findViewById(self.m_ctrl.ai_btn);
	self.m_rechargeBtn = self:findViewById(self.m_ctrl.shop_btn);
	self.m_settingBtn = self:findViewById(self.m_ctrl.setting_btn);
	self.m_qukuanBtn = self:findViewById(self.m_ctrl.qukuan_btn);

	self.m_exitBtn:setVisible(false);
	self.m_aiBtn:setVisible(false);
	self.m_rechargeBtn:setVisible(false);
	self.m_settingBtn:setVisible(false);
	self.m_qukuanBtn:setVisible(false);

	self.m_shield:setVisible(false);
	self.m_moreView:setVisible(false);
	self.m_btns = {};
	self:_startDelayTimer(1,self,self._initMenuItem);
end

RoomMenuBarView._initMenuItem = function(self)
	self:initCallbackFunc();
	local info = {
		[1] = {key="menu_ai",enable=false};
	};
	if GameInfoIsolater.getInstance():isInMatchRoom() then 
		info[2] = {key="menu_exit",enable=false};
	end
	self:onMenuBtnEnable(nil,nil,info);
	self:setVisible(true);
end

RoomMenuBarView.initCallbackFunc = function ( self )
	local config = table.verify(GameProcessManager2.getInstance():getGameConfig());
	local toolBarConfig = table.verify(config.toolBarConfig);
	self.m_aiCommand = (toolBarConfig.aiCommand == nil) and CLIENT_COMMAND_REQUEST_AI or toolBarConfig.aiCommand;
	self.m_menuItemConfig = table.verify(toolBarConfig.items);

	table.sort(self.m_menuItemConfig, function ( a, b )
		-- body
		if a and b then 
			return number.valueOf(a.sort) <= number.valueOf(b.sort);
		end
	end );

	local isSafeBoxSwitchOpen = SafeBoxIsolater.getInstance():isSafeBoxSwitchOpen();
	local isRechargeSwitchOpen = true;
	if PrivateRoomIsolater.getInstance():isInJiFenRoom() then
		isSafeBoxSwitchOpen = false;
		isRechargeSwitchOpen = false;
	end 
	local hasQuKuan = false;--子游戏是否有配置取款菜单项
	for k, v in pairs(table.verify(self.m_menuItemConfig)) do 
		if v.key == RoomMenuBarView.DefaultItems.MENU_QUKUAN then
			hasQuKuan = true;
		end
		if not v.isHid then

			local isInit = true;
			if v.key == RoomMenuBarView.DefaultItems.MENU_QUKUAN then
				isInit = isSafeBoxSwitchOpen;
			elseif v.key == RoomMenuBarView.DefaultItems.MENU_RECHARGE then
				isInit = isRechargeSwitchOpen;
			else  
				isInit = true;
			end 

			if isInit then 
				RoomMenuBarView.Delegate[v.key] = v.callbackFunc;

				local menuItem = nil;
				if v.isDefault then 
					menuItem = self:getDefaultMenuItem(v);
				else
					menuItem = self:createMenuItem(v);
				end

				if menuItem then
					table.insert(self.m_btns,{v.key,menuItem,v.path});
					menuItem:setPos(0, 75 * self.m_menuItemCount );
					self.m_moreView:addChild(menuItem);
					if self.m_menuItemCount < #self.m_menuItemConfig then 
						local spliter = UIFactory.createImage("games/common/menuToolbar/more_split_line.png");
						spliter:setPos(0, 75 * self.m_menuItemCount );
						spliter:setAlign(kAlignTop);
						self.m_moreView:addChild(spliter);
					end
					self.m_menuItemCount = self.m_menuItemCount + 1;
				end
			end 
		end
	end

	local moreViewHeight = 0;
	if self.m_menuItemCount == 0 then
		-- 假如没配置，则显示默认四个按钮
		self.m_menuItemCount = 3;
		self.m_exitBtn:setVisible(true);
		self.m_settingBtn:setVisible(true);
		self.m_aiBtn:setVisible(true);
		table.insert(self.m_btns,{"menu_exit",self.m_exitBtn});
		table.insert(self.m_btns,{"menu_setting",self.m_settingBtn});
		table.insert(self.m_btns,{"menu_ai",self.m_aiBtn});
		
		if isRechargeSwitchOpen then
			self.m_menuItemCount = self.m_menuItemCount + 1;
			self.m_rechargeBtn:setVisible(true);
			table.insert(self.m_btns,{"menu_recharge",self.m_rechargeBtn});
			RoomMenuBarView.Delegate[RoomMenuBarView.DefaultItems.MENU_RECHARGE] = "onToolbarRechargeClick";
		end
			
		if isSafeBoxSwitchOpen then
			self.m_menuItemCount = self.m_menuItemCount + 1;
			self.m_qukuanBtn:setVisible(true);
			table.insert(self.m_btns,{"menu_qukuan",self.m_qukuanBtn});
			RoomMenuBarView.Delegate[RoomMenuBarView.DefaultItems.MENU_QUKUAN] = "onToolbarQuKuanClick";
		end

		RoomMenuBarView.Delegate[RoomMenuBarView.DefaultItems.MENU_EXIT] = "onToolbarExitClick";
		RoomMenuBarView.Delegate[RoomMenuBarView.DefaultItems.MENU_AI] = "onToolbarRobotClick";
		RoomMenuBarView.Delegate[RoomMenuBarView.DefaultItems.MENU_SETTING] = "onToolbarSettingClick";
		
	elseif (not hasQuKuan) and isSafeBoxSwitchOpen then
		local v = {
				key = "menu_qukuan",
				icon = "",									-- 菜单ICON图标
				callbackFunc = "onToolbarQuKuanClick", 		-- 系统默认
				isDefault = true,							-- 是否系统默认菜单
				sort = 5,
				action = "",
			};
		local menuItem = self:getDefaultMenuItem(v);
		if menuItem then 
			table.insert(self.m_btns,{v.key,menuItem,v.path});
			menuItem:setPos(0, 75 * self.m_menuItemCount );
			self.m_moreView:addChild(menuItem);
			if self.m_menuItemCount < #self.m_menuItemConfig then 
				local spliter = UIFactory.createImage("games/common/menuToolbar/more_split_line.png");
				spliter:setPos(0, 75 * self.m_menuItemCount );
				spliter:setAlign(kAlignTop);
				self.m_moreView:addChild(spliter);
			end
			self.m_menuItemCount = self.m_menuItemCount + 1;
		end
	end
	moreViewHeight = self.m_menuItemCount * 75;
	self.m_moreView:setSize(247, moreViewHeight);
	self.m_moreView:setPos(0, -moreViewHeight+15);

	local menu_view_config = table.verify(toolBarConfig.menu_view);
    self:_initMenuView(menu_view_config);

	local menu_btn_config = table.verify(toolBarConfig.menubtn_view);
	self:_initMenuBtnView(menu_btn_config);
end

--配置菜单弹框位置
RoomMenuBarView._initMenuView = function(self,menu_view_config)
	if not table.isEmpty(menu_view_config) then 
    	local menu_view = self:findViewById(self.m_ctrl.menu_view);

	    menu_view:setPos(menu_view_config.x,menu_view_config.y);
	    if menu_view_config.align then
	    	menu_view:setAlign(menu_view_config.align);
	    end
    end
end

--配置菜单按钮的位置
RoomMenuBarView._initMenuBtnView = function(self,menu_btn_config)
	if not table.isEmpty(menu_btn_config) then 
    	local menu_btn = self:findViewById(self.m_ctrl.menu_btn);

	    menu_btn:setPos(menu_btn_config.x);
	    if menu_btn_config.align then
	    	menu_btn:setAlign(menu_btn_config.align);
	    end
    end
end

RoomMenuBarView.getDefaultMenuItem = function ( self, item )
	-- body
	local itemName = item.key;
	local menuItem = nil;
	if itemName == RoomMenuBarView.DefaultItems.MENU_EXIT then 
		menuItem = self.m_exitBtn;
	elseif itemName == RoomMenuBarView.DefaultItems.MENU_AI then 
		menuItem = self.m_aiBtn;
	elseif itemName == RoomMenuBarView.DefaultItems.MENU_RECHARGE then 
		menuItem = self.m_rechargeBtn;
	elseif itemName == RoomMenuBarView.DefaultItems.MENU_SETTING then 
		menuItem = self.m_settingBtn;
	elseif itemName == RoomMenuBarView.DefaultItems.MENU_QUKUAN then 
		menuItem = self.m_qukuanBtn;
	end
	if menuItem then 
		menuItem:setVisible(true);
	end
	return menuItem;
end

RoomMenuBarView.createMenuItem = function ( self, item )
	local itemName = item.key;
	local button = UIFactory.createButton("isolater/bg_blank.png");
	button:setSize(210, 75);
	button:setAlign(kAlignTop);
	button:setName(itemName);
	button:setOnClick(self, self.onMenuClick);

	local iconImg = UIFactory.createImage(item.icon);
	iconImg:setName("btn_img");
	iconImg:setAlign(kAlignCenter);
	button:addChild(iconImg);

	return button;
end

RoomMenuBarView.onMenuClick = function ( self, finger_action, x, y, drawing_id_first, drawing_id_current)
	self:hideMoreView();

	local item = self:getMenuItemByDrawingId(drawing_id_current);
	if not item then 
		return;
	end
	local name = item:getName();
	local config = table.verify(self:getMenuItemConfig(name));
	if config and (not string.isEmpty(config.callbackFunc)) then 
		self:execDelegate(RoomMenuBarView.Delegate[name]);
	end

	if config and config.action then 
		MechineManage.getInstance():receiveAction(config.action);
	end
end

RoomMenuBarView.getMenuItemConfig = function ( self, itemName )
	-- body
	for k, v in ipairs(self.m_menuItemConfig or {}) do 
		if v.key == itemName then 
			return v;
		end
	end
end

RoomMenuBarView.getMenuItemByDrawingId = function ( self, drawingId )
	-- body
	local children = self.m_moreView:getChildren();
	for k, v in pairs(children or {}) do 
		if v.m_drawingID == drawingId then 
			return v;
		end
	end
	return nil;
end

RoomMenuBarView.hideMoreView = function (self)
	if self.m_isToolbarOpen then
        self:playToolBarTranslateAnim();
		DialogLogic.getInstance():popDialog();
    end
end

RoomMenuBarView.onShieldClick = function (self, finger_action, x, y, drawing_id_first, drawing_id_current)
	if finger_action == kFingerUp then
		self:hideMoreView();
	end
end

RoomMenuBarView.onMenuBtnClick = function (self)
	ReportIsolater.getInstance():report(UBConfig.kToolBarMenu, true, true)
	DialogLogic.getInstance():popDialog();
	self:playToolBarTranslateAnim();
end

-----------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------
RoomMenuBarView.playToolBarTranslateAnim = function(self)
    -- 在动画过程中不处理
    if self.isRoping then 
        return;
    end
    self.isRoping = true;
    self:findViewById(self.m_ctrl.menu_btn):setPickable(false);
    self.m_moreView:setVisible(true);

    if self.m_isToolbarOpen then
        self:slideUp();
    else
        self:slideDown();
    end
end

RoomMenuBarView.deleteToolbarTranslateAnim = function(self)
    if self.m_moreView and not self.m_moreView:checkAddProp(0) then
        self.m_moreView:removeProp(0);
    end
end

RoomMenuBarView.slideUp = function(self)
	self:hidQuKuanTipsAnim();
	if self.m_qukuanTips then
    	self.m_qukuanTips:setVisible(false);
    end
    local _,h = self.m_moreView:getSize();
    local _,anim = self.m_moreView:addPropTranslate(0,kAnimNormal,350,0,nil,nil,0,-h);
    if anim then
        anim:setDebugName("RoomMenuBarView|AnimInt|AnimY");
        anim:setEvent(nil,function()
            local _,y = self.m_moreView:getPos();
            self.m_moreView:setPos(nil,y-h);
            self:deleteToolbarTranslateAnim();
            self:onToolBarTranslateTimer();
        end)
    end
end

RoomMenuBarView.slideDown = function(self)
	-- DialogLogic.getInstance():popDialog();
	DialogLogic.getInstance():pushDialogStack(self,self.hideMoreView);
    self.isRoping = true;
    self:findViewById(self.m_ctrl.menu_btn):setVisible(self.m_isToolbarOpen);
    local _,h = self.m_moreView:getSize();
    local _,anim = self.m_moreView:addPropTranslate(0,kAnimNormal,350,0,nil,nil,0,h);
    if anim then
        anim:setDebugName("RoomMenuBarView|AnimInt|AnimY");
        anim:setEvent(nil,function()
            local _,y = self.m_moreView:getPos();
            self.m_moreView:setPos(nil,y+h);
            self:deleteToolbarTranslateAnim();
            self:onToolBarTranslateTimer();
            self:checkQuKuanTips();
        end)
    end
end

RoomMenuBarView.onToolBarTranslateTimer = function(self)
    self.isRoping = false;
    self:findViewById(self.m_ctrl.menu_btn):setVisible(self.m_isToolbarOpen);
    self.m_isToolbarOpen = not self.m_isToolbarOpen;
    self.m_moreView:setVisible(self.m_isToolbarOpen);
    self.m_shield:setVisible(self.m_isToolbarOpen);
    self:findViewById(self.m_ctrl.menu_btn):setPickable(true);
end
-----------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------

RoomMenuBarView.onExitBtnClick = function (self)
	-- body
	ReportIsolater.getInstance():report(UBConfig.kToolBarQuit, true, true)
	self:hideMoreView();
	-- self:execDelegate(RoomMenuBarView.Delegate.onExitBtnClick);
	self:execDelegate(RoomMenuBarView.Delegate["menu_exit"]);
end

RoomMenuBarView.onSettingBtnClick = function (self)
	-- body
	ReportIsolater.getInstance():report(UBConfig.kToolBarSetting, true, true)
	self:hideMoreView();
	self:showSettingWindow();

	self:execDelegate(RoomMenuBarView.Delegate["menu_setting"]);
end

RoomMenuBarView.onAiBtnClick = function (self)
	-- body
	self:hideMoreView();
    ReportIsolater.getInstance():report(UBConfig.kToolBarRobot, true, true)

    if self.m_mainState ~= GameMechineConfig.STATUS_PLAYING then 
    	self:showToast("牌局未开始不能托管！");
    	return;
    end

	local param = {};
	param.ai = self.m_isAi and 0 or 1;
	-- SocketIsolater.getInstance():sendMsg(DDZSocketCmd.ROOM_SEND_AI, param);
	SocketIsolater.getInstance():sendMsg(self.m_aiCommand, param);

	self:execDelegate(RoomMenuBarView.Delegate["menu_ai"]);
end

RoomMenuBarView.onShopBtnClick = function (self)
	ReportIsolater.getInstance():report(UBConfig.kToolBarMall, true, true)
	self:hideMoreView();
	-- if self.m_mainState == GameMechineConfig.STATUS_PLAYING then
	-- 	self:showToast("正在游戏，请游戏结束后购买！");
	-- 	return;
	-- end
	PayIsolater.getInstance():setSceneType(PayIsolater.eGoodsListId.RoomPay);
	UBReport.getInstance():report(UBConfig.kToolBarShopClick);
	local data = {};
	data.scene = PayIsolater.eGoodsListId.RoomPay;
	data.isOnlySupportSMS = true;
	local action = GameMechineConfig.ACTION_RECHARGE;
	MechineManage.getInstance():receiveAction(action,data);

	self:execDelegate(RoomMenuBarView.Delegate["menu_recharge"]);
end

-- 保险箱取款
RoomMenuBarView.onQuKuanBtnClick = function (self)
	self:hideMoreView();
	ReportIsolater.getInstance():report(UBConfig.kToolBarQuKuan, true, true)

	local action = GameMechineConfig.ACTION_NS_CREATVIEW;
 	local data = {viewName = GameMechineConfig.VIEW_SAFEBOX}
	MechineManage.getInstance():receiveAction(action,data);
	
	local action = GameMechineConfig.ACTION_NS_OPEN_SAFEBOX;
	local moneyType = RoomPropertyData.getInstance():getCurPropertyId();
	MechineManage.getInstance():receiveAction(action, moneyType);

end

--弹出设置窗口
RoomMenuBarView.showSettingWindow = function(self)
	local action = GameMechineConfig.ACTION_NS_CREATVIEW;
 	local data = {viewName = GameMechineConfig.VIEW_SETTING}
	MechineManage.getInstance():receiveAction(action,data);

	local action = GameMechineConfig.ACTION_NS_OPEN_SETTING;
	MechineManage.getInstance():receiveAction(action);
end


--游戏可重载该方法、不同的游戏设置不同的图片
RoomMenuBarView.getSliderDefaultImgs = function(self)
	return {
		"isolater/progress_bg_l15_r15_t15_b15.png",
		"isolater/progress_fg_l15_r15_t15_b15.png",
		"isolater/progress_btn.png"
	};
end

--游戏可重载该方法、不同的游戏设置不同的图片
RoomMenuBarView.getCheckBoxDefaultImgs = function(self)
	return {
		"isolater/checkbox_uncheck.png","isolater/checkbox_checked.png"
	};
end

RoomMenuBarView.setCtrlEnable = function (self, key, isEnable)
	-- body
	local ctrl, file = nil;
	if key == "ai" then
		ctrl = self:findViewById(self.m_ctrl.ai_btn);
		file = string.format("games/common/menuToolbar/%s.png", isEnable and "ai_btn" or "ai_btn_grey");
	elseif key == "shop" then
		ctrl = self:findViewById(self.m_ctrl.shop_btn);
		file = string.format("games/common/menuToolbar/%s.png", isEnable and "shop_btn" or "shop_btn_grey");
	elseif key == "qukuan" then
		ctrl = self:findViewById(self.m_ctrl.qukuan_btn);
		file = string.format("games/common/menuToolbar/%s.png", isEnable and "qukuan_btn" or "qukuan_btn_grey");
	elseif key == "exit" then
		ctrl = self:findViewById(self.m_ctrl.exit_btn);

		if GameInfoIsolater.getInstance():isInMatchRoom() then 
			isEnable = false;
		end
		file = string.format("games/common/menuToolbar/%s.png", isEnable and "exit_btn" or "exit_btn_grey");
	elseif key == "setting" then
		ctrl = self:findViewById(self.m_ctrl.setting_btn);
		file = string.format("games/common/menuToolbar/%s.png", isEnable and "setting_btn" or "setting_btn_grey");
	end
	if ctrl then
		ctrl:setEnable(isEnable);
		ctrl:setColor(255,255,255);
		local image = ctrl:getChildByName("btn_img");
		if image and file then
			image:setFile(file);
		end
	end
end

RoomMenuBarView.onGameStart = function (self)
	local info = {
		[1] = {key="menu_exit",enable=false};
		[2] = {key="menu_recharge",enable=false};
	};
	self:onMenuBtnEnable(nil,nil,info);
end

RoomMenuBarView.onGameOver = function ( self )
	self.m_isAi = false;
	local info = {
		[1] = {key="menu_exit",enable=true};
		[2] = {key="menu_recharge",enable=true};
		[3] = {key="menu_qukuan",enable=true};
		[4] = {key="menu_ai",enable=false};
	};
	self:onMenuBtnEnable(nil,nil,info);

	self:hideMoreView();
end

--刷新托管
RoomMenuBarView.refreshRobot = function(self, seat, uid, info, isFast)
	if info and info.isAi then
		self.m_isAi = (info.isAi == 1) and true or false;
		return;
	end
end

-- 取消托管
RoomMenuBarView.cancelAI = function(self, seat, uid, info, isFast)
	if self.m_aiBtn and self.m_aiBtn:getVisible() then
		local param = {};
		param.ai = 0;
		SocketIsolater.getInstance():sendMsg(self.m_aiCommand, param);
	end
end

-- 校验是否显示取款提示
RoomMenuBarView.checkQuKuanTips = function(self)
	local hasShow = GameCommonData.getInstance():getShowqukuanTips();
    if hasShow == 1 then
    	return;
    end
	if self.m_qukuanBtn:getVisible() then
		if self.m_qukuanTips then
			self.m_qukuanBtn:removeChild(self.m_qukuanTips,true);
			delete(self.m_qukuanTips);
			self.m_qukuanTips = nil;
		end
		local x, y = self.m_qukuanBtn:getAbsolutePos();
		self.m_qukuanTips = UIFactory.createImage("games/common/menuToolbar/qukuan_tips.png");
		local w = self.m_qukuanTips:getSize();
		self.m_qukuanBtn:addChild(self.m_qukuanTips);
		self.m_qukuanTips:setPos(- (w + 10));
		self:startQuKuanTipsAnim();
		GameCommonData.getInstance():setShowqukuanTips(1);
		GameCommonData.getInstance():saveData();
	end
end

-- 5s后隐藏取款提示的tips
RoomMenuBarView.startQuKuanTipsAnim = function(self)
	self:stopQuKuanTipsAnim();
	self.m_QukuanAnimInt = AnimFactory.createAnimInt(kAnimNormal, 0, 0, 5000, -1);
    self.m_QukuanAnimInt:setDebugName("RoomMenuBarView.quKuanTipsAnim");
    self.m_QukuanAnimInt:setEvent(nil, function ( ... )
        if self.m_qukuanTips then
        	self.m_qukuanTips:setVisible(false);
        end
    end);
end

RoomMenuBarView.stopQuKuanTipsAnim = function(self)
	delete(self.m_QukuanAnimInt);
	self.m_QukuanAnimInt = nil;
end

RoomMenuBarView.hidQuKuanTipsAnim = function(self)
	self:stopQuKuanTipsAnim();
	if self.m_qukuanTips then
    	self.m_qukuanTips:setVisible(false);
    end
end

RoomMenuBarView.onGameReady = function(self)
	local info = {
		[1] = {key="menu_qukuan",enable=false};
	};
	self:onMenuBtnEnable(nil,nil,info);
end

--[[
	菜单按钮是否可以点击 exp:	
	local info = {
		[1] = {key="menu_setting",enable=false};
		[2] = {key="menu_exit",enable=true};
	};
]]
RoomMenuBarView.onMenuBtnEnable = function(self, seat, uid, info, isFast)
	if table.isTable(info) then
		for _,val in pairs(info) do
			if val.key and val.enable ~= nil then
				for k, v in pairs(self.m_btns) do
					local key = v[1];
					local btn = v[2];
					local iconPath = v[3];
					if key == val.key and btn then
						iconPath = iconPath or "games/common/menuToolbar/menu/%s.png";
						local file = string.format(iconPath, val.enable and key or (key .. "_grey"));
						btn:setEnable(val.enable);
						btn:setColor(255,255,255);
						local image = btn:getChildByName("btn_img");
						if image and file then
							image:setFile(file);
						end
					end	
				end
			end
		end
	end
end

-- 登出或登录成功时，重置默认按钮可点击状态
RoomMenuBarView.onResetBtnEnableState = function(self)
	self.m_isAi = false;
	local info = {
		[1] = {key="menu_qukuan",enable=true};
		[2] = {key="menu_exit",enable=true};
		[3] = {key="menu_setting",enable=true};
		[4] = {key="menu_ai",enable=false};
		[5] = {key="menu_recharge",enable=true};
	};
	self:onMenuBtnEnable(nil,nil,info);
end

RoomMenuBarView.onRefreshPrivateRoom = function(self)
	if PrivateRoomIsolater.getInstance():isInJiFenRoom() then
		local isReInit = false;
		for k,v in pairs(self.m_btns) do 
			if v[1] == "menu_recharge" or v[1] == "menu_qukuan" then 
				isReInit = true;
				break;
			end 
		end
		if isReInit then 
			local data = {};
			for k,v in pairs(self.m_btns) do
				local key = v[1];
				local btn = v[2];
				local tmp = {};
				tmp.key = v[1];
				tmp.enable = btn:getEnable();
				table.insert(data,tmp);
			end  
			self:init();
			self:onMenuBtnEnable(nil,nil,data);
		end 		
	end 
end 

RoomMenuBarView.execDelegate = function(self,func,...)
	if not self.m_delegate then 
		return;
	end
    if self.m_delegate[func] then
        return self.m_delegate[func](self.m_delegate,...);
    else 
    	return self.m_delegate["onMenuClick"](self.m_delegate, func, ...);
    end
end

RoomMenuBarView.s_controlConfig =
{
	[RoomMenuBarView.s_controls.shield]				= {"shield"};
	[RoomMenuBarView.s_controls.menu_btn]			= {"menu_view","menu_btn"};
	[RoomMenuBarView.s_controls.more_view]			= {"menu_view","more_view"};
	[RoomMenuBarView.s_controls.more_bg]			= {"menu_view","more_view", "bg"};
	[RoomMenuBarView.s_controls.exit_btn]			= {"menu_view","more_view","exit_btn"};
	[RoomMenuBarView.s_controls.setting_btn]		= {"menu_view","more_view","setting_btn"};
	[RoomMenuBarView.s_controls.ai_btn]				= {"menu_view","more_view","ai_btn"};
	[RoomMenuBarView.s_controls.shop_btn]			= {"menu_view","more_view","shop_btn"};
	[RoomMenuBarView.s_controls.qukuan_btn]			= {"menu_view","more_view","qukuan_btn"};
	[RoomMenuBarView.s_controls.menu_view]			= {"menu_view"};
};

RoomMenuBarView.s_controlFuncMap =
{
	[RoomMenuBarView.s_controls.shield]			= RoomMenuBarView.onShieldClick;
	[RoomMenuBarView.s_controls.menu_btn]		= RoomMenuBarView.onMenuBtnClick;
	[RoomMenuBarView.s_controls.exit_btn]		= RoomMenuBarView.onExitBtnClick;
	[RoomMenuBarView.s_controls.setting_btn]	= RoomMenuBarView.onSettingBtnClick;
	[RoomMenuBarView.s_controls.ai_btn]			= RoomMenuBarView.onAiBtnClick;
	[RoomMenuBarView.s_controls.shop_btn]		= RoomMenuBarView.onShopBtnClick;
	[RoomMenuBarView.s_controls.qukuan_btn]		= RoomMenuBarView.onQuKuanBtnClick;
};

RoomMenuBarView.s_actionFuncMap = {
	[GameMechineConfig.ACTION_NS_CANCEL_AI]          			= "cancelAI";
	[GameMechineConfig.ACTION_NS_ROBOT]							= "refreshRobot";
	[GameMechineConfig.ACTION_NS_MENUBAR_BTN_ENABLE]			= "onMenuBtnEnable";
	[GameMechineConfig.ACTION_NS_REFRESH_PRIVATE_ROOM]			= "onRefreshPrivateRoom";
}
RoomMenuBarView.s_stateFuncMap = {
	[GameMechineConfig.STATUS_READY]					= "onGameReady";
	[GameMechineConfig.STATUS_START]					= "onGameStart";
    [GameMechineConfig.STATUS_GAMEOVER]					= "onGameOver";
    [GameMechineConfig.STATUS_LOGIN]					= "onResetBtnEnableState";
    [GameMechineConfig.STATUS_LOGOUT]					= "onResetBtnEnableState";
};

return RoomMenuBarView;
