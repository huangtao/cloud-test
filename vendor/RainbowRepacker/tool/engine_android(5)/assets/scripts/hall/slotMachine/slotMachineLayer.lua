
if SlotMachineLayer then
    return--in case of data asymmetric
end

require("common/commonGameLayer");
require("hall/slotMachine/slotMachineInfo");
require("util/toolKit");
require("particle/particleMoney");
local slot_machine_layer = require(ViewPath .. "hall/slot/slot_machine_layer");
local slot_pin_map = require("qnFiles/qnPlist/hall/slot_pin");
local money_pin_map_map = require("qnFiles/qnPlist/hall/money_pin_map");

SlotMachineLayer = class(CommonGameLayer, false);

SlotMachineLayer.Delegate = {
	onCloseSlotMachineLayer = "onCloseSlotMachineLayer";
}

SlotMachineLayer.s_filePath = "fruit_p%d.png";
SlotMachineLayer.s_maxDis = 360;
SlotMachineLayer.s_maxIdx = 7;
SlotMachineLayer.s_minLoops = 80;

local h_index = 0;
local getIndex = function(self)
    h_index = h_index + 1;
    return h_index;
end

SlotMachineLayer.s_controls = {
	shield 		= getIndex();
	main 		= getIndex();
	titleTx 	= getIndex();
	numTx 		= getIndex();
	light 		= getIndex();
	light1 		= getIndex();
	detailBtn	= getIndex();
	mask 		= getIndex();
	animView 	= getIndex();
	ballView 	= getIndex();
	ball 		= getIndex();
	bar_1 		= getIndex();
	bar_2 		= getIndex();
	closeBtn 	= getIndex();
	luckyView	= getIndex();
	autoPlayBtn	= getIndex();
	tipsTx		= getIndex();

	autoPlayTick 	= getIndex();
	detailView		= getIndex();
	configBtn		= getIndex();
	recordBtn		= getIndex();
	configMask 		= getIndex();
	recordMask 		= getIndex();
	configTx		= getIndex();
	recordTx		= getIndex();
	configView		= getIndex();
	recordView		= getIndex();
	detailCloseBtn 	= getIndex();

    checkBoxGroup = getIndex();
	checkBox1 = getIndex();
	checkBox2 = getIndex();
	checkBox3 = getIndex();

	lightMirror1 = getIndex();
	lightMirror2 = getIndex();
}

function SlotMachineLayer:ctor()
    CheckBox.setDefaultImages({"hall/common/btns/174x63_green.png", "hall/common/btns/174x63_green_select.png"});
	super(self, slot_machine_layer);
    CheckBox.setDefaultImages();
	self:setFillParent(true, true);

	self.m_ctrls = SlotMachineLayer.s_controls;

	self.m_main = self:getControl(self.m_ctrls.main);
	self.m_shield = self:getControl(self.m_ctrls.shield);
	self.m_light = self:getControl(self.m_ctrls.light);
	self.m_light1 = self:getControl(self.m_ctrls.light1);
	self.m_mask = self:getControl(self.m_ctrls.mask);
	self.m_animView = self:getControl(self.m_ctrls.animView);
	self.m_ballView = self:getControl(self.m_ctrls.ballView);
	self.m_bar_1 = self:getControl(self.m_ctrls.bar_1);
	self.m_bar_2 = self:getControl(self.m_ctrls.bar_2);
	self.m_ball = self:getControl(self.m_ctrls.ball);
	self.m_titleTx = self:getControl(self.m_ctrls.titleTx);
	self.m_numTx = self:getControl(self.m_ctrls.numTx);
	self.m_tipsTx = self:getControl(self.m_ctrls.tipsTx);

	self.m_detailView = self:getControl(self.m_ctrls.detailView);
	self.m_configView = self:getControl(self.m_ctrls.configView);
	self.m_recordView = self:getControl(self.m_ctrls.recordView);
	self.m_configMask = self:getControl(self.m_ctrls.configMask);
	self.m_recordMask = self:getControl(self.m_ctrls.recordMask);
	self.m_configTx = self:getControl(self.m_ctrls.configTx);
	self.m_recordTx = self:getControl(self.m_ctrls.recordTx);
	self.m_luckyView = self:getControl(self.m_ctrls.luckyView);
	self.m_autoPlayBtn = self:getControl(self.m_ctrls.autoPlayBtn);
	self.m_autoPlayTick = self:getControl(self.m_ctrls.autoPlayTick);

    self.m_checkBoxGroup = self:getControl(self.m_ctrls.checkBoxGroup);
	self.m_checkBox1 = self:getControl(self.m_ctrls.checkBox1);
	self.m_checkBox2 = self:getControl(self.m_ctrls.checkBox2);
	self.m_checkBox3 = self:getControl(self.m_ctrls.checkBox3);

	self.m_checkBoxGroup:setOnChange(self, self.onChange)

	_, self.m_ballY = self.m_ball:getPos();
	_, self.m_ballH = self.m_ball:getSize();

	self.m_bar_2:setVisible(false);
	self.m_autoPlayBtn:setVisible(kSlotMachineInfo:getAutoPlay());
	self.m_shield:setEventDrag(self, self.onShieldTouched);
	self.m_shield:setEventTouch(self, self.onShieldTouched);
	self.m_ballView:setEventTouch(self, self.onBallTouched);
	self.m_luckyView:setEventTouch(self, self.onLuckyViewTouched);


	self.m_picMap = {{1,1,1},{2,2,2},{3,3,3},{4,4,4}};
	self.m_columns = {{};{};{};};
	self:createLuckyView();
	self.m_betIdx = kSlotMachineInfo:getLastBetIndex();

	self:init(true);
	self:setVisible(false);

    self:initCheckgroup();

	SlotMachineInfo.getInstance():setObserver(self);
