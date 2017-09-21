require("animation/animBase");
require("common/uiFactory");
require("common/animFactory");
require("particle/particleMoney");
local money_pin_map_map = require("qnFiles/qnPlist/hall/money_pin_map");

AnimDropMoneyPar = class(AnimBase);
AnimDropMoneyPar.imageSize = 13;
AnimDropMoneyPar.s_level = 16;
AnimDropMoneyPar.load = function()
	if not AnimDropMoneyPar.root then
		AnimDropMoneyPar.root = UIFactory.createNode();

		AnimDropMoneyPar.root:setSize(System.getScreenScaleWidth(), System.getScreenScaleHeight());
		AnimDropMoneyPar.root:addToRoot();
		AnimDropMoneyPar.root:setPos(0,0);
        AnimDropMoneyPar.root:setLevel(AnimDropMoneyPar.s_level);
		AnimDropMoneyPar.startAnim();
	end
end

--背景变换
AnimDropMoneyPar.startAnim = function()
	-- body
	AnimDropMoneyPar.parMoneyNode  = ParticleSystem.getInstance():create(money_pin_map_map,ParticleMoney,0,0,nil,kParticleTypeBlast,(AnimDropMoneyPar.coinNum or 50),{["h"] = System.getScreenHeight()/2,["w"] = System.getScreenWidth();["rotation"]=4;["scale"]=1;["maxIndex"]=7;});
	AnimDropMoneyPar.root:addChild(AnimDropMoneyPar.parMoneyNode);
	AnimDropMoneyPar.parMoneyNode:resume();
end


AnimDropMoneyPar.play = function(num)  
	Log.d("wanpg------AnimDropMoneyPar.play");
	AnimDropMoneyPar.coinNum = num or 50;
	AnimDropMoneyPar.stop();
	AnimDropMoneyPar.load();
    AnimDropMoneyPar.andSoundEffect();
end

AnimDropMoneyPar.andSoundEffect = function()
   kEffectPlayer:play(Effects.AudioGoldDrop);  --一秒后播放声音

   --[[ AnimDropMoneyPar.clearAnimPlayEffect();
    AnimDropMoneyPar.anim_PlayEffect = new(AnimInt , kAnimNormal, 0, 1 ,600, 0);
    AnimDropMoneyPar.anim_PlayEffect:setDebugName("AnimDropMoneyPar anim_PlayEffect");
    if AnimDropMoneyPar.anim_PlayEffect then
        AnimDropMoneyPar.anim_PlayEffect:setEvent(AnimDropMoneyPar,AnimDropMoneyPar.playEffect);
    end]]
end

AnimDropMoneyPar.playEffect = function()
	kEffectPlayer:play(Effects.AudioGoldDrop);  --一秒后播放声音
	AnimDropMoneyPar.clearAnimPlayEffect();
end

AnimDropMoneyPar.clearAnimPlayEffect = function()
	delete(AnimDropMoneyPar.anim_PlayEffect);
	AnimDropMoneyPar.anim_PlayEffect = nil;
end


AnimDropMoneyPar.stop = function()
    AnimDropMoneyPar.clearAnimPlayEffect();
	if AnimDropMoneyPar.root then
		delete(AnimDropMoneyPar.root);
	end
	AnimDropMoneyPar.root = nil;
end

AnimDropMoneyPar.release = function()
	AnimDropMoneyPar.stop();
end