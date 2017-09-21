require("common/commonGameLayer");
require("uilibs/dotView");
require("ui/viewPager");
require("hall/main/widget/hallGameListPageView");
local hallGameListView = require(ViewPath .. "hall/main/hallGameListView");

--[[
	大厅游戏列表的界面
]]
HallGameListView = class(CommonGameLayer, false);

HallGameListView.Delegate = {
    onMatchBtnClick = "onMatchBtnClick";
    onHallBtnClick = "onHallBtnClick";
    onCommunityBtnClick = "onCommunityBtnClick";
}

HallGameListView.s_onUpdateGameListView = EventDispatcher.getInstance():getUserEvent();

HallGameListView.s_controls = 
{
	gameListView = 1,
	dotView = 2,	
}

HallGameListView.firstViewData = {};

HallGameListView.ctor = function(self)
    super(self, hallGameListView);
    self.m_ctrl = HallGameListView.s_controls;
    self.m_gameList = {};
    self.m_pageTotalCount = 0;

    EventDispatcher.getInstance():register(HallGameListView.s_onUpdateGameListView,self,self.updateView);
    HallDataInterface.getInstance():setObserver(self);
    UpdateHandleMgr.getInstance():setObserver(self);
end

HallGameListView.dtor = function(self)
    EventDispatcher.getInstance():unregister(HallGameListView.s_onUpdateGameListView,self,self.updateView);
    HallDataInterface.getInstance():clearObserver(self);
    UpdateHandleMgr.getInstance():clearObserver(self);
end

HallGameListView.show = function(self, gameList)
	self:setVisible(true);
	if not table.isEmpty(gameList) then
		self.m_gameList = gameList;
		self.m_pageTotalCount = #gameList;
        self.m_curPage = 1;
		self:__createViewPager();
		self:__createDotView();
		self:__createArrow();
	end
end

HallGameListView.hide = function(self)
	self:setVisible(false);
end

HallGameListView.reset = function(self)

end

HallGameListView.__createViewPager = function(self)
	if not self.m_viewPager then
		local gameListView = self:findViewById(self.m_ctrl.gameListView);
		self.m_adapter = new(CacheAdapter, HallGameListPageView, self.m_gameList);
		self.m_viewPager = new(ViewPager,0,0,gameListView:getSize());					--构建ViewPager,后面四个参数分别为:x,y,width,height
		self.m_viewPager:setAdapter(self.m_adapter);								--设置adapter
		self.m_viewPager:setOnPageChanged(self,self.onPageChanged);			--设置在显示的页码改变时候的回调
		gameListView:addChild(self.m_viewPager);
	else
		self.m_adapter:changeData(self.m_gameList);

		if self.m_viewPager:getScroller() then
            local lastPage = self.m_viewPager:getCurPage();
            self.m_viewPager:setPage(table.isEmpty(self.m_gameList) and 0 or 1);
            if lastPage ~= 0 then
                self.m_viewPager:setPage(lastPage > self.m_pageTotalCount and self.m_pageTotalCount or lastPage );
            end
        end
	end
end

HallGameListView.__createDotView = function(self)
	if not self.m_dotView then
		self.m_dotView = new(DotView,true,nil,"hall/common/spot_select1.png","hall/common/spot_unselect1.png");
		self:findViewById(self.m_ctrl.dotView):addChild(self.m_dotView);
		self.m_dotView:setAlign(kAlignCenter);
	end

	if self.m_pageTotalCount <= 1 then
		self.m_dotView:setVisible(false);
	else
		self.m_dotView:setDotCount(self.m_pageTotalCount);
		self.m_dotView:setSelectedIndex(1);
		self.m_dotView:setVisible(true);		
	end
end

