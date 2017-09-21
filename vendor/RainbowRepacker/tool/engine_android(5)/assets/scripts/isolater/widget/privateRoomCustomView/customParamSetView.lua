require("isolater/widget/privateRoomCustomView/customParamSetViewBase");
local customParamSetView = require(ViewPath .. "isolater/privateRoomCustomView/customParamSetView");

local CustomParamSetView = class(CustomParamSetViewBase,false);

local h_index = 0;
local getIndex = function(self)
	h_index = h_index + 1;
	return h_index;
end
CustomParamSetView.s_controls = 
{
	baseChipTitle = getIndex();
	baseChipGroup = getIndex();
	customBaseChipRd = getIndex();
	customBaseChipEidt = getIndex();
	limitEidt = getIndex();
	limitTitle = getIndex();
	limitUnit = getIndex();
	baseChipTypeGroup = getIndex();
};
CustomParamSetView.s_maxMoney = 99999999; -- 最大自定义数量
CustomParamSetView.s_maxBaseChipItem = 4;--配置的底注最多4条选项

CustomParamSetView.s_minBaseChip = 1;--自定义底注最低为1
CustomParamSetView.s_baseChipCondition = 1/3;--自定义底注最大为携带金币的1/CustomParamSetView.s_requireMoneyCondition,默认1/3
CustomParamSetView.s_requireMoneyCondition = 3;--入场限制为底注的3倍或2W,两者取最大值
CustomParamSetView.s_requireCrystalCondition = 1;--入场限制为底注的1倍或0,两者取最大值
CustomParamSetView.s_minRequireMoney = 20000;--入场限制为底注的3倍或2W,两者取最大值
CustomParamSetView.s_minRequireCrystal = 0;--入场限制为底注的3倍或200,两者取最大值

CustomParamSetView.ctor = function(self,data)

	super(self, data);
end

CustomParamSetView.initView = function(self,data)
	RadioButton.setDefaultImages({"hall/common/checkbox_uncheck.png","hall/common/checkbox_checked.png"});
	self.m_root = SceneLoader.load(customParamSetView);
	if self.m_root then 
	    GameLayer.addChild(self,self.m_root);
	end

	self.m_controlsMap = {};
	GameLayer.addEventListeners(self);

	self.m_chipEditor = self:findViewById(CustomParamSetView.s_controls.customBaseChipEidt);
	self.m_limitEditor = self:findViewById(CustomParamSetView.s_controls.limitEidt);
	self.m_chipEditor:setInputMode(kEditBoxInputModeNumeric);
	self.m_limitEditor:setInputMode(kEditBoxInputModeNumeric);
	
	self.m_chipEditor:setEventTouch(self, self.onChipEditorEventTouch);
	self.m_limitEditor:setEventTouch(self, self.onLimitEditorEventTouch);

	self.m_defaultBaseChipIndex = 1;
	self.m_defaultConfigIndex = 1;
	
	self.m_data = data;

	self:_initBaseChipTypeList(data.configList);

	-- 兼容马股
	self.m_baseChipDefaultData = {};

	self:resetParamData();
	
end

CustomParamSetView.getCustomParamData = function(self)
	local baseChip = number.valueOf(self.m_customParamData.baseChip);
	local requireMoney = number.valueOf(self.m_customParamData.requireMoney);
	local tableType = number.valueOf(self.m_customParamData.tableType);

	-- 进场限制不定于底注
	if requireMoney < baseChip then
        self.m_customParamData.requireMoney = baseChip;
		requireMoney = baseChip;
	end

	local money = self:_getMoneyByTableType(tableType);
	local moneyMin = self:_getMinRequireMoneyByTableType(tableType)

	if baseChip <= 0 then
		Toast.getInstance():showText(kTextChoiceToNote,50,30,kAlginLeft,"",26,250,210,70);
		return false,self.m_customParamData;
	elseif moneyMin > money then
		local unitStr = self:findViewById(self.s_controls.limitUnit):getText();
		local str = tostring(moneyMin) or "";
		Toast.getInstance():showText(GameString.get("kTextPrivateRoomCreateMoneyTips")..str..unitStr,50,30,kAlginLeft,"",26,250,210,70);
		return false,self.m_customParamData;
	elseif requireMoney > money then
		local unitStr = self:findViewById(self.s_controls.limitUnit):getText();
		Toast.getInstance():showText(GameString.get("kTextRequireMoneyTooBigTips")..unitStr,50,30,kAlginLeft,"",26,250,210,70);
		return false,self.m_customParamData;
	end

	return true,self.m_customParamData;
