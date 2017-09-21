--服务器给的物品类型，不适合客户端开发，故客户端根据服务器类型，适配自己出自己的类型，隔离对服务器的依赖。
--后续服务器每增加一种物品类型，客户端都对应的在增加一种我们自己定义的类型。

BagTypeAdapter = class();

BagTypeAdapter.s_shard          = 1;  --碎片
BagTypeAdapter.s_gitBag         = 2;  --礼包
BagTypeAdapter.s_general        = 3;  --普通道具
BagTypeAdapter.s_offline        = 4;  --线下实物劵
BagTypeAdapter.s_onlineEntity   = 5;  --线上实物券
BagTypeAdapter.s_onlineVirtual   = 6;  --线上虚拟物品（话费充值）

BagTypeAdapter.getInstance = function()
    if BagTypeAdapter._instance == nil then
      BagTypeAdapter._instance = new(BagTypeAdapter);
    end
    return BagTypeAdapter._instance
end

BagTypeAdapter.ctor = function(self)
end

BagTypeAdapter.dtor = function(self)
end

BagTypeAdapter.getClientType = function(self,serverPrimaryType,serverSecondaryType)
    
    local tmpClientType = nil;
    if serverPrimaryType == 0 then
        tmpClientType = BagTypeAdapter.s_general
    elseif serverPrimaryType == 1 then

        if serverSecondaryType == 1 then
            tmpClientType = BagTypeAdapter.s_onlineVirtual    --@@@@@@@@@@@@具体类型根据服务器更改
        elseif serverSecondaryType == 2 then
            tmpClientType = BagTypeAdapter.s_onlineEntity
        else
            Log.v("BagTypeAdapter.getClientType没有匹配的类型", serverSecondaryType);
        end

    elseif serverPrimaryType == 2 then
        tmpClientType = BagTypeAdapter.s_gitBag
    elseif serverPrimaryType == 3 then
        tmpClientType = BagTypeAdapter.s_shard
    elseif serverPrimaryType == 4 then
        tmpClientType = BagTypeAdapter.s_offline
    else
        Log.v("BagTypeAdapter.getClientType没有匹配的类型", serverSecondaryType);
    end
    return tmpClientType ;
end

k_bagTypeAdapter = BagTypeAdapter.getInstance();