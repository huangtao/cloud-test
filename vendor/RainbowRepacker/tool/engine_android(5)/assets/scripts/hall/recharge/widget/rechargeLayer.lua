require("common/commonGameLayer");
require("common/uiFactory");
require("ui/adapter");
require("ui/toast");
require("ubReport/ubReport");
require("ubReport/ubConfig");
require("common/messageBox");
local rechargeTipsView = require(RechargeViewPath.."rechargeTipsView");
local RechargeItem = require("hall/recharge/widget/rechargeItem");

local RechargeLayer = class(CommonGameLayer,false);

RechargeLayer.Delegate = {
    onRechargeItemClicked = "onRechargeItemClicked"; -- index
    onPaymentConfirmed = "onPaymentConfirmed";
};


RechargeLayer.s_controls = 
{	
	gold_2 = 1,
};

RechargeLayer.s_cmds = 
{
	UpdateData = 1,
}

RechargeLayer.ctor = function(self,w,h,itemView)
    super(self);
    
	self.m_listView = UIFactory.createListView(0,0,w,h);
	self:addChild(self.m_listView);

	self.m_itemView = itemView;

	EventDispatcher.getInstance():register(RechargeItem.s_onRechargeItemClick, self, self.onRechargeItemClick);
end

RechargeLayer.dtor = function(self)
	EventDispatcher.getInstance():unregister(RechargeItem.s_onRechargeItemClick, self, self.onRechargeItemClick);
	MessageBox.hide();
	delete(self.m_paymentView);
	self.m_paymentView = nil;
end

RechargeLayer.setSize = function(self,width,height)
	CommonGameLayer.setSize(self,width,height);
	self.m_listView:setSize(width,height);
end 

RechargeLayer.onUpdateData = function(self,goodsData,curListIndex,isRecommend)
	self.m_curListIndex = curListIndex;

	self.m_goodsData = goodsData;
	if not table.isEmpty(goodsData) then
		local packedData = self:packData(goodsData);

		if not self.m_listAdapter then
			self.m_listAdapter = new(CacheAdapter, self.m_itemView, packedData);
			self.m_listView:setAdapter(self.m_listAdapter);	
		else
			self.m_listAdapter:changeData(packedData);
		end
		self.m_listView:setVisible(true);	
	else
		self.m_listView:setVisible(false);
	end
end

RechargeLayer.isEmpty = function(self)
	return table.isEmpty(self.m_goodsData);
end

--组装成每行3个的shopList
RechargeLayer.packData = function(self, info)
	local infoList = {};
	local num = 1;
	local page = math.ceil(#info/3);
	for i=1, page do
		num = 1;
		local w = self.m_listView:getSize();
		local pageList = { goodsList = {}, w = w, };
		for j, v in pairs(info) do
			if math.ceil(num/3) == i then
				table.insert(pageList.goodsList, v);
			end
			num = num+1;
		end

		table.insert(infoList, pageList);
	end
	return infoList;
end

--@delegate
RechargeLayer.onRechargeItemClick  =function(self,data)
	if not table.isTable(data) then 
		return;
	end

	self.m_lastPayData = data;
	self:execDelegate(RechargeLayer.Delegate.onPaymentConfirmed, data.scene, data);
end

RechargeLayer.showToast = function(self,msg)
	Toast.getInstance():showText(msg,50,30,kAlginLeft,"",26,250,210,70);
end

RechargeLayer.s_cmdConfig = 
{
	[RechargeLayer.s_cmds.UpdateData] = RechargeLayer.onUpdateData;
}


return RechargeLayer;