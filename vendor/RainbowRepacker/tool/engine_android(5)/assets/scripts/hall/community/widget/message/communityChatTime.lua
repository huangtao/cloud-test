local communityChatTime = require(ViewPath.."hall/community/message/communityChatTime");

local CommunityChatTime = class(CommonGameLayer, false);

CommunityChatTime.s_controls = {
	leftLine = 1,
    rightLine = 2;
	time = 3,
}

CommunityChatTime.ctor = function(self, time)
	super(self, communityChatTime);
	self:setSize( self.m_root:getSize() );

    self:findViewById(self.s_controls.time):setText(time);
	self:reviseLineSize();
end

CommunityChatTime.getTextSize = function(self, label,size)
    local text = new(Text, label:getText(), nil, nil, nil, nil, size);
    local w,h = text:getSize();
    delete(text);
    return w,h;
end


CommunityChatTime.reviseLineSize = function(self)
    local time = self:findViewById(self.s_controls.time);
	local w,h = self:getTextSize(time, 24);
    local leftLine = self:findViewById(self.s_controls.leftLine);
    local rightLine = self:findViewById(self.s_controls.rightLine);
    local lineW,lineH = leftLine:getSize();
    local dx = w/2 + lineW/2;
	leftLine:setPos(-dx, nil);
    rightLine:setPos(dx, nil);
end

CommunityChatTime.s_controlConfig = {
	[CommunityChatTime.s_controls.leftLine] = {"leftLine"},
    [CommunityChatTime.s_controls.rightLine] = {"rightLine"},
	[CommunityChatTime.s_controls.time] = {"time"},
}

return CommunityChatTime;