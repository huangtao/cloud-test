SilverFlyAnim = class(AnimBase);
SilverFlyAnim.s_defaultImagePath = "games/common/roomTask/silverroom/oneSilverIcon.png"; 
SilverFlyAnim.s_defaultFlyTime = 800; -- 每个银币播放时间
SilverFlyAnim.s_defaultDeltaTime = 30; -- 银币播放帧时间

SilverFlyAnim.s_defaultMoneyCountMin = 14;
SilverFlyAnim.s_defaultMoneyCountMax = 15;

SilverFlyAnim.s_defaultFinishVisible = false; -- 银币播放完后显示状态

SilverFlyAnim.anims = {};

SilverFlyAnim.play = function (parent,seat,startX,endX,startY,endY,firstFunc,firstObj,lastFunc,lastObj)
	-- body
	if not typeof(parent,DrawingBase) then
		return;
	end
	SilverFlyAnim.stop(seat);

	SilverFlyAnim.anims[seat] = {};
	local animLayer = SilverFlyAnim.anims[seat];

	animLayer.layer = UIFactory.createNode();
	animLayer.layer:setFillParent(true,true);
	parent:addChild(animLayer.layer);
	animLayer.parent = parent;
	animLayer.seat = seat;

	animLayer.firstCallbackFunc = firstFunc;
	animLayer.firstCallbackObj = firstObj;
	animLayer.lastCallbackFunc = lastFunc;
	animLayer.lastCallbackObj = lastObj;

	local count = math.random(SilverFlyAnim.s_defaultMoneyCountMin,SilverFlyAnim.s_defaultMoneyCountMax);
	for num = 1, count do
		local moneyIcon = UIFactory.createImage(SilverFlyAnim.s_defaultImagePath);
		if moneyIcon then
			local _startX, _startY = startX, startY;
			local _endX = math.random(endX-15,endX+15);
			local _endY = math.random(endY-15,endY+15);
			animLayer.layer:addChild(moneyIcon);
			moneyIcon:setPos(_startX,_startY);
			local rate = math.random(80,120) / 70;
			local mw,mh = moneyIcon:getSize();
			moneyIcon:setSize(mw*rate,mh*rate);

			local frameCount = math.ceil(SilverFlyAnim.s_defaultFlyTime / SilverFlyAnim.s_defaultDeltaTime);
			local dsX,dsY = _endX-_startX,_endY-_startY;
			local a = dsY/math.pow(dsX,2);
			local arrayX = {};
			local arrayY = {};
			local i = 1;
			local step = dsX/frameCount;
			local accelerate_s = dsX/2;
			local decelerate_s = dsX/2;
			local accelerate_time = math.floor(frameCount/2);
			local accelerate = 2*accelerate_s / math.pow(accelerate_time,2);

			local maxVelocity = accelerate * accelerate_time;
			local decelerate_time = frameCount - accelerate_time;
			local decelerate = 2*(decelerate_s - maxVelocity*decelerate_time) / math.pow(decelerate_time,2);
			while i <= frameCount do
				if i <= accelerate_time then
					arrayX[i] = 1/2 * accelerate * math.pow(i,2);
				else
					arrayX[i] = arrayX[accelerate_time] + maxVelocity * (i - accelerate_time) + 1/2 * decelerate * math.pow(i-accelerate_time,2);
				end
				if dsY<0 then
					arrayY[i] = dsY-a*math.pow((frameCount-i)*step,2);
				else
					arrayY[i] = a*math.pow(arrayX[i],2);
				end
				i = i + 1;
			end
			for i = 1, frameCount do
				arrayX[i] = arrayX[i] * System.getLayoutScale();
				arrayY[i] = arrayY[i] * System.getLayoutScale();
			end

			Log.v("SilverFlyAnim.play","arrayX --> ", arrayX);
			Log.v("SilverFlyAnim.play","arrayY --> ", arrayY);
			local resX = new(ResDoubleArray,arrayX);
			local resY = new(ResDoubleArray,arrayY);

			local delay = (num-1)*(num*2);
			local resAnimX = AnimFactory.createAnimIndex(kAnimNormal,0,table.maxn(arrayX)-1,SilverFlyAnim.s_defaultFlyTime,resX,delay);
			local resAnimY = AnimFactory.createAnimIndex(kAnimNormal,0,table.maxn(arrayY)-1,SilverFlyAnim.s_defaultFlyTime,resY,delay);
			resAnimX:setDebugName("SilverFlyAnim|resAnimX|seat_" .. seat .. "|num_" .. num);
			resAnimY:setDebugName("SilverFlyAnim|resAnimY|seat_" .. seat .. "|num_" .. num);

			if num == 1 then
				resAnimX:setEvent(animLayer,SilverFlyAnim.onFirstCallbackEvent);
			elseif num == count then
				resAnimX:setEvent(animLayer,SilverFlyAnim.onLastCallbackEvent);
			end
			resAnimY:setEvent(nil,function ( ... )
				-- body
				moneyIcon:setVisible(SilverFlyAnim.s_defaultFinishVisible);
			end);

			if table.isEmpty(animLayer.resAnimX_table) then
				animLayer.resAnimX_table = {};
			end
			table.insert(animLayer.resAnimX_table,resAnimX);
			if table.isEmpty(animLayer.resAnimY_table) then
				animLayer.resAnimY_table = {};
			end
			table.insert(animLayer.resAnimY_table,resAnimY);

			local slate = AnimFactory.createTranslate(resAnimX,resAnimY);
			moneyIcon:addProp(slate,1);
			moneyIcon:addPropTransparency(2,kAnimNormal,50,delay,0,1);
		end
	end
end

SilverFlyAnim.onFirstCallbackEvent = function (animLayer)
	-- body
	if animLayer and type(animLayer.firstCallbackFunc) == "function" then
		animLayer.firstCallbackFunc(animLayer.firstCallbackObj,animLayer.seat);
	end
end

SilverFlyAnim.onLastCallbackEvent = function (animLayer)
	-- body
	if animLayer and type(animLayer.lastCallbackFunc) == "function" then
		animLayer.lastCallbackFunc(animLayer.lastCallbackObj,animLayer.seat);
	end
	local seat = animLayer and animLayer.seat;
	SilverFlyAnim.stop(seat);
end

SilverFlyAnim.stop = function (seat)
	-- body
	local animLayer = SilverFlyAnim.anims[seat];
	if not table.isEmpty(animLayer) then
		for _, anim in pairs(animLayer.resAnimX_table) do
			delete(anim);
		end
		for _, anim in pairs(animLayer.resAnimY_table) do
			delete(anim);
		end
		animLayer.layer:removeAllChildren(true);
		animLayer.parent:removeChild(animLayer.layer,true);
	end
	SilverFlyAnim.anims[seat] = nil;
end

SilverFlyAnim.release = function ()
	-- body
	for index, layer in pairs(SilverFlyAnim.anims) do
		for _, anim in pairs(layer.resAnimX_table) do
			delete(anim);
		end
		for _, anim in pairs(layer.resAnimY_table) do
			delete(anim);
		end
		layer.layer:removeAllChildren(true);
		layer.parent:removeChild(layer.layer);
	end
	SilverFlyAnim.anims = {};
end
