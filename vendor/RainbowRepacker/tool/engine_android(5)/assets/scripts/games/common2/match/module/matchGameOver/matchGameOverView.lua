
local ViewBase = require("games/common2/module/viewBase");

local MatchGameOverView = class(ViewBase, false);

--比赛简易结算框
MatchGameOverView.ctor = function ( self,seat,viewConfig)
	super(self, viewConfig);
	self:setFillParent(true, true);
	self.m_ctrls = MatchGameOverView.s_controls;
end
MatchGameOverView.dtor = function ( self )
	self.m_detailInfoData = nil;

	self:_stopDelayAnim();
	self:_stopShowDetailAnim();
	self:_stopDelayCloseAnim();
	self:_stopWaitTableAnim();
	GameTimer2.release("delay_close_matchGameOverView");
end
--------------------------------------------------------------------------
MatchGameOverView._startDelayCloseAnim = function ( self )
	self:_stopDelayCloseAnim();
	
	GameTimer2.startTimeOut("delay_close_matchGameOverView", self, self.closeMatchGameOver, 1000);
end

MatchGameOverView._stopDelayCloseAnim = function(self)
	GameTimer2.release("delay_close_matchGameOverView");
end
--------------------------------------------------------------------------
--2s未配置成功显示配桌等待
MatchGameOverView._startWaitTableAnim = function(self,time)
	self:_stopWaitTableAnim();
	
	GameTimer2.startTimeOut("delay_show_waitTable", self, self._showWaitTable, tonumber(time) or 2000);
end

MatchGameOverView._stopWaitTableAnim = function(self)
	GameTimer2.release("delay_show_waitTable");
end

MatchGameOverView._showWaitTable = function(self)
	self:_stopWaitTableAnim();

	local action = MatchMechineConfig.ACTION_WAIT_TABLE;
   	MatchMechine.getInstance():receiveAction(action,nil,nil,"MatchGameOverView._showWaitTable");
end
--------------------------------------------------------------------------
--参数说明
-- data = {
-- 	[seat] = {					--seat:本地座位号
-- 		["mid"] = mid;			--mid:玩家mid
-- 		["score"] = score;		--score:积分
-- 		["align"] = align;		--align:飘分动画中分数的对齐方式
-- 		["x"] = x;				--x,y:飘分动画中分数的位置
-- 		["y"] = y;
-- 		["detail"] = {			--输赢详情，需要展示的就添加
--			["mid"] = mid;		--mid:玩家mid
-- 			["score"] = score;	--score:积分
-- 			["detailInfo"] = {
-- 				[1] = {
-- 					["name"] = name; 		--展示内容1：如炸弹,春天,胡牌,自摸等
-- 					["content"] = content;	--展示内容2：如6倍,x3,2番等
-- 				};
-- 				...
-- 			};
--			["pos"] = { --详情框的位置,默认在界面正中间
-- 				["align"] = align;		
-- 				["x"] = x;				
-- 				["y"] = y;		
-- 			};
-- 			["btn_pos"] = { --比赛详情按钮相对与详情框的位置
-- 				["align"] = align;		
-- 				["x"] = x;				
-- 				["y"] = y;		
-- 			};		
-- 		};
-- 	};
-- 	...
-- };
MatchGameOverView.showMatchGameOver = function(self,seat,uid,data,isFast)
	if table.isEmpty(data) then
		return;
	end 
	self:setVisible(true);

	self:_showSocreLayer(data);

	local info = {};
	local myScore;
	for k,v in pairs(data) do 
		if v.detail then 
			info[k] = v.detail;
		end 
		if v.mid == UserBaseInfoIsolater.getInstance():getUserId() then
			myScore = v.score;
		end 
	end 
	if not table.isEmpty(info) then
		self.m_detailInfoData = info;
		self:_startShowDetailAnim();
	end 

	self:_startDelayAnim();
end

MatchGameOverView.delayCloseMatchGameOver = function(self)
	self:_startDelayCloseAnim();
	self:_stopDelayAnim();

	GameTimer2.startTimeOut("delay_close_matchGameOverView", self, self.closeMatchGameOver, 1000);
end

MatchGameOverView.closeMatchGameOver = function(self)
	self.m_detailInfoData = nil;

	self:_stopDelayAnim();
	self:_stopShowDetailAnim();
	self:_stopDelayCloseAnim();
	self:_stopWaitTableAnim();
	GameTimer2.release("delay_close_matchGameOverView");

	self:_hideSocreLayer();
	self:_hideDetailLayer();

	self:setVisible(false);
end

MatchGameOverView.refreshMatchStageInfo = function(self,seat,uid,info,isFast)
	info = table.verify(info);

	local data = {};
    data.stage = info.stage; -- 阶段 1:打立出局 2:定局移位 3:定局积分
    data.roundNum = info.roundNum;-- 当前轮数
    data.roundCount = info.roundCount;-- 总轮数
    data.bureauNum = info.bureauNum;-- 当前局数
    data.bureauCount = info.bureauCount;-- 总局数

    self.m_stageInfo = data;
end

MatchGameOverView.refreshRankInfo = function(self,seat,uid,info,isFast)
	info = table.verify(info);

	if info.curPos then 
		self.m_totalNum = info.totalNum;
	end
end

