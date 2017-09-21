
local chatExpress_new = require("view/kScreen_1280_800/games/common2/chat/chatExpress_new");
-- require(RoomChatConfig.s_chatPathPrefix.."res/chatExpression_pin2");

local ChatExpressionWnd2 = class(PopupWindow,false);

ChatExpressionWnd2.s_commonPhrasesHeight = 78;
ChatExpressionWnd2.s_fontSize = 25;

ChatExpressionWnd2.s_ExpressGridWidth = 199;
ChatExpressionWnd2.s_ExpressGridHeight = 180;
ChatExpressionWnd2.s_VipExpressGridWidth = 169;
ChatExpressionWnd2.s_VipExpressGridHeight = 169;
ChatExpressionWnd2.s_chatFontSize = 37;
ChatExpressionWnd2.s_chatMargin = 15;

ChatExpressionWnd2.s_sizePerPag = 9; -- 每页表情个数

local Express_Tab_Color_Selected = {30,140,200};
local Express_Tab_Color_Unselect = {230,240,255};


ChatExpressionWnd2.Delegate = {
    onChatTextItemClick = "requestSendChatText";
    onChatFaceItemClick = "requestSendChatFace";
    RequestVipCharge = "onRequestVipCharge";
};

ChatExpressionWnd2.s_controls = 
{

    shiled 						= ToolKit.getIndex();
    bg 							= ToolKit.getIndex();

    commonTabBtn 				= ToolKit.getIndex();
    commonTabIcon 				= ToolKit.getIndex();
    faceTabBtn 					= ToolKit.getIndex();
    faceTabIcon 				= ToolKit.getIndex();
    chatRecordTabBtn 			= ToolKit.getIndex();
    chatRecordTabIcon 			= ToolKit.getIndex();

    commonView 					= ToolKit.getIndex();

    faceView 					= ToolKit.getIndex();
    faceViewTb 					= ToolKit.getIndex();
    commonBtn 					= ToolKit.getIndex();
    vipBtn 						= ToolKit.getIndex();

    classicView 				= ToolKit.getIndex();

    vipView 					= ToolKit.getIndex();
    vipExpress_preView 			= ToolKit.getIndex();
    preViewFace 				= ToolKit.getIndex();
    purchaseBtn 				= ToolKit.getIndex();

    vipExpress 					= ToolKit.getIndex();
    tipView						= ToolKit.getIndex();
    vipExpressTime				= ToolKit.getIndex();
    renewalBtn					= ToolKit.getIndex();
    vipListView					= ToolKit.getIndex();

    chatRecordView 				= ToolKit.getIndex();
    chatInput 					= ToolKit.getIndex();
    chatSendBtn					= ToolKit.getIndex();
    recordView					= ToolKit.getIndex();
};


ChatExpressionWnd2.ctor = function(self, chatConfig)
	super(self,chatExpress_new);
    self:setFillParent(true,true);
    self.m_root:setFillParent(true,true);
    self.m_ctrs = ChatExpressionWnd2.s_controls;
    self.m_faceIndex = ExpressionDataManager2.getInstance():getSelectFaceType();
    self.m_maxChatW = 396;

	self.m_chatTexts = chatConfig.text;
	self.m_effectMap = chatConfig.effectMap;
	self.m_effectStr = chatConfig.effectStr;

    self.m_classicView = self:findViewById(self.m_ctrs.classicView);
    self.m_shiled = self:findViewById(self.m_ctrs.shiled);

    self.m_vipView = self:findViewById(self.m_ctrs.vipView);
    self.m_vipExpress_preView = self:findViewById(self.m_ctrs.vipExpress_preView);
    self.m_vipExpress = self:findViewById(self.m_ctrs.vipExpress);

    self.m_vipPreViewFace = self:findViewById(self.m_ctrs.preViewFace);
    self.m_vipPreViewFace:setDirection(kHorizontal);
    self.m_vipPreViewFace:setAutoAlignToItemEdge(true);
    self.m_vipExpress = self:findViewById(self.m_ctrs.vipExpress);
    self.m_vipListView = self:findViewById(self.m_ctrs.vipListView); 
    self.m_vipExpressTime = self:findViewById(self.m_ctrs.vipExpressTime);
    self.m_vipExpressTime:setText(UserIdentityIsolater.getInstance():getVipTimeDesc());    

    local _chatEdit = self:findViewById(self.m_ctrs.chatInput); 
    _chatEdit:setReturnTypeEx(EditText.s_EX_RETURNTYPE_SEND );
    _chatEdit:setMaxLength(24);
	self:resetChatInput();
	
    self.m_shiled:setEventTouch(self,self.onTouchBg);
    self.m_bPhraseClicked = false;  --控制常用语发送变量，是为了避免快速点击，出现多句话叠音问题。

    RoomChatTextRecord.getInstance():setObserver(self);

    -- 屏蔽拖动事件
    self:findViewById(self.m_ctrs.commonTabBtn):setEventDrag(self, self.onEvenDragListen);
    self:findViewById(self.m_ctrs.faceTabBtn):setEventDrag(self, self.onEvenDragListen);
    self:findViewById(self.m_ctrs.chatRecordTabBtn):setEventDrag(self, self.onEvenDragListen);
