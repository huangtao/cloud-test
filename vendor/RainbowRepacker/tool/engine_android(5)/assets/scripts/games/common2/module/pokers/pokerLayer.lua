require("games/common2/pokers/pokersConfig");
require("games/common2/pokers/poker");

PokerLayer = class(CommonGameLayer);

local baseLevel = 10;
PokerLayer.s_layersLevel = {
	HandCardLayer = baseLevel + 1;
	ShowCardLayer = baseLevel + 2;
	OutCardLayer = baseLevel + 3;
	PokerEffectLayer = baseLevel + 4;
	PokerAnimLayer = baseLevel + 5;
	DragLayer = baseLevel + 6;	
};

PokerLayer.ctor = function(self)
    self:setFillParent(true,true);
    self.m_layersMap = {};

	self:_initHandleLayers();

	self:_initHandCardData();

	self:_cleanMyHandCardTouchState();

	PokerCardData.getInstance():setObserver(self);
end 

PokerLayer.dtor = function(self)
	PokerCardData.getInstance():clearObserver(self);
    self:_stopOutCardIllegalTipsTimer();
end
---------------------------------------------------------------
------ PokerCardData delegate funcs ---------------------------
PokerLayer.clearPokerCardData = function(self)
	self:_clearAll();
end

PokerLayer.onDealCard = function(self,data)
	data = table.verify(data);
	local seat = data.seat;
	local handList = table.verify(data.handList);
	local isNeedAnim = data.isNeedAnim;

	self:_clearAll();

	self:_createHandCard(seat,handList);
	if isNeedAnim then 
		self:_playDealCardAnim(seat,handList);
		self.m_handCardLayer:setVisible(false);
	else 
		self.m_handCardLayer:setVisible(true);
	end 	
end

PokerLayer.addHandCard = function(self,data)
	data = table.verify(data);
	local seat = data.seat;
	if not self:isSeatLegal(seat) then 
		return;
	end 

	local addIndexArray = table.verify(data.addIndexArray);
	local addList = table.verify(data.addList);
	local handList = table.verify(data.handList);
	local isNeedAnim = data.isNeedAnim;

	local pokers = {};
	for i, value in ipairs(addList) do
		local pokerShowType = PokersConfig.s_pokerShowType.HandCard;
		pokerShowType = seat == self:getMySeat() and PokersConfig.s_pokerShowType.MyHandCard or pokerShowType;
        local poker = self:_createPoker(value,pokerShowType);                
           
        self.m_handCardLayers[seat]:addChild(poker);
        table.insert(self.m_handCardPokers[seat],addIndexArray[i],poker);
        table.insert(pokers,poker);

        if seat == self:getMySeat() then 
        	poker:setEventTouch(self,self.onMyHandCardClick);
        end 
    end
    local config = self:_getHandCardViewConfig(seat);
	self.m_handCardLayers[seat]:setSize(config.width,config.height);	
    self:_refreshHandCardPos(seat);

	if isNeedAnim then 
		self:_playAddHandCardAnim(pokers,seat);
	end 
end

PokerLayer.removeHandCard = function(self,data)
	if self.m_isDragging then 
		self:_stopDragging();
		self:_cleanMyHandCardTouchState();
	end

	data = table.verify(data);
	local seat = data.seat;
	if not self:isSeatLegal(seat) then 
		return;
	end 

	local removeCount = number.valueOf(data.removeCount);
	local removeIndexArray = table.verify(data.removeIndexArray);

	for k,v in ipairs(removeIndexArray) do 
		local poker = table.remove(self.m_handCardPokers[seat],v);
		if poker then
			self:_removeSelectedCard(poker:getSortIndex());
			self.m_handCardLayers[seat]:removeChild(poker);
			delete(poker);
			poker = nil;
		end		
	end 
	self:_refreshHandCardPos(seat);
end

PokerLayer.playOutCard = function(self,data)
	data = table.verify(data);
	local seat = data.seat;
	if not self:isSeatLegal(seat) then 
		return;
	end 
	self:removeOutCard(data);

	local outCardList = table.verify(data.outCardList);	
	local isNeedAnim = data.isNeedAnim;

	local cardType = PokersConfig.getCardType(outCardList);
	self:_createOutCard(seat,outCardList,cardType);
	PokersConfig.playOutPokerEffect(outCardList,cardType,seat);

	if isNeedAnim then 
		self:_playOutCardAnim(seat,outCardList,cardType);
	end 
