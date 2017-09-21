--[[
	房间内广播
]]
local ViewBase = require("games/common2/module/viewBase");

local RoomBroadcastView = class(ViewBase, false);

RoomBroadcastView.ctor = function(self,seat)
	super(self);
	self.m_seat = seat;
	self.m_cacheData = {};
    self:setFillParent(true, true);
end

RoomBroadcastView.dtor = function(self)
	for k,v in ipairs(self.m_cacheData) do 
		RadioIsolater.getInstance():addRadioMsgWithoutNotify(v);
	end 
	self.m_cacheData = nil;
    self:cleanPushMessageAnim();
    delete(self.getPushMessageItem);
	self.getPushMessageItem  = nil;
end


RoomBroadcastView.playRadioOnScreen = function(self, info)
	Log.i("房间内广播---RoomBroadcastView.playRadioOnScreen");
	if self.m_isRadioRun then  
        return; 
    end 

    if not table.isEmpty(info) then
    	if GameInfoIsolater.getInstance():isInMatchRoom() then 
    		local radioType = info.type;
    		local isShow = false;
    		if radioType == RadioIsolater.getInstance():getMatchInviteRadioType() 
				or radioType == RadioIsolater.getInstance():getPrivateInviteRadioType() then 
				isShow = true;
			end 

			if not isShow then 
				table.insert(self.m_cacheData,info);
				self:radioLightDeleteAnim();
				return;
			end 
    	end

    	self:removePushItem();
    	self.m_isRadioRun = true;
    	local broadcastItem = require("games/common2/module/broadcast/roomBroadcastItem");
        self.getPushMessageItem = new(broadcastItem,info);
		local _, itemHeight = self.getPushMessageItem:getSize();

		self.getPushMessageItem:setPos(0,-itemHeight);
		self:addChild(self.getPushMessageItem);
		self.getPushMessageItem:setFillParent(true,false);
		self:cleanPushMessageProp(1);
		local pushMessageItemAnim = self.getPushMessageItem:addPropTranslate(1,kAnimNormal,500,-1,0,0,0,itemHeight);
		if pushMessageItemAnim then
			pushMessageItemAnim:setDebugName("RoomBroadcastView|playRadioOnScreen");
			pushMessageItemAnim:setEvent(self,self.radioMsgLight);
		end
    end	
end

--播放跑马灯
RoomBroadcastView.radioMsgLight = function(self)
	self:cleanPushMessageProp(1);
	self:cleanPushMessageAnim();

    if self.getPushMessageItem then
	    local additionalDuration = self.getPushMessageItem:getAdditionalDuration();
		self.m_pushMsganim = new(AnimInt,kAnimNormal,1,100,4000 + additionalDuration, -1);
		self.m_pushMsganim:setEvent(self,self.radioLightShowComplete);
		self.m_pushMsganim:setDebugName("AnimInt|RoomBroadcastView.pushMsganim|kAnimNormal");
	end
end

RoomBroadcastView.cleanPushMessageAnim = function(self)
	delete(self.m_pushMsganim);
    self.m_pushMsganim = nil;
end

RoomBroadcastView.radioLightDeleteAnim = function (self)
    self:cleanPushMessageProp(2);
    self:removePushItem();
    self.m_isRadioRun = false;

    RadioIsolater.getInstance():delLastRadioMsg();

    local radioMsgList = RadioIsolater.getInstance():getRadioMsgList();
    if not table.isEmpty(radioMsgList) then
    	local info = radioMsgList[#radioMsgList];
    	if not table.isEmpty(info) then
    		MechineManage.getInstance():receiveAction(GameMechineConfig.ACTION_NS_RECEIVE_RADIOMSG,info);
    	end
    end
end

RoomBroadcastView.radioLightShowComplete = function(self)
    self:cleanPushMessageAnim();
    self:cleanPushMessageProp(2);
    if self.getPushMessageItem then
	    local pushMessageItemAnim = self.getPushMessageItem:addPropTranslate(2,kAnimNormal,500,-1,0,0,0,-140);
	    if pushMessageItemAnim then
	  	    pushMessageItemAnim:setDebugName("RoomBroadcastView.radioLightShowComplete|pushMessageItemAnim");
	  	    pushMessageItemAnim:setEvent(self,self.radioLightDeleteAnim);
	    end
	end
end

RoomBroadcastView.cleanPushMessageProp = function(self , index)
	if self.getPushMessageItem then
	 	if not self.getPushMessageItem:checkAddProp(index) then
			self.getPushMessageItem:removeProp(index);
		end
	end
end

RoomBroadcastView.showToast = function(self,msg)
	if not string.isEmpty(msg) then
		Toast.getInstance():showText(msg,50,30,kAlignLeft,"",24,200,175,110);
	end
end

RoomBroadcastView.removePushItem = function(self)
	if self.getPushMessageItem then
		self:removeChild(self.getPushMessageItem);
		delete(self.getPushMessageItem);
	    self.getPushMessageItem  = nil;
	end
end

return RoomBroadcastView;