end

ChatExpressionWnd2.dtor = function(self)
    local _chatInput = self:findViewById(ChatExpressionWnd2.s_controls.chatInput);
    if _chatInput then
        _chatInput:hideEditTextView();
    end

	RoomChatTextRecord.getInstance():clearObserver(self);
	ExpressionDataManager2.getInstance():setSelectTbType(self.m_lastIndex);
	ExpressionDataManager2.getInstance():setSelectFaceType(self.m_faceIndex);
end

-- 屏蔽拖动事件
ChatExpressionWnd2.onEvenDragListen = function(self)

end

ChatExpressionWnd2.onTouchBg = function(self)
    EventDispatcher.getInstance():dispatch(kClosePopupWindows);
end

ChatExpressionWnd2.updateVipView = function(self)
	if UserIdentityIsolater.getInstance():getIsVip() then 
    	self.m_vipView = self.m_expVip;
    else 
    	self.m_vipView = self.m_vipPreView;
    end
end

ChatExpressionWnd2.hidden = function(self)
	 if self.m_isShowing then
	    self.m_isShowing = false;
        local bg = self:findViewById(self.m_ctrs.bg);
        local w, h = bg:getSize();
        bg:removeProp(3);
        local popupAnim3 = bg:addPropTranslate(3, kAnimNormal, 300, 0,0, w+80);
        if popupAnim3 then 
            popupAnim3:setDebugName("ChatExpressionWnd2|popupAnim3");
            popupAnim3:setEvent(self, self.onHidden);
        end
    end
end 

ChatExpressionWnd2.onHidden = function (self)
   local bg = self:findViewById(self.m_ctrs.bg);
   local w, h = bg:getSize();
   PopupWindow.hidden(self);
   bg:removeProp(3);
end

-- 显示聊天界面
ChatExpressionWnd2.show = function(self)
	self:setVisible(true)
	if self.m_isShowing then
		self:hidden(PopupWindowStyle.FADE);
	else
		self.m_vipExpressTime:setText(UserIdentityIsolater.getInstance():getVipTimeDesc());
		ReportIsolater.getInstance():report(UBConfig.kChatExpressionWin, true, true)
		self.m_isShowing = true;
        self.m_lastIndex = self.m_lastIndex or 1;
        PopupWindow.show(self,PopupWindowStyle.FADE);
        local bg = self:findViewById(self.m_ctrs.bg);
        local w, h = bg:getSize();        
        bg:setPos(-w, 0);
        bg:removeProp(1);
        bg:removeProp(2);
        
        local popupAnim1 = bg:addPropTranslate(1, kAnimNormal, 250, 0, 0, -w);
        local popupAnim2 = bg:addPropTranslate(2, kAnimNormal, 100, 250,0, 20);
        if popupAnim1 and popupAnim2 then
            popupAnim1:setDebugName("ChatExpressionWnd2|popupAnim1");
            popupAnim2:setDebugName("ChatExpressionWnd2|popupAnim2");
            popupAnim2:setEvent(self, function ()
                bg:removeProp(1);
                bg:removeProp(2);
                bg:setPos(0, 0);

                self.m_bPhraseClicked = true;   -- 可以发送常用语聊天
            end);
        end
		self:showTab(self.m_lastIndex);
	end
