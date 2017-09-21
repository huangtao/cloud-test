require("common/commonGameLayer");
local fastRenewalsLayout = require(ViewPath.."hall/userInfo/fastRenewalsLayout")
local vipTypeItem = require(ViewPath.."hall/userInfo/vipTypeItem")
local userInfo_pin_map = require("qnFiles/qnPlist/hall/userInfo_pin");

local VipTypeItem = class(CommonGameLayer, false);

VipTypeItem.s_controls = 
{
    bg         = 1,
    overflow   = 2,
    selectImg  = 3,
    num        = 4;
};


VipTypeItem.ctor = function(self, data)
    super(self, vipTypeItem);
    self.m_data = data;
    local w,h = self.m_root:getSize();
    self:setSize(w,h);
    self:setFillParent(false, false);
    self.m_ctrls = VipTypeItem.s_controls;
    if self.m_data then
        self:_initUI();
    end
end

VipTypeItem.onUpdateImage = function(self, url, imagePath)
   if imagePath then
		local bg = self:findViewById(self.m_ctrls.bg);
        bg:setFile(imagePath);
        bg:setSize(bg.m_res:getWidth(),bg.m_res:getHeight());
	end 
end

VipTypeItem.dtor = function(self)
    ImageCache.getInstance():cleanRef(self);
end

VipTypeItem._initUI = function(self)
    if self.m_data.icon then
        ImageCache.getInstance():request(self.m_data.icon, self, self.onUpdateImage);
    end
    self:findViewById(self.m_ctrls.num):setText("￥"..self.m_data.pamount.."元");
    self:findViewById(self.m_ctrls.overflow):setVisible(self.m_data.overflow);
    self:setSelectFile(self.m_data.isSelect);
end

VipTypeItem.isSelectedBtnClick = function(self, x, y)
    if not (x and y) then 
        return false;
    end 
    local selected = self:findViewById(self.m_ctrls.selectImg);
    if not selected:getVisible() then
        return false;
    end

    local selectX,selectY = selected:getUnalignPos();
    local w,h = selected:getSize();

    if (x >= selectX and x <= selectX + w) and (y >= selectY and y <= selectY + h) then 
        return true;
    else 
        return false;
    end 
end

VipTypeItem.setSelectFile = function (self, isSelect)
    self:findViewById(self.m_ctrls.selectImg):setFile(isSelect and userInfo_pin_map["checkBox_checked.png"] or userInfo_pin_map["checkBox_uncheck.png"]);
end

VipTypeItem.s_controlConfig =
{   
    [VipTypeItem.s_controls.bg]       = {"bg"};
    [VipTypeItem.s_controls.overflow]  = {"bg","overflow"};
    [VipTypeItem.s_controls.num]        = {"num"};
    [VipTypeItem.s_controls.selectImg]        = {"selectImg"};
};


local FastRenewalsLayout = class(CommonGameLayer,false);

FastRenewalsLayout.s_pay = EventDispatcher.getInstance():getUserEvent();

FastRenewalsLayout.Delegate = {
    onCloseFastRenewalsLayout = "onCloseFastRenewalsLayout";
};

FastRenewalsLayout.s_controls = 
{
	closeBtn = 1;
    renewalsBtns = 2;	
    vipTypeListView   = 3;
};

FastRenewalsLayout.ctor = function(self, data)
	super(self, fastRenewalsLayout);
    self:setEventTouch(self,function () end);
	self:setEventDrag(self,function () end);
    self.m_ctrls = FastRenewalsLayout.s_controls;
    self:_updateListView(data);
    GoodsListInterface.getInstance():setObserver(self);
    EventDispatcher.getInstance():register(FastRenewalsLayout.s_pay, self, self.onRequestPay);
end

FastRenewalsLayout._updateListView = function (self,data)
    self.m_data = self:analysisData(data);
    self:setDefaultSelectData(self.m_data);
    self:refreshVipTypeList();
end

FastRenewalsLayout.dtor = function (self)
    GoodsListInterface.getInstance():clearObserver(self);
