require("hall/redEnvelope/data/redEnvelopeDataInterface");
require("hall/community/data/communityDataInterface");
local RankManInfo = require("hall/redEnvelope/widget/personalInfo");
local hallLayerBaseWithName = require("hall/widget/hallLayerBaseWithName")
local RedEnvelopeDetailLayer = class(hallLayerBaseWithName,false);
RedEnvelopeDetailLayer.s_layerName = "redenvelope_detail";

RedEnvelopeDetailLayer.ctor = function(self,p_data)   
    p_data = p_data or {};
    p_data.func_back = p_data.func_back or function() end;
    self.m_data = self:__dataFormat(p_data);
    self.m_recordCount = 0;
    self.m_addBlessRightCount = 0;
    self.m_addBlessLeftCount = 0;
    self.m_playerIdList = {};
    RedEnvelopDataInterface.getInstance():setObserver(self);
    CommunityDataInterface.getInstance():setObserver(self);

    local __configTab = require(ViewPath.."hall/redEnvelope/detail_red_envelope");

    super(self,__configTab,nil,RedEnvelopeDetailLayer.s_layerName);
    self:declareLayoutVar(ViewPath.."hall/redEnvelope/detail_red_envelope".."_layout_var");

    self:getBgBlur(10);
    self.m_server_data = {};

    self:setFillParent(true, true);

    self:getHandle();
    self:init();
    RedEnvelopDataInterface.getInstance():requesRedEnvelopDetail(self.m_data.id);
    self:recieverBroadcast();

    self.onHideUserInfo = function(self, popStack)

	    if self.manInfo then
		    delete(self.manInfo);
		    self.manInfo = nil;
	    end
    end

    self:setListenBackEvent(true);
end

RedEnvelopeDetailLayer.dtor = function(self)  
    RedEnvelopDataInterface.getInstance():clearObserver(self);
    CommunityDataInterface.getInstance():clearObserver(self);
end

RedEnvelopeDetailLayer.__dataFormat = function(self,p_data)
    local __formatData = {
        id = p_data.id,
        isNeedShowAllTakeMoneyNum = p_data.isNeedShowAllTakeMoneyNum or false,
        isJustSendRedEnvelop = p_data.isJustSendRedEnvelop or false;
        func_back = p_data.func_back,
        takenum = tonumber(p_data.takenum) or 0,
        num = tonumber(p_data.num) or 0,
        takemoney = tonumber(p_data.takemoney) or 0,
        totalmoney = tonumber(p_data.totalmoney) or 0,
        type = tonumber(p_data.type) or 0
    };
    return __formatData;
end

--得到相关句柄
RedEnvelopeDetailLayer.getHandle = function(self)
    --编辑器里控件的句柄
    self:getComponent();
end 

RedEnvelopeDetailLayer.init = function(self)
    self.mm_Text_tip:setVisible(false);                 --"还没有人领取你的红包"
    self.mm_View_congratulation_tip:setVisible(false);  --"红包已发出即将收到一堆祝福"
    self.mm_Text_status:setVisible(false);              --"领取信息统计描述"

    if self.m_data.isJustSendRedEnvelop then
        self.mm_View_congratulation_tip:setVisible(true); 
    end

    self:__refreshTakeNum();
end

RedEnvelopeDetailLayer.refresh = function(self)

    if table.isEmpty(self.m_server_data) then
        return ;
    end

    if self.m_data.takenum == 0 and not self.m_data.isJustSendRedEnvelop then
        self.mm_Text_tip:setVisible(true);
    end

    self:__refreshTakeNum();

    for kk,vv in pairs(self.m_server_data.data) do   --把记录也当着广播一条条插入，统一管理
        self:__addRecordItem(vv);
    end

end

--接收广播
RedEnvelopeDetailLayer.recieverBroadcast = function(self)

    if not self.m_data.isNeedShowAllTakeMoneyNum then
        return;
    end

    local __x,__y = self.mm_View_chat_left:getSize();

    local __chatClass = require("hall/redEnvelope/chatWidget/ChatWidget");
    self.m_chatWidget_left = new(__chatClass,__x,__y,kAlignTopRight);
    self.m_chatWidget_left:setAlign(kAlignLeft);
    self.m_chatWidget_left:setPos(0,0);
    self.mm_View_chat_left:addChild(self.m_chatWidget_left);

    self.m_chatWidget_right = new(__chatClass,__x,__y,kAlignTopLeft);
    self.mm_View_chat_right:addChild(self.m_chatWidget_right);

    --接收广播信号
    self.onRecieverGetRedEnvelope = function(self,data)
        if data.luckyId ~= self.m_data.id then
            return;
        end
        self:addBroadCastInfo(data);
    end
end

