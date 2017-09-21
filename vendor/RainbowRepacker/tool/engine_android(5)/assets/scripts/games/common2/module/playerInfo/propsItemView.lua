
------------------- PropsItemView  --------------------------
--[Comment]
--道具图标
local PropsItemView = class(CommonGameLayer, false);

PropsItemView.s_controls = {
	btnProp 	= 1,
	imgProp 	= 2,
	txtPropNum 	= 3,
	btnTop		= 4,
	imgFrame	= 5,
}

--[Comment]
--道具图标构造函数
PropsItemView.ctor = function(self, data)
	local room_player_info_prop = require("view/kScreen_1280_800/games/common2/room_player_info_prop");
	super(self,room_player_info_prop);
	if not data then return; end
	self.m_ctrls = PropsItemView.s_controls;
	self.m_data = data;
	self:initViews();
end
--[Comment]
--初始化道具图标
PropsItemView.initViews = function ( self )
	-- body
	self.m_btnTop = self:findViewById(self.m_ctrls.btnTop);				-- 道具透明按钮
	self.m_btnProp = self:findViewById(self.m_ctrls.btnProp);			-- 道具按钮
	self.m_imgProp = self:findViewById(self.m_ctrls.imgProp);			-- 道具图标
	self.m_txtPropNum = self:findViewById(self.m_ctrls.txtPropNum);		-- 道具数量
	self.m_imgFrame = self:findViewById(self.m_ctrls.imgFrame);			-- 道具品质框
	-- 启用/禁用道具按钮
	local isExpire = (self.m_data.allowTimes > 0);
	self.m_btnProp:setEnable(isExpire);
	self.m_btnTop:setVisible(not isExpire);
	-- 获取道具信息
	local config = PropIsolater.getInstance():getGoodInfoByTypeId(self.m_data.type);
	if config then 
		ImageCache.getInstance():request(config.item_icon, self, self.onFinishLoadIcon);	-- 下载道具图标
	end
	-- 道具数量超过99显示99+
	self.m_txtPropNum:setText((self.m_data.allowTimes > 99) and "99+" or self.m_data.allowTimes);
end
--[Comment]
--下载道具图标回调
--更新道具Icon
--url:下载地址
--filename:本地文件地址
PropsItemView.onFinishLoadIcon = function (self, url, filename)
	if self.m_imgProp then
		self.m_imgProp:setFile(filename);
	end
end
--[Comment]
--道具按钮点击事件
PropsItemView.onBtnPropClick = function ( self, finger_action, x, y, drawing_id_first, drawing_id_current )
	-- body
	Log.v("c.mj -->> use props", self.m_data);

	if drawing_id_current ~= drawing_id_first then 
		return;
	end
	if finger_action == kFingerUp then 
		local cmd = RoomPropsLogic.propCmds.PROPS_NORMAL;
		if self.m_data.allowTimes == 0 then 
			self.m_btnProp:setEnable(false);
			cmd = RoomPropsLogic.propCmds.PROPS_NO_ENOUGH;		-- 道具不足
		-- elseif not kPropManager:isExpire(self.m_data.type) then
		-- 	self.m_btnProp:setEnable(false);
		-- 	cmd = RoomPropsLogic.propCmds.PROPS_OUTDATE		-- 道具过期
		else 
			cmd = RoomPropsLogic.propCmds.PROPS_NORMAL;		-- 正常使用道具
		end
		PlayerInfoLogic.getInstance():onUsePropsEvent(cmd, self.m_data);
	elseif finger_action == kFingerDown then
		return;
	elseif finger_action == kFingerCancel then
	elseif finger_action == kFingerMove then
	end
end

PropsItemView.s_controlConfig = { 
	[PropsItemView.s_controls.imgFrame]		= {"imgFrame"},
	[PropsItemView.s_controls.btnTop]		= {"imgFrame", "btnTop"},
	[PropsItemView.s_controls.btnProp]		= {"imgFrame", "btnProp"},
	[PropsItemView.s_controls.imgProp]		= {"imgFrame", "btnProp", "imgProp"},
	[PropsItemView.s_controls.txtPropNum]	= {"imgFrame", "btnProp", "imgDot", "txtPropNum"},
}

PropsItemView.s_controlFuncMap = { 
	[PropsItemView.s_controls.btnTop]		= PropsItemView.onBtnPropClick;
	[PropsItemView.s_controls.btnProp]		= PropsItemView.onBtnPropClick;
}

return PropsItemView;