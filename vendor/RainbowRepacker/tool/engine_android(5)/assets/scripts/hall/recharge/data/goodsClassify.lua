require("util/fileUtil");

local GoodsClassify = class(GameData);

GoodsClassify.Delegate = {
    onGetGoodsClassifyDetailInfoCallBack = "onGetGoodsClassifyDetailInfoCallBack"
}

GoodsClassify.eGoodsType = { --物品类型ID
    SILVER_COIN         = {id = 0, name = "银币" };
    GOLD_BAR            = {id = 1, name = "金条" };
    DIAMOND             = {id = 2, name = "钻石" };
    JIFEN               = {id = 3, name = "积分" };
};

-- dirty:道具id映射，为了兼容php无法匹配的道具类型
GoodsClassify.sGoodsMap = {
    [PropManager.propTypeMap.TYPE_VIP_KICK] = 36, --踢人
    [PropManager.propTypeMap.TYPE_VIP_MAGU] = 37, --马股提示
    [PropManager.propTypeMap.TYPE_MATCHCARD_LOW] = 25, --初级参赛券
    [PropManager.propTypeMap.TYPE_BUQIANCARD] = 26, --补签卡
}

--需要转换的物品ID对应的物品类型__主要针对描述
GoodsClassify.sIdToTypeMap = {
    [25] = PropManager.propTypeMap.TYPE_MATCHCARD_LOW;
   [26] = PropManager.propTypeMap.TYPE_BUQIANCARD;
   [36] = PropManager.propTypeMap.TYPE_VIP_KICK;
   [37] = PropManager.propTypeMap.TYPE_VIP_MAGU;
};


--物品种类分类
local CLASSIFY_TYPE = {
    CORE_GOODS = "1",         --核心道具
    UNION_GOODS = "2",      --碎片+全国物品
    REGION_GOODS = "3",       --地区商家物品
}

--cdn lua文件本地存储位置
local CDN_LUA_FILE_SAVE_PATH = {
    [CLASSIFY_TYPE.CORE_GOODS] = System.getStorageDict() .. "GoodsClassify_CORE_GOODS.lua",
    [CLASSIFY_TYPE.UNION_GOODS] = System.getStorageDict() .. "GoodsClassify_UNION_GOODS.lua",
    [CLASSIFY_TYPE.REGION_GOODS] = System.getStorageDict() .. "GoodsClassify_REGION_GOODS.lua",
}

GoodsClassify.initData = function(self)
    self.m_isTouched = false;
end

--@brief 获取物品配置
--@note 跪求不要调用此接口，太耗时
GoodsClassify.getGoodsClassifyConfig = function(self)
    local t = {};
    for _, list in pairs(self.m_goodsBaseMap) do
        for id, itemInfo in pairs(list) do
            if itemInfo then
                table.insert(t, self:__formatItemData(itemInfo, id) );
            end
        end
    end

    return t;
end

--@brief 根据Id获得,商品信息
GoodsClassify.getGoodInfoByTypeId = function(self, typeId)
    if not typeId then
        return;
    end

    local goodInfo = self:__searchGoodInfoById(typeId);
    if goodInfo then
        return self:__formatItemData(goodInfo, typeId);
    end
end

--@brief dirty:获取道具信息（带道具id映射）
GoodsClassify.getGoodInfoByTypeIdWithMap = function(self, typeId)
    local id = tonumber(typeId);
    if id and GoodsClassify.sGoodsMap[id] then
        id = GoodsClassify.sGoodsMap[id];
    end
    return self:getGoodInfoByTypeId(id);
end

--@brief dirty:获取真实id
GoodsClassify.getGoodIdWithMap = function(self, typeId)
    local id = tonumber(typeId);
    if id and GoodsClassify.sGoodsMap[id] then
        id = GoodsClassify.sGoodsMap[id];
    end
    return id;
end

--跟物品ID获取物品类型
GoodsClassify.getGoodTypeWithMap = function(self, id)
    local typeId = tonumber(id);
    if typeId and GoodsClassify.sIdToTypeMap[typeId] then
        typeId = GoodsClassify.sIdToTypeMap[typeId];
    end
    return typeId;
end

