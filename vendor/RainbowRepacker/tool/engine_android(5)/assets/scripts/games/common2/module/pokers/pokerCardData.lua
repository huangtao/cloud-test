
PokerCardData = class(DataInterfaceBase);

PokerCardData.Delegate = {
	clearPokerCardData = "clearPokerCardData";
	
	onDealCard = "onDealCard";

	refreshPokerCount = "refreshPokerCount";

	addHandCard = "addHandCard";
	removeHandCard = "removeHandCard";
	
	playOutCard = "playOutCard";
	removeOutCard = "removeOutCard";

	setOperateTurn = "setOperateTurn";

	requestOutCard = "requestOutCard";
	requestOutCardError = "requestOutCardError";

	sendOutCard = "sendOutCard";
	sendPass = "sendPass";
	
	setMingCard = "setMingCard";
	addMingCard = "addMingCard";
	removeMingCard = "removeMingCard";
};

PokerCardData.getInstance = function()
	if not PokerCardData.s_instance then
		PokerCardData.s_instance = new(PokerCardData);
	end
	return PokerCardData.s_instance;
end

PokerCardData.releaseInstance = function()
	delete(PokerCardData.s_instance);
	PokerCardData.s_instance = nil;
end
----------------------------------------------------
PokerCardData.ctor = function(self)
	self:clear();
end

PokerCardData.dtor = function(self)
	self:_resetData();
end

PokerCardData._resetData = function(self)
	self.m_handCard = {};
	self.m_handCardRecord = {};
	self.m_handCardCount = {};
	self.m_outCard = {};	
	self.m_mingCard = {}; 
	self.m_lastOutCardPlayer = nil;
	self.m_curOutCardPlayer = nil;
end

PokerCardData.clear = function(self)
	self:_resetData();

	local playerCount = self:getMaxPlayerCount();
	for i = 1,playerCount do 
		self.m_handCard[i] = {};
		self.m_handCardRecord[i] = {};
		self.m_handCardCount[i] = 0; 

		self.m_outCard[i] = {};	

		self.m_mingCard[i] = {};	
	end 

	self:notify(PokerCardData.Delegate.clearPokerCardData);
end

PokerCardData.getMaxPlayerCount = function(self)
	return GamePlayerManager2.getInstance():getCurGamePlayerMaxCount();
end 

PokerCardData.getMySeat = function(self)
	return GamePlayerManager2.getInstance():getMyLocalSeat();
end

PokerCardData.isSeatLegal = function(self,seat)
	return GamePlayerManager2.getInstance():isSeatLegal(seat);
end
--------------------------------------------------
PokerCardData.dealCard = function(self,cardValueList)
	self:_onDealCard(cardValueList,true);
end

PokerCardData.reconectDealCard = function(self,cardValueList)
	self:_onDealCard(cardValueList,false);
end

PokerCardData.addHandCard = function(self,seat,cardValueList,isNeedAnim)
	self:_addHandCardByValueList(seat,cardValueList,isNeedAnim);
	self.m_handCardRecord = Copy(self.m_handCard);
end

--获取手牌数据(返回：当前的手牌数据、刚发完牌时的手牌数据)
PokerCardData.getHandCard = function(self,seat)
	if not self:isSeatLegal(seat) then 
		self:log("getHandCard","位置不合法，seat = ",seat);
		return {};
	end

	return self.m_handCard[seat],self.m_handCardRecord[seat];
end

--获取当前手牌的张数
PokerCardData.getHandCardCount = function(self,seat)
	if not self:isSeatLegal(seat) then 
		self:log("getHandCardCount","位置不合法，seat = ",seat);
		return 0;
	end

	return self.m_handCardCount[seat];
end

PokerCardData.setCurOutCardPlayer = function(self,seat)
	if not self:isSeatLegal(seat) then 
		self:log("setCurOutCardPlayer","位置不合法，seat = ",seat);
		return;
	end
	self.m_isRequestOutCard = nil;
	self.m_curOutCardPlayer = seat;

	local param = {
		["seat"] = seat;
	};
	self:notify(PokerCardData.Delegate.setOperateTurn,param);
