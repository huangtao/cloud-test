local interface = require("isolater/abstractInterface/privateRoomEnterViewInterface");
local privateRoomEnterLayout = require(ViewPath .. "hall/privateRoom/privateRoomEnterLayout");

-- 私人房进入弹框
local PrivateRoomEnterViewCommon = class(interface, false);

local h_index = 0;
local getIndex = function(self)
    h_index = h_index + 1;
    return h_index;
end

PrivateRoomEnterViewCommon.s_controls = 
{
    closeBtn = getIndex(),
    confirmBtn = getIndex(),
    infoView = getIndex(),
};

PrivateRoomEnterViewCommon.s_cmds = 
{
};

PrivateRoomEnterViewCommon.ctor = function(self, data, closeCallback, comfirmCallback)
    super(self, privateRoomEnterLayout);
    self:setFillParent(true, true);
    self:initData(data, closeCallback, comfirmCallback);
    self:initView();
    self:showData();
end

PrivateRoomEnterViewCommon.dtor = function(self)

end

PrivateRoomEnterViewCommon.initView = function(self)
end

PrivateRoomEnterViewCommon.initData = function(self, data, closeCallback, comfirmCallback)
    self.m_data = data;
    self.m_closeCallback = closeCallback;
    self.m_comfirmCallback = comfirmCallback;
end

-- 展示房间信息
PrivateRoomEnterViewCommon.showData = function(self)
    local data = self.m_data;
    local tableType = number.valueOf(data.tableType);
    local ownerName = data.ownerName or "";
    local subOwnerName = string.subUtfStr(ownerName, 1, 6, "");
    if string.len(ownerName) > string.len(subOwnerName) then
        subOwnerName = string.subUtfStr(ownerName, 1, 6, "...");
    end

    local roomNumber = tostring(data.tId or "") or "";
    local gemeId = number.valueOf(data.gameId);
    local gameConfig = table.verify(kGameManager:getGameConfigById(gemeId));
    local gameName = gameConfig.name or "";
    local unit = PrivateRoomConstant.UNIT_MAP[tableType] or "";
    local baseChip = tostring(data.baseChip or "") or ""

    local textList = {};
    local green = {r = 20, g = 126, b = 64};
    if tableType == PrivateRoomConstant.PRIVATE_ROOM_TYPE_SCORE then
    	local times = tostring(data.times or "") or "";
    	local rounds = tostring(data.rounds or "") or "";
    	textList = {
    		{title = "房主：", str = subOwnerName},
    		{title = "房号：", str = roomNumber},
    		{title = "游戏：", str = gameName},
    		{title = "底注：", str = baseChip..unit, color = green},
    		{title = "局数：", str = rounds},
    		{title = "最高倍数：", str = times}
    	}
    else
    	local requireMoney = tostring(data.requireMoney or "") or ""
    	textList = {
    		{title = "房主：", str = subOwnerName},
    		{title = "房号：", str = roomNumber},
    		{title = "游戏：", str = gameName},
    		{title = "底注：", str = baseChip..unit, color = green},
    		{title = "入场限制：", str = requireMoney..unit},
    	}
    end


    self:initTextList(textList);
end

PrivateRoomEnterViewCommon.initTextList = function(self, textList)
	local infoView = self:findViewById(self.s_controls.infoView);
	local w, h = infoView:getSize();
    local rowNum = 3;
    local colNum = 2;
	local startLeft = w * 8 / 100;
	local startRight = w * 3 / 5;
    local itemHight = h / rowNum;
	for k, v in ipairs(textList) do
		local textNode = self:createTextNode(v);
        textNode:setSize(nil, itemHight);
        local i = math.floor((k-1) / colNum);
        local j = (k-1) % colNum;
        local start = j == 0 and startLeft or startRight;
        textNode:setPos(start, i * itemHight);
        infoView:addChild(textNode);
	end
end

PrivateRoomEnterViewCommon.createTextNode = function(self, data)
    local space = 0;
    local node = new(Node);
    local data = table.verify(data);
    local title = self:createText(data.title);
    local str = self:createText(data.str, data.color);
    node:addChild(title);
    node:addChild(str);
    title:setAlign(kAlignLeft);
    str:setAlign(kAlignLeft);
    local wTitle, hTitle = title:getSize();
    local wStr, _ = str:getSize();
    str:setPos(wTitle + space);
    node:setSize(wTitle + space + wStr, hTitle);
    return node;
end

PrivateRoomEnterViewCommon.createText = function(self, str, color)
	local textColor = table.verify(color);
	local text = new(Text, str, 1, 1, kAlignLeft, nil, 30, textColor.r or 118, textColor.g or 72, textColor.b or 18);
	return text;
end

-- 处理关闭
PrivateRoomEnterViewCommon.onCloseBtnClick = function(self)
    if self.m_closeCallback then
    	self.m_closeCallback();
    end
end

-- 处理确认
PrivateRoomEnterViewCommon.onConfirmBtnClick = function(self)
    if self.m_comfirmCallback then
    	self.m_comfirmCallback();
    end
end

PrivateRoomEnterViewCommon.s_controlConfig = 
{
    [PrivateRoomEnterViewCommon.s_controls.closeBtn] = {"content", "closeBtn"};
    [PrivateRoomEnterViewCommon.s_controls.confirmBtn] = {"content", "confirmBtn"};
    [PrivateRoomEnterViewCommon.s_controls.infoView] = {"content", "contentView", "infoView"};

};

PrivateRoomEnterViewCommon.s_controlFuncMap = 
{
    [PrivateRoomEnterViewCommon.s_controls.closeBtn] = PrivateRoomEnterViewCommon.onCloseBtnClick;
    [PrivateRoomEnterViewCommon.s_controls.confirmBtn] = PrivateRoomEnterViewCommon.onConfirmBtnClick;
};


return PrivateRoomEnterViewCommon;