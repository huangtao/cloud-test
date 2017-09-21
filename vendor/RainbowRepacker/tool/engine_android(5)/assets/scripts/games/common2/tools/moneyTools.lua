--[[
	银币格式化拆分
]]

MoneyTools = {};

-- 拆分格式：xxExxW
MoneyTools.skipMoney = function (curMoney, isFlag)
	local moneyStr = nil;
	local curMoneyTmp = tonumber(curMoney);
	if not curMoneyTmp then
		return curMoney;
	end

	if curMoneyTmp < 0 then
		curMoneyTmp = 0 - curMoneyTmp;
	end

	local money = curMoneyTmp .. "";
	local length = #money;
	if length <= 6 then
		moneyStr = ToolKit.skipMoney(tonumber(money));
	elseif length <= 8 then
		local startStr = string.sub(money, 1, length - 4);
		local endStr = string.sub(money, length - 3, length - 3);
		moneyStr = startStr .. "." .. endStr .. "W";
	elseif length >= 9 then
		local startStr = string.sub(money, 1, length - 8);
		local endStr = string.sub(money, length - 7, length - 7);
		moneyStr = startStr .. "." .. endStr .. "E";
	end

	if tonumber(curMoney) < 0 then
		moneyStr = "-" .. moneyStr;
    else
        if isFlag then
            moneyStr = "+" .. moneyStr;
        end
	end

	if not moneyStr then
		moneyStr = curMoney;
	end

	return moneyStr;
end

MoneyTools.getMoneyImage = function (num,numPath,goldIcon)
	local moneyStr = ToolKit.skipMoney(num,true);
	local node = UIFactory.createNode();
	
	local maxNum = #moneyStr;
	for i = 1, maxNum do
		local c = string.sub(moneyStr,i,i);
		if c then
			local nodeW, nodeH = node:getSize();
			local offsetY = 0;
			if c == "," then
				c = "skim";
			elseif c == "." then
				c = "point";
				offsetY = 13;
				nodeW = nodeW - 8;
			elseif c == "+" then
				c = "plus";
			elseif c == "-" then
				c = "minus";
			end
			local image = UIFactory.createImage(string.format(numPath,c));
			if image then
				local imageW, imageH = image:getSize();
				node:addChild(image);
				image:setAlign(kAlignLeft);
				image:setPos(nodeW,offsetY);
				node:setSize(imageW+nodeW,nodeH);
			end
		end
	end
	if goldIcon then
		local nodeW, nodeH = node:getSize();
		local moneyIcon = UIFactory.createImage(goldIcon);
		local iconW, iconH = moneyIcon:getSize();
		node:addChild(moneyIcon);
		moneyIcon:setAlign(kAlignLeft);
		moneyIcon:setPos(nodeW + 5,0);
	end
	return node;
end

MoneyTools.getMoneyNode = function (numStr, isShowIcon, iconPath, numPath)
	if type(numStr) ~= "string" and type(numStr) ~= "number" then
		return;
	end
	numStr = numStr .. "";

	local node = UIFactory.createNode();
	node:setSize(0,29);
	local width,height = 0,29;
	if isShowIcon then
		local icon = UIFactory.createImage(iconPath or "games/common/head/money_num/money_icon.png");
		node:addChild(icon);
		icon:setAlign(kAlignLeft);
		icon:setPos(0,0);
		node:setSize(25,29);
	end

	for i = 1, #numStr do
		local node_W, node_H = node:getSize();

		local c = string.sub(numStr,i,i);
		local filePath, offsetY = "", 0;
		if tonumber(c) then
			filePath = string.format(numPath or "games/common/head/money_num/num_%s.png",c);
		elseif c == "," then
			filePath = "games/common/head/money_num/num_skim.png";
			offsetY = 10;
		elseif c == "." then
			filePath = "games/common/head/money_num/num_point.png";
			offsetY = 8;
			node_W = node_W - 1;
		elseif c == "W" then
			filePath = "games/common/head/money_num/money_wan.png";
			node_W = node_W + 0;
		elseif c == "E" then
			filePath = "games/common/head/money_num/money_yi.png";
			node_W = node_W + 0;
		end
		local image = UIFactory.createImage(filePath);
		if image then
			local image_W, image_H = image:getSize();
			node:addChild(image);
			image:setAlign(kAlignLeft);
			image:setPos(node_W, offsetY);
			node:setSize(node_W+image_W-2,node_H);
		end
	end

	return node;
end

MoneyTools.getNumberImage = function (path, num)
	local node = UIFactory.createNode();
	local numStr = num .. "";
	local maxNum = #numStr;
	for i = 1, maxNum do
		local c = string.sub(numStr,i,i);
		local image = UIFactory.createImage(string.format(path,c));
		if image then
			local node_W, node_H = node:getSize();
			local image_W, image_H = image:getSize();
			if node_H < image_H then
				node_H = image_H;
			end
			node:addChild(image);
			image:setPos(node_W,0);
			node:setSize(node_W+image_W,node_H);
		end
	end

	return node;
end



---------------------------------------------------------------
MoneyTools.getNumberNode = function (path, numStr, offsetX)
	if type(numStr) ~= "string" and type(numStr) ~= "number" then
		return;
	end
	offsetX = number.valueOf(offsetX);
	numStr = numStr .. "";
	local numberNode = UIFactory.createNode();

	local maxIndex = #numStr;
	for i = 1, maxIndex do
		local file = "";
		local c = string.sub(numStr,i,i);
		if tonumber(c) then
			file = string.format(path,c);
		elseif c == "," then
			file = string.format(path,"skim");
		elseif c == "." then
			file = string.format(path,"point");
		elseif c == "+" then
			file = string.format(path,"plus");
		elseif c == "-" then
			file = string.format(path,"minus");
		elseif c == "W" then
			file = string.format(path,"wan");
		elseif c == "E" then
			file = string.format(path,"yi");
		elseif c == "F" then
			file = string.format(path,"fen");
		else
			-- 可以扩展
		end
		local image = UIFactory.createImage(file);
		if image then
			numberNode:addChild(image);
			image:setAlign(kAlignLeft);
			local nodeWidth, nodeHeight = numberNode:getSize();
			local imageWidth, imageHeight = image:getSize();
			if nodeHeight < imageHeight then
				nodeHeight = imageHeight;
			end
			if i == 1 then
				image:setPos(nodeWidth,0);
				numberNode:setSize(nodeWidth+imageWidth,nodeHeight);
			else
				image:setPos(nodeWidth+offsetX,0);
				numberNode:setSize(nodeWidth+imageWidth+offsetX,nodeHeight);
			end
		end
	end
	return numberNode;
end
