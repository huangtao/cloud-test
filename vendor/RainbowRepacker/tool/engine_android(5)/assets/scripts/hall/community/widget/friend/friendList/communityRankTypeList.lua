require("common/commonGameLayer");
local community_pin_map = require("qnFiles/qnPlist/hall/community_pin")
local communityRankTypeList = require(ViewPath .. "hall/community/friend/friendlist/communityRankTypeList");
local communityRankTypeName = require(ViewPath .. "hall/community/friend/friendlist/communityRankTypeName");

local CommunityRankTypeList = class(CommonGameLayer, false);
local CommunityRankTypeName = class(Node);

CommunityRankTypeName.ctor = function(self, data)
    if not table.isTable(data) then
        return;
    end
    self.m_data = data;
    local view = SceneLoader.load(communityRankTypeName);
    self:setSize(view:getSize());
    -- self:setFillParent(true,false);
    self:addChild(view);

    local nameText = view:getChildByName("name");
    nameText:setText(data.name or "");
end


CommunityRankTypeList.s_maxShowItemCount = 6;

CommunityRankTypeList.kDirectionUp = 1;
CommunityRankTypeList.kDirectionDown = 2;

CommunityRankTypeList.s_bgImage         = community_pin_map["rankType_selected.png"];
CommunityRankTypeList.s_defaultbgImage  = community_pin_map["rankType_select.png"];
CommunityRankTypeList.s_arrowUpImage    = community_pin_map["up.png"];
CommunityRankTypeList.s_arrowDownImage  = community_pin_map["down.png"];

local h_index = 0;
local getIndex = function(self)
    h_index = h_index + 1;
    return h_index;
end

CommunityRankTypeList.s_controls = {
    clickBg = getIndex();
    rankTypeBg = getIndex();
    arrow     = getIndex();
    contentView = getIndex();
    listView = getIndex();
    clickIcon = getIndex();
}

CommunityRankTypeList.ctor = function(self, direction, data)
    super(self, communityRankTypeList);
    self:setSize( self.m_root:getSize() );
    --self:setFillParent(false, false);
    self.m_ctrl = CommunityRankTypeList.s_controls;

    self.m_direction = direction or CommunityRankTypeList.kDirectionDown;
    self.m_itemLayer = CommunityRankTypeName;
    self.m_clickIcon = self:findViewById(self.m_ctrl.clickIcon);
    self:__init();

    self:setData(data);
end

CommunityRankTypeList.dtor = function(self)
    self:cleanUpTimer();
end

CommunityRankTypeList.setDefaultBgImage = function(file)
    if string.isEmpty(file) then
        CommunityRankTypeList.s_bgImage = community_pin_map["game_sel_bg.png"];
    else
        CommunityRankTypeList.s_bgImage = file;
    end
end

CommunityRankTypeList.setOnItemClick = function(self, obj, func)
    self.m_eventCallBackObj = obj;
    self.m_eventCallBackFunc = func;
end

CommunityRankTypeList.setData = function(self, data)
    self.m_data = table.verify(data);
    self:__resortChooseList();
end

CommunityRankTypeList.setSelectItemData = function(self, itemData)
    self:__resortChooseList(itemData);
end

CommunityRankTypeList.revisePos = function(self)
    self.super.revisePos(self);
    
    self:revisePopListBackground();
end

CommunityRankTypeList.revisePopListBackground = function(self)
    if self.m_clickBg then
        local x ,y = self:getAbsolutePos();
        self.m_clickBg:setPos(-x+43,-y-195);
    end
end

CommunityRankTypeList.__resortChooseList = function(self, curSelectItemData)
    if not table.isEmpty(curSelectItemData) then
        local index;
        for k,v in ipairs(self.m_data) do
            if v.name == curSelectItemData.name then
                index = k;
                break;
            end
        end

        if index then
            table.remove(self.m_data, index);
            if self.m_direction == CommunityRankTypeList.kDirectionDown then
                table.insert(self.m_data, 1, curSelectItemData);
            else
                table.insert(self.m_data, 1, curSelectItemData);
            end
        end
    end
    self:__refreshChooseList();
end

