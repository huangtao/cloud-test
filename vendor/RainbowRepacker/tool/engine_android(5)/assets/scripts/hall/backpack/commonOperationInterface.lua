require("hall/backpack/data/typeAdapter");
require("isolater/widget/layerManagerIsolater");

local CommonOperationInterfaceBase = class();

--公共信息展示
CommonOperationInterfaceBase.showCommonInfo = function(self,p_data)
    
end

--详细信息完善
CommonOperationInterfaceBase.showAndFillDetailInfo = function(self,p_data)
end

--操作成功的回掉
CommonOperationInterfaceBase.successCallBack = function(self,p_data)
    
end

--截屏时的分享界面
CommonOperationInterfaceBase.shared = function(self,p_data)
    LayerManagerIsolater.getInstance():show("case_Share_Result",p_data);
end

--操作失败的回掉
CommonOperationInterfaceBase.failCallBack = function(self,p_data)
    
end
------------------------------------------------------------

-----------------------碎片相关操作---------------------------
ShardOperation = class(CommonOperationInterfaceBase);

ShardOperation.getInstance = function()
    if not ShardOperation._instance then
        ShardOperation._instance = new(ShardOperation);
    end
    return ShardOperation._instance;
end

ShardOperation.showCommonInfo = function(self,p_data)
   LayerManagerIsolater.getInstance():show("case_shard_use",p_data);
end


--操作失败的回掉
ShardOperation.failCallBack = function(self,p_data)
end

--操作成功的回掉
ShardOperation.successCallBack = function(self,p_data)
    LayerManagerIsolater.getInstance():show("case_congratulation",p_data,BagTypeAdapter.s_shard);
end
----------------------礼包的相关操作---------------------------
GiftBoxOperation = class(CommonOperationInterfaceBase);

GiftBoxOperation.getInstance = function()
    if not GiftBoxOperation._instance then
        GiftBoxOperation._instance = new(GiftBoxOperation);
    end
    return GiftBoxOperation._instance;
end

GiftBoxOperation.showCommonInfo = function(self,p_data)
    LayerManagerIsolater.getInstance():show("case_giftBag_use",p_data);

end


--操作成功的回掉
GiftBoxOperation.successCallBack = function(self,p_data)
    
end

--操作失败的回掉
GiftBoxOperation.failCallBack = function(self,p_data)
end

----------------------普通道具的相关操作------------------------
GeneralObjectOperation = class(CommonOperationInterfaceBase);

GeneralObjectOperation.getInstance = function()
    if not GeneralObjectOperation._instance then
        GeneralObjectOperation._instance = new(GeneralObjectOperation);
    end
    return GeneralObjectOperation._instance;
end

GeneralObjectOperation.showCommonInfo = function(self,p_data)
    LayerManagerIsolater.getInstance():show("case_general_use",p_data);
end


--操作成功的回掉
GeneralObjectOperation.successCallBack = function(self,p_data)
end

--操作失败的回掉
GeneralObjectOperation.failCallBack = function(self,p_data)
end
-----------------------线下实物的相关操作-----------------------
OfflineOperation = class(CommonOperationInterfaceBase);

OfflineOperation.getInstance = function()
    if not OfflineOperation._instance then
        OfflineOperation._instance = new(OfflineOperation);
    end
    return OfflineOperation._instance;
end

OfflineOperation.showCommonInfo = function(self,p_data)
    LayerManagerIsolater.getInstance():show("case_offline_use",p_data);

end

--操作成功的回掉
OfflineOperation.successCallBack = function(self,p_data)
    LayerManagerIsolater.getInstance():show("case_congratulation",p_data,BagTypeAdapter.s_offline);
end


--操作失败的回掉
OfflineOperation.failCallBack = function(self,p_data)
end

--显示细节（具体地址，电话等）
OfflineOperation.showAndFillDetailInfo = function(self,p_data)
    LayerManagerIsolater.getInstance():show("case_detail_offline",p_data);
end
-----------------------线上实物的相关操作-----------------------
OnlineEntityOperation = class(CommonOperationInterfaceBase);

OnlineEntityOperation.getInstance = function()
    if not OnlineEntityOperation._instance then
        OnlineEntityOperation._instance = new(OnlineEntityOperation);
    end
    return OnlineEntityOperation._instance;
end

OnlineEntityOperation.showCommonInfo = function(self,p_data)
     LayerManagerIsolater.getInstance():show("case_onlineEntity_use",p_data);

end


--操作成功的回掉
OnlineEntityOperation.successCallBack = function(self,p_data)
     LayerManagerIsolater.getInstance():show("case_congratulation",p_data,BagTypeAdapter.s_onlineEntity);
end

--操作失败的回掉
OnlineEntityOperation.failCallBack = function(self,p_data)
end


--得到玩家的相关信息
OnlineEntityOperation.showAndFillDetailInfo = function(self,p_data)
    LayerManagerIsolater.getInstance():show("case_detail_online_entity",p_data);

end
----------------------线上虚拟物品（话费充值）的相关操作-----------
OnlineVirtualOperation = class(CommonOperationInterfaceBase);

OnlineVirtualOperation.getInstance = function()
    if not OnlineVirtualOperation._instance then
        OnlineVirtualOperation._instance = new(OnlineVirtualOperation);
    end
    return OnlineVirtualOperation._instance;
end

OnlineVirtualOperation.showCommonInfo = function(self,p_data)
    LayerManagerIsolater.getInstance():show("case_onlineVirtual_use",p_data);

end


--操作成功的回掉
OnlineVirtualOperation.successCallBack = function(self,p_data)
     LayerManagerIsolater.getInstance():show("case_congratulation",p_data,BagTypeAdapter.s_onlineVirtual);
end

--操作失败的回掉
OnlineVirtualOperation.failCallBack = function(self,p_data)
end

--得到玩家的电话号码等
OnlineVirtualOperation.showAndFillDetailInfo = function(self,p_data)
    LayerManagerIsolater.getInstance():show("case_detail_online_virtual",p_data);
end

CaseOperationInferfaceFactory = class()

CaseOperationInferfaceFactory.getInstance = function()
    if not CaseOperationInferfaceFactory._instance then
        CaseOperationInferfaceFactory._instance = new(CaseOperationInferfaceFactory);
    end
    return CaseOperationInferfaceFactory._instance;
end

--public    暴露给外部调用
CaseOperationInferfaceFactory.getInterfaceByType = function(self,p_clientType)
    local _instance = nil;

    do
        if p_clientType == BagTypeAdapter.s_shard then
            _instance = ShardOperation.getInstance();
        elseif p_clientType == BagTypeAdapter.s_gitBag then
            _instance = GiftBoxOperation.getInstance();
        elseif p_clientType == BagTypeAdapter.s_general then
            _instance = GeneralObjectOperation.getInstance();
        elseif p_clientType == BagTypeAdapter.s_offline then
            _instance = OfflineOperation.getInstance();
        elseif p_clientType == BagTypeAdapter.s_onlineEntity then
            _instance = OnlineEntityOperation.getInstance();
        elseif p_clientType == BagTypeAdapter.s_onlineVirtual then
            _instance = OnlineVirtualOperation.getInstance();
        else
        end
    end

    return _instance;
  
end

--全局变量
kCaseOperationInstance = CaseOperationInferfaceFactory.getInstance(); 