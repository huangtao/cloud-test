local match_hall_enroll_list_layout = require(ViewPath .. "hall/matchHall/widget/match_hall_enroll_list_layout");

-- 已报名列表
local GameMatchHallHorizontaEnrollList = class(CommonGameLayer, false);

local h_index = 0
local getIndex = function(self)
    h_index = h_index + 1
    return h_index
end

GameMatchHallHorizontaEnrollList.s_controls = 
{
    content = getIndex(),
    closeBtn = getIndex(),
    listView = getIndex(),
    confirmBtn = getIndex(),
    tips = getIndex(),
};


GameMatchHallHorizontaEnrollList.s_cmds = 
{

};

GameMatchHallHorizontaEnrollList.Delegate = {
    onMatchItemClick = "onMatchItemClick",
    onMatchEnrollListClose = "onMatchEnrollListClose",
}

GameMatchHallHorizontaEnrollList.ctor = function(self)
    super(self, match_hall_enroll_list_layout);
   
    self:setFillParent(true, true);
    self:setAlign(kAlignCenter);
    self:setEventTouch(self, self.onEmptyFunc)
    self:setEventDrag(self, self.onEmptyFunc);
    self:_initView();
end

GameMatchHallHorizontaEnrollList.dtor = function(self)
    if self.m_enrollList then
        delete(self.m_enrollList)
        self.m_enrollList = nil
    end
end

GameMatchHallHorizontaEnrollList.isShowing = function(self)
    return self.m_isShowing;
end

GameMatchHallHorizontaEnrollList.onEmptyFunc = function(self)
end

GameMatchHallHorizontaEnrollList.onCloseBtnClick = function(self)
    self:execDelegate(GameMatchHallHorizontaEnrollList.Delegate.onMatchEnrollListClose, true)
end

GameMatchHallHorizontaEnrollList.onConfirmBtnClick = function(self)
    self:execDelegate(GameMatchHallHorizontaEnrollList.Delegate.onMatchEnrollListClose, true)
end

GameMatchHallHorizontaEnrollList.refreshMatchList = function(self, data)
    self.m_data = data
    if table.isEmpty(self.m_data) then
        self:setTipShowState(true)
        return
    end
    self:setTipShowState(false)
    if not self.m_enrollList then
        local w,h = self.m_listView:getSize()
        self.m_enrollList = UIFactory.createScrollView(0,0,w,h,true)
        self.m_listView:addChild(self.m_enrollList)
    end
    self.m_enrollList:removeAllChildren(true)
    for i,v in ipairs(self.m_data) do
        local EnrollItem = require("hall/matchHall/gameMatchHall/gameMatchHallHorizontalView/gameMatchHallEnrollItem")
        local view = new(EnrollItem, v)
        self.m_enrollList:addChild(view)
        view:setDelegate(self)
    end
end

GameMatchHallHorizontaEnrollList._initView = function(self)
    self.m_content = self:findViewById(self.s_controls.content);
    self.m_listView = self:findViewById(self.s_controls.listView);
    self.m_tips = self:findViewById(self.s_controls.tips)
end

GameMatchHallHorizontaEnrollList.setTipShowState = function(self, state)
    self.m_tips:setVisible(state)
    self.m_listView:setVisible(not state)
end

GameMatchHallHorizontaEnrollList.onMatchItemClick = function(self, data)
    self:execDelegate(GameMatchHallHorizontaEnrollList.Delegate.onMatchEnrollListClose, true)
    self:execDelegate(GameMatchHallHorizontaEnrollList.Delegate.onMatchItemClick, data)
end

--------------------------------------------------------------------------------
GameMatchHallHorizontaEnrollList.s_controlConfig =
{   
    [GameMatchHallHorizontaEnrollList.s_controls.content] = {"content"};
    [GameMatchHallHorizontaEnrollList.s_controls.closeBtn] = {"content", "closeBtn"};
    [GameMatchHallHorizontaEnrollList.s_controls.listView] = {"content", "listBg", "listView"};
    [GameMatchHallHorizontaEnrollList.s_controls.confirmBtn] = {"content", "confirmBtn"};
    [GameMatchHallHorizontaEnrollList.s_controls.tips] = {"tips"};
};

GameMatchHallHorizontaEnrollList.s_controlFuncMap =
{
    [GameMatchHallHorizontaEnrollList.s_controls.closeBtn] = GameMatchHallHorizontaEnrollList.onCloseBtnClick;
    [GameMatchHallHorizontaEnrollList.s_controls.confirmBtn] = GameMatchHallHorizontaEnrollList.onConfirmBtnClick;
};

GameMatchHallHorizontaEnrollList.s_cmdConfig =
{
};

return GameMatchHallHorizontaEnrollList;