require(RoomChatConfig.s_chatPathPrefix.."anim/face_config2");
require(RoomChatConfig.s_chatPathPrefix.."data/expressionRecentData2");

ExpressionDataManager2 = class();

ExpressionDataManager2.getInstance = function(self)
    if not ExpressionDataManager2.s_instance then
        ExpressionDataManager2.s_instance = new(ExpressionDataManager2);
    end

    return ExpressionDataManager2.s_instance;
end

ExpressionDataManager2.releaseInstance = function(self)
    delete(ExpressionDataManager2.s_instance);
    ExpressionDataManager2.s_instance = nil;
end

ExpressionDataManager2.eFaceType = {
    NormalFace = 1;
    VipFace = 2;
}

ExpressionDataManager2.ctor = function(self)
    self.m_expressionConfig = {};
    self.m_expressionRecent = new(ExpressionRecentData2); -- 最近使用表情映射表
end

ExpressionDataManager2.dtor = function(self)
    delete(self.m_expressionRecent)
    self.m_expressionRecent = nil;
end


--[[
    eg: config = {
        [faceType] = {
            ["expIconNamePrefix"] = "expression";         --显示在表情框中的表情按钮的图片名字的前缀
            ["expIconResMap"] = faceq_res_map2;     --显示在表情框中的表情按钮的图片拼图
            ["expAnimNamePrefix"] = "expression";     --播放的表情图片的名字前缀
            ["expAnimResMap"] = expression_res_map2; --播放的表情图片拼图
            [1] = {["imgCount"] = 2;   ["playCount"] = 7;  ["ms"] = 300;};
            ["expIconSort"] =   {1};--显示在表情框中表情按钮的顺序
        };
        ...
    }
]]

--设置表情动画配置文件(包含imgCount,ms等信息)
ExpressionDataManager2.setExpConfig = function(self, config)
    if table.isTable(config) then
        self.m_expressionConfig = config;
    else
        self.m_expressionConfig = {};
    end
end

--获取表情动画配置文件
ExpressionDataManager2.getExpConfig = function(self)
    return table.isEmpty(self.m_expressionConfig) and faceConfig2 or self.m_expressionConfig;
end

--根据faceType获取表情配置信息
ExpressionDataManager2.getExpConfigByFaceType = function(self, faceType)
    local config = self:getExpConfig();
    return config[faceType] or {};
end

--获取表情框中的图片前缀
ExpressionDataManager2.getExpIconNamePrefix = function(self, faceType)
    if self.m_expressionConfig[faceType] then
        return self.m_expressionConfig[faceType].expIconNamePrefix or self:__getDefaultValue(faceType, "expIconNamePrefix");
    else
        return self:__getDefaultValue(faceType, "expIconNamePrefix");
    end
end

--获取表情框中的图片资源拼图
ExpressionDataManager2.getExpIconResMap = function(self, faceType)
    if self.m_expressionConfig[faceType] then
        return self.m_expressionConfig[faceType].expIconResMap or self:__getDefaultValue(faceType, "expIconResMap");
    else
        return self:__getDefaultValue(faceType, "expIconResMap", {});
    end
end

--获取表情动画图片的前缀
ExpressionDataManager2.getExpAnimNamePrefix = function(self, faceType)
    if self.m_expressionConfig[faceType] then
        return self.m_expressionConfig[faceType].expAnimNamePrefix or self:__getDefaultValue(faceType, "expAnimNamePrefix");
    else
        return self:__getDefaultValue(faceType, "expAnimNamePrefix");
    end
end

--获取表请动画图片资源存储路径或拼图
ExpressionDataManager2.getExpAnimResMap = function(self, faceType)
    if self.m_expressionConfig[faceType] then
        return self.m_expressionConfig[faceType].expAnimResMap or self:__getDefaultValue(faceType, "expAnimResMap");
    else
        return self:__getDefaultValue(faceType, "expAnimResMap", {});
    end
end

ExpressionDataManager2.getExpIconSort = function(self,faceType)
    if self.m_expressionConfig[faceType] then
        return self.m_expressionConfig[faceType].expIconSort or self:__getDefaultValue(faceType, "expIconSort");
    else
        return self:__getDefaultValue(faceType, "expIconSort", {});
    end
end

ExpressionDataManager2.__getDefaultValue = function(self, faceType, key, defaultValue)
    if faceConfig2[faceType] then
        return faceConfig2[faceType][key] or defaultValue or "";
    else
        return defaultValue or "";
    end
end

------------------------------------最近常用---------------------------------------
ExpressionDataManager2.initRecentDataSize = function(self, classicSize, vipSize, isVip)
    self.m_expressionRecent:initSize(classicSize, vipSize, isVip);
end

ExpressionDataManager2.getRecentDataSize = function(self)
    return self.m_expressionRecent:getSize();
end

ExpressionDataManager2.localIndexToRecentIndex = function(self, localIndex)
    return self.m_expressionRecent:localIndexToRecentIndex(localIndex);
end

ExpressionDataManager2.recentIndexToLocalIndex = function(self, recentIndex)
    return self.m_expressionRecent:recentIndexToLocalIndex(recentIndex);
end

ExpressionDataManager2.encodeIndex = function(self, originalIndex, isVipIndex)
    return self.m_expressionRecent:encodeIndex(originalIndex, isVipIndex);
end

ExpressionDataManager2.decodeIndex = function(self, localIndex)
    return self.m_expressionRecent:decodeIndex(localIndex);
end

-- 以原表情索引使用表情
ExpressionDataManager2.useExpressByLocalIndex = function(self, localIndex)
    self.m_expressionRecent:useExpressByLocalIndex(localIndex);
end

-- 记录上一次触发的tb类型
ExpressionDataManager2.setSelectTbType = function(self,tbType)
    self.m_selTbType = tbType;
end

ExpressionDataManager2.getSelectTbType = function(self)
    return number.valueOf(self.m_selTbType,1);
end

-- 普通表情
ExpressionDataManager2.getNormalFaceType = function(self)
    return ExpressionDataManager2.eFaceType.NormalFace;
end

-- VIP表情
ExpressionDataManager2.getVipFaceType = function(self)
    return ExpressionDataManager2.eFaceType.VipFace;
end

-- 记录上一次发送的表情类型
ExpressionDataManager2.setSelectFaceType = function(self,_type)
    self.m_selFaceType = _type;
end

ExpressionDataManager2.getSelectFaceType = function(self)
    if not self.m_selFaceType then
        -- VIP用户初次进入【表情】tab时默认为【vip】tab
        self.m_selFaceType = UserIdentityIsolater.getInstance():getIsVip() and self:getVipFaceType() or self:getNormalFaceType();
    end
    return number.valueOf(self.m_selFaceType,1);
end