local newObjectCaseRecordItem = require(ViewPath .. "hall/newObjectCase/newObjectCaseRecordItem");
require("hall/backpack/data/typeAdapter");
require("isolater/interface/regionConfigIsolater");
require("hall/community/data/timeHandler");
require("util/StringLib");

local BackpackRecordItem = class(CommonGameLayer,false);

BackpackRecordItem.ctor = function(self,data)
    if not data then
        return ;
    end
    local __layout = require(ViewPath .. "hall/newObjectCase/newObjectCaseRecordItem");
    super(self,__layout );
    self:declareLayoutVar(ViewPath.."hall/newObjectCase/newObjectCaseRecordItem".."_layout_var");
    self:setSize(self.m_root:getSize());

    self.m_data = data;   

    self:getHandle();

    local moduleData = self:dataAdapter(data);  

    self:init(moduleData);
    
end

BackpackRecordItem.dtor = function(self)
    
end

BackpackRecordItem.getHandle = function(self)

   self.mm_Text_prizeName = self:findViewById(self.s_controls.Text_prizeName);
   self.mm_Text_date = self:findViewById(self.s_controls.Text_date);
   self.mm_Text_state= self:findViewById(self.s_controls.Text_state);

end 

BackpackRecordItem.dataAdapter = function(self,p_data)  
   local itemData = {};
   itemData.prizeName = p_data.name or "";
   itemData.date = TimeHandler.getRedEnvelopeRecordTimeString(p_data.dateStamp) or "";
   itemData.stateText = p_data.status or "";

   return itemData;
end

BackpackRecordItem.init = function(self,p_data)
   local __tmpText = string.subUtfStrByCn(p_data.prizeName,1,8,"");
   self.mm_Text_prizeName:setText(__tmpText);
   self.mm_Text_date:setText(p_data.date);
   self.mm_Text_state:setText(p_data.stateText);
   if p_data.stateText == "审核中" or p_data.stateText == "充值中" or p_data.stateText == "已退还" then
      self.mm_Text_state:setColor(207,70,22);
   end
end

BackpackRecordItem.onBindToShare = function(self)
  __clientType = self.m_data.clientType
  LayerManagerIsolater.getInstance():show("case_congratulation",self.m_data,__clientType);
end

return BackpackRecordItem;