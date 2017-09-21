require("hall/community/data/timeHandler");
local RedEnvelopeRecordItem = class(CommonGameLayer,false);


RedEnvelopeRecordItem.ctor = function(self,data)
    if not data then
        return ;
    end

    self.m_data = data;
    local __configTable = require(ViewPath .. "hall/redEnvelope/record_item");
    super(self,__configTable);
    self:declareLayoutVar(ViewPath.."hall/redEnvelope/record_item_layout_var");
    local offX,offY = 0,0;
    local width,height = self.m_root:getSize();
    self.m_root:setPos(offX/2,offY/2);
    self:setSize(width + offX,height + offY);
    self.IMAGE = require("qnFiles/qn_res_alias_map");

    self:init();
end

RedEnvelopeRecordItem.getHandle = function(self)
   --self.frameBack = self:findViewById(self.s_controls.frameBack);
end


RedEnvelopeRecordItem.init = function(self)
    self:findViewById(self.s_controls.Text_num):setText(self.m_data.money);

    local _iconImagePaht = self.IMAGE.iso_gold;
    if self.m_data.type == 1 then
        _iconImagePaht = self.IMAGE.iso_crystal;
    end
    self:findViewById(self.s_controls.Image_gold_icon):setFile(_iconImagePaht);

    local formatTimeString = TimeHandler.getRedEnvelopeRecordTimeString(self.m_data.time);
    self:findViewById(self.s_controls.Text_time):setText(formatTimeString);

    local __getString = self.m_data.take.."/"..self.m_data.num

    if self.m_data.take == self.m_data.num then
        local aa = self:findViewById(self.s_controls.Text_status);
        __getString = "已领完";
        self:findViewById(self.s_controls.Text_status):setText(__getString);
        aa:setColor(56,142,84);
    else    
        self:findViewById(self.s_controls.Text_status):setText(__getString);
    end
end

--------------------------------控件点击回调---------------------------------------
RedEnvelopeRecordItem.onBindLook = function(self)
    LayerManagerIsolater.getInstance():hide("redenvelope_record");

    local __call = function()
        LayerManagerIsolater.getInstance():show("redenvelope_record");
    end
    LayerManagerIsolater.getInstance():show("redenvelope_detail",{
        id = self.m_data.id,
        func_back = __call ,
        isNeedShowAllTakeMoneyNum = true,
        isJustSendRedEnvelop = false;
        takenum = 0,
        num = tonumber(self.m_data.num) or 0,
        takemoney = 0,
        totalmoney = tonumber(self.m_data.money) or 0,
        type = tonumber(self.m_data.type) or 0
        });
end


return RedEnvelopeRecordItem;

