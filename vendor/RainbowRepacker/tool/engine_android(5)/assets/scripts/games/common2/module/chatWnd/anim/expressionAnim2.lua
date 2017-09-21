--[[
    常用表情动画
]]
require("games/common2/module/chat/data/roomChatConfig");
require(RoomChatConfig.s_chatPathPrefix.."data/expressionDataManager2");
require("EngineCore/swf");

ExpressionAnim2 = class(Node);


ExpressionAnim2.ctor = function (self)
    self:setFillParent(true, true);
    self.sprites={};
    self.time=2500;
    self.playCount = 1;

    self.coords = {
        [1] = {100,225,165,165}, --mine
        [2] = {800,105,165,165},  --user2
        [3] = {100,105,165,165}  --user3
    };
end

ExpressionAnim2.load = function(self)
end

ExpressionAnim2.stop = function(self)
end

-- 获取动画的配置文件
ExpressionAnim2.getResData = function(self,faceType,faceIndex)
    local config = ExpressionDataManager2.getInstance():getExpConfigByFaceType(faceType);
    if table.isEmpty(config) then
        return;
    end

    if not table.isTable(config[faceIndex]) then
        return;
    end

    if config[faceIndex].isSwf then 
        local swfInfoPath = config[faceIndex].swfInfoPath;
        local swfPinPath = config[faceIndex].swfPinPath;
        return true,swfInfoPath,swfPinPath;
    else  
        local data = {};
        local faceResMap = config.expAnimResMap;
        local img = string.concat(config.expAnimNamePrefix , faceIndex , "0%02d.png");
        if type(faceResMap) == "table" then
            data.faceName = {faceResMap,img};
        elseif type(faceResMap) == "string" then
            data.faceName = faceResMap..img;
        end

        data.imgCount = config[faceIndex].imgCount;
        data.playCount = config[faceIndex].playCount;
        data.playTime = config[faceIndex].ms;

        return false,data.faceName,data.imgCount,data.playTime,data.playCount;
    end 
end

-- 播放动画
ExpressionAnim2.play = function(self, seat, faceType, faceIndex, x, y, w, h, align, playerNum)
    local isSwf,formatName,num,duration,playCount = self:getResData(faceType,faceIndex);
    if isSwf then 
        self:playSwf(seat,formatName,num,x, y, w, h, align, playerNum);
    else 
        if formatName then
          self:playAnim(seat, formatName, 1, num, duration, playCount, x, y, w, h, align, playerNum);
        end
    end 
end 

--private
ExpressionAnim2.onTimer=function(obj, anim_type, anim_id, repeat_or_loop_num)
	if repeat_or_loop_num >= obj.sp.playCount-1 then
		obj.obj.releaseSprite(obj.obj,obj.sp);
	end
end

--private
ExpressionAnim2.releaseSprite=function(self,sps)
	local sprite 
	if type(sps) == "table" then 
		sprite = sps;
	else
		sprite = self.sprites[sps];
	end
	if not sprite then 
	    return;
	end
    if sprite.drawing and sprite.prop then 
        sprite.drawing:removePropByID(sprite.prop.m_propID);
    end;
    delete(sprite.prop);
    sprite.prop = nil;
    delete(sprite.anim);
    sprite.anim = nil;
	
    if sprite.res then
        for k,v in pairs(table.verify(sprite.res)) do 
            delete(v);
        end
    end
    sprite.res = nil;
    if sprite.drawing then
        self:removeChild(sprite.drawing);
        delete(sprite.drawing);
        sprite.drawing = nil;
    end
end

ExpressionAnim2.loadRes = function(self,formatName,startIndex,num)
	local res = {};
    if type(formatName) == "table" then 
        for i=0,num-1 do
            local strTmp=formatName[1][string.format(formatName[2],i+startIndex)];
            res[i] = new(ResImage,strTmp);
        end
    else    
    	for i=0,num-1 do
    		local strTmp=string.format(formatName,i+startIndex);
    		res[i] = new(ResImage,strTmp);
    	end
    end 
	return res;
end

ExpressionAnim2.createDrawing = function(self,res,x,y,w,h)
	local drawing = new(DrawingImage,res[0]);

    local rw,rh = drawing:getSize();
    local rx,ry = x - rw/2 + 20, y - rh/2 + 20;
	drawing:setPos(rx,ry);
	for i=1,#res do
		drawing:addImage(res[i],i);
	end
	return drawing;
end

ExpressionAnim2.playAnim = function(self,seat, formatName, startIndex, num, duration, playCount, x, y, w, h, align, playerNum)
    Log.d("playerNum", playerNum);
    self:release();
    local playerNum = playerNum or 4;	
   	if not tonumber(seat) or seat <= 0 or seat > playerNum then
   		return;
   	end

    if self.coords and self.coords[seat] then 
        x = x or self.coords[seat][1];
        y = y or self.coords[seat][2];
        w = w or self.coords[seat][3];
        h = h or self.coords[seat][4];
    end
    self:releaseSprite(seat);

	local sprite = {};
	sprite.playCount = playCount or self.playCount;
    sprite.res = self:loadRes(formatName,startIndex,num);
	sprite.drawing = self:createDrawing(sprite.res,x,y,w,h);
    sprite.drawing:setAlign(align);
	ToolKit.setDebugName(sprite.drawing , "DrawingImage|sprite.drawing");
	self:addChild(sprite.drawing);
	Log.d("ExpressionAnim2.playAnim, x", x, "y:", y, "w:", w, "h:", h, "sprite.drawing:", sprite.drawing ~= nil);
	sprite.anim = AnimFactory.createAnimInt(kAnimRepeat,0,#sprite.res,duration or self.time,-1);
	sprite.anim:setEvent({obj= self, sp = sprite},self.onTimer);
	sprite.prop = new(PropImageIndex,sprite.anim);
	sprite.drawing:addProp(sprite.prop,0);
	ToolKit.setDebugName(sprite.anim , "AnimInt|sprite.anim");
	ToolKit.setDebugName(sprite.prop , "PropImageIndex|sprite.prop");
	self.sprites[seat] = sprite;
end

ExpressionAnim2.playSwf = function(self,seat,swfInfoPath,swfPinPath,x, y, w, h, align, playerNum)
    self:release();
    if swfInfoPath and swfPinPath then 
        local playerNum = playerNum or 4;   
        if not tonumber(seat) or seat <= 0 or seat > playerNum then
            return;
        end

        if self.coords and self.coords[seat] then 
            x = x or self.coords[seat][1];
            y = y or self.coords[seat][2];
        end

        local swf_info = require(swfInfoPath);
        local swf_pin = require(swfPinPath);
        local playNode = new(SwfPlayer,swf_info,swf_pin);       
        playNode:setAlign(align);
        self:addChild(playNode);
        local w,h = playNode:getSize();
        local rx,ry = x - w/2,y - h/2;
        playNode:setPos(rx,ry);
        
        playNode:play();
    end 
end

--public
ExpressionAnim2.release=function(self)
    for k,v in pairs(self.sprites) do 
        self:releaseSprite(k);
        self.sprites[k] = nil;
    end
    self.sprites = {};
    self:removeAllChildren();
end
