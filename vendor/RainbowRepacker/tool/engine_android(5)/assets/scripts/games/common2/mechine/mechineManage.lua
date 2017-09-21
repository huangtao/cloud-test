

require("games/common2/mechine/gameMechine");

--[[
	游戏状态机控制类，负责通知游戏状态发生变化，如果合法广播通知用户
]]
MechineManage = class();


function MechineManage.getInstance()
	if not MechineManage.s_instance then
		MechineManage.s_instance = new(MechineManage);
	end	
	return MechineManage.s_instance;
end

function MechineManage.releaseInstance()
	if MechineManage.s_instance then
		local tag = "MechineManage.releaseInstance" .. tostring(self);
		MechineManage.getInstance():_reportLog(nil,tag);
		delete(MechineManage.s_instance);
		MechineManage.s_instance = nil;
	end
end

function MechineManage:ctor()
	self:init();
end

function MechineManage:dtor()
	local tag = "MechineManage.dtor：" .. tostring(self);
	self:_reportLog(nil,tag);
	self:reset(nil,"dtor");

	delete(self.m_noneGameMechine);
	self.m_noneGameMechine = nil;

	self:removeOnlookerMechine();
end

function MechineManage:_reportLog(uid,tag)
	local data = {};
	data.time = os.date();
	data.uid = uid or self:getMyMid();
	data.tag = tag;
	MechineLog.getInstance():d(MechineLog.TAG1,data.uid,data);
end

function MechineManage:init()
    self.m_mechines = {};

    local NoneGameMechine = require("games/common2/mechine/noneGameMechine");
	self.m_noneGameMechine = new(NoneGameMechine);

	self:reset(nil,"init");
end

function MechineManage:addOnlookerMechine()
	local OnlookerMechine = require("games/common2/mechine/onlookerMechine");
	self.m_onlookerMechine = new(OnlookerMechine);
end

function MechineManage:removeOnlookerMechine()
	delete(self.m_onlookerMechine);
	self.m_onlookerMechine = nil;
end

function MechineManage:addMechine(uid,mechine)
	self.m_mechines[uid] = mechine;
end

function MechineManage:removeMechine(uid,tag)
	if uid then
		local tag = "MechineManage.removeMechine:" .. (tag or "");
		self:_reportLog(uid,tag);

		delete(self.m_mechines[uid]);
		self.m_mechines[uid] = nil;
		GamePlayerManager2.getInstance():removePlayerByMid(uid);
	end
end

-- 获取自己的mid
function MechineManage:getMyMid()
	return UserBaseInfoIsolater.getInstance():getUserId();
end

-- socket消息解析完后，调用这个方法，校验合法后再通知对应的数据源更新数据和界面
-- 通知状态机更新状态
-- action：游戏动作，自定义
-- uid: nil：自己的信息；-1：所有人的信息；mid：指定人的信息
function MechineManage:receiveAction(action,info,uid,isFast,tag)
	Log.i("------MechineManage.receiveAction action", action);
	if not action then
		self:sthrowErro("有未定义的事件ID，请检查代码");
		return;
	end
	if self:checkAction(action,uid,tag) then
		return;
	end

	uid = uid or self:getMyMid();

	if self.m_onlookerMechine and 
		self.m_onlookerMechine:checkAction(action) then 
		self.m_onlookerMechine:checkStateValid(uid,action,info,isFast,tag); 
		return;  
	end 

	if self.m_noneGameMechine:checkAction(action) then 
		local uids = {};
		if tonumber(uid) then 
			if uid == -1 then 
				for k,v in pairs(self.m_mechines) do
					table.insert(uids,k);
				end
			elseif uid == 0 then 
				self:sthrowErro("用户ID错误，uid=0");
			else 
				table.insert(uids,uid);
			end 

		elseif type(uid) == "table" then 
			uids = uid;
		end 

		for _,v in pairs(uids) do
			self.m_noneGameMechine:checkStateValid(v,action, info, isFast, tag);
		end				
 
		return;
	end 

	if tonumber(uid) then
		-- 通知状态机
		if uid == -1 then
			-- 通知所有的玩家
			for k,v in pairs(self.m_mechines) do
				if v then -- k:uid;v:mechine
					v:checkStateValid(k,action,info,isFast,tag);
				end
			end
		elseif uid == 0 then
			self:sthrowErro("用户ID错误，uid=0");
		else
			self:checkStateValid(uid,action,info,isFast,tag);
		end

	elseif type(uid) == "table" then
		-- 通知状态机
		for k,v in pairs(uid) do
			self:checkStateValid(v,action,info,isFast,tag);
		end
	end
end

function MechineManage:checkStateValid(uid,action,info,isFast,tag)
	uid = tonumber(uid);
	if uid then
		if not self.m_mechines[uid] then
			self:creatMechine(uid);
		end
		self.m_mechines[uid]:checkStateValid(uid,action,info,isFast,tag);
	end
end

function MechineManage:creatMechine(uid)
	if not self.m_mechines[uid] then
		local mechine = new(GameMechine,uid);
		mechine:setDelegate(self);
		self:addMechine(uid,mechine);
	end
end

-- 获取当前状态curstate,laststate
function MechineManage:getStates(uid)
	if self.m_mechines[uid] then
		return self.m_mechines[uid]:getStates();
	end
end

-- 获取当前主状态
function MechineManage:getMainState(uid)
	if self.m_mechines[uid] then
		return self.m_mechines[uid]:getMainState();
	end
end

function MechineManage:reset(uid,tag)
	for k,v in pairs(self.m_mechines) do
		delete(v);
		v = nil;
	end
	self.m_mechines = {};
	local tag = "MechineManage.reset：".. tostring(self) .. "：tag=" .. (tag or "");
	self:_reportLog(self:getMyMid(),tag);

	GamePlayerManager2.getInstance():reset();
end

function MechineManage:checkAction(action,uid,tag)
	if MechineManage.actionConfig[action] then
		MechineManage.actionConfig[action](self,uid,tag);
		return true;
	end
	return false;
end

-- debug环境，直接报错
function MechineManage:sthrowErro(msg)
	if _DEBUG then
		debug.traceback();
		error(msg)
		return true;
	end
end

-- 动作配置
MechineManage.actionConfig = {
	[GameMechineConfig.ACTION_RESET] 			= MechineManage.reset;
	[GameMechineConfig.ACTION_REMOVE_MECHINE] 	= MechineManage.removeMechine;
	[GameMechineConfig.ACTION_ENTER_ONLOOKER] 	= MechineManage.addOnlookerMechine;
};