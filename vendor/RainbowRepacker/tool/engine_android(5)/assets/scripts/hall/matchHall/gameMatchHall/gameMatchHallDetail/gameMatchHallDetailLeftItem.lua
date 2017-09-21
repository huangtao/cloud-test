local match_hall_detail_left_item_layout = require(ViewPath .. "/hall/matchHall/widget/match_hall_detail_left_item_layout")

-- 比赛详情奖励项下半部分
local GameMatchHallDetailLeftItem = class(CommonGameLayer, false)

local h_index = 0
local getIndex = function(self)
    h_index = h_index + 1
    return h_index
end

GameMatchHallDetailLeftItem.s_controls = 
{
    bg = getIndex(),
    line = getIndex(),
    ranking = getIndex(),
    reward = getIndex(),
    textView = getIndex(),
}

GameMatchHallDetailLeftItem.Delegate = {

}

GameMatchHallDetailLeftItem.ctor = function(self, data)
    super(self, match_hall_detail_left_item_layout)
    self.m_data = data
   
    self:_initView()
    self:_initData()
end


GameMatchHallDetailLeftItem._initView = function(self)
    self.m_bg = self:findViewById(self.s_controls.bg)
    self.m_line = self:findViewById(self.s_controls.line)
    self.m_ranking = self:findViewById(self.s_controls.ranking)
    self.m_reward = self:findViewById(self.s_controls.reward)
    self.m_textView = self:findViewById(self.s_controls.textView)
    self.m_textView:setScrollBarWidth(0)
end

GameMatchHallDetailLeftItem._initData = function(self)
    if self.m_data then
        self:setRanking(self.m_data.rank or "")
        self:setReward(self.m_data.desc or "")
        --self:setTextView(self.m_data.rank .. " ".. self.m_data.desc)
    end
end

GameMatchHallDetailLeftItem.setRanking = function(self ,text)
    if self.m_ranking then
        self.m_ranking:setText(text)
    end
end

GameMatchHallDetailLeftItem.setReward = function(self, text)
    if self.m_reward then
        local str = string.subUtfStrByCn(text, 1, 11, "");
        if string.len(text) > string.len(str) then
            str = string.subUtfStrByCn(text, 1, 10, "...");
        end
        self.m_reward:setText(str)
    end
end

GameMatchHallDetailLeftItem.setTextView = function(self, text)
    if self.m_textView then
        self.m_textView:setText(text)
    end
end

GameMatchHallDetailLeftItem.s_controlConfig =
{   
    [GameMatchHallDetailLeftItem.s_controls.bg] = {"bg"},
    [GameMatchHallDetailLeftItem.s_controls.line] = {"line"},
    [GameMatchHallDetailLeftItem.s_controls.ranking] = {"ranking"},
    [GameMatchHallDetailLeftItem.s_controls.reward] = {"reward"},
    [GameMatchHallDetailLeftItem.s_controls.textView] = {"textView"},
}

GameMatchHallDetailLeftItem.s_controlFuncMap =
{

}

return GameMatchHallDetailLeftItem