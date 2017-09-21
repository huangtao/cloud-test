require("common/commonScene");
require("hall/diamondShop/diamondShopController");
require("hall/diamondShop/diamondShopScene");
local diamondShopLayout = require(ViewPath.."hall/diamondShop/diamondShopLayout");
require("hall/diamondShop/data/diamondShopConstants");

DiamondShopState = class(CommonState);

DiamondShopState.ctor = function(self)
end

DiamondShopState.dtor = function(self)
	-- body
end

DiamondShopState.load = function(self)
	CommonState.load(self);
	self.m_controller = new(DiamondShopController,self,DiamondShopScene,diamondShopLayout);
	return true;
end

DiamondShopState.unload = function(self)
	CommonState.unload(self);
	delete(self.m_controller);
	self.m_controller = nil;
end

DiamondShopState.getController = function(self)
	return self.m_controller;
end

DiamondShopState.gobackLastState = function(self)
    if MessageBox.isShowing() then
		MessageBox.hide();
		return true ;
	end
    if IBaseDialog.isDialogShowing() then
		IBaseDialog.onBackHidden();
		return true ;
	end
	self.m_controller:onBackClick();
end