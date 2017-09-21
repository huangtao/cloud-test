local privateRoom_pin_map = require("qnFiles/qnPlist/hall/privateRoom_pin")

local InvitationalKeyboardItem = require("hall/invitational/widget/invitationalKeyboardItem");
local invitational_pin_map = require("qnFiles/qnPlist/hall/invitational_pin")

-- 邀请赛键盘
local InvitationalKeyboardLayer = class(CommonGameLayer, false);

local h_index = 0;
local getIndex = function(self)
    h_index = h_index + 1;
    return h_index;
end

InvitationalKeyboardLayer.s_numberLength = 4;

InvitationalKeyboardLayer.Delegate = {
    onInputNumberCallback = "onInputNumberCallback", -- 输入结束回调
    onKeyboardLayerCloseClick = "onKeyboardLayerCloseClick",
}

InvitationalKeyboardLayer.s_controls = 
{
    topView = getIndex(),
    contentView = getIndex(),

    inputBg = getIndex(),
    returnBtn = getIndex(),
    inputView = getIndex(),
    numberView = getIndex(),
    numberTitle = getIndex(),

    tipsBg = getIndex(),
    tips = getIndex(),
    title = getIndex(),
};

InvitationalKeyboardLayer.s_cmds = 
{
};

InvitationalKeyboardLayer.ctor = function(self, layout)
    super(self, layout);
    self:setFillParent(true, true);
    self.m_inputView = self:findViewById(self.s_controls.inputView)
    self.m_inputBg = self:findViewById(self.s_controls.inputBg)
    self.m_title = self:findViewById(self.s_controls.title)
    self.m_tipsBg = self:findViewById(self.s_controls.tipsBg)
    self.m_tips = self:findViewById(self.s_controls.tips)
    self.m_returnBtn = self:findViewById(self.s_controls.returnBtn)
    self.m_numberTitle = self:findViewById(self.s_controls.numberTitle)
    self:_initView();

end

InvitationalKeyboardLayer.dtor = function(self)

end

InvitationalKeyboardLayer.showEmptyView = function(self, str)
    self:_showTips(str);
end

InvitationalKeyboardLayer.resetInput = function(self)
    self:_clearNumber();
end

--------------------------------输入框逻辑--------------------------------------------
-- input item callback
InvitationalKeyboardLayer.onItemClickCallback = function(self, data)
    local func = data.func;
    if func then
        func(self, data);
    end
end

-- 输入数字
InvitationalKeyboardLayer.onInputNumber = function(self, data)
    self:_addNumber(data);
end

-- 重置输入
InvitationalKeyboardLayer.onInputReset = function(self, data)
    self:_clearNumber();
    self:_hideTips();
end

-- 删除输入
InvitationalKeyboardLayer.onInputDelete = function(self, data)
    self:_removeNumber();
    self:_hideTips();
end

InvitationalKeyboardLayer._initInputView = function(self)
    local w, h = self.m_inputView:getSize();
    local itemW = w / 3;
    local itemH = h / 4;
    for k, v in ipairs(InvitationalKeyboardLayer.s_inputConfig) do
        local i, _ = math.floor((k - 1) / 3);
        local j = (k - 1) % 3
        local item = new(InvitationalKeyboardItem, v);
        item:setSize(itemW, itemH);
        item:setImgSelSize(itemW+12, itemH+12)
        item:setPos(itemW*j, itemH*i);
        item:setDelegate(self);
        self.m_inputView:addChild(item);
    end
end

------------------------------输入显示逻辑-----------------------------------------
InvitationalKeyboardLayer._initNumberView = function(self)
    local numberView = self:findViewById(self.s_controls.numberView);

    self.m_numberImgMap = {};
    self.m_numberDataList = {};
    for i = 1, InvitationalKeyboardLayer.s_numberLength do
        local item = numberView:getChildByName(string.format("numberView_%s", i));
        local img = item:getChildByName("img");
        img:setVisible(false);
        self.m_numberImgMap[i] = img;
    end
end

