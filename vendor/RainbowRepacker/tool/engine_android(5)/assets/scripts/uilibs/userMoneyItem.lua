-- 金钱简写显示

require("common/commonGameLayer");
local moneyView = require(ViewPath .. "hall/userInfo/moneyView");
local num_gold_pin_map = require("qnFiles/qnPlist/hall/num_gold_pin")
local num_match_pin_map = require("qnFiles/qnPlist/hall/num_match_pin")
local num_online_pin_map = require("qnFiles/qnPlist/hall/num_online_pin")
local num_match_detail_pin_map = require("qnFiles/qnPlist/hall/num_match_detail_pin")
local num_download_pin_map = require("qnFiles/qnPlist/hall/num_download_pin")
local num_match_list_pin_map = require("qnFiles/qnPlist/hall/num_match_list_pin")  
local num_roomLevelBrightRed_pin_map = require("qnFiles/qnPlist/hall/num_roomLevelBrightRed_pin")
local num_record_win_pin_map = require("qnFiles/qnPlist/hall/num_record_win_pin")
local num_record_lose_pin_map = require("qnFiles/qnPlist/hall/num_record_lose_pin")
local num_record_list_pin_map = require("qnFiles/qnPlist/hall/num_record_list_pin")
local geted_red_envelope_qn_pin_map = require("qnFiles/qnPlist/hall/geted_red_envelope_qn_pin")
local num_invite_pin_map = require("qnFiles/qnPlist/hall/num_invite_pin")
local num_matchShare_ranking_pin = require("qnFiles/qnPlist/hall/num_matchShare_ranking_pin")
local num_matchShare_defeat_pin = require("qnFiles/qnPlist/hall/num_matchShare_defeat_pin") 
UserMoneyItem = class(CommonGameLayer, false);


UserMoneyItem.s_defaultFilePath = num_gold_pin_map;
UserMoneyItem.s_onlineNumFilePath = num_online_pin_map;
UserMoneyItem.s_matchNumFilePath = num_match_pin_map;
UserMoneyItem.s_matchDetailNumFilePath = num_match_detail_pin_map;
UserMoneyItem.s_downloadNumFilePath = num_download_pin_map;
UserMoneyItem.s_matchListNumFilePath = num_match_list_pin_map;
UserMoneyItem.s_roomLevelBrightRedNumFilePath  = num_roomLevelBrightRed_pin_map;  
UserMoneyItem.s_recordWinNumFilePath = num_record_win_pin_map;
UserMoneyItem.s_recordLoseNumFilePath = num_record_lose_pin_map;
UserMoneyItem.s_recordListNumFilePath = num_record_list_pin_map;
UserMoneyItem.s_redEnvelopeNumFilePath = geted_red_envelope_qn_pin_map;  --这个只用于纯数字
UserMoneyItem.s_inviteNumFilePath = num_invite_pin_map;  --这个只用于纯数字
UserMoneyItem.s_matchShareRankingNumFilePath = num_matchShare_ranking_pin;  
UserMoneyItem.s_matchShareDefeatNumFilePath = num_matchShare_defeat_pin;  

local l_defaultFilePath = UserMoneyItem.s_defaultFilePath;

local l_index = 0;
local getIndex = function(self)
	l_index = l_index + 1;
	return l_index;
end

UserMoneyItem.s_controls = 
{
	moneyLayer = getIndex(),
	Image1 = getIndex(),
	Image2 = getIndex(),
	Image3 = getIndex(),
	Image4 = getIndex(),
	Image5 = getIndex(),
	Image6 = getIndex(),
	Image7 = getIndex(),
	Image8 = getIndex(),
	Image9 = getIndex(),
	Image10 = getIndex(),
	Image11 = getIndex(),
	Image12 = getIndex(),
	Image13 = getIndex(),
	Image14 = getIndex(),
    num = getIndex(),
};

