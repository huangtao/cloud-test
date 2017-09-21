require("hall/redEnvelope/data/redEnvelopeDataInterface");
require("hall/ranklist/data/rankListConstants");
local hallLayerBaseWithName = require("hall/widget/hallLayerBaseWithName")
local RedEnvelopeConfigLayer = class(hallLayerBaseWithName,false);
RedEnvelopeConfigLayer.s_layerName = "redenvelope_config";

RedEnvelopeConfigLayer.ctor = function(self,p_data)   
    RedEnvelopDataInterface.getInstance():setObserver(self);
    kUserInfoData:setObserver(self);
    self.m_sendId = RedEnvelopDataInterface.getInstance():getSelectedId();
    self.m_pos = {x=220,y=220};
    local __configTab = require(ViewPath.."hall/redEnvelope/send_envelope");

    super(self,__configTab,nil,RedEnvelopeConfigLayer.s_layerName);
    self:declareLayoutVar(ViewPath.."hall/redEnvelope/send_envelope".."_layout_var");

    self:getBgBlur(10);

    self.m_data = p_data or {};
  
    self:setLevel(0);
    self:setFillParent(true, true);

    self:getHandle();
    self:init();
    RedEnvelopDataInterface.getInstance():requestConfig();
    self.m_sendFunc = function() end;
end

RedEnvelopeConfigLayer.dtor = function(self)  
    RedEnvelopDataInterface.getInstance():clearObserver(self);
    kUserInfoData:clearObserver(self);
end

--得到相关句柄
RedEnvelopeConfigLayer.getHandle = function(self)
    --编辑器里控件的句柄
    self:getComponent();
    require("uilibs/richText");
    local _tips = string.format("#ceb4929#u%s","红包排行榜");
    local w,h = self.mm_Button_rank:getSize();
    local richText = new(RichText, _tips, w, h, kAlignCenter, nil, 22,nil,nil,nil,true);
    richText:setAlign(kAlignCenter);
    self.mm_Button_rank:addChild(richText);
end 

RedEnvelopeConfigLayer.init = function(self)
    self.m_sendId = RedEnvelopDataInterface.getInstance():getSelectedId();
    self.m_pos = {x=220,y=220};
    self:addChild(self.mm_Image_select_flag);
    self.mm_Image_select_flag:setVisible(false);
    self.m_sendFunc = function() end;
end

RedEnvelopeConfigLayer.refresh = function(self)
    self:init();
    if self.m_recordList then
        self.mm_View_listBottom:removeChild(self.m_recordList,true);
        self.m_recordList = nil;
    end

    if table.isEmpty(self.m_data) then
        return ;
    end

    local sizeX,sizeY = self.mm_View_listBottom:getSize();
    self.m_recordList = new(ListView);
    self.m_recordList:setSize(sizeX,sizeY);
    self.m_recordList:setDirection(kHorizontal);
    self.m_recordList:setScrollBarWidth(0);

    local __itemClass = require("hall/redEnvelope/widget/RedEnvelopeConfigItem");
    local __data = self:__reCreateItemData();
    if #__data <= 4 then
        self.m_recordList:setEventDrag(self.m_recordList,function() end);
    end
    self.m_recordListadApter = UIFactory.createCacheAdapter(__itemClass,__data);   
    self.m_recordList:setAdapter(self.m_recordListadApter);

    self.mm_View_listBottom:addChild(self.m_recordList);
end
 

--------------------------------private----------------------------
RedEnvelopeConfigLayer.__reCreateItemData = function(self)
    local __data = {};
    if table.isEmpty(self.m_data) then
        return __data;
    end

    local __desImages = {
    self.IMAGE.red_envelope_congratulation1,
    self.IMAGE.red_envelope_congratulation2,
    self.IMAGE.red_envelope_congratulation3,
    self.IMAGE.red_envelope_congratulation4
}

    local function __which(p_which,p_pos)
        self:__sendWhich(p_which,p_pos);
    end

    local __flag = 1;
    for k,v in pairs(self.m_data) do
        local __item = Copy(v);
        __item.selectFrame = self.mm_Image_select_flag;
        __item.callFunc = __which;
        __item.desImage = __desImages[__flag];
        __item.isDefaultSelected = false;

        if tonumber(v.id) == self.m_sendId then
            __isFindLastSelected = true;
            __item.isDefaultSelected = true;
        end
        table.insert(__data,__item);

        __flag = __flag + 1;
        if __flag > #__desImages then
            __flag = 1;
        end
        
    end
    return __data
end

