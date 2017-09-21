require("uilibs/richConfig");
require("uilibs/richText");
require("common/commonGameLayer");

local OnlookerChatItem = class(CommonGameLayer,false);

OnlookerChatItem.s_controls = {
	msg = ToolKit.getIndex();	
	icon_props = ToolKit.getIndex();
};

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
OnlookerChatItem.ctor = function(self,data)
	local config = require("view/kScreen_1280_800/games/common2/onlooker/onlooker_chat_item");
	super(self, config);
	self.m_ctrls = OnlookerChatItem.s_controls;
	self:setSize(self.m_root:getSize());
	self.m_root:setAlign(kAlignLeft);

	data = table.verify(data);
	self:_initView(data);
end 

OnlookerChatItem._initView = function(self,data)
	local isProps = data.msgType == 1;
	self.m_root:setVisible(isProps);
    
    local lastConfig = Copy(kRichImageConf);
	local myUid =  UserBaseInfoIsolater.getInstance():getUserId();
	if isProps then 		
		local sNick = data.userId == myUid and "我" or (data.sNick or "玩家");
		local tNick = data.tUserId == myUid and "我" or (data.tNick or "玩家");
		
		local msg = self:findViewById(self.m_ctrls.msg);
		msg:setText(string.format("%s 送给 %s 一个",sNick,tNick),1,1);

		local config = PropIsolater.getInstance():getGoodInfoByTypeId(data.propsType);
		if config then 
			ImageCache.getInstance():request(config.item_icon, self, function(self, url, filename)
				if filename then 
					local icon_props = self:findViewById(self.m_ctrls.icon_props);
					icon_props:setFile(filename);
				end 
			end);
		end

		local w = msg.m_res:getWidth();
		local icon_props = self:findViewById(self.m_ctrls.icon_props);
		icon_props:setPos(w,nil);
	else  
		local str = "";
		if data.msgType == -1 then
			local msg = string.format("%s:%s","系统",data.msg or "");
			str = string.format("#cea4828%s",msg);
			
		else 
			local nick = data.nick or "";
			nick = nick == "" and "匿名" or nick;
			nick = data.userId == myUid and "我" or nick;
			local msg = string.format("%s:%s",string.subUtfStrByCn(nick,1,6,".."),data.msg or "");

			if data.isVip then 	
				local onlooker_chat_user_pin_map = require("qnFiles/qnPlist/games/onlooker_chat_user_pin");
				
				kRichImageConf[999] = {file=onlooker_chat_user_pin_map["icon_vip.png"], w=30,h=24};
				str = string.format("#p999 #cfff10a%s",msg);
			else 
				str = string.format("#ceece90%s",msg);
			end
		end 

		local w,h = self:getSize();
		local richText = new(RichText, str, w, h, kAlignLeft, nil, 24,238,206,144,true);
		richText:setAlign(kAlignLeft);
		self:addChild(richText);
		kRichImageConf = Copy(lastConfig);

		local _,h = richText:getSize();
		self:setSize(nil,h+18);
	end 
end

OnlookerChatItem.dtor = function(self)
end

OnlookerChatItem.s_controlConfig = 
{	
	[OnlookerChatItem.s_controls.msg]			= {"msg"};
	[OnlookerChatItem.s_controls.icon_props]	= {"icon_props"};
};

return OnlookerChatItem;