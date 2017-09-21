require("isolater/common/commonController");
require("ubReport/ubReport");
require("ubReport/ubConfig");
local UserInfoScene = require("hall/userInfo/userInfoScene");
UserInfoController = class(CommonController);

UserInfoController.s_cmds =
{
	Back = 1,
	BackToHall = 2;
};

UserInfoController.ctor = function(self,state,viewClass,viewConfig,...)
    
    local bundleData = state:getBundleData();
	if bundleData then 
		-- bundleData.activeTab
		self:updateView(UserInfoScene.s_cmds.SetActiveTab, bundleData.activeTab);
	end
	self:initQRInterface()
end

UserInfoController.resume = function(self)
	CommonController.resume(self);
	self:initQRInterface()
end

UserInfoController.pause = function(self)
	CommonController.pause(self);
	self:deleteQRInterface()
end

UserInfoController.dtor = function(self)
	self:deleteQRInterface()
end

UserInfoController.initQRInterface = function(self)
	self.m_QRDataInterface = self.m_QRDataInterface or new(QRDataInterface)
	self.m_QRDataInterface:setObserver(self)
end

UserInfoController.deleteQRInterface = function(self)
	if self.m_QRDataInterface then
		self.m_QRDataInterface:clearObserver(self)
		delete(self.m_QRDataInterface)
		self.m_QRDataInterface = nil
	end
end

UserInfoController.bindAngecyUserinfoQRCreateCB = function(self, isSuccess, dfqp_qrType, imageName)
	if isSuccess and imageName then
		self:updateView(UserInfoScene.s_cmds.UpdateQR, imageName)
	end
end

---------------------------------------------------------------
UserInfoController.onBack = function(self)
	Log.eWF("MultiDeviceLogin ","UserInfoController.onBack ==> gameManager start to hall");

	StateMachine.getInstance():popState(); -- 比赛场跳转至个人信息页面，返回需原路返回
end

UserInfoController.onBackToHall = function(self)
	kGameManager:startGame(GameType.HALL)
end

---------------------------------------------------------------

UserInfoController.userInfoReport = function(self,actionID)
	--self:ubReport(actionID);
end

------------------------------------- 命令响应函数配置 ------------------------
UserInfoController.s_cmdConfig =
{
	[UserInfoController.s_cmds.Back]				= UserInfoController.onBack,
	[UserInfoController.s_cmds.BackToHall]          = UserInfoController.onBackToHall;
};