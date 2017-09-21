require("common/commonScene");
local rankList = require(ViewPath .. "hall/ranklist/rankList");
local RankScene = require("hall/ranklist/widget/rankScene");
require("hall/ranklist/widget/rankController");

-- 注释
-- 此文件为排行榜state
-- 作者：JasonWang

RankState = class(CommonState);

RankState.ctor = function(self,p_rankType,p_listenBack)
	self.m_listenBack = p_listenBack or function() end;
	self.m_controller = nil;
end

RankState.getController = function(self)
	return self.m_controller;
end

RankState.load = function(self)
	CommonState.load(self);
	self.m_controller = new(RankController, self, RankScene, rankList);
	return true;
end

RankState.unload = function(self)
	CommonState.unload(self);
	delete(self.m_controller);
	self.m_controller = nil;
end

RankState.gobackLastState = function(self)
	if LoadingView.getInstance():isShowing() then
		LoadingView.getInstance():hidden();
	else
		StateMachine.getInstance():popState();
		self:backeNotice();
	end
end

RankState.backeNotice = function(self)
	self.m_listenBack();
	self.m_listenBack = function() end;
end



RankState.dtor = function(self)
	
end