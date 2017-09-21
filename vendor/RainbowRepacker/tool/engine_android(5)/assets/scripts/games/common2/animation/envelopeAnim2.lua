
local envelopAnimLayout = require(ViewPath.."games/gamesCommon/envelopAnimLayout");
local envelopPin2_map = require("qnFiles/qnPlist/games/envelopPin2")


--房间内添加好友信封飞落动画
EnvelopeAnim2 = class(CommonGameLayer,false);

EnvelopeAnim2.s_controls = { 
    wing1       = ToolKit.getIndex();
    wing2       = ToolKit.getIndex();
    envelope    = ToolKit.getIndex();
    stars       = ToolKit.getIndex();
    star1       = ToolKit.getIndex();
    star2       = ToolKit.getIndex();
    star3       = ToolKit.getIndex();
    star4       = ToolKit.getIndex();
    star5       = ToolKit.getIndex();
    star6       = ToolKit.getIndex();
    star7       = ToolKit.getIndex();
    star8       = ToolKit.getIndex();
    star9       = ToolKit.getIndex();
    star10      = ToolKit.getIndex();   
};

EnvelopeAnim2.ctor = function(self,data) 
    super(self,envelopAnimLayout);
    self.m_ctrls = EnvelopeAnim2.s_controls;
    self.m_wing1 =  self:findViewById(EnvelopeAnim2.s_controls.wing1);
    self.m_wing2 =  self:findViewById(EnvelopeAnim2.s_controls.wing2);
    self.m_envelope = self:findViewById(EnvelopeAnim2.s_controls.envelope);
    self.m_pstars = self:findViewById(EnvelopeAnim2.s_controls.stars);

    self.m_pstars:setVisible(false);
    self.m_stars = {};
    for i=1,10 do
      table.insert(self.m_stars,self:findViewById(EnvelopeAnim2.s_controls[string.concat("star",i)]));
    end

    self:setPos(200,200);
    self.m_data = data;
end 

EnvelopeAnim2.play = function(self,startPoint,endPoint )
  self:setVisible(true);
  --旋转翅膀
  self:rotateWings();
  --星星渐变闪过烁
  self:twinkleStar();
  --信封上下摇摆
  self:shakeEnvelop();
  ---y轴镜像
 
  local dy =  endPoint.y -  startPoint.y;
  local dx = (endPoint.x - startPoint.x);
  local tan = dy/dx;

  local angle = math.deg(math.atan(tan));
  angle = math.abs(angle);

  --安普通坐标系象限计算
  if dy < 0 and dx >0 then 
    angle = - angle;
  elseif dy>0 and dx>0 then 
    angle = angle;
  elseif dy>0 and dx<0 then 
    angle = 180 - angle;
  elseif dy<0 and dx<0 then 
      angle = -(180 - angle)
  elseif dy > 0 and dx == 0 then 
    angle = 90;
  elseif dy < 0 and dx == 0 then 
    angle = -90;
  elseif dy == 0 and dx < 0  then
    angle = -180; 
  end  
  
  self.m_particleStar = ParticleSystem.getInstance():create("games/common/animation/messagefly/star.png", ParticleTail, 0, 0,nil,kParticleTypeForever,100,{["h"] = 50,["w"] = 100;["scale"]=1;["direction"]=4});
  self.m_particleStar:addPropRotate(self.m_particleStar.m_drawingID, kAnimNormal, 500, 0,angle-10,angle+10,kCenterXY,0,25);
  self.m_particleStar:start();
  local w,h = self.m_particleStar:getSize();
  self.m_particleStar:setAlign(kAlignCenter);
  self.m_particleStar:setPos(180,50);
  self:addChild(self.m_particleStar);
  --整体位移动画
  self:setPos(startPoint.x,startPoint.y);
  self:removeProp(self.m_drawingID);
  local anim = self:addPropTranslate(self.m_drawingID,kAnimNormal,1500,1000,0,endPoint.x- startPoint.x,0,endPoint.y- startPoint.y);
  anim:setEvent(self,function(self)
    self.m_wing1:removeProp(self.m_wing1.m_drawingID);
    self.m_wing2:removeProp(self.m_wing2.m_drawingID);
    self.m_wing2:addPropTransparency(self.m_wing2.m_drawingID+1, kAnimNormal, 300,0, 1,0);
    self.m_wing1:addPropTransparency(self.m_wing1.m_drawingID+1, kAnimNormal, 300,0, 1,0);
    self.m_envelope:removeProp(self.m_envelope.m_drawingID);
    local frameAnim = new(AnimFrameNew,envelopPin2_map,130,0);
    frameAnim:setEndCallBack(self,self.onEnd);
    frameAnim:playInNode(self.m_envelope);
  end);