--@brief 设置物品公共配置信息
GoodsClassify.setGoodsClassifyCommonInfo = function(self, config)
    if table.isEmpty(config) then
        return;
    end

    local icon_pre = string.valueOf(config.icon_pre); --icon前缀地址
    local file_pre = string.valueOf(config.file_pre); --lua文件前缀地址
    local core_goods_filename = string.valueOf(config.file_name[CLASSIFY_TYPE.CORE_GOODS]);
    local union_goods_filename = string.valueOf(config.file_name[CLASSIFY_TYPE.UNION_GOODS]);
    local region_goods_name = string.valueOf(config.file_name[CLASSIFY_TYPE.REGION_GOODS]);

    self.m_config = {
        icon_pre = icon_pre,
        [CLASSIFY_TYPE.CORE_GOODS] = file_pre .. core_goods_filename,
        [CLASSIFY_TYPE.UNION_GOODS] = file_pre .. union_goods_filename,
        [CLASSIFY_TYPE.REGION_GOODS] = file_pre .. region_goods_name,
    }

    self:saveData();
end

--@brief 请求物品配置
GoodsClassify.requestData = function(self)
    if not self.m_isTouched then
        local localTimestameps =  {
            [CLASSIFY_TYPE.CORE_GOODS] = self.m_timestampMap[CLASSIFY_TYPE.CORE_GOODS] or 0;
            [CLASSIFY_TYPE.UNION_GOODS] = self.m_timestampMap[CLASSIFY_TYPE.UNION_GOODS] or 0;
            [CLASSIFY_TYPE.REGION_GOODS] = self.m_timestampMap[CLASSIFY_TYPE.REGION_GOODS] or 0;
        };
        local params = {};
        params.type = json.encode(localTimestameps);

        OnlineSocketManager.getInstance():sendMsg(PHP_NEW_GOODS_BASE, params);
    end
end

--@brief 获取物品配置回调
GoodsClassify.onGetGoodsBaseCallBack = function(self, isSuccess, info)
    if isSuccess and not table.isEmpty(info) then
        for classifyType, value in pairs(info) do
            if number.valueOf(value.cdn) == 1 then
                --如果cdn为1，则代表php要求去cdn上进行拉取
                self:__downloadLuaFileFromCdnByClassifyType(classifyType);

            else
                --差量更新的数据, 当物品信息变化时，其非核心数据以及icon都需要重新拉取
                for id, itemInfo in pairs( table.verify(value.data) ) do
                    itemInfo.item_name = string.valueOf(itemInfo.item_name);
                    self.m_goodsBaseMap[classifyType] = table.verify(self.m_goodsBaseMap[classifyType]);
                    self.m_goodsBaseMap[classifyType][id] = itemInfo;
                    self.m_goodsBaseMap[classifyType][id].item_icon = self:__getIconUrlById(id, cdnTimestamp);
                end

                --记录时间戳
                self.m_timestampMap[classifyType] = number.valueOf(value.ser_ver);

                --将数据保存到lua文件中
                self:saveData();
            end
        end
    end
end

--@brief 根据物品类型请求物品详细信息
GoodsClassify.requestGoodsDetailInfoById = function(self, typeId)
    if not typeId then
        return;
    end
    --先把道具类型转换成物品ID
    local id = self:getGoodIdWithMap(typeId);
    --如果列表里面已经存在则直接回调信息
    local goodInfo = self:__searchGoodInfoById(id);
    if not goodInfo then
        return;
    end

    if self:__hasGoodsDetailExist(goodInfo) then
        self:execDelegate(GoodsClassify.Delegate.onGetGoodsClassifyDetailInfoCallBack, typeId, self:__formatItemData(goodInfo, id) );
        return;
    end 

    local params = {
        id = json.encode( {id} );
    }
    OnlineSocketManager.getInstance():sendMsg(PHP_GOODS_DETAIL_INFO, params);
end

--@brief 根据item_desc字段来判断物品详细信息是否已经获取到了
GoodsClassify.__hasGoodsDetailExist = function(self, goodInfo)
    if goodInfo.item_desc then
        return true;
    else
        return false;
    end
end

