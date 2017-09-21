local privateRoomInputLayout = require(ViewPath .. "hall/privateRoom/privateRoomInputLayout");
local privateRoom_pin_map = require("qnFiles/qnPlist/hall/privateRoom_pin")

-- 私人房输入层
local PrivateRoomInputLayer = class(CommonGameLayer, false);

local h_index = 0;
local getIndex = function(self)
    h_index = h_index + 1;
    return h_index;
end

PrivateRoomInputLayer.s_numberLength = 4;

PrivateRoomInputLayer.Delegate = {
    onInputNumberCallback = "onInputNumberCallback"; -- 输入结束回调
}

PrivateRoomInputLayer.s_controls = 
{
    topView = getIndex(),
    contentView = getIndex(),

    inputView = getIndex(),
    numberView = getIndex(),

    tips = getIndex(),
};

PrivateRoomInputLayer.s_cmds = 
{
};

PrivateRoomInputLayer.ctor = function(self)
    super(self, privateRoomInputLayout);
    self:setFillParent(true, true);
    self:_initView();

end

PrivateRoomInputLayer.dtor = function(self)

end

PrivateRoomInputLayer.showEmptyView = function(self)
    self:_showTips(kTextPrivateRoomDataEmpty);
end

PrivateRoomInputLayer.resetInput = function(self)
    self:_clearNumber();
end

--------------------------------输入框逻辑--------------------------------------------
-- input item callback
PrivateRoomInputLayer.onItemClickCallback = function(self, data)
    local func = data.func;
    if func then
        func(self, data);
    end
end

-- 输入数字
PrivateRoomInputLayer.onInputNumber = function(self, data)
    self:_addNumber(data);
end

-- 重置输入
PrivateRoomInputLayer.onInputReset = function(self, data)
    self:_clearNumber();
    self:_hideTips();
end

-- 删除输入
PrivateRoomInputLayer.onInputDelete = function(self, data)
    self:_removeNumber();
    self:_hideTips();
end

PrivateRoomInputLayer._initInputView = function(self)
    local inputView = self:findViewById(self.s_controls.inputView);
    local inputItem = require("hall/privateRoom/widget/privateRoomInputItem");
    local w, h = inputView:getSize();
    local itemW = w / 3;
    local itemH = h / 4;
    for k, v in ipairs(PrivateRoomInputLayer.s_inputConfig) do
        local i, _ = math.floor((k - 1) / 3);
        local j = (k - 1) % 3
        local item = new(inputItem, v);
        item:setSize(itemW, itemH);
        item:setPos(itemW*j, itemH*i);
        item:setDelegate(self);
        inputView:addChild(item);
    end
end

------------------------------输入显示逻辑-----------------------------------------
PrivateRoomInputLayer._initNumberView = function(self)
    local numberView = self:findViewById(self.s_controls.numberView);

    self.m_numberImgMap = {};
    self.m_numberDataList = {};
    for i = 1, PrivateRoomInputLayer.s_numberLength do
        local item = numberView:getChildByName(string.format("numberView_%s", i));
        local img = item:getChildByName("img");
        img:setVisible(false);
        self.m_numberImgMap[i] = img;
    end
end

PrivateRoomInputLayer._addNumber = function(self, data)
    local size = #self.m_numberDataList;
    if size >= PrivateRoomInputLayer.s_numberLength then
        return;
    end

    table.insert(self.m_numberDataList, data);

    local img = self.m_numberImgMap[#self.m_numberDataList];
    if img and data.file then
        img:setFile(privateRoom_pin_map[data.file] or "");
        self:_resetImageSize(img);
        img:setVisible(true);
    end

    -- 满足长度要求自动输出
    if #self.m_numberDataList >= PrivateRoomInputLayer.s_numberLength then
        self:_outputNumber();
    end
end

PrivateRoomInputLayer._removeNumber = function(self, data)
    local size = #self.m_numberDataList;
    if size < 1 then
        return;
    end

    local img = self.m_numberImgMap[size];
    if img then
        img:setVisible(false);
    end

    table.remove(self.m_numberDataList)
end

PrivateRoomInputLayer._outputNumber = function(self)
    local number = 0;
    for k, v in ipairs(self.m_numberDataList) do
        number = number * 10 + v.index % 11;
    end

    self:execDelegate(PrivateRoomInputLayer.Delegate.onInputNumberCallback, number);
end

PrivateRoomInputLayer._clearNumber = function(self)
    self.m_numberDataList = {};

    for i = 1, PrivateRoomInputLayer.s_numberLength do
        local img = self.m_numberImgMap[i];
        if img then
            img:setVisible(false);
        end
    end
end

--------------------------------------输入提示-------------------------------------------
PrivateRoomInputLayer._showTips = function(self, msg)
    local tips = self:findViewById(self.s_controls.tips);
    tips:setText(msg or "");
    tips:setVisible(true);
end

PrivateRoomInputLayer._hideTips = function(self)
    local tips = self:findViewById(self.s_controls.tips);
    tips:setVisible(false);
end

------------------------------------------------------------------------------------
PrivateRoomInputLayer._initView = function(self)
    self:_initInputView();
    self:_initNumberView();
end

PrivateRoomInputLayer._resetImageSize = function(self, image)
    if image and image.m_res then
        local width = image.m_res:getWidth();
        local height = image.m_res:getHeight();
        image:setSize(width, height);
    end
end

---------------------------------------------------------------------------------------
PrivateRoomInputLayer.s_controlConfig = 
{
    [PrivateRoomInputLayer.s_controls.contentView] = {"contentView"};
    [PrivateRoomInputLayer.s_controls.inputView] = {"contentView", "inputBg", "inputView"};
    [PrivateRoomInputLayer.s_controls.topView] = {"contentView", "inputBg","topView"};
    [PrivateRoomInputLayer.s_controls.numberView] = {"contentView", "inputBg","topView", "infoView", "numberView"};
    [PrivateRoomInputLayer.s_controls.tips] = {"contentView", "inputBg", "topView",  "infoView", "tips"};
};

PrivateRoomInputLayer.s_controlFuncMap = 
{

};

PrivateRoomInputLayer.s_cmdConfig = 
{
};

-- 输入框配置
PrivateRoomInputLayer.s_inputConfig = {
    [1] = {file = "input_1.png", index = 1, func = PrivateRoomInputLayer.onInputNumber},
    [2] = {file = "input_2.png", index = 2, func = PrivateRoomInputLayer.onInputNumber},
    [3] = {file = "input_3.png", index = 3, func = PrivateRoomInputLayer.onInputNumber},
    [4] = {file = "input_4.png", index = 4, func = PrivateRoomInputLayer.onInputNumber},
    [5] = {file = "input_5.png", index = 5, func = PrivateRoomInputLayer.onInputNumber},
    [6] = {file = "input_6.png", index = 6, func = PrivateRoomInputLayer.onInputNumber},
    [7] = {file = "input_7.png", index = 7, func = PrivateRoomInputLayer.onInputNumber},
    [8] = {file = "input_8.png", index = 8, func = PrivateRoomInputLayer.onInputNumber},
    [9] = {file = "input_9.png", index = 9, func = PrivateRoomInputLayer.onInputNumber},
    [10] = {file = "input_reset.png", index = 10, func = PrivateRoomInputLayer.onInputReset},
    [11] = {file = "input_0.png", index = 11, func = PrivateRoomInputLayer.onInputNumber},
    [12] = {file = "input_delete.png", index = 12, func = PrivateRoomInputLayer.onInputDelete},
}

return PrivateRoomInputLayer;