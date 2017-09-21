require("animation/animBase");
require("common/animFactory");

AnimScale = class(AnimBase);

AnimScale.load = function ( view )
	AnimScale.root = view;
end

-- view: 选择要缩放的view
-- isSmall: true 表示缩小
--          false 表示放大
AnimScale.play = function ( view , isSmall)
	if not view then return; end
	AnimScale.stop();
	AnimScale.load(view);

	AnimScale.root:setVisible(true);

	local scale=0.9;
	if isSmall then
 		AnimScale.animSmallIndex = AnimScale.root:addPropScale(0, kAnimNormal, 100, 0, 
 			1, scale, 1, scale, kCenterDrawing);
 		AnimScale.root:setDebugNameByPropAndAnim(0,"AnimScale.root");
 	else
 		AnimScale.animBigIndex = AnimScale.root:addPropScale(1, kAnimNormal, 100, 0, 
 			scale, 1, scale, 1, kCenterDrawing);
 		AnimScale.root:setDebugNameByPropAndAnim(1,"AnimScale.root");
 	end
 	if AnimScale.animBigIndex then
 		AnimScale.animBigIndex:setDebugName("AnimScale.animBigIndex");
 		AnimScale.animBigIndex:setEvent(nil, AnimScale.onTimer);
 	end
 	if AnimScale.animSmallIndex then
 		AnimScale.animSmallIndex:setDebugName("AnimScale.animSmallIndex");
 	end
    return AnimScale.root;
end

AnimScale.onTimer = function()
	AnimScale.stop();
end

AnimScale.stop = function()
	if AnimScale.root then
		if not AnimScale.root:checkAddProp(0) then 
       		AnimScale.root:removeProp(0);  -- 移除属性
       	end 
       	if not AnimScale.root:checkAddProp(1) then 
       		AnimScale.root:removeProp(1);  -- 移除属性
       	end
	end
	AnimScale.animSmallIndex=nil;
	AnimScale.animBigIndex=nil;
end

AnimScale.release = function()
	AnimScale.stop();
end