-- AinmBackpack.lua
-- Author:Demon
-- Date:2016/3/22
-- Last modification:
-- Description:
-- Note:
local newObjectCaseForAnimation = require(ViewPath.."hall/newObjectCase/newObjectCaseForAnimation");
local easing = require('libEffect.easing');

local _index = 0;
local function getIndex()
	_index = _index + 1;
	return _index;
end	

local hallLayerBaseWithName = require("hall/widget/hallLayerBaseWithName");
local AinmBackpack = class(hallLayerBaseWithName,false);
AinmBackpack.s_layerName = "case_flyToBag_animation";

AinmBackpack.s_controls =
{
	Image_mask = getIndex(),
};



AinmBackpack.ctor = function(self,p_data)	
                                  --p_data = {image = "",startPos = {x = 0,y = 0 },endPos = {x = 0,y = 0 }}
	super(self,newObjectCaseForAnimation,nil,AinmBackpack.s_layerName);

    self:setLevel(201);
	self:setFillParent(true, true);
    self:addToRoot();
    self.m_data = p_data;

    --默认图片
    self.m_objectImage = UIFactory.createImage(self.m_data.image or "");

    if self.m_objectImage == nil or self.m_objectImage == "" then
        self:close();
        return;
    end

    local _sizeX,_sizeY = self.m_objectImage:getSize();
     --屏幕中间的位置
    local screenX ,screenY = System.getLayoutWidth(),System.getLayoutHeight();
    self.m_middlePos = {x = (screenX - _sizeX)/2,y = (screenY - _sizeY)/2};

    --物品起始位置
    self.m_startPos = self.m_data.startPos;
    if table.isEmpty(self.m_startPos) then
        self.m_startPos = {x = self.m_middlePos.x,y = self.m_middlePos.y + 80};
    end

    --飞行模式
    self.m_mode = 1; --默认为1，直接由物品处飞往背包。。2，先飞到屏幕中央再飞到背包。

    --结束的位置，默认是背包的位置
    self.m_endPos = self.m_data.endPos;
    if table.isEmpty(self.m_endPos) then
        require("hall/backpack/data/backpackDataInterface")
        local tmpPos = BackpackDataInterface.getInstance():getBagPos();
        self.m_endPos = {x = tmpPos.x + 1,y = tmpPos.y - 17 };
    end

    self.m_animForBag = nil;

    self:_getHandle();
	self:_init();
end

AinmBackpack.dtor = function(self)	
	self:_cleanAnim();
    delete(self.m_animToBag);
end

-----------------------------------------------------------------------------------
--------------------------------------public---------------------------------------
-----------------------------------------------------------------------------------
--设置模式
AinmBackpack.setMaskVisible = function(self,p_mode)
    if tonumber(p_mode) and (tonumber(p_mode) == 1 or tonumber(p_mode) == 2) then
        self.m_mode = p_mode;
    end
end

--设置遮罩是否可见
AinmBackpack.setMaskVisible = function(self,isVisible)
    self.m_Image_mask:setVisible(isVisible);
end

--指定父节点
AinmBackpack.setRoot= function(self,p_root)
    self:setLevel(22);
	self:setFillParent(true, true);
    p_root:addChild(p_root);
end

--播放
AinmBackpack.play = function(self)
    if self.m_mode == 1 then
        self.m_middlePos = self.m_startPos;
        self.m_objectImage:setPos(self.m_startPos.x,self.m_startPos.y);
        self.m_root:addChild(self.m_objectImage);
        self:_objectFlyToBag(0,800);
    else
        self:_objectFlyToCenter();
    end
    
end	

--停止
AinmBackpack.stop = function(self)
    self:close();
end	

-----------------------------------------------------------------------------------
--------------------------------------private--------------------------------------
-----------------------------------------------------------------------------------

--得到相关句柄
AinmBackpack._getHandle = function(self)
    self.m_Image_mask = self:findViewById(self.s_controls.Image_mask);
end	

AinmBackpack._init = function(self)
	--消息可穿透
    self:setTouchTransfer(true);
    self:setDragTransfer(true);
    --self:setMaskVisible(false);
end

--物品飞向屏幕中央
AinmBackpack._objectFlyToCenter = function(self)

   local p_time = 300;

   local scaleBig = function()

        local scaleTime = p_time + 1000;
        local objectScaleAnim = self.m_objectImage:addPropScale(3, kAnimNormal, scaleTime, 0,0.5,1,0.5,1,kCenterDrawing);
         objectScaleAnim:setEvent(self.m_objectImage, function()
            self.m_root:removeChild(self.m_objectImage,true);
            self.m_objectImage = UIFactory.createImage(self.m_data.image or "");
            self.m_objectImage:setPos(self.m_middlePos.x,self.m_middlePos.y);
            self.m_objectImage:setLevel(10);
            self.m_root:addChild(self.m_objectImage);
            self:removeProp(3);
            self:removeProp(1);
            self:_objectFlyToBag();
            --self:close();
        end
        );
   end 

   local moveToCenter = function()

        local startX = self.m_startPos.x or self.m_middlePos.x;
        local startY = self.m_startPos.y or  self.m_middlePos.y + 80;

        self.m_objectImage:setPos(startX,startY);
        self.m_root:addChild(self.m_objectImage);

        local endX =  self.m_middlePos.x;
        local endY =  self.m_middlePos.y;
        local moveTime = p_time;

        --local objectMoveAnim = self.m_objectImage:addPropTranslate(1, kAnimNormal, moveTime, -1, 0, endX - startX, 0, endY - startY);
        local objectMoveAnim = self.m_objectImage:addPropTranslateWithEasing(1, kAnimNormal, moveTime, 0,"easeInSine","easeInSine", 0,endX - startX,0,endY - startY);
       
   end

   moveToCenter();
   scaleBig();