end

FastRenewalsLayout.onGetGoodsInfoCallBack = function (self, isSuccess, info, sendParam)
    if isSuccess and not table.isEmpty(info.goodsList) then
        self:_updateListView(info.goodsList);
    else
        if table.isEmpty(self.m_data) then
            Toast.getInstance():showText("获取VIP列表失败！",50,30,kAlginLeft,"", 28,255,255,255);
        end
    end
end

FastRenewalsLayout.analysisData = function(self,data)
   if table.isEmpty(data) then
        return {};
   end
   local temp = {};
   table.sort(data, function(a, b)
		if a and b then
			return number.valueOf(a.pamount) < number.valueOf(b.pamount);
		end
   end );
   local len = #data;
   for k = len-1, len do
       if not table.isEmpty(data[k]) then
            if k == len then
                data[k].isSelect = true;
                data[k].overflow = true;
            else
                data[k].isSelect = false;
                data[k].overflow = false;
            end
            table.insert(temp, data[k]);  
       end
   end
   return temp;
end

FastRenewalsLayout.setDefaultSelectData = function (self, data)
    if table.isEmpty(data) then
        return;
    end
    self.m_curRechargeData = {};
    for k, v in pairs(table.verify(data)) do
        if k == #data then
            self.m_curRechargeData = v;
            break;
        end
    end
end

FastRenewalsLayout.refreshVipTypeList = function(self)
   
    local listView = self:findViewById(self.m_ctrls.vipTypeListView);
    if not self.m_data or #self.m_data <= 0 then
        listView:setVisible(false);
        return;
    else
        listView:setVisible(true);
        listView:setDirection(kHorizontal);
        if not self.m_adapter then
            self.m_adapter = new(CacheAdapter, VipTypeItem, self.m_data);
            listView:setAdapter(self.m_adapter);
        else
            self.m_adapter:changeData(self.m_data);
        end
        listView:setOnItemClick(self, self.onVipTypeItemClick);
    end
end

FastRenewalsLayout.onVipTypeItemClick = function (self, adapter, view, index, x, y)
    if view:isSelectedBtnClick(x,y) then
         for k , v in pairs( table.verify(adapter.m_views) ) do
            if(k == index) then
                v:setSelectFile(true);
                self.m_curRechargeData = v.m_data;
            else
                v:setSelectFile(false);
            end
        end
    end
end

FastRenewalsLayout.onCloseBtnClick = function (self)
    self:execDelegate(FastRenewalsLayout.Delegate.onCloseFastRenewalsLayout, true);
end

FastRenewalsLayout.onRenewalsBtnClick = function (self)
    UBReport.getInstance():report(UBConfig.kHallUserInfoRenewals,
        string.format("%s", (self.m_curRechargeData and self.m_curRechargeData.name) and self.m_curRechargeData.name or ""));
    EventDispatcher.getInstance():dispatch(FastRenewalsLayout.s_pay, PayConfig.eGoodsListId.MarketVip, self.m_curRechargeData);
    self:onCloseBtnClick();
end


FastRenewalsLayout.onRequestPay = function(self, sceneid, data)
	StateMachine.getInstance():pushState(States.ShortCutRecharge, nil, true, sceneid, nil, data);
end


FastRenewalsLayout.s_controlConfig = 
{
	[FastRenewalsLayout.s_controls.closeBtn] = {"centerView","closeBtn"};
	[FastRenewalsLayout.s_controls.renewalsBtns] = {"centerView" ,"bottomView","renewalsBtns"};
    [FastRenewalsLayout.s_controls.vipTypeListView] = {"centerView", "vipTypeListView"};
};

FastRenewalsLayout.s_controlFuncMap = 
{
	[FastRenewalsLayout.s_controls.closeBtn] = FastRenewalsLayout.onCloseBtnClick;
    [FastRenewalsLayout.s_controls.renewalsBtns] = FastRenewalsLayout.onRenewalsBtnClick;
};

return FastRenewalsLayout;