local diamondTabItem = require(ViewPath.."hall/diamondShop/diamondTabItem");
require("hall/diamondShop/data/diamondShopTimeHandle");
require("common/commonGameLayer");

local DiamondShopTabItem = class(CommonGameLayer,false);

DiamondShopTabItem.s_onClickEvent = EventDispatcher.getInstance():getUserEvent();

DiamondShopTabItem.s_controls = 
{
	bg = 1;
	choosedBg = 2;
	nameImage = 3;
	hotImage = 4;
	timeText = 5;
};

DiamondShopTabItem.ctor = function(self,data)
	super(self,diamondTabItem);
	Log.v("----DiamondShopTabItem.ctor----",data);
	self.m_ctrl = DiamondShopTabItem.s_controls;
	self.m_data = data;
	self:setSize(self.m_root:getSize());
	-- self:setSize(290,80);
	self:setFillParent(true,false);
	self:_findViews();
	self:_init();
	EventDispatcher.getInstance():register(DiamondShopTabItem.s_onClickEvent,self,self.onItemClick); --直接进入游戏
end

DiamondShopTabItem.dtor = function(self)
	EventDispatcher.getInstance():unregister(DiamondShopTabItem.s_onClickEvent,self,self.onItemClick);
	ImageCache.getInstance():cleanRef(self);
	self.m_data = nil;
end
-----------------------------------------------------------
DiamondShopTabItem._findViews = function(self)
	self.m_bg = self:findViewById(self.m_ctrl.bg);
	self.m_choosedBg = self:findViewById(self.m_ctrl.choosedBg);
	self.m_nameImage = self:findViewById(self.m_ctrl.nameImage);
	-- self.m_nameImage:setSize(134,38);
	self.m_hotImage = self:findViewById(self.m_ctrl.hotImage);
	self.m_timeText = self:findViewById(self.m_ctrl.timeText);
	self.m_hotImage:setVisible(false);
end

---初始化 1.hot标志 2.期限 3.下载所有图片
DiamondShopTabItem._init = function(self)
	self.m_choosedBg:setVisible(tonumber(self.m_data["sort"]) == 1);
	self.m_timeText:setVisible(false);
	if tonumber(self.m_data["sort"]) == 1 and tonumber(self.m_data["begintime"])~=0 then
		self.m_timeText:setVisible(true);
		local beginTime = kDiamondShopTimeHandle.getInstance():changeTime(self.m_data["begintime"]);
		local endTime = kDiamondShopTimeHandle.getInstance():changeTime(self.m_data["endtime"]);
		kDiamondShopTimeHandle.getInstance():setEndTime(self.m_data["endtime"]);
		self.m_timeText:setText(string.concat(beginTime,"-",endTime),10,10,255,255,255);
	end
	--图片的下载
	ImageCache.getInstance():request(self.m_data.event_icon,self,self.onUpdateHotImage);
	
	if not string.isEmpty(self.m_data.unactive_icon) then 
		ImageCache.getInstance():request(self.m_data.unactive_icon,self,self.onUpdateUnActivityImage);
	end

	if not string.isEmpty(self.m_data.active_icon) then 
		ImageCache.getInstance():request(self.m_data.active_icon,self,self.onUpdateActivityImage);
	end 

	if self.m_timeText:getVisible() then 
		self.m_nameImage:setPos(0,-10);
	else 
		self.m_nameImage:setPos(0,0);
	end 
end

--hot图片
DiamondShopTabItem.onUpdateHotImage = function(self,url,imagePath)
	Log.v("------DiamondShopTabItem.onUpdateImage-----------imagePath",imagePath);
	if imagePath then
		self.m_hotImage:setVisible(true);
		self.m_hotImage:setFile(imagePath);
		local w, h = self.m_hotImage.m_res.m_width, self.m_hotImage.m_res.m_height;
		self.m_hotImage:setSize(w, h);
	end
end

DiamondShopTabItem.onUpdateActivityImage = function(self,url,imagePath)
	Log.v("------DiamondShopTabItem.onUpdateImage-----------imagePath",imagePath);
	if imagePath then
		--self.m_hotImage:setFile(imagePath);
		self.m_active_icon  = imagePath;
		if self.m_data and self.m_data["id"] and tonumber(self.m_data["id"]) == 1 then
			self.m_nameImage:setFile(self.m_active_icon);
			self:_adjustActivityImageSize();
		end
	end
end

DiamondShopTabItem.onUpdateUnActivityImage = function(self,url,imagePath)
	Log.v("------DiamondShopTabItem.onUpdateImage-----------imagePath",imagePath);
	if imagePath then
		--self.m_hotImage:setFile(imagePath);
		self.m_unactive_icon = imagePath;
		self.m_nameImage:setFile(self.m_unactive_icon);
		self:_adjustActivityImageSize();
	end
end

DiamondShopTabItem.setOnClickEvent = function(obj,func)
	DiamondShopTabItem.m_obj = obj;
	DiamondShopTabItem.m_func = func;
end

DiamondShopTabItem.onItemClick = function(self,data)
	local str = self.m_timeText:getText();
	if tonumber(data.id) == tonumber(self.m_data.id) then
		--self.m_nameImage:setFile(self.m_active_icon);
		if not self.m_active_icon and data.active_icon then 
			--self.m_nameImage:setFile(self.m_active_icon);
			ImageCache.getInstance():request(data.active_icon,self,self.onUpdateActivityImage);
		end
		if self.m_active_icon then 
			self.m_nameImage:setFile(self.m_active_icon);
			self:_adjustActivityImageSize();
		end
		self.m_choosedBg:setVisible(true);
		self.m_timeText:setText(str,10,10,255,255,255);
		if data.m_isClick and self.m_obj and self.m_func and self.m_data.id then
			self.m_func(self.m_obj,self.m_data.id,self.m_data.showtype);
		end

	else
		if self.m_unactive_icon then 
			self.m_nameImage:setFile(self.m_unactive_icon);
			self:_adjustActivityImageSize();
		end 
		self.m_choosedBg:setVisible(false);
		self.m_timeText:setText(str,10,10,255,255,255);
	end	
end

DiamondShopTabItem._adjustActivityImageSize = function(self)
	if self.m_nameImage then
		local w, h = self.m_nameImage.m_res.m_width, self.m_nameImage.m_res.m_height;
		self.m_nameImage:setSize(w, h);
	end 
end

DiamondShopTabItem.onBgTouch = function(self,finger_action,x,y,drawing_id_first,drawing_id_current)
  if finger_action == kFingerUp then
  	--Log.v("")
    self.m_data.m_isClick = true;
    EventDispatcher.getInstance():dispatch(DiamondShopTabItem.s_onClickEvent,self.m_data);
  end
end

DiamondShopTabItem.s_controlConfig = 
{
	[DiamondShopTabItem.s_controls.bg] = {"bg"};
	[DiamondShopTabItem.s_controls.choosedBg] = {"bg","choosedBg"};
	[DiamondShopTabItem.s_controls.nameImage] = {"bg","nameImage"};
	[DiamondShopTabItem.s_controls.hotImage] = {"bg","hotImage"};
	[DiamondShopTabItem.s_controls.timeText] = {"bg","timeText"};
};

DiamondShopTabItem.s_controlFuncMap = 
{
	[DiamondShopTabItem.s_controls.bg] = DiamondShopTabItem.onBgTouch;
}

return DiamondShopTabItem;