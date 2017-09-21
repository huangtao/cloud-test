local login_registerBindingGuide = require(HallViewPath.."login/login_registerBindingGuide")
require("common/IBaseDialog")
require("uilibs/richText");

local RegisterBindingGuide = class(IBaseDialog, false)

RegisterBindingGuide.s_controls = 
{
	closeBtn = 1,
	bindingBtn = 2,
    title = 3,
    centerView = 4,
    titleBg = 5;
}

RegisterBindingGuide.ebindingGuideType = {
    [1] = {{"绑定手机"},{"hall/common/popupWindow/popupWindow_title.png"},{"#c8F5C1F您的资金已经很多了哦","#c8F5C1F为了您的资金安全，请尽快#c359953注册绑定手机号","#c8F5C1F绑定之后可立即获得#cF26D0B%s银币"}}; --银币≥5W或者金条≥500
    [2] = {{"充值成功"},{"hall/common/popupWindow/popupWindow_Redtitle.png"},{"#c8F5C1F您的账号安全等级为：#cF26D0B低","#c8F5C1F为了您的资金安全，请尽快#c359953注册绑定手机号"}};--vip充值回调
    [3] = {{"绑定手机"},{"hall/common/popupWindow/popupWindow_title.png"},{"#c359953注册绑定手机号#c8F5C1F之后，才可以发送世界喇叭哦","#c8F5C1F绑定之后可立即获得#cF26D0B%s银币"}};--发送喇叭
    [4] = {{"绑定手机"},{"hall/common/popupWindow/popupWindow_title.png"},{"#cF26D0B手机号#c8F5C1F是领取奖品的唯一方式","#c8F5C1F请#c359953注册绑定手机号#c8F5C1F之后，进行奖品兑换"}};--兑换
    [5] = {{"温馨提示"},{"hall/common/popupWindow/popupWindow_title.png"},{"#cF26D0B注册绑定后即可创建邀请赛"}};--邀请赛
}

RegisterBindingGuide.ctor = function(self, bindingGuideType, data)	
	super(self,login_registerBindingGuide);
    self:setSize(self.m_root:getSize());
    self:setFillParent(true, true);
    self.m_data = data;
    self.m_bindingGuideType = bindingGuideType;
    self.m_ctrl = RegisterBindingGuide.s_controls;

    TaskRewardDataInterface.getInstance():setObserver(self);

    self:__initViews();
    self:__setContent();
    self:setEventTouch(self,function ()end);
    self:setEventDrag(self,function ()end);
end

RegisterBindingGuide.dtor = function(self)	
	self:removeAllChildren();

    TaskRewardDataInterface.getInstance():clearObserver(self);
end

RegisterBindingGuide.onGetDayTaskListCallBack = function(self, isSuccess, tasklist)
    self:__setContent();
end

RegisterBindingGuide.__initViews = function (self)
    self.m_title = self:findViewById(self.m_ctrl.title);
    self.m_centerView = self:findViewById(self.m_ctrl.centerView);
    self.m_titleBg = self:findViewById(self.m_ctrl.titleBg);
end

RegisterBindingGuide.__setContent = function (self)
    if not self.m_bindingGuideType then
        return;
    end
    
    self.m_centerView:removeAllChildren();
    local index = 1;
    if not table.isEmpty(self.m_data) and self.m_data.content then
        local text = new(RichText, "#c8F5C1F"..ToolKit.subString(string.valueOf(self.m_data.content),80), 528, 52, kAlignLeft, nil, 26,nil,nil,nil,true);
        self.m_centerView:addChild(text);
        text:setAlign(kAlignTopLeft);
        local y = text.m_curIndex > 1 and 35 or 50;
        text:setPos(78, y);
        index = text.m_curIndex;
    end
    local coinRewardNum = TaskRewardDataInterface.getInstance():getRewardNumByjumpCode(CommonJumpCmds.GOTO_REGISTER_ACCOUNT);
    local title = not table.isEmpty(self.m_data) and self.m_data.title or RegisterBindingGuide.ebindingGuideType[self.m_bindingGuideType][1][1];
    self.m_title:setText(title);
    self.m_titleBg:setFile(RegisterBindingGuide.ebindingGuideType[self.m_bindingGuideType][2][1]);
    local tmpy  = self:__getStartY(RegisterBindingGuide.ebindingGuideType[self.m_bindingGuideType][3],coinRewardNum,index);
    for k, v in ipairs(table.verify(RegisterBindingGuide.ebindingGuideType[self.m_bindingGuideType][3])) do
        if v then
            local str = string.format(v, coinRewardNum);
            self.m_richText = new(RichText, str, w, h, kAlignLeft, nil, 26, nil, nil, nil);
	        self.m_richText:setAlign(kAlignLeft);
	        self.m_centerView:addChild(self.m_richText);
            self.m_richText:setPos(78,(k-1)*45 + tmpy);
            if coinRewardNum == 0 and k == #RegisterBindingGuide.ebindingGuideType[self.m_bindingGuideType][3]
                and (self.m_bindingGuideType == LoginConstants.eBindingGuideType.SEND_WORLD_SUONA 
                or self.m_bindingGuideType == LoginConstants.eBindingGuideType.MORE_COIN_OR_GOLD) then
                    self.m_richText:setVisible(false);
            end
        end
    end
end

RegisterBindingGuide.__getStartY = function (self, data, coinRewardNum, index)
   local y = 0;
   local len = #data;
   if self.m_bindingGuideType == LoginConstants.eBindingGuideType.RECHARGE_SUCCESS then
        if index == 1 then
            y = 2;
        elseif index == 2 then
            y = 10;
        end
   elseif self.m_bindingGuideType == LoginConstants.eBindingGuideType.MORE_COIN_OR_GOLD then 
       if coinRewardNum == 0 then
           y = -22;
       else
           y = -44; 
       end 
   else
       y = (1-len)*22 ;
   end
   return y;
end

RegisterBindingGuide.setRichTextPos = function(self, x, y)
    self.m_richText:setPos(x, y)
end

RegisterBindingGuide.setRichTextAlign = function(self, align)
    self.m_richText:setAlign(align)
end

RegisterBindingGuide.onCloseClick = function(self)
    self:hide();
end

RegisterBindingGuide.onBindingClick = function(self)
	self:hide();
	UBReport.getInstance():report(UBConfig.kHallUserInfoRegistAccount)
	local RegisterAccountDialog = require("hall/login/widget/registerAccountDialog");
	RegisterAccountDialog.show();
end

RegisterBindingGuide.s_controlConfig = 
{	
    [RegisterBindingGuide.s_controls.centerView] = {"contentView", "centerView"},
	[RegisterBindingGuide.s_controls.closeBtn] = {"contentView","closeBtn"},
	[RegisterBindingGuide.s_controls.bindingBtn] = {"contentView","bindingBtn"},
    [RegisterBindingGuide.s_controls.title] = {"contentView","titleBg","title"},
    [RegisterBindingGuide.s_controls.titleBg] = {"contentView","titleBg"},
}

RegisterBindingGuide.s_controlFuncMap =
{
	[RegisterBindingGuide.s_controls.closeBtn] = RegisterBindingGuide.onCloseClick,
	[RegisterBindingGuide.s_controls.bindingBtn] = RegisterBindingGuide.onBindingClick,
}

return RegisterBindingGuide;