end 

-- 
ChatExpressionWnd2.showTab = function(self,index)
	index = index <= 1 and 1 or index;
	index = index >= 3 and 3 or index;

	local ctrls = {
		self.onChangeToCommonTab,
		self.onChangeToFaceTab,
		self.onChangeToRecordTab
	};			
	ctrls[index](self);
end  

--------------------------------------- 聊天信息 start------------------------------------------------------------
ChatExpressionWnd2.onChangeToCommonTab = function(self)
	UBReport.getInstance():report(UBConfig.kChatClick2);
	self:setTabBtnEnable(self.m_ctrs.commonTabBtn);
	self:createCommonChatView();
end

ChatExpressionWnd2.createCommonChatView = function(self,isForce)
	if self.m_listView and (not isForce) then
		return;
	end
	local commonView = self:findViewById(self.m_ctrs.commonView);
	commonView:removeAllChildren(true);
	delete(self.m_listView);
	self.m_listView = nil;

	local listViewData = {};
	local w,h = commonView:getSize();
	for i,v in ipairs(self.m_chatTexts) do 
		listViewData[i] = {str = v; width = w;height = 80;};
	end
	self.m_listView = UIFactory.createListView(0,0,w ,h);
	local commonPhrases = require("games/common2/module/chatWnd/widget/commonPhrases");
	self.m_listView:setAdapter(new(CacheAdapter,commonPhrases,listViewData));
	self.m_listView:setOnItemClick(self, self.onCommonPhraseClicked);
	self.m_listView:setOnItemFingerAction(self , self.onCommonPhraseItemDown);
	
	commonView:addChild(self.m_listView);
end

ChatExpressionWnd2.onCommonPhraseItemDown = function(self ,finger_action , adapter , view , index)
	for k , v in pairs(adapter.m_views) do
	 	v:showCheckBg(false);
	end
	if (finger_action == kFingerDown or finger_action == kFingerMove) and view then
		view:showCheckBg(true);
	end
end

ChatExpressionWnd2.onCommonPhraseClicked = function(self,adapter,view,index)
    if self.m_bPhraseClicked then
        self.m_bPhraseClicked = false;
        local data = adapter:getData()
	    local str = data[index].str;
	    for k , v in pairs(adapter.m_views) do
	 	    v:showCheckBg(false);
	    end
	    ReportIsolater.getInstance():reportWithVal(UBConfig.kChatClick8, string.format("gameId%s_levelId%s_index%s", 
	    	GameInfoIsolater.getInstance():getCurGameId(), GameInfoIsolater.getInstance():getCurRoomLevelId(), index));
	    self:sendChatText(str,index);
	    self.m_lastIndex = 1;
    end
end

ChatExpressionWnd2.sendChatText = function(self,str,index)
	EventDispatcher.getInstance():dispatch(kClosePopupWindows);
	if str ~= "" then 
		Log.d("ChatExpressionWnd2","send chat text :",str);
		self:execDelegate(ChatExpressionWnd2.Delegate.onChatTextItemClick,str,index);
	end
end

-- 发送聊天信息
ChatExpressionWnd2.onSendBtnClicked = function(self)
	UBReport.getInstance():report(UBConfig.kChatClick12);
	local str = self:findViewById(self.m_ctrs.chatInput):getText();
	self:sendChatText(str);
	if str ~= "" then 
		-- local seat = PlayerSeat.getInstance():getMyLocalSeat();
		-- RoomChatTextRecord.getInstance():addChat(nil,str,seat);
		self.m_lastIndex = 3;
	end
	self:resetChatInput();
end

ChatExpressionWnd2.onChatInputClick = function(self,p_string,flag)
	UBReport.getInstance():report(UBConfig.kChatClick11);
    local chatEdit = self:findViewById(self.m_ctrs.chatInput); 
    local str = chatEdit:getText();
    str = ToolKit.utf8_sub(str,1,50);

    if string.isEmpty(str) then
    	self:resetChatInput();
    else
		chatEdit:setText(str);
        if flag == EditText.s_EX_CLOSE_DONE then
            self:onSendBtnClicked();
        end
	end
