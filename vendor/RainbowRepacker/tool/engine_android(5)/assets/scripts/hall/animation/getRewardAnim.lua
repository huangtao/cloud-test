require("common/commonGameLayer");
local getRewardAnim = require(ViewPath.."common/getRewardAnim");
require("hall/animation/bgRepeatShine_swf/bgRepeatShine_swf_pin");
require("hall/animation/bgRepeatShine_swf/bgRepeatShine_swf_info");
require("hall/animation/goodsShine_swf/goodsShine_swf_pin");
require("hall/animation/goodsShine_swf/goodsShine_swf_info");
require("hall/animation/receiveSuccess_swf/receiveSuccess_swf_pin");
require("hall/animation/receiveSuccess_swf/receiveSuccess_swf_info");
require("isolater/widget/layerManagerIsolater"); 

local getRewardAnimListItem = require(ViewPath.."common/getRewardAnimListItem");
local GetRewardAnimListItem = class(CommonGameLayer, false);
GetRewardAnimListItem.s_controls = 
{ 
    icon = 1;
    numView = 2;
    bg_light = 3;
}

GetRewardAnimListItem.defaultFadeTimer = 100;
GetRewardAnimListItem.defaultScaleBigTimer = 100;
GetRewardAnimListItem.defaultScaleNormalTimer = 50;
GetRewardAnimListItem.defaultScaleValue = 1.1;

GetRewardAnimListItem.setMaxListItemNum = function (num)
    GetRewardAnimListItem.maxListItemNum = num or 1;     
end

GetRewardAnimListItem.setListItemAnimCallBack = function (obj, func)
    GetRewardAnimListItem.obj = obj;
    GetRewardAnimListItem.func = func;
end

GetRewardAnimListItem.ctor = function(self, data)
	
    TextView.setDefaultScrollBarWidth(0);
    super(self, getRewardAnimListItem);
    local w, h = self.m_root:getSize();
    self:setSize(w, h);
	self.m_data = data;
   
	self.m_icon = self:findViewById(GetRewardAnimListItem.s_controls.icon);
    self.m_numView = self:findViewById(GetRewardAnimListItem.s_controls.numView);
    self.m_bg = self:findViewById(GetRewardAnimListItem.s_controls.bg_light);
    local str = "";
    if self.m_data.name ~= "nil" then
        if self.m_data.num > 1 then
            str = self.m_data.name.."X"..self.m_data.num;
        else
            str = self.m_data.name;    
        end
    else
        str = self.m_data.num;
    end
    local w,h = self.m_numView:getSize();
    local textNum = new(RichText, str, w, h, kAlignTop, nil, 28, 250, 238, 185, true);
    textNum:setAlign(kAlignCenter);
    self.m_numView:addChild(textNum);

    ImageCache.getInstance():request(self.m_data.icon, self, self.onImageDownloaded);
    if self.m_data.index <= GetRewardAnimListItem.maxListItemNum then
        self:setVisible(false);
        self:__delayTimerShowItem();
    end
    TextView.setDefaultScrollBarWidth(nil);
end

GetRewardAnimListItem.__delayTimerShowItem = function (self)
    self:__deleteTimerShowItem();
    self.m_timerShowItem = AnimFactory.createAnimInt(kAnimNormal, 0, 1, self.m_data.timer, 0);
    self.m_timerShowItem:setDebugName("GetRewardAnimListItem|self.m_timerShowItem");
    self.m_timerShowItem:setEvent(self, self.__showAndAnimationItem);
end

GetRewardAnimListItem.__showAndAnimationItem = function (self)
    self:setVisible(true);
    self:addPropTransparency(1, kAnimNormal, GetRewardAnimListItem.defaultFadeTimer, 0, 0, 1);
    self.m_itemScaleBigAnim = self:addPropScale(2, kAnimNormal, GetRewardAnimListItem.defaultScaleBigTimer, 0, 0, GetRewardAnimListItem.defaultScaleValue, 0, GetRewardAnimListItem.defaultScaleValue, kCenterDrawing);
    if self.m_itemScaleBigAnim then
        self.m_itemScaleBigAnim:setDebugName("GetRewardAnimListItem|self.m_itemScaleBigAnim");
        self.m_itemScaleBigAnim:setEvent(self, self.__itemScaleNormalAnim)
    end
