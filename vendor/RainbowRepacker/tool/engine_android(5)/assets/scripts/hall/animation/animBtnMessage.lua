require("animation/animBase");
require("common/uiFactory");

AnimBtnMessage = class(AnimBase);

AnimBtnMessage.load = function (view)
	AnimBtnMessage.root = view;
end


AnimBtnMessage.play = function (view)
	if not view  then 
        return; 
    end
   
	AnimBtnMessage.stop();
	AnimBtnMessage.load(view);
    AnimBtnMessage.move();
end

AnimBtnMessage.move = function()
    local _, animMove = AnimBtnMessage.root:addPropTranslate(1, kAnimLoop, 800, 0, nil, nil, 0,10);--上移
    animMove:setDebugName("PropTranslate|AnimBtnMessage.move");  
end

AnimBtnMessage.stop = function()
    if AnimBtnMessage.root and not AnimBtnMessage.root:checkAddProp(1) then	
        AnimBtnMessage.root:removeProp(1);
    end
end

AnimBtnMessage.release = function()
	AnimBtnMessage.stop();
end