end

function SlotMachineLayer:dtor()
	ShaderManager.removeShader( self:getControl(self.m_ctrls.lightMirror1) );
	ShaderManager.removeShader( self:getControl(self.m_ctrls.lightMirror2) );

	SlotMachineInfo.getInstance():clearObserver(self);
	self:hide();
end

function SlotMachineLayer:show()
	self.m_main:setVisible(true);
	self.m_detailView:setVisible(false);
	self.m_tipsTx:getParent():setVisible(false);
	self:stopAnim();
	self:init(false);
	self:setVisible(true);	
	self.m_autoPlay = false;
	self.m_autoPlayTick:setVisible(false);
	self.m_isPlaying = false;
	self.m_numTx:setVisible(true);
	self.m_titleTx:setVisible(true);
	self.m_titleTx:setText(GameString.get("slotMachineMostReward"), 0);
	self.m_titleTx:setColor(247, 245, 182);
	self.m_numTx:setColor(247, 245, 182);
	return self;
end

function SlotMachineLayer:hide()
	self:dispatchMsg();
	self:stopAnim();
	self.m_isPlaying = false;
	self:setVisible(false);
end

function SlotMachineLayer:init(isFirst)
	local x, y = self.m_mask:getPos();
	local w, h = self.m_mask:getSize();
	self.m_animView:setClip(x, y+3, w, h-8);
	w, h = self.m_animView:getSize();
	local itemW, itemH = w/3, h/3;
	local scaleW, scaleH;
	for i = 1, 4 do
		for j = 1, 3 do
			if isFirst then
				self.m_columns[j][i] = new(SlotImage, slot_pin_map[string.format(self.s_filePath, self.m_picMap[i][j])]);
			else
				self.m_columns[j][i]:setFile(slot_pin_map[string.format(self.s_filePath, self.m_picMap[i][j])]);
			end
			if not scaleW then
				local imgW, imgH = self.m_columns[j][i]:getSize();
				scaleH = math.min(itemW/imgW, itemH/imgH);
				scaleW, scaleH = imgW*scaleH, imgH*scaleH;
				self.m_scaleH = scaleH;
			end
			self.m_columns[j][i]:setPos(itemW*(j-0.5)-scaleW/2, (i-1)*scaleH);
			self.m_columns[j][i]:setSize(scaleW, scaleH);
			self.m_animView:addChild(self.m_columns[j][i]);
		end
	end
	self.m_lastPic = {2,4,6};
end

function SlotMachineLayer:playAnim()
	if kSlotMachineInfo:isMoneyEnough(self.m_betIdx) and kLoginDataInterface:getIsLoginSuccess() then
		self:getControl(self.m_ctrls.closeBtn):setPickable(false);
		self.m_baseLoops = 0;
		self.m_curLoops = 0;
		kSlotMachineInfo:requestReward(self.m_betIdx, self.m_curLuckyIdx);
		self:startTimer();
		self.m_isPlaying = true;
		self.m_responced = nil;--not responced
		self.m_stopState = {};
		self.m_posYMap = {self.m_scaleH/4,self.m_scaleH/2,self.m_scaleH*3/4};
		self.m_posStep = {46, 46, 46};
		self.m_anim = new(AnimInt, kAnimRepeat, 0, 1, 10, -1);
		self.m_anim:setEvent(self, SlotMachineLayer.onFinishAnim);
		self.m_anim:setDebugName("SlotMachineLayer:playAnim");
	else
		if not kLoginDataInterface:getIsLoginSuccess() then
			Toast.getInstance():showText(GameString.get("netWorkTimeout"));
		elseif self.m_betIndex ~= 1 and kSlotMachineInfo:isMoneyEnough(1) then
			Toast.getInstance():showText(GameString.get("slotMachineNotSelect"));
		elseif kSlotMachineInfo:isMoneyLocked(self.m_betIdx) then 
			local limit = ToolKit.skipMoneyEx(kSlotMachineInfo:getBetLimit(self.m_betIdx));
			Toast.getInstance():showText(string.format(GameString.get("slotMachineMoneyLocked"), limit));
		else
			local limit = kSlotMachineInfo:getBetLimit(self.m_betIdx);
			Toast.getInstance():showText(string.format(GameString.get("slotMachineLossOfMoney"), tostring(limit)));
		end
		if self.m_autoPlay then
			self:onAutoPlayBtnClick();
		end
	end
