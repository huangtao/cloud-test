
CustomizedManage = class();

--[[
	各游戏自定义事件管理
]]

CustomizedManage.getInstance = function()
	if not CustomizedManage.s_instance then
		CustomizedManage.s_instance = new(CustomizedManage); 
	end
	return CustomizedManage.s_instance;
end

CustomizedManage.ctor = function(self)
	self.m_customizedCmdFunMap = {}; -- 自定义方法堆栈
	self.m_customizedObj = {}; -- 自定义方法对应的对象
end

-- 注册自定义事件
-- map{
-- 	cmd, key
-- 	obj, 对象
-- 	func, 方法
-- }
CustomizedManage.registerCustomizedCmdMap = function(self,tag,map)
	if table.verify(map) then
		self.m_customizedCmdFunMap[tag] = map;
	end
end

-- 删除自定义事件
CustomizedManage.unregisterCustomizedCmdMap = function(self,tag)
	if table.verify(map) then
		self.m_customizedCmdFunMap[tag] = nil;

		delete(self.m_customizedObj[tag]);
		self.m_customizedObj[tag] = nil;
	end
end

-- 获取监听cmd的所有对象标志
CustomizedManage.getTagsByCmd = function(self,cmd)
	local tags = {};
	for k,list in pairs(self.m_customizedCmdFunMap) do
		for key,v in pairs(table.verify(list)) do
			if key == cmd then
				tags[#tags + 1] = k;
			end
		end
	end
	return tags;
end

-- 处理cmd对应的自定义事件
CustomizedManage.handleCustomizedCmdFun = function(self,cmd,...)
	local flag = false;
	local data = {};
	if cmd then
		local tags = table.verify(self:getTagsByCmd(cmd));
		for _,tag in pairs(tags) do
			local maps = table.verify(self.m_customizedCmdFunMap[tag]);
			if maps[cmd] then
				if not self.m_customizedObj[tag] then
					-- 创建对象
					require(maps[cmd][1]);
					self.m_customizedObj[tag] = new(_G[maps[cmd][2]]);
				end
				if self.m_customizedObj[tag] and self.m_customizedObj[tag][maps[cmd][3]] then
					-- 处理逻辑
					data = self.m_customizedObj[tag][maps[cmd][3]](_G[maps[cmd][2]],cmd,...) or data;
					flag = true;
				end
			end
		end
	end
	return flag,data;
end

--------------------- 注册消息 ---------------------
--[[
	{
		[cmd] = {"isolater/interface/friendIsolater",FriendIsolater,"onRequestAddFriendCallBack"},
	}
	CustomizedManage.getInstance():registerCustomizedCmdMap(tag,map);
]]

---------------------- 注销消息 -----------------
--[[
	CustomizedManage.getInstance():unregisterCustomizedCmdMap(tag)
]]

------------------- 调用 --------------------------
-- require("games/zgmj/CustomizedManage");
-- local flag,info = CustomizedManage.getInstance():handleCustomizedCmdFun(cmd,socket,packetId);
-- if flag then
-- 	return info;
-- end

------------------ server和php消息的处理方式：----------------------------
-- 1、server发送和解析消息的处理
--[[
	CommonSocketReader.readPacket
	CommonSocketWriter.writePacket
]]
-- 2、在数据源中处理消息
--[[
	GameData继承于DictData，DictData继承于SocketHandlerBase，在SocketHandlerBase中注册需要接收的socket消息到SocketHandlersStack中，
	在OnlineSocketManager.onReceivePacket中接收的消息调用SocketHandlersStack处理对应的注册事件
]]
-- 3、直接在layer中处理
--[[
	layer中继承SocketHandlerBase，设置需要监听的消息
]]
