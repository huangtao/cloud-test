require("isolater/widget/privateRoomCustomView/customParamSetViewBase");
local customParamSetViewScore = require(ViewPath .. "isolater/privateRoomCustomView/customParamSetViewScore");

-- 私人房创建内容
local CustomParamSetViewScore = class(CustomParamSetViewBase, false);

local h_index = 0;
local getIndex = function(self)
    h_index = h_index + 1;
    return h_index;
end

CustomParamSetViewScore.s_maxTimesItem = 4; -- 倍数最大选择个数
CustomParamSetViewScore.s_maxRoundsItem = 4; -- 局数最大选择个数
CustomParamSetViewScore.s_maxTimes = 99999; -- 倍数最大自定义数量
CustomParamSetViewScore.s_maxRounds = 50;   -- 局数最大自定义数量

CustomParamSetViewScore.Delegate = {
}

CustomParamSetViewScore.s_controls = 
{
    timesView = getIndex(),
    roundsView = getIndex(),
    baseChipView = getIndex(),

    timesCustomView = getIndex(),
    timesEditor = getIndex(),
    roundsCustomView = getIndex(),
    roundsEditor = getIndex(),
    baseChipText = getIndex(),
    baseChipTitle = getIndex(),
    timesViewTitle = getIndex(),
    roundsViewTitle = getIndex(),
    timesViewItem = getIndex(),
    roundsViewItem = getIndex(),
    baseChipViewItem = getIndex(),
};

CustomParamSetViewScore.s_cmds = 
{
};

CustomParamSetViewScore.ctor = function(self, data) 
    super(self, data);
end

CustomParamSetViewScore.dtor = function(self)

end

CustomParamSetViewScore.resetParamData = function(self,data)
    CustomParamSetViewBase.resetParamData(self, data)

    data = table.verify(data);
    self:_resetParamDataTime(data.times);
    self:_resetParamDataRounds(data.rounds);
    self:_resetParamDataCommon();
end

CustomParamSetViewScore._resetParamDataCommon = function(self)
    local config = self.m_data.configList[self.m_defaultConfigIndex];
    if not table.isEmpty(config) then
        self.m_customParamData.tableType = config.tableType;
        self.m_customParamData.baseChip = number.valueOf(config.baseChip[1]);

        self:findViewById(self.s_controls.baseChipText):setText(number.valueOf(config.baseChip[1]));
    end
end

CustomParamSetViewScore._resetParamDataTime = function(self, num)
    local times = number.valueOf(num);
    local index;
    local customTimes = times;
    local config = self.m_data.configList[self.m_defaultConfigIndex];
    if times > 0 then 
        for k,v in ipairs(table.verify(config.times)) do 
            if number.valueOf(v) == times then 
                index = k;
                break;
            end 
        end 
        if not index then 
            index = 1;
        else 
            index = index + 1; --自定义的默认为1，其余的按顺序加1
            if index > (CustomParamSetViewScore.s_maxTimesItem + 1) then 
                index = 1;
            else 
                customTimes = 0;
            end 
        end 
    else 
        index = 2;
    end 

    self:findViewById(self.s_controls.timesView):setSelected(index);
    
    self:_resetTimesEditor();
    
    if customTimes > 0 then
        self.m_timesEditor:setText(customTimes);
    end

    self.m_defaultTimesIndex = index;
    self:_getGroupTimes(index);
end

CustomParamSetViewScore._resetParamDataRounds = function(self, num)
    local rounds = number.valueOf(num);
    local index;
    local customRounds= rounds;
    local config = self.m_data.configList[self.m_defaultConfigIndex];
    if rounds > 0 then 
        for k,v in ipairs(table.verify(config.rounds)) do 
            if number.valueOf(v) == rounds then 
                index = k;
                break;
            end 
        end 
        if not index then 
            index = 1;
        else 
            index = index + 1; --自定义的默认为1，其余的按顺序加1
            if index > (CustomParamSetViewScore.s_maxRoundsItem + 1) then 
                index = 1;
            else 
                customRounds = 0;
            end 
        end 
    else 
        index = 2;
    end 

    self:findViewById(self.s_controls.roundsView):setSelected(index);
    
    self:_resetRoundsEditor();
    
    if customRounds > 0 then
        self.m_roundsEditor:setText(customRounds);
    end

    self.m_defaultRoundsIndex = index;
    self:_getGroupRounds(index);