CommunityRankTypeList.__init = function(self)
    self:__initListView();
end


CommunityRankTypeList.__initListView = function(self)
   
    self.m_rankTypeBg = self:findViewById(self.m_ctrl.rankTypeBg);
    self.m_arrow = self:findViewById(self.m_ctrl.arrow);
    self.m_contentView = self:findViewById(self.m_ctrl.contentView);
    self.m_listView = self:findViewById(self.m_ctrl.listView);
    self.m_listView:setScrollBarWidth(0);
    self.m_listView:setOnItemClick(self, self.onChooseListItemClick);
    
    self.m_clickBg = self:findViewById(self.m_ctrl.clickBg);
    self.m_clickBg:setPickable(false);
    self.m_clickBg:setEventDrag(self, function() end);
    self.m_clickBg:setSize(System.getScreenWidth()/System.getLayoutScale(), System.getScreenHeight()/System.getLayoutScale());
    self.m_isChooseListShowing = false;
    self.m_rankTypeBg:setFile(CommunityRankTypeList.s_defaultbgImage);


    if self.m_rankTypeBg.m_res then
        local width = self.m_rankTypeBg.m_res:getWidth();
        local height = self.m_rankTypeBg.m_res:getHeight();
        self.m_rankTypeBg:setSize(width, height);
        self.m_root:setSize(width, height);
        self:setSize(width, height);
        self.m_contentView:setSize(width, height);
    end

    if self.m_direction == CommunityRankTypeList.kDirectionUp then
        self.m_arrow:setFile(CommunityRankTypeList.s_arrowUpImage);
    else
        self.m_arrow:setFile(CommunityRankTypeList.s_arrowDownImage);
    end
end

CommunityRankTypeList.onRankTypeBgClick = function(self, finger_action, x, y, drawing_id_first, drawing_id_current)
    if finger_action ~= kFingerDown and finger_action ~= kFingerMove then
        --在按起的时候
        self:__toggleChooseList();
    end
end

CommunityRankTypeList.__toggleChooseList = function(self)
    local lastShowingStatus = self.m_isChooseListShowing;
    if lastShowingStatus then
        self:__hideChooseList();
    else
        self:__showChooseList();
    end
end

CommunityRankTypeList.onBgClick = function(self,finger_action)
    if self.m_isChooseListShowing then
        self:onRankTypeBgClick(finger_action);   
    end
end

CommunityRankTypeList.__hideChooseList = function(self)
    self.m_isChooseListShowing = false;
    self:__refreshArrowStatus();
    self:__refreshChooseList();
    self.m_listView:setPickable(false);
    self.m_listView:setScrollBarWidth(0);
end

CommunityRankTypeList.__showChooseList = function(self)
    if #self.m_data == 0 then
        return;
    end

    self.m_isChooseListShowing = true;
    self:__refreshArrowStatus();
    self:__refreshChooseList();
    self.m_listView:setPickable(true);
    self.m_listView:setScrollBarWidth(8);
end

CommunityRankTypeList.__refreshChooseList = function(self)
    if #self.m_data == 0 then
        return;
    end

    if not self.m_adapter then
        self.m_adapter = UIFactory.createCacheAdapter(self.m_itemLayer, self.m_data);
        self.m_listView:setAdapter(self.m_adapter);
    else
        self.m_adapter:changeData(self.m_data);
    end
    self:__resetListSize();   

    if self.m_direction == CommunityRankTypeList.kDirectionUp then
        self.m_listView:gotoTop();
    end 
end

