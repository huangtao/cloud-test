
--[[
	配置房间层级的优先级

第一层：
	1、底部头像背景层

第二层：
	1、房间log
	2、任务信息、比赛提示
	3、工具栏
	4、闹钟
	5、扩展按钮
	6、操作按钮
	7、手牌
	8、托管状态
	9、头像、聊天按钮
	10、记牌器、比赛工具栏、银元任务

第三层：
	1、准备换桌
	2、实施对讲
	3、游戏动画
	4、菜单栏

第四层：
	1、结算弹框、比赛详情
	2、邀请好友、招募玩家、个人信息、聊天弹窗、设置、保险箱
	3、举报弹框、加好友弹框
	4、广播跑马灯
	5、宝箱奖励弹框
	6、比赛奖励、比赛配桌等待
	7、比赛退出、比赛报名、比赛晋级
	8、复活弹框


层级分配：第一层：1-49；第二层：50-99；第三层：100-149；第四层：150-199；第五层：200-255分配给其它需要置顶的弹框等UI

层数越高，层级越高（第四层的永远在第三层上面）；在相同层级中，优先级越高的内容，
层级越高（优先级9的永远在优先级1的上面）；相同层相同优先级内，越晚创建的层级越高。

]]


RoomLevelConfig = class(DataInterfaceBase);

RoomLevelConfig.Delegate = {
	onGameLevelUpdate = "onGameLevelUpdate";
};

local initLevelConfig;
local initLayerLevel;
local initLevelIndex;
local resetLayer1Index;
local resetLayer2Index;
local resetLayer3Index;
local resetLayer4Index;
local resetLayer5Index;
local getLayer1Index;
local getLayer2Index;
local getLayer3Index;
local getLayer4Index;
local getLayer5Index;

RoomLevelConfig.getInstance = function()
    if not RoomLevelConfig.s_instance then 
        RoomLevelConfig.s_instance = new(RoomLevelConfig);
    end
    return RoomLevelConfig.s_instance;
end

RoomLevelConfig.releaseInstance = function()
    delete(RoomLevelConfig.s_instance);
    RoomLevelConfig.s_instance = nil;
end

RoomLevelConfig.ctor = function(self)
	self:reset();
end

RoomLevelConfig.dtor = function(self)
	
end

initLevelConfig = function(self)
	self.m_level1Config = {};
	self.m_level2Config = {};
	self.m_level3Config = {};
	self.m_level4Config = {};
	self.m_level5Config = {};
end

initLevelIndex = function(self)
	self.m_layer1Index = 0;
	self.m_layer2Index = 50;
	self.m_layer3Index = 100;
	self.m_layer4Index = 150;
	self.m_layer5Index = 200;
end

resetLayer1Index = function(self)
	self.m_layer1Index = 0;
end

resetLayer2Index = function(self)
	self.m_layer2Index = 50;
end

resetLayer3Index = function(self)
	self.m_layer3Index = 100;
end

resetLayer4Index = function(self)
	self.m_layer4Index = 150;
end

resetLayer5Index = function(self)
	self.m_layer4Index = 200;
end

getLayer1Index = function(self)
	self.m_layer1Index = self.m_layer1Index + 1;
    return self.m_layer1Index;
end

getLayer2Index = function(self)
	self.m_layer2Index = self.m_layer2Index + 1;
    return self.m_layer2Index;
end

getLayer3Index = function(self)
	self.m_layer3Index = self.m_layer3Index + 1;
    return self.m_layer3Index;
end

getLayer4Index = function(self)
	self.m_layer4Index = self.m_layer4Index + 1;
    return self.m_layer4Index;
end

getLayer5Index = function(self)
	self.m_layer5Index = self.m_layer5Index + 1;
    return self.m_layer5Index;
end

