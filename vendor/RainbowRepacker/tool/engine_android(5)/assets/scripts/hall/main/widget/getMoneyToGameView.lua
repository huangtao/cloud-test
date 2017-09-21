require("common/IBaseDialog");
require("uilibs/richText");

local getMoneyToGameView = require(HallViewPath.."main/getMoneyToGameView");

local GetMoneyToGameView = class(IBaseDialog,false);
local h_index = 0;
local getIndex = function(self)
    h_index = h_index + 1;
    return h_index;
end

GetMoneyToGameView.s_controls = 
{
	maskView = getIndex();
    closeBtn = getIndex();
    getMoneyBtn = getIndex();
    desView = getIndex();
    bg = getIndex();
    tipsText =getIndex();
};

GetMoneyToGameView.ctor = function(self,data)
	super(self,getMoneyToGameView);
	self.m_ctrls = GetMoneyToGameView.s_controls;
    self.m_data = data;
	self:findViews();
    SafeBoxDataInterface.getInstance():setObserver(self);
    self:findViewById(self.m_ctrls.maskView):setEventDrag(self,function ()end);
    self:findViewById(self.m_ctrls.bg):setEventTouch(self,function ()end);
end

GetMoneyToGameView.dtor = function(self)
	SafeBoxDataInterface.getInstance():clearObserver(self)
end

GetMoneyToGameView.findViews = function(self)
	self.m_desView = self:findViewById(self.m_ctrls.desView);
    local currency = ((self.m_data.moneyId == 0) and "银币" or "金条")
    local str = "";
    if self.m_data.msg then
        str = "#c8F5c1F"..self.m_data.msg;
    else
        str = string.format("#c8F5c1F进入该房间还需要取出#cF65814%s#c8F5C1F%s", self.m_data.getMoney, currency)
    end
	local richText = new(RichText, str, w, h, kAlignCenter, nil, 36);
	richText:setAlign(kAlignCenter);
	self.m_desView:addChild(richText);

    local tips = string.format("土豪，你的保险箱里有大把%s！", currency)
    self:findViewById(self.m_ctrls.tipsText):setText(tips)
end

GetMoneyToGameView.onCloseClick = function (self)
    self:hide();
end

GetMoneyToGameView.onMaskViewClick = function (self,finger_action)
    if finger_action == kFingerUp then
        self:hide();
    end
end

GetMoneyToGameView.onUpdateSafeBoxCallBack = function(self, isSuccess, info)
    if isSuccess then
        self:hide();
        if self.m_data.callFunc then 
            self.m_data.callFunc(self.m_data.callObj);
        else
            EventDispatcher.getInstance():dispatch(HallController.s_eventGoToGameDirect, self.m_data, true, self.m_data.gameExtParam);
        end 
    else
        Toast.getInstance():showText("取款失败", 50,30,kAlginCenter,"",24,255,255,255);
    end
end

GetMoneyToGameView.onGetMoneyClick = function (self)
    --友盟统计
    if self.m_data and self.m_data.id and self.m_data.levelId then
        UBReport.getInstance():report(UBConfig.kHallSafeBoxGetMoneyBtns, string.format("id%s_levelId%s", self.m_data.id, self.m_data.levelId));
    end
    SafeBoxDataInterface.getInstance():updateSafeBox(2, self.m_data.getMoney, self.m_data.moneyId);
end

GetMoneyToGameView.s_controlConfig = 
{
	[GetMoneyToGameView.s_controls.maskView] = {"maskView"};
	[GetMoneyToGameView.s_controls.closeBtn] = {"bg","closeBtn"};
	[GetMoneyToGameView.s_controls.getMoneyBtn] = {"bg","getMoneyBtn"};
    [GetMoneyToGameView.s_controls.desView] = {"bg","desView"};
    [GetMoneyToGameView.s_controls.tipsText] = {"bg","tipsText"};
    [GetMoneyToGameView.s_controls.bg] = {"bg"};
};

GetMoneyToGameView.s_controlFuncMap = 
{
	[GetMoneyToGameView.s_controls.maskView] = GetMoneyToGameView.onMaskViewClick;
	[GetMoneyToGameView.s_controls.closeBtn] = GetMoneyToGameView.onCloseClick;
    [GetMoneyToGameView.s_controls.getMoneyBtn] = GetMoneyToGameView.onGetMoneyClick;
}

return GetMoneyToGameView;