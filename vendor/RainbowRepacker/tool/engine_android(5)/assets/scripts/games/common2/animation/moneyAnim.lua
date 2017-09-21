

MoneyAnim2 = class(Node);


MoneyAnim2.ctor = function ( self, money, x, y, img )
	self:setPos(x, y);
	self.money = money;
	self.moveTimeInMillisec = 3000;
	self.moveDistan = 30;
	self.transParency = 0.5;
	self:addToRoot();
	self:setLevel(9999);
    self.isPlaying = false;
	self:load(money);
end
MoneyAnim2.setParam = function(self,time,distance,transParency,noEndRelease)
	-- body
	self.moveDistan = distance;
	self.moveTimeInMillisec = time;
	self.noEndRelease = noEndRelease;
    self.transParency = transParency;
end
MoneyAnim2.load = function(self,money)
	-- body
	self.moneyNode = new(Node);
	self:addChild(self.moneyNode);
    local img = self:parseMoney(money);
    self.moneyNode:addChild(img);

end
MoneyAnim2.play = function ( self )
    self:stop();
    self.isPlaying = true;
	self:setVisible(true);
	self:addProp();
end

MoneyAnim2.parseMoney = function ( self, money )
	local moneyImgWidth = 0;
	local moneyImgHeight = 0;
	local imgNode = new(Node);
	self.imgArray = {};
	local mt = number.valueOf(money).."";
	local numFile = "num";
	if money > 0 then
		mt = "+"..mt;
	    numFile = "num";
	else 
       numFile = "f";
	end
	local len = string.len(mt);
	local x,y = 0,0;
	for i=1,len do
		local c = string.sub(mt, i, i);
		local url = nil;
		if c == "-" then

			url = "games/common/moneyAnim/jian.png";
		elseif c == "+" then
			url = "games/common/moneyAnim/jia.png";
		else
			url = "games/common/moneyAnim/"..numFile..(c or "")..".png";
		end
		local img = UICreator.createImg(url, x, y );
		img:setSize(38 , 40);
		x = x + img.m_res.m_width;
		moneyImgWidth = moneyImgWidth + img.m_res.m_width;
		if img.m_res.m_height > moneyImgHeight then
			moneyImgHeight = img.m_res.m_height;
		end
		imgNode:addChild(img);
		
	end
	return imgNode;
	-- self.moneyNode:setPos(0 - moneyImgWidth/ 2, 0 - moneyImgHeight / 2);
end

MoneyAnim2.addProp = function ( self )
     if not self.moneyNode:checkAddProp(1) then
		  self.moneyNode:removeProp(1);
	 end	
	 if not self.moneyNode:checkAddProp(2) then
		  self.moneyNode:removeProp(2);
	 end	
	self.moneyNode:addPropTranslate(1, kAnimNormal, self.moveTimeInMillisec, 0, 0, 0, 0, -self.moveDistan);
	self.moneyNode:addPropTransparency( 2, kAnimNormal, self.moveTimeInMillisec, 0, 1.0, self.transParency)
	--anim:setDebugName("MoneyAnim2");
	
	self:cleanAnim();
	self.m_animTimer = AnimFactory.createAnimInt(kAnimNormal, 0, 0 ,self.moveTimeInMillisec, 0);
	self.m_animTimer:setDebugName("MoneyAnim2.addProp|m_animTimer");
	self.m_animTimer:setEvent(self,function(self)
		if not self.noEndRelease then 
		   self:stop();
		   if self.m_parent then 
			  self.m_parent:removeChild(self);
		   end 
		   delete(self);
	    end 
		
	end);
end

MoneyAnim2.cleanAnim = function(self)
	delete(self.m_animTimer)
	self.m_animTimer = nil;
end

MoneyAnim2.stop = function(self)
	self:cleanAnim();
	if self.isPlaying then 
		self.imgArray = nil;
		self.money = 0;
	    self.isPlaying = false;
	    self.moneyNode:removeAllChildren();
	    delete(self.moneyNode);
	end 
	
end
MoneyAnim2.dtor = function ( self )
    self:stop();
	self:removeAllChildren();
end



