require("isolater/widget/gameLevelListCustomView/gameLevelListViewBase");
require("isolater/widget/gameLevelListCustomView/commonGameRoomLevelItemGroup")

local CommonGameLevelListView = class(GameLevelListViewBase);

CommonGameLevelListView.__groupGameData = function(self, data, count)
    if table.isEmpty(data) then 
        return; 
    end
    count = count or 2;
    local tmpData = table.copyTab(data);

    groupData = {}; -- 分组后的数据
    local pos = 1;
    for k, v in ipairs(tmpData) do 
        if not groupData[pos] then 
            groupData[pos] = {};
        end
        table.insert(groupData[pos], v);
        if #groupData[pos] >= count then 
            pos = pos + 1;
        end
    end
    return groupData;
end

CommonGameLevelListView.refreshRoomLevelList = function(self)
    self:generateLevelList();

    if not self.m_viewPager then
        self.m_viewPager = new(ListView,0,0,self:getSize());
        self.m_viewPager:setDirection(kVertical);
        self:addChild(self.m_viewPager); 
    end

    local data = self:__groupGameData(self.m_levelList, 2);
    if not data or #data <= 0 then
        self.m_viewPager:setVisible(false);
        return;
    else
        self.m_viewPager:setVisible(true);
        if not self.m_adapter then
            CommonGameRoomLevelItemGroup.setDefaultSize( self.m_viewPager:getSize() );
            CommonGameRoomLevelItemGroup.setPageItemClass( self:getItemClass() );
            self.m_adapter = new(CacheAdapter, CommonGameRoomLevelItemGroup, data);
            self.m_viewPager:setAdapter(self.m_adapter);
        else
            self.m_adapter:changeData(data);
        end
    end
end

--virtual
CommonGameLevelListView.generateLevelList = function(self)
end

--virtual
CommonGameLevelListView.getItemClass = function(self)
    return require("isolater/widget/gameLevelListCustomView/commonGameRoomLevelItem")
end

return CommonGameLevelListView;