require("uilibs/richText");

local ViewBase = require("games/common2/module/viewBase");

-- 赛制弹框
local MatchRuleView = class(ViewBase, false);

MatchRuleView.s_controls = 
{
    textViewCurrent = ToolKit.getIndex(),
    textViewNext = ToolKit.getIndex(),
    tipsViewDL = ToolKit.getIndex(),
    tipsViewDJ = ToolKit.getIndex(),
    content = ToolKit.getIndex(),
};

MatchRuleView.ctor = function(self,seat,viewConfig)
    super(self, viewConfig);
    self:setFillParent(true,true);
    self:setEventTouch(self, self._onTouchEvent);
    self:setEventDrag(self, self._onEmptyFunc);

    self:_initData();

    self:hide();
end

MatchRuleView.dtor = function(self)
end

--------------------------------------private----------------------------------------------
MatchRuleView._initData = function(self)
    self.m_data = {};
end

-- MatchRuleView._initView = function(self)
--     -- 打立出局
--     local tipsViewDL = self:findViewById(self.s_controls.tipsViewDL);
--     tipsViewDL:removeAllChildren(true);

--     local stageDL = self:_createTextStage("打立出局");
--     local stageDescDL = self:_createTextStageDesc("为当选手积分低于淘汰线时，将会淘汰出局。");
--     local w, _ = stageDL:getSize();
--     stageDescDL:setPos(w);
--     tipsViewDL:addChild(stageDL);
--     tipsViewDL:addChild(stageDescDL);

--     -- 定局积分
--     local tipsViewDJ = self:findViewById(self.s_controls.tipsViewDJ);
--     tipsViewDJ:removeAllChildren(true);

--     local stageDJ = self:_createTextStage("定局积分");
--     local stageDescDJ = self:_createTextStageDesc("为所有选手打固定局数，打完后进行积分排位。");
--     local w, _ = stageDJ:getSize();
--     stageDescDJ:setPos(w);
--     tipsViewDJ:addChild(stageDJ);
--     tipsViewDJ:addChild(stageDescDJ);
-- end

MatchRuleView._onTouchEvent = function(self,finger_action,x,y,drawing_id_first,drawing_id_current)
    if finger_action == kFingerUp then
        self:hide();
    end    
end

MatchRuleView._resetView = function(self)
    self:findViewById(self.s_controls.textViewCurrent):setText("");
    self:findViewById(self.s_controls.textViewNext):setText("");
end

MatchRuleView.onShowView = function(self,seat,uid,info,isFast)
    info = table.verify(info);
    self:_resetView();
    self.m_dataPos = tonumber(info.pos) or 0;
    if table.isEmpty(self.m_data[self.m_dataPos]) then
        SocketIsolater.getInstance():sendMsg(MatchSocketCmd.MATCH_RULE_REQUEST);
    else
        self:_showData(self.m_data[self.m_dataPos]);
    end
    self:setContentPos(info.x, info.y);
    self:show();
end

MatchRuleView.setContentPos = function(self, x, y)
    if x and y then
        local content = self:findViewById(self.s_controls.content);
        content:setAlign(kAlignTopLeft);
        local w, h = content:getSize();
        content:setPos(x - w/2, y - h);
    end
end

MatchRuleView.onHideView = function(self,seat,uid,info,isFast)
    self:hide();
end

MatchRuleView.onGetRuleInfo = function(self,seat,uid,info,isFast)
    if table.isEmpty(info) or not self.m_dataPos then
        return;
    end

    self.m_data[self.m_dataPos] = info;
    self:_showData(info);
end

MatchRuleView._showData = function(self, data)
    local currentStr = self:_getCurrentStageString(data);
    local nextStr = self:_getNextStageString(data);

    self:findViewById(self.s_controls.textViewCurrent):setText(currentStr);
    self:findViewById(self.s_controls.textViewNext):setText(nextStr);
end

MatchRuleView._getCurrentStageString = function(self, data)
    if data.stageCurrent == 1 then
        return string.format("前%s晋级，剩余%s人时当前阶段比赛结束", data.promotionNumCurrent, data.TillWeedoutNumCurrent);
    else
        return string.format("前%s名可晋级下一轮", data.promotionNumCurrent);
    end
end

MatchRuleView._getNextStageString = function(self, data)
    if data.stageNext == -1 then
        return "无"
    end
    local stageName = (data.stageNext == 1) and "打立出局" or "定局积分"; -- 阶段 1:打立出局 2:定局移位 3:定局积分
    local str = "%s，%s轮%s局积分排名";
    return string.format(str, stageName, data.roundNumNext, data.bureauNumNext);
end

MatchRuleView._createTextStage = function(self, str)
    local text = UIFactory.createText(tostring(str or "") or "", 20, 20, 20, kAlignLeft, 237, 161, 97);
    return text;
end

MatchRuleView._createTextStageDesc = function(self, str)
    local text = UIFactory.createText(tostring(str or "") or "", 20, 20, 20, kAlignLeft, 144, 121, 88);
    return text;
end

MatchRuleView.s_controlConfig =
{   
    [MatchRuleView.s_controls.textViewCurrent] = {"content", "contentView", "textViewCurrent"};
    [MatchRuleView.s_controls.textViewNext] = {"content", "contentView", "textViewNext"};
    [MatchRuleView.s_controls.tipsViewDL] = {"content", "contentView", "tipsView", "tipsViewDL"};
    [MatchRuleView.s_controls.tipsViewDJ] = {"content", "contentView", "tipsView", "tipsViewDJ"};
    [MatchRuleView.s_controls.content] = {"content"};
};

MatchRuleView.s_controlFuncMap =
{

};

MatchRuleView.s_actionFuncMap = {
    [MatchMechineConfig.ACTION_SHOW_RULE_VIEW] = "onShowView";
    [MatchMechineConfig.ACTION_HIDE_RULE_VIEW] = "onHideView";
    [MatchMechineConfig.ACTION_GET_RULE_INFO] = "onGetRuleInfo";
};

return MatchRuleView;