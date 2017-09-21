local hallNotice_layout = require(HallViewPath.."broadcast/hallNotice_layout");
require("hall/broadcast/data/broadcastDataInterface");


local BroadcastLayer = class(CommonGameLayer, false);

local h_index = 0;
local getIndex = function(self)
    h_index = h_index + 1;
    return h_index;
end

BroadcastLayer.Delegate = {
    pushStateStack = "pushStateStack";
    popStateStack = "popStateStack";
    scanningBtnClick = "scanningBtnClick";
    isNetWorkConnect = "isNetWorkConnect";
}

BroadcastLayer.s_controls =
{
    stripsMessageBG = getIndex();
    sendStripsBtn = getIndex();
    rotatingView = getIndex();
    talkBtn = getIndex();
    scanningBtn = getIndex();
};

BroadcastLayer.ctor = function(self, data)
	super(self, hallNotice_layout);
    self:setFillParent(true, true);

    self.m_ctrl = BroadcastLayer.s_controls;
    self.m_stripsMessageBG = self:findViewById(self.m_ctrl.stripsMessageBG);
	BroadcastDataInterface.getInstance():setObserver(self);
    self:findViewById(self.m_ctrl.sendStripsBtn):setEventDrag(self,function ()
    end)
    self.m_isPlaying = false;
end

BroadcastLayer.dtor = function(self)
	BroadcastDataInterface.getInstance():clearObserver(self);
	self:__stopRoolMsgAnim();
    delete(self.m_radioSendLayer);
    self.m_radioSendLayer = nil;
end

BroadcastLayer.onSendStripsBtnClick = function(self)
    local isNetWorkConnect = self:execDelegate(BroadcastLayer.Delegate.isNetWorkConnect);
    if not isNetWorkConnect then
        return;
    end
    UBReport.getInstance():report(UBConfig.kHallBroadcastPopup);
    if not self.m_radioSendLayer then
        self.m_radioSendLayer = new(require("hall/broadcast/RadioSendLayer"));
        self.m_radioSendLayer:setDelegate(self);
        self.m_radioSendLayer:addToRoot();
    end
    self:onRadioSendLayerOpen();
end

BroadcastLayer.onRadioSendLayerOpen = function(self)
  self:execDelegate(BroadcastLayer.Delegate.pushStateStack, self, self.onRadioSendLayerClose);
  self.m_radioSendLayer:show();
end

BroadcastLayer.onRadioSendLayerClose = function(self, popStack)
    if popStack then
      self:execDelegate(BroadcastLayer.Delegate.popStateStack);
    end

    self.m_radioSendLayer:hide();
end

--@brief 广播刷新回调
BroadcastLayer.refreshRadioList = function (self,isSuccess,data)
    if isSuccess and not table.isEmpty(data) and not self.m_isPlaying then
       self:rotatingLight();  
    end
end

BroadcastLayer.__totalRollCount = function (self)
    local richTextHeight = self.m_roolMsg:getTotalHeight();
	local lineHeight = self.m_roolMsg.m_curHeight;
	local totalRollCount = math.ceil(richTextHeight/lineHeight);
    return richTextHeight,lineHeight,totalRollCount;
end

BroadcastLayer.__getRichTextLineNum = function (self)
    local _,_,totalCount = self:__totalRollCount();
    if totalCount > 1 then
        return true;
    else
        return false;
    end 
end

BroadcastLayer.__deleteRoolMsg = function (self)
    if self.m_roolMsg then 
        delete(self.m_roolMsg); 
        self.m_roolMsg = nil;  
    end