end

-----------------------------------------------------------------------------------------------
CustomParamSetViewScore.initView = function(self, data)
    RadioButton.setDefaultImages({"hall/common/checkbox_uncheck.png","hall/common/checkbox_checked.png"});
    self.m_root = SceneLoader.load(customParamSetViewScore);
    if self.m_root then 
        GameLayer.addChild(self,self.m_root);
    end

    self.m_controlsMap = {};
    CustomParamSetViewScore.addEventListeners(self);

    self.m_timesEditor = self:findViewById(self.s_controls.timesEditor);
    self.m_roundsEditor = self:findViewById(self.s_controls.roundsEditor);

    self.m_timesEditor:setInputMode(kEditBoxInputModeNumeric);
    self.m_roundsEditor:setInputMode(kEditBoxInputModeNumeric);
    
    self.m_timesEditor:setEventTouch(self, self.onTimeEditorEventTouch);
    self.m_roundsEditor:setEventTouch(self, self.onRoundsEditorEventTouch);

    self.m_defaultTimesIndex = 1; -- 选择的倍数索引
    self.m_defaultRoundsIndex = 1; -- 选择的局数索引
    self.m_defaultConfigIndex = 1; -- 选择的房间配置索引（积分房只有积分一种）
    
    self.m_data = data;
    
    local config = data.configList[self.m_defaultConfigIndex];
    if not table.isEmpty(config) then
        self:_initTimesRiadioBtns(config.times);
        self:_initRoundsRiadioBtns(config.rounds);

        self:resetParamData();
    end
end

CustomParamSetViewScore._resetTimesEditor = function(self)
    self.m_timesEditor:setText("");
    self.m_timesEditor:setHintText("大于0的整数", 215,171,127);
end

CustomParamSetViewScore._resetRoundsEditor = function(self)
    self.m_roundsEditor:setText("");
    self.m_roundsEditor:setHintText("不可大于50", 215,171,127);
end

CustomParamSetViewScore.onTimeEditorEventTouch = function(self, finger_action, x, y, drawing_id_first, drawing_id_current)
    local et = self.m_timesEditor;
    if finger_action == kFingerDown then    
        local str = string.trim(et:getText());
        local strNum = tonumber(str) or 0;
        if strNum <= 0 then
            self:_resetTimesEditor();
        end
    end
    et:onEventTouch(finger_action, x, y, drawing_id_first, drawing_id_current);
end

CustomParamSetViewScore.onRoundsEditorEventTouch = function(self, finger_action, x, y, drawing_id_first, drawing_id_current)
    local et = self.m_roundsEditor;
    if finger_action == kFingerDown then    
        local str = string.trim(et:getText());
        local strNum = tonumber(str) or 0;
        if strNum <= 0 then
            self:_resetRoundsEditor();
        end
    end
    et:onEventTouch(finger_action, x, y, drawing_id_first, drawing_id_current);
end

---------------------------------------------------------------------------------------
CustomParamSetViewScore._initTimesRiadioBtns = function(self, data)
    if table.isEmpty(data) then
        return;
    end

    local timesView = self:findViewById(self.s_controls.timesView);
    local x = 0;
    local spaceLeft = 17;
    local spaceRight = 22;
    local count = 0;
    local textWidthMax = 32;
    RadioButton.setDefaultImages({"hall/common/checkbox_uncheck.png","hall/common/checkbox_checked.png"});
    for k,v in ipairs(data) do 
        if number.valueOf(v) > 0 then
            count = count + 1;  
            local rdBtn = new(RadioButton);     
            local name = UIFactory.createText(v, 32, textWidthMax, 32, kAlignCenter, 118,72,18);
            local w_rd = rdBtn:getSize();
            local w_name = name:getSize();
            rdBtn:addChild(name);
            name:setAlign(kAlignLeft);
            name:setPos(w_rd + spaceLeft - (w_name - textWidthMax) / 2,0);
            name:setName("name");
            timesView:addChild(rdBtn);
            rdBtn:setPos(x,0);
            rdBtn:setAlign(kAlignLeft);
            
            x = x + w_rd + spaceLeft + textWidthMax + spaceRight;
            
            if count >= CustomParamSetViewScore.s_maxTimesItem then
                break;
            end 
        end 
    end 
    RadioButton.setDefaultImages();

    self.m_defaultTimesIndex = count >= 1 and 2 or 1;

    local timesCustomView = self:findViewById(self.s_controls.timesCustomView);
    timesCustomView:setPos(x,0);
