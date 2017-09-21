
-- 最近使用表情映射表
ExpressionRecentData2 = class(GameData);

ExpressionRecentData2.Delegate = {
};

ExpressionRecentData2.ctor = function(self)
    
end

ExpressionRecentData2.dtor = function(self)
    
end

ExpressionRecentData2.initData = function(self)
    self.m_originalSizeClassic = 0;
    self.m_originalSizeVip = 0;

    -- 双向映射
    self.m_mapRecentToLocal = {};   -- 映射表：最近表情索引 to 原表情索引
    self.m_mapLocalToRecent = {};   -- 映射表：原表情索引 to 最近表情索引
    self.m_mapSizeClassic = 0;
    self.m_mapSizeVip = 0;
end

ExpressionRecentData2.initSize = function(self, classicSize, vipSize, isVip)
    classicSize = number.valueOf(classicSize);
    vipSize = number.valueOf(vipSize);

    self.m_originalSizeClassic = classicSize > 0 and classicSize or 0;
    self.m_originalSizeVip = vipSize > 0 and vipSize or 0;

    self:_analysisData(isVip);
end

ExpressionRecentData2.getSize = function(self)
    return self.m_mapSizeClassic + self.m_mapSizeVip;
end

ExpressionRecentData2._analysisData = function(self, isVip)
    if self.m_mapSizeClassic ~= self.m_originalSizeClassic or 
        self.m_mapSizeVip > self.m_originalSizeVip then
        self:_resetData();
    end

    if not isVip and self.m_mapSizeVip > 0 then
        self:_cleanVipData();
    end
end

ExpressionRecentData2._resetData = function(self)
    self.m_mapSizeClassic = self.m_originalSizeClassic;
    self.m_mapSizeVip = 0;
    for i = 1, self.m_originalSizeClassic do
        self.m_mapRecentToLocal[i] = i;
        self.m_mapLocalToRecent[i] = i;
    end
end

-- 以原表情索引使用表情
ExpressionRecentData2.useExpressByLocalIndex = function(self, localIndex)
    localIndex = number.valueOf(localIndex);

    if localIndex < 1 or localIndex > (self.m_originalSizeClassic + self.m_originalSizeVip) then
        return;
    end

    -- 将当前表情移到最近使用队列队头
    local key = self.m_mapLocalToRecent[localIndex];
    if not key then
        self.m_mapSizeVip = self.m_mapSizeVip + 1;
        key = self.m_mapSizeClassic + self.m_mapSizeVip;
        self.m_mapLocalToRecent[localIndex] = key;
        self.m_mapRecentToLocal[key] = localIndex;
    end
    
    local value = self.m_mapRecentToLocal[key];
    
    for i = key - 1, 1, -1 do
        self.m_mapRecentToLocal[i+1] = self.m_mapRecentToLocal[i];
        self.m_mapLocalToRecent[self.m_mapRecentToLocal[i]] = i+1;
    end
    self.m_mapRecentToLocal[1] = value;
    self.m_mapLocalToRecent[value] = 1;

    self:saveData();
end

-- 最近表情索引 to 原表情索引
ExpressionRecentData2.recentIndexToLocalIndex = function(self, recentIndex)
    recentIndex = number.valueOf(recentIndex);
    return self.m_mapRecentToLocal[recentIndex] or 1;
end

-- 原表情索引 to 最近表情索引
ExpressionRecentData2.localIndexToRecentIndex = function(self, localIndex)
    localIndex = number.valueOf(localIndex);
    return self.m_mapLocalToRecent[localIndex] or 1;
end

-- 对索引编码
ExpressionRecentData2.encodeIndex = function(self, originalIndex, isVipIndex)
    local localIndex = isVipIndex and originalIndex + self.m_mapSizeClassic or originalIndex;
    return localIndex;
end

-- 对索引解码
ExpressionRecentData2.decodeIndex = function(self, localIndex)
    local isVipIndex = localIndex > self.m_mapSizeClassic;
    local originalIndex = isVipIndex and localIndex - self.m_mapSizeClassic or localIndex;
    return originalIndex, isVipIndex;
end


ExpressionRecentData2._cleanVipData = function(self)
    self.m_mapSizeVip = 0;
    local index = 1;
    local oldData = self.m_mapRecentToLocal;
    self.m_mapRecentToLocal = {};
    self.m_mapLocalToRecent = {};
    for i = 1, #oldData do
        if oldData[i] <= self.m_mapSizeClassic then
            self.m_mapRecentToLocal[index] = oldData[i];
            self.m_mapLocalToRecent[oldData[i]] = index;
            index = index + 1;
        end
    end
end

-------------------------------------------------------------------

--virtual
ExpressionRecentData2.loadDictData = function(self, dict)
    self.m_mapRecentToLocal = table.verify(json.decode(dict:getString("recently_data")));
    self.m_mapSizeClassic = dict:getInt("classic_data_size", 0);

    -- 初始化映射表和表大小
    self.m_mapLocalToRecent = {};

    for i = 1, #self.m_mapRecentToLocal do
        self.m_mapLocalToRecent[self.m_mapRecentToLocal[i]] = i;
    end

    self.m_mapSizeVip = #self.m_mapRecentToLocal - self.m_mapSizeClassic;
end

--virtual
ExpressionRecentData2.saveDictData = function(self, dict)
    local recently_data = json.encode(self.m_mapRecentToLocal) or "";
    dict:setString("recently_data", recently_data);
    dict:setInt("classic_data_size", self.m_mapSizeClassic);
end

ExpressionRecentData2.getLocalDictName = function(self)
    self.m_userId = self.m_userId or UserBaseInfoIsolater.getInstance():getUserId();
    return "expression_recently_data" .. self.m_userId;
end

ExpressionRecentData2.s_socketCmdFuncMap = {

};
