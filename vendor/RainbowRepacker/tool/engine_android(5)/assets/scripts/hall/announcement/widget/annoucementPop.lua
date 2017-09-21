local annoucementLayout = require(ViewPath .. "hall/announcement/annoucementLayout");
require("common/IBaseDialog");



local AnnoucementPop = class(IBaseDialog,false);
AnnoucementPop.s_controls = 
{ 
   closeBtn = 1;
   confirmBtn = 2;
   title = 3;
   content = 4;
   tbg = 5;
   contentView = 6;
};

AnnoucementPop.ctor = function(self) 
    super(self,annoucementLayout, "AnnoucementPop", 998);
    self:setFillParent(true,true);
    self.m_ctrl = AnnoucementPop.s_controls;
    self.m_closeBtn = self:findViewById(self.m_ctrl.closeBtn);
    self.m_confirmBtn = self:findViewById(self.m_ctrl.confirmBtn);
    self.m_title = self:findViewById(self.m_ctrl.title);
    self.m_content = self:findViewById(self.m_ctrl.content);
    self:findViewById(self.m_ctrl.tbg):setEventDrag(self, self.onBgDrag);
    self:setVisible(false);
    self:setLevel(100);
end 
AnnoucementPop.show = function(self,data)
	-- body
	self:setVisible(true);
    if data then 
       if data.firstWord then 
           self.m_title:setText(string.subUtfStrByCn(data.firstWord, 1, 14, ""));
       end 
       if data.content then 
          self.m_content:setText(data.content);

       end       
    end 
end


AnnoucementPop.resume = function(self)
	-- body
	--EventDispatcher.getInstance():register(AnnoucementPopDataManager.getInstance():getNotifyId(), self, self.onChange);
end

AnnoucementPop.setOnCloseCallBack = function(self,obj,callback)
	-- body
	  self.m_obj = obj;
    self.m_callback = callback;
end

AnnoucementPop.dtor = function(self)
    self:removeAllChildren();
end 

AnnoucementPop.onClose = function(self)
	if self.m_obj then
		if self.m_callback then
			self.m_callback(self.m_obj);
			self.m_callback = nil;
		end 
		self.m_obj = nil;
	end 
    self:setVisible(false);
end


AnnoucementPop.onBgTouch = function(self )
  self:onClose()
  --Log.d("AnnoucementPop.onBgTouch");
end

AnnoucementPop.onBgDrag = function(self )
    
end

AnnoucementPop.onContentViewTouch = function(self)
	--Log.d("AnnoucementPop.onContentViewTouch");
end

AnnoucementPop.s_controlConfig =
{   
    [AnnoucementPop.s_controls.closeBtn] = {"contentView","closeBtn"};
    [AnnoucementPop.s_controls.confirmBtn] = {"contentView","bottomView","confirm_btn"};
    [AnnoucementPop.s_controls.title] = {"contentView","titleBg","title"};
    [AnnoucementPop.s_controls.content] = {"contentView","centerView","content_text"};
    [AnnoucementPop.s_controls.tbg] = {"shiled"};
    [AnnoucementPop.s_controls.contentView] = {"contentView"};
     
};

 AnnoucementPop.s_controlFuncMap =
 {
   
    [AnnoucementPop.s_controls.closeBtn] = AnnoucementPop.onClose;
    [AnnoucementPop.s_controls.confirmBtn] = AnnoucementPop.onClose;
    [AnnoucementPop.s_controls.tbg] = AnnoucementPop.onBgTouch;
    [AnnoucementPop.s_controls.contentView] = AnnoucementPop.onContentViewTouch;
    
 };

 return AnnoucementPop;
