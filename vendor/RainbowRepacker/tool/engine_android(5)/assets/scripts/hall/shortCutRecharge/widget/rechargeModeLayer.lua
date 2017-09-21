local rechargeModeLayer = require(ViewPath .. "hall/shortCutRecharge/rechargeModeLayer");
local payChannelIcons_pin_map = require("qnFiles/qnPlist/hall/payChannelIcons_pin");
local shortCutRecharge_pin_map = require("qnFiles/qnPlist/hall/shortCutRecharge_pin");


local rechargeModeItem = require(ViewPath .. "hall/shortCutRecharge/rechargeModeItem");

local RechargeModeItem = class(Node);

RechargeModeItem.ctor = function(self, pmodeInfo)
    self.m_root = SceneLoader.load(rechargeModeItem);
    self:addChild(self.m_root);
    self:setSize(self.m_root:getSize());

    self.m_itemBtn = self.m_root:getChildByName("modeItem");
    self.m_modeIcon = self.m_itemBtn:getChildByName("icon");
    self.m_modeName = self.m_itemBtn:getChildByName("name");
    self.m_cornerMarkView = self.m_itemBtn:getChildByName("cornerMarkView");
    self.m_modeName:setPickable(false);
    self.m_recommended = self.m_itemBtn:getChildByName("recommended");

    self.m_modeName:setText(pmodeInfo.name);
    self.m_modeIcon:setFile(pmodeInfo.icon);
 

    self.m_validPament = true;
    if pmodeInfo.id == PayConfig.ePayMode.LOCAL_CRYSTAL_PMODE then

        if pmodeInfo.cornerMark == "" or pmodeInfo.cornerMark == "0" or pmodeInfo.cornerMark == nil  then
            self.m_recommended:setVisible(true);
        else
            local m_cornerMark = new(UrlImage, "hall/common/bg_blank.png" ,pmodeInfo.cornerMark);  
            m_cornerMark:setSize( self.m_cornerMarkView:getSize() );
            self.m_cornerMarkView:addChild(m_cornerMark);
        end
        
        local hasEnoughCrystal = kUserInfoData:getCrystal() >= pmodeInfo.num and true or false;
        if not hasEnoughCrystal then
            self.m_itemBtn:setGray(true);
            self.m_modeIcon:setGray(true);
            self.m_itemBtn:setPickable(false);
            self.m_validPament = false;
            self.m_recommended:setVisible(false);
        end
    end

    self.m_pmodeInfo = pmodeInfo;
end

RechargeModeItem.getData = function(self)
    return self.m_pmodeInfo;
end

RechargeModeItem.isValidPayment = function(self)
    return self.m_validPament;
end


----------------------------------------------------------------------------

local RechargeModeLayer = class(CommonGameLayer, false);

local h_index = 0;
local getIndex = function(self)
    h_index = h_index + 1;
    return h_index;
end

RechargeModeLayer.Delegate = {
    onRechargeModeLayerClose = "onRechargeModeLayerClose";
    onSelectPayMode = "onSelectPayMode";
}


RechargeModeLayer.s_controls = {
    shadeBg = getIndex();
    centerView = getIndex();
    modeView = getIndex();
    goodsDesc = getIndex();
    price = getIndex();
    closeBtn = getIndex();
}


RechargeModeLayer.ctor = function(self)
    super(self, rechargeModeLayer);
    self:setFillParent(true, true);

    self.m_ctrl = RechargeModeLayer.s_controls;
    self:getControl(self.m_ctrl.shadeBg):setEventTouch(nil , function()
    end);
    self:getControl(self.m_ctrl.shadeBg):setEventDrag(nil , function()
    end);
end

RechargeModeLayer.dtor = function(self)
end

RechargeModeLayer.show = function(self, goodsInfo)
    Log.v("RechargeModeLayer.show", " goodsInfo = ", goodsInfo);
    CommonGameLayer.show(self);

    if table.isEmpty(goodsInfo) then
        self:onCloseBtnClick();
        return;
    end

    self.m_goodsInfo = goodsInfo;

    self:__initView();
end

RechargeModeLayer.__initView = function(self)
    local strGoodsDesc = self.m_goodsInfo.name;
    if not string.isEmpty(self.m_goodsInfo.priorityDesc) then
        strGoodsDesc = strGoodsDesc .. "+" .. self.m_goodsInfo.priorityDesc;
    end

    self:findViewById(self.m_ctrl.goodsDesc):setText(strGoodsDesc);
    self:findViewById(self.m_ctrl.price):setText(self.m_goodsInfo.pamount .."元");

    System.setImageFormatPicker(function() 
        return kRGBGray; 
    end);

    --加一个元素 
    for k,v in pairs( self.m_goodsInfo.pmodes ) do
        v.cornerMark =  self.m_goodsInfo.crystalIcon;
    end
    
    self:__createPayModeView(self.m_goodsInfo.pmodes);
    System.setImageFormatPicker(nil);
end

RechargeModeLayer.__createPayModeView = function(self, pmodes)
    local modeView = self:findViewById(self.m_ctrl.modeView);
    if table.isEmpty(pmodes) then
        modeView:setVisible(false);
        return;
    end

    modeView:setVisible(true);
    local w, h = modeView:getSize();
    if not self.m_adapter then
        self.m_adapter = UIFactory.createCacheAdapter(RechargeModeItem, pmodes);
        local gridView = UIFactory.createGridView(0,0,w,h);
        modeView:addChild(gridView);
        gridView:setAdapter(self.m_adapter);
        gridView:setOnItemClick(self, self.onPayModeItemClick);
    else
        self.m_adapter:changeData(pmodes);
    end
end

RechargeModeLayer.onPayModeItemClick = function(self, adapter, view, index)
    if view:isValidPayment() then
        local pmodeInfo = view:getData();
        self:execDelegate(RechargeModeLayer.Delegate.onSelectPayMode, pmodeInfo.id);
    end
end

RechargeModeLayer.onCloseBtnClick = function(self)
    self:execDelegate(RechargeModeLayer.Delegate.onRechargeModeLayerClose, true);
end


RechargeModeLayer.s_controlConfig = {
    [RechargeModeLayer.s_controls.shadeBg] = {"shade_bg"};
    [RechargeModeLayer.s_controls.centerView] = {"centerView"};
    [RechargeModeLayer.s_controls.modeView] = {"centerView", "modeViewBg", "modeView"};
    [RechargeModeLayer.s_controls.goodsDesc] = {"centerView", "bottomView", "goodsDesc"};
    [RechargeModeLayer.s_controls.price] = {"centerView", "bottomView", "price"};
    [RechargeModeLayer.s_controls.closeBtn] = {"centerView", "closeBtn"};
}

RechargeModeLayer.s_controlFuncMap = {
    [RechargeModeLayer.s_controls.closeBtn] = RechargeModeLayer.onCloseBtnClick;
}


return RechargeModeLayer;