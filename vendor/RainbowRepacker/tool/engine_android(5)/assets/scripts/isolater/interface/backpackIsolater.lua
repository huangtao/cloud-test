--物品箱相关的一些接口
require("hall/backpack/data/backpackDataInterface");
BackpackIsolater = class();
BackpackIsolater.getInstance = function()
	if not BackpackIsolater.s_instance then
		BackpackIsolater.s_instance = new(BackpackIsolater); 
	end
	return BackpackIsolater.s_instance;
end

BackpackIsolater.ctor = function(self)
	
end

BackpackIsolater.dtor = function(self)
	
end

--变化刷新（这个接口可以涵盖所有的变化）
BackpackIsolater.refreshBagData = function(self, data)    --这是一个增量刷新，data是一个table数据结构参照backpackData，物品有的属性都要写进去，没有的无视
								-- 	date = {
								-- 	-------------公共属性--------------
								-- 	boxItemID	--主ID
								-- 	sort        --在背包的顺序
								-- 	boxType     --物品类型 
								-- 	smallType	--物品小类型
								-- 	isBoxUse	--
								-- 	changeNum   --数量
								-- 	--------------专有属性---------------
								-- 	gatherId    --副ID
								-- 	expires     --过期二期
								-- 	compoundNum --compoundNum个物品“A”可合成1个"B"
								-- 	qrcode		--分享用的二维码图片地址
								-- 	address		--商家地址
								-- 	phone		--商家电话
								-- 	status		--是否已领取
								-- 	conditionCode
								-- 	matchName
								-- 	starttime
								-- 	expiresSec

								-- }
	BackpackDataInterface.getInstance():refreshBagData(data);  
end

--总数刷新(这个接口调用的前提是必须先确定客户端已经有这个东西的属性，否则必须用BackpackIsolater.refreshBagData)
BackpackIsolater.updatePropNum = function(self,p_boxId,p_gatherId,p_totalNum) --p_boxId：主ID，p_gatherId：副ID（没有就写nil）,p_totalNum:总量。
	BackpackDataInterface.getInstance():updatePropNum(p_boxId,p_gatherId,p_totalNum);  
end

--增量刷新(这个接口调用的前提是必须先确定客户端已经有这个东西的属性，否则必须用BackpackIsolater.refreshBagData)
BackpackIsolater.updatePropaddNum = function(self,p_boxId,p_gatherId,p_addNum) --p_boxId：主ID，p_gatherId：副ID（没有就写nil）,p_addNum:变化的数量。
	BackpackDataInterface.getInstance():updatePropaddNum(p_boxId,p_gatherId,p_addNum);  
end

--根据物品类型得到相关信息
BackpackIsolater.getPropInfoByType = function(self,p_boxId,p_gatherId) --p_boxId：主ID，p_gatherId：副ID（没有就写nil）
	return BackpackDataInterface.getInstance():getPropInfoByType(p_boxId,p_gatherId);  
end

--根据物品类型得到对应的数量
BackpackIsolater.getPropNumByPropType = function(self,p_boxId,p_gatherId)--p_boxId：主ID，p_gatherId：副ID（没有就写nil）
	return BackpackDataInterface.getInstance():getPropNumByPropType(p_boxId,p_gatherId);  
end