InvitationalKeyboardLayer._addNumber = function(self, data)
    local size = #self.m_numberDataList;
    if size >= InvitationalKeyboardLayer.s_numberLength then
        return;
    end

    table.insert(self.m_numberDataList, data);

    local img = self.m_numberImgMap[#self.m_numberDataList];
    if img and data.file then
        img:setFile(data.file or "");
        self:_resetImageSize(img);
        img:setVisible(true);
    end

    -- 满足长度要求自动输出
    if #self.m_numberDataList >= InvitationalKeyboardLayer.s_numberLength then
        self:_outputNumber();
    end
end

InvitationalKeyboardLayer._removeNumber = function(self, data)
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

InvitationalKeyboardLayer._outputNumber = function(self)
    local number = 0;
    for k, v in ipairs(self.m_numberDataList) do
        number = number * 10 + v.index % 11;
    end

    self:execDelegate(InvitationalKeyboardLayer.Delegate.onInputNumberCallback, number);
end

InvitationalKeyboardLayer._clearNumber = function(self)
    self.m_numberDataList = {};

    for i = 1, InvitationalKeyboardLayer.s_numberLength do
        local img = self.m_numberImgMap[i];
        if img then
            img:setVisible(false);
        end
    end
end

--------------------------------------输入提示-------------------------------------------
InvitationalKeyboardLayer._showTips = function(self, msg)
    self.m_tips:setText(msg or "");
    self.m_tipsBg:setVisible(true);
end

InvitationalKeyboardLayer._hideTips = function(self)
    self.m_tipsBg:setVisible(false);
end

------------------------------------------------------------------------------------
InvitationalKeyboardLayer._initView = function(self)
    self:_initInputView();
    self:_initNumberView();
end

InvitationalKeyboardLayer._resetImageSize = function(self, image)
    if image and image.m_res then
        local width = image.m_res:getWidth();
        local height = image.m_res:getHeight();
        image:setSize(width, height);
    end
end

InvitationalKeyboardLayer.setBgFile = function(self, file)
    self.m_inputBg:setFile(file)
end

InvitationalKeyboardLayer.setTitle = function(self, title)
    self.m_title:setText(title)
end

InvitationalKeyboardLayer.setInputBgAlign = function(self, align)
    self.m_inputBg:setAlign(align)
end

InvitationalKeyboardLayer.setReturnBtnState = function(self, state)
    self.m_returnBtn:setVisible(state)
end

InvitationalKeyboardLayer.setNumberTitleVisible = function(self, state)
    self.m_numberTitle:setVisible(state)
end

InvitationalKeyboardLayer.onCloseClick = function(self)
    self:execDelegate(InvitationalKeyboardLayer.Delegate.onKeyboardLayerCloseClick, true)
end

---------------------------------------------------------------------------------------
InvitationalKeyboardLayer.s_controlConfig = 
{
    [InvitationalKeyboardLayer.s_controls.contentView] = {"contentView"};
    [InvitationalKeyboardLayer.s_controls.inputBg] = {"contentView", "inputBg"};
    [InvitationalKeyboardLayer.s_controls.returnBtn] = {"contentView", "inputBg", "returnBtn"};
    [InvitationalKeyboardLayer.s_controls.inputView] = {"contentView", "inputBg", "inputView"};
    [InvitationalKeyboardLayer.s_controls.topView] = {"contentView", "inputBg","topView"};
    [InvitationalKeyboardLayer.s_controls.numberView] = {"contentView", "inputBg","topView", "infoView", "numberView"};
    [InvitationalKeyboardLayer.s_controls.numberTitle] = {"contentView", "inputBg","topView", "infoView", "numberTitle"};
    [InvitationalKeyboardLayer.s_controls.tipsBg] = {"contentView", "inputBg", "topView",  "infoView", "tipsBg"};
    [InvitationalKeyboardLayer.s_controls.tips] = {"contentView", "inputBg", "topView",  "infoView", "tipsBg", "tips"};
    [InvitationalKeyboardLayer.s_controls.title] = {"contentView", "inputBg", "topView",  "infoView", "title"};
};

InvitationalKeyboardLayer.s_controlFuncMap = 
{
    [InvitationalKeyboardLayer.s_controls.returnBtn] = InvitationalKeyboardLayer.onCloseClick,
};

InvitationalKeyboardLayer.s_cmdConfig = 
{
};

-- 输入框配置
InvitationalKeyboardLayer.s_inputConfig = {
    [1] = {file = privateRoom_pin_map["input_1.png"], index = 1, func = InvitationalKeyboardLayer.onInputNumber},
    [2] = {file = privateRoom_pin_map["input_2.png"], index = 2, func = InvitationalKeyboardLayer.onInputNumber},
    [3] = {file = privateRoom_pin_map["input_3.png"], index = 3, func = InvitationalKeyboardLayer.onInputNumber},
    [4] = {file = privateRoom_pin_map["input_4.png"], index = 4, func = InvitationalKeyboardLayer.onInputNumber},
    [5] = {file = privateRoom_pin_map["input_5.png"], index = 5, func = InvitationalKeyboardLayer.onInputNumber},
    [6] = {file = privateRoom_pin_map["input_6.png"], index = 6, func = InvitationalKeyboardLayer.onInputNumber},
    [7] = {file = privateRoom_pin_map["input_7.png"], index = 7, func = InvitationalKeyboardLayer.onInputNumber},
    [8] = {file = privateRoom_pin_map["input_8.png"], index = 8, func = InvitationalKeyboardLayer.onInputNumber},
    [9] = {file = privateRoom_pin_map["input_9.png"], index = 9, func = InvitationalKeyboardLayer.onInputNumber},
    [10] = {file = privateRoom_pin_map["input_reset.png"], index = 10, func = InvitationalKeyboardLayer.onInputReset},
    [11] = {file = privateRoom_pin_map["input_0.png"], index = 11, func = InvitationalKeyboardLayer.onInputNumber},
    [12] = {file = invitational_pin_map["backspace.png"], index = 12, func = InvitationalKeyboardLayer.onInputDelete},
}

return InvitationalKeyboardLayer;