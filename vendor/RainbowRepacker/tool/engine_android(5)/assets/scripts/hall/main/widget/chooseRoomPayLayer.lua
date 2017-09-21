require("common/IBaseDialog");
local chooseRoomPay = require(HallViewPath.."chooseRoomPay/chooseRoomPay");
require("uilibs/richText");

local ChooseRoomPayLayer = class(IBaseDialog, false);

ChooseRoomPayLayer.s_controls = 
{
	bgImage = 1;
	closeBtn = 2;
	contentBG = 3;
	buyBtn = 4;
	desView = 5;
	infoBtnText = 6;
	infoContentTxt = 7;
    icon = 8;
    contentBG = 9;
    failTips = 10;
};

ChooseRoomPayLayer.ctor = function(self, data, msg)
	super(self,chooseRoomPay);

    self.m_data = data;
	self.m_gameId = data.id;
	self.m_level = data.levelId;
    self.m_difMoney = data.difMoney;
    self.m_moneyType = data.moneyType;

    self:__initViews();

    local moneyType = GameManager.getInstance():getMoneyTypeByLevelId(self.m_gameId, self.m_level) or 0;
    moneyType = self.m_moneyType and self.m_moneyType or moneyType;
    self.m_moneyName = RechargeDataInterface.getInstance():getProperyAliasById(moneyType);

	local str = "";
	if string.len(string.trim(msg)) <= 0 then
        local money = "#cF65814"..data.difMoney;
        str = "#c8F5C1F您还需要"..money.."#c8F5C1F"..self.m_moneyName.."才能进入房间"; 
	else 
		str = "#c8F5C1F"..string.valueOf(msg);
	end

    local richText = new(RichText, str, w, h, kAlignCenter, nil, 36);
	richText:setAlign(kAlignCenter);
	self.m_desView:addChild(richText);


  	kGoodsListInterface:setObserver(self);
  	self:__requestGoodsList(data, moneyType);
end

ChooseRoomPayLayer.__initViews = function (self)
    self:setFillParent(true,true);

    self.m_desView = self:findViewById(self.s_controls.desView);
    self:findViewById(self.s_controls.bgImage):setEventDrag(self,function ()end);
    self:findViewById(self.s_controls.contentBG):setEventTouch(self,function ()end);
    self.m_buyBtn = self:findViewById(self.s_controls.buyBtn);
    self.m_failTips = self:findViewById(self.s_controls.failTips);
    self.infoBtnText = self:findViewById(self.s_controls.infoBtnText);
    self.m_infoContentTxt = self:findViewById(self.s_controls.infoContentTxt);
    self.m_icon = self:findViewById(self.s_controls.icon);

    self.infoBtnText:setText("商品加载中，稍等...");
    self.infoBtnText:setPos(self:__reSetTextX(), 0);
    self.m_icon:setVisible(true);
    self.infoBtnText:setVisible(true);
    self.m_failTips:setVisible(false);
end

ChooseRoomPayLayer.__requestGoodsList = function(self, data, moneyType)
    self.m_goodsListId = PayConfig.eGoodsListId.MarketGold;
    if moneyType == UserPropertyIsolater.getInstance():getPropertyGoldBarID() then
        self.m_goodsListId = PayConfig.eGoodsListId.MarketCrystal;
    end
    
    local sceneGoodsInfo = kGoodsListInterface:getSceneGoodsInfo(self.m_goodsListId, { ["scene"] = self.m_goodsListId} );
    if not table.isEmpty(sceneGoodsInfo) then
        self:onGetGoodsInfoCallBack(true, sceneGoodsInfo)
    end
end

ChooseRoomPayLayer.__getTextSize = function(self, label0,label1)
    local text = new(Text, label0:getText(), nil, nil, nil, nil, label0.m_res.m_fontSize);
    local w0,_ = text:getSize();
    delete(text);
    text = new(Text, label1:getText(), nil, nil, nil, nil, label1.m_res.m_fontSize);
    local w1,_ = text:getSize();
    delete(text);
    return w0 > w1 and w0 or w1;
end

ChooseRoomPayLayer.__reSetTextX = function (self)
    local x = 0;
    local spaceW = 10;
    local buyW,_ = self.m_buyBtn:getSize();
    local icon = self:findViewById(self.s_controls.icon);
    local iconW, _ = icon:getSize();
    local textW = self:__getTextSize(self.infoBtnText, self.m_infoContentTxt);
    icon:setPos((buyW - textW - iconW - spaceW)/2, nil); 
    x = icon:getPos() + iconW + spaceW;
    return x;
