
local match_invite_friends_layout = require("view/kScreen_1280_800/games/common2/match/match_invite_friends_layout");
local match_invite_friends_listItem = require("view/kScreen_1280_800/games/common2/match/match_invite_friends_listItem");

MatchInviteFriendsView = class(IBaseDialog,false);

MatchInviteFriendsView.s_viewConfigLayer = match_invite_friends_layout;
MatchInviteFriendsView.s_viewConfigItem = match_invite_friends_listItem;

MatchInviteFriendsView.s_controls = 
{ 
    maskBg = 2;
    contentList = 3;
    confirmBtn = 5;
    contentEmpty = 7;
    tips = 8;
    contentBg = 9;
};
MatchInviteFriendsView.ctor = function(self) 
  super(self, MatchInviteFriendsView.s_viewConfigLayer);
  self.m_ctrls = MatchInviteFriendsView.s_controls;
  
  self:setFillParent(true,true);  
  
  MatchInviteFriendsView.selectedList = {};

  self:_initViews();
end

MatchInviteFriendsView._initViews = function(self)
  self.m_contentList =  self:findViewById(MatchInviteFriendsView.s_controls.contentList);
  self.m_contentEmpty =  self:findViewById(MatchInviteFriendsView.s_controls.contentEmpty);
  self.m_tips = self:findViewById(MatchInviteFriendsView.s_controls.tips);
  self.m_confirmBtn = self:findViewById(MatchInviteFriendsView.s_controls.confirmBtn); 
  self.m_bg = self:findViewById(MatchInviteFriendsView.s_controls.contentBg);

  self.m_contentList:setVisible(false);
  self.m_confirmBtn:setVisible(false);
  self.m_contentEmpty:setVisible(false);
end

MatchInviteFriendsView.setContentPos = function(self, x, y)
  local width, height = self.m_bg:getSize();
  local localX = x and x - width / 2 or nil;
  local localY = y and y - height or nil;
  self.m_bg:setAlign(kAlignTopLeft);
  self.m_bg:setPos(localX, localY);
end

MatchInviteFriendsView.setContentSize = function(self, w, h)
  self.m_bg:setSize(w, h);
end

MatchInviteFriendsView.dtor = function(self)
  self.m_isShowing = false;
end

MatchInviteFriendsView.isShowing = function(self)
    return self.m_isShowing;
end

MatchInviteFriendsView.showDialog = function(self)
    self.m_isShowing = true;
    IBaseDialog.pushDialog(self);
end

MatchInviteFriendsView.hideDialog = function(self)
    self.m_isShowing = false;
    IBaseDialog.hide();
end

MatchInviteFriendsView.setViewConfigLayer = function(viewConfigLayer)
  MatchInviteFriendsView.s_viewConfigLayer = viewConfigLayer or match_invite_friends_layout;
end

MatchInviteFriendsView.setViewConfigItem = function(viewConfigItem)
  MatchInviteFriendsView.s_viewConfigItem = viewConfigItem or match_invite_friends_listItem;
end


MatchInviteFriendsView.setData = function(self,data)
  self.m_data = data;
  if not self.m_data or (#self.m_data == 0) then 
    self.m_contentList:setVisible(false);
    self.m_confirmBtn:setVisible(true);
    self.m_contentEmpty:setVisible(true);

    self.m_confirmBtn:setOnClick(self, self.release);
  else
    local adapter = new(Adapter,MatchInviteListItem,data);
    self.m_contentList:setAdapter(adapter);
    self.m_contentList:setVisible(true);
    self.m_confirmBtn:setVisible(true);
    self.m_contentEmpty:setVisible(false);
  end 
end

MatchInviteFriendsView.setCallBack = function (self,obj,callbackFun)
   self.obj = obj;
   self.callbackFun = callbackFun;
end 

MatchInviteFriendsView.onConfirm = function(self)  
  if self.obj then 
    if self.callbackFun then 
      self.callbackFun(self.obj,MatchInviteFriendsView.selectedList);
    end 
  end 
  self:release();
end

MatchInviteFriendsView.release = function(self)
  self:hideDialog();
end

MatchInviteFriendsView.onBgTouch = function(self )
  self:release();
end

MatchInviteFriendsView.s_controlConfig =
{   
  [MatchInviteFriendsView.s_controls.maskBg] = {"maskBg"};  
  [MatchInviteFriendsView.s_controls.contentList] = {"bg","contentBg","contentList"};  
  [MatchInviteFriendsView.s_controls.contentEmpty] = {"bg","contentEmpty"}; 
  [MatchInviteFriendsView.s_controls.confirmBtn] = {"bg","confirmBtn"};
  [MatchInviteFriendsView.s_controls.tips] = {"bg","contentList","tips"}; 
  [MatchInviteFriendsView.s_controls.contentBg] = {"bg"}; 
};

MatchInviteFriendsView.s_controlFuncMap =
{
  [MatchInviteFriendsView.s_controls.maskBg] = MatchInviteFriendsView.onBgTouch;
  [MatchInviteFriendsView.s_controls.confirmBtn] = MatchInviteFriendsView.onConfirm;   
};


MatchInviteListItem = class(CommonGameLayer,false);
MatchInviteListItem.s_onClickEvent = EventDispatcher.getInstance():getUserEvent();
MatchInviteListItem.s_controls = 
{ 
    selectedImg = 1;
    name = 2;
    clickCover = 3;
    normalImg = 4;
};

MatchInviteListItem.ctor = function(self,data) 
    super(self, MatchInviteFriendsView.s_viewConfigItem);
    self:setSize(350,62);
    self:setFillParent(true,false);
    self.m_ctrl = MatchInviteListItem.s_controls;
    self.m_name = self:findViewById(self.m_ctrl.name);
   
    self.m_selectedImg = self:findViewById(self.m_ctrl.selectedImg);
    self.m_normalImg = self:findViewById(self.m_ctrl.normalImg);
    
    self:checkState(false);

    self.m_data = data;
    if data then 
      local userId = data.cid or "";
      local nick = (data.nick or "");
      self.m_name:setText(nick, 1);   
    end 
end 

MatchInviteListItem.dtor = function(self)
end

MatchInviteListItem.onItemClick = function(self )
  if self.m_check then 
     self:checkState(false);

     self.m_check = false;
     ---从选择列表中删除
     local list = {};
     for k,v in pairs(MatchInviteFriendsView.selectedList) do
       if v~=self.m_data.cid then 
         table.insert(list,v);
       end 
     end
     MatchInviteFriendsView.selectedList = list;
  else 
     self:checkState(true);
     self.m_check = true;
     ---加入到选择列表中
      table.insert(MatchInviteFriendsView.selectedList,self.m_data.cid);  
  end 
  Log.d("self.m_data",self.m_data)
  Log.d("MatchInviteFriendsView.selectedList",MatchInviteFriendsView.selectedList)
end

MatchInviteListItem.checkState = function(self, selected)
  self.m_selectedImg:setVisible(selected);
  self.m_normalImg:setVisible(not selected);
end

MatchInviteListItem.s_controlConfig =
{   
  [MatchInviteListItem.s_controls.name] = {"name"};
  [MatchInviteListItem.s_controls.normalImg] = {"normal"};
  [MatchInviteListItem.s_controls.selectedImg] = {"selected"};
  [MatchInviteListItem.s_controls.clickCover] = {"clickCover"};   
};

MatchInviteListItem.s_controlFuncMap =
{
    [MatchInviteListItem.s_controls.clickCover] = MatchInviteListItem.onItemClick; 
};