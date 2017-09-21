--[[
	@用于检测server的指令是否出现超时
	@作者：刘光利
	@
	@modify by 王金鹏
]]

ServerLifeDetector2 = class();

ServerLifeDetector2.getInstance = function()
	-- body
	if not ServerLifeDetector2.s_instance then 
		ServerLifeDetector2.s_instance = new(ServerLifeDetector2);
	end 
    return ServerLifeDetector2.s_instance;
end

ServerLifeDetector2.releaseInstance = function(self)
	delete(ServerLifeDetector2.s_instance);
	ServerLifeDetector2.s_instance = nil;
end

ServerLifeDetector2.ctor = function(self)
	-- 加入计时器回调
	CommonRoomTimer2.getInstance():addCallBack(self, self.onTimeCounDown);

	self.m_curTime = os.time();
	self.m_curTimeForConn = os.time();

	self.m_deadLimit = 60;
	self.m_reconnectLimit = 25;
end

ServerLifeDetector2.dtor = function(self)
	delete(self.m_detectListener);
	self.m_detectListener = nil;

	CommonRoomTimer2.getInstance():clean(self);
end

ServerLifeDetector2.updateLifeTime = function(self)
	self.m_curTime = os.time();
	self.m_curTimeForConn = os.time();
end

ServerLifeDetector2.setDeadLimit = function(self, time)
	self.m_deadLimit = tonumber(time) or self.m_deadLimit;
end

ServerLifeDetector2.setDeadReconnectTime = function(self, time)
	self.m_reconnectLimit = tonumber(time) or self.m_reconnectLimit;
end

ServerLifeDetector2.onTimeCounDown = function(self)
	-- body
	-- Log.d("wanpg----------------------ServerLifeDetector2.detect--","长时间无反应");
	local diffTime = os.time() - self.m_curTime;
	if diffTime > self.m_deadLimit then 
		if GameInfoIsolater.getInstance():isInNormalRoom() then
			--只有普通房间回调此方法进行退出房间
			if self.m_detectListener then
				self.m_detectListener.onDetectServerDead();
			end
		end
       	self:updateLifeTime();
       	return ;
    end 
    diffTime = os.time() - self.m_curTimeForConn;
    if diffTime > self.m_reconnectLimit then 
		if self.m_detectListener then
			self.m_detectListener.onDetectNeedReconnect();
		end
       self.m_reconnectLimit = os.time();
	end 
end

ServerLifeDetector2.setDetectListener = function(self, listener)
	-- body
	self.m_detectListener = listener;
end


ServerLifeDetectListener2 = class();

ServerLifeDetectListener2.onDetectServerDead = function()
	-- body
end

ServerLifeDetectListener2.onDetectNeedReconnect = function()
	-- body
end