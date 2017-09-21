-- 约牌分享
local PrivateRoomRecordShareLayer = class(CommonGameLayer, false);

PrivateRoomRecordShareLayer.s_itemMaxSize = 7;

PrivateRoomRecordShareLayer.Delegate = {
};

PrivateRoomRecordShareLayer.s_controls = 
{
	time = ToolKit.getIndex(),
	contentView = ToolKit.getIndex(),
	rounds = ToolKit.getIndex(),
	gameNameView = ToolKit.getIndex(),
	gameName = ToolKit.getIndex(),
};

PrivateRoomRecordShareLayer.s_cmds = 
{
};

PrivateRoomRecordShareLayer.ctor = function(self, data)
	local privateRoomRecordShareLayout = require(ViewPath.."hall/privateRoom/privateRoomRecordShareLayout");
	super(self, privateRoomRecordShareLayout);
	self:setSize(self.m_root:getSize())
	self.m_data = data;
	self:_initView();
end

-----------------------------------------------------------
PrivateRoomRecordShareLayer._initView = function(self)
	if table.isEmpty(self.m_data) then
		return;
	end

	local time = self:findViewById(self.s_controls.time);
	time:setText(os.date("%m月%d日 %H:%M", self.m_data.time));

	local rounds = self:findViewById(self.s_controls.rounds);
	rounds:setText(string.format("共对局：%s局", self.m_data.roundsCurrent));

	self:_initListView();
	self:_initGameView();
end

PrivateRoomRecordShareLayer._initListView = function(self)
	local contentView = self:findViewById(self.s_controls.contentView);
	local data = self:_operateData(self.m_data.data);
	local propType = self.m_data.propType;
	local pos = 0;
	local space = 10;
	local privateRoomRecordShareItem = require("hall/privateRoom/widget/privateRoomRecordShareItem");
	for k, v in ipairs(data) do
		if k <= PrivateRoomRecordShareLayer.s_itemMaxSize then
			local item = new(privateRoomRecordShareItem, v, k, propType);
			item:setAlign(kAlignTop);
			item:setPos(nil, pos);
			contentView:addChild(item);
			local _, h = item:getSize();
			pos = pos + space + h;
		end
	end
end

PrivateRoomRecordShareLayer._initGameView = function(self)
	local gameNameView = self:findViewById(self.s_controls.gameNameView);
	local gameName = self:findViewById(self.s_controls.gameName);

	gameName:setText(self.m_data.gameName, 1);

	local w, _ = gameName:getSize();
	local space = 10;
	gameNameView:setSize(w + space*2);
end


PrivateRoomRecordShareLayer._operateData = function(self, data)
	local tmp = table.verify(data);
	table.sort(tmp, function(a, b)
		if not table.isEmpty(a) and not table.isEmpty(b) then
			local aScore = number.valueOf(a.scoreTotal);
			local bScore = number.valueOf(a.scoreTotal);
			return aScore > bScore;
		else
			return false;
		end
	end);

	return tmp;
end

PrivateRoomRecordShareLayer.s_controlConfig = {
	[PrivateRoomRecordShareLayer.s_controls.time] = {"bg", "time"};
	[PrivateRoomRecordShareLayer.s_controls.contentView] = {"bg", "contentView"};
	[PrivateRoomRecordShareLayer.s_controls.rounds] = {"bg", "roundsView", "rounds"};
	[PrivateRoomRecordShareLayer.s_controls.gameNameView] = {"bg", "gameNameView"};
	[PrivateRoomRecordShareLayer.s_controls.gameName] = {"bg", "gameNameView", "gameName"};
};

PrivateRoomRecordShareLayer.s_controlFuncMap = {
};

PrivateRoomRecordShareLayer.s_cmdConfig = {
	
};

return PrivateRoomRecordShareLayer;