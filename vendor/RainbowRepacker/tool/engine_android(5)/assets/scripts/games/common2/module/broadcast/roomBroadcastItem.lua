

local radioPushMessageItem2 = require(ViewPath.."games/common2/radioPushMessageItem2");

local RoomBroadcastItem = class(CommonGameLayer, false);

RoomBroadcastItem.ctor = function(self, data)
	super(self, radioPushMessageItem2);
	if not table.isEmpty(data)  then
		local radioText = "";
		if string.isEmpty(data.nick) then
			radioText = data.content or "";
		else
			radioText = string.concat(data.nick,":",data.content);
		end
		radioText = string.format("%s%s","#cFFFFFF",radioText);

		local isShowLaba = true;
		local radioType = data.type or "";
		if radioType == RadioIsolater.getInstance():getMatchInviteRadioType() 
			or radioType == RadioIsolater.getInstance():getPrivateInviteRadioType() then 
			isShowLaba = false;
		end 
		self:findViewById(self.s_controls.laba):setVisible(isShowLaba);

		self.m_contentView = self:findViewById(self.s_controls.contentView);
		local viewWidth, viewHeight = self.m_contentView:getSize();

		self.m_content = new(RichText, radioText,viewWidth, viewHeight, kAlignLeft, nil, 35);	
		local textWidth, textHeight = self.m_content:getSize();

		self.m_content:setPos(0, 0);
		self.m_contentView:addChild(self.m_content);
		self.m_content:setClip(0, 0, viewWidth, viewHeight);

        self:_cleanAnim();
		if textWidth > viewWidth then
            self.m_additionalDuration = (textWidth - viewWidth) / 2 * 60;
			self.m_anim = new(AnimInt,kAnimRepeat, viewWidth, textWidth, 2 * (2000+self.m_additionalDuration) / (textWidth - viewWidth), 1500);
			local data = {};
			data.obj = self;
			self.m_anim:setEvent(data, RoomBroadcastItem.updateText);
			self.m_anim:setDebugName("AnimInt|RoomBroadcastItem.content|kAnimRepeat");
			self.num = 0;
		end
	end
end

RoomBroadcastItem.getAdditionalDuration = function(self)
    return self.m_additionalDuration or 0;
end

RoomBroadcastItem.updateText = function(data)
	local self = data.obj;
    local viewWidth, viewHeight = self.m_contentView:getSize();
    local textWidth, textHeight = self.m_content:getSize();
    if self.num > textWidth - viewWidth then
		self:_cleanAnim();
    else
    	self.num = self.num + 2;
    	self.m_content:setPos(-self.num);
    	self.m_content:setClip(0, 0, viewWidth, viewHeight);
    end
end

RoomBroadcastItem._cleanAnim = function(self)
    if self.m_anim then
	    delete(self.m_anim);
	    self.m_anim = nil;
    end
end

RoomBroadcastItem.dtor = function(self)
	ImageCache.getInstance():cleanRef(self);
	self.m_envelops = nil;
    self:_cleanAnim();
end

RoomBroadcastItem.s_controls =
{
	contentView = 1,
	laba = 2;
};
RoomBroadcastItem.s_controlConfig =
{
	[RoomBroadcastItem.s_controls.contentView] = {"bg","contentView"},
	[RoomBroadcastItem.s_controls.laba] = {"bg","laba"};

};

return RoomBroadcastItem;