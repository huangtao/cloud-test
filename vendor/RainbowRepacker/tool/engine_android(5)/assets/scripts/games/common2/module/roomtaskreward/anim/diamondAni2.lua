require("qnFiles/qnPlist/games/diamondpin2");

--[[
    奖励的钻石动画
]]

Diamond2 = class(AnimBase);
Diamond2.count=5;

Diamond2.load = function()

	if not Diamond2.root then
		Diamond2.root=new (Node);
		Diamond2.root:addToRoot();
		local files={};
		local index = 1;
		for k,v in pairs(diamond_map2) do
			files[index] = v;
            index = index+1;
		end
		
		Diamond2.imgs = UIFactory.createImages(files);
		local w,h = Diamond2.imgs:getSize();
		Diamond2.root:setSize(w,h);
        Diamond2.root:addChild(Diamond2.imgs);
        return w or 0,h or 0;
	end
end

Diamond2.play = function(endX,endY,startX,startY)

	Diamond2.release();
	local w,h = Diamond2.load();
	local screenW = System.getScreenScaleWidth();
    local screenH = System.getScreenScaleHeight();
    Diamond2.x = startX or (screenW-w)/2;
	Diamond2.y = startY or (screenH-h)/2;
    Diamond2.root:setPos(Diamond2.x,Diamond2.y);
	Diamond2.imgs:setVisible(true);
	Diamond2.root:setVisible(true);
    Diamond2.startSwitchBg();--动画
    --kEffectPlayer:play(DlqhEffectKeys.AudioMJCHIPENG);
    --0.5s之后移动到头像位置
    Diamond2.endX = endX;
    Diamond2.endY = endY;
    Diamond2.centerX = (screenW-w)/2;
    Diamond2.centerY = (screenH-h)/2;
    Diamond2.moveToCenter(Diamond2.centerX,Diamond2.centerY);
    --Diamond2.moveToHead(endX,endY);
    return Diamond2.root;
end

Diamond2.moveToCenter = function(endX,endY )

	if not Diamond2.root:checkAddProp(1) then
        Diamond2.root:removeProp(1);
    end
    if not Diamond2.root:checkAddProp(2) then
        Diamond2.root:removeProp(2);
    end
    Diamond2.root:addPropScale(1, kAnimNormal, 300, 0,0.3,1,0.3,1,kCenterDrawing);
    local anit = Diamond2.root:addPropTranslate(2,kAnimNormal,200,500,0,endX- Diamond2.x,0,endY - Diamond2.y);
    anit:setEvent(Diamond2,function(Diamond2)
        Diamond2.root:removeProp(1);
        Diamond2.root:removeProp(2);
        Diamond2.root:setPos(Diamond2.centerX,Diamond2.centerY);
    	Diamond2.root:setSize(340,340);
    	Diamond2.moveToHead(Diamond2.endX,Diamond2.endY);
    end);
end

Diamond2.moveToHead = function(endX,endY )
    if not Diamond2.root:checkAddProp(1) then
        Diamond2.root:removeProp(1);
    end
    if not Diamond2.root:checkAddProp(2) then
        Diamond2.root:removeProp(2);
    end
    Diamond2.root:addPropScale(1, kAnimNormal, 500, 1000,1,0.4,1,0.4,kCenterDrawing);
    local oldx,oldy = Diamond2.root:getPos();
    local anit = Diamond2.root:addPropTranslate(2,kAnimNormal,500,1000,0,(endX-oldx)/0.4,0,(endY - oldy)/0.4);
    anit:setEvent(Diamond2,function(Diamond2)
    	Diamond2.release();
    end);
end

Diamond2.stop = function()
	Diamond2.stopSwitchBg();
	if Diamond2.root then
		Diamond2.root:setVisible(false);  
	end
end

Diamond2.release = function()
	Diamond2.stop();
	if Diamond2.root then
        local parent = Diamond2.root:getParent();
        if parent then
            parent:removeChild(Diamond2.root);
        end
        delete(Diamond2.root);
        Diamond2.root = nil;
    end
    Diamond2.curIndex=nil;
end

Diamond2.startSwitchBg = function()
    Diamond2.curIndex = 0;
	Diamond2.imgs:setImageIndex(Diamond2.curIndex);
	Diamond2.animSwitchBgs = AnimFactory.createAnimInt(kAnimRepeat, 0, 1, 20, -1);
	Diamond2.animSwitchBgs:setDebugName("Diamond2.startSwitchBg");
	Diamond2.animSwitchBgs:setEvent(Diamond2, Diamond2.onFinishSwitchBg);
end

Diamond2.stopSwitchBg = function()
	if Diamond2.animSwitchBgs then
		delete(Diamond2.animSwitchBgs);
		Diamond2.animSwitchBgs = nil;
	end
end

Diamond2.dtor = function(self)
	Diamond2.release();
end

Diamond2.onFinishSwitchBg = function()

	if Diamond2.curIndex<0 or Diamond2.curIndex>Diamond2.count then
	    Diamond2.curIndex = 0;
	    --Diamond2.stopSwitchBg();
	    return;
	end
    Diamond2.imgs:setImageIndex(Diamond2.curIndex);
	Diamond2.curIndex = Diamond2.curIndex+1;
end

------------------------------------------------------ 定时器
Diamond2.onTimer = function()
    Diamond2.release(); 
end