
local ViewBase = require("games/common2/module/viewBase");

local RoomTaskRewardView = class(ViewBase, false);

RoomTaskRewardView.Delegate = {
};

RoomTaskRewardView.s_cmds = {
};


RoomTaskRewardView.ctor = function(self,seat,viewConfig)
	super(self);
	self.m_seat = seat;
    self:setFillParent(true,true);
end 

RoomTaskRewardView.dtor = function(self)
end
----------------------------------------------------------------------------

-- 创建宝箱开启界面
RoomTaskRewardView.createRoomBoxesView = function(self)
	if self.m_roomBoxView then
		self:removeChild(self.m_roomBoxView);
		delete(self.m_roomBoxView);
		self.m_roomBoxView = nil;
	end

	local x,y = InteractionInfo.getInstance():getHeadAbsolutePos(PlayerSeat.getInstance():getMyLocalSeat());
	local boxsview = require("games/common2/module/roomtaskreward/widget/roomBoxesView");
	self.m_roomBoxView = new(boxsview);
	self.m_roomBoxView:setMinePos(x+100,y);
    self:addChild(self.m_roomBoxView);
    self.m_roomBoxView:setFillParent(true,true);
end

-- 显示宝箱奖励界面
RoomTaskRewardView.showRoomBoxView = function(self,seat,uid,info,isFast)
	self:createRoomBoxesView();
	self.m_roomBoxView:toCompleteState(info,GameInfoIsolater.getInstance():getCurGameId());
end

-- 打开宝箱奖励
RoomTaskRewardView.onShowBoxReward = function(self,seat,uid,info,isFast)
    if info and info.time and info.startx and info.starty and info.endx and info.endy
    	and info.ptype and info.prize then
    	if self.m_reward then
    		self:removeChild(self.m_reward);
    		delete(self.m_reward);
    		self.m_reward = nil;
    	end

    	local boxreward = require("games/common2/module/roomtaskreward/widget/roomBoxReward");
	    self.m_reward = new(boxreward,info.ptype,info.prize);
	    self:addChild(self.m_reward);
	    self.m_reward:play(info.time, info.startx, info.starty, info.endx, info.endy);
    end
end


RoomTaskRewardView.s_actionFuncMap = {
	[GameMechineConfig.ACTION_NS_SHOWBOXVIEW]          	= "showRoomBoxView"; 
	[GameMechineConfig.ACTION_NS_OPEN_BOX]          	= "onShowBoxReward"; 
};

return RoomTaskRewardView;