local RedEnvelopeConfigItem = class(CommonGameLayer,false);


RedEnvelopeConfigItem.ctor = function(self,data)
    if not data then
        return ;
    end

    self.m_data = data;
    local __configTable = require(ViewPath .. "hall/redEnvelope/config_item");
    super(self,__configTable);
    self:declareLayoutVar(ViewPath.."hall/redEnvelope/config_item_layout_var");
    local offX,offY = 0,0;
    local width,height = self.m_root:getSize();
    self.m_root:setPos(offX/2,offY/2);
    self:setSize(width + offX,height + offY);
    self.IMAGE = require("qnFiles/qn_res_alias_map");

    self:init();
end

RedEnvelopeConfigItem.dtor = function(self)
    if self.m_animForDelay then
        delete(self.m_animForDelay);
        self.m_animForDelay = nil;
    end
end 


RedEnvelopeConfigItem.getHandle = function(self)
   --self.frameBack = self:findViewById(self.s_controls.frameBack);
end


RedEnvelopeConfigItem.init = function(self)
    self:findViewById(self.s_controls.Text_num):setText(self.m_data.num.."个");
    self:findViewById(self.s_controls.Text_gold_num):setText(self.m_data.money);

    local _iconImagePaht = self.IMAGE.iso_gold;
    if self.m_data.type == 1 then
        _iconImagePaht = self.IMAGE.iso_crystal;
    end
    self:findViewById(self.s_controls.Image_gold_icon):setFile(_iconImagePaht);

    self:findViewById(self.s_controls.Image_congratulation):setFile(self.m_data.desImage);

    if self.m_data.isDefaultSelected then

        self.m_animForDelay = new(AnimInt , kAnimNormal, 0, 1 ,1, -1);
	    self.m_animForDelay:setDebugName("RedEnvelopeConfigItem m_animForDelay");
	    self.m_animForDelay:setEvent(self, function()
            self:onBindToSelected();
            delete(self.m_animForDelay);
            self.m_animForDelay = nil;
	    end);
        
    end
end

--------------------------------控件点击回调---------------------------------------
RedEnvelopeConfigItem.onBindToSelected = function(self)
    Log.v("RedEnvelopeConfigItem","onBindToSelected");
    self.m_data.selectFrame:setVisible(true);
    self:findViewById(self.s_controls.Button_selected):addChild(self.m_data.selectFrame);

    local __x,__y = self:findViewById(self.s_controls.Button_selected):getAbsolutePos();
    self.m_data.callFunc(self.m_data.id,{x=__x,y=__y});
end


return RedEnvelopeConfigItem;