end

function SlotMachineLayer:stopAnim()
	self:stopTimer();
	delete(self.m_anim);
	self.m_anim = nil;
	self:stopLight();
	self:stopPars();
	self:getControl(self.m_ctrls.closeBtn):setPickable(true);
end

function SlotMachineLayer:onFinishAnim(anim_type, anim_id, loop_num)
	local math, flag, pos = math, true;
	for i = 1, 3 do
		if self:checkLast(i, loop_num) then
			pos = self.m_posYMap[i] + math.floor(self.m_posStep[i]);
			if pos>0 and self.m_stopState[i]==3 then
				pos = 0;
				self.m_stopState[i] = 4;--stop move
			elseif pos>0 then
				for j = 4, 2, -1 do
					self.m_picMap[i][j] = self.m_picMap[i][j-1];
				end
				self.m_picMap[i][1] = self:getNextPic(i);
				for j = 1, 4 do
					self.m_columns[i][j]:setFile(slot_pin_map[string.format(self.s_filePath, self.m_picMap[i][j])]);
				end
				pos = pos - self.m_scaleH;
			end
			self.m_posYMap[i] = pos;
			for j = 1, 4 do
				self.m_columns[i][j]:setPos(nil, pos+(j-1)*self.m_scaleH);
			end
		end
		flag = flag and self.m_stopState[i]==4;
	end
	if flag then
		self:stopAnim();
		if self.m_responced then
			if not self:getVisible() then
				self:dispatchMsg();
			else
				self:startPars();
				self:startLight();
				self.m_titleTx:setText(GameString.get("slotMachineGetReward"), 0);
				self.m_numTx:setText(self.m_lastReward, 0);
				self.m_numTx:setColor(246, 255, 0);
				self.m_titleTx:setColor(246, 255, 0);
				local tips = ""
				if self.m_lastReward <= 0 then
					tips = GameString.get("slotMachineNotGotReward");
				else
					tips = GameString.get("slotMachineGotReward") .. self.m_lastReward .. RechargeDataInterface.getInstance():getGoodNameByTypeId(self.m_lastPid);
				end 

				self.m_tipsTx:setText(tips, 0);
				self.m_tipsTx:getParent():setVisible(true);
				self.m_lastReward = nil;
				self:updateUserInfo();
                self:checkCheckBoxState();
			end
		else
			self:stopSlot();
			if self.m_autoPlay then
				self:onAutoPlayBtnClick();
			end
			Toast.getInstance():showText(self.m_errorTips);
		end
	end
end

function SlotMachineLayer:getNextPic(column)
	local num;
	if self.m_stopState[column]==1 then
		num = self.m_lastPic[column];
		self.m_stopState[column] = 2;
	elseif self.m_stopState[column]==2 then
		self.m_stopState[column] = 3;
		repeat
			num = math.random(self.s_maxIdx);
		until num~=self.m_lastPic[column]; 
	end
	num = num or math.random(self.s_maxIdx);
	return num;
end

SlotMachineLayer.s_step1 = 20;
SlotMachineLayer.s_step2 = 20;
--state:nil-正常滚动;2-最后两张滚动;3-最后一张滚动;4-静止
function SlotMachineLayer:checkLast(column, loop_num)
	self.m_curLoops = loop_num or (1+self.m_curLoops);
	local pos = (self.m_responced~=nil and loop_num>self.m_baseLoops+column*60) and self.m_posStep[column]-3.0 or self.m_posStep[column];
	if self.m_stopState[column]==nil and pos>=self.s_step1 then--nil
		self.m_posStep[column] = pos;
	elseif self.m_stopState[column]==nil and pos<=self.s_step1 then--1
		if column==1 or self.m_stopState[column-1] then
			self.m_stopState[column] = 1;
		end
	elseif self.m_stopState[column]==1 or self.m_stopState[column]==2 then
		self.m_posStep[column] = math.max(pos, self.s_step2);
	elseif self.m_stopState[column]==3 then
		self.m_posStep[column] = math.max(pos, self.s_step2);
	end
	return self.m_stopState[column]~=4;
