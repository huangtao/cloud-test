require("gameData/dataInterfaceBase");
require("hall/prop/propManager");
require("hall/prop/oldBackpackDataInterface");
require("hall/recharge/data/rechargeDataInterface");

PropIsolater = class(DataInterfaceBase);

PropIsolater.Delegate = {
	onUsePropCallback = "onUsePropCallback";
};

PropIsolater.propTypeMap = {
	TYPE_VIP           = PropManager.propTypeMap.TYPE_VIP; --vip
    TYPE_VIP_HEAD      = PropManager.propTypeMap.TYPE_VIP_HEAD; --专属头像
    TYPE_VIP_KICK      = PropManager.propTypeMap.TYPE_VIP_KICK; --踢人
    TYPE_VIP_MAGU      = PropManager.propTypeMap.TYPE_VIP_MAGU; --马股提示
    TYPE_VIP_GAME      = PropManager.propTypeMap.TYPE_VIP_GAME; --专属比赛
    TYPE_VIP_FACE      = PropManager.propTypeMap.TYPE_VIP_FACE; --专属表情
    TYPE_VIP_DEG       = PropManager.propTypeMap.TYPE_VIP_DEG; --VIP破产
    TYPE_VIP_LOG       = PropManager.propTypeMap.TYPE_VIP_LOG; --签到奖励
    TYPE_MATCHCARD_LOW = PropManager.propTypeMap.TYPE_MATCHCARD_LOW; --初级参赛券
    TYPE_BUQIANCARD    = PropManager.propTypeMap.TYPE_BUQIANCARD; --补签卡

	TYPE_ROSE			= PropManager.propTypeMap.TYPE_ROSE,	-- 鲜花
	TYPE_EGG			= PropManager.propTypeMap.TYPE_EGG,		-- 鸡蛋
	TYPE_SHOES			= PropManager.propTypeMap.TYPE_SHOES,	-- 拖鞋
	TYPE_BOMB			= PropManager.propTypeMap.TYPE_BOMB,	-- 炸弹
	TYPE_SILVER			= PropManager.propTypeMap.TYPE_SILVER,	-- 银元
};

PropIsolater.getInstance = function()
	if not PropIsolater.s_instance then
		PropIsolater.s_instance = new(PropIsolater); 
	end
	return PropIsolater.s_instance;
end

PropIsolater.ctor = function(self)
	PropManager.getInstance():setObserver(self);
	OldBackpackDataInterface.getInstance():setObserver(self);
end

PropIsolater.dtor = function(self)
	PropManager.getInstance():clearObserver(self);
	OldBackpackDataInterface.getInstance():clearObserver(self);
end
------------- 道具相关 -----------------------------------------------

--[[
	@brief 获取物品箱中的社交道具集合
	@return t = 	
				{
				    [1] = 
				    {
				        ["itemNum"] = 1;
				        ["type"] = 200;
				        ["changeNum"] = 1;
				        ["allowTimes"] = 1;
				        ["expires"] = 0;
				        ["boxItemID"] = 200;
				        ["sort"] = -1;
				    };
				};
--]]
PropIsolater.getSocialProps = function(self)
	return PropManager.getInstance():getSocialProps();
end

--@brief 是否是社交道具
--@param propType 道具类型
--@note 200~249为社交道具
PropIsolater.checkIsSocialProp = function(self,propType)
	propType = number.valueOf(propType);

	return propType >= 200 and propType <= 249;
end

--道具配置
--兼容
PropIsolater.getPropConfigByPropType = function(self,propType)
	local info = RechargeDataInterface.getInstance():getGoodInfoByTypeIdWithMap(propType);
	if table.isEmpty(info) then
		return {};
	else
		--  "propsId":1,        //道具id
		--  "propsType":1,      //道具类型
		--  "propsName":"",     //道具名称
		--  "propsIcon":"",     //道具icon
		--  "propsDesc":"",     //道具描述
		--  "propsQua":"",      //道具品质
		local ret = {
			propsId = info.item_type,
			propsType = info.item_type;
			propsName = info.item_name;
			propsIcon = info.item_icon;
			propsDesc = info.item_desc;
			propsQua  = "-1";
		};

		return ret;
	end