end

PokerLayer.removeOutCard = function(self,data)
	data = table.verify(data);
	local seat = data.seat;

	self:_clearOutCard(seat);
end

PokerLayer.setOperateTurn = function(self,data)
	data = table.verify(data);
	local seat = data.seat;

	self.m_isMyTurn = seat == self:getMySeat();
end

PokerLayer.requestOutCard = function(self)
	PokerCardData.getInstance():requestOutCardByIndexList(self.m_selectedCardIndex);
end

PokerLayer.requestOutCardError = function(self)
	Log.d("提示用户出牌不合法，将选择的牌重置");
	self:_reSelectMyHandCard();
	self:_showOutCardIllegalTips();
end
------ PokerCardData delegate funcs end---------------------------
------------------------------------------------------------------
PokerLayer.clearAllOutCard = function(self)
	self:_clearOutCardLayer();
end

PokerLayer.showPokerSmallerTips = function(self)
	self:_createMyHandCardSmallerTips();
	self.m_pokerSmallerTips:setVisible(true);
	self.m_handCardLayers[self:getMySeat()]:setColor(128,128,128);
end

PokerLayer.hidePokerSmallerTips = function(self)
	if self.m_pokerSmallerTips then 
		self.m_pokerSmallerTips:setVisible(false);
	end 
	if self.m_handCardLayers[self:getMySeat()] then
		self.m_handCardLayers[self:getMySeat()]:setColor(255,255,255);
	end 
end
------------------------------------------------------------
PokerLayer.getLayerByLevel = function(self,level)
	return self.m_layersMap[level];
end 

PokerLayer.clear = function(self)
	self:_clearAll();
end
------------------------------------------------------------
PokerLayer._createOutCard = function(self,seat,outCardList,cardType)
	if not self:isSeatLegal(seat) then 
		return;
	end 
	
	self:_clearOutCard(seat);

	local config = PokersConfig.getOutCardViewConfig(seat);
	local space = number.valueOf(config.space);

	local layer = PokersConfig.getOutCardModelLayer(outCardList,cardType,seat);
	if not(layer and typeof(layer,DrawingBase)) then 
		layer = self:_createDefaultOutCardModelLayer(outCardList,space);
	end 

	if layer and typeof(layer,DrawingBase) then 	    
	   	layer:setAlign(config.align);
	   	layer:setPos(config.x,config.y);
	   	layer:setName("outCardView_"..seat);
	   	self.m_outCardLayer:addChild(layer);
	end 
end