end

function SlotMachineLayer:ballPopBack(doPlay)
	self.m_bar_1:setVisible(true);
	self.m_bar_2:setVisible(false);
	self.m_originY = nil;
	self.m_ball:setPos(nil, self.m_ballY);
	if doPlay then
		self:playAnim();
		UBReport.getInstance():report(UBConfig.kSlotMachineAction8);
	end
end

function SlotMachineLayer:onBallTouched(finger_action, _, y)
	if self.m_isPlaying then
		return;
	end
	if kFingerDown==finger_action then 
		local _, newY = self.m_ballView:convertSurfacePointToView(0, y);
		if newY<=self.m_ballH then
			self.m_originY = y;
		end
	elseif kFingerUp==finger_action and self.m_originY then
		local doPlay = y-self.m_originY>SlotMachineLayer.s_maxDis*0.55 and self:getVisible();
		self:ballPopBack(doPlay);
	elseif kFingerMove==finger_action and self.m_originY then
		local dis = y-self.m_originY;
		if dis<=SlotMachineLayer.s_maxDis/4+15 then
			self.m_bar_1:setVisible(true);
			self.m_bar_2:setVisible(false);
		elseif dis>=SlotMachineLayer.s_maxDis*3/4 then
			self.m_bar_1:setVisible(false);
			self.m_bar_2:setVisible(true);
		else
			self.m_bar_1:setVisible(false);
			self.m_bar_2:setVisible(false);
		end
		if dis>0 and dis<=SlotMachineLayer.s_maxDis then
			self.m_ball:setPos(nil, self.m_ballY+dis);
		elseif dis>SlotMachineLayer.s_maxDis then
			self:ballPopBack(true);
		end
	end
end

function SlotMachineLayer:startLight()
	self:stopLight();
	self.m_animLight = new(AnimInt, kAnimRepeat, 0, 1, 150, -1);
	self.m_animLight:setDebugName("SlotMachineLayer:startLight");
	self.m_animLight:setEvent(self, self.onFinishLight);
end

function SlotMachineLayer:stopLight()
	delete(self.m_animLight);
	self.m_animLight = nil;
end

function SlotMachineLayer:onFinishLight(anim_type, anim_id, loop_num)
	if loop_num>6 then
		self:stopSlot();
	end
	local visible = loop_num%2==1;
	self.m_light:setVisible(visible);
	self.m_light1:setVisible(not visible);
	self.m_titleTx:setVisible(visible);
	self.m_numTx:setVisible(visible);
end

function SlotMachineLayer:stopSlot()
	self.m_isPlaying = false;
	self:stopLight();
	self.m_tipsTx:getParent():setVisible(false);
	self.m_titleTx:setText(GameString.get("slotMachineMostReward"), 0);
	self.m_titleTx:setColor(247, 245, 182);
	self.m_numTx:setColor(247, 245, 182);
    self:onChange(self.m_betIdx);
	if self.m_autoPlay then
		self:playAnim();
	end
end

function SlotMachineLayer:onChange(index, isChecked)
	self.m_betIdx = index;

	self:checkCheckBoxState();

    local configs = kSlotMachineInfo:getBetConfig();
    if configs[index] then
        self.m_numTx:setText(configs[index].bet*configs[index].max, 0);
    end
    kSlotMachineInfo:setLastBet(self.m_betIdx);
    UBReport.getInstance():report(UBConfig.kSlotMachineAction5+index-1);
end

function SlotMachineLayer:resetCheckBoxState()
	for i = 1, 3 do
        local checkBox = self.m_checkBoxGroup:getCheckBox(i);
        self.m_checkBoxGroup:setChecked(i, false);

        local disable = not kSlotMachineInfo:isMoneyEnough(i);
        local img = checkBox:getChildByName("img");
		img:setVisible(disable)
		checkBox:setPickable(not disable);
    end
end

function SlotMachineLayer:checkCheckBoxState()

	local index = self.m_betIdx;
	local item = self.m_checkBoxGroup:getCheckBox(index);

	self:resetCheckBoxState();

	local enable = kSlotMachineInfo:isMoneyEnough(index);

	if enable then
    	self.m_checkBoxGroup:setChecked(index, true);
    end
end

