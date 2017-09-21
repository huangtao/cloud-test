require("common/IBaseDialog");
require("uilibs/richText");

local saveMoneyToGameView = require(HallViewPath.."main/saveMoneyToGameView");

local SaveMoneyToGameView = class(IBaseDialog,false);
local h_index = 0;
local getIndex = function(self)
    h_index = h_index + 1;
    return h_index;
end

SaveMoneyToGameView.s_controls = 
{
	maskView = getIndex();
    closeBtn = getIndex();
    saveMoneyBtn = getIndex();
    goHighRoomBtn = getIndex();
    desView = getIndex();
    tips = getIndex();
    bg = getIndex();
};

SaveMoneyToGameView.ctor = function(self,data)
	super(self,saveMoneyToGameView);
	self.m_ctrls = SaveMoneyToGameView.s_controls;
    self.m_data = data;
    self.m_data.moneyId = self.m_data.moneyId or UserPropertyIsolater.getInstance():getPropertySilverCoinID();
	self:findViews();
    SafeBoxDataInterface.getInstance():setObserver(self);
    self:findViewById(self.m_ctrls.maskView):setEventDrag(self,function ()end);
    self:findViewById(self.m_ctrls.bg):setEventTouch(self,function ()end);
end

SaveMoneyToGameView.dtor = function(self)
	SafeBoxDataInterface.getInstance():clearObserver(self);
end

SaveMoneyToGameView.someChangeForGoldBar = function(self)
    self:findViewById(self.m_ctrls.saveMoneyBtn):setVisible(false);
    self:findViewById(self.m_ctrls.goHighRoomBtn):setPos(260,nil);
end

SaveMoneyToGameView.findViews = function(self)
	self.m_desView = self:findViewById(self.m_ctrls.desView);
    local rickStr;
    local tipsStr;
    if self.m_data.moneyId == UserPropertyIsolater.getInstance():getPropertyGoldBarID() then  --金条
        rickStr = string.format("#cA08B62该房间入场金条上限#cFF531E%s", self.m_data.maxMoney or "");
        tipsStr = "您的金条太多啦～去挑战高级场吧！";
    else --银币
        rickStr = string.format("#cA08B62该房间入场银币上限#cFF531E%s", self.m_data.maxMoney or "");
        tipsStr = "您的银币太多啦～去挑战高级场吧！";
	end
    local richText = new(RichText, rickStr, w, h, kAlignCenter, nil, 24);
	richText:setAlign(kAlignCenter);
	self.m_desView:addChild(richText);
    self:findViewById(self.m_ctrls.tips):setText(tipsStr)
end

SaveMoneyToGameView.onMaskViewClick = function (self,finger_action)
    if finger_action == kFingerUp then
        self:hide();
    end
end

SaveMoneyToGameView.onCloseClick = function (self)
   self:hide();
end


SaveMoneyToGameView.onSaveMoneyClick = function (self)
    SafeBoxDataInterface.getInstance():updateSafeBox(1, self.m_data.saveMoney, self.m_data.moneyId);
end

SaveMoneyToGameView.onUpdateSafeBoxCallBack = function(self, isSuccess, info)
    if isSuccess then
        EventDispatcher.getInstance():dispatch(HallController.s_eventGoToGameDirect, self.m_data, true, self.m_data.gameExtParam);
    else
        Toast.getInstance():showText("存款失败", 50,30,kAlginCenter,"",24,255,255,255);
    end
end

SaveMoneyToGameView.onGoHigthRoomClick = function (self)
    local money = kUserInfoData:getMoneyById(self.m_data.moneyId);
    local canPlaylevelId = kGameManager:getPlayableLevelIdByLoginMoney(self.m_data.id,money,self.m_data.levelId);
    if canPlaylevelId ~= -1 then
        self.m_data.levelId = canPlaylevelId;
        EventDispatcher.getInstance():dispatch(HallController.s_eventGoToGameDirect, self.m_data, true, self.m_data.gameExtParam);
    end

end

SaveMoneyToGameView.s_controlConfig = 
{
	[SaveMoneyToGameView.s_controls.maskView] = {"maskView"};
	[SaveMoneyToGameView.s_controls.closeBtn] = {"bg","closeBtn"};
	[SaveMoneyToGameView.s_controls.saveMoneyBtn] = {"bg","saveMoneyBtn"};
    [SaveMoneyToGameView.s_controls.goHighRoomBtn] = {"bg","goHighRoomBtn"};
    [SaveMoneyToGameView.s_controls.desView] = {"bg","desView"};
    [SaveMoneyToGameView.s_controls.tips] = {"bg","tips"};
    [SaveMoneyToGameView.s_controls.bg] = {"bg"};
    
};

SaveMoneyToGameView.s_controlFuncMap = 
{
	[SaveMoneyToGameView.s_controls.maskView] = SaveMoneyToGameView.onMaskViewClick;
	[SaveMoneyToGameView.s_controls.closeBtn] = SaveMoneyToGameView.onCloseClick;
    [SaveMoneyToGameView.s_controls.saveMoneyBtn] = SaveMoneyToGameView.onSaveMoneyClick;
    [SaveMoneyToGameView.s_controls.goHighRoomBtn] = SaveMoneyToGameView.onGoHigthRoomClick;
}

return SaveMoneyToGameView;