end

GetRewardAnimListItem.__itemScaleNormalAnim = function (self)
    self.m_itemScaleNormalAnim = self:addPropScale(3, kAnimNormal, GetRewardAnimListItem.defaultScaleNormalTimer, 0, GetRewardAnimListItem.defaultScaleValue, 0.9, GetRewardAnimListItem.defaultScaleValue, 0.9, kCenterDrawing);
    if self.m_itemScaleNormalAnim then
        self.m_itemScaleNormalAnim:setDebugName("GetRewardAnimListItem|self.m_itemScaleNormalAnim");
        self.m_itemScaleNormalAnim:setEvent(self, self.onListItemAnimCallBack)
    end
end

GetRewardAnimListItem.onListItemAnimCallBack = function (self)
    if GetRewardAnimListItem.maxListItemNum == self.m_data.index then
        if GetRewardAnimListItem.obj and GetRewardAnimListItem.func then
		    GetRewardAnimListItem.func(GetRewardAnimListItem.obj);
	    end
    end
end


GetRewardAnimListItem.__deleteTimerShowItem = function (self)
    delete(self.m_timerShowItem);
    self.m_timerShowItem = nil;
end

GetRewardAnimListItem.dtor = function(self)
    self:__deleteTimerShowItem();
	ImageCache.getInstance():cleanRef(self);
end

GetRewardAnimListItem.setViewHeight = function(height)
    GetRewardAnimListItem.s_viewHeight = height;
end

GetRewardAnimListItem.setContentAlign = function(self, align)
    self.m_root:setAlign(align);
end

GetRewardAnimListItem.onImageDownloaded = function(self, url, imagePath)
	if self.m_data.icon == url and imagePath then
		self.m_icon:setFile(imagePath);
        local parentWidth, parentHeight = self.m_bg:getSize();
        local width = self.m_icon.m_res:getWidth();
        local height = self.m_icon.m_res:getHeight();
        local ratio = 0.7;
        local scale = 1.0;
        if width <= height then
            scale = parentWidth * ratio / width;
        else
            scale = parentHeight * ratio / height;
        end
        self.m_icon:setSize(width * scale, height * scale);
	end
end

GetRewardAnimListItem.s_controlConfig =
{   
    [GetRewardAnimListItem.s_controls.icon] = {"icon_view","bg_light","icon"};  
    [GetRewardAnimListItem.s_controls.numView]  = {"icon_view","numView"};
    [GetRewardAnimListItem.s_controls.bg_light]  = {"icon_view","bg_light"};
}

local GetRewardAnimPageItem = class(CommonGameLayer, false);

GetRewardAnimPageItem.setDefaultSize = function(w, h)
	GetRewardAnimPageItem.s_defaultWidth = w;
	GetRewardAnimPageItem.s_defaultHeight = h;
end

GetRewardAnimPageItem.ctor = function(self, data)	
	super(self, nil);
	self.m_data = data;
	self:setSize(GetRewardAnimPageItem.s_defaultWidth, GetRewardAnimPageItem.s_defaultHeight);
	self:initViews();
end

GetRewardAnimPageItem.dtor = function(self)	
	delete(self.m_data);
	self.m_data = nil;
end

GetRewardAnimPageItem.initViews = function(self)
	local w, h = self:getSize();
    GetRewardAnimListItem.setViewHeight(h);
    local count = GetRewardAnimListItem.maxListItemNum;
    local itemWidth = w / count;
    local itemHeight = h;
	for k,v in pairs(self.m_data) do
		if v then
			local view = new(GetRewardAnimListItem, v);
			view:setAlign(kAlignLeft);
			view:setSize(itemWidth, nil);
			self:addChild(view);
			local col = (k-1) % count;
			view:setPos(col * itemWidth + 14, nil);
			view:setContentAlign(kAlignLeft);
			local _, viewHeight = view:getSize();
			itemHeight = viewHeight;
		end
	end
	self:setSize(nil, itemHeight);
end

local GetRewardAnim = class(CommonGameLayer,false);
GetRewardAnim.TIME_STEP = 500;
GetRewardAnim.listItemDefaultWidth = 175;
GetRewardAnim.listItemDefaultHeight = 212;
GetRewardAnim.perLineShowMaxItemNum = 5;