function SlotMachineLayer:initCheckgroup()
    local configs = kSlotMachineInfo:getBetConfig();

    local textLabel = {self.m_checkBox1, self.m_checkBox2, self.m_checkBox3};

    for i = #configs , 1 , -1 do
    	local checkBoxText = textLabel[i]:getChildByName("text");
        checkBoxText:setText(configs[i].bet, 0);
    end

    self:onChange(self.m_betIdx);
end

--record
function SlotMachineLayer:updateRecord(records)
	delete(self.m_recordTV);
	self.m_recordTV = nil;
	self:showRecordView();
end

--lucky
function SlotMachineLayer:createLuckyView()
	if not self.m_luckyImages then
		local w,h = self.m_luckyView:getSize();
		self.m_curLuckyIdx = 1;
		self.m_luckyImages = {};
		for i = 0, 1 do
			self.m_luckyImages[i] = new(SlotImage, slot_pin_map[string.format(self.s_filePath, self.m_curLuckyIdx+i)]);
			if not self.m_luckyW then
				local wi, hi = self.m_luckyImages[i]:getSize();
				w = math.min(w/wi, h/hi);
				self.m_luckyW, self.m_luckyH = w*wi, w*hi;
			end

			self.m_luckyImages[i]:setSize(self.m_luckyW, self.m_luckyH);
			self.m_luckyImages[i]:setPos(0, self.m_luckyH*(i+self.m_curLuckyIdx-1));
			self.m_luckyImages[i]:setAlign(kAlignCenter);
			self.m_luckyImages[i]:setClip(0, (h-self.m_luckyH)/2, self.m_luckyW, self.m_luckyH);
			self.m_luckyView:addChild(self.m_luckyImages[i]);
		end
	end
end

function SlotMachineLayer:fixIndex(i)
	return i%self.s_maxIdx==0 and self.s_maxIdx or i%self.s_maxIdx;
end

function SlotMachineLayer:onLuckyViewTouched(finger_action, x, y, drawing_id_first, drawing_id_current)
	if self.m_isPlaying then
		return;
	end
	if kFingerDown==finger_action then
		self.m_luckyY = y;
	elseif kFingerUp==finger_action and self.m_luckyY then
		local dis = y - self.m_luckyY;
		local add = dis%self.m_luckyH>self.m_luckyH/2 and 1 or 0;
		self.m_curLuckyIdx = add+self:fixIndex((math.floor(dis/self.m_luckyH)+self.m_curLuckyIdx));
		self.m_curLuckyIdx = self:fixIndex(self.m_curLuckyIdx);
		self.m_luckyImages[0]:setFile(slot_pin_map[string.format(self.s_filePath, self.m_curLuckyIdx)]);
		self.m_luckyImages[1]:setFile(slot_pin_map[string.format(self.s_filePath, self:fixIndex(self.m_curLuckyIdx+1))]);
		self.m_luckyImages[0]:setPos(nil, 0);
		self.m_luckyImages[1]:setPos(nil, -self.m_luckyH);
		self.m_luckyY = nil;
		UBReport.getInstance():report(UBConfig.kSlotMachineAction2);
	elseif kFingerMove==finger_action and self.m_luckyY then
		local dis = y - self.m_luckyY;
		local curLuckyIdx = (math.floor(dis/self.m_luckyH)+self.m_curLuckyIdx);
		local pos = dis%self.m_luckyH;
		self.m_luckyImages[0]:setFile(slot_pin_map[string.format(self.s_filePath, self:fixIndex(curLuckyIdx))]);
		self.m_luckyImages[1]:setFile(slot_pin_map[string.format(self.s_filePath, self:fixIndex(curLuckyIdx+1))]);
		self.m_luckyImages[0]:setPos(nil, pos);
		self.m_luckyImages[1]:setPos(nil, pos-self.m_luckyH);
	end


	for i = 0, 1 do
		local w,h = self.m_luckyView:getSize();
		local wi, hi = self.m_luckyImages[i]:getSize();
		w = math.min(w/wi, h/hi);
		self.m_luckyImages[i]:setClip(0, (h-self.m_luckyH)/2, self.m_luckyW, self.m_luckyH);
	end
end

function SlotMachineLayer:onGetSlotMachineConfigCallBack(isSuccess)
	if kSlotMachineInfo:isConfigUpdated() then
		self:showConfigView(true);
		kSlotMachineInfo:setConfigUpdated(false);
	end	
end

function SlotMachineLayer:onGetSlotMachineRecordCallBack(isSuccess, records)
	if isSuccess then
		self:updateRecord(records);
	else
		Toast.getInstance():showText(GameString.get("slotMachineGetRecord"));
	end
end

