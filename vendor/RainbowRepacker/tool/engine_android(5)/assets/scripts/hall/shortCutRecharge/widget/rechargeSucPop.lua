local rechargeSucPopLayout = require(ViewPath .. "hall/shortCutRecharge/rechargeSucPopLayout");

RechargeSucPop = class();

RechargeSucPop.show = function(data)
    if not kGameManager:isInRoom() then
        if LoginDataInterface.getInstance():getLastUType() == LoginConstants.uType.Guest then
            local param = {content = data.topTips};
            IBaseDialog.pushDialog(new(require("hall/login/widget/registerBindingGuide"),LoginConstants.eBindingGuideType.RECHARGE_SUCCESS, param));
            return;
        end
    end
    RechargeSucPop.hide();
    RechargeSucPop.s_win = new(RechargeSucWin,data);
end

RechargeSucPop.hide = function()
  delete(RechargeSucPop.s_win);
  RechargeSucPop.s_win = nil;
end

RechargeSucWin = class()

--房间内用户的头像控制
RechargeSucWin = class(CommonGameLayer,false);
RechargeSucWin.s_controls = 
{ 
   mask = 1;
   topTips = 2;
   rightTipsTitle = 3;
   rightTipsContent = 4;
   btnJion = 5;
   closeBtn = 6;
   ad = 7;
   bg = 8;
   title = 9;
   confirmBtn = 10;
   adView = 11;
   top_tips_bg = 12;
};

RechargeSucWin.ctor = function(self,data) 
    super(self,rechargeSucPopLayout);
    self:setFillParent(true,true);
    self:addToRoot();
    self:setLevel(100);
    self.m_ctrl = RechargeSucWin.s_controls;
    self.m_topTips = self:findViewById(self.m_ctrl.topTips);
    self.m_rightTipsContent = self:findViewById(self.m_ctrl.rightTipsContent);
    self.m_rightTipsTitle = self:findViewById(self.m_ctrl.rightTipsTitle);
    self.m_ad = self:findViewById(self.m_ctrl.ad);
    self.m_joinBtn = self:findViewById(self.m_ctrl.btnJion);
    self.m_confirmBtn = self:findViewById(self.m_ctrl.confirmBtn);
    self.m_adView = self:findViewById(self.m_ctrl.adView);
    self.m_title = self:findViewById(self.m_ctrl.title);
    self.m_bg = self:findViewById(self.m_ctrl.bg);
    self.m_top_tips_bg = self:findViewById(self.m_ctrl.top_tips_bg);
    self:findViewById(self.m_ctrl.mask):setEventDrag(self, function()
    end);

    self.m_data = data;
    local title = string.isEmpty(data.title) and "恭喜您充值成功" or data.title;
    local jumpInfo = table.verify(json.decode(self.m_data.jumpcode));
    local cmd = number.valueOf(jumpInfo.cmd);
    local tmp = true;--由于新后台跳转有问题，暂时只展示充值成功后描述，1000版本会有个需求根据配置展示。
    local r,g,b;
    local w,h;
    if string.isEmpty(data.adUrl) or tmp then 
        self.m_confirmBtn:setVisible(true);
        self.m_adView:setVisible(false);
        self.m_top_tips_bg:setPos(nil,-20);
        self.m_top_tips_bg:setAlign(kAlignCenter);
        self.m_bg:setSize(720, 410);
        title = "充值成功";
        r,g,b = 235,73,41;
        w,h = 630,170;
    else
        self.m_bg:setSize(908,620);
        self.m_top_tips_bg:setPos(nil,80);
        self.m_adView:setVisible(true);
        self.m_confirmBtn:setVisible(false);
        if cmd == 0 then 
          self.m_joinBtn:setVisible(false);
        end
        self.m_rightTipsTitle:setText(data.rightTitle);
        self.m_rightTipsContent:setText(data.rightContent);
        ImageCache.getInstance():request(data.adUrl, self, self.onUpdateAdImage);
        r,g,b = 112,78,18;
        w,h = 740,72;
    end
    self.m_topTips:setSize(w, h);
    self.m_topTips:setText(data.topTips,nil,nil,r,g,b);
    self.m_title:setText(title);
    IPopDialogManager.getInstance():addPopDialog(self, 100, RechargeSucPop.hide);
end 

RechargeSucWin.onUpdateAdImage = function(self, url, imagePath)
  if not url or not imagePath then
      return;
  end

  if self.m_ad then 
     self.m_ad:setFile(imagePath);
  end 
end

RechargeSucWin.dtor = function(self)
  self:removeAllChildren();
  ImageCache.getInstance():cleanRef(self);
  IPopDialogManager.getInstance():removePopDialog(self);
end 

RechargeSucWin.onJionClick = function(self)
  local jumpInfo = table.verify(json.decode(self.m_data.jumpcode));
  self:setVisible(false);
  RechargeSucPop.hide();
  if not kGameManager:isInRoom() then
     local onlyExecuteInHall = CommonJumpLogic.getInstance():executeJsCall(jumpInfo);
     if onlyExecuteInHall then
        StateMachine.getInstance():changeState(States.Hall);
     end
  end
end

RechargeSucWin.onBgTouch = function(self ,finger_action,x,y,drawing_id_first,drawing_id_current)
  if finger_action == kFingerDown then 
  elseif finger_action == kFingerMove then
  else
    if drawing_id_first == drawing_id_current then
      RechargeSucPop.hide();
    end
  end
end

RechargeSucWin.onClose = function(self)
  RechargeSucPop.hide();
end

RechargeSucWin.onConfirmBtnClick = function (self)
    RechargeSucPop.hide();
end

RechargeSucWin.onEnptyFunc = function(self)
end

RechargeSucWin.s_controlConfig =
{   
    [RechargeSucWin.s_controls.mask] = {"mask"};
    [RechargeSucWin.s_controls.title] = {"bg", "titleBg", "title"};
    [RechargeSucWin.s_controls.top_tips_bg] = {"bg","top_tips_bg"};
    [RechargeSucWin.s_controls.topTips] = {"bg","top_tips_bg","top_tips"};
    [RechargeSucWin.s_controls.rightTipsTitle] = {"bg","adView","right_tips_bg","right_tips_title"};
    [RechargeSucWin.s_controls.rightTipsContent] = {"bg","adView","right_tips_bg","right_tips_content"};
    [RechargeSucWin.s_controls.btnJion] = {"bg","adView","right_tips_bg","btn_join"};
    [RechargeSucWin.s_controls.closeBtn] = {"bg","closeBtn"},
    [RechargeSucWin.s_controls.ad] = {"bg","adView","ad_image"},
    [RechargeSucWin.s_controls.bg] = {"bg"},
    [RechargeSucWin.s_controls.confirmBtn] = {"bg","confirmBtn"},
    [RechargeSucWin.s_controls.adView] = {"bg","adView"},
};

RechargeSucWin.s_controlFuncMap =
{
  [RechargeSucWin.s_controls.closeBtn] = RechargeSucWin.onClose;
  [RechargeSucWin.s_controls.btnJion] = RechargeSucWin.onJionClick;
  [RechargeSucWin.s_controls.mask] = RechargeSucWin.onBgTouch;
  [RechargeSucWin.s_controls.bg] = RechargeSucWin.onEnptyFunc;
  [RechargeSucWin.s_controls.confirmBtn] = RechargeSucWin.onConfirmBtnClick;
};