end

CustomParamSetView.resetParamData = function(self,data)
	self.m_customParamData = {};

	data = table.verify(data);
	local configList = table.verify(self.m_data.configList);

	--add
	local indexType = 1;
	local configFirst = table.verify(configList[indexType])
	local tableType = number.valueOf(configFirst.tableType);

	if data.tableType then
		for k, v in ipairs(configList) do
			v = table.verify(v);
			if number.valueOf(v.tableType) == number.valueOf(data.tableType) then
				indexType = k;
				tableType = number.valueOf(data.tableType);
				break;
			end
		end
	end
	
	local ownMoney = self:_getMoneyByTableType(tableType);
	local codition = self:_getRequireMoneyConditionByTableType(tableType);
	self.m_minBaseChip = CustomParamSetView.s_minBaseChip;
	self.m_maxBaseChip = math.floor(ownMoney/codition);
	self.m_maxBaseChip = math.max(self.m_maxBaseChip, self.m_minBaseChip);


	self.m_defaultConfigIndex = indexType;
	local config = configList[self.m_defaultConfigIndex];
	self:findViewById(CustomParamSetView.s_controls.baseChipTypeGroup):setSelected(indexType);
	self:_initBaseChipRiadioBtns(config.baseChip);

	self:findViewById(self.s_controls.limitUnit):setText(config.name);

	local baseChipDefaultData = config.baseChip;

	local baseChip = number.valueOf(data.baseChip);
	local index;
	local customBaseChip = baseChip;
	if baseChip > 0 then 
		for k,v in ipairs(baseChipDefaultData) do 
			if number.valueOf(v) == baseChip then 
				index = k;
				break;
			end 
		end 
		if not index then 
			index = 1;
		else 
			index = index + 1; --自定义的默认为1，其余的按顺序加1
			if index > (CustomParamSetView.s_maxBaseChipItem + 1) then 
				index = 1;
			else 
				customBaseChip = 0;
			end 
		end 
	else 
		index = 2;
	end 

	self:findViewById(CustomParamSetView.s_controls.baseChipGroup):setSelected(index);
	
	self:_resetLimitEditor();
	self:_resetChipEditor();
	
	local requireMoney = number.valueOf(data.requireMoney);
	if requireMoney > 0 then
		self.m_limitEditor:setText(requireMoney);
	end

	if customBaseChip > 0 then
		self.m_chipEditor:setText(customBaseChip);
	end

	self.m_defaultBaseChipIndex = index;
	self.m_customParamData.requireMoney = requireMoney;
	self.m_customParamData.tableType = tableType;
	self:_getBaseChip(index);
	self:_checkLimit();

end

CustomParamSetView.onLimitEditChanged = function(self)
	local et = self.m_limitEditor;
	local limitStr = string.trim(et:getText());
	local limit = tonumber(limitStr) or 0;
	limit, _ = math.floor(limit);
	
    local baseChip = number.valueOf(self.m_customParamData.baseChip);
    local tableType = number.valueOf(self.m_customParamData.tableType);

    local num1 = self:_getRequireMoneyConditionByTableType(tableType);
    local num2 = self:_getMinRequireMoneyByTableType(tableType);
    local requireMoney = math.max(baseChip * num1, num2);
    local ownMoney = self:_getMoneyByTableType(tableType);
    local unitStr = self:findViewById(self.s_controls.limitUnit):getText();

    if ownMoney >= requireMoney then 
    	if limit > ownMoney then
			Toast.getInstance():showText( GameString.get("kTextRequireMoneyTooBigTips")..unitStr ,50,30,kAlginLeft,"",26,250,210,70);
			et:setText( ownMoney );

		elseif limit < requireMoney then 
			et:setText(requireMoney);
			local tips = self:_getLimitTipsStringByTableType(tableType, num1, num2, unitStr);
			Toast.getInstance():showText(tips,50,30,kAlginLeft,"",26,250,210,70);

		else 
			et:setText(limit.."");
		end 
    else
    	if limit < requireMoney then 
			et:setText(requireMoney);
			local tips = self:_getLimitTipsStringByTableType(tableType, num1, num2, unitStr);
			Toast.getInstance():showText(tips,50,30,kAlginLeft,"",26,250,210,70);

		else
			et:setText(limit.."");
		end
    end 

	self:_getLimitData();