function SlotMachineLayer:onGetSlotMachineRewardCallBack(isSuccess, data)
	self:stopTimer();
	self.m_baseLoops = self.m_curLoops>self.s_minLoops and self.m_curLoops or 0;

	self.m_responced = isSuccess;
	if isSuccess then
		local c = data.combination;
		self.m_lastPic = {c[1], c[2], c[3]};
		self.m_lastReward = data.rewardMoney;
		self.m_lastPid = data.pid;
	else
		self.m_errorTips = data or GameString.get("slotMachineCheckNet");
		self.m_lastPic = {7, 6, 5};
		self.m_lastReward = nil;		
	end
end

function SlotMachineLayer:dispatchMsg()
end

function SlotMachineLayer:updateUserInfo()
end

--touch hander
function SlotMachineLayer:onCloseBtnClick()
	self:execDelegate(SlotMachineLayer.Delegate.onCloseSlotMachineLayer, true)
end

function SlotMachineLayer:onConfigBtnClick()
	if self.m_selectedBtn~=1 then
		self.m_selectedBtn = 1;
		self.m_recordTx:setColor(255, 234, 54);
		self.m_configTx:setColor(247, 245, 182);
		self.m_recordView:setVisible(false);
		self.m_configView:setVisible(true);
		self.m_recordMask:setVisible(false);
		self.m_configMask:setVisible(true);
	end
	self:showConfigView();
end

function SlotMachineLayer:onRecordBtnClick()
	if self.m_selectedBtn~=2 then
		self.m_selectedBtn = 2;
		self.m_configTx:setColor(255, 234, 54);
		self.m_recordTx:setColor(247, 245, 182);
		self.m_configView:setVisible(false);
		self.m_recordView:setVisible(true);
		self.m_recordMask:setVisible(true);
		self.m_configMask:setVisible(false);
	end
	self:showRecordView();
end

function SlotMachineLayer:onAutoPlayBtnClick()
	self.m_autoPlay = not self.m_autoPlay;
	self.m_autoPlayTick:setVisible(self.m_autoPlay);
	if self.m_autoPlay and not self.m_isPlaying then 
		self:playAnim();
	end
	--
	if self.m_autoPlay then
		UBReport.getInstance():report(UBConfig.kSlotMachineAction3);
	else
		UBReport.getInstance():report(UBConfig.kSlotMachineAction4);
	end
end

function SlotMachineLayer:onDetailBtnClick()
	kSlotMachineInfo:requestRecord();
	self.m_main:setVisible(false);
	self.m_detailView:setVisible(true);
	self:onConfigBtnClick();
	delete(self.m_recordTV);
	self.m_recordTV = nil;
	UBReport.getInstance():report(UBConfig.kSlotMachineAction1);
end

function SlotMachineLayer:onDetailCloseBtnClick()
	self.m_detailView:setVisible(false);
	self.m_main:setVisible(true);
end

function SlotMachineLayer:onShieldTouched()
end

----detail
--configview
function SlotMachineLayer:showConfigView(doForce)
	if self.m_betIdx~=self.m_configIdx or doForce then
		self.m_configView:removeAllChildren();
		local config = kSlotMachineInfo:getConfig();
		if table.isEmpty(config) then
			return;
		end
		
		if doForce and not config[self.m_betIdx] and config[1] then
			self.m_betIdx = 1;--fix index to be usefull
			kSlotMachineInfo:setLastBet(self.m_betIdx)
		end

		if config[self.m_betIdx] then
			ScrollBar.setDefaultImage( slot_pin_map["barImg.png"] );

			local w, h = self.m_configView:getSize();
			BetItem.setBet(config[self.m_betIdx].bet or 1);
			local tableView = new(TableView, 0, 0, w, h, true, true);
			local adapter = UIFactory.createCacheAdapter(BetItem, config[self.m_betIdx].conf);
			if adapter then 
				tableView:setAdapter(adapter);
			end 
			self.m_configView:addChild(tableView);

			ScrollBar.setDefaultImage(nil);
		else 
			return true;
		end
		self.m_configIdx = self.m_betIdx;
	end
end

--recordview
function SlotMachineLayer:showRecordView()
	if not self.m_recordTV then

		ScrollBar.setDefaultImage( slot_pin_map["barImg.png"] );
		local record = kSlotMachineInfo:getRecord();
		if not table.isEmpty(record) then
			local w, h = self.m_recordView:getSize()
			self.m_recordTV = new(ListView, 0, 0, w, h);
			local adapter = UIFactory.createCacheAdapter(RecordItem, record);
			if adapter then 
				self.m_recordTV:setAdapter(adapter);
			end 
			self.m_recordView:addChild(self.m_recordTV);
		end
		ScrollBar.setDefaultImage(nil);
	end
end

