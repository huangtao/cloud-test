-- BackpackRecord.lua
-- Author:Demon
-- Date:2016/12/28
-- Last modification:
-- Description:兑换记录
-- Note:
require("hall/backpack/data/backpackDataInterface");

local hallLayerBaseWithName = require("hall/widget/hallLayerBaseWithName");
local BackpackRecord = class(hallLayerBaseWithName,false);
BackpackRecord.s_layerName = "case_record_ui";


BackpackRecord.ctor = function(self,p_data)
    local __layout = require(ViewPath .. "hall/newObjectCase/newObjectCaseRecord");
    super(self,__layout,nil,BackpackRecord.s_layerName );
    self:declareLayoutVar(ViewPath.."hall/newObjectCase/newObjectCaseRecord".."_layout_var");
    BackpackDataInterface.getInstance():setObserver(self);

    self.m_data = p_data;

	self:setFillParent(true, true);
    self:addToRoot();

    self:getHandle();
    
	self:init();
    self:setListenBackEvent(true);
end

BackpackRecord.dtor = function(self)	
    BackpackDataInterface.getInstance():clearObserver(self);
end

--得到相关句柄
BackpackRecord.getHandle = function(self)
    self:getComponent();
    self:runUiAction(UiAnimConfig.ACTION.BEGIN, self.mm_ImageBack);
end

BackpackRecord.onUiBeginActionFinish = function(self)
    BackpackDataInterface.getInstance():getRecordListInfo(false);
end

BackpackRecord.init = function(self)
    self.mm_View_nothing:setVisible(false);
end

BackpackRecord.onGetRecordListInfoCallBack = function(self,isSuccess, data,sendParam)
    if isSuccess then
        self.m_data = data;
        if self.m_recordList then
            self.mm_View_list_bg:removeChild(self.m_recordList,true);
            self.m_recordList = nil;
        end
        if table.isEmpty(self.m_data) then
            self.mm_View_nothing:setVisible(true);
            return;
        end
        self.mm_View_nothing:setVisible(false);
        local w,h = self.mm_View_list_bg:getSize();
        self.m_recordList = new(ListView,0,0,w,h);
        local __class = require("hall/backpack/widget/backpackRecordItem");
        self.m_adapter = new(CacheAdapter,__class,self.m_data);
        self.m_recordList:setScrollBarWidth(0);
        self.m_recordList:setAdapter(self.m_adapter);
        self.mm_View_list_bg:addChild(self.m_recordList);
    else
        return;
    end
end

BackpackRecord.oncloseBtnClick = function(self)
    self:close();
end

return BackpackRecord;