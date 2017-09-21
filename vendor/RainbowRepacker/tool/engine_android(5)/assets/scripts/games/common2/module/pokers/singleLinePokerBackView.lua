local SingleLinePokerBackView = class(Node);

local pokerScale = 0.82;
SingleLinePokerBackView.defaultConfig = {
	totalWidth = System.getScreenScaleWidth() - 30; --n张扑克牌所占的总宽度
	pokerWidth = 202*pokerScale; --每张扑克牌的宽度
	pokerHeight = 272*pokerScale;--每张扑克牌的高度
	maxSpace = 120 * pokerScale;--牌与牌之间的最大间隔
	file = "games/common/poker/poker_back_big.png";--绘制牌背被使用的图片
};

SingleLinePokerBackView.ctor = function(self,config)
	self.m_config = self:_parseConfig(config);
	
	self:setSize(self.m_config.totalWidth,self.m_config.pokerHeight);

	self.m_cards = {};
end

SingleLinePokerBackView.dtor = function(self)
end
----------------------------------------------------------------------------------------------
--添加牌
SingleLinePokerBackView.addPokers = function(self,pokerCount)
	pokerCount = number.valueOf(pokerCount);
	if pokerCount <= 0 then 
		return;
	end 

	for i = 1,pokerCount do 
		local poker = self:_createPoker();
		table.insert(self.m_cards,poker);
		self:addChild(poker);
		poker:setSize(self.m_config.pokerWidth, self.m_config.pokerHeight);
	end 
	self:_updatePoker();
end

--移除牌
SingleLinePokerBackView.removePokers = function(self, pokerCount)
	pokerCount = number.valueOf(pokerCount);
	if pokerCount <= 0 then 
		return;
	end

	for i = 1,pokerCount do 
		local poker = table.remove(self.m_cards);
		self:removeChild(poker,true);
		poker = nil;
	end 

	self:_updatePoker();
end

--移除所有牌
SingleLinePokerBackView.removeAllPokers = function(self)
	for k, v in pairs(self.m_cards) do 
		self:removeChild(v);
		delete(v);
	end

	self.m_cards = {};
end

----------------------------------------------------------------------------------------------
SingleLinePokerBackView._createPoker = function(self)
	local img = UIFactory.createImage(self.m_config.file);
	return img;
end

SingleLinePokerBackView._updatePoker = function(self)
	local visibleCards = self.m_cards;
	local cardW = self.m_config.pokerWidth;
	local cardH = self.m_config.pokerHeight;
	local totalW,totalH = self:getSize();

	local x = 0;
	local space = self.m_config.maxSpace;
	local maxWidth = (#visibleCards - 1) * space + cardW;
	if totalW > maxWidth then
		x = (totalW - maxWidth) / 2;
	else
		space = (totalW - cardW) / (#visibleCards - 1);
	end

    for _, v in ipairs(visibleCards) do 
		v:setPos(x, 0);
		x = x + space;
    end
end

SingleLinePokerBackView._parseConfig = function(self,config)
	config = table.verify(config);

	local data = {};
	data.totalWidth = config.totalWidth or self.defaultConfig.totalWidth;
	data.pokerWidth = config.pokerWidth or self.defaultConfig.pokerWidth;
	data.pokerHeight = config.pokerHeight or self.defaultConfig.pokerHeight;
	data.maxSpace = config.maxSpace or self.defaultConfig.maxSpace;
	data.file = config.file or self.defaultConfig.file;

	return data;
end

return SingleLinePokerBackView;
