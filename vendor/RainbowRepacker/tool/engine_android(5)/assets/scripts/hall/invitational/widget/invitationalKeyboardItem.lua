require("ui/node");
local privateRoom_pin_map = require("qnFiles/qnPlist/hall/privateRoom_pin")
local invitational_pin_map = require("qnFiles/qnPlist/hall/invitational_pin")

-- 邀请赛键盘item
local InvitationalKeyboardItem = class(Node);

InvitationalKeyboardItem.Delegate = {
    onItemClickCallback = "onItemClickCallback";
}

InvitationalKeyboardItem.ctor = function(self, data, imgSelWidth, imgSelHeight)
    self:initData(data);
    self:initView(imgSelWidth, imgSelHeight);
end

InvitationalKeyboardItem.dtor = function(self)
    self.m_view = nil;
    self.m_data = nil;
end

---------------------------------------------------------------------------------------
InvitationalKeyboardItem.initData = function(self, data)
    self.m_data = data;
end

InvitationalKeyboardItem.initView = function(self)
    local data = self.m_data;

    self.m_btn = UIFactory.createButton("hall/common/bg_blank.png", "hall/common/bg_blank.png");
    self.m_btn:setFillParent(true, true);
    self.m_btn:setAlign(kAlignCenter);
    self:addChild(self.m_btn);
    self.m_btn:setEventTouch(self, self.onItemClick);

    self.m_imgSel = UIFactory.createImage(invitational_pin_map["pw_item_select.png"]);
    self.m_imgSel:setAlign(kAlignCenter);
    self.m_imgSel:setVisible(false);
    self.m_btn:addChild(self.m_imgSel);

    local img = UIFactory.createImage(data.file);
    img:setAlign(kAlignCenter);
    self.m_btn:addChild(img);
end

InvitationalKeyboardItem.setImgSelSize = function(self, width, height)
    self.m_imgSel:setSize(width, height)
end

InvitationalKeyboardItem.onItemClick = function(self, finger_action, x, y, drawing_id_first, drawing_id_current)
    -- 快速响应，按下立即输入
    if finger_action == kFingerDown then
        self.m_imgSel:setVisible(true);
        self:execDelegate(InvitationalKeyboardItem.Delegate.onItemClickCallback, self.m_data);
    elseif finger_action == kFingerMove then
        if drawing_id_first == drawing_id_current then
            self.m_imgSel:setVisible(true);
        else
            self.m_imgSel:setVisible(false);
        end
    elseif finger_action == kFingerUp then
        self.m_imgSel:setVisible(false);
    elseif finger_action == kFingerCancel then
        self.m_imgSel:setVisible(false);
    end

    self.m_btn:onClick(finger_action, x, y, drawing_id_first, drawing_id_current);
end

InvitationalKeyboardItem.execDelegate = function(self,func,...)
    if self.m_delegate and self.m_delegate[func] then
        self.m_delegate[func](self.m_delegate,...);
    end
end

return InvitationalKeyboardItem;