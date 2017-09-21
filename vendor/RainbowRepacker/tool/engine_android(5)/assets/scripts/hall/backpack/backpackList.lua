-- BackpackList.lua
-- Author:Demon
-- Date:2016/12/28
-- Last modification:
-- Description:物品列表
-- Note:
require("hall/backpack/data/backpackDataInterface");

local hallLayerBaseWithName = require("hall/widget/hallLayerBaseWithName");
local BackpackList = class(hallLayerBaseWithName,false);
BackpackList.s_layerName = "case_list_ui";


BackpackList.ctor = function(self,p_data)	
    local __layout = require(ViewPath .. "hall/newObjectCase/newObjectCase");
    super(self,__layout,nil,BackpackList.s_layerName );
    self:declareLayoutVar(ViewPath.."hall/newObjectCase/newObjectCase".."_layout_var");
    BackpackDataInterface.getInstance():setObserver(self);

    self.m_data = p_data;

	self:setFillParent(true, true);
    self:addToRoot();

    self:getHandle();
	self:init();
    self:setListenBackEvent(true);
    --进来物品箱时，把大厅物品箱icon隐藏红色标识
    BackpackDataInterface.getInstance():setIconRed(false);
end

BackpackList.dtor = function(self)	
    BackpackDataInterface.getInstance():clearObserver(self);
end

--得到相关句柄
BackpackList.getHandle = function(self)
    self:getComponent();
    self:runUiAction(UiAnimConfig.ACTION.BEGIN, self.mm_ImageBack);
end

BackpackList.onUiBeginActionFinish = function(self)
    BackpackDataInterface.getInstance():getBagList(false);
end

BackpackList.init = function(self)
    self.mm_View_bagBlank:setVisible(false);
end

BackpackList.onGetBagListCallBack = function(self,isSuccess, data,sendParam)
    if isSuccess then
        --判断数据是否为空
        self.m_data = data;
        if self.m_gridView then
            self.mm_View_content_bag:removeChild(self.m_gridView,true);
            self.m_gridView = nil;
        end

        if table.isEmpty(self.m_data) then
            self.mm_View_bagBlank:setVisible(true);
            
            return;
        else
            self.mm_View_bagBlank:setVisible(false);
        end

        local sizeX,sizeY = self.mm_View_content_bag:getSize();
        local x,y,w,h = 0,0,sizeX,sizeY;

        self.m_gridView = UIFactory.createGridView(x,y,w,h);
        self.m_gridView:setScrollBarWidth(0);
        local BackpackItem = require("hall/backpack/widget/backpackItem");
        self.m_bagListadApter = UIFactory.createCacheAdapter(BackpackItem,self.m_data);   
        self.m_gridView:setAdapter(self.m_bagListadApter);
        self.mm_View_content_bag:addChild(self.m_gridView);
    else
        return;
    end
end

BackpackList.onBindBlankFunc = function(self)

end


BackpackList.onBindToRecord = function(self)
    LayerManagerIsolater.getInstance():show("case_record_ui");
end

return BackpackList;