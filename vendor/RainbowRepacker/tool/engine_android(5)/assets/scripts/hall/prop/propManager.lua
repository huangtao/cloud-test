require("gameData/dataInterfaceBase");
require("hall/backpack/data/backpackDataInterface");

PropManager = class(DataInterfaceBase);

local h_index = 0;
local getIndex = function(self)
    h_index = h_index + 1;
    return h_index;
end

PropManager.s_defaultMaxCount = 3;

PropManager.Delegate = {
    onGetPropInfoCallBack	= "onGetPropInfoCallBack";
    onBuyPropCallBack		= "onBuyPropCallBack";
}

PropManager.propTypeMap = {
    TYPE_VIP           = 1; --vip
    TYPE_VIP_HEAD      = 2; --专属头像
    TYPE_VIP_KICK      = 3; --踢人
    TYPE_VIP_MAGU      = 4; --马股提示
    TYPE_VIP_GAME      = 5; --专属比赛
    TYPE_VIP_FACE      = 6; --专属表情
    TYPE_VIP_DEG       = 7; --VIP破产
    TYPE_VIP_LOG       = 8; --签到奖励
    TYPE_MATCHCARD_LOW     = 9; --初级参赛券
    TYPE_BUQIANCARD    = 10; --补签卡
	-- 200~249为社交道具
	TYPE_ROSE			= 200,	-- 鲜花
	TYPE_EGG			= 201,	-- 鸡蛋
	TYPE_SHOES			= 202,	-- 拖鞋
	TYPE_BOMB			= 203,	-- 炸弹
    TYPE_SILVER         = 150,  -- 银元
};

PropManager.getInstance = function()
    if not PropManager.s_instance then
        PropManager.s_instance = new(PropManager);
        PropManager.s_instance.m_props = {};
    end
    return PropManager.s_instance;
end

PropManager.releaseInstance = function()
    if PropManager.s_instance then
        delete(PropManager.s_instance);
        PropManager.s_instance = nil;
    end
end 

PropManager.clear = function(self)
    self.m_props = {};
end

------------------------------个人道具信息---------------
-- self.m_props 里面目前只会维护vip相关的信息， 其余道具信息会同步到物品箱中

--请求自己的道具信息
PropManager.requestPropInfo = function(self)
    Log.v("PropManager.requestPropInfo");
    OnlineSocketManager.getInstance():sendMsg(PHP_PROPS_INFO, {});
end

--获取自己的道具信息回调
PropManager.onGetPropInfoCallBack = function(self, isSuccess, info, sendParam)
    if isSuccess then
        self.m_props = {};
        local vipInfo = nil;
        for k, v in pairs( table.verify(info) ) do
            local item = self:__formatPropData(v);
            if item.type == PropManager.propTypeMap.TYPE_VIP then
                vipInfo = item;
            end

            self.m_props[item.type] = item;
        end

        kUserInfoData:setVipInfo(vipInfo);

        self:notify(PropManager.Delegate.onGetPropInfoCallBack, true, Copy(self.m_props) );
    else
        self:notify(PropManager.Delegate.onGetPropInfoCallBack, false);
    end
end


PropManager.isVipAndExtend = function(self, propType)
    if not tonumber(propType) then
        return ;
    end

    propType = tonumber(propType);

    if propType == PropManager.propTypeMap.TYPE_VIP then
        return true;
    else
        return false;
    end
end

PropManager._getPropInfoByType = function (self, type)
    local info = nil;
    if self.m_props[type] and not self:isExpire(type) then 
        info = {
            type = type, 
            expires = self.m_props[type].expires or 0,
            allowTimes = self.m_props[type].allowTimes or 0
        };
    else 
        info = {
            type = type, 
            expires = 0,
            allowTimes = 0
        };
    end

    return info;
end

PropManager.getPropInfoByType = function (self, type)
    local _isVip = self:isVipAndExtend(propType);

    local info = nil;
    if _isVip then
       info = self:_getPropInfoByType(type);
    else
        local objectInfo = BackpackDataInterface.getInstance():getPropInfoByType(type);
        objectInfo = table.verify(objectInfo);
        info = {
            type = type, 
            expires = 0,
            allowTimes = tonumber(objectInfo.itemNum) or 0,
        };
    end

    return info;
end

-- 获取社交道具集合
PropManager.getSocialProps = function (self)

