require("common/commonGameLayer");
require("isolater/interface/propIsolater");

local OnlookerBarrageItem = class(CommonGameLayer,false)

OnlookerBarrageItem.s_controls = {
	propsBg = ToolKit.getIndex();	
	propsIcon = ToolKit.getIndex();
	mineBg = ToolKit.getIndex();
	info = ToolKit.getIndex();
};

OnlookerBarrageItem.ctor = function(self,data)
	local config = require("view/kScreen_1280_800/games/common2/onlooker/onlooker_barrage_item");
	super(self, config);
	self.m_ctrls = OnlookerBarrageItem.s_controls;
	data = table.verify(data);
	self:setSize(self.m_root:getSize());

	self:_initView(data);
end

-- data = {
-- 	msgType = 0; --0:普通，1:道具,-1:系统
-- 	msg = "这是弹幕";--"xx送给xx一个xx";
-- 	propsType = -1;
-- 	userId = 123;
--	nick = "1233";
-- 	isVip = false;
--	tUserId = 123;
--  tNick = "12222";
--  sNick = "1233";
-- };

OnlookerBarrageItem._initView = function(self,data)	
	local config = table.verify(GameProcessManager2.getInstance():getGameConfig());
	local onlookerBarrageConfig = table.verify(config.onlookerBarrageConfig);
	local colorsConfig = table.verify(onlookerBarrageConfig.colorsConfig);
	local defaultColors = {
		normal = {255,255,255};
		props = {141,214,255};
		vip = {255,241,10};
	};

	local isProps = data.msgType == 1;
	local color = colorsConfig.normal or defaultColors.normal;
	local diff = 0;
	local msg = data.msg or "";
	if isProps then 
		msg = string.format("%s 送给 %s 一个",data.sNick or "玩家",data.tNick or "玩家");
		local propsBg = self:findViewById(self.m_ctrls.propsBg);
		propsBg:setVisible(true);

		local config = PropIsolater.getInstance():getGoodInfoByTypeId(data.propsType);
		if config then 
			ImageCache.getInstance():request(config.item_icon, self, function(self, url, filename)
				if filename then 
					local propsIcon = self:findViewById(self.m_ctrls.propsIcon);
					propsIcon:setFile(filename);
				end 
			end);
		end
		local propsIcon = self:findViewById(self.m_ctrls.propsIcon);
		local w = propsIcon:getSize();
		local x = propsIcon:getPos();
		diff = 5 + w + x;

		color = colorsConfig.props or defaultColors.props;
	else 
		local isMyself = data.userId == UserBaseInfoIsolater.getInstance():getUserId();
		local mineBg = self:findViewById(self.m_ctrls.mineBg);
		mineBg:setVisible(isMyself);

		if data.isVip then 
			color = colorsConfig.vip or defaultColors.vip;
		end 
		diff = 15;

		local nick = data.nick or "";
		nick = nick ~= "" and string.format("%s: ",string.subUtfStrByCn(nick,1,6,"..")) or "";
		msg = string.format("%s%s",nick,data.msg or "");
	end 
	
	local info = self:findViewById(self.m_ctrls.info);
	info:setText(msg,1,nil,unpack(color));
	local x = info:getPos();
	local w = info.m_res:getWidth();
	self.m_root:setSize(diff + x + w,nil);
	self:setSize(diff + x + w,nil);
end

OnlookerBarrageItem.s_controlConfig = 
{	
	[OnlookerBarrageItem.s_controls.propsBg]		= {"bg_props"};
	[OnlookerBarrageItem.s_controls.propsIcon]		= {"bg_props","props"};
	[OnlookerBarrageItem.s_controls.mineBg]			= {"bg_mine"};
	[OnlookerBarrageItem.s_controls.info]			= {"info"};
};

return OnlookerBarrageItem;