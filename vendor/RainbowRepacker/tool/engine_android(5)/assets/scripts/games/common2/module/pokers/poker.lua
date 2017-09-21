
require("games/common2/pokers/layout/poker");
require("games/common2/pokers/pokersConfig");

Poker_CardState = 
{
    Normal = 1;
    NormalSelected = 2; 
    Popup = 3;
    popupSelected  = 4;
    Dragging = 5;
    Waiting = 6;
    End = 7;
};

Poker = class(CommonGameLayer,false);

Poker.s_controls =
{   
    back = ToolKit.getIndex();
    fore = ToolKit.getIndex();
    numIcon = ToolKit.getIndex();
    smallIcon = ToolKit.getIndex();
    bigIcon = ToolKit.getIndex();
};

Poker.s_controlConfig =
{   
    [Poker.s_controls.back]                 = {"back"},
    [Poker.s_controls.fore]                 = {"fore"},
    [Poker.s_controls.numIcon]              = {"fore","numIcon"},
    [Poker.s_controls.smallIcon]            = {"fore","smallIcon"},
    [Poker.s_controls.bigIcon]              = {"fore","bigIcon"},
};

--showType：展示类型：正面、背面
Poker.ctor = function (self,pokerByte,showType,scale)
    super(self,poker);
    self.m_ctrl = Poker.s_controls;
    self:setSize(self.m_root:getSize());

    self.m_byte     = pokerByte;

    self.m_type,self.m_value = PokersConfig.getPokerTypeAndValue(pokerByte);

    self.m_lastStatus = nil;
    self.m_status = Poker_CardState.Normal;
    
    self:_initView(showType);
    self:_scalePoker(scale);
end

Poker.setStatus = function(self,status)
    self.m_lastStatus = self.m_status;
    self.m_status = status;
end

Poker.isStatusChanged = function(self)
    return self.m_status ~= self.m_lastStatus;
end

Poker.getValue = function(self)
    return self.m_value;
end

Poker.getType = function(self)
    return self.m_type;
end

Poker.getByte = function(self)
    return self.m_byte;
end

Poker.getStatus = function(self)
    return self.m_status;
end

Poker.getLastStatus = function(self)
    return self.m_lastStatus;
end

Poker.isLaizi = function(self)
    return self.m_isLaizi;
end

Poker.setSortIndex = function(self,index)
    self.m_sortIndex = index;
end

Poker.getSortIndex = function(self)
    return self.m_sortIndex;
end

Poker.changePoker = function(self, pokerByte)
    self.m_byte     = pokerByte;
    self.m_type,self.m_value = PokersConfig.getPokerTypeAndValue(pokerByte);
    self:_initPokerValue();
end

Poker.changeShowType = function(self,showType)
    self.m_foreBg = self:findViewById(self.m_ctrl.fore);
    self.m_backBg = self:findViewById(self.m_ctrl.back);
    local isShowBack = showType == PokersConfig.s_showType.Back;
    self.m_foreBg:setVisible(not isShowBack);
    self.m_backBg:setVisible(isShowBack);
end

Poker._scalePoker = function(self,scale)
    scale = number.valueOf(scale,1);
    if scale ~= 1 then 
        self.m_root:addPropScaleSolid(100, scale, scale, kCenterDrawing);
    end 
end

Poker._initView = function(self,showType)
   self:changeShowType(showType);      
   self:_initPokerValue();
end

Poker._initPokerValue = function(self)
    self.m_numIcon = self:findViewById(self.s_controls.numIcon);
    self.m_smallIcon = self:findViewById(self.s_controls.smallIcon);
    self.m_bigIcon = self:findViewById(self.s_controls.bigIcon);

    local filesMap = PokersConfig.getPokerFilesMap(self.m_type,self.m_value);

    if filesMap.numFile then
        self.m_numIcon:setFile(filesMap.numFile);
    end 

    if filesMap.smallIcon then
        self.m_smallIcon:setFile(filesMap.smallIcon);
    else
        self.m_smallIcon:setVisible(false);
        local w, h = self.m_numIcon.m_res.m_width,self.m_numIcon.m_res.m_height;
        self.m_numIcon:setSize(w, h);
    end

    if filesMap.bigIcon then
        self.m_bigIcon:setFile(filesMap.bigIcon);
    end 

    if filesMap.foreBg then 
        self.m_foreBg:setFile(filesMap.foreBg);
    end 

    if filesMap.backBg then 
        self.m_backBg:setFile(filesMap.backBg);
    end 
end

Poker.dtor = function (self)
end
