require("hall/community/data/timeHandler");
require("util/StringLib");
local RedEnvelopeDetailItem = class(CommonGameLayer,false);


RedEnvelopeDetailItem.ctor = function(self,data)
    if not data then
        return ;
    end

    self.m_data = data;
    local __configTable = require(ViewPath .. "hall/redEnvelope/detail_item");
    super(self,__configTable);
    self:declareLayoutVar(ViewPath.."hall/redEnvelope/detail_item_layout_var");
    local offX,offY = 50,0;
    local width,height = self.m_root:getSize();
    self.m_root:setPos(offX/2,offY/2);
    self:setSize(width + offX,height + offY);
    self.IMAGE = require("qnFiles/qn_res_alias_map");

    self:init();
end

RedEnvelopeDetailItem.getHandle = function(self)
   --self.frameBack = self:findViewById(self.s_controls.frameBack);
end


RedEnvelopeDetailItem.init = function(self)
    local nickName = string.subUtfStrByCn(self.m_data.nick,1,6,"");
    self:findViewById(self.s_controls.Text_nickname):setText(nickName);
    self:findViewById(self.s_controls.Text_num):setText(self.m_data.money);

    local _iconImagePaht = self.IMAGE.iso_gold;
    self.m_data.type = tonumber(self.m_data.type) or 0;
    if self.m_data.type == 1 then
        _iconImagePaht = self.IMAGE.iso_crystal;
    end
    self:findViewById(self.s_controls.Image_money):setFile(_iconImagePaht);

    if self.m_data.isFirst then
        local width,height = self.m_root:getSize();
        self:setSize(nil,height*1.5);
        local aa = self:findViewById(self.s_controls.Text_num);
        aa:setColor(252,243,28);

        local __firstDesc = new(Text,"手气最佳",nil,nil,kAlignLeft,nil,18,252,243,28); 
        __firstDesc:setPos(200,40);

        self:findViewById(self.s_controls.Image_line):setPos(nil,height*-0.5);

        self:addChild(__firstDesc);
    end
end

RedEnvelopeDetailItem.onBindInfo = function(self)
    CommunityDataInterface.getInstance():requestUserInfoCustom(nil,self.m_data.mid,",silver");
end

return RedEnvelopeDetailItem;

