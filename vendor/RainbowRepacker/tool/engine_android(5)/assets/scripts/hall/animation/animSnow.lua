
require("common/uiFactory");
require("uiex/urlImage");
require("core/constants");
math.randomseed(tostring(os.time()):reverse():sub(1, 10))

--@kellyLiu
--飘雪效果
AnimSnow = class();
AnimSnow.ctor = function(self) 
    
 self.updateCount = 0;
 self.m_snows = {};    
end 
AnimSnow.dtor = function(self)
  -- body
  delete(self.m_animTimer);
  for k,v in pairs(self.m_snows) do
    delete(v)
  end
end

--r雪花震动半径
--w,h，雪花出现范围
--num，产生雪花数量
AnimSnow.play = function(self,r,w,h,num)
  local node = new(Node);
  node:setSize(w,h);
 

  delete(self.m_animTimer);
  
  self.m_animTimer = AnimFactory.createAnimInt(kAnimRepeat, 0, 0 ,5, 0);
  self.m_animTimer:setEvent(self,function(self)
  self.m_animTimer:setDebugName("AnimSnow|timer");
      
      if #self.m_snows<num and self.updateCount%10 == 0 then
        local snow = new(Snow,r,w,h);
        node:addChild(snow); 
        table.insert(self.m_snows,snow);  

      end   
      
      for k,v in pairs(self.m_snows) do
        
        v:update();

      end
      self.updateCount = self.updateCount+1;
	  self.updateCount = ( self.updateCount > 10 and 1 or self.updateCount) --防止溢出，意义不大
  end);
  return node;
end


Snow = class(Node) 
Snow.ctor = function(self,r,w,h)
  self.cury = 0;
  self.curx = 0;
  self.m_r = r;
  self.m_snowDot = UICreator.createImg("hall/common/snow.png", self.curx, self.cury );
  self:setSize(w,h);
  
  self.m_direction =  1 
  if math.random(200)%2 == 0 then 
   self.m_direction = -1; 
  end  
  self:setPos(math.random(w),0);
  local d = math.random(40);
  self.m_snowDot:setSize(d, d);
  self.m_snowDot:setPos(math.random(w),math.random(h));
  self:addChild(self.m_snowDot);
end
Snow.update = function(self )
  -- body
  
  local x,y = self.m_snowDot:getPos();
  self.cury = self.cury+2;
 
  self.curx = self.m_direction * math.sin(math.rad(self.cury))*(self.m_r);
  self.m_snowDot:setPos(self.curx,self.cury);
  
  if self.cury >= System.getScreenScaleHeight() then 
     self.cury = 0;
  else 
   
   self.m_snowDot:removeProp(self.m_snowDot.m_drawingID);
   self.m_snowDot:addPropTranslate(self.m_snowDot.m_drawingID,kAnimNormal,5,0,0,self.curx- x,0,self.cury- y);
  end 
end




