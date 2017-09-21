
AnimRadial2 = class(AnimBase);

AnimRadial2.load = function(parent)
	if not AnimRadial2.root then
		local width, height = System.getScreenScaleWidth(), System.getScreenScaleHeight();
		AnimRadial2.root = UIFactory.createNode();
		AnimRadial2.root:setSize(width, height);
		
		local scale = width>height and width/800.0 or height/800.0;
		AnimRadial2.radial = UIFactory.createImage("games/common/animation/radial.png");
		AnimRadial2.radial:setSize(800 , 800);
		AnimRadial2.root:addChild(AnimRadial2.radial);
		local rw,rh = AnimRadial2.radial:getSize();
		AnimRadial2.radial:setSize(rw*scale, rh*scale);	
		AnimRadial2.radial:setAlign(kAlignCenter);	

		parent:addChild(AnimRadial2.root);
	end
end

AnimRadial2.play = function(parent)
	if not parent then return;end
	AnimRadial2.stop();
	AnimRadial2.load(parent);

	AnimRadial2.root:setVisible(true);
	AnimRadial2.startRotate();
end

AnimRadial2.stop = function()
	AnimRadial2.stopRotate();
	if AnimRadial2.root then
		delete(AnimRadial2.root);
		AnimRadial2.root=nil;
	end
end

AnimRadial2.release = function()
	AnimRadial2.stop();
end

AnimRadial2.startRotate = function()
	AnimRadial2.animRotate = AnimFactory.createAnimDouble(kAnimRepeat, 0, 360, 3600, -1);
	AnimRadial2.animRotate:setDebugName("AnimDouble|AnimRadial2.animRotate");
	AnimRadial2.propRotate = AnimFactory.createRotate(AnimRadial2.animRotate, kCenterDrawing);
	AnimRadial2.radial:addProp(AnimRadial2.propRotate, 1);
end

AnimRadial2.stopRotate = function()
	if AnimRadial2.animRotate then
		AnimRadial2.radial:removeProp(1);
		delete(AnimRadial2.propRotate);
		AnimRadial2.propRotate = nil;
		delete(AnimRadial2.animRotate);
		AnimRadial2.animRotate = nil;
	end
end
