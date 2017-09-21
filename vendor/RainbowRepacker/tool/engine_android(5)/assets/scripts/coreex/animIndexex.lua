
local ctor =  AnimIndex.ctor;
AnimIndex.ctor = function(self, animType, startValue, endValue, duration, res, delay)
	ctor(self, animType, startValue + 1, endValue + 1, duration, res, delay); 
end