local announcementStopServerLayout = require(ViewPath .. "hall/announcement/announcementStopServerLayout");
require("common/IBaseDialog");

local AnnouncementStopServerPop = class(IBaseDialog,false);

local h_index = 0;
local getIndex = function(self)
    h_index = h_index + 1;
    return h_index;
end

AnnouncementStopServerPop.s_controls = 
{ 
   content = getIndex();
   title = getIndex();
   twoBtnsView = getIndex();
   singleBtnView = getIndex();
   telephoneBtn = getIndex();
   twoBtnsLaterComeBack = getIndex();
   oneBtnLaterComeBack = getIndex();
   bg = getIndex();
   oneBtnLaterComeBackTitle = getIndex();
};

AnnouncementStopServerPop.s_defaultShowLevel = 1000;

AnnouncementStopServerPop.ctor = function(self, data) 
    super(self,announcementStopServerLayout, "AnnouncementStopServerPop", AnnouncementStopServerPop.s_defaultShowLevel);
    self:setSize(self.m_root:getSize());
    self:setFillParent(true,true);
    self:setLevel(AnnouncementStopServerPop.s_defaultShowLevel);
    self.m_ctrl = AnnouncementStopServerPop.s_controls;
    self.m_data = data;
    self:__initViews();
    self:__initBtnStatus();
    self:__setContent();
    self:setEventTouch(self,function ()end);
    self:setEventDrag(self,function ()end);
    self:setCancelable(false);
end 

AnnouncementStopServerPop.dtor = function(self)
    self:removeAllChildren();
end 

AnnouncementStopServerPop.__initViews = function (self) 
    self.m_title = self:findViewById(self.m_ctrl.title);
    self.m_content = self:findViewById(self.m_ctrl.content);
    self.m_twoBtnsView = self:findViewById(self.m_ctrl.twoBtnsView);
    self.m_singleBtnView = self:findViewById(self.m_ctrl.singleBtnView);
    self.m_oneBtnLaterComeBackTitle = self:findViewById(self.m_ctrl.oneBtnLaterComeBackTitle);
end

AnnouncementStopServerPop.__initBtnStatus = function (self)
   local twoBtnsShow = self.m_data.type == AnnounceDataInterface.eStatusType.PRORUPTION;
   self.m_twoBtnsView:setVisible(twoBtnsShow); 
   self.m_singleBtnView:setVisible(not twoBtnsShow);
   self.m_oneBtnLaterComeBackTitle:setText("等会回来");
end

AnnouncementStopServerPop.__setContent = function(self)
    self.m_title:setText(self.m_data.title);
    local phone = HallDataInterface.getInstance():getHotline() or "";
    local content = self.m_data.content .. phone;
    self.m_content:setText(content);
end

AnnouncementStopServerPop.onTelePhoneBtnClick = function (self)
    HallDataInterface.getInstance():callHotline();
end

AnnouncementStopServerPop.onLaterComeBackClick = function (self)
   UpdateData.getInstance():save();
   sys_exit();
end

AnnouncementStopServerPop.s_controlConfig =
{   
    [AnnouncementStopServerPop.s_controls.bg]                       = {"shadeBg"};
    [AnnouncementStopServerPop.s_controls.twoBtnsView]              = {"centerView","bottomView","twoBtnsView"};
    [AnnouncementStopServerPop.s_controls.singleBtnView]            = {"centerView","bottomView","singleBtnView"};
    [AnnouncementStopServerPop.s_controls.telephoneBtn]             = {"centerView","bottomView","twoBtnsView","btn2"};
    [AnnouncementStopServerPop.s_controls.twoBtnsLaterComeBack]     = {"centerView","bottomView","twoBtnsView","btn1"};
    [AnnouncementStopServerPop.s_controls.oneBtnLaterComeBack]      = {"centerView","bottomView","singleBtnView","btn1"};
    [AnnouncementStopServerPop.s_controls.oneBtnLaterComeBackTitle] = {"centerView","bottomView","singleBtnView","btn1","btn1Text"};
    [AnnouncementStopServerPop.s_controls.title]                    = {"centerView","titleBg","title"};
    [AnnouncementStopServerPop.s_controls.content]                  = {"centerView","content_centre"};
};

 AnnouncementStopServerPop.s_controlFuncMap =
 {
    [AnnouncementStopServerPop.s_controls.telephoneBtn] = AnnouncementStopServerPop.onTelePhoneBtnClick;
    [AnnouncementStopServerPop.s_controls.twoBtnsLaterComeBack] = AnnouncementStopServerPop.onLaterComeBackClick;
    [AnnouncementStopServerPop.s_controls.oneBtnLaterComeBack] = AnnouncementStopServerPop.onLaterComeBackClick;  
 };

 return AnnouncementStopServerPop;