GetRewardAnim.s_controls = 
{ 
    bg = 1;
    knowBtn = 2;
    rewardListView = 3;
    swfBgRepeatShineLayer = 4;
    swfReceiveSuccessLayer = 5;
    swfGoodsShineLayer   = 6;
};
 
GetRewardAnim.__analysisData = function (self, data)
    if table.isEmpty(data) then
        return;
    end
    self.m_data = {};
    for k, v in ipairs(table.verify(data)) do
        local temp = {};
        temp.icon = string.valueOf(v.icon);
        temp.num = number.valueOf(v.num);
        temp.sort = number.valueOf(v.sort);
        temp.name = string.valueOf(v.name);
        temp.timer = 100*(k-1)+500;
        temp.index = k;
        table.insert(self.m_data,temp);
    end   
end

GetRewardAnim.ctor = function(self, data) 
    ScrollBar.setDefaultImage("hall/getRewardAnim/rewardListScrollBar.png");
    super(self,getRewardAnim);    
    self:__analysisData(data);
    self.m_rewardListView = self:findViewById(GetRewardAnim.s_controls.rewardListView);
    self.m_swfBgRepeatShineLayer = self:findViewById(GetRewardAnim.s_controls.swfBgRepeatShineLayer);
    self.m_swfReceiveSuccessLayer = self:findViewById(GetRewardAnim.s_controls.swfReceiveSuccessLayer);
    self.m_swfGoodsShineLayer = self:findViewById(GetRewardAnim.s_controls.swfGoodsShineLayer);
    self.m_knowBtn = self:findViewById(GetRewardAnim.s_controls.knowBtn);
    self.m_bg = self:findViewById(GetRewardAnim.s_controls.bg);
    self:setFillParent(true,true);
    self:setVisible(false);
    self:setLevel(1000);
    self:addToRoot();
    self:__updateRewardListView();
    self:setEventTouch(self, self.emptyFunc);
    self:setEventDrag(self, self.emptyFunc);
    self.m_knowBtn:setVisible(false);
    self.m_bg:setTransparency(0.5);
    local blurWidget = require("libEffect/shaders/blurWidget");
    self.blurBg = blurWidget.createBlurWidget(nil, {intensity = 10,onRoot = true})
    self.blurBg.zorder = -1
    self:getWidget():add(self.blurBg);
    ScrollBar.setDefaultImage(nil);
    IPopDialogManager.getInstance():addPopDialog(self, 100, self.onKnowBtnClick, self);
    kEffectPlayer:play(Effects.Audio_getReward);
end 

GetRewardAnim.dtor = function (self)
    self:__deleteTimer();
    IPopDialogManager.getInstance():removePopDialog(self);
    GetRewardAnimManager.getInstance():stop();
    self.blurBg:cleanup();
end

GetRewardAnim.emptyFunc = function (self)
    
end

GetRewardAnim.__reSetListViewSize = function (self) 
    local len = #self.m_data;   
    if len > GetRewardAnim.perLineShowMaxItemNum then
       len = GetRewardAnim.perLineShowMaxItemNum;
    end
    self.m_rewardListView:setSize(GetRewardAnim.listItemDefaultWidth*len, GetRewardAnim.listItemDefaultHeight);
    GetRewardAnimListItem.setMaxListItemNum(len);
    self.m_curItemNum = len;
end

GetRewardAnim.__groupData = function(self, data, count)
    if table.isEmpty(data) then 
        return; 
    end
    count = count or 2;
    local tmpData = table.copyTab(data);
    local rewardData = {};
    local pos = 1;
    for k, v in ipairs(tmpData) do 
        if not rewardData[pos] then 
            rewardData[pos] = {};
        end
        table.insert(rewardData[pos], v);
        if #rewardData[pos] >= count then 
            pos = pos + 1;
        end
    end
    return rewardData;
end