end

-- 重置输入框内容
ChatExpressionWnd2.resetChatInput = function(self)
	local chatInput = self:findViewById(self.m_ctrs.chatInput);
    chatInput:setFilterSensitiveWordFlag(true);
	chatInput:setText("");
	local levelId = GameInfoIsolater.getInstance():getCurRoomLevelId();
	local gameId = GameInfoIsolater.getInstance():getCurGameId();
	local isRoomAntiCheating = GameInfoIsolater.getInstance():isRoomAntiCheating(gameId, levelId);
	if isRoomAntiCheating then
		chatInput:setHintText("此房间防作弊，禁用自定义聊天！",215,171,127);
	else
		chatInput:setHintText("请在这里输入文字",215,171,127);
	end
	chatInput:setEnable(not isRoomAntiCheating);
end

--------------------------------------- 聊天信息 end------------------------------------------------------------

----------------------------------------- 表情tab----------------------------
ChatExpressionWnd2.onChangeToFaceTab = function(self)
	UBReport.getInstance():report(UBConfig.kChatClick3);
	self:setTabBtnEnable(self.m_ctrs.faceTabBtn);
	-- if not UserIdentityIsolater.getInstance():getIsVip() then
	-- 	 -- 非VIP用户进入【表情】tab时默认为【普通】tab
	-- 	self.m_faceIndex = 1;
	-- end
	self:showFaceViewTb(self.m_faceIndex);	
end

ChatExpressionWnd2.showVipFace = function(self)
	self.m_classicView:setVisible(false);
	self.m_vipView:setVisible(true);
	local data = ExpressionDataManager2.getInstance():getExpIconResMap(ExpressionDataManager2.eFaceType.VipFace);
	if UserIdentityIsolater.getInstance():getIsVip() then
		self.m_vipExpress_preView:setVisible(false);
	    self.m_vipExpress:setVisible(true);
		self:createVipExpress(data);
	else
		self.m_vipExpress_preView:setVisible(true);
	    self.m_vipExpress:setVisible(false);
		self:createVipPreView(data);
	end
end

ChatExpressionWnd2.showCommonFace = function(self)
	self.m_classicView:setVisible(true);
	self.m_vipView:setVisible(false);
	self:createExpress( ExpressionDataManager2.getInstance():getExpIconResMap(ExpressionDataManager2.eFaceType.NormalFace) );
end

ChatExpressionWnd2.onCommonBtnClick = function(self)
	UBReport.getInstance():report(UBConfig.kChatClick6);
	self:showFaceViewTb(1);
end

ChatExpressionWnd2.onVipBtnClick = function(self)
	UBReport.getInstance():report(UBConfig.kChatClick5);
	self:showFaceViewTb(2);
end

ChatExpressionWnd2.showFaceViewTb = function(self,index)
	local tbFiles = {"games/common/chat/face_tb_common.png","games/common/chat/face_tb_vip.png"};
	self:findViewById(self.m_ctrs.faceViewTb):setFile(tbFiles[index]);
	if index == 1 then
		self:showCommonFace();
	else
		self:showVipFace();
	end
end

