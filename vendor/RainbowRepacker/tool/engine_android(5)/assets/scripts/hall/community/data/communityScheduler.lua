------------------------------------------------------
-- Author: GerryGuo
-- Date: 2015-09-10
-- Last modification : 2015-09-17
-- Description: support frame callback

CommunityScheduler = class();

CommunityScheduler.TAG = "CommunityScheduler";

--[Comment]
--获取全局单例
CommunityScheduler.getInstance = function()
    if(CommunityScheduler.s_instance == nil) then
        CommunityScheduler.s_instance = new(CommunityScheduler);
    end
    return CommunityScheduler.s_instance;
end

CommunityScheduler.ctor = function(self)
    self.m_allUpdates = {};
end

CommunityScheduler.dtor = function(self)
    self:__stopFrameCallback();
end

--[Comment]
--加入一个每帧回调
CommunityScheduler.scheduleUpdate = function(self, obj, func)
    --查找是否schedule过了
    local bFind = false;
    for _,v in pairs(self.m_allUpdates) do
        if(v.obj == obj and v.func == func) then
            bFind = true;
            break;
        end
    end
    if(bFind) then
        Log.d(CommunityScheduler.TAG, "already scheduled");
        return;
    end
    table.insert(self.m_allUpdates, {obj=obj, func=func});
    self:__startFrameCallback();
end

--[Comment]
--去掉一个每帧回调
CommunityScheduler.unscheduleUpdate = function(self, obj, func)
    for i=1,#self.m_allUpdates do
        if(self.m_allUpdates[i].obj == obj and self.m_allUpdates[i].func == func) then
            table.remove(self.m_allUpdates, i);
            break;
        end
    end
    if(#self.m_allUpdates <= 0) then
        self:__stopFrameCallback();
    end
end

CommunityScheduler.__startFrameCallback = function(self)
    if(self.m_animFrame == nil) then
        Log.d(CommunityScheduler.TAG, "new anim");
        self.m_animFrame = new(AnimInt, kAnimRepeat, 0, 1, 1, 0);
        self.m_animFrame:setEvent(self, self.__update);
        self.m_lastTime = System.getBootTime() / 1000;
    end
end

CommunityScheduler.__stopFrameCallback = function(self)
    if(self.m_animFrame ~= nil) then
        Log.d(CommunityScheduler.TAG, "delete anim");
        delete(self.m_animFrame);
        self.m_animFrame = nil;
    end
end

CommunityScheduler.__update = function(self)
    local curTime = System.getBootTime() / 1000;
    local deltaTime = curTime - self.m_lastTime;
    self.m_lastTime = curTime;
    for _,v in pairs(self.m_allUpdates) do
        v.func(v.obj, deltaTime);
    end
end