end

CustomParamSetViewScore._initRoundsRiadioBtns = function(self, data)
    if table.isEmpty(data) then
        return;
    end

    local roundsView = self:findViewById(self.s_controls.roundsView);
    local x = 0;
    local spaceLeft = 17;
    local spaceRight = 22;
    local count = 0;
    local textWidthMax = 32;
    RadioButton.setDefaultImages({"hall/common/checkbox_uncheck.png","hall/common/checkbox_checked.png"});
    for k,v in ipairs(data) do 
        if number.valueOf(v) > 0 then
            count = count + 1;  
            local rdBtn = new(RadioButton);     
            local name = UIFactory.createText(v, 32, textWidthMax, 32, kAlignCenter, 118,72,18);
            local w_rd = rdBtn:getSize();
            local w_name = name:getSize();
            rdBtn:addChild(name);
            name:setAlign(kAlignLeft);
            name:setPos(w_rd + spaceLeft - (w_name - textWidthMax) / 2,0);
            name:setName("name");
            roundsView:addChild(rdBtn);
            rdBtn:setPos(x,0);
            rdBtn:setAlign(kAlignLeft);
            
            x = x + w_rd + spaceLeft + textWidthMax + spaceRight;
            
            if count >= CustomParamSetViewScore.s_maxRoundsItem then
                break;
            end 
        end 
    end 
    RadioButton.setDefaultImages();

    self.m_defaultRoundsIndex = count >= 1 and 2 or 1;

    local roundsCustomView = self:findViewById(self.s_controls.roundsCustomView);
    roundsCustomView:setPos(x,0);
end

CustomParamSetViewScore._getEditorTimesData = function(self)
    local times = number.valueOf(string.trim(self.m_timesEditor:getText()));
    self.m_customParamData.times = times; 
end

CustomParamSetViewScore._getEditorRoundsData = function(self)
    local rounds = number.valueOf(string.trim(self.m_roundsEditor:getText()));
    self.m_customParamData.rounds = rounds; 
end

CustomParamSetViewScore._getGroupTimes = function(self, curIndex)
    if curIndex == 1 then 
        self:_getEditorTimesData();
        if self.m_customParamData.times == 0 then 
            self.m_timesEditor:setText("1");
            self.m_customParamData.times = 1;
        end 
    else 
        local timesView = self:findViewById(self.s_controls.timesView);
        if timesView then 
            local rdBtn = timesView:getButton(curIndex);
            if rdBtn then 
                local name = rdBtn:getChildByName("name");
                if name then 
                    local times = number.valueOf(string.trim(name:getText()));
                    self.m_customParamData.times = times;
                end 
            end 
        end         
    end
end

CustomParamSetViewScore._getGroupRounds = function(self, curIndex)
    if curIndex == 1 then 
        self:_getEditorRoundsData();
        if self.m_customParamData.rounds == 0 then 
            self.m_roundsEditor:setText("1");
            self.m_customParamData.rounds = 1;
        end 
    else 
        local roundsView = self:findViewById(self.s_controls.roundsView);
        if roundsView then 
            local rdBtn = roundsView:getButton(curIndex);
            if rdBtn then 
                local name = rdBtn:getChildByName("name");
                if name then 
                    local rounds = number.valueOf(string.trim(name:getText()));
                    self.m_customParamData.rounds = rounds;
                end 
            end 
        end         
    end
end

CustomParamSetViewScore.onTimesRadioGroupChange = function(self,curIndex,lastIndex)
    kEffectPlayer:play(Effects.AudioButtonClick);

    self:_getGroupTimes(curIndex);
end

CustomParamSetViewScore.onRoundsRadioGroupChange = function(self,curIndex,lastIndex)
    kEffectPlayer:play(Effects.AudioButtonClick);

    self:_getGroupRounds(curIndex);
