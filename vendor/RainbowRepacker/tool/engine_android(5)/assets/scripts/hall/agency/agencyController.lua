require("isolater/common/commonController");
require("hall/common/commonJumpLogic")
require("hall/gameData/pay/goodsListInterface");

AgencyController = class(CommonController);

AgencyController.s_cmds =
{
	goBack = 1,
	requestRecharge = 2,

	onGoBackWebViewUrl = 3,
}

AgencyController.ctor = function(self, state, viewClass, viewConfig)
	self.m_state = state;
end

AgencyController.resume = function(self)
	CommonController.resume(self);
	self:_getAgencyGoodsInfo();
end

AgencyController.pause = function(self)
	CommonController.pause(self);
end

AgencyController.dtor = function(self)
end

AgencyController.checkGoBack = function(self)
	return self:updateView(AgencyScene.s_cmds.checkGoBack);
end

AgencyController.onGoBack = function(self)
	self:onGoBackWebViewUrl();
end

AgencyController.requestRecharge = function(self)
	local data = self:_getAgencyGoodsInfo();
	RechargeDataInterface.getInstance():setSceneType(UBPaySceneConfig.kAgencyRecharge);
	self.m_state:pushState(States.ShortCutRecharge, nil, true, PayConfig.eGoodsListId.AgentCard, nil, data);
end

AgencyController.onGoBackWebViewUrl = function (self)
	self:updateView(AgencyScene.s_cmds.GoBackWebViewUrl);
	self.m_state:popState();
end

AgencyController.onWebviewCall = function(self, status, jsonTable, jsonStr)
	if table.isEmpty(jsonTable) then 
		return; 
	end
	Log.v("AgencyController.onWebviewCall","---------js回调充值-------data:", jsonTable);
	if status and jsonTable then
		local jsonData = json.decode(jsonStr);
		CommonJumpLogic.getInstance():executeJsCall(jsonData);
		local cmd = number.valueOf(jsonData.cmd);
		if cmd == CommonJumpCmds.ANGECY_RECHARGE then
			local infoTable = jsonData.info;
	        if table.isEmpty(infoTable) then

	        else
				local price = number.valueOf(infoTable.price);
				local gid = number.valueOf(infoTable.gid);
				local ptype = number.valueOf(infoTable.ptype);

				local goods = self:_getAgencyGoodsInfo();
				local pamount = number.valueOf(goods.pamount);
				local id = number.valueOf(goods.id);
				local goodsType = number.valueOf(goods.ptype);

				if price == pamount and gid == id and ptype == goodsType then 
					self:updateView(AgencyScene.s_cmds.ShowPayConfirmDialog,goods);
				end 
	    	end
	    elseif cmd == CommonJumpCmds.ANGECY_H5_BACK then
	    	self:onGoBackWebViewUrl();
	    else 
	    	self:onGoBackWebViewUrl();
		end
	end
end

AgencyController._getAgencyGoodsInfo = function(self)
	local sceneGoodInfo = kGoodsListInterface:getSceneGoodsInfo(PayConfig.eGoodsListId.AgentCard, {scene = PayConfig.eGoodsListId.AgentCard});
	
	local goodsList = table.verify(sceneGoodInfo.goodsList);
	if table.isEmpty(goodsList) then
		return {};
	end

	local goods = table.verify(goodsList[1]);

	return goods;
end

AgencyController.onBroadcastPayMoney  = function(self, broadType)
	if broadType == 100 then 
		self:updateView(AgencyScene.s_cmds.onPaySuccessed);
	end 
end

AgencyController.s_cmdConfig = 
{
	[AgencyController.s_cmds.goBack] = AgencyController.onGoBack,
	[AgencyController.s_cmds.requestRecharge] = AgencyController.requestRecharge,
	[AgencyController.s_cmds.onGoBackWebViewUrl] = AgencyController.onGoBackWebViewUrl;
};


AgencyController.s_nativeEventFuncMap = {
	["GoBackWebViewUrl"] = AgencyController.onGoBackWebViewUrl;
	["OnWebViewCall"] = AgencyController.onWebviewCall;
}