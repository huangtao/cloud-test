
require("games/common2/animation/moneyAnim");
local reward = require(ViewPath.."games/gamesCommon/reward");

--[[
    宝箱开启后的奖励界面
]]

local RoomReward = class(CommonGameLayer,false);

RoomReward.s_controls = { 
    diamondView     = ToolKit.getIndex();
    diamond         = ToolKit.getIndex();
    diamondShadow   = ToolKit.getIndex();
    moneyView       = ToolKit.getIndex();
    moneyShadow     = ToolKit.getIndex();
    money           = ToolKit.getIndex();
    halo            = ToolKit.getIndex();
};

RoomReward.TYPE_DIAMOND = 2;
RoomReward.TYPE_MONEY = 1;

RoomReward.ctor = function(self,mtype,prize) 
    super(self,reward);
    self.m_ctrl = RoomReward.s_controls;
    self.m_diamondView = self:findViewById(self.m_ctrl.diamondView);
    self.m_diamondShadow = self:findViewById(self.m_ctrl.diamondShadow);
    self.m_diamond =  self:findViewById(self.m_ctrl.diamond); 
    self.m_moneyView = self:findViewById(self.m_ctrl.moneyView);
    self.m_moneyShadow = self:findViewById(self.m_ctrl.moneyShadow);
    self.m_money = self:findViewById(self.m_ctrl.money);
    self.m_halo = self:findViewById(self.m_ctrl.halo);
    self.m_type = mtype;
    if mtype == RoomReward.TYPE_MONEY then 
        self.m_diamondView:setVisible(false);
        self.m_moneyView:setVisible(true);
        self.m_shadow = self.m_moneyShadow;
    else 
        self.m_diamondView:setVisible(true);
        self.m_moneyView:setVisible(false);
        self.m_shadow = self.m_diamondShadow;
    end  
    self.m_prize = prize or 12;
    self:addToRoot();
    self:setVisible(false);
end 

RoomReward.play = function(self,time,startx,starty,endx,endy)
    --time基础延迟时间 
    ---向上移动
    self:setVisible(true);

    self:setPos(startx,starty);
    self.m_startx = startx;
    self.m_starty = starty;
    self.m_endx = endx;
    self.m_endy = endy;
    self:removeProp(3);
    self:addPropTransparency(3, kAnimNormal,  10,time, 0,1);

    self:removeProp(1);
    self:addPropTranslate(1,kAnimNormal,200,time,0,0,0,-137);
    --200毫秒之后变宽
    self:removeProp(2);
    local anis =  self:addPropScale(2, kAnimNormal, 150, time+200,0.5,1,0.5,1,kCenterXY,0,0);
    if anis then
        anis:setDebugName("RoomReward.play| anis");
        anis:setEvent(self,self.readyGo);
    end
end

--冲向头像之前先后退一下
RoomReward.readyGo = function(self)
  
    self:removeProp(1);
    self:removeProp(2);
    self:removeProp(3);
    self.m_shadow:removeProp(4);
    self.m_shadow:addPropTransparency(4, kAnimNormal, 500 ,0, 1,0);
    self:setPos(self.m_startx,self.m_starty-137);
    ---显示光晕动画
    self.m_halo:setVisible(true);
    self.m_halo:addPropRotate(5, kAnimRepeat, 3000, 0,0,360,kCenterDrawing);
    --800之后退
    local anit = self:addPropTranslate(1,kAnimNormal,800,200,0,0,0,-50);
    if anit then
        anit:setDebugName("RoomReward.readyGo| anit");
        anit:setEvent(self,self.go);
    end
end

--一路冲向头像
RoomReward.go = function(self)
    self:removeProp(1);
    self.m_startx = self.m_startx;
    self.m_starty = self.m_starty-137-50;

    self:addPropScale(2, kAnimLoop, 500, 0,1,0.5,1,0.5,kCenterXY,-181/2,-150/2);
    self:setPos(self.m_startx,self.m_starty);
    local anit = self:addPropTranslate(1,kAnimNormal,500,0,0,self.m_endx - self.m_startx,0,self.m_endy - self.m_starty);
    if anit then
        anit:setDebugName("RoomReward.go| anit");
        anit:setEvent(self,function(self)
            if RoomReward.TYPE_MONEY == self.m_type then 
                local money = (self.m_prize or 0) + UserPropertyIsolater.getInstance():getMoney();
                local propertyId = UserPropertyIsolater.getInstance():getPropertySilverCoinID();
                UserPropertyIsolater.getInstance():setMoneyById(propertyId,money);
                local localSeatId = GamePlayerManager2.getInstance():getLocalSeatByMid(UserBaseInfoIsolater.getInstance():getUserId());
                local info = { {key = "money", value = money, propertyId = propertyId } };
                GamePlayerManager2.getInstance():updatePlayerInfo(localSeatId, info);
            else 
                local diamond = (self.m_prize or 0) + UserPropertyIsolater.getInstance():getDiamond();
                local propertyId = UserPropertyIsolater.getInstance():getPropertyDiamondID();
                UserPropertyIsolater.getInstance():setDiamond(diamond, propertyId);
                local localSeatId = GamePlayerManager2.getInstance():getLocalSeatByMid(UserBaseInfoIsolater.getInstance():getUserId());
                local info = { {key = "diamond", value = diamond, propertyId = propertyId} };
                GamePlayerManager2.getInstance():updatePlayerInfo(localSeatId, info);
            end 

            local fireWork = new(BoxFireWorkAnim2);
            self.fireWork = fireWork
            Log.d("RoomReward.go", "===========================")
            fireWork:play(self.m_endx-100,self.m_endy-60):addToRoot();
            self:setVisible(false);
            local money = new(MoneyAnim2,self.m_prize,self.m_endx-100,self.m_endy-60);
            self.money = money;
            money:play();
            money:addToRoot();

            -- 更新界面玩家银币数
            local action = GameMechineConfig.ACTION_NS_UPDATE_USERINFO;
            MechineManage.getInstance():receiveAction(action);
        end);
    end
end

RoomReward.dtor = function(self )
    self:removeAllChildren();
    if self.fireWork then
        Log.d("RoomReward.dtor", "======================")
        -- self.fireWork:release()
        delete(self.fireWork)
        self.fireWork = nil
    end
    if self.money then
        -- self.money:stop()
        delete(self.money)
        self.money = nil
    end
end

RoomReward.s_controlConfig =
{   
    [RoomReward.s_controls.diamondView] = {"diamondView"};
    [RoomReward.s_controls.diamondShadow] = {"diamondView","diamondShadow"};
    [RoomReward.s_controls.diamond] = {"diamondView","diamond"};
    [RoomReward.s_controls.moneyView] = {"moneyView"};
    [RoomReward.s_controls.moneyShadow] = {"moneyView","moneyShadow"};
    [RoomReward.s_controls.money] = {"moneyView","money"};
    [RoomReward.s_controls.halo] = {"halo"};
      
};

RoomReward.s_controlFuncMap =
{
        
};

return RoomReward;