--------------------------------------
--------------碎片信息界面--------------
--------------------------------------
local InfoWidgetBase = require("hall/backpack/widget/popWnd/InfoWidgetBase");
local InfoWidgetShard = class(InfoWidgetBase,false);

InfoWidgetShard.s_layerName = "case_shard_use";

InfoWidgetShard.ctor = function(self,p_data)
    self.m_data = p_data;	
    self.m_canCompoundCount = #self.m_data.compoundTable;
	super(self,InfoWidgetShard.s_layerName);
end

InfoWidgetShard.dtor = function(self)	
	
end
 
--初始化
InfoWidgetShard.init = function(self)

	InfoWidgetBase.init(self);

    self.mm_Text_numOrday:setText("数量： "..self.m_data.number);
    if self.m_canCompoundCount < 2 then
        local __num = math.floor(self.m_data.number/self.m_data.compoundTable[1].debris_num);
        self.mm_btnDescribe:setText("合成("..__num..")");
        --按钮不可用
        if __num <=0 then
            self.mm_useBtn:setEnable(false);
        end
    else
        self.mm_btnDescribe:setText("合成");
    end
end

--关闭按钮绑定
InfoWidgetShard.onbutton_CloseClick = function(self)
	InfoWidgetBase.onbutton_CloseClick(self);
end


--使用按钮绑定
InfoWidgetShard.onbutton_useClick = function(self)
    if self.m_canCompoundCount < 2 then
	   BackpackDataInterface.getInstance():shardMerge(self.m_data,self.m_data.compoundTable[1].target_id);
    else
        LayerManagerIsolater.getInstance():show("case_detail_shard",self.m_data);
        self:onbutton_CloseClick();
    end 
end


return InfoWidgetShard;
