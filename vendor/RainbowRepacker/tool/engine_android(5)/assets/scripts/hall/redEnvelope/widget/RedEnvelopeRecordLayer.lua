require("hall/redEnvelope/data/redEnvelopeDataInterface");
local hallLayerBaseWithName = require("hall/widget/hallLayerBaseWithName")
local RedEnvelopeRecordLayer = class(hallLayerBaseWithName,false);
RedEnvelopeRecordLayer.s_layerName = "redenvelope_record";

RedEnvelopeRecordLayer.ctor = function(self,p_data)   
    RedEnvelopDataInterface.getInstance():setObserver(self);

    local __configTab = require(ViewPath.."hall/redEnvelope/record_envelope");

    super(self,__configTab,nil,RedEnvelopeRecordLayer.s_layerName);
    self:declareLayoutVar(ViewPath.."hall/redEnvelope/record_envelope".."_layout_var");

    self:getBgBlur(10);

    self.m_data = p_data or {};
  
    self:setLevel(0);
    self:setFillParent(true, true);

    self:getHandle();
    RedEnvelopDataInterface.getInstance():requestRecord();
    self:init();
end

RedEnvelopeRecordLayer.dtor = function(self)  
    RedEnvelopDataInterface.getInstance():clearObserver(self);
end

--得到相关句柄
RedEnvelopeRecordLayer.getHandle = function(self)
    --编辑器里控件的句柄
    self:getComponent();
    require("uilibs/richText");
    local _tips = string.format("#ceb4929#u%s","红包排行榜");
    local w,h = self.mm_Button_rank:getSize();
    local richText = new(RichText, _tips, w, h, kAlignCenter, nil, 22,nil,nil,nil,true);
    richText:setAlign(kAlignCenter);
    self.mm_Button_rank:addChild(richText);
    
end 

RedEnvelopeRecordLayer.init = function(self)
    self.mm_Text_tip:setVisible(false);
end

RedEnvelopeRecordLayer.refresh = function(self)
    self:init();
    if self.m_recordList then
        self.mm_View_listBottom:removeChild(self.m_recordList,true);
        self.m_recordList = nil;
    end

    if table.isEmpty(self.m_data) then
        self.mm_Text_tip:setVisible(true);
        return ;
    end

    local sizeX,sizeY = self.mm_View_listBottom:getSize();
    self.m_recordList = new(ListView);
    self.m_recordList:setSize(sizeX,sizeY);
    --self.m_recordList:setDirection(kHorizontal);
    self.m_recordList:setScrollBarWidth(0);

    local __itemClass = require("hall/redEnvelope/widget/RedEnvelopeRecordItem");
    self.m_recordListadApter = UIFactory.createCacheAdapter(__itemClass,self.m_data);   
    self.m_recordList:setAdapter(self.m_recordListadApter);

    self.mm_View_listBottom:addChild(self.m_recordList);
end
 

--------------------------------private----------------------------

--------------------------------服务器数据返回------------------------------
RedEnvelopeRecordLayer.onGetRedEnvelopSendRecord = function(self,isSuccess, data)
    if isSuccess then
        self.m_data  = data;
        self:refresh();
    end
end

--------------------------------点击回掉函数--------------------------------

RedEnvelopeRecordLayer.onBindToClose = function(self)
    self:close();
end

RedEnvelopeRecordLayer.onBindToRank = function(self)
    Log.v("RedEnvelopeRecordLayer","onBindToRank");
    local callBack = function()
        LayerManagerIsolater.getInstance():show("redenvelope_record");
    end

    StateMachine.getInstance():pushState(States.RankList,nil,nil,RankListConstants.eRankType.RedEnvelope,callBack);
    self:close();
end

RedEnvelopeRecordLayer.onBindToSend = function(self)
    Log.v("RedEnvelopeRecordLayer","onBindToSend");
    self:close();
    LayerManagerIsolater.getInstance():show("redenvelope_config");
end

return RedEnvelopeRecordLayer;