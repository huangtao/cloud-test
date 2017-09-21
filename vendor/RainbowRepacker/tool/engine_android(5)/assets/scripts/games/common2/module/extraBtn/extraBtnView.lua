

--[[
	用于创建扩展按钮区域
]]

local viewBase = require("games/common2/module/viewBase");

local ExtraBtnView = class(viewBase, false);

ExtraBtnView.ctor = function(self,seat)
    super(self);
    self.m_seat = seat;
end

ExtraBtnView.parseConfig = function(self, info)
	if info then
	    self.m_direction = info.direction;
	    self.m_rx = info.x;
	    self.m_ry = info.y;
	    self.m_ralign = info.align;
	    local btnTmpConfig = Copy(info.config);
	    self.m_btnConfig = {};
	    for k,v in pairs(btnTmpConfig) do
	    	v.name = k;
	    	if v.isShow then
	    		table.insert(self.m_btnConfig, v);
	    	end
	    end
	    table.sort(self.m_btnConfig, function(a,b)
	    	return a.index < b.index;
	    end);
	    self.m_btnMap = {};
	    self.m_btnDotMap = {};
	    self:initView();
	    self:setPos(self.m_rx, self.m_ry);
	    self:setAlign(self.m_ralign);
	    Log.d("-----------");
	end
end

ExtraBtnView.dtor = function(self)
end

ExtraBtnView.initView = function(self)
	self:removeAllChildren(true);
	local align = kAlignTop;
	local x,y = 0,0;
	if self.m_direction == kHorizontal then
		align = kAlignLeft;
	end
	local rW,rH = 0,0;
	for k,v in pairs(self.m_btnConfig) do
		if GameInfoIsolater.getInstance():checkIsDuringDefenseCheatTime() then
			if v.name == "chat" then
	    		v.isShow = false;
	    	end
	    end
		if v.isShow == true then
			local btn = self:createView(v);
			if btn then
				self:addChild(btn);
				local w,h = btn:getSize();
				btn:setPos(x,y);
				btn:setAlign(align);
				if self.m_direction == kHorizontal then
					x = x + w;
					rW = rW + w;
					rH = h > rH and h or rH;
				elseif self.m_direction == kVertical then
					y = y + h
					rH = rH + h;
					rW = w > rW and w or rW;
					y = y + 15;
				end
			end
		end 
	end
	
    self:setBtnDotVisible("recharge", not GameInfoIsolater.getInstance():hasClickRoomRecharge());
	self:setSize(rW,rH);
	self:initExtraBtnListener();
end

	-- ["chat"] = { index = 2 , isShow = true, file = ""};
	-- ["help"] = 3;
	-- ["switch"] = 4;
	-- ["recharge"] = 1;
	-- ["share"] = 1;
ExtraBtnView.createView = function(self, data)
	-- body
	local file = "";
	local func = nil;
	if data.name == "chat" then
		file = "games/common/btn_chat.png";
		func = self.onChatBtnClick;
	elseif data.name == "help" then
		file = "games/common/tip_btn.png";
		func = self.onHelpBtnClick;
	elseif data.name == "switch" then
		file = "games/common/card_face_change.png";
		func = self.onSwitchBtnClick;
	elseif data.name == "recharge" then
		file = "games/common/room_recharge.png";
		func = self.onRechargeBtnClick;
	elseif data.name == "share" then
		func = self.onShareBtnClick;
	elseif data.name == "freeroom_task" then
		file = "games/common/roomTask/freeroom/task_icon.png";
		func = self.onFreeroomTaskBtnClick;
	elseif data.name == "silver_task" then 
		 file = "games/common/roomTask/silverroom/silver_icon.png";
		 func = self.onSilverroomTaskBtnClick;
	end
	if not string.isEmpty(data.file) then
		file = data.file;
	end

	if string.isEmpty(file) then
		return nil;
	end
	local btn = UIFactory.createButton(file);
	if btn then
		btn:setOnClick(self, func);
		self.m_btnMap[data.name] = btn;
	end
	return btn;
end

ExtraBtnView.onChatBtnClick = function(self)
	if self.m_clickListener then
		self.m_clickListener.onChatBtnClick(self);
	end
end

ExtraBtnView.onHelpBtnClick = function(self)
	if self.m_clickListener then
		self.m_clickListener.onHelpBtnClick(self);
	end
end

