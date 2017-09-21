local ViewBase = require("games/common2/module/viewBase");
require("games/common2/onlooker/data/onlookerRecordData");

local OnlookerBarrageView = class(ViewBase,false);

OnlookerBarrageView.s_controls = {
	msgBtn = ToolKit.getIndex();	
	infoView = ToolKit.getIndex();
	infoLine1 = ToolKit.getIndex();
	infoLine2 = ToolKit.getIndex();
	infoLine3 = ToolKit.getIndex();
	infoLine4 = ToolKit.getIndex();
	infoLine5 = ToolKit.getIndex();
};

OnlookerBarrageView.ctor = function(self, seat, layoutConfig)
    super(self,layoutConfig);
	self.m_ctrls = OnlookerBarrageView.s_controls;
    self:setFillParent(true,true);

    self.m_seat = seat;
    self.m_posIndex = {1,2,3,4,5};
    self.m_msgStack = {};
    self.m_playingCount = 0;
    self.m_delayTimers = {};

    self:_initView();
end 

OnlookerBarrageView.dtor = function(self)
	self:_stopDelayTimers();
end
-----------------------------------------------------------------------------
OnlookerBarrageView.parseConfig = function(self,config)
	config = table.verify(config);


	local function _init(ctrl,btnConfig)
		btnConfig = table.verify(btnConfig);

		local btn = self:findViewById(ctrl);
		if btn then 
			if btnConfig.align then 
				btn:setAlign(btnConfig.align);
			end 

			if btnConfig.x and btnConfig.y then 
				btn:setPos(btnConfig.x,btnConfig.y);
			end 
			btn:setVisible(btnConfig.visible == nil and true or btnConfig.visible);
		end 
	end

	_init(self.m_ctrls.msgBtn,config.msgDetailConfig);

	local msgDetailConfig =  table.verify(config.msgDetailConfig);
	if msgDetailConfig.file and msgDetailConfig.file ~= "" then 
		local btn = self:findViewById(self.m_ctrls.msgBtn);
		btn:setFile(msgDetailConfig.file);
		local w = btn.m_res:getWidth();
		local h = btn.m_res:getHeight();
		btn:setSize(w,h);
	end 
end
-----------------------------------------------------------------------------
OnlookerBarrageView.onMsgBtnClick = function(self)
	MechineManage.getInstance():receiveAction(GameMechineConfig.ACTION_NS_SHOW_ONLOOKER_DETAIL_INFO);
end

-----------------------------------------------------------------------------
OnlookerBarrageView.onReceiveBarrageMsg = function(self,seat,uid,info,isFast)
	if table.isEmpty(info) then 
		return;
	end 

	local isClose = self:_barrageIsClose();
	if isClose then 
		return;
	end 

	if info.userId ~= UserBaseInfoIsolater.getInstance():getUserId() then 
		table.insert(self.m_msgStack,info);
		self:_checkAndPlayMsg();
	end 
end
-----------------------------------------------------------------------------
OnlookerBarrageView._initView = function(self)
	self.m_barrageMsgs = {};
	for i = 1,5 do 
		local view = self:findViewById(self.m_ctrls[string.format("infoLine%s",i)]);
		self.m_barrageMsgs[i] = view;
	end
end

OnlookerBarrageView._getBarragePlayPos = function(self)
	local index = math.random(1,2); 
	local pos = table.remove(self.m_posIndex,index);
	table.insert(self.m_posIndex,pos);
	return pos;
end

OnlookerBarrageView._getBarrageItem = function(self,info)
	local BarrageItem = require("games/common2/onlooker/module/onlookerBarrage/onlookerBarrageItem");
	local item = new(BarrageItem,info);
	return item;
end

OnlookerBarrageView._playBarrageMsg = function(self,info)
	local item = self:_getBarrageItem(info);
	local pos = self:_getBarragePlayPos();

	local view = self.m_barrageMsgs[pos];	
	item:setAlign(kAlignLeft);

	local width = self:getSize();
	local w = item:getSize();
	item:setPos(-w,0);
	view:addChild(item);
	
	if not item:checkAddProp(0) then
		item:removeProp(0);
	end

	self.m_playingCount = self.m_playingCount + 1;
	local translateAnim = item:addPropTranslate(0,kAnimNormal,5000,0,width+w,0,0,0);
	if translateAnim then
		translateAnim:setDebugName("OnlookerBarrageView|_playBarrageMsg");
		translateAnim:setEvent({self,view,item},function(arg)
			local self = arg[1];
			local view = arg[2];
			local item = arg[3];			
			if view and item then 
				view:removeChild(item,true);
			end 
			self:_checkAndPlayMsg();
		end);
	end

	if not self.m_delayTimers[tostring(pos)] then
		local v = (width + w)/5;
		local t = (w + math.random(10,30))/v;
		self.m_delayTimers[tostring(pos)] = Clock.instance():schedule_once(function()
					self.m_delayTimers[tostring(pos)] = nil;

					self.m_playingCount = self.m_playingCount - 1;
					self:_checkAndPlayMsg();
				end,t);
	end 
end

OnlookerBarrageView._barrageIsClose = function(self)
	local isOpen = OnlookerRecordData.getInstance():isOpenBarrage();
	return not isOpen;
end

OnlookerBarrageView._checkAndPlayMsg = function(self)
	if #self.m_msgStack == 0 then
		return;
	end 

	if self.m_playingCount <= 3 then --第5次播时可能是第1次播选择的位置,同时在播的有3条以上则等待某一条已完全播出后再播下条
		local info = table.remove(self.m_msgStack,1);
		self:_playBarrageMsg(info);
	end
end

OnlookerBarrageView._stopDelayTimers = function(self)
	for i = 1,5 do 
		if self.m_delayTimers[tostring(i)] then 
	        self.m_delayTimers[tostring(i)]:cancel();
	    end 
	    self.m_delayTimers[tostring(i)] = nil;
	end
	self.m_delayTimers = {}; 
end
-----------------------------------------------------------------------------
OnlookerBarrageView.s_controlConfig = 
{	
	[OnlookerBarrageView.s_controls.msgBtn]			= {"msg_btn"};
	[OnlookerBarrageView.s_controls.infoView]		= {"info_View"};
	[OnlookerBarrageView.s_controls.infoLine1]		= {"info_View","line1"};
	[OnlookerBarrageView.s_controls.infoLine2]		= {"info_View","line2"};
	[OnlookerBarrageView.s_controls.infoLine3]		= {"info_View","line3"};
	[OnlookerBarrageView.s_controls.infoLine4]		= {"info_View","line4"};
	[OnlookerBarrageView.s_controls.infoLine5]		= {"info_View","line5"};
};

OnlookerBarrageView.s_controlFuncMap = 
{
	[OnlookerBarrageView.s_controls.msgBtn]			= OnlookerBarrageView.onMsgBtnClick;
};

OnlookerBarrageView.s_actionFuncMap = {
	[GameMechineConfig.ACTION_NS_RECEIVE_BARRAGE_MSG] = "onReceiveBarrageMsg";
};

OnlookerBarrageView.s_stateFuncMap = {
};


return OnlookerBarrageView;