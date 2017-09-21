----------------------------------红包的本地玩家信息保存------------------------------------
local LocalPlayerInfoDict = class(Dict,false);

LocalPlayerInfoDict.ctor = function(self)
    --固定名字
    local name = "";
    self.m_userId = self.m_userId or kUserInfoData:getUserId();
    name = "dic_redEnvelopeLocalInfo_"..self.m_userId;
    super(self,name);
end

LocalPlayerInfoDict.setValue = function(self,p_key,p_value)
    self:load();
    self:setString(p_key,p_value);
    self:save();
end

LocalPlayerInfoDict.getValue = function(self,p_key)

                                       --"pos_x"   
                                       --"pos_y"    
                                       --"lucky_id"
                                       --"isNeverGet"     
                                       

    self:load();
    local tmpString = self:getString(p_key);
    return tmpString;
end

LocalPlayerInfoDict.dtor = function(self)
    
end

return LocalPlayerInfoDict;