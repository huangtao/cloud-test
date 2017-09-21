
--[[
	牌局任务
]]


local ViewBase = require("games/common2/module/viewBase");
local GameMissionView2 = class(ViewBase, false);

GameMissionView2.s_controls ={
	messageTxt 		= ToolKit.getIndex(),
	mainBg 			= ToolKit.getIndex(),
	boxTxt 			= ToolKit.getIndex(),
	flag 			= ToolKit.getIndex(),
	taskMsgTxt		= ToolKit.getIndex(),
	boxOtherTxt 	= ToolKit.getIndex(),
};

GameMissionView2.ctor = function(self,seat,layout)
	super(self, layout);
	self:setFillParent(true,true);
	self.mainBg = self:findViewById(self.s_controls.mainBg);
	self.boxTxt = self:findViewById(self.s_controls.boxTxt);
	self.flag = self:findViewById(self.s_controls.flag);
	self.taskMsgTxt = self:findViewById(self.s_controls.taskMsgTxt);
	self.boxOtherTxt = self:findViewById(self.s_controls.boxOtherTxt);
	self.m_seat = seat;
	self.messageTxt = self:findViewById(self.s_controls.messageTxt);
	self:setVisible(false);
	self.m_hidden = false;
	self.isMission = false;
end

GameMissionView2.dtor = function(self)
	self:removeAllChildren();
end

GameMissionView2.parseConfig = function(self, config)
    self.mainBg:setPos(config.x,config.y);
    -- self:setAlign(config.align);
end

GameMissionView2.hiddenLayer = function(self)
	self.m_hidden = true;
	if self.isMission then
		self.isMission = false;
	end
end

GameMissionView2.hiddenAll = function(self)
	self.m_hidden = true;
	self:setVisible(false);
end

GameMissionView2.updateTaskData = function(self, info, isFlag)
	if self.m_hidden then
		return;
	end

	if info.type then
		self:setVisible(false);
		self.isMission = true;
		-- info.type = 0;
		self.type = info.type;
		if info.type ~= 0 then
			local msg = "";
			local conn = "特殊任务";
			local taskMsg = "";
			if isFlag then
				self.flag:setVisible(true);
			end
			if not table.isTable(info) then
				Log.e("GameMissionView2.updateTaskData" , "网络数据格式错误");
			end
			if info.times then
				msg = string.concat(msg, conn);
			end
			if self.messageTxt then
				self.messageTxt:setText(msg);
				self.messageTxt:setVisible(true);
			end
			if self.taskMsgTxt then
				self.taskMsgTxt:setText(taskMsg);
				self.taskMsgTxt:setVisible(true);
			end
			if self.boxOtherTxt then
				self.boxOtherTxt:setVisible(false);
			end
			if self.boxTxt then
				self.boxTxt:setVisible(true);
			end
			if self.flag then
				self.flag:setVisible(false);
			end
		end
	end
end

GameMissionView2.updateBoxData = function(self, info)
	if self.m_hidden then
		return;
	end
	self:setVisible(false);

	self.totalPro = info.totalPro or 0;
	self.currentPro = info.currentPro or 0;
	local num = self.totalPro - self.currentPro;
	if num > 0 then
		self.boxOtherTxt:setText("再玩"..num.."局即可获得宝箱");
		self.boxTxt:setText("再玩"..num.."局即可获得宝箱");
	else
		self.boxOtherTxt:setText("领取奖励");
		self.boxTxt:setText("领取奖励");
	end

    if self.totalPro == 0 then
        self.boxOtherTxt:setText(kTextLoading);
		self.boxTxt:setText(kTextLoading);
    end

	if self.isMission == false then
		if self.boxOtherTxt then
			self.boxOtherTxt:setVisible(true);
		end
		if self.boxTxt then
			self.boxTxt:setVisible(false);
		end
		if self.messageTxt then
			self.messageTxt:setVisible(false);
		end
		if self.taskMsgTxt then
			self.taskMsgTxt:setVisible(false);
		end
	else
		if self.type then
			if self.type == 0 then
				if self.boxOtherTxt then
					self.boxOtherTxt:setVisible(true);
				end
				if self.boxTxt then
					self.boxTxt:setVisible(false);
				end
			end
		end
		self:setVisible(false);
	end
end

GameMissionView2.onRefreshBoxTaskInfo = function(self,seat,uid,info,isFast)
	Log.d("GameMissionView2.onRefreshBoxTaskInfo",info);
	if info.state == 2 then 
        -- 自动到php拉奖励
      	-- self.m_isBoxDone = true;
      	self:updateBoxData(info);
		RoomTaskLogic.getInstance():requestRoomBoxReward();
    elseif info.state == 3 then 
    	---实际意领取，播放下领取动画
    	if info and info.prize then 
    		-- self:showRoomBoxView(data);
    		local action = GameMechineConfig.ACTION_NS_CREATVIEW;
			local data = {viewName = GameMechineConfig.VIEW_BOXVIEW}
		   	MechineManage.getInstance():receiveAction(action,data);

		   	action = GameMechineConfig.ACTION_NS_SHOWBOXVIEW;
		   	MechineManage.getInstance():receiveAction(action,info);

			RoomTaskLogic.getInstance():requestRoomBaxTaskInfo();
       	    -- self.m_isBoxDone = false;
      	end   
    else 
        --广播显示进度
        self:updateBoxData(info);
    end
end

GameMissionView2.onGetTaskInfo = function(self,seat,uid,info,isFast)
	self:updateTaskData(info,false);
end

-- 请求任务信息
GameMissionView2.requestRoomBaxTaskInfo = function(self,seat,uid,info,isFast)
	RoomTaskLogic.getInstance():requestRoomBaxTaskInfo();
end

GameMissionView2.s_controlConfig =
{
	[GameMissionView2.s_controls.mainBg]	 		= {"main_bg"},
	[GameMissionView2.s_controls.messageTxt] 		= {"main_bg","messageTxt"},
	[GameMissionView2.s_controls.boxTxt]			= {"main_bg","boxTxt"},
	[GameMissionView2.s_controls.flag]		 		= {"main_bg","flag"},
	[GameMissionView2.s_controls.taskMsgTxt] 		= {"main_bg","taskMsgTxt"},
	[GameMissionView2.s_controls.boxOtherTxt]		= {"main_bg","boxOtherTxt"},
};

GameMissionView2.s_actionFuncMap = {
	[GameMechineConfig.ACTION_REFRESH_BOX_TASK_INFO]    = "onRefreshBoxTaskInfo";
	[GameMechineConfig.ACTION_GETTASK]          		= "onGetTaskInfo";  
	[GameMechineConfig.ACTION_COMPLETASK]          		= "onGetTaskInfo"; 
};

GameMissionView2.s_stateFuncMap = {
	[GameMechineConfig.STATUS_GAMEOVER]          		="requestRoomBaxTaskInfo";
};

return GameMissionView2;