GetRewardAnim.__updateRewardListView = function (self)
   
    if not #self.m_data or #self.m_data <= 0 then
        self.m_rewardListView:setVisible(false);
        return;
    else
        self.m_rewardListView:setPickable(false);
        self:__reSetListViewSize();
        local data = self:__groupData(self.m_data, GetRewardAnim.perLineShowMaxItemNum);
        self.m_rewardListView:setVisible(true);
        self.m_rewardListView:setDirection(kVertical);
        if not self.m_adapter then  
            local w,h = self.m_rewardListView:getSize();
            GetRewardAnimPageItem.setDefaultSize(w, h);
            GetRewardAnimListItem.setListItemAnimCallBack(self,self.__goodsShinePlayer);
            self.m_adapter = new(CacheAdapter, GetRewardAnimPageItem, data);
            self.m_rewardListView:setAdapter(self.m_adapter);
        else
            self.m_adapter:changeData(data);
        end    
        if self.m_rewardListView:hasScrollBar() then
            self.m_rewardListView:getScrollBar():setVisibleImmediately(true);
        end
    end
end

GetRewardAnim.play = function(self )
    self:setVisible(true);
    self:__receiveSuccessPlayer();
    self:__delayTimer();
end

GetRewardAnim.__deleteTimer = function (self)
    delete(self.m_timer);
    self.m_timer = nil;
end

GetRewardAnim.__delayTimer = function (self)
    self:__deleteTimer();
    self.m_timer = AnimFactory.createAnimInt(kAnimNormal, 0, 1, GetRewardAnim.TIME_STEP, 0);
    self.m_timer:setDebugName("GetRewardAnim|self.m_timer");
    self.m_timer:setEvent(self, self.__bgRepeatShinePlayer);
end

GetRewardAnim.__bgRepeatShinePlayer = function (self)
    local bgRepeatShinePlayer = new(SwfPlayer, bgRepeatShine_swf_info);
    bgRepeatShinePlayer:setAlign(kAlignTop);
    bgRepeatShinePlayer:setPos(nil,-38);
    self.m_swfBgRepeatShineLayer:addChild(bgRepeatShinePlayer);
    bgRepeatShinePlayer:play(1,false,-1,0);
end

GetRewardAnim.__receiveSuccessPlayer = function (self)
    local receiveSuccessPlayer = new(SwfPlayer, receiveSuccess_swf_info);
    receiveSuccessPlayer:setAlign(kAlignCenter);
    self.m_swfReceiveSuccessLayer:addChild(receiveSuccessPlayer);
    receiveSuccessPlayer:play(1,true,1,0);
end

GetRewardAnim.__goodsShinePlayer = function (self)
    self.m_swfGoodsShineLayer:setSize(self.m_rewardListView:getSize());
    local w ,h = self.m_rewardListView:getSize();
    for i = 1, self.m_curItemNum do
        local goodsShinePlayer = new(SwfPlayer, goodsShine_swf_info);
        goodsShinePlayer:setAlign(kAlignLeft);
        self.m_swfGoodsShineLayer:addChild(goodsShinePlayer);
        goodsShinePlayer:setPos((w/self.m_curItemNum)*((i-1) % self.m_curItemNum) + 16 ,-34);
        goodsShinePlayer:play(1,false,1,0);
        if i == 1 then
            self:showKnowBtn();
        end
    end
end

GetRewardAnim.showKnowBtn = function (self)
    self.m_rewardListView:setPickable(true);
    self.m_knowBtn:setVisible(true);
end

GetRewardAnim.onKnowBtnClick = function (self)
   VipAnimManager.getInstance():playVipAnim();
   LayerManagerIsolater.getInstance():hide("case_flyToBag_animation", true);
   local parent;
   parent = self:getParent();
   if parent then
      parent:removeChild(self,true);
   end
   GetRewardAnimManager.getInstance():stop();
end

GetRewardAnim.s_controlConfig =
{   
    [GetRewardAnim.s_controls.rewardListView] = {"rewardListView"};  
    [GetRewardAnim.s_controls.swfBgRepeatShineLayer] = {"swfBgRepeatShineLayer"}; 
    [GetRewardAnim.s_controls.swfReceiveSuccessLayer] = {"swfReceiveSuccessLayer"}; 
    [GetRewardAnim.s_controls.swfGoodsShineLayer] = {"swfGoodsShineLayer"}; 
    [GetRewardAnim.s_controls.knowBtn] = {"knowBtn"}; 
    [GetRewardAnim.s_controls.bg] = {"bg"}; 
};

GetRewardAnim.s_controlFuncMap =
{
   [GetRewardAnim.s_controls.knowBtn] = GetRewardAnim.onKnowBtnClick;
};

return GetRewardAnim;