--@brief 获取到物品的详细信息
GoodsClassify.onGetGoodsClassifyDetailInfoCallBack = function(self, isSuccess, info)
    if isSuccess and not table.isEmpty(info) then
        for id, v in pairs(info) do
            id = string.valueOf(id);
            local goodInfo = self:__searchGoodInfoById(id);
            if goodInfo then
                --刷新详细信息
                goodInfo.item_desc = string.valueOf(v.item_desc);
                goodInfo.item_access = string.valueOf(v.item_access);
                goodInfo.type_desc = string.valueOf(v.type_desc);

                --通知调用方
                local typeId = self:getGoodTypeWithMap(number.valueOf(id));
                self:execDelegate(GoodsClassify.Delegate.onGetGoodsClassifyDetailInfoCallBack, typeId, self:__formatItemData(goodInfo, id) );
            end
        end

        self:saveData();
    end
end

--@brief 根据id查询物品信息
GoodsClassify.__searchGoodInfoById = function(self, id)
    if not id then
        return nil;
    end

    id = string.valueOf(id);
    for k, classifyType in pairs(CLASSIFY_TYPE) do
        if self.m_goodsBaseMap[classifyType] and self.m_goodsBaseMap[classifyType][id] then
            return self.m_goodsBaseMap[classifyType][id];
        end
    end

    return nil;
end

GoodsClassify.__downloadLuaFileFromCdnByClassifyType = function(self, classifyType)
    Log.v("GoodsClassify.__downloadLuaFileFromCdnByClassifyType", "classifyType = ", classifyType);
    if not self.m_config[classifyType] then
        return;
    end

    local url = string.format("%s?id=%s", self.m_config[classifyType], os.time() ); --带上时间戳，防止cdn缓存
    HttpDownload.getInstance():download(url, CDN_LUA_FILE_SAVE_PATH[classifyType], 10000, self, self.__onDownloadLuaFileFromCdnCallBack);
end

GoodsClassify.__onDownloadLuaFileFromCdnCallBack = function(self, isSuccess, filePath, url)
    Log.v("GoodsClassify.__onDownloadLuaFileFromCdnCallBack", " isSuccess = ", isSuccess, " filePath = ", filePath, " url = ", url);
    if isSuccess then
        local classifyType = self:__getClassifyTypeByFilePath(filePath);
        if not classifyType then
            return;
        end

        local isSuccess, data = pcall(dofile, filePath);
        if isSuccess then
            local localTimestamp = self.m_timestampMap[classifyType] or 0;
            local cdnTimestamp = number.valueOf(data.timestamp);
            local needRefreshList = {};
            local list = table.verify(data.list);

            self.m_goodsBaseMap[classifyType] = table.verify(self.m_goodsBaseMap[classifyType]);

            --step1 删除cdn上不存在的物品
            for id, v in pairs(self.m_goodsBaseMap[classifyType]) do
                if not list[id] then
                    self.m_goodsBaseMap[classifyType][id] = nil;
                end
            end

            --step2 刷新更改or添加的物品，这些物品本地icon需要重新拉取以及详细信息
            for id, v in pairs(list) do
                id = string.valueOf(id);
                v.timestamp = number.valueOf(v.timestamp);

                if v.timestamp > localTimestamp then
                    --如果物品的修改时间大于本地的修改时间
                    self.m_goodsBaseMap[classifyType][id] = v;
                    self.m_goodsBaseMap[classifyType][id].item_icon = self:__getIconUrlById(id, cdnTimestamp);
                end
            end

            --step3 刷新本地时间戳
            self.m_timestampMap[classifyType] = cdnTimestamp;

            self:saveData();
        end

        Log.v("remove filePath = ", filePath);
    end

    if not string.isEmpty(filePath) then
        os.remove(filePath); 
    end
end

GoodsClassify.__getClassifyTypeByFilePath = function(self, filePath)
    if filePath == CDN_LUA_FILE_SAVE_PATH[CLASSIFY_TYPE.CORE_GOODS] then
        return CLASSIFY_TYPE.CORE_GOODS;
    elseif filePath == CDN_LUA_FILE_SAVE_PATH[CLASSIFY_TYPE.UNION_GOODS] then
        return CLASSIFY_TYPE.UNION_GOODS;
    elseif filePath == CDN_LUA_FILE_SAVE_PATH[CLASSIFY_TYPE.REGION_GOODS] then
        return CLASSIFY_TYPE.REGION_GOODS;
    end

    return nil;
end

GoodsClassify.__getIconUrlById = function(self, id, timestamp)
    if not id then
        return ""
    end

    id = number.valueOf(id);
    local url = string.format("%s%d/%d.png", self.m_config.icon_pre or "", id%10, id);
    if timestamp then
        url = url .. "?v=" .. timestamp;
    end
    return url;
