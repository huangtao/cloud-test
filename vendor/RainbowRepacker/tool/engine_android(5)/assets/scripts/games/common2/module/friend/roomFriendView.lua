


local ViewBase = require("games/common2/module/viewBase");

local RoomFriendView = class(ViewBase, false);

RoomFriendView.Delegate = {
};

RoomFriendView.s_cmds = {
};


RoomFriendView.ctor = function(self,seat,viewConfig)
	super(self);
	self.m_seat = seat;
    self:setFillParent(true,true);
end 

RoomFriendView.dtor = function(self)
	delete(self.m_friendApplyWnd);
	self.m_friendApplyWnd = nil;
end

RoomFriendView.parseConfig = function ( self, config )
	if table.isEmpty(config) then 
		return; 
	end
	self.m_viewConfig = config;
end
----------------------------------------------------------------------------

-- 加好友弹框
RoomFriendView.onPlayFriendApply = function(self, seat,uid,info,isFast)
	Log.d("RoomFriendView.onPlayFriendApply")
	if info.ducid ~= UserBaseInfoIsolater.getInstance():getUserCid() then --不是请求加我为好友则不必弹框
		return;
	end 
	if self.m_isShowfriendApplyWnd then
		Log.d("RoomFriendView.onPlayFriendApply","压入堆栈")
		--如果存在，则加入栈中
		self.m_applyMeStack = table.verify(self.m_applyMeStack);
		table.insert(self.m_applyMeStack,info);
	else
		Log.d("RoomFriendView.onPlayFriendApply","显示加好友")
		self:_showFriendApplyWnd(info);
	end
end

RoomFriendView._showFriendApplyWnd = function(self, data)
	Log.d("RoomFriendView._showFriendApplyWnd")
	self:_createFriendApplyWnd();
	if self.m_friendApplyWnd then 
		self.m_isShowfriendApplyWnd = true;
		self.m_friendApplyWnd:show(data);
	end 	
end

RoomFriendView._createFriendApplyWnd = function(self)
	if not self.m_friendApplyWnd then
		local popupWnd;
		if self.m_viewConfig then 
			local viewConfig = self.m_viewConfig;
			if viewConfig.path and viewConfig.viewLayer and viewConfig.viewConfig then
				local className = Import(viewConfig.path);
				Import(viewConfig.viewLayer);
				local popupWnd = new(className,_G[viewConfig.viewConfig]);
				if viewConfig.pos and viewConfig.pos.x and viewConfig.pos.y then
					popupWnd:setPos(viewConfig.pos.x,viewConfig.pos.y);
				end	
				popupWnd:setAlign(viewConfig.align);
				if viewConfig.config then
					popupWnd:parseConfig(viewConfig.config);
				end
			end 
		end 
		if not popupWnd then
			popupWnd = RoomFriendConfig.getFriendApplyWnd();
		end 
		if popupWnd and typeof(popupWnd,DrawingBase) then
			self.m_friendApplyWnd = popupWnd;	
			self.m_friendApplyWnd:setDelegate(self);
			self:addChild(self.m_friendApplyWnd);		
	   end	   
	end 
end

--@delegate
RoomFriendView.onCloseFriendApplyWnd = function(self)
	self.m_isShowfriendApplyWnd = false;
	if self.m_applyMeStack and #self.m_applyMeStack > 0 then
		Log.d("RoomFriendView.onCloseFriendApplyWnd","显示下一条加好友")
		local data = self.m_applyMeStack[1];
		table.remove(self.m_applyMeStack,1);
		self:_showFriendApplyWnd(data);
	end
end

RoomFriendView.onDealFriendApply = function ( self, data, mtype)
	CommunityLogic.getInstance():requestHandleAddFriendMessage(data, mtype);
end

-------------------------------------------------------------------------------------------------------
RoomFriendView._showToast = function(self,msg)
	if msg and msg ~= "" then 
		Toast.getInstance():showText(msg,50,30,kAlignLeft,"",24,200,175,110);
	end 
end

RoomFriendView.execDelegate = function(self,func,...)
    if self.m_delegate and self.m_delegate[func] then
        return self.m_delegate[func](self.m_delegate,...);
    end
end

RoomFriendView.s_cmdConfig = 
{
};

RoomFriendView.s_actionFuncMap = {
	[GameMechineConfig.ACTION_NS_FRIENDAPPLY] 		= "onPlayFriendApply";
};

return RoomFriendView;