CommunityRankTypeList.__refreshArrowStatus = function(self)
    self.m_arrow:setVisible( #self.m_data > 0 );
    self.m_clickBg:setPickable(self.m_isChooseListShowing);

    if self.m_direction == CommunityRankTypeList.kDirectionUp then
        local img = self.m_isChooseListShowing and CommunityRankTypeList.s_arrowDownImage or CommunityRankTypeList.s_arrowUpImage;
        self.m_arrow:setFile(img);
        local image = self.m_isChooseListShowing and CommunityRankTypeList.s_bgImage or CommunityRankTypeList.s_defaultbgImage;
        self.m_rankTypeBg:setFile(image)
    else
        local img = self.m_isChooseListShowing and CommunityRankTypeList.s_arrowUpImage or CommunityRankTypeList.s_arrowDownImage;
        self.m_arrow:setFile(img);       
    end
end

CommunityRankTypeList.__resetListSize = function(self)
    if self.m_listView then
        local w,h = self:getSize();
        local maxCount = 1;
        if self.m_isChooseListShowing then
            maxCount = math.min(#self.m_data, CommunityRankTypeList.s_maxShowItemCount);
            maxCount = math.max(maxCount, 1);
        end

        local offset = 0;--maxCount > 1 and 30 or 0;
        local list_h = maxCount*h + offset;

        self.m_rankTypeBg:setSize(nil ,list_h);
        self.m_contentView:setSize(nil, list_h-offset/2);
        self.m_listView:setSize(nil, list_h-offset/2);

        local content_x, content_y = self.m_contentView:getUnalignPos();
        local content_w, content_h = self.m_contentView:getSize();
        self.m_contentView:setClip(content_x, content_y, content_w, content_h);-- -6去掉下面那条线
    end
end

CommunityRankTypeList.__setIsShowClickIcon = function (self,visible,index,data)
    local image = {"rankTop.png","rankCenter.png","rankCenter.png","rankCenter.png","rankCenter.png","rankBottom.png"};
    self.m_clickIcon:setVisible(visible);
    self.m_clickIcon:setFile(community_pin_map[image[index]]);
    self.m_clickIcon:setSize(self.m_clickIcon.m_res:getWidth(),self.m_clickIcon.m_res:getHeight());
    self.m_clickIcon:setPos(nil,54*(index-1));
    self:cleanUpTimer();
    self.m_timer = AnimFactory.createAnimInt(kAnimNormal ,0,1,0.5);
    self.m_timer:setDebugName("CommunityRankTypeList|__setIsShowClickIcon");
	self.m_timer:setEvent(self,self.onCheckTimeout);
end

CommunityRankTypeList.cleanUpTimer = function (self)
    if self.m_timer then
        delete(self.m_timer);
    end
    self.m_timer = nil;
end

CommunityRankTypeList.onCheckTimeout = function (self)
    local data = self.m_itemData;
    self:cleanUpTimer();
    self.m_clickIcon:setVisible(false);
    self:__hideChooseList();
    CommunityDataInterface.getInstance():friendListSort(data.name);
    self:__resortChooseList(data);
end

CommunityRankTypeList.onChooseListItemClick = function(self,adapter,view,index)
    local data = adapter:getData();
    local itemData = data[index];
    UBReport.getInstance():report(UBConfig.kHallCommunityRankChooseList, (itemData and itemData.name) and itemData.name or "");
    if self.m_isChooseListShowing then
        self.m_itemData = itemData;
        self:__setIsShowClickIcon(true,index,itemData);
    else
        self:__showChooseList();
        self.m_itemData = itemData;
        self:__resortChooseList(itemData);
    end
    
    if self.m_eventCallBackObj and self.m_eventCallBackFunc then
        self.m_eventCallBackFunc(self.m_eventCallBackObj, itemData);
    end
end

CommunityRankTypeList.s_controlConfig = {
    [CommunityRankTypeList.s_controls.rankTypeBg]   = {"rankTypeBg"};
    [CommunityRankTypeList.s_controls.contentView]  = {"rankTypeBg", "contentView"};
    [CommunityRankTypeList.s_controls.listView]     = {"rankTypeBg", "contentView", "listView"};
    [CommunityRankTypeList.s_controls.arrow]        = {"rankTypeBg", "arrow"};
    [CommunityRankTypeList.s_controls.clickBg]      = {"clickBg"};
    [CommunityRankTypeList.s_controls.clickIcon]      = {"rankTypeBg", "contentView","clickIcon"};
    
}

CommunityRankTypeList.s_controlFuncMap = {
    [CommunityRankTypeList.s_controls.rankTypeBg] = CommunityRankTypeList.onRankTypeBgClick;
    [CommunityRankTypeList.s_controls.clickBg] = CommunityRankTypeList.onBgClick;
}

return CommunityRankTypeList;