--------------------------------------------------------------------------
MatchGameOverView._createSocreLayer = function(self)
	if not self.m_gameOverSocreLayer then 
		local MatchGameOverScore =  require("games/common2/match/module/matchGameOver/matchGameOverScore");
		self.m_gameOverSocreLayer = new(MatchGameOverScore);
		self.m_root:addChild(self.m_gameOverSocreLayer);
	end 
end

MatchGameOverView._showSocreLayer = function(self,data)
	self:_createSocreLayer();

	self.m_gameOverSocreLayer:showScore(data);
end

MatchGameOverView._hideSocreLayer = function(self)
	if self.m_gameOverSocreLayer then 
		self.m_gameOverSocreLayer:hideScore();
	end 
end

MatchGameOverView._startDelayAnim = function(self)
	self:_stopDelayAnim();
	
	GameTimer2.startTimeOut("delay_clear_matchGameOverScore", self, self._onDelayAnimEvent, 2000);
end

MatchGameOverView._stopDelayAnim = function(self)
	GameTimer2.release("delay_clear_matchGameOverScore");
end

MatchGameOverView._onDelayAnimEvent = function(self)
	self:_hideSocreLayer();

	self:_checkNextShowView();
end
--------------------------------------------------------------------------
MatchGameOverView._createDetailLayer = function(self)
	if not self.m_gameOverDetailLayer then 
		local MatchGameOverDetailLayer =  require("games/common2/match/module/matchGameOver/matchGameOverDetailLayer");
		self.m_gameOverDetailLayer = new(MatchGameOverDetailLayer);
		self.m_root:addChild(self.m_gameOverDetailLayer);
	end 
end

MatchGameOverView._startShowDetailAnim = function(self)
	self:_stopShowDetailAnim();
	GameTimer2.startTimeOut("delay_show_matchGameOverDetail", self, self._onShowDetailAnimEvent, 1000);
end

MatchGameOverView._stopShowDetailAnim = function(self)
	GameTimer2.release("delay_show_matchGameOverDetail");
end

MatchGameOverView._onShowDetailAnimEvent = function(self)
	self:_stopShowDetailAnim();

	self:_showDetailLayer();
end

MatchGameOverView._showDetailLayer = function(self)	
	self:_createDetailLayer();
	self.m_gameOverDetailLayer:showDetailLayer(self.m_detailInfoData);
	self.m_detailInfoData = nil;
end

MatchGameOverView._hideDetailLayer = function(self)
	if self.m_gameOverDetailLayer then
		self.m_gameOverDetailLayer:hideDetailLayer();
	end 
end

MatchGameOverView._closeDetailView = function(self)
	if self.m_gameOverDetailLayer then
		self.m_gameOverDetailLayer:closeDetailView();
	end 
end
----------------------------------------------------------------------------------------
MatchGameOverView._checkNextShowView = function(self)
	local curGameType = GameInfoIsolater.getInstance():getCurGameType();
    if curGameType == GameConstant.NORMAL_IMMEDIATE_MATCH then --定局赛等待开始下一局，不播晋级动画/淘汰动画/配置等待
    	return;
    end
    if self.m_stageInfo then --定局积分或定局移位，不播晋级动画/淘汰动画
    	local data = self.m_stageInfo;
    	if data.stage == 3 then --定局积分不显示配桌提示
    		return;
    	end 
    	--定局移位展示配置提示
    	if data.bureauNum and data.bureauCount   
    		and data.bureauNum == data.bureauCount then --定局移位最后一局不显示配桌提示 
    			return;
    	end 
    	
    	self:_startWaitTableAnim();--2s未配桌成功显示配桌等待
    else --打立出局
    	if self.m_totalNum then 
	    	local data = MatchIsolater.getInstance():getMatchStageInfo();
			local daliInfo = data.daliInfo or {};			 
			local tillWeedoutNum = number.valueOf(daliInfo.TillWeedoutNum); 
			if self.m_totalNum <= tillWeedoutNum then --剩余人数小于等于截止人数，进入晋级等待不播晋级动画/淘汰动画/配置等待
				return;
			end 
			----等待通知晋级或淘汰
		end     	
    end 
end

MatchGameOverView.s_actionFuncMap = {
    [MatchMechineConfig.ACTION_GAME_OVER]			= "showMatchGameOver";
    [MatchMechineConfig.ACTION_ROUND_OVER]			= "delayCloseMatchGameOver";
    [MatchMechineConfig.ACTION_GET_REVIVE_NOTIFY]	= "closeMatchGameOver";

    [MatchMechineConfig.ACTION_GET_STAGE_INFO]      = "refreshMatchStageInfo";
    [MatchMechineConfig.ACTION_GET_TABLE_INFO]		= "refreshRankInfo",
    [MatchMechineConfig.ACTION_REVIVE_SUCCESS]		= "_startWaitTableAnim";
    [MatchMechineConfig.ACTION_ANIM_MATCH_TAOTAI]	= "_closeDetailView";
    [MatchMechineConfig.ACTION_WAIT_TABLE]			= "_closeDetailView";
};

MatchGameOverView.s_stateFuncMap = {
	[MatchMechineConfig.STATUS_NONE] 				= "closeMatchGameOver";
	[MatchMechineConfig.STATUS_PLAYING]   			= "closeMatchGameOver";
    [MatchMechineConfig.STATUS_FINISH]   			= "delayCloseMatchGameOver";
};

return MatchGameOverView;