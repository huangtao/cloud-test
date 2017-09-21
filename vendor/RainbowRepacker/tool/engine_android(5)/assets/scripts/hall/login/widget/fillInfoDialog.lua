local BaseLoginDialog = require("hall/login/widget/baseLoginDialog");
local login_fillInfo = require("view/kScreen_1280_800/hall/login/login_fillInfo");
require("common/uiFactory");
require("hall/animation/animDropMoneyPar");
require("core/eventDispatcher");
require("hall/login/data/registerDataInterface");
require("util/NumberLib");

--------------------------------------------------------------------------------------------------
local login_avatar_item = require("view/kScreen_1280_800/hall/login/login_avatar_item");
require("ui/node");
require("util/ImageCache");

local AvatarItem = class(Node);

AvatarItem.s_onClickEvent = EventDispatcher.getInstance():getUserEvent();
AvatarItem.ctor = function(self,data)
	EventDispatcher.getInstance():register(AvatarItem.s_onClickEvent,self,self._onItemClick);

	self.m_root = SceneLoader.load(login_avatar_item);
	local w, h = self.m_root:getSize();
	self:setSize(w, h);	
	self:addChild(self.m_root);

	self.m_data = data;

	self.m_url = string.trim(data.url or "");
	if self.m_url ~= "" then 
		ImageCache.getInstance():request(self.m_url,self,self._onDownloadAvatar);
	end 
	self.m_root:getChildByName("selected"):setVisible(data.isSelected);
end

AvatarItem.dtor = function(self)
	EventDispatcher.getInstance():unregister(AvatarItem.s_onClickEvent,self,self._onItemClick);
	ImageCache.getInstance():cleanRef(self);
end

AvatarItem._onItemClick = function(self,data)
	local isSelected = data.index == self.m_data.index; 
	self.m_data.isSelected = isSelected;
	self.m_root:getChildByName("selected"):setVisible(isSelected);
end


AvatarItem._onDownloadAvatar = function(self,url,imagePath)
	if not string.isEmpty(imagePath) then
		local avatar = self.m_root:getChildByName("avatar");
		avatar:setFile(imagePath); 
	end
end

AvatarItem.getData = function(self)
	return self.m_data;
end

--完善资料
local FillInfoDialog = class(BaseLoginDialog,false);

local h_index = 0;
local getIndex = function(self)
	h_index = h_index + 1;
	return h_index;
end
FillInfoDialog.s_controls = 
{
	closeBtn = getIndex();
	bg = getIndex();
	maskView = getIndex();

	title = getIndex();
	avatarsView = getIndex();
	nickEdit = getIndex();
	confirmBtn = getIndex();
};

FillInfoDialog.ctor = function(self)	
	super(self,login_fillInfo);
	self.m_ctrls = FillInfoDialog.s_controls;
	RegisterDataInterface.getInstance():setObserver(self);

	self:_init();
end

FillInfoDialog.dtor = function(self)	
	RegisterDataInterface.getInstance():clearObserver(self);
end

---------------------------------------------------------------------
----------------- Button event response functions -------------------
---------------------------------------------------------------------
FillInfoDialog.onCloseClick = function(self)
	FillInfoDialog.hide();
	
	NativeEvent.getInstance():HideLoadingDialog();
	NativeEvent.getInstance():ShowLoadingDialog("登录中");
	LoginLogic.getInstance():requestAutoLogin();
end

FillInfoDialog.onConfirmClick = function(self)	 
	local nick = string.trim(self:findViewById(self.m_ctrls.nickEdit):getText());
	if nick == nil or nick == "" or (not self.m_selectedIndex) then 

		Toast.getInstance():showText("请完善个人信息后再提交", 50, 30, kAlignCenter,"",24,200, 175, 115);
		return;
	end 
    nick = ToolKit.utf8_substring(nick,1,12)
	RegisterDataInterface.getInstance():requestFillInfo(nick,self.m_selectedIndex);
end

FillInfoDialog.onBgClick = function(self)
end

FillInfoDialog.onMaskTouch = function(self , finger_action , x , y, drawing_id_first , drawing_id_current)
end
---------------------------------------------------------------------
FillInfoDialog.onGetFillInfoConfigCallBack = function(self,isSuccess,info)
	if isSuccess then 
		self:_refreshFillConfig(info);
	end 
end

FillInfoDialog.onFillInfoCallBack = function(self,isSuccess,info)
	if isSuccess then
		Toast.getInstance():showText("设置成功", 50, 30, kAlignCenter,"",24,200, 175, 115);
		AnimManager.getInstance():playAnim(AnimIds.MoneyDropPar, 100);
		self:onCloseClick();
	else 
		info = table.verify(info);
		local flag = number.valueOf(info.flag);
		if flag == -1 then -- 已经获得过该奖励
			self:onCloseClick();
		else 
			Toast.getInstance():showText("设置失败，请稍后再试", 50, 30, kAlignCenter,"",24,200, 175, 115);
		end 
	end 
end
---------------------------------------------------------------------
FillInfoDialog._init = function(self)
	local fillInfoConfig = RegisterDataInterface.getInstance():getFillInfoConfig();
	if not table.isEmpty(fillInfoConfig) then 
		self:_refreshFillConfig(fillInfoConfig);
	end
	
	local nick = kUserInfoData:getNickname();
	local nickEdit = self:findViewById(self.m_ctrls.nickEdit);
	nickEdit:setHintText("输入昵称",215,171,127);
	nickEdit:setText(nick);
    self.m_selectedIndex = 1;
    self.m_nickname = nick or "";