UserMoneyItem.MoneyNum = 
{
	[1] = { path=num_gold_pin_map["0.png"]},
	[2] = { path=num_gold_pin_map["1.png"]},
	[3] = { path=num_gold_pin_map["2.png"]},
	[4] = { path=num_gold_pin_map["3.png"]},
	[5] = { path=num_gold_pin_map["4.png"]},
	[6] = { path=num_gold_pin_map["5.png"]},
	[7] = { path=num_gold_pin_map["6.png"]},
	[8] = { path=num_gold_pin_map["7.png"]},
	[9] = { path=num_gold_pin_map["8.png"]},
	[10] = { path=num_gold_pin_map["9.png"]},
	[11] = { path=num_gold_pin_map["dou.png"]},		-- ","
	[12] = { path=num_gold_pin_map["dian.png"]},		-- "."
	[13] = { path=num_gold_pin_map["wan.png"]},		-- "万"
	[14] = { path=num_gold_pin_map["yi.png"]},		-- "亿"
	[15] = { path=num_gold_pin_map["-.png"]},		    -- "-"
	[16] = { path=num_gold_pin_map["%.png"]},         -- "%"
	[17] = { path=num_gold_pin_map["+.png"]}, -- "+"
	[18] = { path=num_gold_pin_map["F.png"]}, -- "分"
};

UserMoneyItem.ImageNum = 14;

UserMoneyItem.loadMoneyNumFilePath = function(l_defaultFilePath) 
    UserMoneyItem.MoneyNum = {
        [1] = { path=l_defaultFilePath["0.png"]},
	    [2] = { path=l_defaultFilePath["1.png"]},
	    [3] = { path=l_defaultFilePath["2.png"]},
	    [4] = { path=l_defaultFilePath["3.png"]},
	    [5] = { path=l_defaultFilePath["4.png"]},
	    [6] = { path=l_defaultFilePath["5.png"]},
	    [7] = { path=l_defaultFilePath["6.png"]},
	    [8] = { path=l_defaultFilePath["7.png"]},
	    [9] = { path=l_defaultFilePath["8.png"]},
	    [10] = { path=l_defaultFilePath["9.png"]},
	    [11] = { path=l_defaultFilePath["dou.png"]},		-- ","
	    [12] = { path=l_defaultFilePath["dian.png"]},		-- "."
	    [13] = { path=l_defaultFilePath["wan.png"]},		-- "万"
	    [14] = { path=l_defaultFilePath["yi.png"]},		-- "亿"
	    [15] = { path=l_defaultFilePath["-.png"]},		-- "-"
	    [16] = { path=l_defaultFilePath["%.png"]},      -- "%"
	    [17] = { path=l_defaultFilePath["+.png"]}, -- "+"
	    [18] = { path=l_defaultFilePath["F.png"]}, -- "分"
    }
end

UserMoneyItem.setFilePath = function(newPath)
    if not newPath then
       newPath = UserMoneyItem.s_defaultFilePath;
    end
    UserMoneyItem.loadMoneyNumFilePath(newPath);
end


UserMoneyItem.ctor = function(self, viewConfig)
	super(self, moneyView);
	self:setSize( self.m_root:getSize() );
	self.m_ctrl = UserMoneyItem.s_controls;
    self.m_num = self:findViewById(self.m_ctrl.num)
	self.m_resTbl = {}
end

UserMoneyItem.dtor = function(self)
end

UserMoneyItem.clear = function(self)
	self.m_resTbl = {}

	self:setPos(0, 0)
	self:setAlign(kAlignLeft)
	local moneyView = self:getControl(self.m_ctrl.moneyLayer)
	moneyView:setPos(0, 0)
	moneyView:setAlign(kAlignLeft)
end

