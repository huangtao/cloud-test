local ViewBase = require("games/common2/module/viewBase");

local MatchToolbarView = class(ViewBase,false);

local l_index = 0;
local getIndex = function ( ... )
	l_index = l_index + 1;
	return l_index;
end

MatchToolbarView.s_controls =
{
	shield 		= getIndex();
	menu_btn 	= getIndex();
	more_view 	= getIndex();
	exit_btn 	= getIndex();
	setting_btn	= getIndex();
	menu_view 	= getIndex();
};

MatchToolbarView.ctor = function (self, seat, layoutConfig)
	super(self, layoutConfig);
	self:setFillParent(true,true);
	self.m_ctrl = MatchToolbarView.s_controls;

	self:_init();

	CommonRoomTimer2.getInstance():addCallBack(self, self.onUpdateTime);
	EventDispatcher.getInstance():register(Event.Call,self,self.onNativeEvent);
    NativeEvent.getInstance():getBatteryLevel();
end

MatchToolbarView.dtor = function (self)
	CommonRoomTimer2.getInstance():clean(self);
	EventDispatcher.getInstance():unregister(Event.Call,self,self.onNativeEvent);
end

MatchToolbarView._init = function (self)
	self.m_shield = self:findViewById(self.m_ctrl.shield);
	self.m_moreView = self:findViewById(self.m_ctrl.more_view);

	if self.m_shield then
		self.m_shield:setVisible(false);
	end
	if self.m_moreView then
		self.m_moreView:setVisible(false);
	end
end

MatchToolbarView.parseConfig = function(self, config)
    config = table.verify(config);
    local menu_view_config = table.verify(config.menu_view);

    if not table.isEmpty(menu_view_config) then 
    	local menu_view = self:findViewById(self.m_ctrl.menu_view);

	    menu_view:setPos(menu_view_config.x,menu_view_config.y);
	    if menu_view_config.align then
	    	menu_view:setAlign(menu_view_config.align);
	    end
    end   

    self:_initMenuBtnView(config.menu_btn_config);
end

--配置菜单按钮的位置
MatchToolbarView._initMenuBtnView = function(self,menu_btn_config)
	if not table.isEmpty(menu_btn_config) then 
    	local menu_btn = self:findViewById(self.m_ctrl.menu_btn);

	    menu_btn:setPos(menu_btn_config.x,menu_btn_config.y);
	    if menu_btn_config.align then
	    	menu_btn:setAlign(menu_btn_config.align);
	    end
    end
end


MatchToolbarView.hideMoreView = function (self)
	if self.m_moreView then
		self.m_moreView:setVisible(true);

		self.m_moreView:removeProp(1);
		self.m_moreView:removeProp(2);

		local width, height = self.m_moreView:getSize();
		self.m_moreView:addPropTransparency(1,kAnimNormal,100,0,1,0);
		local lastAnim = self.m_moreView:addPropScale(2,kAnimNormal,100,0,1,0,1,0,kCenterXY,width,0);
		if lastAnim then
			lastAnim:setDebugName("MatchToolbarView|hideMoreView|lastAnim");
			lastAnim:setEvent(self, function ( ... )
				self.m_moreView:removeProp(1);
				self.m_moreView:removeProp(2);
				self.m_moreView:setVisible(false);
			end);
		else
			self.m_moreView:setVisible(false);
		end
	end
	if self.m_shield then
		self.m_shield:setVisible(false);
	end
end

MatchToolbarView.showMoreView = function (self)
	if self.m_moreView then
		self.m_moreView:setVisible(true);

		self.m_moreView:removeProp(1);
		self.m_moreView:removeProp(2);

		local width, height = self.m_moreView:getSize();
		self.m_moreView:addPropTransparency(1,kAnimNormal,100,0,0,1);
		local lastAnim = self.m_moreView:addPropScale(2,kAnimNormal,100,0,0,1,0,1,kCenterXY,width,0);
		if lastAnim then
			lastAnim:setDebugName("MatchToolbarView|hideMoreView|lastAnim");
			lastAnim:setEvent(self, function ( ... )
				self.m_moreView:removeProp(1);
				self.m_moreView:removeProp(2);
				self.m_moreView:setVisible(true);
			end);
		else
			self.m_moreView:setVisible(true);
		end
	end
	if self.m_shield then
		self.m_shield:setVisible(true);
	end
end

MatchToolbarView.onShieldClick = function (self, finger_action, x, y, drawing_id_first, drawing_id_current)
	if finger_action == kFingerUp then
		self:hideMoreView();
	end
end

MatchToolbarView.onMenuBtnClick = function (self)
	if self.m_moreView:getVisible() then
		self:hideMoreView();
	else
		self:showMoreView();
	end
end

MatchToolbarView.onExitBtnClick = function (self)
	self:hideMoreView();
end

MatchToolbarView.onSettingBtnClick = function (self)
	self:hideMoreView();

	self:_showSettingWindow();

end

--弹出设置窗口
MatchToolbarView._showSettingWindow = function(self)
	local action = GameMechineConfig.ACTION_NS_CREATVIEW;
 	local data = {viewName = GameMechineConfig.VIEW_SETTING}
	MechineManage.getInstance():receiveAction(action,data);

	local action = GameMechineConfig.ACTION_NS_OPEN_SETTING;
	MechineManage.getInstance():receiveAction(action);
end

MatchToolbarView.s_controlConfig =
{
	[MatchToolbarView.s_controls.shield]			= {"shield"};
	[MatchToolbarView.s_controls.menu_btn]			= {"menu_view","menu_btn"};
	[MatchToolbarView.s_controls.more_view]			= {"menu_view","more_view"};
	[MatchToolbarView.s_controls.exit_btn]			= {"menu_view","more_view","exit_btn"};
	[MatchToolbarView.s_controls.setting_btn]		= {"menu_view","more_view","setting_btn"};
	[MatchToolbarView.s_controls.menu_view]			= {"menu_view"};
};

MatchToolbarView.s_controlFuncMap =
{
	[MatchToolbarView.s_controls.shield]			= MatchToolbarView.onShieldClick;
	[MatchToolbarView.s_controls.menu_btn]			= MatchToolbarView.onMenuBtnClick;
	[MatchToolbarView.s_controls.exit_btn]			= MatchToolbarView.onExitBtnClick;
	[MatchToolbarView.s_controls.setting_btn]		= MatchToolbarView.onSettingBtnClick;
};

return MatchToolbarView;