function SlotMachineLayer:startPars()
	if self.m_lastReward and self.m_lastReward > 0 then
		self:stopPars();
		self.m_pars = ParticleSystem.getInstance():create(money_pin_map_map,ParticleMoney,0,0,nil,kParticleTypeBlast,(num or 20),{["h"] = System.getScreenHeight()/2,["w"] = System.getScreenWidth();["rotation"]=4;["scale"]=1;["maxIndex"]=7;});
		self:addChild(self.m_pars);
		self.m_pars:resume();
		kEffectPlayer:play(Effects.AudioDropMoneyShort);
	end
end

function SlotMachineLayer:stopPars()
	kEffectPlayer:stop(Effects.AudioDropMoneyShort);
	delete(self.m_pars);
	self.m_pars = nil;
end

function SlotMachineLayer:startTimer()
	self:stopTimer();
	SlotMachineLayer.s_timer = new(AnimInt, kAnimNormal, 0, 1, 10000, -1);
	SlotMachineLayer.s_timer:setDebugName("SlotMachineLayer.s_timer");
	SlotMachineLayer.s_timer:setEvent(self, SlotMachineLayer.onTimer)
end

function SlotMachineLayer:stopTimer()
	delete(SlotMachineLayer.s_timer);
	SlotMachineLayer.s_timer = nil;
end

function SlotMachineLayer:onTimer()
	self:onGetSlotMachineRewardCallBack(false);
	self:stopTimer();
end


SlotMachineLayer.s_controlConfig = 
{
	[SlotMachineLayer.s_controls.shield]        = {"shield"};
	[SlotMachineLayer.s_controls.main]        	= {"main"};
	[SlotMachineLayer.s_controls.titleTx]     	= {"main", "titleTx"};
	[SlotMachineLayer.s_controls.numTx]     	= {"main", "numTx"};
	[SlotMachineLayer.s_controls.light]     	= {"main", "light"};
	[SlotMachineLayer.s_controls.light1]     	= {"main", "light1"};
	[SlotMachineLayer.s_controls.detailBtn]     = {"main", "detailBtn"};
	[SlotMachineLayer.s_controls.animView]		= {"main", "animView"};
	[SlotMachineLayer.s_controls.mask]			= {"main", "mask"};
	[SlotMachineLayer.s_controls.ballView]		= {"main", "ballView"};
	[SlotMachineLayer.s_controls.ball]			= {"main", "ballView", "ball"};
	[SlotMachineLayer.s_controls.bar_1]			= {"main", "ballView", "bar_1"};
	[SlotMachineLayer.s_controls.bar_2]			= {"main", "ballView", "bar_2"};
	[SlotMachineLayer.s_controls.closeBtn]		= {"main", "closeBtn"};
	[SlotMachineLayer.s_controls.luckyView]		= {"main", "luckyView"};
	[SlotMachineLayer.s_controls.autoPlayBtn]	= {"main", "autoPlayBtn"};
	[SlotMachineLayer.s_controls.autoPlayTick]	= {"main", "autoPlayBtn", "autoPlayTick"};
	[SlotMachineLayer.s_controls.tipsTx]		= {"main", "tipsBg", "tipsTx"};

	[SlotMachineLayer.s_controls.detailView] 		= {"detailView"};
	[SlotMachineLayer.s_controls.configBtn] 		= {"detailView", "configBtn"};
	[SlotMachineLayer.s_controls.recordBtn] 		= {"detailView", "recordBtn"};
	[SlotMachineLayer.s_controls.configMask] 		= {"detailView", "configBtn", "mask"};
	[SlotMachineLayer.s_controls.recordMask] 		= {"detailView", "recordBtn", "mask"};
	[SlotMachineLayer.s_controls.configTx] 			= {"detailView", "configBtn", "tx"};
	[SlotMachineLayer.s_controls.recordTx] 			= {"detailView", "recordBtn", "tx"};
	[SlotMachineLayer.s_controls.configView] 		= {"detailView", "configView"};
	[SlotMachineLayer.s_controls.recordView] 		= {"detailView", "recordView"};
	[SlotMachineLayer.s_controls.detailCloseBtn] 	= {"detailView", "closeBtn"};

    [SlotMachineLayer.s_controls.checkBoxGroup] = {"main", "checkBoxGroup"},
	[SlotMachineLayer.s_controls.checkBox1] = {"main", "checkBoxGroup", "checkBox1"},
	[SlotMachineLayer.s_controls.checkBox2] = {"main", "checkBoxGroup", "checkBox2"},
	[SlotMachineLayer.s_controls.checkBox3] = {"main", "checkBoxGroup", "checkBox3"},

	[SlotMachineLayer.s_controls.lightMirror1] = {"main", "light", "mirror"},
	[SlotMachineLayer.s_controls.lightMirror2] = {"main", "light1", "mirror"},
}