end

CustomParamSetViewScore.onTimesEditChanged = function(self)
    local et = self.m_timesEditor;
    local str = string.trim(et:getText());
    local number = tonumber(str) or 0;
    number, _ = math.floor(number);

    if number > CustomParamSetViewScore.s_maxTimes then 
        number =  CustomParamSetViewScore.s_maxTimes;
        et:setText(number.."");

        local tips = string.format("倍数设置不可大于%s", CustomParamSetViewScore.s_maxTimes);
        Toast.getInstance():showText(tips,50,30,kAlginLeft,"",26,250,210,70);
    elseif number <= 0 then
        number = 1;
        et:setText(number.."");

        Toast.getInstance():showText("倍数设置必须大于0",50,30,kAlginLeft,"",26,250,210,70);
    else
        et:setText(number.."");
    end

    self:findViewById(self.s_controls.timesView):setSelected(1);

    self:_getEditorTimesData();
end

CustomParamSetViewScore.onRoundsEditChanged = function(self)
    local et = self.m_roundsEditor;
    local str = string.trim(et:getText());
    local number = tonumber(str) or 0;
    number, _ = math.floor(number);

    if number > CustomParamSetViewScore.s_maxRounds then 
        number =  CustomParamSetViewScore.s_maxRounds;
        et:setText(number.."");

        local tips = string.format("局数设置不可大于%s", CustomParamSetViewScore.s_maxRounds);
        Toast.getInstance():showText(tips,50,30,kAlginLeft,"",26,250,210,70);
    elseif number <= 0 then
        number = 1;
        et:setText(number.."");
        
        Toast.getInstance():showText("局数设置必须大于0",50,30,kAlginLeft,"",26,250,210,70);
    else
        et:setText(number.."");
    end

    self:findViewById(self.s_controls.roundsView):setSelected(1);

    self:_getEditorRoundsData();
end


---------------------------------------------------------------------------------------
CustomParamSetViewScore.s_controlConfig = 
{
    [CustomParamSetViewScore.s_controls.timesView] = {"timesView", "group"};
    [CustomParamSetViewScore.s_controls.roundsView] = {"roundsView", "group"};
    [CustomParamSetViewScore.s_controls.baseChipView] = {"baseChipView", "view"};
    [CustomParamSetViewScore.s_controls.timesCustomView] = {"timesView", "group", "item"};
    [CustomParamSetViewScore.s_controls.roundsCustomView] = {"roundsView", "group", "item"};
    [CustomParamSetViewScore.s_controls.timesEditor] = {"timesView", "group", "item", "editorBg", "editor"};
    [CustomParamSetViewScore.s_controls.roundsEditor] = {"roundsView", "group", "item", "editorBg", "editor"};
    [CustomParamSetViewScore.s_controls.baseChipText] = {"baseChipView", "view", "baseChip"};
    [CustomParamSetViewScore.s_controls.baseChipTitle] = {"baseChipView", "title"};
    [CustomParamSetViewScore.s_controls.timesViewTitle] = {"timesView", "title"};
    [CustomParamSetViewScore.s_controls.roundsViewTitle] = {"roundsView", "title"};
    [CustomParamSetViewScore.s_controls.timesViewItem] = {"timesView"};
    [CustomParamSetViewScore.s_controls.roundsViewItem] = {"roundsView"};
    [CustomParamSetViewScore.s_controls.baseChipViewItem] = {"baseChipView"};
}

CustomParamSetViewScore.s_controlFuncMap = 
{
    [CustomParamSetViewScore.s_controls.timesEditor] = CustomParamSetViewScore.onTimesEditChanged;
    [CustomParamSetViewScore.s_controls.roundsEditor] = CustomParamSetViewScore.onRoundsEditChanged;
    [CustomParamSetViewScore.s_controls.timesView] = CustomParamSetViewScore.onTimesRadioGroupChange;
    [CustomParamSetViewScore.s_controls.roundsView] = CustomParamSetViewScore.onRoundsRadioGroupChange;
};

CustomParamSetViewScore.s_cmdConfig = 
{
};

return CustomParamSetViewScore;