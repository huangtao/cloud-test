local AnimMatchStartCountdown = class(AnimBase);

AnimMatchStartCountdown.load = function ()
	if not AnimMatchStartCountdown.root then 
		AnimMatchStartCountdown.root = UIFactory.createImage("isolater/bg_shiled.png");
		AnimMatchStartCountdown.root:setFillParent(true,true);
		AnimMatchStartCountdown.root:addToRoot();
		AnimMatchStartCountdown.root:setVisible(false);
	end 
end

AnimMatchStartCountdown.play = function ()
	AnimMatchStartCountdown.stop(); 
	AnimMatchStartCountdown.load();

	local match_start_countdown_swf_info = require("games/common2/match/animation/match_start_countdown_swf_info");
	local match_start_countdown_swf_pin = require("games/common2/match/animation/match_start_countdown_swf_pin");
	AnimMatchStartCountdown.countdown = new(SwfPlayer,match_start_countdown_swf_info,match_start_countdown_swf_pin);
	AnimMatchStartCountdown.countdown:setAlign(kAlignCenter);
	AnimMatchStartCountdown.countdown:setPos(0,0);
	AnimMatchStartCountdown.countdown:setCompleteEvent(AnimMatchStartCountdown,AnimMatchStartCountdown.release);
	AnimMatchStartCountdown.countdown:play();
	AnimMatchStartCountdown.root:addChild(AnimMatchStartCountdown.countdown);

	AnimMatchStartCountdown.root:setVisible(true);

	return AnimMatchStartCountdown.root;
end

AnimMatchStartCountdown.stop = function ()
	if AnimMatchStartCountdown.root then 
		AnimMatchStartCountdown.root:setVisible(false);
	end 

	if AnimMatchStartCountdown.countdown then
		delete(AnimMatchStartCountdown.countdown);
		AnimMatchStartCountdown.countdown = nil;
	end
end

AnimMatchStartCountdown.release = function ()
	AnimMatchStartCountdown:stop();

	delete(AnimMatchStartCountdown.root);
	AnimMatchStartCountdown.root = nil;
end

return AnimMatchStartCountdown;