end

CustomParamSetView.onBaseChipEditChanged = function(self)
	local et = self.m_chipEditor;
	local limitStr = string.trim(et:getText());
	local limit = tonumber(limitStr) or 0;
	limit, _ = math.floor(limit);
	local baseStr = "底注";
	local baseChip = limit;
	local unitStr = self:findViewById(self.s_controls.limitUnit):getText();

	if limit > self.m_maxBaseChip then 
		baseChip =  self.m_maxBaseChip;
		et:setText(self.m_maxBaseChip .. "");

		local tips = string.format("底注的范围限制为%s~%s%s！",self.m_minBaseChip,self.m_maxBaseChip, unitStr);
		Toast.getInstance():showText(tips,50,30,kAlginLeft,"",26,250,210,70);
	elseif limit >= self.m_minBaseChip and limit <= self.m_maxBaseChip then
		et:setText(limit.."");		
	else
		baseChip = self.m_minBaseChip;
		et:setText(self.m_minBaseChip .. "");

		local tips = string.format("底注的范围限制为%s~%s%s！",self.m_minBaseChip,self.m_maxBaseChip, unitStr);
		Toast.getInstance():showText(tips,50,30,kAlginLeft,"",26,250,210,70);
	end
	self:findViewById(CustomParamSetView.s_controls.baseChipGroup):setSelected(1);

	self:_getEditBaseChip();
    self:_checkLimit();
end

CustomParamSetView.onBaseChipRadioGroupChange = function(self,curIndex,lastIndex)
  	kEffectPlayer:play(Effects.AudioButtonClick);

  	self:_getBaseChip(curIndex);
    self:_checkLimit();
end

CustomParamSetView._checkLimit = function(self)
	local tableType = number.valueOf(self.m_customParamData.tableType);
	local condition = self:_getRequireMoneyConditionByTableType(tableType);
    local num1 = number.valueOf(self.m_customParamData.baseChip) * condition;
    local num2 = self:_getMinRequireMoneyByTableType(tableType);
	local limit = math.max(num1,num2);
	self.m_limitEditor:setText(limit .. "");

    self:_getLimitData();
end

CustomParamSetView._resetChipEditor = function(self)
	self.m_chipEditor:setText("");
	self.m_chipEditor:setHintText(string.format("最高%s",ToolKit.skipMoneyEx4(self.m_maxBaseChip)), 215,171,127);
end

CustomParamSetView._resetLimitEditor = function(self)
	self.m_limitEditor:setText("");
	local tableType = number.valueOf(self.m_customParamData.tableType);
	local codition = self:_getRequireMoneyConditionByTableType(tableType);
	local min = self:_getMinRequireMoneyByTableType(tableType);
	local tips = self:_getLimitHintByTableType(tableType, codition, min);
	self.m_limitEditor:setHintText(tips, 215,171,127);
end

CustomParamSetView.onChipEditorEventTouch = function(self, finger_action, x, y, drawing_id_first, drawing_id_current)
	local et = self.m_chipEditor;
    if finger_action == kFingerDown then    
        local str = string.trim(et:getText());
        local strNum = tonumber(str) or 0;
        if strNum <= 0 then
	        self:_resetChipEditor();
        end
    end
	et:onEventTouch(finger_action, x, y, drawing_id_first, drawing_id_current);
end

CustomParamSetView.onLimitEditorEventTouch = function(self, finger_action, x, y, drawing_id_first, drawing_id_current)
	local et = self.m_limitEditor;
    if finger_action == kFingerDown then    
        local str = string.trim(et:getText());
        local strNum = tonumber(str) or 0;
        if strNum <= 0 then
	        self:_resetLimitEditor();
        end
    end
	et:onEventTouch(finger_action, x, y, drawing_id_first, drawing_id_current);
