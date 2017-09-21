
local roomBox = require(ViewPath.."games/gamesCommon/roomBox");
require("games/common2/module/roomtaskreward/anim/boxFireWorkAnim2");


--[[
    宝箱Item布局
]]

local RoomBoxItem = class(CommonGameLayer,false);
RoomBoxItem.data = {};


RoomBoxItem.s_controls = {
    box             = ToolKit.getIndex();
    neck            = ToolKit.getIndex();
    contentView     = ToolKit.getIndex();
    bottom          = ToolKit.getIndex();
    cover           = ToolKit.getIndex();
    diamond         = ToolKit.getIndex();
    money           = ToolKit.getIndex();
    coverOpened     = ToolKit.getIndex();
};

RoomBoxItem.Pop_preOpen = 1;
RoomBoxItem.TYPE_MONEY = 1;
RoomBoxItem.TYPE_DIAMOND = 2;
RoomBoxItem.TYPE_EMPTY = 3;

--gameId点击奖励落点坐标，即自己的头像坐标
RoomBoxItem.ctor = function(self,index,data,gameId) 
    super(self,roomBox);
    self.m_ctrl = RoomBoxItem.s_controls;
    self.m_box = self:findViewById(self.m_ctrl.box);
    self.m_neck = self:findViewById(self.m_ctrl.neck);
    self.m_contentView =  self:findViewById(self.m_ctrl.contentView); 
    self.m_bottom = self:findViewById(self.m_ctrl.bottom);
    self.m_diamond = self:findViewById(self.m_ctrl.diamond);
    self.m_money = self:findViewById(self.m_ctrl.money);
    self.m_cover = self:findViewById(self.m_ctrl.cover);
    self.m_coverOpened = self:findViewById(self.m_ctrl.coverOpened);
    self.m_opened = false;
    self.m_index = index;
    self.m_gameId= gameId;
    
    self.m_money:setVisible(false);
    self.m_diamond:setVisible(false);
    self:setData(data);
    RoomBoxItem.s_clickable = true;
end 

RoomBoxItem.setMinePos = function (self,mineX,mineY)
    self.mineX = mineX;
    self.mineY = mineY;
end

RoomBoxItem.setData = function(self,data )
    self.m_data = data;
    Log.d("setData",self.m_data);
end

RoomBoxItem.opendState = function(self)
    if self.m_data.ptype == RoomBoxItem.TYPE_DIAMOND then 
        self:setType(RoomBoxItem.TYPE_DIAMOND);
    elseif self.m_data.ptype == RoomBoxItem.TYPE_MONEY then
        self:setType(RoomBoxItem.TYPE_MONEY);
    end 
    if number.valueOf(self.m_data.prize) <= 0 then
        self:setType(RoomBoxItem.TYPE_EMPTY);
    end 
end

RoomBoxItem.setType = function(self, mType )
     if mType == RoomBoxItem.TYPE_MONEY then 
        self.m_money:setVisible(true);
        self.m_diamond:setVisible(false);
    elseif mType == RoomBoxItem.TYPE_DIAMOND then 
        self.m_money:setVisible(false);
        self.m_diamond:setVisible(true);
    else 
        self.m_money:setVisible(false);
        self.m_diamond:setVisible(false);
    end

end

RoomBoxItem.preOpendAni = function(self)
    self.m_box:removeProp(RoomBoxItem.Pop_preOpen);
    self.m_box:addPropScale(RoomBoxItem.Pop_preOpen, kAnimLoop, 150, 0,1,1,0.95,1,kCenterXY,200,200);
end

RoomBoxItem.openAni = function(self,isClick)
    local x,y = self.m_cover:getPos();
    self.m_cover:removeProp(1);
    local anit = self.m_cover:addPropTranslate(1,kAnimNormal,20,450,0,0,0,-31);
    if anit then
        anit:setDebugName("RoomBoxItem.openAni| anit");
        anit:setEvent(self,function(self)
            self:opendState();
            self.m_cover:removeProp(1);
            self.m_cover:setPos(x,y-31);
            self.m_cover:setVisible(false);
            self.m_coverOpened:setVisible(true);
            self.m_neck:setVisible(true);
            
            self.m_box:removeProp(RoomBoxItem.Pop_preOpen);
            local fireWork = new(BoxFireWorkAnim2);
            self.fireWork = fireWork
            self.m_box:addChild(fireWork:play(0,0));
        end);
    end
    self.m_opened = true;	
end

RoomBoxItem.dtor = function(self )
    -- delete(self.m_reward);
    -- self.m_reward = nil;
    self:removeAllChildren();
    self:onCleanAnim();
    if self.fireWork then
        delete(self.fireWork)
        self.fireWork = nil
    end
end
RoomBoxItem.onBoxClick = function(self )
    if not RoomBoxItem.s_clickable  then 
        return ;
    end 
    if not self.m_opened then 
        self:preOpendAni();
        self:openAni(true);
        local x , y = self:getPos();
        local myHeadPos = {self.mineX,self.mineY};
        if table.isTable(myHeadPos) then
            local param = {time = 800, startx = x + 50, starty = y, endx = myHeadPos[1], endy = myHeadPos[2], ptype = self.m_data.ptype, prize = self.m_data.prize};
            local action = GameMechineConfig.ACTION_NS_OPEN_BOX;
            MechineManage.getInstance():receiveAction(action, param);
        end

        if self.getrewardBtnCallBackObj then 
            if self.getrewardBtnClickCallback then 
                self.getrewardBtnClickCallback(self.getrewardBtnCallBackObj,self.m_index,self.m_data);
            end 
        end 
    end 
    RoomBoxItem.s_clickable = false;
end

RoomBoxItem.setBoxClickCallback = function(self,obj,func)
    self.getrewardBtnCallBackObj = obj;
    self.getrewardBtnClickCallback = func;
end

---没有被点选择的箱子动画
RoomBoxItem.onTimer = function(self)
    if not self.m_opened then
        --延后执行（等等点击的箱子动画播完）
        self:onCleanAnim();
        self.m_timer = AnimFactory.createAnimInt(kAnimNormal, 0, 1 ,2800, 0);
        self.m_timer:setDebugName("RoomBoxItem|self.m_timer");
        self.m_timer:setEvent(self,function(self)
            self:onCleanAnim();
            self:preOpendAni();
            self:openAni();
        end);
    end 
end 

RoomBoxItem.onCleanAnim = function(self)
   delete(self.m_timer);
   self.m_timer = nil;
end 

RoomBoxItem.s_controlConfig ={   
    [RoomBoxItem.s_controls.box]            = {"box"};
    [RoomBoxItem.s_controls.neck]           = {"box","neck"};
    [RoomBoxItem.s_controls.contentView]    = {"box","neck","contentView"};
    [RoomBoxItem.s_controls.bottom]         = {"box","bottom"};
    [RoomBoxItem.s_controls.cover]          = {"box","cover"};
    
    [RoomBoxItem.s_controls.diamond]        = {"box","neck","contentView","diamond"};
    [RoomBoxItem.s_controls.money]          = {"box","neck","contentView","money"};
    [RoomBoxItem.s_controls.coverOpened]    = {"box","cover_opened"};
};

RoomBoxItem.s_controlFuncMap ={
    [RoomBoxItem.s_controls.box] = RoomBoxItem.onBoxClick;   
};

return RoomBoxItem;