end

PokerCardData.onPlayerOutCard = function(self,seat,cardValueList,isNeedAnim)
	if not self:isSeatLegal(seat) then 
		self:log("onPlayerOutCard","位置不合法，seat = ",seat);
		return;
	end 
	if #self.m_handCard[seat] == 0 then 
		self:log("onPlayerOutCard","没有该玩家的手牌数据，seat = ",seat);
		return;
	end 

	cardValueList = table.verify(cardValueList);	

	local showPlayOutCard = false;
	local mySeat = self:getMySeat();
	if seat == mySeat then 
		if self.m_isRequestOutCard then 
			local isEqual = self:_checkIsEqualToQuestOut(seat,cardValueList);

			showPlayOutCard = not isEqual;
		else
			if #cardValueList > 0 then 
				showPlayOutCard = true;
				self:_removeHandCardByValueList(seat,cardValueList);
			else 
				self:onPlayerPass(seat);
			end 
		end 		
	else 		
		local outCount = #cardValueList;
		self:_refreshHandCardCount(seat,(-1)*outCount);
		if outCount > 0 then 
			showPlayOutCard = true;
			for i = 1,outCount do 
				table.remove(self.m_handCard[seat]);
			end 
			local param = {
				["seat"] = seat;
				["removeCount"] = outCount;
			};
			self:notify(PokerCardData.Delegate.removeHandCard,param);

			if self:isExistMingCard(seat) then 
				self:removeMingCard(seat,cardValueList);
			end
		else 
			self:onPlayerPass(seat);
		end 
	end
	self.m_isRequestOutCard = nil;
	self.m_lastOutCardPlayer = seat;
	table.insert(self.m_outCard[seat],cardValueList);

	if showPlayOutCard then 
		local param = {
			["seat"] = seat;
			["outCardList"] = cardValueList;
			["isNeedAnim"] = isNeedAnim;
		};
		self:notify(PokerCardData.Delegate.playOutCard,param);
	end 
end

--获取提示
--clickCards:点击选中的牌
--movingCards:滑动选中的牌
PokerCardData.getCardTips = function(self,clickCards,movingCards)
	local lastOutCard,lastType;
	if self.m_lastOutCardPlayer and self.m_lastOutCardPlayer ~= self:getMySeat() then --上次出牌的是自己，则不必根据别人出的牌去提示
		lastOutCard,lastType = self:getPlayerLastOutCard(self.m_lastOutCardPlayer);
	end 

	local cards = PokersConfig.getCardTips(self.m_handCard[self:getMySeat()],clickCards,movingCards,lastOutCard,lastType);
	if cards then 
		local indexList = self:_getCardIndexListByValueList(self.m_handCard[self:getMySeat()],cards);
		return cards,indexList;
	else 
		return;
	end
end

PokerCardData.getCardTipsByIndexList = function(self,clickIndexList,movingIndexList)
	clickIndexList = table.verify(clickIndexList);
	movingIndexList = table.verify(movingIndexList);

	local clickCards,movingCards;
	local seat = self:getMySeat();
	if #clickIndexList > 0 then 
		clickCards = self:_getHandCardByIndexList(seat,clickIndexList);
	end 

	if #movingIndexList > 0 then 
		movingCards = self:_getHandCardByIndexList(seat,movingIndexList);
	end 

	return self:getCardTips(clickCards,movingCards);
end

PokerCardData.requestOutCard = function(self)
	self:notify(PokerCardData.Delegate.requestOutCard);
end

PokerCardData.requestOutCardByIndexList = function(self,cardIndexList)
	cardIndexList = table.verify(cardIndexList);	
	local seat = self:getMySeat();
			
	local outCardList = {};
	local outCount = #cardIndexList;
	if outCount > 0 then 
		outCardList = self:_getHandCardByIndexList(seat,cardIndexList);			
	end 
	if not self:_checkOutCardIsLegal(outCardList) then
		return;
	end

	self:onPlayerOutCard(seat,outCardList,true);
	self.m_isRequestOutCard = true;

	local param = {
		["outCardList"] = outCardList;
	};
	self:notify(PokerCardData.Delegate.sendOutCard,param);
