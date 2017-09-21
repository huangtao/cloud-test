

RoomPropertyData = class();

RoomPropertyData.getInstance = function()
	if not RoomPropertyData.s_instance then
		RoomPropertyData.s_instance = new(RoomPropertyData);
	end
	return RoomPropertyData.s_instance;
end

RoomPropertyData.releaseInstance = function()
	delete(RoomPropertyData.s_instance);
	RoomPropertyData.s_instance = nil;
end

RoomPropertyData.ctor = function(self)
	self:_initData();
end

--获取资产名称
RoomPropertyData.getPropertyName = function(self,propertyId)
	local config = self:getPropertyConfigById(propertyId);
	return config.name or "银币";
end

--获取资产icon
--propertyId:资产id
--isBig:是否是大图标
RoomPropertyData.getPropertyIcon = function(self,propertyId,isBig)
	local config = self:getPropertyConfigById(propertyId);
	local icon = isBig and config.icon_big or config.icon;
	return icon or "";
end

--获取资产数量
RoomPropertyData.getPropertyNum = function(self,propertyId)
	return number.valueOf(UserPropertyIsolater.getInstance():getMoneyById(propertyId));
end

--获取当前资产类型
RoomPropertyData.getCurPropertyId = function(self)
	return GameRoomData.getInstance():getCurRoomPropertyId();
end

--获取当前资产的数量
RoomPropertyData.getCurPropertyNum = function(self)
	local propertyId = self:getCurPropertyId();
	return self:getPropertyNum(propertyId);
end

--获取当前资产名称
RoomPropertyData.getCurPropertyName = function(self)
	local propertyId = self:getCurPropertyId();
	return self:getPropertyName(propertyId);
end

--获取当前资产icon
--isBig:是否是大图标
RoomPropertyData.getCurPropertyIcon = function(self,isBig)
	local propertyId = self:getCurPropertyId();
	return self:getPropertyIcon(propertyId,isBig);
end

--自己是否破产了
RoomPropertyData.isMineBankrupt = function(self)
	local property = self:getCurPropertyNum();
	return self:checkIsBankrupt(property);
end

--是否破产了
RoomPropertyData.checkIsBankrupt = function(self,money)
	local curPropertyId = self:getCurPropertyId();
	if curPropertyId == UserPropertyIsolater.getInstance():getPropertySilverCoinID() then 
		return BankruptIsolater.getInstance():checkIsBankrupt(money);
	else 
		return false;
	end 
end

--是否显示破产图标
RoomPropertyData.checkIsShowBankruptIcon = function(self)
	local propertyId = self:getCurPropertyId();
	return propertyId == UserPropertyIsolater.getInstance():getPropertySilverCoinID();
end

RoomPropertyData.getPropertyConfig = function(self)
	return self.m_propertyConfig;
end

RoomPropertyData.getPropertyConfigById = function(self,propertyId)	
	local data = self:getPropertyConfig();

	if propertyId == UserPropertyIsolater.getInstance():getPropertyDiamondID() then 
		return data.diamond;

	elseif propertyId == UserPropertyIsolater.getInstance():getPropertyGoldBarID() then 
		return data.crystal;

	elseif propertyId == UserPropertyIsolater.getInstance():getJifenID() then 
		return data.jifen;

	else 
		return data.gold;
	end 
end

RoomPropertyData._initData = function(self)
	local data = {};
	data.gold = {
		name = "银币";
		icon = "isolater/gold.png";
		icon_big = "isolater/gold.png";
	};

	data.diamond = {
		name = "钻石";
		icon = "isolater/small_diamond.png";
		icon_big = "isolater/small_diamond.png";
	};

	data.crystal = {
		name = "金条";
		icon = "isolater/crystal_room_uerinfo.png";
		icon_big = "isolater/crystal.png";
	};

	data.jifen = {
		name = "积分";
		icon = "isolater/jifen.png";
		icon_big = "isolater/jifen.png";
	};
	self.m_propertyConfig = data;
end