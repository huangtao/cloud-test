
EnvelopeRefuseAnim = class(AnimBase);

EnvelopeRefuseAnim.load = function()
	if not EnvelopeRefuseAnim.root then
		EnvelopeRefuseAnim.root = UIFactory.createNode();
		EnvelopeRefuseAnim.root:setFillParent(true,true);
		EnvelopeRefuseAnim.root:addToRoot();
		EnvelopeRefuseAnim.root:setVisible(false);

		EnvelopeRefuseAnim.envelope = UIFactory.createImage("games/common/animation/messagefly/envelope_refuse.png");
		EnvelopeRefuseAnim.root:addChild(EnvelopeRefuseAnim.envelope);
		EnvelopeRefuseAnim.envelope:setVisible(false);
	end 
end

EnvelopeRefuseAnim.play = function(startPoint,endPoint)
	EnvelopeRefuseAnim.stop();
	EnvelopeRefuseAnim.load();

	startPoint = table.verify(startPoint);
	endPoint = table.verify(endPoint);

	local dy =  endPoint.y -  startPoint.y;
  	local dx = endPoint.x - startPoint.x;

  	EnvelopeRefuseAnim.data = {startPoint = startPoint,endPoint = endPoint,dx = dx,dy = dy};

  	local w,h = EnvelopeRefuseAnim.envelope:getSize();
	EnvelopeRefuseAnim.envelope:setPos(startPoint.x-w/2,startPoint.y-h/2);

	EnvelopeRefuseAnim.startEnvelopeAppear();
	return EnvelopeRefuseAnim.root;
end

EnvelopeRefuseAnim.stop = function()
	if EnvelopeRefuseAnim.root then 
		EnvelopeRefuseAnim.root:setVisible(false);
	end 

	if EnvelopeRefuseAnim.envelope then 
		EnvelopeRefuseAnim.envelope:setVisible(false);

		EnvelopeRefuseAnim.envelope:removeProp(EnvelopeRefuseAnim.envelope.m_drawingID);
		EnvelopeRefuseAnim.envelope:removeProp(EnvelopeRefuseAnim.envelope.m_drawingID+1);
		EnvelopeRefuseAnim.envelope:removeProp(EnvelopeRefuseAnim.envelope.m_drawingID+2);
		EnvelopeRefuseAnim.envelope:removeProp(EnvelopeRefuseAnim.envelope.m_drawingID+3);
		EnvelopeRefuseAnim.envelope:removeProp(EnvelopeRefuseAnim.envelope.m_drawingID+4);
	end 

	delete(EnvelopeRefuseAnim.heart);
	EnvelopeRefuseAnim.heart = nil;
end

EnvelopeRefuseAnim.release = function()
	EnvelopeRefuseAnim.stop();

	delete(EnvelopeRefuseAnim.root);
	EnvelopeRefuseAnim.root = nil;
end

EnvelopeRefuseAnim.startEnvelopeAppear = function()
	EnvelopeRefuseAnim.root:setVisible(true);
	EnvelopeRefuseAnim.envelope:setVisible(true);
	
	EnvelopeRefuseAnim.envelope:addPropTransparency(EnvelopeRefuseAnim.envelope.m_drawingID, kAnimNormal, 300, 0, 0, 1);

	local _,h = EnvelopeRefuseAnim.envelope:getSize();
	local anim = EnvelopeRefuseAnim.envelope:addPropTranslate(EnvelopeRefuseAnim.envelope.m_drawingID+1, kAnimNormal, 300, 0, 0, 0, 0, -h);
	if anim then 
		anim:setEvent(nil,function()
			EnvelopeRefuseAnim.startEnvelopeTranslate();
		end);
	end 
end

EnvelopeRefuseAnim.startEnvelopeTranslate = function()
	local anim = EnvelopeRefuseAnim.envelope:addPropTranslate(EnvelopeRefuseAnim.envelope.m_drawingID+2, kAnimNormal,1500,10,0,EnvelopeRefuseAnim.data.dx,0,EnvelopeRefuseAnim.data.dy);
	anim:setEvent(nil,function()
		EnvelopeRefuseAnim.startEnvelopeDisappear();
		EnvelopeRefuseAnim.startPlayHeartBreak();
	end);
end

EnvelopeRefuseAnim.startPlayHeartBreak = function()	
	if not EnvelopeRefuseAnim.heart then 
		local envelope_refuse_heart_break_swf_pin = require("games/common2/animation/envelope_refuse_heart_break_swf_pin");
		local envelope_refuse_heart_break_swf_info = require("games/common2/animation/envelope_refuse_heart_break_swf_info");
		EnvelopeRefuseAnim.heart = new(SwfPlayer,envelope_refuse_heart_break_swf_info,envelope_refuse_heart_break_swf_pin);
		local w,h = EnvelopeRefuseAnim.heart:getSize();
		local _,h2 = EnvelopeRefuseAnim.envelope:getSize();
		local endPoint = table.verify(EnvelopeRefuseAnim.data.endPoint);
		EnvelopeRefuseAnim.heart:setPos(endPoint.x-w/2,endPoint.y-h/2-1.5*h2);

		EnvelopeRefuseAnim.root:addChild(EnvelopeRefuseAnim.heart);
		EnvelopeRefuseAnim.heart:setCompleteEvent(EnvelopeRefuseAnim,EnvelopeRefuseAnim.release);
		EnvelopeRefuseAnim.heart:play();
	end 
end

EnvelopeRefuseAnim.startEnvelopeDisappear = function()
	local _,h = EnvelopeRefuseAnim.envelope:getSize();
	EnvelopeRefuseAnim.envelope:addPropTransparency(EnvelopeRefuseAnim.envelope.m_drawingID+3, kAnimNormal, 150, 10, 1, 0);
	local anim = EnvelopeRefuseAnim.envelope:addPropTranslate(EnvelopeRefuseAnim.envelope.m_drawingID+4, kAnimNormal, 150,10, 0, 0, 0, h);
	anim:setEvent(nil,function()
		EnvelopeRefuseAnim.envelope:setVisible(false);
	end);
end