end

--物品飞向背包
AinmBackpack._objectFlyToBag = function(self,p_delay,p_duration)
    
    local _image = self.m_objectImage;


    local _delay = p_delay or 1000;
    local _duration = p_duration or 500;
    local _startX = 0;
    local _startY = 0;
    local _endX = self.m_endPos.x - self.m_middlePos.x + 5;
    local _endY = self.m_endPos.y - self.m_middlePos.y + 10;
    
    local _startScale = 0;
    local _endScale = 1;

    local _interval = 3;

    local _count = 0;
    local _countInterval = 0;

    local _arrayX = easing.getEaseArray("easeInQuad", _duration, _startX, _endX);
    local _arrayY = easing.getEaseArray("easeInCubic", _duration, _startY, _endY);
    local _arrayScale = easing.getEaseArray("easeOutExpo", _duration, _startScale, _endScale);

    local _imageWidth,_imageHeight = _image:getSize();

    delete(self.m_animToBag);
    self.m_animToBag = new(AnimInt, kAnimRepeat, 0, 1, 1, _delay);
    self.m_animToBag:setDebugName("AinmBackpack");
    self.m_animToBag:setEvent(nil, function()
        _count = _count + 1;
        if _count > #_arrayX then
            --删除动态值句柄并返回
            if self.m_animToBag then
	            delete(self.m_animToBag);
	            self.m_animToBag = nil;
            end
            return;
        end
        
        --设置位置
        _image:setVisible(true);
        _image:setPos(_arrayX[_count] + self.m_middlePos.x,_arrayY[_count] + self.m_middlePos.y); 

        --设置缩放
        local _reverseOrder = #_arrayScale - _count + 1;
        _image:setSize(_imageWidth*_arrayScale[_reverseOrder],_imageWidth*_arrayScale[_reverseOrder]);

        --添加尾影
        _countInterval = _countInterval + 1;
        if _countInterval > _interval then
            _countInterval = 0;
            
            local _tailImage = UIFactory.createImage(self.m_data.image or "");
            _tailImage:setLevel(2);
            self.m_root:addChild(_tailImage);
            _tailImage:setPos(_arrayX[_count] + self.m_middlePos.x,_arrayY[_count] + self.m_middlePos.y); 
            _tailImage:setSize(_imageWidth*_arrayScale[_reverseOrder],_imageWidth*_arrayScale[_reverseOrder]);
            local animTemp = _tailImage:addPropTransparency(2, kAnimNormal, 200, 0, 0.3, 0.0);
            animTemp:setDebugName("AinmBackpack|animTemp".._count);
	        animTemp:setEvent(nil, function()
                --self.m_root:remove(animTemp,true);
            end);
        end
    end)

    self:_cleanAnim();

    self.m_animForBag = new(AnimInt , kAnimNormal, 0, 1 ,100, -1);
	self.m_animForBag:setDebugName("FlyToBagAnimation m_animForBag");
	self.m_animForBag:setEvent(self, function()
        self:_toPlaySwfAnim();
        self:_cleanAnim();
	end);
  
end

AinmBackpack._addTail = function(self)
   --后续有时间加个拖尾效果。
end

AinmBackpack._cleanAnim = function(self)
    if self.m_animForBag then
	    delete(self.m_animForBag);
	    self.m_animForBag = nil;
    end
    
end


--在大厅获得物品时曲线飞和相应的动画
AinmBackpack._toPlaySwfAnim = function(self)
    local _delayTime = 0;

    require("swfTweenAnim/anim_package_swf_info");  
    require("swfTweenAnim/anim_package_swf_pin");

    local swfplayer = new(SwfPlayer,anim_package_swf_info);
    swfplayer:play(2,false,1,_delayTime);
    swfplayer:setPos(self.m_endPos.x - 20,self.m_endPos.y - 18);
    self.m_root:addChild(swfplayer);
    
    swfplayer:setCompleteEvent(self,self.onSwfAinmCallBack);
end

AinmBackpack.onSwfAinmCallBack = function(self)
    self:close();
end

--------------------------------config and event---------------------------------

AinmBackpack.s_controlConfig = 
{
	[AinmBackpack.s_controls.Image_mask]         = {"Image_mask"},
};

return AinmBackpack;