-- 普通表情
ChatExpressionWnd2.createExpress = function(self,expressData,isForce)
	if self.m_expressPages and (not isForce) then
		return;
	end
	delete(self.m_expressPages);
	self.m_expressPages = nil;
	local inData=expressData;
	local expressSize=0;
	for k,v in pairs(inData) do
		expressSize=expressSize+1;
	end
	local data = {};
	for i =1, expressSize do 
		local prefix = ExpressionDataManager2.getInstance():getExpIconNamePrefix(ExpressionDataManager2.eFaceType.NormalFace);
		local name = string.format("%s%d.png", prefix, i);	
		local tmp = inData[name];
		tmp.playIndex = i;			
		data[i] = tmp;
	end

	local showData = {};
	local sort = ExpressionDataManager2.getInstance():getExpIconSort(ExpressionDataManager2.eFaceType.NormalFace); 
	if table.size(sort) == expressSize and expressSize > 0 then 
		for k,v in ipairs(sort) do 
			showData[k] = data[v];
		end 
	else 
		showData = data;
	end 
	local w,h = self.m_classicView:getSize();
	self.m_classicView:removeAllChildren(true);
	local expressgridview = require("games/common2/module/chatWnd/widget/expressgridview");
	self.m_expressPages = new(expressgridview,0,0,w,h);
	local expressItem = require("games/common2/module/chatWnd/widget/expressItem");
	self.m_expressPages:setAdapter(new(CacheAdapter,expressItem,showData));
	self.m_expressPages:setOnItemClick(self,self.onExpressClicked);
	self.m_classicView:addChild(self.m_expressPages);
end

ChatExpressionWnd2.onExpressClicked = function(self,adapter,view,index)
	EventDispatcher.getInstance():dispatch(kClosePopupWindows);
	local playIndex = view:getPlayIndex() or index;
	self:execDelegate(ChatExpressionWnd2.Delegate.onChatFaceItemClick,1,playIndex,1);
	local localIndex = ExpressionDataManager2.getInstance():encodeIndex(playIndex, false);
	ExpressionDataManager2.getInstance():useExpressByLocalIndex(localIndex);
	self.m_lastIndex = 2;
	self.m_faceIndex = ExpressionDataManager2.getInstance():getNormalFaceType();
end

-- VIP表情
ChatExpressionWnd2.createVipExpress = function(self,expressData,isForce)
	if self.m_vipGridView and (not isForce) then
		return;
	end	
	local expressSize=0;
	for k,v in pairs(expressData) do
		expressSize=expressSize+1;
	end
	local data = {};
	for index = 0, expressSize do
		local prefix = ExpressionDataManager2.getInstance():getExpIconNamePrefix(ExpressionDataManager2.eFaceType.VipFace);
		local name = string.format("%s%d.png", prefix, index);
		table.insert(data, expressData[name]);
	end
	delete(self.m_vipGridView);
	self.m_vipGridView = nil;
	local w,h = self.m_vipListView:getSize();
	local expressgridview = require("games/common2/module/chatWnd/widget/expressgridview");
	self.m_vipGridView = new(expressgridview,0,0,w,h);
	local vipExpressItem = require("games/common2/module/chatWnd/widget/vipExpressItem");
	self.m_vipGridView:setAdapter( new(CacheAdapter,vipExpressItem,data) );
	self.m_vipGridView:setOnItemClick(self,self.onVipExpressClicked);
	self.m_vipListView:removeAllChildren(true);
	self.m_vipListView:addChild(self.m_vipGridView);
end


ChatExpressionWnd2.onVipExpressClicked = function(self,adapter,view,index)
	EventDispatcher.getInstance():dispatch(kClosePopupWindows);
	self:execDelegate(ChatExpressionWnd2.Delegate.onChatFaceItemClick,1,index,2);
	local localIndex = ExpressionDataManager2.getInstance():encodeIndex(index, true);
	ExpressionDataManager2.getInstance():useExpressByLocalIndex(localIndex);
	self.m_lastIndex = 2;
	self.m_faceIndex = ExpressionDataManager2.getInstance():getVipFaceType();
end

--VIP预览表情
ChatExpressionWnd2.createVipPreView = function(self,expressData)	
	local index = 0;
	local inData = {};
	for k, v in pairs(expressData) do
		table.insert(inData, v);
		index = index + 1;
		if index == 6 then
			break;
		end
	end
	if not self.m_vipPreViewAdapter then
		local vipExpressItem = require("games/common2/module/chatWnd/widget/vipExpressItem");
		self.m_vipPreViewAdapter = UIFactory.createCacheAdapter(vipExpressItem, inData);
		self.m_vipPreViewFace:setAdapter(self.m_vipPreViewAdapter);
	else
		self.m_vipPreViewAdapter:changeData(inData);
	end
end
-------------------------------表情tab end---------------------