end

CustomParamSetView._getBaseChip = function(self,curIndex)
  	if curIndex == 1 then 
  		self:_getEditBaseChip();
  		if self.m_customParamData.baseChip == 0 then 
  			self.m_chipEditor:setText(1);
  			self.m_customParamData.baseChip = 1;
  		end 
  	else 
  		local baseChipGroup = self:findViewById(CustomParamSetView.s_controls.baseChipGroup);
  		if baseChipGroup then 
  			local rdBtn = baseChipGroup:getButton(curIndex);
  			if rdBtn then 
  				local name = rdBtn:getChildByName("name");
  				if name then 
  					baseChip = number.valueOf(string.trim(name:getText()));
  					self.m_customParamData.baseChip = baseChip;
  				end 
  			end 
  		end   		
  	end
end

CustomParamSetView._getEditBaseChip = function(self)
	local et = self.m_chipEditor;
	local baseChip = number.valueOf(string.trim(et:getText()));

	self.m_customParamData.baseChip = baseChip; 
end

CustomParamSetView._initBaseChipRiadioBtns = function(self,baseChips)
	baseChips = table.verify(baseChips);

	local baseChipGroup = self:findViewById(CustomParamSetView.s_controls.baseChipGroup);
	local customBaseChipRd = self:findViewById(CustomParamSetView.s_controls.customBaseChipRd);
	customBaseChipRd:getParent():removeChild(customBaseChipRd);
	baseChipGroup:removeAllChildren(true);
	baseChipGroup:addChild(customBaseChipRd);
	self.m_chipEditor:setPos(self.m_chipEditor:getPos()); -- fix a editor bug

	local x = 0;
	local space = 25;
	local count = 0;
	RadioButton.setDefaultImages({"hall/common/checkbox_uncheck.png","hall/common/checkbox_checked.png"});
	for k,v in ipairs(baseChips) do 
		if number.valueOf(v) > 0 then 	
			count = count + 1;	
			local rdBtn = new(RadioButton);		
			local name = UIFactory.createText(v, 32, 10, 10, kAlignLeft, 118,72,18);
			local w_rd = rdBtn:getSize();
			local w_name = name:getSize();
			rdBtn:addChild(name);
			name:setAlign(kAlignLeft);
			name:setPos(w_rd + 10,0);
			name:setName("name");
			baseChipGroup:addChild(rdBtn);
			rdBtn:setPos(x,0);
			rdBtn:setAlign(kAlignLeft);
			
			x = x + w_rd + w_name + 10 + space;
			
			if count >= CustomParamSetView.s_maxBaseChipItem then
				break;
			end 
		end 
	end 
	RadioButton.setDefaultImages();

	self.m_defaultBaseChipIndex = count >= 1 and 2 or 1;
	customBaseChipRd:setPos(x,0);
end

CustomParamSetView._getLimitData = function(self)
	local et = self.m_limitEditor;
	local requireMoney = number.valueOf(string.trim(et:getText()));

	self.m_customParamData.requireMoney = requireMoney; 
end

CustomParamSetView._getBaseChipData = function(self)
	local baseChipGroup = self:findViewById(CustomParamSetView.s_controls.baseChipGroup);
	local result = baseChipGroup:getResult();
	self:_getBaseChip(result);
end


CustomParamSetView._getMoneyByTableType = function(self, tableType)
	if tableType == PrivateRoomConstant.PRIVATE_ROOM_TYPE_CRYSTAL then
		return UserPropertyIsolater.getInstance():getCrystal();
	else
		return UserPropertyIsolater.getInstance():getMoney();
	end
end

CustomParamSetView._getMinRequireMoneyByTableType = function(self, tableType)
	if tableType == PrivateRoomConstant.PRIVATE_ROOM_TYPE_CRYSTAL then
		local config = self.m_data.configList[self.m_defaultConfigIndex];
		local limit = number.valueOf(config.intolimit);
		return math.max(CustomParamSetView.s_minRequireCrystal, limit);
	else
		return CustomParamSetView.s_minRequireMoney;
	end