end

PokerCardData.requestOutCardByValueList = function(self,cardValueList)
	cardValueList = table.verify(cardValueList);

	if not self:_checkOutCardIsLegal(cardValueList) then
		return;
	end 

	self:onPlayerOutCard(self:getMySeat(),cardValueList,true);
	self.m_isRequestOutCard = true;

	local param = {
		["outCardList"] = cardValueList;
	};
	self:notify(PokerCardData.Delegate.sendOutCard,param);
end

PokerCardData.requestPass = function(self)	
	self:onPlayerPass(self:getMySeat());
	self.m_isRequestOutCard = true;
	self:notify(PokerCardData.Delegate.sendPass);
end

PokerCardData.onPlayerPass = function(self,seat)
	if not self:isSeatLegal(seat) then 
		self:log("onPlayerPass","位置不合法，seat = ",seat);
		return;
	end 

	local mySeat = self:getMySeat();
	if seat == mySeat then 
		self:_checkIsEqualToQuestOut(seat,{});
	end 
	table.insert(self.m_outCard[seat],{});--玩家不出牌，不做为上个出牌玩家；但牌要记录下来
	self.m_isRequestOutCard = nil;
	local param = {
		["seat"] = seat;
	};
	self:notify(PokerCardData.Delegate.removeOutCard,param);
end

--获取所有玩家的所有出牌记录
PokerCardData.getAllOutCardRecord = function(self)
	return self.m_outCard;
end

--获取某个玩家的所有出牌记录
PokerCardData.getOutCardBySeat = function(self,seat)
	if not seat then
		self:log("getOutCardBySeat","还没有玩家出过牌");
		return;
	end 

	if not self:isSeatLegal(seat) then 
		self:log("getOutCardBySeat","位置不合法，seat = ",seat);
		return;
	end

	return table.verify(self.m_outCard[seat]);
end

--获取某个玩家第几轮的出牌记录
--有出牌时返回出牌数据（table）和牌型，没有出牌时返回nil
PokerCardData.getOutCardBySeatAndTurn = function(self,seat,turn)
	turn = number.valueOf(turn);

	local outCards = table.verify(self:getOutCardBySeat(seat));
	local record = outCards[turn];

	if not record then 
		self:log("getOutCardBySeatAndTurn","暂时还没有该轮出牌记录，seat = ",seat,"turn = ",turn);
		return;
	else 
		record = table.verify(record);
		local recordType;
		if #record == 0 then 
			record = nil;
		else 
			recordType = PokersConfig.getCardType(record);
		end
		return record,recordType;
	end 
end