----------------------------------------------- 聊天记录 -------------------------------------------
ChatExpressionWnd2.onUpdateChatRecord = function(self)
	if not self.m_chatScrollView then
		local recordView = self:findViewById(self.m_ctrs.recordView);
		local w,h = recordView:getSize();
		self.m_chatScrollView = UIFactory.createScrollView(0,0,w,h,true);
		recordView:addChild(self.m_chatScrollView);
	end
	self.m_chatScrollView:removeAllChildren(true);
	local record = RoomChatTextRecord.getInstance():getChatRecord();
	for k, v in ipairs(record) do
		local seat = PlayerSeat.getInstance():getMyLocalSeat();
		local isMySelf = false;
		if v.seat == seat then
			isMySelf = true;
		end
		local chatItem = require("games/common2/module/chatWnd/widget/chatItem");
		local chatItem = new(chatItem,v.userName,v.chat,self.m_maxChatW,isMySelf);
		self.m_chatScrollView:addChild(chatItem);
		self.m_chatScrollView:gotoBottom();
		local align = isMySelf and kAlignTopRight or kAlignTopLeft;
		chatItem:setAlign(align);
	end
end

-- 聊天记录
ChatExpressionWnd2.onChangeToRecordTab = function(self)
	UBReport.getInstance():report(UBConfig.kChatClick4);
	self:setTabBtnEnable(self.m_ctrs.chatRecordTabBtn);
	self:onUpdateChatRecord();
end

----------------------------------------------- 聊天记录 end-------------------------------------------

-- 设置tab
ChatExpressionWnd2.setTabBtnEnable = function(self,ctrl)
	local tabBtns =  {
		self.m_ctrs.commonTabBtn,
		self.m_ctrs.faceTabBtn,
		self.m_ctrs.chatRecordTabBtn
	};
	local tabIcons =  {
		{self.m_ctrs.commonTabIcon,"games/common/chat/common_sel.png","games/common/chat/common_unsel.png"},
		{self.m_ctrs.faceTabIcon,"games/common/chat/face_sel.png","games/common/chat/face_unsel.png"},
		{self.m_ctrs.chatRecordTabIcon,"games/common/chat/chat_record_sel.png","games/common/chat/chat_record_unsel.png"},
	};

	local tabViews = {
		self.m_ctrs.commonView,
		self.m_ctrs.faceView,
		self.m_ctrs.chatRecordView
	};
	for k,v in pairs(tabBtns) do 
		local view = self:findViewById(v);
		local icon = self:findViewById(tabIcons[k][1]);
		if v == ctrl then
			view:setFile("games/common/chat/tb_sel.png");
			icon:setFile(tabIcons[k][2]);
		else
			view:setFile("games/common/chat/tb_unsel.png");
			icon:setFile(tabIcons[k][3]);
		end
		self:findViewById(tabViews[k]):setVisible(v == ctrl);
	end
end

-- 成为VIP
ChatExpressionWnd2.onRenewalClick = function(self )
	UBReport.getInstance():report(UBConfig.kChatClick7);
	EventDispatcher.getInstance():dispatch(kClosePopupWindows);
	self:execDelegate(ChatExpressionWnd2.Delegate.RequestVipCharge,{scene=PayIsolater.eGoodsListId.VipCharge});
end


ChatExpressionWnd2.execDelegate = function ( self,func,... )
    if self.m_delegate and self.m_delegate[func] then
        self.m_delegate[func](self.m_delegate,self,...);
    end
end