end


FillInfoDialog.onNickEdit = function (self)
    local nickEdit = self:findViewById(self.m_ctrls.nickEdit);
	local str = nickEdit:getText();
    local resultStr,count = ToolKit.utf8_substring(str,1,12);

	local tips = "";
	local flag = false;
	if string.find(resultStr," ") then
		tips = GameString.get("loginNickFormatEmptyError");
		resultStr = self.m_nickname;
	elseif count < 3 or (count >= 12 and str ~= resultStr) then 
 		tips = GameString.get("loginNickFormatError");
		resultStr = self.m_nickname;
	else
		flag = true;
 	end
 	if not flag then
 		if tips and tips ~= "" then 
		    Toast.getInstance():showText(tips,50,30,kAlginLeft,"", (fontSize or 24),255,255,255);
	    end 
    end
    nickEdit:setText(resultStr);
end

FillInfoDialog._refreshFillConfig = function(self,info)
	info = table.verify(info);

	local avatarsList = {};
	local size = number.valueOf(info.size);

	for i = 1,size do 
		local temp = {};
		temp.index = i;
		local prefix_url = info.prefix_url or "";--头像前缀url
	    local file_suffix = info.file_suffix or "";--图片后缀地址
	    temp.url = string.format("%s%s%s",prefix_url,i,file_suffix);
	    temp.isSelected = self.m_selectedIndex == i;

	    table.insert(avatarsList,temp);
	end 

	self:_refreshFillReward(number.valueOf(info.award));
	self:_refreshAvatars(avatarsList);
end

FillInfoDialog._refreshFillReward = function(self,reward)
	local title = self:findViewById(self.m_ctrls.title);
	title:setText(string.format("完善个人信息,获取%s银币",reward));
end

FillInfoDialog._refreshAvatars = function(self,avatarsList)
	avatarsList = table.verify(avatarsList);

	local avatarsView = self:findViewById(self.m_ctrls.avatarsView);
	if #avatarsList > 0 then
		-- local data = {};
		-- for k,v in pairs(avatarsList) do 
		-- 	local temp = {};
		-- 	temp.url = v;
		-- 	temp.isSelected = false;
		-- 	table.insert(data,temp);
		-- end 

		-- if self.m_selectedIndex and data[self.m_selectedIndex] then 
		-- 	data[self.m_selectedIndex].isSelected = true;
		-- 	self.m_selectedUrl = data[self.m_selectedIndex].url;
		-- end 

		if not self.m_adapter then 
			self.m_adapter = UIFactory.createCacheAdapter(AvatarItem,avatarsList);
			
			local w,h = avatarsView:getSize();
			local iconsGrid = UIFactory.createGridView(0,0, w, h);
			iconsGrid:setAdapter(self.m_adapter);
			iconsGrid:setOnItemClick(self,self._onAvatarItemClick);
			avatarsView:addChild(iconsGrid);
		else 
			self.m_adapter:changeData(avatarsList);
		end
	end 
	avatarsView:setVisible(#avatarsList > 0);

	self.m_avatarsList = avatarsList;
end

FillInfoDialog._onAvatarItemClick = function(self,adapter,view,index,viewX,viewY)
	local data = view:getData();	
	self.m_selectedIndex = data.index;
	-- self.m_selectedUrl = data.url;
	EventDispatcher.getInstance():dispatch(AvatarItem.s_onClickEvent,data);
end
----------------------------------全     局-----------------------------------------------
FillInfoDialog.show = function( ... )		
	FillInfoDialog.hide(true);
	FillInfoDialog.s_instance = new(FillInfoDialog , ... );
	FillInfoDialog.s_instance:addToRoot();
	FillInfoDialog.s_instance:setFillParent(true,true);
	return FillInfoDialog.s_instance;
end

FillInfoDialog.hide = function()	
	delete(FillInfoDialog.s_instance);
	FillInfoDialog.s_instance = nil;
end

FillInfoDialog.s_controlConfig = 
{	
	[FillInfoDialog.s_controls.closeBtn] = {"contentView","closeBtn"};	
	[FillInfoDialog.s_controls.bg] = {"contentView","bg"};
	[FillInfoDialog.s_controls.maskView] = {"shiled"};	

	[FillInfoDialog.s_controls.title] = {"contentView","titleBg","title"};
	[FillInfoDialog.s_controls.avatarsView] = {"contentView","avatarsView"};
	[FillInfoDialog.s_controls.nickEdit] = {"contentView","nickView","nickBg","nickEdit"};
	[FillInfoDialog.s_controls.confirmBtn] = {"contentView","nickView","confirmBtn"};
};


FillInfoDialog.s_controlFuncMap =
{
	[FillInfoDialog.s_controls.closeBtn] = FillInfoDialog.onCloseClick;
	[FillInfoDialog.s_controls.bg] = FillInfoDialog.onBgClick;
	[FillInfoDialog.s_controls.maskView] = FillInfoDialog.onMaskTouch;
	[FillInfoDialog.s_controls.confirmBtn] = FillInfoDialog.onConfirmClick;
    [FillInfoDialog.s_controls.nickEdit] = FillInfoDialog.onNickEdit;
};

return FillInfoDialog