ExtraBtnView.onSwitchBtnClick = function(self)
	if self.m_clickListener then
		self.m_clickListener.onSwitchBtnClick(self);
	end
end

ExtraBtnView.onRechargeBtnClick = function(self)
	if self.m_clickListener then
		self.m_clickListener.onRechargeBtnClick(self);
	end
end

ExtraBtnView.onShareBtnClick = function(self)
	if self.m_clickListener then
		self.m_clickListener.onShareBtnClick(self);
	end
end

ExtraBtnView.onFreeroomTaskBtnClick = function ( self )
	if self.m_clickListener then 
		self.m_clickListener.onFreeroomTaskBtnClick(self);
	end
end

ExtraBtnView.onSilverroomTaskBtnClick = function (self)
	if self.m_clickListener then 
		self.m_clickListener.onSilverroomTaskBtnClick();
	end
end

-- 设置监听类
ExtraBtnView.setOnClickListener = function(self, listener)
	self.m_clickListener = listener;
end


ExtraBtnView.initExtraBtnListener = function(self)
	--定义监听事件
	local listener = require("games/common2/module/extraBtn/extraBtnListener");
	local extraBtnListener = new(listener);
	
	extraBtnListener.onChatBtnClick = function(obj)
	    -- self:onExtraChatBtnClick();
	    MechineManage.getInstance():receiveAction(GameMechineConfig.ACTION_NS_CLICKACHAT);
	end
	
	extraBtnListener.onHelpBtnClick = function(obj)
		-- self:onExtraHelpBtnClick();
		MechineManage.getInstance():receiveAction(GameMechineConfig.ACTION_NS_EXTRAHELP);
	end
	
	extraBtnListener.onSwitchBtnClick = function(obj)
		-- self:onExtraSwitchBtnClick();
		MechineManage.getInstance():receiveAction(GameMechineConfig.ACTION_NS_EXTRASWITCH);		
	end
	
	extraBtnListener.onRechargeBtnClick = function(obj)
		PayIsolater.getInstance():setSceneType(UBPaySceneConfig.kRoomTableRecharge);
		local data = {};
		if PayIsolater and PayIsolater.eGoodsListId and PayIsolater.eGoodsListId.RoomPay then
			data.scene = PayIsolater.eGoodsListId.RoomPay;
		end
		data.isOnlySupportSMS = true;
		local action = GameMechineConfig.ACTION_RECHARGE;
		MechineManage.getInstance():receiveAction(action,data);        
	end
	
	extraBtnListener.onShareBtnClick = function(obj)
		-- self:onExtraShareBtnClick();
		MechineManage.getInstance():receiveAction(GameMechineConfig.ACTION_NS_EXTRASHARE);
	end
	
	extraBtnListener.onFreeroomTaskBtnClick = function ( obj )
		
		-- FreeroomDataInterface.getInstance():requestToggleFreeroomTaskView(true);
	end
	
	extraBtnListener.onSilverroomTaskBtnClick = function ( self )
		
		-- SilverroomDataInterface2.getInstance():requestToggleSilverroomTaskView(true);
	end

	self:setOnClickListener(extraBtnListener);
end

--设置按钮隐藏与否
ExtraBtnView.setBtnVisible = function(self, key, visible)
	local btn = self.m_btnMap[key];
    if btn then
	    btn:setVisible(visible);
	    for k,v in pairs(self.m_btnConfig) do
            if key == v.name then
                v.isShow = visible;
            end
        end
        self:initView();
    end
end

--设置红点显示
ExtraBtnView.setBtnDotVisible = function(self, key, visible)
    local readDot = self.m_btnDotMap[key];
    local btn = self.m_btnMap[key];
    if not btn then
        delete(readDot);
        readDot = nil;
        return ;
    end
    if visible == true then
        if not readDot then
            readDot = UIFactory.createImage("isolater/new_msg_icon.png")
            btn:addChild(readDot);
            readDot:setAlign(kAlignTopRight);
        end
        readDot:setVisible(true);
        self.m_btnDotMap[key] = readDot;
    else
       if readDot then
            readDot:setVisible(false);
        end 
    end
end

-- 获取对应button
ExtraBtnView.getExtraBtn = function ( self, key )
	local btn = self.m_btnMap[key];
    if btn then
	    return btn;
    end
    return nil;
end


ExtraBtnView.s_actionFuncMap = {
};

return ExtraBtnView;