HallGameListView.__createArrow = function(self)
	if not self.m_leftArrow then
		local ArrowView = require("hall/main/widget/arrowView");
		self.m_leftArrow = new(ArrowView, "left");
		self.m_rightArrow = new(ArrowView, "right");
		self.m_redDotView = new(Image, "hall/common/msg_icon.png");
		self.m_redDotView:setAlign(kAlignCenter);
		self.m_redDotView:setPos(0, -25);
		self.m_redDotView:setVisible(false);
		self.m_rightArrow:addChild(self.m_redDotView);

		self:addChild(self.m_leftArrow);
		self:addChild(self.m_rightArrow);
		self.m_leftArrow:setAlign(kAlignLeft);
		self.m_leftArrow:setPos(15, nil);
		self.m_rightArrow:setAlign(kAlignRight);
		self.m_rightArrow:setPos(15, nil);

		self.m_leftArrow:setEventTouch(self, self.onLeftArrowTouch);
		self.m_rightArrow:setEventTouch(self, self.onRightArrowTouch);
	end

	if self.m_pageTotalCount <= 1 then
		self.m_leftArrow:setVisible(false);
		self.m_rightArrow:setVisible(false);
	else
		self.m_leftArrow:setVisible(false);
		self.m_rightArrow:setVisible(true);

        self:checkArrowView();
	end
end

HallGameListView.onLeftArrowTouch = function(self,finger_action,x,y,drawing_id_first,drawing_id_current)
	if finger_action == kFingerDown or finger_action == kFingerMove then 
	elseif drawing_id_first == drawing_id_current then
		self.m_viewPager:setPage(self.m_viewPager:getCurPage() -1);
	end
end

HallGameListView.onRightArrowTouch = function(self,finger_action,x,y,drawing_id_first,drawing_id_current)
	if finger_action == kFingerDown or finger_action == kFingerMove then 
	elseif drawing_id_first == drawing_id_current then
		self.m_viewPager:setPage(self.m_viewPager:getCurPage() + 1);
	end
end

HallGameListView.onPageChanged = function(self,curPage,lastPage)
	self.m_curPage = curPage;
	self:checkArrowView();
end

HallGameListView.checkArrowView = function(self)
	self.m_dotView:setSelectedIndex(self.m_curPage);
	if self.m_curPage == 1 then
		self.m_leftArrow:setVisible(false);
		self.m_rightArrow:setVisible(true);
		self:checkRedDotView();
	elseif self.m_curPage == self.m_pageTotalCount then
		self.m_leftArrow:setVisible(true);
		self.m_rightArrow:setVisible(false);
	else
		self.m_leftArrow:setVisible(true);
		self.m_rightArrow:setVisible(true);
		self:checkRedDotView();
	end
end

HallGameListView.checkRedDotView = function(self)
	local openState = kGameManager:getMoreGamesOpenStatus();
	self.m_redDotView:setVisible(openState);
end

HallGameListView.updateView = function(self)
	if self.m_adapter then
		self.m_adapter:updateAll();
	end
end

-- 顶部条按钮回调
HallGameListView.onMatchBtnClick = function(self)
	self:execDelegate(HallGameListView.Delegate.onMatchBtnClick);
end

HallGameListView.onCommunityBtnClick = function(self)
	self:execDelegate(HallGameListView.Delegate.onCommunityBtnClick);
end

--@brief 获取游戏玩家数目回调
HallGameListView.onGetHallGamePlayerNumsCallBack = function(self, isSuccess, gamePlayersMap)
	self:updateView();
end

--@brief 下载游戏成功回调
HallGameListView.downloadGameSuccessed = function(self, data)
	self:updateView();
end

--@brief 更新游戏成功回调
HallGameListView.updateGameSuccessed = function(self, gameId)
	self:updateView();
end

HallGameListView.updateTopView = function(self)
	
end

HallGameListView.s_controlConfig = {
	[HallGameListView.s_controls.gameListView] = {"gameListView"},
	[HallGameListView.s_controls.dotView] = {"gameListView", "dotView"},	
}



