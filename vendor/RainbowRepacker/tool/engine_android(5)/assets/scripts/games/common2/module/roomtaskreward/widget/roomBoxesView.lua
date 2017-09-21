
local roomboxesLayer = require(ViewPath.."games/gamesCommon/roomboxesLayer");

--[[
    宝箱任务界面
]]
local RoomBoxesView = class(CommonGameLayer,false);

RoomBoxesView.s_controls = { 
    bg = ToolKit.getIndex();
};

RoomBoxesView.ctor = function(self,gameId) 
    super(self,roomboxesLayer);
    self.m_boxs = {};
    self.m_bg =  self:findViewById(RoomBoxesView.s_controls.bg);
    self:setFillParent(true,true);
    self:setVisible(false);
end 

RoomBoxesView.setMinePos = function ( self,x,y)
    self.mineX = x;
    self.mineY = y;

    for _,box in pairs(self.m_boxs) do 
        box:setMinePos(self.mineX,self.mineY);
    end 

    for _,box in pairs(self.m_boxs) do 
        box:setMinePos(self.mineX,self.mineY);
    end 
end

--进度完成，显示三个宝箱
RoomBoxesView.toCompleteState = function(self,data,gameId)
   if self.m_boxs then 
        self.m_bg:removeAllChildren();
        for i,v in ipairs(self.m_boxs) do
            delete(v);
            v = nil;
        end
        self.m_boxs = {};
   end 
   self:setVisible(true);
   local bw,bh = 0,0;
   local div = 320;
   for i=1,3 do
        local boxitem = require("games/common2/module/roomtaskreward/widget/roomBoxItem");
        local box = new(boxitem,i,data,gameId);
        box:setMinePos(self.mineX,self.mineY);
        box:setBoxClickCallback(self,self.onOneBoxClick);
        bw,bh = box:getSize();
        self.m_bg:addChild(box);
        table.insert(self.m_boxs,box);
   end
   local totalW = 3*bw+2*div;
   for k,v in pairs(self.m_boxs) do
        v:setPos((k-1)*(bw+div)+(System.getScreenScaleWidth() - totalW)/2-80,200);
   end
   self:stop();
   self.m_totalTimer = AnimFactory.createAnimInt(kAnimNormal, 0, 1 ,5000, 0);
   self.m_totalTimer:setEvent(self,self.onTotalTimer);
   self.m_totalTimer:setDebugName("RoomBoxesView|self.m_totalTimer");
end

RoomBoxesView.stop = function(self)
    delete(self.m_totalTimer);
    self.m_totalTimer = nil;
end

RoomBoxesView.onTotalTimer = function(self)
    self:stop();
    ---随机开启一个
    math.randomseed( os.time() )
    local rIndex = math.ceil(math.random(3));
    for k,v in pairs(self.m_boxs) do
      if rIndex == k then 
            v:onBoxClick();
            break;
      end 
    end
 -- self:opendOther(rIndex);
  --self:fade();
end
--牌局进度进行中，用广播条播放进度
RoomBoxesView.showProByBroadCastBar = function(self,data)
    Log.d("RoomBoxesView.showProByBroadCastBar--------",data.tips);
end

RoomBoxesView.setOneBoxClickEvent = function(self,obj,callbackFun )
   
   self.m_callbackObj = obj;
   self.m_callbackFun = callbackFun;

end
RoomBoxesView.onOneBoxClick = function(self,index,data)
    if self.m_callbackObj then 
        if self.m_callbackFun then
            self.m_callbackFun(self.m_callbackObj,data);
        end 
    end 
    self:stop();
    self:opendOther(index,data);
    self:fade();
end


RoomBoxesView.opendOther = function(self,index,data)
    local index1 = 1;
    for k,v in pairs(self.m_boxs) do
        if index ~= k then 
            if data.otherDatas then 
                if data.otherDatas[index1] then
                    v:setData(data.otherDatas[index1]); 
                else 
                    v:setData({["ptype"] = 0,["prize"]=0});
                end 
            end 
            v:onTimer();
            if index1 < 2 then 
                index1 = index1+1;
            end 
        end 
    end
end


RoomBoxesView.fade = function(self )
    self.m_bg:removeProp(1);
    local anit = self.m_bg:addPropTransparency(1, kAnimNormal, 500, 5000, 1,0);
    if anit then
    anit:setDebugName("RoomBoxesView.fade |anit");
    anit:setEvent(self,function(self)
            self:removeProp(1);
            self:removeAllChildren();
            for i,v in ipairs(self.m_boxs) do
                delete(v);
                v = nil;
            end
            self.m_boxs = {};
      end);
  end 
  
end

RoomBoxesView.dtor = function(self )
    self:stop();
    self:removeAllChildren();
    for i,v in ipairs(self.m_boxs or {}) do
        delete(v);
        v = nil;
    end
    self.m_boxs = {};
end

RoomBoxesView.onBgTouch = function( self)

end

RoomBoxesView.s_controlConfig ={   
    [RoomBoxesView.s_controls.bg] = {"t_bg"};  
};

RoomBoxesView.s_controlFuncMap ={
   [RoomBoxesView.s_controls.bg] = RoomBoxesView.onBgTouch
};

return RoomBoxesView;