RedEnvelopeDetailLayer.addBroadCastInfo = function(self,data)

    --领取数量描述变化
    if self.m_data.takenum < self.m_data.num then
        self.m_data.takenum = self.m_data.takenum + 1;
    end

    self.m_data.takemoney = self.m_data.takemoney + data.money;
    if self.m_data.takemoney > self.m_data.totalmoney then
        self.m_data.takemoney = self.m_data.totalmoney;
    end

    self:__refreshTakeNum();

    --加入item
    self:__addRecordItem(data);

    --加入祝福语
    if self.m_data.isNeedShowAllTakeMoneyNum and data.bless~= nil then
        self:__addBless(data.bless);
    end
    
end
 

--------------------------------private----------------------------
RedEnvelopeDetailLayer.__refreshTakeNum = function(self)
    self.mm_Text_status:setVisible(true);
    local moneyDes = {"银币","金条"};
    local __typeString = moneyDes[self.m_data.type + 1];
    local __stateDes = string.format("已领取%d/%d个，已领取%d%s",self.m_data.takenum,self.m_data.num,self.m_data.takemoney,__typeString);
    if not self.m_data.isNeedShowAllTakeMoneyNum then
        __stateDes = string.format("已领取%d/%d个",self.m_data.takenum,self.m_data.num);
    end
    self.mm_Text_status:setText(__stateDes);
end

RedEnvelopeDetailLayer.__addBless = function(self,p_world)
    
    local __intervel = 2;
    local __itemClass = require("hall/redEnvelope/chatWidget/ChatWidgetItem");
    local __direction = "right";
    local __father = nil;

    if self.m_addBlessLeftCount  == self.m_addBlessRightCount then
        self.m_addBlessLeftCount = self.m_addBlessLeftCount + 1;
        __direction = "right";
        __father = self.m_chatWidget_left;
    else
        if math.mod(self.m_addBlessLeftCount,__intervel)==0 then
            self.m_addBlessRightCount = self.m_addBlessRightCount + 1;
            __direction = "left";
            __father = self.m_chatWidget_right;
        else
            self.m_addBlessLeftCount = self.m_addBlessLeftCount + 1;
            __direction = "right";
            __father = self.m_chatWidget_left;
        end    
    end
    local __item = new(__itemClass,{world =p_world,direction = __direction });
    __father:addItem(__item);
end

RedEnvelopeDetailLayer.__addRecordItem = function(self,data)
    
    local __stringId = tostring(data.mid) or "0";
    if self.m_playerIdList[__stringId] then
        return ;
    else
        self.m_playerIdList[__stringId] = true;   
    end

    if not self.m_detail_list then
        local sizeX,sizeY = self.mm_View_listBottom:getSize();
        self.m_detail_list = UIFactory.createScrollView(0,0,sizeX,sizeY,true);
        self.m_detail_list:setScrollBarWidth(0);
        self.mm_View_listBottom:addChild(self.m_detail_list);
    end



    self.m_recordCount = self.m_recordCount + 1;
    if self.m_recordCount > 100 then
        return ;
    end

    self.mm_View_congratulation_tip:setVisible(false);
    self.mm_Text_tip:setVisible(false);

    local __itemClass = require("hall/redEnvelope/widget/RedEnvelopeDetailItem");
    local __item = new(__itemClass,data);
    __item:setAlign(kAlignCenter);
    self.m_detail_list:addChild(__item);
end

--------------------------------服务器数据返回------------------------------
RedEnvelopeDetailLayer.onGetRedEnvelopRecordDetail = function(self,isSuccess, data)
    Log.v("onGetRedEnvelopRecordDetail ", data);
    if isSuccess then
        self.m_server_data  = data;
        -- --重新赋值确保其正确性
        self.m_data.totalmoney = data.base.totalmoney;
        self.m_data.num = data.base.num;
        self.m_data.takenum = data.base.takenum;
        self.m_data.takemoney = data.base.takemoney;
        self:refresh();
    end
end

RedEnvelopeDetailLayer.onCustomGetUserInfoCallBack = function(self, isSuccess, info)
	if isSuccess then
		if not self.manInfo  then
		    self.manInfo = new(RankManInfo,info,self);
		    self.manInfo:setFillParent(true, true);
		    self.manInfo:setDelegate(self);
            self.manInfo:setReportBtnVisible(false);
    	    self.m_root:addChild(self.manInfo);
	    end
	end 
end


--------------------------------点击回掉函数--------------------------------

RedEnvelopeDetailLayer.onBindToClose = function(self)
    self:close();
end

RedEnvelopeDetailLayer.onBindBack = function(self)
    Log.v("RedEnvelopeDetailLayer","onBindBack");
    self:close();
    self.m_data.func_back();
end

return RedEnvelopeDetailLayer;