end

--[[
	@brief 获取道具信息
	@return t = 
		{
		    ["expires"] = 0;
		    ["type"] = 200;
		    ["allowTimes"] = 1;
		};
--]]
PropIsolater.getPropInfoByType = function(self,propType)
	return PropManager.getInstance():getPropInfoByType(propType);
end

--道具数量
PropIsolater.getPropNumByPropType = function(self,propType)
	local num = number.valueOf(PropManager.getInstance():getPropNumByPropType(propType))
	return num < 0 and 0 or num;
end

--@brief 更新道具数量、有效期
--@param propType (int) 道具类型
--@param num (int) 数目
--@param expires (int)  过期时间
PropIsolater.updatePropNum = function(self,propType,num,expires)
	PropManager.getInstance():updatePropNum(propType,num,expires);
end

--@brief 使用道具
--@params strActiveMids (string) 道具使用相关人员，以逗号为分隔符   eg "203001,299333"
PropIsolater.requestUseProp = function(self,propType, propsNum, strActiveMids)
	OldBackpackDataInterface.getInstance():use(propType, propsNum, strActiveMids);
end

--@brief 使用道具回调
PropIsolater.onUseCallback = function(self,isSuccess, data)
	Log.d("PropIsolater.onUseCallback","isSuccess = ",isSuccess,"data = ",data);
	self:notify(PropIsolater.Delegate.onUsePropCallback,isSuccess, data);
end

--丢弃道具
PropIsolater.requestAbandonProp = function(self,propType, propsNum)
	OldBackpackDataInterface.getInstance():abandon(propType, propsNum);
end

PropIsolater.onAbandonCallBack = function(self,isSuccess, data)
	self:notify(PropIsolater.Delegate.onAbandonPropCallback,isSuccess, data);
end

--@brief 道具是否过期
PropIsolater.isExpire = function(self,propType)
	return PropManager.getInstance():isExpire(propType);
end

--@brief 获取道具icon 地址
PropIsolater.getPropIcon = function(self,propType)
	local propInfo = RechargeDataInterface.getInstance():getGoodInfoByTypeIdWithMap(propType);
	return propInfo and propInfo.item_icon or "";
end

--@brief 获取道具名字
PropIsolater.getPropName = function(self,propType)
	local propInfo = RechargeDataInterface.getInstance():getGoodInfoByTypeIdWithMap(propType);
	return propInfo and propInfo.item_name or "";	
end

--@brief 获取道具类型
PropIsolater.getPropType = function(self, propType)
	return RechargeDataInterface.getInstance():getGoodIdWithMap(propType);
end

--道具类型
PropIsolater.getPropTypeMap = function(self)
	return PropIsolater.propTypeMap;
end

-- 获取物品信息
----@note 此接口返回的数据中 item_name、item_type、item_icon 一定是正确的，其余字段不一定是正确的(会保证数据格式正确)
PropIsolater.getGoodInfoByTypeId = function(self, typeId)
	return RechargeDataInterface.getInstance():getGoodInfoByTypeId(typeId);
end

--[[
	@brief 获取物品配置信息
	@return (table)
	t = {
			{
				v.item_type = GetNumFromJsonTable(v, "item_type", 0); --商品类型ID
				v.item_name = GetStrFromJsonTable(v, "item_name", ""); --商品类型名称
				v.item_icon = GetStrFromJsonTable(v, "item_icon", ""); --商品类型图标
				v.sort      = GetNumFromJsonTable(v, "sort", 0);  --排序值
		        v.item_desc = GetStrFromJsonTable(v, "item_desc", ""); --物品描述
			}
		}
--]]
PropIsolater.getGoodsClassifyConfig = function(self)
	return RechargeDataInterface.getInstance():getGoodsClassifyConfig();
end