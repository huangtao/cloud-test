

local RoomFriendApplyWnd = class(CommonGameLayer,false);

RoomFriendApplyWnd.Delegate = {
    onDealFriendApply = "onDealFriendApply";
    onCloseFriendApplyWnd = "onCloseFriendApplyWnd";
};

RoomFriendApplyWnd.s_controls = { 
    head          = ToolKit.getIndex();
    btnAgree      = ToolKit.getIndex();
    btnRefuse     = ToolKit.getIndex();
    userName      = ToolKit.getIndex();
    btnAgreeName  = ToolKit.getIndex();
};

RoomFriendApplyWnd.ctor = function(self,viewConfig) 
    super(self,viewConfig);
    self.m_ctrls = RoomFriendApplyWnd.s_controls;  
    self:setFillParent(true,true);
    self.m_defaultTime = 5;
    self:_getBaseView(); 
end 

RoomFriendApplyWnd.dtor = function(self)
    ImageCache.getInstance():cleanRef(self);
    CommonRoomTimer2.getInstance():clean(self);
end

RoomFriendApplyWnd.show = function(self,data)
    ReportIsolater.getInstance():report(UBConfig.kGameShowFriendApply, true, true);
    self:_initData(data);
    CommonRoomTimer2.getInstance():addCallBack(self, self._onUpdateTime);
    self:setVisible(true);
    DialogLogic.getInstance():pushDialogStack(self,self.hide);
end

RoomFriendApplyWnd._onUpdateTime = function(self)
    self.m_curTime = number.valueOf(self.m_curTime,self.m_time or self.m_defaultTime);
    self.m_curTime = self.m_curTime - 1;
    self.m_btnAgreeName:setText(string.format("同意(%s)",self.m_curTime));
    if self.m_curTime == 0 then 
        ReportIsolater.getInstance():report(UBConfig.kGameFriendApplyTimeoutClose, true, true);
        self:hide();
    end 
end

RoomFriendApplyWnd.parseConfig = function(self,config)
    if table.isEmpty(config) then 
        return; 
    end

    self.m_time = tonumber(config.time);
end

RoomFriendApplyWnd._getBaseView = function(self)
    self.m_headImageBg =  self:findViewById(RoomFriendApplyWnd.s_controls.head);
    self.m_btnAgree =  self:findViewById(RoomFriendApplyWnd.s_controls.btnAgree);
    self.m_btnRrfuse = self:findViewById(RoomFriendApplyWnd.s_controls.btnRefuse);
    self.m_userName = self:findViewById(RoomFriendApplyWnd.s_controls.userName);
    self.m_btnAgreeName = self:findViewById(RoomFriendApplyWnd.s_controls.btnAgreeName);
end

RoomFriendApplyWnd._initData = function(self,data)
    Log.d("RoomFriendApplyWnd._initData", data);
    self.m_data = table.verify(data);

    self.m_userName:setText(data.nickname or "");
    self.m_curTime = self.m_time or self.m_defaultTime;
    self.m_btnAgreeName:setText(string.format("同意(%s)",self.m_curTime));

    self:__setHeadImage( UserBaseInfoIsolater.getInstance():getHeadBySex(number.valueOf(data.sex)) ); 
    if self.m_data.head then
      ImageCache.getInstance():request(self.m_data.head, self, self._onUpdateHeadImage);
    end
end

--private 
--imageCache 的请求回调
RoomFriendApplyWnd._onUpdateHeadImage = function(self, url, imagePath)
    if imagePath then
       self:__setHeadImage(imagePath);
    end
end


RoomFriendApplyWnd.__setHeadImage = function (self, image)
    if self.m_headImage then
		self.m_headImageBg:removeChild(self.m_headImage);
	end
	delete(self.m_headImage);
	self.m_headImage = new(Mask, image, "hall/common/mask_head_72.png"); 
	self.m_headImageBg:addChild(self.m_headImage);
	self.m_headImage:setAlign(kAlignCenter);
end

RoomFriendApplyWnd.onAgreeBtnClick = function(self)
    ReportIsolater.getInstance():report(UBConfig.kGameFriendApplyClickAgree, true, true);
    self:execDelegate(RoomFriendApplyWnd.Delegate.onDealFriendApply,self.m_data, 1);
    self:hide();
end

RoomFriendApplyWnd.onRefuseBtnClick = function(self)
    ReportIsolater.getInstance():report(UBConfig.kGameFriendApplyClickRefuse, true, true);
    self:execDelegate(RoomFriendApplyWnd.Delegate.onDealFriendApply,self.m_data, 2); 
    self:hide();
end
RoomFriendApplyWnd.hide = function(self)
    self:setVisible(false);
    CommonRoomTimer2.getInstance():clean(self);
    DialogLogic.getInstance():popDialog();
    self:execDelegate(RoomFriendApplyWnd.Delegate.onCloseFriendApplyWnd);
end

RoomFriendApplyWnd.s_controlConfig =
{   
  [RoomFriendApplyWnd.s_controls.head]          = {"bg","headFrame"};  
  [RoomFriendApplyWnd.s_controls.userName]      = {"bg","infoView","userName"}; 
  [RoomFriendApplyWnd.s_controls.btnAgree]      = {"bg","btnAgree"};  
  [RoomFriendApplyWnd.s_controls.btnRefuse]     = {"bg","btn_refuse"}; 
  [RoomFriendApplyWnd.s_controls.btnAgreeName]  = {"bg","btnAgree","Text1"};    
};

RoomFriendApplyWnd.s_controlFuncMap =
{
  [RoomFriendApplyWnd.s_controls.btnAgree]      = RoomFriendApplyWnd.onAgreeBtnClick;
  [RoomFriendApplyWnd.s_controls.btnRefuse]     = RoomFriendApplyWnd.onRefuseBtnClick;  
};

return RoomFriendApplyWnd;