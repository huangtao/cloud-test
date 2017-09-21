-- FlyToBagAnimation.lua
-- Author:Demon
-- Date:2016/3/22
-- Last modification:
-- Description:
-- Note:
local newObjectCaseForAnimation = require(ViewPath.."hall/newObjectCase/newObjectCaseForAnimation");

local _index = 0;
local function getIndex()
	_index = _index + 1;
	return _index;
end	

local hallLayerBaseWithName = require("hall/widget/hallLayerBaseWithName");
local FlyToBagAnimation = class(hallLayerBaseWithName,false);
FlyToBagAnimation.s_layerName = "case_flyToBag_animation";

FlyToBagAnimation.s_controls =
{
	Image_mask = getIndex(),
};



FlyToBagAnimation.ctor = function(self,p_data)	
 
	super(self,newObjectCaseForAnimation,nil,FlyToBagAnimation.s_layerName);

    self:setLevel(22);
	self:setFillParent(true, true);
    self:addToRoot();

    self.m_data = p_data;

    --默认图片
    
    self.m_objectImage = UIFactory.createImage(self.m_data.image or "");
    local _sizeX,_sizeY = self.m_objectImage:getSize();
     --屏幕中间的位置
    local screenX ,screenY = System.getLayoutWidth(),System.getLayoutHeight();
    self.m_middlePos = {x = (screenX - _sizeX)/2,y = (screenY - _sizeY)/2};

    --物品起始位置
    self.m_startPos = self.m_data.startPos;
    if table.isEmpty(self.m_startPos) then
        self.m_startPos = {x = self.m_middlePos.x,y = self.m_middlePos.y + 80};
    end

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

FlyToBagAnimation.dtor = function(self)	
	self:_cleanAnim();
end

-----------------------------------------------------------------------------------
--------------------------------------public---------------------------------------
-----------------------------------------------------------------------------------

--设置遮罩是否可见
FlyToBagAnimation.setMaskVisible = function(self,isVisible)
    self.m_Image_mask:setVisible(isVisible);
end

--指定父节点
FlyToBagAnimation.setRoot= function(self,p_root)
    self:setLevel(22);
	self:setFillParent(true, true);
    p_root:addChild(p_root);
end

--播放
FlyToBagAnimation.play = function(self)
    self:_objectFlyToCenter();
end	

--停止
FlyToBagAnimation.stop = function(self)
    self:close();
end	

-----------------------------------------------------------------------------------
--------------------------------------private--------------------------------------
-----------------------------------------------------------------------------------

--得到相关句柄
FlyToBagAnimation._getHandle = function(self)
    self.m_Image_mask = self:findViewById(self.s_controls.Image_mask);
end	

FlyToBagAnimation._init = function(self)
	--消息可穿透
    self:setTouchTransfer(true);
    self:setDragTransfer(true);
end

--物品飞向屏幕中央
FlyToBagAnimation._objectFlyToCenter = function(self)

   local p_time = 700;

   local scaleBig = function()
        local scaleTime = p_time;
        self.m_objectImage:addPropScale(3, kAnimNormal, scaleTime, 0,0.5,1,0.5,1,kCenterDrawing);
   end 

   local moveToCenter = function()

        local startX = self.m_startPos.x or self.m_middlePos.x;
        local startY = self.m_startPos.y or  self.m_middlePos.y + 80;

        local endX =  self.m_middlePos.x;
        local endY =  self.m_middlePos.y;

        self.m_objectImage:setPos(startX,startY);
        self.m_root:addChild(self.m_objectImage);

        local moveTime = p_time;

        --local objectMoveAnim = self.m_objectImage:addPropTranslate(1, kAnimNormal, moveTime, -1, 0, endX - startX, 0, endY - startY);
        local objectMoveAnim = self.m_objectImage:addPropTranslateWithEasing(1, kAnimNormal, 1000, 0,"easeInSine","easeInSine", 0,endX - startX,0,endY - startY);
        objectMoveAnim:setEvent(self.m_objectImage, function()
            self:removeProp(3);
            self:removeProp(1);
            self.m_objectImage:setPos(endX,endY);
            self:_objectFlyToBag();
            --self:close();
        end
        );
   end

   moveToCenter();
   scaleBig();
end

--物品飞向背包
FlyToBagAnimation._objectFlyToBag = function(self)
    local _delayTime = 500;
    local p_time = 500;
    
    local scaleSmall = function()
        local scaleTime = p_time;
        self.m_objectImage:addPropScale(4, kAnimNormal, scaleTime, _delayTime,1,0.1,1,0.1,kCenterDrawing);
    end 

    local moveToBag = function()
        local startX = System.getLayoutWidth()/2;
        local startY = System.getLayoutHeight()/2;
        local endX = self.m_endPos.x  or 0;
        local endY = self.m_endPos.y or 0;

        local moveTime = p_time;
        local _offsetX,_offsetY = 20,40
        --local objectMoveAnim = self.m_objectImage:addPropTranslate(999, kAnimNormal, moveTime, _delayTime, 0, endX - startX + _offsetX, 0, endY - startY + _offsetY);
        local objectMoveAnim = self.m_objectImage:addPropTranslateWithEasing(2, kAnimNormal, 2000, 0,"easeInSine","easeInSine", 0,1200 - 640 ,0,700 - 360 );
        --DrawingBase.addPropTranslateWithEasing = function(self, sequence, animType, duration, delay, easingFunctionX, easingFunctionY, bX, cX, bY, cY)
        objectMoveAnim:setEvent(self.m_objectImage, function()
                delete(self.m_objectImage);
            end
        );
    end

  
    scaleSmall();
    moveToBag();


    self:_cleanAnim();

    self.m_animForBag = new(AnimInt , kAnimNormal, 0, 1 ,1000, -1);
	self.m_animForBag:setDebugName("FlyToBagAnimation m_animForBag");
	self.m_animForBag:setEvent(self, function()
        self:_toPlaySwfAnim();
        self:_cleanAnim();
	end);
end

FlyToBagAnimation._addTail = function(self)
   --后续有时间加个拖尾效果。
end

FlyToBagAnimation._cleanAnim = function(self)
    if self.m_animForBag then
	    delete(self.m_animForBag);
	    self.m_animForBag = nil;
    end
end


--在大厅获得物品时曲线飞和相应的动画
FlyToBagAnimation._toPlaySwfAnim = function(self)
    local _delayTime = 0;

    require("swfTweenAnim/anim_package_swf_info");  
    require("swfTweenAnim/anim_package_swf_pin");

    local swfplayer = new(SwfPlayer,anim_package_swf_info);
    swfplayer:play(2,false,1,_delayTime);
    swfplayer:setPos(self.m_endPos.x,self.m_endPos.y);
    self.m_root:addChild(swfplayer);
    
    swfplayer:setCompleteEvent(self,self.onSwfAinmCallBack);
end

FlyToBagAnimation.onSwfAinmCallBack = function(self)
    self:close();
end

--------------------------------config and event---------------------------------

FlyToBagAnimation.s_controlConfig = 
{
	[FlyToBagAnimation.s_controls.Image_mask]         = {"Image_mask"},
};

return FlyToBagAnimation;