end
--------广播向上移动---------
BroadcastLayer.rotatingLight = function(self)
    local rotatingView = self:findViewById(BroadcastLayer.s_controls.rotatingView);
    local areaWide,areaHeight = rotatingView:getSize();
    self:__deleteRoolMsg();
	local radioMsgTab = BroadcastDataInterface.getInstance():getRadioMsgList();
	if #radioMsgTab<1 then
		return;
	end
	BroadcastDataInterface.getInstance():addOverRadioMsgList(radioMsgTab[1]);
	local overRedioMsgTab = BroadcastDataInterface.getInstance():getOverRadioMsgList();
	if  #overRedioMsgTab + #radioMsgTab >11 then
		BroadcastDataInterface.getInstance():removeFirstOverRadioMsg();
	end

	local currentInfo = BroadcastDataInterface.getInstance():removeFirstRadioMsg();
	if table.isEmpty(currentInfo) then
		return;
	end
    self.m_isPlaying = true;
    local textStr;
	if string.isEmpty(currentInfo.nick) then
		textStr = currentInfo.content or "";
	else
		textStr = "#cfef45e"..string.concat(currentInfo.nick,"#cffffff",":",currentInfo.content);
	end
    self.m_roolMsg = new(RichText, textStr, areaWide, areaHeight, kAlignTopLeft,"", 32, 255, 255, 255, true);
	self.m_roolMsg:setAlign(kAlignTopLeft);
    self.m_roolMsg:setPos(nil,-1);
    rotatingView:addChild(self.m_roolMsg);
    local x,y = self.m_roolMsg:getUnalignPos();
    self.m_roolMsg:setClip(x, y, areaWide, 36);
    if self:__getRichTextLineNum() then
        self:__startRoolMsgAnim();
    else    
        self:__showTimerAnim();
    end	
end

BroadcastLayer.__showTimerAnim = function (self)
    Clock.instance():schedule_once(function()
	    self.m_isPlaying = false;
        self:rotatingLight();		
    end, 2.5)
end

BroadcastLayer.__stopRoolMsgAnim = function(self)
    if self.m_roolMsgAnim then
        delete(self.m_roolMsgAnim);
        self.m_roolMsgAnim = nil;
    end
end

BroadcastLayer.__startRoolMsgAnim = function(self)
	self:__stopRoolMsgAnim();
	self.m_roolMsgAnim = new(AnimInt, kAnimRepeat, 0, 1, 2500, 0);
	self.m_roolCount = 1;
	self.m_roolMsgAnim:setEvent(self, self.onRoolMsgAnimTimer);
end

BroadcastLayer.onRoolMsgAnimTimer = function(self)
	local richTextHeight ,lineHeight, totalRollCount = self:__totalRollCount();

    if self.m_roolCount < totalRollCount then
		local start_h = (self.m_roolCount-1)*lineHeight;
		if not self.m_roolMsg:checkAddProp(1) then
            self.m_roolMsg:removeProp(1);
        end
		self.m_roolMsg:addPropTranslate(1, kAnimNormal, 500, 0, nil, nil, -start_h, -(start_h+lineHeight));
		self.m_roolCount = self.m_roolCount + 1;
	else
		self:__stopRoolMsgAnim();
        self:__showTimerAnim();
	end
end

BroadcastLayer.onScanningBtnClick = function(self)
    if kLoginDataInterface:getIsLoginSuccess() then
        self:execDelegate(BroadcastLayer.Delegate.scanningBtnClick)
        QRUtil.getInstance():scanQR()
    end
end

BroadcastLayer.execDelegate = function(self,func,...)
    if self.m_delegate and self.m_delegate[func] then
        return self.m_delegate[func](self.m_delegate,...);
    end
end

BroadcastLayer.s_controlConfig = 
{
    [BroadcastLayer.s_controls.stripsMessageBG] = {"stripsMessageBG"};
    [BroadcastLayer.s_controls.sendStripsBtn] = {"stripsMessageBG", "sendStripsBtn"};
    [BroadcastLayer.s_controls.rotatingView] = {"stripsMessageBG","rotatingView"};
    [BroadcastLayer.s_controls.scanningBtn] = {"scanningBtn"};
    [BroadcastLayer.s_controls.talkBtn] = {"talkBtn"};
    
}

BroadcastLayer.s_controlFuncMap =
{	
    [BroadcastLayer.s_controls.sendStripsBtn] = BroadcastLayer.onSendStripsBtnClick,
    [BroadcastLayer.s_controls.talkBtn] = BroadcastLayer.onSendStripsBtnClick,
    [BroadcastLayer.s_controls.scanningBtn] = BroadcastLayer.onScanningBtnClick,
}

return BroadcastLayer;