ChatExpressionWnd2.s_controlConfig = 
{
    [ChatExpressionWnd2.s_controls.shiled] 								= {"shiled"};
	[ChatExpressionWnd2.s_controls.bg] 									= {"bg"};

	[ChatExpressionWnd2.s_controls.commonTabBtn] 						= {"bg","commonTabBtn"};
	[ChatExpressionWnd2.s_controls.commonTabIcon] 						= {"bg","commonTabBtn","commonTabIcon"};
	[ChatExpressionWnd2.s_controls.faceTabBtn] 							= {"bg","faceTabBtn"};
	[ChatExpressionWnd2.s_controls.faceTabIcon] 						= {"bg","faceTabBtn","faceTabIcon"};
	[ChatExpressionWnd2.s_controls.chatRecordTabBtn] 					= {"bg","chatRecordTabBtn"};
	[ChatExpressionWnd2.s_controls.chatRecordTabIcon] 					= {"bg","chatRecordTabBtn","chatRecordTabIcon"};

	[ChatExpressionWnd2.s_controls.commonView]							= {"bg","mainViews","commonView"};
	
	[ChatExpressionWnd2.s_controls.faceView]							= {"bg","mainViews","faceView"};
	[ChatExpressionWnd2.s_controls.faceViewTb]							= {"bg","mainViews","faceView","tb"};
	[ChatExpressionWnd2.s_controls.commonBtn]							= {"bg","mainViews","faceView","tb","commonBtn"};
	[ChatExpressionWnd2.s_controls.vipBtn]								= {"bg","mainViews","faceView","tb","vipBtn"};
	
	[ChatExpressionWnd2.s_controls.vipView]								= {"bg","mainViews","faceView","vipView"};
	
	[ChatExpressionWnd2.s_controls.vipExpress_preView]					= {"bg","mainViews","faceView","vipView","vipExpress_preView"};
	[ChatExpressionWnd2.s_controls.preViewFace]							= {"bg","mainViews","faceView","vipView","vipExpress_preView","preViewFace"};
	[ChatExpressionWnd2.s_controls.purchaseBtn]							= {"bg","mainViews","faceView","vipView","vipExpress_preView","purchaseBtn"};
	
	[ChatExpressionWnd2.s_controls.vipExpress]							= {"bg","mainViews","faceView","vipView","vipExpress"};
	[ChatExpressionWnd2.s_controls.tipView]								= {"bg","mainViews","faceView","vipView","vipExpress","tipView"};
	[ChatExpressionWnd2.s_controls.vipExpressTime]						= {"bg","mainViews","faceView","vipView","vipExpress","tipView","num"};
	[ChatExpressionWnd2.s_controls.renewalBtn]							= {"bg","mainViews","faceView","vipView","vipExpress","tipView","renewalBtn"};
	[ChatExpressionWnd2.s_controls.vipListView]							= {"bg","mainViews","faceView","vipView","vipExpress","vipListView"};
	
	[ChatExpressionWnd2.s_controls.classicView]							= {"bg","mainViews","faceView","classicView"};
	
	[ChatExpressionWnd2.s_controls.chatRecordView]						= {"bg","mainViews","chatRecordView"};
	[ChatExpressionWnd2.s_controls.chatInput]							= {"bg","mainViews","chatRecordView","chat","inputBg","input"};
	[ChatExpressionWnd2.s_controls.chatSendBtn]							= {"bg","mainViews","chatRecordView","chat","send"};
	[ChatExpressionWnd2.s_controls.recordView]							= {"bg","mainViews","chatRecordView","recordView"};

}; 

ChatExpressionWnd2.s_controlFuncMap = 
{
	[ChatExpressionWnd2.s_controls.commonTabBtn]					= ChatExpressionWnd2.onChangeToCommonTab;
	[ChatExpressionWnd2.s_controls.faceTabBtn]						= ChatExpressionWnd2.onChangeToFaceTab;
	[ChatExpressionWnd2.s_controls.chatRecordTabBtn]				= ChatExpressionWnd2.onChangeToRecordTab;
	[ChatExpressionWnd2.s_controls.chatSendBtn]       				= ChatExpressionWnd2.onSendBtnClicked;

	[ChatExpressionWnd2.s_controls.purchaseBtn]						= ChatExpressionWnd2.onRenewalClick;
	[ChatExpressionWnd2.s_controls.renewalBtn]        				= ChatExpressionWnd2.onRenewalClick;
    [ChatExpressionWnd2.s_controls.chatInput]    					= ChatExpressionWnd2.onChatInputClick;
    [ChatExpressionWnd2.s_controls.commonBtn]    					= ChatExpressionWnd2.onCommonBtnClick;
    [ChatExpressionWnd2.s_controls.vipBtn]    						= ChatExpressionWnd2.onVipBtnClick;


}

return ChatExpressionWnd2;