SlotMachineLayer.s_controlFuncMap =
{
    [SlotMachineLayer.s_controls.closeBtn]  		= SlotMachineLayer.onCloseBtnClick;
    [SlotMachineLayer.s_controls.autoPlayBtn]  		= SlotMachineLayer.onAutoPlayBtnClick;
    [SlotMachineLayer.s_controls.detailBtn]  		= SlotMachineLayer.onDetailBtnClick;
    [SlotMachineLayer.s_controls.detailCloseBtn]  	= SlotMachineLayer.onDetailCloseBtnClick;
    [SlotMachineLayer.s_controls.configBtn]  		= SlotMachineLayer.onConfigBtnClick;
    [SlotMachineLayer.s_controls.recordBtn]  		= SlotMachineLayer.onRecordBtnClick;
}

------------BetItem
BetItem = class(Node);

BetItem.s_curBet = 1;

function BetItem:ctor(data)
	self.m_data = data;
	local bg = new(Image, slot_pin_map["item_bg.png"], nil, nil, 20, 20, 20, 20);
	bg:setSize(337, 57)
	bg:setAlign(kAlignCenter);
	self:addChild(bg);
	local w,h = bg:getSize();
	local combination = string.split(data.combination, ",") or {};
	local item;
	for i = 1, 3 do
		item = new(Image, slot_pin_map[string.format(SlotMachineLayer.s_filePath, tonumber(combination[i]) or 0)]);
		bg:addChild(item);
		item:setPos((i-1)*(h+7)+10, 0);
		item:setAlign(kAlignLeft);
		item:setSize(h-3, h-3);
	end
	local str = self.s_curBet*data.ratio;
	local tx = new(Text, str, 0, 0, nil, nil, 36, 250, 87, 37);
	tx:setAlign(kAlignRight);
	tx:setPos(10, 0);
	bg:addChild(tx);
	self:setSize(w+22, h+14);
end

function BetItem.setBet(bet)
	BetItem.s_curBet = bet;
end

-----------RecordItem
RecordItem = class(Node);

function RecordItem:ctor(data)
	local bg = new(Image, slot_pin_map["item_bg.png"], nil, nil, 20, 20, 20, 20);
	local w,h = bg:getSize();
	bg:setSize(720, h);
	bg:setAlign(kAlignLeft);
	self:addChild(bg);

	self.m_data = data;
	local time = ToolKit.getTimeYMD2(data.time) .. " " .. ToolKit.skipTimeHM(data.time);
	local tx = new(Text, time, 0, 0, nil, nil, 30, 0, 104, 183);
	tx:setAlign(kAlignLeft);
	tx:setPos(10, 0);
	bg:addChild(tx);

	local str = GameString.get("slotMachineGotFruit");
	tx = new(Text, str, 0, 0, nil, nil, 30, 0, 104, 183);
	tx:setAlign(kAlignLeft);
	tx:setPos(255, 0);
	bg:addChild(tx);

	local combination = string.split(data.combination, ",") or {};
	local item;
	for i = 1, 3 do
		item = new(Image, slot_pin_map[string.format(SlotMachineLayer.s_filePath, tonumber(combination[i]) or 0)]);
		bg:addChild(item);
		item:setPos(315+(i-1)*(h+5), 0);
		item:setAlign(kAlignLeft);
		item:setSize(h-3, h-3);
	end

	str = GameString.get("slotMachineGotReward");
	tx = new(Text, str, 0, 0, nil, nil, 30, 226, 117, 60);
	tx:setAlign(kAlignLeft);
	tx:setPos(497, 0);
	bg:addChild(tx);

	tx = new(Text, ToolKit.skipMoneyEx4(data.reward), 0, 0, nil, nil, 30, 236, 172, 0);
	tx:setAlign(kAlignLeft);
	tx:setPos(565, 0);
	bg:addChild(tx);
	local tw = tx:getSize();

	str = RechargeDataInterface.getInstance():getGoodNameByTypeId(data.pid);
	tx = new(Text, str, 0, 0, nil, nil, 30, 226, 117, 60);
	tx:setAlign(kAlignLeft);
	tx:setPos(570+tw, 0);
	bg:addChild(tx);
	self:setSize(720, h+10);
end

-----------SlotImage
SlotImage = class(Image, false)

function SlotImage:ctor(file)
	super(self, file);
	self.m_file = file;
end

function SlotImage:setFile(file)
	if file~=self.m_file then
		self.m_file = file;
		Image.setFile(self, file);
	end
end