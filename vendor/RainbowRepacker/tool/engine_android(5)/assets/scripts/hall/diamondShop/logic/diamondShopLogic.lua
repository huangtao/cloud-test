require("common/commonLogic");
require("hall/diamondShop/data/diamondShopConstants");
require("hall/diamondShop/data/diamondShopDataInterface");

DiamondShopLogic = class(CommonLogic);

DiamondShopLogic.Delegate = {
	onResponseDiamondPay = "onResponseDiamondPay";
};

DiamondShopLogic.ctor = function(self)
end 

DiamondShopLogic.dtor = function(self)
end 

DiamondShopLogic.initSocketManager = function(self)
	self.m_socket = OnlineSocketManager.getInstance();
end

DiamondShopLogic.requestDiamondPay = function(self,gid,phone,name,addr)
	if gid then 
		local param = {};
		param.gid = gid;
		param.phone = phone or "";
		param.name = name or "";
		param.addr = addr or "";
		
		Log.i("DiamondShopLogic.requestDiamondPay","data = ",param);
		self.m_socket:sendMsg(PHP_SHOP_DIAMOND_BUY,param);
	end 
end

DiamondShopLogic.onResponseDiamondPay = function(self, isSuccess, data, sendParam)
    Log.i("DiamondShopLogic.onResponseDiamondPay","isSuccess = ",isSuccess,"data = ",data);
	local info = {};
	if not isSuccess then
		info = data;
	else 
		if tonumber(data) == 0 then --失败
			isSuccess = false;
		else
			local result = data;
			if type(result) == "table" then 
				isSuccess = true;
				result.flag = tonumber(result.flag) or 0;
				if result.flag == DiamondShopConstants.eGoodsType.Gold then--兑换银币
					result.totalMoney = tonumber(result.totalMoney) or kUserInfoData:getMoney(); 	--玩家总银币数量
					result.addMoney = tonumber(result.addMoney) or 0;	--增加银币数量 
					result.totalDiamond = tonumber(result.totalDiamond) or kUserInfoData:getDiamond(); --玩家总钻石
					kUserInfoData:setMoney(result.totalMoney);

				elseif result.flag == DiamondShopConstants.eGoodsType.RealGoods then --兑换实物
					result.orderid = result.orderid or ""; 				 --订单号
					result.totalDiamond = tonumber(result.totalDiamond) or kUserInfoData:getDiamond(); --玩家总钻石
				else --兑换话费
					result.totalDiamond = tonumber(result.totalDiamond) or kUserInfoData:getDiamond(); --玩家总钻石
				end 
				kUserInfoData:setDiamond(result.totalDiamond);

				info = result;
				DiamondShopDataInterface.getInstance():setRefreshRecordData();
				DiamondShopDataInterface.getInstance():updateGoodsNumWithGid(sendParam.gid, -1); --将商品数量-1
			else
				isSuccess = false;
			end 
		end 
	end
	Log.i("DiamondShopLogic.onResponseDiamondPay execDelegate onResponseDiamondPay","isSuccess = ",isSuccess,"info = ",info);
	self:execDelegate(DiamondShopLogic.Delegate.onResponseDiamondPay,isSuccess,info);
end

DiamondShopLogic.s_socketCmdFuncMap = {
	[PHP_SHOP_DIAMOND_BUY] 		     = DiamondShopLogic.onResponseDiamondPay;
};