end

ChooseRoomPayLayer.dtor = function(self)
	kGoodsListInterface:clearObserver(self);
end

-- 关闭界面
ChooseRoomPayLayer.closeChooseRoomPayLayer = function (self)
	self:hide();
end

ChooseRoomPayLayer.onBgChooseRoomPayLayerClick = function (self, finger_action)
    if finger_action == kFingerUp then
        self:hide();
    end
end

--@delegate
ChooseRoomPayLayer.onGetGoodsInfoCallBack = function(self, isSuccess, sceneGoodsInfo, sendParam)
	if isSuccess then
        local goodInfo = kGoodsListInterface:getGoodsInfoWithChips(sceneGoodsInfo.goodsList, self.m_difMoney);
        if table.isEmpty(goodInfo) then
            return;
        end

		self.m_goodInfo = goodInfo;
		local str = string.concat(self.m_goodInfo.pamount, "元=", self.m_goodInfo.pchips, self.m_moneyName);
		self.infoBtnText:setText(str);
		local desc = self.m_goodInfo.priorityDesc;
        local x = self:__reSetTextX();
		if desc == "" then
			self.infoBtnText:setPos(x, 0);
		else
			self.infoBtnText:setPos(x, -18);
    		self.m_infoContentTxt:setText(desc);
            self.m_infoContentTxt:setPos(x, 18);
		end
        self:__refreshPaymentBtnStatus(self.m_goodInfo);
	end
end

ChooseRoomPayLayer.__refreshPaymentBtnStatus = function (self, goodInfo)
    local isShow = false;
    if table.isEmpty(goodInfo) or goodInfo.pamount == 0 then
        isShow = false;
    else
        isShow = true; 
    end
    self.m_infoContentTxt:setVisible(not string.isEmpty(goodInfo.priorityDesc));
    self.m_icon:setVisible(isShow);
    self.infoBtnText:setVisible(isShow);
    self.m_failTips:setVisible(not isShow);
end


ChooseRoomPayLayer.payment = function (self)
    UBReport.getInstance():report(UBConfig.kHallChooseRoomPayBtns, string.format("gameId%s_level%s", self.m_gameId or "", self.m_level or "")); 
	if not table.isEmpty(self.m_goodInfo) then
        if self.m_failTips:getVisible() then
            self:__initViews();
            self:__requestGoodsList(self.m_data);
        else
		    self:closeChooseRoomPayLayer();
    	    RechargeDataInterface.getInstance():setSceneType(UBPaySceneConfig.kGameLevelList);
		    StateMachine.getInstance():pushState(States.ShortCutRecharge, nil, true, self.m_goodsListId, nil, self.m_goodInfo);
        end
	end
end

ChooseRoomPayLayer.s_controlConfig = 
{
	[ChooseRoomPayLayer.s_controls.bgImage] = {"bgImage"},
	[ChooseRoomPayLayer.s_controls.closeBtn] = {"contentBG","closeBtn"},
	[ChooseRoomPayLayer.s_controls.contentBG] = {"contentBG"},
	[ChooseRoomPayLayer.s_controls.buyBtn] = {"contentBG","buyBtn"},
	[ChooseRoomPayLayer.s_controls.desView] = {"contentBG","desView"},
	[ChooseRoomPayLayer.s_controls.infoBtnText] = {"contentBG", "buyBtn","infoBtnText"},
	[ChooseRoomPayLayer.s_controls.infoContentTxt]	= {"contentBG","buyBtn","infoContentTxt"}, 
    [ChooseRoomPayLayer.s_controls.icon] = {"contentBG", "buyBtn","icon"},
    [ChooseRoomPayLayer.s_controls.failTips] = {"contentBG", "buyBtn","failTips"},
    [ChooseRoomPayLayer.s_controls.contentBG] = {"contentBG"},
    
    
};

ChooseRoomPayLayer.s_controlFuncMap = 
{
	[ChooseRoomPayLayer.s_controls.closeBtn] = ChooseRoomPayLayer.closeChooseRoomPayLayer;
	[ChooseRoomPayLayer.s_controls.bgImage] = ChooseRoomPayLayer.onBgChooseRoomPayLayerClick;
	[ChooseRoomPayLayer.s_controls.buyBtn] = ChooseRoomPayLayer.payment;
};


return ChooseRoomPayLayer;