end

--@brief 格式化物品信息，保证给到外部接口的数据是合法的
GoodsClassify.__formatItemData = function(self, src, item_type)
    local v = Copy(src);

    v.item_type = number.valueOf(item_type); --商品类型ID
    v.item_name = string.valueOf(v.item_name); --商品类型名称
    v.item_icon = string.valueOf(v.item_icon); --商品类型图标
    v.sort      = 0; --不再使用此字段，只是为了兼容
    v.item_desc = string.valueOf(v.item_desc); --物品描述
    v.item_access = string.valueOf(v.item_access); --物品获取描述
    v.type_desc = string.valueOf(v.type_desc);
    return v;
end

--@brief 加载本地默认数据
GoodsClassify.__loadDefaultGoodsConfig = function(self)
    self.m_goodsBaseMap = {};
    self.m_timestampMap = {};

    local environment = {
        [NETWORK_TYPE_TEST] = "dev",
        [NETWORK_TYPE_PREPUBLISH] = "test",
        [NETWORK_TYPE_ONLINE] = "product",
        [NETWORK_TYPE_HALL] = "dev",
    }

    --默认配置
    self.m_config = {
        icon_pre = string.format("https://dfqppic.266.com/dfqp/images/goods/%s/", environment[NETWORK_TYPE] or "");
        [CLASSIFY_TYPE.CORE_GOODS] = string.format("https://dfqppic.266.com/dfqp/static/lua/%s/CoreGoodsBase.lua", environment[NETWORK_TYPE] or "");
        [CLASSIFY_TYPE.UNION_GOODS] = string.format("https://dfqppic.266.com/dfqp/static/lua/%s/UnionGoodsBase.lua", environment[NETWORK_TYPE] or "");
        [CLASSIFY_TYPE.REGION_GOODS] = string.format("https://dfqppic.266.com/dfqp/static/lua/%s/Region%dGoodsBase.lua", environment[NETWORK_TYPE] or "", kClientInfo:getRegionIdByAppId());
    };

    local default = {};
    if NETWORK_TYPE == NETWORK_TYPE_ONLINE then
        --导入正式服默认物品配置
        default = require("hall/recharge/data/default_goods_config");
    end

    local function load(typeId)
        local data = default[typeId];
        if not table.isEmpty(data) then
            self.m_timestampMap[typeId] = data.timestamp;
            for id, v in pairs(data.list) do
                v.item_icon = self:__getIconUrlById(id, data.timestamp);
            end
            self.m_goodsBaseMap[typeId] = data.list;
        end
    end

    load(CLASSIFY_TYPE.CORE_GOODS);
    load(CLASSIFY_TYPE.UNION_GOODS);
end


--@brief 导入本地缓存的数据
GoodsClassify.loadDictData = function(self, dict)
    Log.v("GoodsClassify.loadData start ", Clock.now());

    local str = dict:getString("goodsClassify")
    local t = json.decode(str);
    if not table.isEmpty(t) then
        self.m_goodsBaseMap = table.verify(t.key_goodsBaseMap);
        self.m_timestampMap = table.verify(t.key_timestampMap);
        self.m_config       = table.verify(t.key_config);
    else
        self:__loadDefaultGoodsConfig();   
    end
    Log.v("GoodsClassify.loadData end ", Clock.now());
end

--@brief 保存到lua文件中
GoodsClassify.saveDictData = function(self, dict)
    local t = {
        key_goodsBaseMap = self.m_goodsBaseMap,
        key_timestampMap = self.m_timestampMap,
        key_config       = self.m_config,
    }

    dict:setString("goodsClassify", json.encode(t) or "");
end

GoodsClassify.getLocalDictName = function(self)
    return "GoodsClassify_cdn";
end

--获取dict key version 版本号
GoodsClassify.getDictKeyVersion = function(self)
    return "900"; --差量更新配置
end

GoodsClassify.s_socketCmdFuncMap = {
    [PHP_NEW_GOODS_BASE] = GoodsClassify.onGetGoodsBaseCallBack;
    [PHP_GOODS_DETAIL_INFO] = GoodsClassify.onGetGoodsClassifyDetailInfoCallBack;
}

return GoodsClassify;