local objectInfo = BackpackDataInterface.getInstance():getPropInfoByType(type);
        
    local _backpackData = BackpackDataInterface.getInstance():getSocialProps();

    local function _adapterOldDataStruct()
        for i=1,#_backpackData do
            _backpackData[i].type = _backpackData[i].boxItemID;
            _backpackData[i].expires = 0;
            _backpackData[i].allowTimes = _backpackData[i].itemNum;
        end
    end

    _adapterOldDataStruct();   --适配老的数据结构，，建议后面用的时候不要走这个接口，，直接用新背包的接口。

    return _backpackData
end

--获取道具个数
PropManager._getPropNumByPropType = function(self,propType)
    propType = number.valueOf(propType);
    if not propType or not self.m_props[propType] then
        return 0;
    end
    if self:isExpire(propType) then  --过期
        return 0;
    end
    Log.v("-------PropManager.getPropNumByPropType-------",self.m_props[propType].allowTimes);
    return number.valueOf(self.m_props[propType].allowTimes,0);
end

PropManager.getPropNumByPropType = function(self,propType)
    local _isVip = self:isVipAndExtend(propType);

    if _isVip then
        return self:_getPropNumByPropType(propType);
    else
        return BackpackDataInterface.getInstance():getPropNumByPropType(propType);
    end
end

--更新道具个数,过期时间
PropManager.updatePropNum = function(self,propType,num,expires)
    local _isVip = self:isVipAndExtend(propType);

    if _isVip then
        self:_updateMyPropNum(propType,num,expires);
    else
        BackpackDataInterface.getInstance():oldUpdatePropNum(propType,num);
    end
end

PropManager._updateMyPropNum = function(self,propType,num,expires)
    if not propType or not num then
        return;
    end

    if not self.m_props[propType] then
        self.m_props[propType] = {
            type = propType,
            allowTimes = 1,
            expires = -1,
            updateTime = os.time(),
        };
    end
    num = number.valueOf(num);
    num = num < 0 and 0 or num;
    self.m_props[propType].allowTimes = num;
    if expires then
        self.m_props[propType].expires = number.valueOf(expires);
    end
end

PropManager.__formatPropData = function(self, data)
    local item = {};
    item.type = tonumber(data.propsType) or -1;
    item.expires = tonumber(data.expires) or 0;
    item.allowTimes = tonumber(data.allow_times) or 0;
    item.updateTime = os.time();
    return item;
end

--是否过期
PropManager.isExpire = function(self,propType)
    if not propType or not self.m_props[propType] then
        return true;
    end
    local prop = self.m_props[propType];
    if (prop.expires or 0) <= 0 then
        return false;
    end
    return os.time() - prop.updateTime >= prop.expires and true or false;
end

-----------------------购买道具-------------------

PropManager.requestBuyProp = function(self, goodId, num)
    local param = {gid = goodId, gnum = num};
    OnlineSocketManager.getInstance():sendMsg(PHP_BUY_MALL_PROP, param, 10000);
end

PropManager.onBuyPropCallBack = function(self, isSuccess, info, sendParam)
    if not isSuccess then
        self:notify(PropManager.Delegate.onBuyPropCallBack, false, info);
    else
        if tonumber(info.flag) == 1 then -- 购买成功
            if info.money then
                kUserInfoData:setMoney( number.valueOf(info.money) );
            end

            if info.diamond then
                kUserInfoData:setDiamond( number.valueOf(info.diamond) );
            end

            self:notify(PropManager.Delegate.onBuyPropCallBack, true, info.name or "", sendParam.gnum);

        elseif tonumber(info.flag) == -2 then -- 道具已满，私信发放
            if info.money then
                kUserInfoData:setMoney( number.valueOf(info.money) );
            end

            if info.diamond then
                kUserInfoData:setDiamond( number.valueOf(info.diamond) );
            end

            self:notify(PropManager.Delegate.onBuyPropCallBack, false, info);
        else
            self:notify(PropManager.Delegate.onBuyPropCallBack, false, info);
        end
    end
end

------------------------------道具配置--------------------------- 
PropManager.clear = function(self)
    self.m_props = {};
end

PropManager.s_socketCmdFuncMap = {
    [PHP_PROPS_INFO]		= PropManager.onGetPropInfoCallBack;
    [PHP_BUY_MALL_PROP]		= PropManager.onBuyPropCallBack;
}



kPropManager = PropManager.getInstance();