PokerLayer._createDefaultOutCardModelLayer = function(self,outCardList,space)
	space = number.valueOf(space,35);
	local layer = new(Node);

	local level = 0;
	local x,y = 0,0;	
	local pokerShowType = PokersConfig.s_pokerShowType.OutCard;
	for i, value in ipairs(outCardList) do		
        local poker = self:_createPoker(value,pokerShowType);   
        level = level + 1;   
        poker:setAlign(kAlignTopLeft);          
        poker:setLevel(level);
        
        poker:setPos(x,y);   
        x = x + space;
        layer:addChild(poker);
    end

    local pokerW,pokerH = PokersConfig.getPokerSize(pokerShowType);

    local w = space*(#outCardList - 1) + pokerW;
    local h = pokerH;

   	layer:setSize(w,h);

    return layer;
end

PokerLayer._clearOutCard = function(self,seat)
	if not self:isSeatLegal(seat) then 
		return;
	end 

	local outCardView = self.m_outCardLayer:getChildByName("outCardView_"..seat);
	if outCardView then 
		self.m_outCardLayer:removeChild(outCardView);
		delete(outCardView);
		outCardView = nil;
	end 
end

PokerLayer._playOutCardAnim = function(self,seat,outCardList,cardType)
	self.m_outCardLayer:setVisible(false);
	local isChecked,node = PokersConfig.getOutCardAnim(outCardList,cardType,seat,self,self._playOutCardAnimEnd);
	if isChecked then 
		if node and typeof(node,DrawingBase) then 
			self.m_pokerAnimLayer:addChild(node);
		end 
	else 
		self.m_outCardLayer:setVisible(true);
		self:_playDefaultOutCardAnim(seat);
	end 
end

PokerLayer._playOutCardAnimEnd = function(self)
	self.m_outCardLayer:setVisible(true);
end

PokerLayer._playDefaultOutCardAnim = function(self,seat)
	if not self:isSeatLegal(seat) then 
		return;
	end 

	local outCardView = self.m_outCardLayer:getChildByName("outCardView_"..seat);
	if outCardView then 
		local config = PokersConfig.getOutCardViewConfig(seat);
		local startX = number.valueOf(config.animStartX);
		local startY = number.valueOf(config.animStartY);

		local scale = number.valueOf(config.animScale,1.5);
		local duration = number.valueOf(config.animDuration,1000);

		outCardView:removeProp(0);
		outCardView:removeProp(1);
		local anim = outCardView:addPropTranslate(0, kAnimNormal, duration, 0,startX, 0, startY, 0);
		outCardView:addPropScale(1, kAnimNormal, duration, 0, scale, 1, scale, 1,kCenterDrawing);
		anim:setEvent(self,function()
			outCardView:removeProp(0);
			outCardView:removeProp(1);
		end);
	end 
end

------------------------------------------------------------
PokerLayer._playDealCardAnim = function(self,seat,cardList)
	local isChecked,node = PokersConfig.playDealCardAnim(cardList,self,self._playDealCardAnimEnd);
	if isChecked then 
		if node and typeof(node,DrawingBase) then 
			self.m_pokerAnimLayer:addChild(node);
		end 
	end 
end

PokerLayer._playDealCardAnimEnd = function(self)
	self.m_handCardLayer:setVisible(true);
end
------------------------------------------------------------
PokerLayer._playAddHandCardAnim = function(self,addCards,seat)
	local isChecked,node = PokersConfig.playAddHandCardAnim(addCards,seat,self,self._playAddHandCardAnimEnd);
	if isChecked then 
		if node and typeof(node,DrawingBase) then 
			self.m_pokerAnimLayer:addChild(node);
		end 
	else
		local config = self:_getHandCardViewConfig(seat);
		for _,card in ipairs(addCards) do 
			local w,h = card:getSize();
			local startX = 0;
			local startY = -h/4;

			card:removeProp(0);
			local anim = card:addPropTranslate(0, kAnimNormal, 1500,0, startX, 0, startY, 0);
			anim:setEvent(self,function()
				card:removeProp(0);
			end);
		end 
	end 
end

PokerLayer._playAddHandCardAnimEnd = function(self)
	self.m_handCardLayer:setVisible(true);
end
------------------------------------------------------------
--绘制手牌
PokerLayer._createHandCard = function(self,seat,cardList)
	if not self:isSeatLegal(seat) then 
		return;
	end 

	self:_clearhandCard(seat);

	self:_createHandCardView(seat);
	for i, value in ipairs(cardList) do
		local pokerShowType = PokersConfig.s_pokerShowType.HandCard;
		pokerShowType = seat == self:getMySeat() and PokersConfig.s_pokerShowType.MyHandCard or pokerShowType;
        local poker = self:_createPoker(value,pokerShowType);                
           
       	self.m_handCardPokers[seat][i] = poker; 
        self.m_handCardLayers[seat]:addChild(poker);

        if seat == self:getMySeat() then 
        	poker:setEventTouch(self,self.onMyHandCardClick);
        end 
    end
    self:_refreshHandCardPos(seat);
end

--清空手牌
PokerLayer._clearhandCard = function(self,seat)
	if not self:isSeatLegal(seat) then 
		return;
	end 

	if self.m_handCardLayers[seat] then 
	    self.m_handCardLayers[seat]:removeAllChildren(true);
		self.m_handCardLayer:removeChild(self.m_handCardLayers[seat]);
		delete(self.m_handCardLayers[seat]);
	end 
	self.m_handCardPokers[seat] = {};	
	self.m_handCardLayers[seat] = nil;
end

PokerLayer.onMyHandCardClick = function(self,finger_action,x,y,drawing_id_first,drawing_id_current)
	if finger_action ~= kFingerDown and (not self.m_isTouching) then
        return;
    end

    local seat = self:getMySeat();
    local card,index = self:_getHandCardPokerAndIndex(seat,drawing_id_current);
    if finger_action == kFingerDown then
    	self:_cleanMyHandCardTouchState();

    	self.m_isTouching = true;
    	if card and index then
            self.m_lastTouchIndex = index;
            self.m_beginTouchIndex = index;
    		self:_selectingPoker(seat,index);
    	end 
    	    	
    elseif finger_action == kFingerMove then
    	if self.m_isDragging then 
    		self:_movingDraggingCards(x,y);
    	else 
	    	if card and index then	    	
		    	if self.m_lastTouchIndex ~= index then
		    		self.m_isHandCardMoveInRegion = true;
		    		self:_selectingPoker(seat,index);
		    	end
				self.m_lastTouchIndex = index;
			else 
				local _, abY = self.m_handCardLayers[seat]:getAbsolutePos();

				local isDragging = y < abY - self.m_popupDiff;
				if isDragging then 
					self:_beginDragging();
					self:_movingDraggingCards(x,y);
				end 
			end 

		end 
    else 
    	if self.m_isDragging then  
    		self:_stopDragging(true,self.m_isMyTurn);
    	else 
	    	if drawing_id_first == drawing_id_current then --点击的是同一张牌 
		    	self:_changeMyHandCardPopStatus(index);
		    	self:_showClickTips();
		    else 
		    	if self.m_isHandCardMoveInRegion then 	 
					self:_showMovingTips();   		
	    		end  
	    	end 	    	
	    	self:_cancleSelectingPoker(seat);
	    end 
	    
	    self:_cleanMyHandCardTouchState();
    end 
end

-----------------------------------------------------------------------------------------------------------
PokerLayer._cleanMyHandCardTouchState = function(self)    
    self.m_isTouching = nil;
    self.m_isHandCardMoveInRegion = nil;
    self.m_isDragging = nil;
    self.m_lastTouchIndex = 0;
    self.m_beginTouchIndex = -1;
end

PokerLayer._selectingPoker = function(self,seat,index)
	local _index = index;
	if (self.m_lastTouchIndex - self.m_beginTouchIndex) * (index - self.m_lastTouchIndex) < 0 then
		_index = self.m_lastTouchIndex;
	end

	local card = self:_getHandCardPokerByIndex(seat,_index);
	if card then
		local isSelecting,key = self:_checkIsAlreadySelecting(_index);
		local color = 128;
		if isSelecting then
			color = 255;
			table.remove(self.m_selectingPokers,key);
		else
			color = 128;
			table.insert(self.m_selectingPokers,_index);
			local status = card:getStatus();
			if status == Poker_CardState.Normal then
				card:setStatus(Poker_CardState.NormalSelected);
			elseif status == Poker_CardState.Popup then
				card:setStatus(Poker_CardState.popupSelected);
			end
		end

		card:setColor(color,color,color);
	end
end

PokerLayer._checkIsAlreadySelecting = function(self,index)
	for k,v in ipairs(self.m_selectingPokers) do 
		if v == index then 
			return true,k;
		end 
	end 

	return false;
end

PokerLayer._cancleSelectingPoker = function(self,seat)
	for k,v in ipairs(self.m_selectingPokers) do 
		local card = self:_getHandCardPokerByIndex(seat,v);
		if card then
			card:setColor(255,255,255);
		end
	end
	self.m_selectingPokers = {};
end

PokerLayer._getHandCardPokerAndIndex = function(self,seat,drawing_id)
	if not self:isSeatLegal(seat) then 
		return;
	end

	for k,v in ipairs(self.m_handCardPokers[seat]) do 
		if v.m_drawingID == drawing_id then
			return v,k;
		end
	end
	return nil;
end

PokerLayer._getHandCardPokerByIndex = function(self,seat,index)
	if not self:isSeatLegal(seat) then 
		return;
	end

	return self.m_handCardPokers[seat][index];
end

PokerLayer._getHandIndexByPoker = function(self,seat,poker)
	if not self:isSeatLegal(seat) then 
		return;
	end

	for k,v in ipairs(self.m_handCardPokers[seat]) do 
		if v == poker then
			return k;
		end 
	end 
end

PokerLayer._changeMyHandCardPopStatus = function(self,index)
	local seat = self:getMySeat();
	local card = self:_getHandCardPokerByIndex(seat,index);
	local status = card:getStatus();
	if status == Poker_CardState.NormalSelected then 
		self:_popupMyHandCard(index);
	elseif status == Poker_CardState.popupSelected then 
		self:_pushDownMyHandCard(index);
	else 
	end
end

PokerLayer._popupMyHandCard = function(self,index)	
	local seat = self:getMySeat();

	local config = self:_getHandCardViewConfig(seat);
	local card = self:_getHandCardPokerByIndex(seat,index);

	if card and card:getStatus() == Poker_CardState.NormalSelected then 
		card:setStatus(Poker_CardState.Popup);
		local x,y = card:getPos();
		local w,h = card:getSize();

		self.m_popupDiff = h/6;
		y = y - self.m_popupDiff;
 
		card:setPos(x,y);

		table.insert(self.m_selectedCardIndex,index);
	end 
end

PokerLayer._pushDownMyHandCard = function(self,index)
	local seat = self:getMySeat();

	local config = self:_getHandCardViewConfig(seat);
	local card = self:_getHandCardPokerByIndex(seat,index);
	if card and card:getStatus() == Poker_CardState.popupSelected then 
		card:setStatus(Poker_CardState.Normal);
		local x,y = card:getPos();
		local w,h = card:getSize();
		y = y + h/6;
		card:setPos(x,y);

		self:_removeSelectedCard(index);
	end 
end

PokerLayer._removeSelectedCard = function(self,index)
	if not index then 
		return;
	end 

	local key;
	for k,v in ipairs(self.m_selectedCardIndex) do 
		if v == index then 
			key = k;
		end 
	end 
	if key then 
		table.remove(self.m_selectedCardIndex,key);
	end
end

PokerLayer._reSelectMyHandCard = function(self)
    local temp = Copy(self.m_selectedCardIndex);
	for k,v in pairs(temp) do 
		self:_pushDownMyHandCard(v);
	end
end

PokerLayer._showClickTips = function(self)
	self:_getCardTips(self.m_selectedCardIndex);
end

PokerLayer._showMovingTips = function(self)
	local hasTips = self:_getCardTips(nil,self.m_selectingPokers);
	if not hasTips then --如果选中的牌无牌型，则改变选中的牌的状态
		for k,index in pairs(self.m_selectingPokers) do 
			self:_changeMyHandCardPopStatus(index);
		end 
	end 
end

PokerLayer._getCardTips = function(self,clickIndexList,movingIndexList)
	local _,indexList = PokerCardData.getInstance():getCardTipsByIndexList(clickIndexList,movingIndexList);
	indexList = table.verify(indexList);
	if #indexList > 0 then
		self:_reSelectMyHandCard();
			
		for k,v in pairs(indexList) do 
			self:_popupMyHandCard(v);
		end 

		return true;
	else 
		return false;
	end 
end

PokerLayer._beginDragging = function(self)
	self.m_isDragging = true;

	if #self.m_selectedCardIndex == 0 then --如果有弹出的牌，不会拉出没弹出的牌;否则拉出所有选中的牌
		self.m_selectedCardIndex = Copy(self.m_selectingPokers);
	end 
	self.m_draggingSelectedIndex = Copy(self.m_selectedCardIndex);

	table.sort(self.m_draggingSelectedIndex,function(a,b)
			if a and b then 
				return number.valueOf(a) < number.valueOf(b);
			end 
		end);

	self:_cancleSelectingPoker(self:getMySeat());
	self.m_selectedCardIndex = {};

	self:_createDraggingCards();
end

PokerLayer._stopDragging = function(self,isPopupDragging,isCheckOutCard)
	self.m_isDragging = nil;

	local seat = self:getMySeat();

	local layer = self.m_dragLayer:getChildByName("dragLayer");
	if layer then 
		local count = #self.m_draggingCardIndex;
		for i = count,1,-1 do --此处必须将和移除的顺序相反（遵循先移除后添加原则）
			local card = layer:getChildByName("card_"..i);
			if card then 
				card:setStatus(Poker_CardState.Normal);

				card:removeProp(0);
				layer:removeChild(card);
				self.m_handCardLayers[seat]:addChild(card);
				table.insert(self.m_handCardPokers[seat],self.m_draggingCardIndex[i],card);
			end 
		end 
	end 
	self.m_dragLayer:removeAllChildren(true);
	local config = self:_getHandCardViewConfig(seat);
	self.m_handCardLayers[seat]:setSize(config.width,config.height);--拖动牌放入手牌后先将手牌区域设置为原始大小，刷新位置时会根据扑克牌数量调整
	self:_refreshHandCardPos(seat);

	if isPopupDragging then 
		self:_popupDraggingCards(self.m_draggingSelectedIndex);
	end 

	if isCheckOutCard then 
		self.m_selectedCardIndex = Copy(self.m_draggingSelectedIndex);
		self:requestOutCard();
	end 

	self.m_draggingCardIndex = {};
	self.m_draggingSelectedIndex = {};
end

PokerLayer._movingDraggingCards = function(self,x,y)
	local layer = self.m_dragLayer:getChildByName("dragLayer");
	if layer then 
		local w,h = layer:getSize();

		local maxX = System.getScreenScaleWidth() - w;
		local maxY = System.getScreenScaleHeight() - h;
			
		local localX,localY = self:convertSurfacePointToView(x,y);
		local _x = localX - w/2;
		local _y = localY - h/2;
		_x = _x <= 0 and 0 or _x;
		_y = _y <= 0 and 0 or _y;
		_x = _x >= maxX and maxX or _x;
		_y = _y >= maxY and maxY or _y;
		layer:setPos(_x,_y);
	end 
end

PokerLayer._createDraggingCards = function(self)
	if #self.m_draggingSelectedIndex == 0 then 
		return;
	end 

	local seat = self:getMySeat();
	local config = self:_getHandCardViewConfig(seat);
	local dragScale = number.valueOf(config.dragScale,1);
	local dragSpace = number.valueOf(config.normalSpace) * dragScale;

	local layer = new(Node);
	local x,y = 0,0;
	local level = 0;
	local pokerW,pokerH = 0,0;
	
	for k,index in ipairs(self.m_draggingSelectedIndex) do 
		local key;
		for k,v in ipairs(self.m_handCardPokers[seat]) do 
			if v:getSortIndex() == index then 
				key = k;
				break;
			end 
		end 
		if key then 
			table.insert(self.m_draggingCardIndex,key);

			local card = table.remove(self.m_handCardPokers[seat],key);
			if card then
				pokerW,pokerH = card:getSize();

				card:setStatus(Poker_CardState.Dragging);
				card:addPropScaleSolid(0,dragScale,dragScale);
				
				self.m_handCardLayers[seat]:removeChild(card);

				level = level + 1;   
		        card:setAlign(kAlignTopLeft);          
		        card:setLevel(level);       
		        card:setPos(x,y);
		        card:setName("card_"..level);
		        x = x + dragSpace;

				layer:addChild(card);
			end 
		end 		
	end 

	local w = pokerW*dragScale + (#self.m_draggingCardIndex - 1)*dragSpace;
	local h = pokerH*dragScale;
	layer:setSize(w,h);
	layer:setName("dragLayer");
	self.m_dragLayer:addChild(layer);

	self:_refreshHandCardPos(seat);
end

PokerLayer._popupDraggingCards = function(self,draggingIndex)
	draggingIndex = table.verify(draggingIndex);

	local seat = self:getMySeat();
	for k,v in ipairs(draggingIndex) do 
		local card = self:_getHandCardPokerByIndex(seat,v);
		if card then
			card:setStatus(Poker_CardState.NormalSelected);
		end
		self:_popupMyHandCard(v);
	end
end
------------------------------------------------------------
PokerLayer._showOutCardIllegalTips = function(self)
	self:_createOutCardIllegalTips();
	self:_startOutCardIllegalTipsTimer();

	self.m_outCardIllegalTips:setVisible(true);
	self.m_handCardLayers[self:getMySeat()]:setColor(128,128,128);
end

PokerLayer._hideOutCardIllegalTips = function(self)
	self:_stopOutCardIllegalTipsTimer();
	
	if self.m_outCardIllegalTips then 
		self.m_outCardIllegalTips:setVisible(false);
	end 

	if self.m_handCardLayers[self:getMySeat()] then
		self.m_handCardLayers[self:getMySeat()]:setColor(255,255,255);
	end 
end

PokerLayer._startOutCardIllegalTipsTimer = function(self)
	self:_stopOutCardIllegalTipsTimer();

	self.m_outCardIllegalTipsTimer = AnimFactory.createAnimInt(kAnimNormal,0,1,1000,0);
	self.m_outCardIllegalTipsTimer:setDebugName("PokerLayer._startOutCardIllegalTipsTimer");
	self.m_outCardIllegalTipsTimer:setEvent(self,self._hideOutCardIllegalTips);
end

PokerLayer._stopOutCardIllegalTipsTimer = function(self)
	delete(self.m_outCardIllegalTipsTimer);
	self.m_outCardIllegalTipsTimer = nil;
end
-----------------------------------------------------------------------------------------------------------
PokerLayer._getHandCardViewConfig = function(self,seat)
	return table.verify(PokersConfig.getHandCardViewConfig(seat));	
end

PokerLayer._createHandCardView = function(self,seat)
	if not self.m_handCardLayers[seat] then 
		local config = self:_getHandCardViewConfig(seat);
		local layer = new(Node);
		layer:setPos(config.x,config.y);
		layer:setAlign(config.align);
		layer:setSize(config.width,config.height);
		self.m_handCardLayer:addChild(layer);
		self.m_handCardLayers[seat] = layer;
	end
end

PokerLayer._getHandCardPos = function(self,seat,nCards)
	if self.m_handCardLayers[seat] then 
		local config = table.verify(PokersConfig.getHandCardViewConfig(seat));
		local w,h = self.m_handCardLayers[seat]:getSize();

		local space = number.valueOf(config.normalSpace);
		local maxSpace = number.valueOf(config.maxSpace);

		local pokerShowType = PokersConfig.s_pokerShowType.HandCard;
		pokerShowType = seat == self:getMySeat() and PokersConfig.s_pokerShowType.MyHandCard or pokerShowType;
		local pokerW,pokerH = PokersConfig.getPokerSize(pokerShowType);
		if w < pokerW or h < pokerH then
			w = number.valueOf(config.width);
			h = number.valueOf(config.height);
		end 

		local x,y = 0,0;
		if nCards > 1 then
			space = (w - pokerW)/(nCards-1);
			x = w/2  - nCards/2*space - (pokerW-space)/2;
		end
		space = space > maxSpace and maxSpace or space;

		w = (nCards - 1)*space + pokerW;

		self.m_handCardLayers[seat]:setSize(w,h);

		return x,y,space;
	else 
		return 0,0,10,kHorizontal;
	end 
end

PokerLayer._refreshHandCardPos = function(self,seat)
	local pokers = table.verify(self.m_handCardPokers[seat]);
	local x,y,space = self:_getHandCardPos(seat,#pokers);
	local level = 0;
	for k,poker in ipairs(pokers) do 
		poker:setSortIndex(k);
		level = level + 1;
        poker:setLevel(level); 
        poker:setPos(x,y);  
        x = x + space;
	end 
end
------------------------------------------------------
--value:牌值
--pokerShowType:扑克牌的类型，比如手牌、打出去的牌、展示牌
PokerLayer._createPoker = function(self,value,pokerShowType)
	local pokerConfig = table.verify(PokersConfig.getPokerConfig(pokerShowType));
	local pokerW = number.valueOf(pokerConfig.pokerW or PokersConfig.s_defaultWidth);
	local pokerH = number.valueOf(pokerConfig.pokerH or PokersConfig.s_defaultHeight);

	local poker = new(Poker,value,pokerConfig.showType,pokerConfig.scale);
	poker:setSize(pokerW,pokerH);	 
	return poker;
end

-------------------------------------------------------
PokerLayer.getMySeat = function(self)
	return GamePlayerManager2.getInstance():getMyLocalSeat();
end

PokerLayer.getMaxPlayerCount = function(self)
	return GamePlayerManager2.getInstance():getCurGamePlayerMaxCount();
end 

PokerLayer.isSeatLegal = function(self,seat)
	return GamePlayerManager2.getInstance():isSeatLegal(seat);
end
-------------------------------------------------------
PokerLayer._initHandCardData = function(self)
	self.m_handCardLayers = {};	
	self.m_handCardPokers = {};

	self.m_selectingPokers = {};
	self.m_selectedCardIndex = {};
	self.m_draggingCardIndex = {};
	self.m_draggingSelectedIndex = {};

	local playerCount = self:getMaxPlayerCount();
	for i = 1,playerCount do 
		self.m_handCardPokers[i] = {};
	end 

	self.m_popupDiff = 0;
end

PokerLayer._initHandleLayers = function(self)
	self:_createHandCardLayer();
	self:_createShowCardLayer();
	self:_createOutCardLayer();
	self:_createPokerEffectLayer();
	self:_createPokerAnimLayer();
	self:_createDragLayer();
end

PokerLayer._clearAll = function(self)
	self:_clearHandCardLayer();
	self:_clearShowCardLayer();
	self:_clearOutCardLayer();
	self:_clearPokerEffectLayer();
	self:_clearPokerAnimLayer();
	self:_clearDragLayer();

	self:_stopOutCardIllegalTipsTimer();
end

--手牌层
PokerLayer._createHandCardLayer = function(self)
	self.m_handCardLayer = self:_createLayers(PokerLayer.s_layersLevel.HandCardLayer);
	-- self.m_handCardLayer:setEventDoubleClick(self, self.onHandCardLayerDoubleClick);
end

PokerLayer.onHandCardLayerDoubleClick = function(self,finger_action, x, y, drawing_id)
	if finger_action == kFingerUp then 
		self:_reSelectMyHandCard();
	end 
end
PokerLayer._clearHandCardLayer = function(self)
	self.m_handCardLayer:removeAllChildren(true);
	self:_initHandCardData();
end

--展示层（比如：斗地主的明牌、德州的公共牌、滚子的底牌）
PokerLayer._createShowCardLayer = function(self)
	self.m_showCardLayer = self:_createLayers(PokerLayer.s_layersLevel.ShowCardLayer);
end
PokerLayer._clearShowCardLayer = function(self)
	self.m_showCardLayer:removeAllChildren(true);
end

--出牌层
PokerLayer._createOutCardLayer = function(self)
	self.m_outCardLayer = self:_createLayers(PokerLayer.s_layersLevel.OutCardLayer);
end
PokerLayer._clearOutCardLayer = function(self)
	self.m_outCardLayer:removeAllChildren(true);
end

--特效层（比如：斗地主的不合法提示）
PokerLayer._createPokerEffectLayer = function(self)
	self.m_pokerEffectLayer = self:_createLayers(PokerLayer.s_layersLevel.PokerEffectLayer);
	self:_createMyHandCardSmallerTips();
	self:_createOutCardIllegalTips();
end
PokerLayer._clearPokerEffectLayer = function(self)
	self.m_pokerEffectLayer:removeAllChildren(true);
	self.m_pokerSmallerTips = nil;
	self.m_outCardIllegalTips = nil;
end

PokerLayer._createMyHandCardSmallerTips = function(self)
	if not self.m_pokerSmallerTips then
		local config = self:_getHandCardViewConfig(self:getMySeat()); 
		local layer = new(Node);
		layer:setPos(config.x,config.y);
		layer:setAlign(config.align);
		layer:setSize(config.width,config.height);
		layer:setVisible(false);
		self.m_pokerEffectLayer:addChild(layer);

		local file = PokersConfig.getPokerSmallerTipsFilePath();
		local tips = new(Image,file);
		tips:setAlign(kAlignCenter);
		layer:addChild(tips);

		self.m_pokerSmallerTips = layer;
	end 
end 

PokerLayer._createOutCardIllegalTips = function(self)
	if not self.m_outCardIllegalTips then 
		local config = self:_getHandCardViewConfig(self:getMySeat());
		local layer = new(Node);
		layer:setPos(config.x,config.y);
		layer:setAlign(config.align);
		layer:setSize(config.width,config.height);
		layer:setVisible(false);
		self.m_pokerEffectLayer:addChild(layer);

		local file = PokersConfig.getOutCardIllegalTipsFilePath();
		local tips = new(Image,file);
		tips:setAlign(kAlignCenter);
		layer:addChild(tips);

		self.m_outCardIllegalTips = layer;
	end 
end

--动画层
PokerLayer._createPokerAnimLayer = function(self)
	self.m_pokerAnimLayer = self:_createLayers(PokerLayer.s_layersLevel.PokerAnimLayer);
end
PokerLayer._clearPokerAnimLayer = function(self)
	self.m_pokerAnimLayer:removeAllChildren(true);
end

--拖动层
PokerLayer._createDragLayer = function(self)
	self.m_dragLayer = self:_createLayers(PokerLayer.s_layersLevel.DragLayer);
end
PokerLayer._clearDragLayer = function(self)
	self.m_dragLayer:removeAllChildren(true);
end
-------------------------------------------------------
PokerLayer._createLayers = function(self,level)
	local layer = new(Node);
	layer:setLevel(level);
	self:addChild(layer);
	layer:setFillParent(true,true);

	self.m_layersMap[level] = layer;

	return layer;
end
----------------------------------------------------------