UserMoneyItem.setMoneyNum = function(self, num, percent)
	self:clear()
    if num then
        self.m_num:setText(tostring(num));
    end
	-- num < 10000000000000	:	最多不超过十万亿，显示最多六张图
	self:__Num2Res(tonumber(num) or 0)
	-- 理论上简化后最多显示5位：包括小数点和单位
	percent = percent or 1;
	local x = 0
	for index, res in ipairs(self.m_resTbl) do
		local imageCtrl = self:getControl(self.m_ctrl[string.format("Image%d", index)])
		imageCtrl:setFile(res.path)
		local w,h = imageCtrl.m_res.m_width, imageCtrl.m_res.m_height;
		imageCtrl:setSize(w*percent, h*percent)
		imageCtrl:setVisible(true)
		imageCtrl:setPos(x, 0)
		x = x + w*percent + 1
	end
	self:setSize(x, nil);

	-- 隐藏没有用到的图片
	for i = #self.m_resTbl+1, UserMoneyItem.ImageNum do 
		self:getControl(self.m_ctrl[string.format("Image%d", i)]):setVisible(false)
	end
end

-----------------------------
-- @desc : 无四舍五入的除法
-- num: 被除数
-- devisor: 除数
-- demical: 保留几位小数
UserMoneyItem.__DevideWithoutRound = function(self, num, devisor, demical)
	if not demical or demical == 0 then
		demical = -1
	end
	local nums1 = math.floor(num/devisor);
	local nums2 = string.sub(devisor+num%devisor,2,1+demical);
	-- local result = string.format("%.6f", num/devisor)
	local result = nums1 .. "." .. nums2;
	local demical_pos = string.find(result, "%.") or #result
	return string.sub(result, 1, demical_pos+demical)
end

UserMoneyItem.__NumSplit = function(self, num)
	local money_str = tostring(num)
	local result = {}

	for money_num in string.gfind(money_str, "(%d)") do 
		table.insert(result, tonumber(money_num))
	end

	return result
end

UserMoneyItem.__Num2Res = function(self, num)
	if num < 0 then
		-- 插入 -号
		table.insert(self.m_resTbl, self.MoneyNum[15])
		self:__Num2Res(-num)

	elseif num <= 99999 then
		local result = self:__NumSplit(num)
		for k, v in ipairs(result) do
			table.insert(self.m_resTbl, self.MoneyNum[v+1])
			if k<#result and (#result-k)%3==0 then
				-- 插入分隔符
				table.insert(self.m_resTbl, self.MoneyNum[11])
			end
		end

	elseif num <= 999999 then
		-- xx.x万
		local result = self:__DevideWithoutRound(num, 10000, 1)
		result = self:__NumSplit(result)
		for k, v in ipairs(result) do
			if k == #result then
				-- 小数点后这个数是0，就不显示.0
				if v == 0 then break end
				-- 插入. 
				table.insert(self.m_resTbl, self.MoneyNum[12])
			end
			table.insert(self.m_resTbl, self.MoneyNum[v+1])
		end
		-- 插入万
		table.insert(self.m_resTbl, self.MoneyNum[13])		

	elseif num <= 99999999 then
		-- xxx万 or xxxx万
		local result = self:__NumSplit(math.floor(num/10000))
		for k, v in ipairs(result) do
			table.insert(self.m_resTbl, self.MoneyNum[v+1])
			if k<#result and (#result-k)%3==0 then
				-- 插入分隔符
				table.insert(self.m_resTbl, self.MoneyNum[11])
			end
		end
		table.insert(self.m_resTbl, self.MoneyNum[13])	

	elseif num <= 9999999999 then
		-- x.x亿 or xx.x亿
		local result = self:__DevideWithoutRound(num, 100000000, 1)
		result = self:__NumSplit(result)
		for k, v in ipairs(result) do
			if k == #result then
				-- 小数点后这个数是0，就不显示.0
				if v == 0 then break end
				-- 插入. 
				table.insert(self.m_resTbl, self.MoneyNum[12])
			end
			table.insert(self.m_resTbl, self.MoneyNum[v+1])
		end
		table.insert(self.m_resTbl, self.MoneyNum[14])	

	else 
		-- num >= 10,000,000,000
		local result = self:__NumSplit(math.floor(num/100000000))
		for k, v in ipairs(result) do
			table.insert(self.m_resTbl, self.MoneyNum[v+1])
			if k<#result and (#result-k)%3==0 then
				-- 插入分隔符
				table.insert(self.m_resTbl, self.MoneyNum[11])
			end
		end
		table.insert(self.m_resTbl, self.MoneyNum[14])	
	end
