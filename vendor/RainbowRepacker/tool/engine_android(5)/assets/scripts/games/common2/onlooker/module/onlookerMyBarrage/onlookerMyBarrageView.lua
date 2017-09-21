local ViewBase = require("games/common2/module/viewBase");
require("games/common2/onlooker/data/onlookerRecordData");

local OnlookerMyBarrageView = class(ViewBase,false);

OnlookerMyBarrageView.s_controls = {
	infoView = ToolKit.getIndex();
	infoLine1 = ToolKit.getIndex();
	infoLine2 = ToolKit.getIndex();
};

OnlookerMyBarrageView.ctor = function(self, seat, layoutConfig)
    super(self,layoutConfig);
	self.m_ctrls = OnlookerMyBarrageView.s_controls;
    self:setFillParent(true,true);

    self.m_seat = seat;

    self:_initView();
end 

OnlookerMyBarrageView.dtor = function(self)
end
-----------------------------------------------------------------------------
OnlookerMyBarrageView.onReceiveBarrageMsg = function(self,seat,uid,info,isFast)
	if table.isEmpty(info) then 
		return;
	end

	local isClose = self:_barrageIsClose();
	if isClose then 
		return;
	end

	if info.userId == UserBaseInfoIsolater.getInstance():getUserId() then 
		self:_playBarrageMsg(info);
	end 
end

OnlookerMyBarrageView.onBarrageSwitchChange = function(self)
	local isClose = self:_barrageIsClose();
	self:setVisible(not isClose);
end
-----------------------------------------------------------------------------
OnlookerMyBarrageView._initView = function(self)
	self.m_barrageMsgs = {};
	for i = 1,2 do 
		local view = self:findViewById(self.m_ctrls[string.format("infoLine%s",i)]);
		self.m_barrageMsgs[i] = view;
	end
end

OnlookerMyBarrageView._getBarragePlayPos = function(self)
	local lastIndex = self.m_lastPosIndex or math.random(1,2);
	local index = lastIndex == 1 and 2 or 1;
	self.m_lastPosIndex = index;
	return index;
end

OnlookerMyBarrageView._getBarrageItem = function(self,info)
	local BarrageItem = require("games/common2/onlooker/module/onlookerBarrage/onlookerBarrageItem");
	local item = new(BarrageItem,info);
	return item;
end

OnlookerMyBarrageView._playBarrageMsg = function(self,info)	
	self:setVisible(true); 

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
	local translateAnim = item:addPropTranslate(0,kAnimNormal,5000,0,width+w,0,0,0);
	if translateAnim then
		translateAnim:setDebugName("OnlookerMyBarrageView|_playBarrageMsg");
		translateAnim:setEvent({self,view,item},function(arg)
			local view = arg[2];
			local item = arg[3];
			if view and item then 
				view:removeChild(item,true);
			end 
		end);
	end
end

OnlookerMyBarrageView._barrageIsClose = function(self)
	local isClose = not OnlookerRecordData.getInstance():isOpenBarrage();

	return isClose;
end
-----------------------------------------------------------------------------
OnlookerMyBarrageView.s_controlConfig = 
{	
	[OnlookerMyBarrageView.s_controls.infoView]			= {"info_View"};
	[OnlookerMyBarrageView.s_controls.infoLine1]		= {"info_View","line1"};
	[OnlookerMyBarrageView.s_controls.infoLine2]		= {"info_View","line2"};
};

OnlookerMyBarrageView.s_controlFuncMap = 
{
};

OnlookerMyBarrageView.s_actionFuncMap = {
	[GameMechineConfig.ACTION_NS_RECEIVE_BARRAGE_MSG] = "onReceiveBarrageMsg";
	[GameMechineConfig.ACTION_NS_BARRAGE_SWITCH_CHANGE]	= "onBarrageSwitchChange";
};

OnlookerMyBarrageView.s_stateFuncMap = {
};


return OnlookerMyBarrageView;