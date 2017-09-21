require("core/object");

DiamondShopTimeHandle = class();

DiamondShopTimeHandle.getInstance = function()
	if not DiamondShopTimeHandle.s_instance then
		DiamondShopTimeHandle.s_instance = new(DiamondShopTimeHandle);
	end
	return DiamondShopTimeHandle.s_instance;
end

DiamondShopTimeHandle.releaseInstance = function()
	delete(DiamondShopTimeHandle.s_instance);
	DiamondShopTimeHandle.s_instance = nil;
	kDiamondShopTimeHandle = DiamondShopTimeHandle.getInstance();
end



DiamondShopTimeHandle.ctor = function(self)
end

DiamondShopTimeHandle.setEndTime = function(self,endTime)
	self.m_endTime = endTime; 
end

DiamondShopTimeHandle.getEndTime = function(self)
	return self.m_endTime;
end

DiamondShopTimeHandle.getLeftTime = function(self)
	Log.v("---DiamondShopTimeHandle.getLeftTime----",self.m_endTime,os.time());
	if self.m_endTime and tonumber(self.m_endTime) - os.time()>0 then
		local leftTime = tonumber(self.m_endTime) - os.time();
		local day = math.floor(leftTime/(24*60*60)); --天数
		local hour = math.floor((leftTime - day*24*60*60)/3600); --小时
		local minute = math.floor((leftTime - day*24*60*60 - hour*60*60)/60); --分钟
		if day > 0 then
		 	return string.concat(day,"天",hour,"小时",minute,"分钟");
		else
			if hour > 0 then
				return string.concat(hour,"小时",minute,"分钟");
			else
				if minute>0 then
					return string.concat(minute,"分钟");
				else
					return nil;
				end
			end
		end
	else
		return nil;
	end
end

DiamondShopTimeHandle.changeTime = function(self,linuxTime)
	return os.date("%Y.%m.%d",tonumber(linuxTime));
end
-------------------------------
kDiamondShopTimeHandle = DiamondShopTimeHandle.getInstance(); 