RedEnvelopeConfigLayer.__sendWhich = function(self,p_which,p_pos)
    self.m_sendId = p_which or 0;
    RedEnvelopDataInterface.getInstance():setSelectedId(self.m_sendId);
    self.m_pos = p_pos or {x=220,y=220};
    self:__refreshButtonState();
end

RedEnvelopeConfigLayer.__animFrameCall = function(self)
    self:close();
end

--@brief 快速购买银币or金条
RedEnvelopeConfigLayer.__quickPay = function(self, typ, diffMoney)
    local goodsListId = (typ == RechargeDataInterface.getInstance():getPropertySilverCoinID()) and PayConfig.eGoodsListId.MarketGold or PayConfig.eGoodsListId.MarketCrystal
    StateMachine.getInstance():pushState(States.ShortCutRecharge, nil, true, goodsListId, {scene = goodsListId}, nil, nil, nil, { diffMoney = diffMoney});
end

RedEnvelopeConfigLayer.__refreshButtonState = function(self)

    self.m_sendFunc = function() end;

     --判断钱币是否满足需要
    local function __isCanSend()
         --local money = UserInfoData.getInstance():getMoneyById(self.m_data) - number.valueOf(data.money);
        local __config = RedEnvelopDataInterface.getInstance():getConfigById(self.m_sendId);
        if table.isEmpty(__config) then
            return false ;
        end

        local __moneyId,__num = __config.type,__config.money;
        if __moneyId == 1 then --金条
            if UserInfoData.getInstance():getMoneyById(1) - __num >=0 then
                return true;
            else
                --Toast.getInstance():showText("金条不够",50,30,kAlignLeft,"",24,200,175,110)
                self.m_sendFunc = function()
                    self:__quickPay(__moneyId,__num - UserInfoData.getInstance():getMoneyById(1));
                end
                return false;
            end
        elseif __moneyId == 0 then  --银币
            local remainMoney = UserInfoData.getInstance():getMoneyById(0) - __num;
            kBankruptDataInterface:checkIsBankrupt(remainMoney) 
            if  not(kBankruptDataInterface:checkIsBankrupt(remainMoney))  then
                return true;
            else
                --Toast.getInstance():showText("银币不够",50,30,kAlignLeft,"",24,200,175,110)
                local _lowLimit = kBankruptDataInterface:getBankruptLowestMoney();
                local ___num = __num - UserInfoData.getInstance():getMoneyById(0) + _lowLimit;
                self.m_sendFunc = function()
                    self:__quickPay(__moneyId,___num);
                end
                return false;
            end
        end
    end

   local __can = __isCanSend();

   if  __can then
        self.mm_Text_send:setText("发红包")
        self.m_sendFunc = function()
            local __data = {};
            __data.pos = self.m_pos or {x=220,y=220};
            __data.speed = 10;
            __data.callFunc = function() 
                
            end;
            self:close();
            LayerManagerIsolater.getInstance():show("redenvelope_anim_send",__data);
    
            RedEnvelopDataInterface.getInstance():requestSendRedEnvelop(self.m_sendId);
        end
    else
        self.mm_Text_send:setText("去充值");
    end
end

--------------------------------服务器数据返回------------------------------
RedEnvelopeConfigLayer.onGetRedEnvelopConfig = function(self,isSuccess, data)
    if isSuccess then
        self.m_data  = data;
        self:refresh();
    end
end

RedEnvelopeConfigLayer.onSendRedEnvelop = function(self, isSuccess, data, sendParam)
    
end

RedEnvelopeConfigLayer.refreshUserProperty = function(self)
    self:__refreshButtonState();
end

--------------------------------点击回掉函数--------------------------------

RedEnvelopeConfigLayer.onBindToClose = function(self)
    self:close();
end

RedEnvelopeConfigLayer.onBindToRank = function(self)
    Log.v("RedEnvelopeConfigLayer","onBindToRank");

    local callBack = function()
        LayerManagerIsolater.getInstance():show("redenvelope_config");
    end

    StateMachine.getInstance():pushState(States.RankList,nil,nil,RankListConstants.eRankType.RedEnvelope,callBack);
    self:close();
end

RedEnvelopeConfigLayer.onBindToRecord = function(self)
    Log.v("RedEnvelopeConfigLayer","onBindToRecord");
    self:close();
    LayerManagerIsolater.getInstance():show("redenvelope_record");
end

RedEnvelopeConfigLayer.onBindToSend = function(self)
    Log.v("RedEnvelopeConfigLayer","onBandToSend");
   self.m_sendFunc();
end


return RedEnvelopeConfigLayer;