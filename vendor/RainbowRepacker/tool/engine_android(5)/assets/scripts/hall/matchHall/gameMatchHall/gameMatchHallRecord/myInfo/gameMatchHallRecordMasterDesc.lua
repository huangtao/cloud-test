require("common/popupWindow");
local match_hall_record_master_desc_layout = require(ViewPath .. "hall/matchHall/widget/match_hall_record_master_desc_layout");
require("hall/matchHall/gameMatchHall/data/matchRecordDataInterface");

-- 大师分描述
local GameMatchHallRecordMasterDesc = class(PopupWindow, false);

local h_index = 0;
local getIndex = function(self)
    h_index = h_index + 1;
    return h_index;
end

GameMatchHallRecordMasterDesc.s_controls = 
{
    contentBg = getIndex();
    textView = getIndex();
};

GameMatchHallRecordMasterDesc.Delegate = {
}


GameMatchHallRecordMasterDesc.s_cmds = 
{

};


GameMatchHallRecordMasterDesc.ctor = function(self)
    super(self, match_hall_record_master_desc_layout);
   
    self:setFillParent(true, true);
    self:setAlign(kAlignCenter);
    self:setEventTouch(self, self.onBgTouch)
    self:setEventDrag(self, self.onEmptyFunc);
    self:_initView();

    self:addToRoot();
end

GameMatchHallRecordMasterDesc.dtor = function(self)
end

GameMatchHallRecordMasterDesc.isShowing = function(self)
    return self.m_isShowing;
end

GameMatchHallRecordMasterDesc.show = function(self, data)
    PopupWindow.show(self, PopupWindowStyle.NORMAL);

    self.m_isShowing = true;

    self:_initData(data);
    self:_showData();
end

GameMatchHallRecordMasterDesc.hidden = function(self)
    if self.m_isShowing then
        self.m_isShowing = false;
        PopupWindow.hidden(self, PopupWindowStyle.NORMAL);
    end
end

GameMatchHallRecordMasterDesc.setContentPos = function(self, x, y)
    local w, h = self.m_contentBg:getSize();
    self.m_contentBg:setAlign(kAlignTopLeft);
    self.m_contentBg:setPos(x - w / 2, y);
end

GameMatchHallRecordMasterDesc.onEmptyFunc = function(self)
end

GameMatchHallRecordMasterDesc.onBgTouch = function(self, action)
    if action == kFingerUp then
        self:_closeView();
    end
end

GameMatchHallRecordMasterDesc._closeView = function(self)
    EventDispatcher.getInstance():dispatch(kClosePopupWindows);
end

GameMatchHallRecordMasterDesc._initData = function(self, data)
    self.m_data = data;
end

GameMatchHallRecordMasterDesc._showData = function(self)
    local data = self.m_data;

    local desc = MatchRecordDataInterface.getInstance():getMasterPointDesc();
    self.m_textView:setText(desc);

    self:_checkContentSize();
end

GameMatchHallRecordMasterDesc._initView = function(self)
    self.m_contentBg = self:findViewById(self.s_controls.contentBg);
    self.m_textView = self:findViewById(self.s_controls.textView);
end

GameMatchHallRecordMasterDesc._resetView = function(self)
    self.m_textView:setText("");
end

GameMatchHallRecordMasterDesc._checkContentSize = function(self)
    if self.m_textView.m_res and self.m_contentBg.m_res then
        local textH = self.m_textView.m_res:getHeight();
        self.m_textView:setSize(nil, textH);
    end
end

--------------------------------------------------------------------------------
GameMatchHallRecordMasterDesc.s_controlConfig =
{   
    [GameMatchHallRecordMasterDesc.s_controls.contentBg] = {"contentBg"};
    [GameMatchHallRecordMasterDesc.s_controls.textView] = {"contentBg", "textView"};
};

GameMatchHallRecordMasterDesc.s_controlFuncMap =
{
};

GameMatchHallRecordMasterDesc.s_cmdConfig =
{
};

return GameMatchHallRecordMasterDesc;