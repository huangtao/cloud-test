require("common/commonGameLayer");
require("common/uiFactory");
require("uiex/urlImage");
require("core/constants");
local vipGetAnimPop = require(ViewPath.."common/vipGetAnimPop");
VipGetAnimPop = class(CommonGameLayer,false);
VipGetAnimPop.s_controls = 

{ 
    bg = 2;
    diamond = 3;
    diamondLight = 4;
    vipTextCode = 5;
    vipTextCodeLight = 6;
    textTips = 7;
    textTipsLight = 8;
    sun = 10;
};
VipGetAnimPop.ctor = function(self,gameId) 
    super(self,vipGetAnimPop);
    
    self.m_bg =  self:findViewById(VipGetAnimPop.s_controls.bg);
    self.m_diamond = self:findViewById(VipGetAnimPop.s_controls.diamond);
    self.m_diamondLight = self:findViewById(VipGetAnimPop.s_controls.diamondLight);
    self.m_vipTextCode = self:findViewById(VipGetAnimPop.s_controls.vipTextCode);
    self.m_vipTextCodeLight = self:findViewById(VipGetAnimPop.s_controls.vipTextCodeLight);
    self.m_textTips = self:findViewById(VipGetAnimPop.s_controls.textTips);
    self.m_textTipsLight = self:findViewById(VipGetAnimPop.s_controls.textTipsLight);
    self.m_sun = self:findViewById(VipGetAnimPop.s_controls.sun);
    self:setFillParent(true,true);
    self:setVisible(false);
    self:addToRoot();
    self:setVisible(false);
    IPopDialogManager.getInstance():addPopDialog(self, 100, self.onBgTouch, self);
end 

VipGetAnimPop.dtor = function (self)
    IPopDialogManager.getInstance():removePopDialog(self);
end

VipGetAnimPop.play = function(self )
  self:setVisible(true);
  --旋转太阳光圈
  self:rotateSun();
  --所有高亮渐变消失
  self:fadeLight();
  --砖石放大缓存
  self:scaleDiamondCenter();
  --vip文字放大缓冲
  self:scaleVipCenter();
  --文字提示缓存到
  self:scaleTextTipsCenter();
  --10秒钟之后消失
   anti = self.m_bg:addPropTransparency(10, kAnimNormal,  700,7000, 1,0);  
   if anti then 
     anti:setEvent(self,function(self )
       -- body
       delete(self);
     end);
   end 
end
VipGetAnimPop.rotateSun = function( self )
  -- body
  self.m_sun:addPropRotate(1, kAnimRepeat, 3000, 0,0,360,kCenterDrawing);
end

VipGetAnimPop.fadeLight  = function(self )
  -- body
  self.m_diamondLight:addPropTransparency(2, kAnimNormal,  1000,800, 1,0);
  self.m_textTipsLight:addPropTransparency(3, kAnimNormal,  800,500, 1,0);
  self.m_vipTextCodeLight:addPropTransparency(4, kAnimNormal,  500,1000, 1,0);

end

VipGetAnimPop.scaleDiamondCenter = function(self )
  -- body
  self.m_diamond:addPropScale(5, kAnimNormal, 1000, 100,0.2,1,0.2,1,kCenterDrawing);
end

VipGetAnimPop.scaleVipCenter = function(self )
  self.m_vipTextCode:addPropScale(5, kAnimNormal, 800, 500,0.2,1,0.2,1,kCenterDrawing);
end

VipGetAnimPop.scaleTextTipsCenter = function(self)
  self.m_textTips:addPropScale(5, kAnimNormal,1000, 100,0.2,1,0.2,1,kCenterDrawing);
end

VipGetAnimPop.onBgTouch = function( self)
  -- body
 delete(self);
end


VipGetAnimPop.s_controlConfig =
{   
    [VipGetAnimPop.s_controls.diamond] = {"bg","diamond"};  
    [VipGetAnimPop.s_controls.diamondLight] = {"bg","diamond","diamondLight"};  
    [VipGetAnimPop.s_controls.vipTextCode] = {"bg","vipTextCode"};  
    [VipGetAnimPop.s_controls.vipTextCodeLight] = {"bg","vipTextCode","vipTextCodeLight"};  
    [VipGetAnimPop.s_controls.textTips] = {"bg","textTips"};  
    [VipGetAnimPop.s_controls.textTipsLight] = {"bg","textTips","textTipsLight"};  
    [VipGetAnimPop.s_controls.sun] = {"bg","sun"}; 
    [VipGetAnimPop.s_controls.bg] = {"bg"};  
};

VipGetAnimPop.s_controlFuncMap =
{
   [VipGetAnimPop.s_controls.bg] = VipGetAnimPop.onBgTouch
    
};