end

CustomParamSetView._getRequireMoneyConditionByTableType = function(self, tableType)
	if tableType == PrivateRoomConstant.PRIVATE_ROOM_TYPE_CRYSTAL then
		return CustomParamSetView.s_requireCrystalCondition;
	else
		return CustomParamSetView.s_requireMoneyCondition;
	end
end

CustomParamSetView._getLimitTipsStringByTableType = function(self, tableType, times, min, unit)
	return string.format("入场门槛不得低于%s倍底注，且不得低于%s%s！", times, ToolKit.skipMoneyEx4(min), unit);
end

CustomParamSetView._getLimitHintByTableType = function(self, tableType, times, min)
	return string.format("不得低于底注的%s倍及%s", times, ToolKit.skipMoneyEx4(min));
end

----------------------------------货币类型--------------------------------------------
CustomParamSetView._initBaseChipTypeList = function(self, data)
    data = table.verify(data);
	local baseChipGroup = self:findViewById(CustomParamSetView.s_controls.baseChipTypeGroup);
	local x = 0;
	local space = 25;
	RadioButton.setDefaultImages({"hall/common/checkbox_uncheck.png","hall/common/checkbox_checked.png"});
	for k,v in ipairs(data) do 
		if not table.isEmpty(v) then 	
			local rdBtn = new(RadioButton);		
			local name = UIFactory.createText(v.name or "", 32, 10, 10, kAlignLeft, 118,72,18);
			local w_rd = rdBtn:getSize();
			local w_name = name:getSize();
			rdBtn:addChild(name);
			name:setAlign(kAlignLeft);
			name:setPos(w_rd + 10,0);
			name:setName("name");
			baseChipGroup:addChild(rdBtn);
			rdBtn:setPos(x,0);
			rdBtn:setAlign(kAlignLeft);
			
			x = x + w_rd + w_name + 10 + space;
		end 
	end 
	if not table.isEmpty(data) then
		baseChipGroup:setSelected(1);
	end
	RadioButton.setDefaultImages();
end

-- sub view callback
CustomParamSetView.onBaseChipTypeListItemClick = function(self, data, index)
    if table.isEmpty(data) then
        return ;
    end 


    self:resetParamData({tableType = data.tableType});
end

CustomParamSetView.onBaseChipTypeRadioGroupChange = function(self,curIndex,lastIndex)
  	kEffectPlayer:play(Effects.AudioButtonClick);

  	local list = table.verify(self.m_data.configList);
  	local data = table.verify(list[curIndex]);
  	self:resetParamData({tableType = data.tableType});
end


CustomParamSetView.s_controlFuncMap = 
{	
	[CustomParamSetView.s_controls.customBaseChipEidt] = CustomParamSetView.onBaseChipEditChanged;
	[CustomParamSetView.s_controls.limitEidt] = CustomParamSetView.onLimitEditChanged;
	[CustomParamSetView.s_controls.baseChipGroup] = CustomParamSetView.onBaseChipRadioGroupChange;
	[CustomParamSetView.s_controls.baseChipTypeGroup] = CustomParamSetView.onBaseChipTypeRadioGroupChange;
};
CustomParamSetView.s_controlConfig = 
{
	[CustomParamSetView.s_controls.baseChipTitle] = {"baseChipTypeView","title"};
	[CustomParamSetView.s_controls.baseChipGroup] = {"baseChipArea","baseChipGroup"};
	[CustomParamSetView.s_controls.customBaseChipRd] = {"baseChipArea","baseChipGroup","customBaseChip"};
	[CustomParamSetView.s_controls.customBaseChipEidt] = {"baseChipArea","baseChipGroup","customBaseChip","etBg","et"};
	[CustomParamSetView.s_controls.limitEidt] = {"limitArea","editBglimit","et"};
	[CustomParamSetView.s_controls.limitTitle] = {"limitArea","title"};
	[CustomParamSetView.s_controls.limitUnit] = {"limitArea","editBglimit","Text2"};
	[CustomParamSetView.s_controls.baseChipTypeGroup] = {"baseChipTypeView", "baseChipTypeGroup"};
};

return CustomParamSetView;