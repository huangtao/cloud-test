require("core/object");

AnimManager = class();

AnimDef = 
{
	FILE = 1;
	CLASS = 2;
	GROUPID = 3;
};

AnimManager.getInstance = function()
	if not AnimManager.s_instance then
		AnimManager.s_instance = new(AnimManager);
	end

	return AnimManager.s_instance;
end

AnimManager.releaseInstance = function()
	delete(AnimManager.s_instance);
	AnimManager.s_instance = nil;
end

AnimManager.ctor = function(self)
	self.m_anims = {};
	self.m_groups = {};

	self.m_defaultGroupId = "default";
end

AnimManager.dtor = function(self)
	self.m_anims = nil;
	self.m_groups = nil;
end

AnimManager.setAnimDefs = function(self, animDefs)
	self.m_animDefs = animDefs or {};
end

AnimManager.loadAnim = function(self, animId,...)
	if self:cacheAnim(animId) then
		self.m_anims[animId].load(...);
		return true;
	end

	return false;
end

AnimManager.playAnim = function(self, animId,...)
	if self:cacheAnim(animId) then
		local node = self.m_anims[animId].play(...);
		return node;
	end

	return false;
end

AnimManager.stopAnim = function(self, animId,...)
	if self.m_anims[animId] then
		self.m_anims[animId].stop(...);
	end
end

AnimManager.releaseAnim = function(self, animId,...)
	if (not animId) or  (not self.m_animDefs[animId]) then
		return false;
	end

	if self.m_anims[animId] then
		self.m_anims[animId].release(...);
	end
end

AnimManager.loadGroup = function(self, groupId)
	groupId = groupId or self.m_defaultGroupId;

	for k,v in pairs(table.verify(self.m_animDefs)) do 
		if v[AnimDef.GROUPID] == groupId then
			self:loadAnim(k);
		end
	end
end

AnimManager.releaseGroup = function(self, groupId)
	groupId = groupId or self.m_defaultGroupId;

	for _,v in pairs(self.m_groups[groupId] or {}) do 
		local anim = self.m_anims[v];
		if anim then
			anim.release();
		end
	end
end

AnimManager.loadAll = function(self)
	for k,v in pairs(table.verify(self.m_animDefs)) do 
		self:loadAnim(k);
	end
end

AnimManager.releaseAll = function(self)
	for k,v in pairs(self.m_anims or {}) do 
		self:releaseAnim(k);
	end

	self.m_anims = {};
	self.m_groups = {};
end

AnimManager.cacheAnim = function(self, animId)
	if (not animId) or  (not self.m_animDefs[animId]) then
		return false;
	end
	
	if self.m_anims[animId] then
	    return true;
	end

	local animDef = self.m_animDefs[animId];
	local file = animDef[AnimDef.FILE];
	local className = animDef[AnimDef.CLASS];
	local groupId = animDef[AnimDef.GROUPID] or self.m_defaultGroupId;

	if not (file and className) then
		return false;
	end

	require(file);
	self.m_anims[animId] =  _G[className];

	self.m_groups[groupId] = self.m_groups[groupId] or {};
	self.m_groups[groupId][#(self.m_groups[groupId]) + 1] = animId;

	return true;
end
