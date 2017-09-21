local gui_maker = require( "view/kScreen_1280_800/common/gui_maker");

local GuidMakePop = class(CommonGameLayer,false);
GuidMakePop.s_controls = 
{ 
   bg = 1;
   guid = 2;
   confirmBtn = 3;
   closeBtn = 6;
};

GuidMakePop.ctor = function(self,obj,callback) 
    super(self,gui_maker);
    self.m_ctrl = GuidMakePop.s_controls;
    self.m_guid = self:findViewById(self.m_ctrl.guid);
    self:setOnJoinClickCallBack(obj,callback);
    self:addToRoot();
end 


GuidMakePop.setOnJoinClickCallBack = function(self,obj,callback)
	  self.m_obj = obj;
    self.m_callback = callback;
end

GuidMakePop.dtor = function(self)
    self:removeAllChildren();
end 

GuidMakePop.onJionClick = function(self)
	if self.m_obj then
		if self.m_callback then
      local guid = self.m_guid:getText();
     	self.m_callback(self.m_obj,guid);
		end 
		
	end 
    self:setVisible(false);
    delete(self);
end

GuidMakePop.onBgTouch = function(self )
  self:onJionClick();
  delete(self);
end

GuidMakePop.s_controlConfig =
{   
  [GuidMakePop.s_controls.bg] = {"bg"};
  [GuidMakePop.s_controls.guid] = {"bg","popBg","guid"};
  [GuidMakePop.s_controls.confirmBtn] = {"bg","popBg","confirm_btn"};
  [GuidMakePop.s_controls.closeBtn] = {"bg","popBg","btn_close"},
};

GuidMakePop.s_controlFuncMap =
{
  [GuidMakePop.s_controls.closeBtn] = GuidMakePop.onBgTouch;
  [GuidMakePop.s_controls.confirmBtn] = GuidMakePop.onJionClick;
  [GuidMakePop.s_controls.bg] = GuidMakePop.onBgTouch;
};


return GuidMakePop;
