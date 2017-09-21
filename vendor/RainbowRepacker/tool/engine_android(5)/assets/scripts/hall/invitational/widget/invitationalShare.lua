local invitational_share = require(ViewPath.."hall/invitational/invitational_share")

-- 邀请赛分享
local InvitationalShare = class(CommonGameLayer, false)


InvitationalShare.Delegate = {
}


InvitationalShare.s_cmds = 
{
}

InvitationalShare.ctor = function(self, data)
	super(self, invitational_share);
	self:declareLayoutVar(ViewPath.."hall/invitational/invitational_share".."_layout_var");
	self:setSize(self.m_root:getSize())
	self.m_data = data;
	self:_initView();
end

-----------------------------------------------------------
InvitationalShare._initView = function(self)
	self.m_head = self:findViewById(self.s_controls.head)
	self.m_name = self:findViewById(self.s_controls.name)
	self.m_title = self:findViewById(self.s_controls.title)
	self.m_qr = self:findViewById(self.s_controls.qr)
	self.m_roomId = self:findViewById(self.s_controls.roomId)
end

InvitationalShare.setHead = function(self, file)
	self.m_head:setFile(file)
end

InvitationalShare.setName = function(self, name)
	self.m_name:setText(name)
end

InvitationalShare.setTitle = function(self, title)
	self.m_title:setText(title)
end

InvitationalShare.setQR = function(self, file)
	self.m_qr:setFile(file)
end

InvitationalShare.setRoomId = function(self, roomId)
	self.m_roomId:setText(roomId)
end

return InvitationalShare