initLayerLevel = function(self)
	for i=1,50 do 
		local key = "level" .. i;
		local data = {key = key, value = getLayer1Index(self)};
		table.insert(self.m_level1Config,data);

		data = {key = key, value = getLayer2Index(self)};
		table.insert(self.m_level2Config,data);

		data = {key = key, value = getLayer3Index(self)};
		table.insert(self.m_level3Config,data);

		data = {key = key, value = getLayer4Index(self)};
		table.insert(self.m_level4Config,data);
	end
end

getLevelByLayerName = function(self,layerlName)
	local config = {};
	local levelConfig = {self.m_level1Config,self.m_level2Config,self.m_level3Config,self.m_level4Config,self.m_level5Config};
	local curIndex = -1;
	if layerlName == "layer1" then
		curIndex = 1;
	elseif layerlName == "layer2" then
		curIndex = 2;
	elseif layerlName == "layer3" then
		curIndex = 3;
	elseif layerlName == "layer4" then
		curIndex = 4;
	elseif layerlName == "layer5" then
		curIndex = 5;
	end
	config = levelConfig[curIndex];
	return config, curIndex;
end

------------------------------ public --------------------------------
-- 重置
RoomLevelConfig.reset = function(self)
	initLevelIndex(self);
	initLevelConfig(self);
	initLayerLevel(self);
end

--[[
	在layerlName图层的nodeName前插入一个节点
	layerlName：图层名称layer1-layer5
	nodeName：图层中自定义的节点名称，为nil时，默认添加到末尾
	newKey：需要添加的节点名称
	isUpdate:是否需要通知界面刷新
]]
RoomLevelConfig.insertLevel = function(self,layerlName,nodeName,newKey,isUpdate)
	if (not layerlName) or (not newKey) then
		return false;
	end
	if isUpdate == nil then
		isUpdate = true;
	end
	local list,curIndex = getLevelByLayerName(self,layerlName);
	local resetIndexFunc = {resetLayer1Index,resetLayer2Index,resetLayer3Index,resetLayer4Index,resetLayer5Index};
	local getIndexFunc = {getLayer1Index,getLayer2Index,getLayer3Index,getLayer4Index,getLayer5Index};
	local resetIndex = {};
	local getIndex = {};
	resetIndex = resetIndexFunc[curIndex];
	getIndex = getIndexFunc[curIndex];
	if not list then
		return false;
	end
	if #list > 0 then
		local size = #list;
		local isFind = false;
		local initValue = list[1].value;
		local value = list[1].value;
		local index = -1;
		if nodeName == nil then
			isFind = true;
			initValue = list[size].value + 1;
			index = size + 1;
		else
			for k,v in ipairs(list) do
				if v.key == nodeName then
					isFind = true;
					value = v.value;
					initValue = value;
					index = k;
				end
				if isFind then
					value = value + 1;
					v.value = value;
				end
				if v.key == newKey then
					isFind = false;
					break;
				end
			end
		end
		if isFind then
			getIndex(self);-- 同步增加，保证索引唯一
			local data = {key = newKey,value = initValue}
			table.insert(list,index,data);
			if isUpdate then
				self:notify(RoomLevelConfig.Delegate.onGameLevelUpdate,layerlName);
			end
			return true;
		end
	else
		resetIndex(self);
		local data = {key = newKey,value = getIndex(self)}
		table.insert(list,1,data);
		if isUpdate then
			self:notify(RoomLevelConfig.Delegate.onGameLevelUpdate,layerlName);
		end
		return true;
	end
	return false;
end

-- 根据层级和节点名称，获取对于的层级
-- ep:RoomLevelConfig.getInstance():getLevel("layer1","level1");
RoomLevelConfig.getLevel = function(self,layerlName,name)
	local level = 1;
	local config = getLevelByLayerName(self,layerlName) or {};
	for k,v in ipairs(config) do 
		if v.key == name then
			level = v.value;
			break;
		end
	end
	return level;
end

--[[
	ep:
	在layer1图层的level1前插入一个节点gameLog
	insertLevel("layer1","level1","gameLog");
	在子游戏的scene中onRefreshOtherLayerLevel监听图层层级的变化，刷新当前的图层
]]