end

EnvelopeAnim2.setEndCallBack = function (self,obj,callbackFun)
   self.obj = obj;
   self.callbackFun = callbackFun;
end 

EnvelopeAnim2.onEnd = function(self)
  if self.m_data then 
        if self.obj then 
          if self.callbackFun then 
            self.callbackFun(self.obj,self.m_data);
          end 
        end 
  end 
  self:stop();
end

EnvelopeAnim2.stop = function(self)
  delete(self)
end

EnvelopeAnim2.rotateWings = function( self )
  self.m_wing1:removeProp(self.m_wing1.m_drawingID);
  self.m_wing2:removeProp(self.m_wing2.m_drawingID);
  self.m_wing1:addPropRotate(self.m_wing1.m_drawingID, kAnimLoop, 400, 0,-10,10,kCenterXY,78,25);
  self.m_wing2:addPropRotate(self.m_wing2.m_drawingID, kAnimLoop, 400, 0,10,-10,kCenterXY,0,25);
  self.m_pstars:addPropRotate(self.m_pstars.m_drawingID, kAnimLoop, 400, 0,2,-2,kCenterXY,0,25);
end

EnvelopeAnim2.twinkleStar  = function(self)
  for k,v in pairs(self.m_stars) do
    v:removeProp(v.m_drawingID);
    v:removeProp(v.m_drawingID+1);
    v:addPropTransparency(v.m_drawingID, kAnimLoop, 300,(k%3)*100, 1,0.3);
    v:addPropRotate(v.m_drawingID+1, kAnimLoop, 500, 0,0,360,kCenterDrawing);
  end
end

EnvelopeAnim2.shakeEnvelop = function(self)
  self.m_envelope:removeProp(self.m_envelope.m_drawingID);
  self.m_envelope:addPropTranslate(self.m_envelope.m_drawingID,kAnimLoop,400,0,0,0,-11,0);
end

EnvelopeAnim2.s_controlConfig =
{   
    [EnvelopeAnim2.s_controls.envelope] = {"envelope"};  
    [EnvelopeAnim2.s_controls.wing1] = {"wing1"};  
    [EnvelopeAnim2.s_controls.wing2] = {"wing2"}; 
    [EnvelopeAnim2.s_controls.stars] = {"stars"};  
    [EnvelopeAnim2.s_controls.star1] = {"stars","star1"};
    [EnvelopeAnim2.s_controls.star2] = {"stars","star2"};
    [EnvelopeAnim2.s_controls.star3] = {"stars","star3"};
    [EnvelopeAnim2.s_controls.star4] = {"stars","star4"};
    [EnvelopeAnim2.s_controls.star5] = {"stars","star5"};
    [EnvelopeAnim2.s_controls.star6] = {"stars","star6"};
    [EnvelopeAnim2.s_controls.star7] = {"stars","star7"};
    [EnvelopeAnim2.s_controls.star8] = {"stars","star8"};
    [EnvelopeAnim2.s_controls.star9] = {"stars","star9"};
    [EnvelopeAnim2.s_controls.star10] = {"stars","star10"};
};