end

UserMoneyItem.__NumAndCharSplit = function(self, num)

	local money_str = tostring(num)
	local result = {}

	for value in string.gfind(money_str, "[0-9A-Z,.%%-+]") do
		local num = tonumber(value);
		if num then
			table.insert(self.m_resTbl, self.MoneyNum[num + 1])
		elseif value == "," then
			table.insert(self.m_resTbl, self.MoneyNum[11]);
        elseif value == "." then
			table.insert(self.m_resTbl, self.MoneyNum[12])
        elseif value == "W" then
			table.insert(self.m_resTbl, self.MoneyNum[13]);
		elseif value == "Y" then
			table.insert(self.m_resTbl, self.MoneyNum[14]);
        elseif value == "-" then
			table.insert(self.m_resTbl, self.MoneyNum[15]);
		elseif value == "%" then
			table.insert(self.m_resTbl, self.MoneyNum[16]);
		elseif value == "+" then
			table.insert(self.m_resTbl, self.MoneyNum[17]);
		elseif value == "F" then
			table.insert(self.m_resTbl, self.MoneyNum[18]);
		end
	end
end

UserMoneyItem.setNormalMoneyNum = function(self, num, percent, isGray)
    if num then
        self.m_num:setText(tostring(num));
    end
    
	self:clear()
	
	self:__NumAndCharSplit(num or 0)

	percent = percent or 1;
	local x = 0
	for index, res in ipairs(self.m_resTbl) do
		local imageCtrl = self:getControl(self.m_ctrl[string.format("Image%d", index)])
		imageCtrl:setFile(res.path)
		local w,h = imageCtrl.m_res.m_width, imageCtrl.m_res.m_height;
		imageCtrl:setSize(w*percent, h*percent)
		imageCtrl:setVisible(true)
		imageCtrl:setPos(x, 0)
		imageCtrl:setGray(isGray)
		x = x + w*percent + 1
	end
	self:setSize(x, nil);

	-- 隐藏没有用到的图片
	for i = #self.m_resTbl+1, UserMoneyItem.ImageNum do 
		self:getControl(self.m_ctrl[string.format("Image%d", i)]):setVisible(false)
	end
end

UserMoneyItem.s_controlConfig = 
{
	[UserMoneyItem.s_controls.moneyLayer] = {"moneyLayer"},
	[UserMoneyItem.s_controls.Image1] = {"moneyLayer", "img1"},
	[UserMoneyItem.s_controls.Image2] = {"moneyLayer", "img2"},
	[UserMoneyItem.s_controls.Image3] = {"moneyLayer", "img3"},
	[UserMoneyItem.s_controls.Image4] = {"moneyLayer", "img4"},
	[UserMoneyItem.s_controls.Image5] = {"moneyLayer", "img5"},
	[UserMoneyItem.s_controls.Image6] = {"moneyLayer", "img6"},
	[UserMoneyItem.s_controls.Image7] = {"moneyLayer", "img7"},
	[UserMoneyItem.s_controls.Image8] = {"moneyLayer", "img8"},
	[UserMoneyItem.s_controls.Image9] = {"moneyLayer", "img9"},
	[UserMoneyItem.s_controls.Image10] = {"moneyLayer", "img10"},
	[UserMoneyItem.s_controls.Image11] = {"moneyLayer", "img11"},
	[UserMoneyItem.s_controls.Image12] = {"moneyLayer", "img12"},
	[UserMoneyItem.s_controls.Image13] = {"moneyLayer", "img13"},
	[UserMoneyItem.s_controls.Image14] = {"moneyLayer", "img14"},
    [UserMoneyItem.s_controls.num] = { "num"},
}