--获取玩家最后一手出的牌
--有该玩家出得牌时返回其出的牌(table)与牌型；没有则返回nil
PokerCardData.getPlayerLastOutCard = function(self,seat)
	local outCards = table.verify(self:getOutCardBySeat(seat));
	return self:getOutCardBySeatAndTurn(seat,#outCards);
end

PokerCardData.setMingCard = function(self,seat,cardValueList)
	if not self:isSeatLegal(seat) then 
		self:log("setMingCard","位置不合法，seat = ",seat);
		return;
	end

	self.m_mingCard[seat] = table.verify(cardValueList);
	self:sortHandCard(self.m_mingCard[seat]);

	local param = {
		["seat"] = seat;
		["mingList"] = self.m_mingCard[seat];
	};
	self:notify(PokerCardData.Delegate.setMingCard,param);
end

PokerCardData.addMingCard = function(self,seat,cardValueList)
	if not self:isSeatLegal(seat) then 
		self:log("addMingCard","位置不合法，seat = ",seat);
		return;
	end 
	cardValueList = table.verify(cardValueList);
	
	for k,card in ipairs(cardValueList) do 
		table.insert(self.m_mingCard[seat],card);
	end
	self:sortHandCard(self.m_mingCard[seat]);

	local addIndexArray = {};
	local identifiedIndexes = {};
	for k,v in ipairs(cardValueList) do 
		local isExist,key = self:_checkCardIsExist(self.m_mingCard[seat],v,identifiedIndexes);
		if isExist and key then
			table.insert(identifiedIndexes,key);
			table.insert(addIndexArray,key);
		end 
	end 

	local param = {
		["seat"] = seat;
		["addIndexArray"] = addIndexArray;
		["handList"] = self.m_mingCard[seat];
	}; 
    self:notify(PokerCardData.Delegate.addMingCard,param);
end

PokerCardData.sortHandCard = function(self,handList)
	PokersConfig.sortHandCard(handList);
end
------------------------------------------------
PokerCardData.log = function(self,funcName,...)
	Log.iWF("PokerCardData"," ",funcName," ",...);
end

PokerCardData._refreshHandCardCount = function(self,seat,changeNum)
	if not self:isSeatLegal(seat) then 
		self:log("_refreshHandCardCount","位置不合法，seat = ",seat);
		return;
	end 

	changeNum = number.valueOf(changeNum);
	self.m_handCardCount[seat] = self.m_handCardCount[seat] + changeNum;

	local param = {
		["seat"] = seat;
		["pokerCount"] = self.m_handCardCount[seat];
	};
	self:notify(PokerCardData.Delegate.refreshPokerCount,param);
end

PokerCardData._checkCardIsExist = function(self,cardValueList,card,identifiedIndexes)
	if not card then 
		return false;
	end 

	cardValueList = table.verify(cardValueList);
	identifiedIndexes = table.verify(identifiedIndexes);
	for k,v in ipairs(cardValueList) do 
		if v == card then 
			local sign = true;
			for _, index in pairs(identifiedIndexes) do
				if k == index then
					sign = false;
					break;
				end
			end
			if sign then
				return true,k;
			end
		end 
	end 
end

PokerCardData._onDealCard = function(self,cardValueList,isNeedAnim)
    self:clear();
	cardValueList = table.verify(cardValueList);
    self:_insertCardListInHand(cardValueList);
    
    local mySeat = self:getMySeat();
    self:sortHandCard(self.m_handCard[mySeat]);

    local param = {
		["seat"] = mySeat;
		["handList"] = self.m_handCard[mySeat];
		["isNeedAnim"] = isNeedAnim;
	}; 

	self.m_handCardRecord = Copy(self.m_handCard);
	self:notify(PokerCardData.Delegate.onDealCard,param);
end

PokerCardData._insertCardListInHand = function(self,cardValueList)
    local mySeat = self:getMySeat();
    for i, card in ipairs(cardValueList) do
        for seat, tbl in ipairs(self.m_handCard) do
            if seat == mySeat then
                tbl[i] = card;
            else 
                tbl[i] = 0;
            end
        end
    end

    local playerCount = self:getMaxPlayerCount();
	for i = 1,playerCount do 
		self:_refreshHandCardCount(i,#cardValueList);
	end 
end

PokerCardData._addHandCardByValueList = function(self,seat,cardValueList,isNeedAnim)
	if not self:isSeatLegal(seat) then
		self:log("_addHandCardByValueList","位置不合法，seat = ",seat); 
		return;
	end 

	cardValueList = table.verify(cardValueList); 
	self:_refreshHandCardCount(seat,#cardValueList);

	if seat == self:getMySeat() then 
		self:_addMyHandCard(cardValueList,isNeedAnim);
	else
		local addIndexArray = {};
		for k,card in ipairs(cardValueList) do 
			table.insert(self.m_handCard[seat],card);
			table.insert(addIndexArray,#self.m_handCard[seat]);
		end
		local param = {
			["seat"] = seat;
			["addIndexArray"] = addIndexArray;
			["addList"] = cardValueList;
			["handList"] = self.m_handCard[seat];
			["isNeedAnim"] = isNeedAnim;
		}; 
	    self:notify(PokerCardData.Delegate.addHandCard,param);
	end	

	if self:isExistMingCard(seat) then 
		self:addMingCard(seat,add);
	end 
end

PokerCardData._addMyHandCard = function(self,cardValueList,isNeedAnim)
	cardValueList = table.verify(cardValueList); 

	local seat = self:getMySeat();
	for k,card in ipairs(cardValueList) do 
		table.insert(self.m_handCard[seat],card);
	end
	self:sortHandCard(self.m_handCard[seat]);

	local addIndexArray = {};
	local identifiedIndexes = {};
	for k,v in ipairs(cardValueList) do 
		local isExist,key = self:_checkCardIsExist(self.m_handCard[seat],v,identifiedIndexes);
		if isExist and key then
			table.insert(identifiedIndexes,key);
			table.insert(addIndexArray,key);
		end 
	end 

	local param = {
		["seat"] = seat;
		["addIndexArray"] = addIndexArray;
		["addList"] = cardValueList;
		["handList"] = self.m_handCard[seat];
		["isNeedAnim"] = isNeedAnim;
	}; 
    self:notify(PokerCardData.Delegate.addHandCard,param);
end

PokerCardData._removeHandCardByValueList = function(self,seat,removeCardValueList)
	if not self:isSeatLegal(seat) then 
		self:log("_removeHandCardByValueList","位置不合法，seat = ",seat);
		return;
	end
	if #self.m_handCard[seat] == 0 then 
		self:log("_removeHandCardByValueList","没有该玩家的手牌数据，seat = ",seat);
		return;
	end 

	removeCardValueList = table.verify(removeCardValueList);

	local removeIndexArray = {};
	for k,v in ipairs(removeCardValueList) do 
		local isExist,key = self:_checkCardIsExist(self.m_handCard[seat],v);
		if isExist and key then 	
			table.remove(self.m_handCard[seat],key);		
			table.insert(removeIndexArray,key);	
		else 
			self:log("_removeHandCardByValueList","玩家打出去的牌中有自己没有的手牌数据！！！byte = ",v,",removeList = ",
				removeCardValueList,",handList = ",self.m_handCard[seat]);
			return;
		end 
	end 
	self:_refreshHandCardCount(seat,-(#removeIndexArray));

	local param = {
		["seat"] = seat;
		["removeCount"] = #removeCardValueList;
		["removeIndexArray"] = removeIndexArray;
	};
	self:notify(PokerCardData.Delegate.removeHandCard,param);

	if self:isExistMingCard(seat) then 
		self:removeMingCard(seat,removeCardValueList);
	end
end

PokerCardData._getHandCardByIndexList = function(self,seat,cardIndexList)
	if not self:isSeatLegal(seat) then 
		self:log("_getHandCardByIndexList","位置不合法，seat = ",seat);
		return;
	end 
	if #self.m_handCard[seat] == 0 then 
		self:log("_getHandCardByIndexList","没有该玩家的手牌数据，seat = ",seat);
		return;
	end 

	cardIndexList = table.verify(cardIndexList);

	local cardList = {};
	for k,v in ipairs(cardIndexList) do 
		local card = self.m_handCard[seat][v];
		if not card then 
			self:log("_getHandCardByIndexList","手牌中没有这张牌，seat = ",seat,"index = ",v);
			return;
		end 
		table.insert(cardList,card);
	end 

	return cardList;
end

PokerCardData._getCardIndexListByValueList = function(self,cardList,valueList)
	cardList = table.verify(cardList);
	valueList = table.verify(valueList);

	local indexList = {};
	local identifiedIndexes = {};
	for k,v in ipairs(valueList) do 
		local isExist,key = self:_checkCardIsExist(cardList,v,identifiedIndexes);
		if isExist and key then
			table.insert(identifiedIndexes,key);
			table.insert(indexList,key);
		end
	end

	return indexList;
end

PokerCardData._checkOutCardIsLegal = function(self,cardValueList)
	local mySeat = self:getMySeat();
	if self.m_curOutCardPlayer ~= mySeat then 
		self:log("_checkOutCardIsLegal","还没轮到我出牌！！！curOutCardPlayer = ",self.m_curOutCardPlayer);
		self:notify(PokerCardData.Delegate.setOperateTurn,{["seat"] = self.m_curOutCardPlayer});
		self:notify(PokerCardData.Delegate.requestOutCardError);
		return false;
	end 

	cardValueList = table.verify(cardValueList);

	for k,v in ipairs(cardValueList) do 
		local isExist = self:_checkCardIsExist(self.m_handCard[mySeat],v);
		if not isExist then 
			self:log("_checkOutCardIsLegal","我的手牌中没有该数据！！！card = ",v);
			return false;
		end 
	end 

	if not PokersConfig.checkCardTypeIsLegal(cardValueList) then 
		self:log("_checkOutCardIsLegal","牌型不合法！！！");
		self:notify(PokerCardData.Delegate.requestOutCardError);
		return false;
	end 
	
	if not self.m_lastOutCardPlayer or self.m_lastOutCardPlayer == self:getMySeat() then --还没人出牌或自己出完牌后，无其他玩家出牌，则任意合法牌型的牌都可以出
		return true;
	end 

	local lastOutCard,lastType = self:getPlayerLastOutCard(self.m_lastOutCardPlayer);
	if not PokersConfig.checkOutCardIsLegal(cardValueList,lastOutCard,lastType) then 
		self:log("_checkOutCardIsLegal","出牌不合法！！！");
		self:notify(PokerCardData.Delegate.requestOutCardError);
		return false;
	end 
 	
 	return true;	
end


PokerCardData._checkIsEqualToQuestOut = function(self,seat,cardValueList)
	if seat ~= self:getMySeat() then 
		self:log("_checkIsEqualToQuestOut","不是自己出的牌啊，seat = ",seat);
		return;
	end 
	local lastOutCard = table.remove(self.m_outCard[seat]); --此处移除自己请求出牌时添加的记录，会在比较完成后再把出牌数据添加进该记录的
	lastOutCard = table.verify(lastOutCard);

	cardValueList = table.verify(cardValueList);
	local add = SubtractArray(lastOutCard,cardValueList);
	local remove = SubtractArray(cardValueList,lastOutCard);
	if #add > 0 then 
		self:_addHandCardByValueList(seat,add,false);
	end 

	if #remove > 0 then 
		self:_removeHandCardByValueList(seat,remove);
	end

	return (#add == 0 and #remove == 0);
end

----------------------------------------------------------------------------------------------------------
PokerCardData.isExistMingCard = function(self,seat)
	if not self:isSeatLegal(seat) then 
		self:log("isExistMingCard","位置不合法，seat = ",seat);
		return false;
	end 

	return #self.m_mingCard[seat] > 0;
end

PokerCardData.removeMingCard = function(self,seat,removeCardValueList)
	if not self:isSeatLegal(seat) then 
		self:log("removeMingCard","位置不合法，seat = ",seat);
		return;
	end 
	removeCardValueList = table.verify(removeCardValueList);
	if #self.m_mingCard[seat] > 0 then 
		local removeIndexArray = {};
		for k,v in ipairs(removeCardValueList) do 
			local isExist,key = self:_checkCardIsExist(self.m_mingCard[seat],v);
			if isExist and key then 
				table.remove(self.m_mingCard[seat],key);
				table.insert(removeIndexArray,key);
			else 
				self:log("removeMingCard","玩家打出的数据中有自己没有的明牌数据！！！removeList = ",
					removeCardValueList,",handList = ",self.m_mingCard[seat]);
				return;
			end 
		end 

		local param = {
			["seat"] = seat;
			["removeCount"] = outCount;
			["removeIndexArray"] = removeIndexArray;
		};
		self:notify(PokerCardData.Delegate.removeMingCard,param);
	end 
end