require("ui/button");
require("audioConfig");
Button.onClick = function(self, finger_action, x, y, drawing_id_first, drawing_id_current)
	if not self.m_enable then
		return;
	end
	
	if finger_action == kFingerDown then
	   self.m_showEnbaleFunc(self,false);
	   self.m_startX = x;
	   self.m_startY = y;
	elseif finger_action == kFingerMove then
		if not (self.m_responseType == kButtonUpInside and drawing_id_first ~= drawing_id_current) then
			self.m_showEnbaleFunc(self,false);
		else
			self.m_showEnbaleFunc(self,true);
		end
	elseif finger_action == kFingerUp then
		
		
		self.m_showEnbaleFunc(self,true);
		
		local responseCallback = function()

			if self:clickLimit() then
				return;
			end
			self.m_startX = self.m_startX or (x + 14);
			self.m_startY = self.m_startY or (y + 14);
			local disX = math.abs(self.m_startX - x);
			local disY = math.abs(self.m_startY - y);

			if disX > 30 or disY > 30 then
				return;
			end

			if self.m_eventCallback.func then
                self.m_eventCallback.func(self.m_eventCallback.obj,finger_action,x,y,
                	drawing_id_first,drawing_id_current,unpack(self.bindData));
            end	
		end

		kEffectPlayer:play(EffectsCommon.AudioButtonClick);

		if self.m_responseType == kButtonUpInside then
			if System.getPlatform() == kPlatformIOS then
				responseCallback();
			else
				if drawing_id_first == drawing_id_current then
					responseCallback();
				end
			end
	    elseif self.m_responseType == kButtonUpOutside then
	    	if drawing_id_first ~= drawing_id_current then
				responseCallback();
			end
		else
			responseCallback();
		end
	elseif finger_action==kFingerCancel then
		self.m_showEnbaleFunc(self,true);
	end
end

Button.clickLimit = function(self , intervalTime)
    intervalTime = intervalTime or 500;
    local nowTime = System.getBootTime();
    local diff = nowTime - (self.lastCickTime or 0); --这里正常情况下应该是正数，如果为负数，只能证明用户调整了时间
    if diff >= 0 and diff < intervalTime then
        return true;
    end
    self.lastCickTime = nowTime;
    return false;
end
Button.getEnable = function(self)
	-- body
	return self.m_enable;
end
Button.setOnClick = function(self, obj, func, responseType , ...)
    self.m_eventCallback.func = func;
	self.m_eventCallback.obj = obj;

	self.m_responseType = responseType or kButtonUpInside;

	self.bindData= {...};
end


Button.showEnableWithoutDisableImage = function(self, enable)
	if enable then
		Button.setColor(self, self.m_defaultCR or 255, self.m_defaultCG or 255, self.m_defaultCB or 255);
	else
		Button.setColor(self,128,128,128);
	end
end	

Button.setDefaultColor = function(self, r,g,b)
	-- body
	self.m_defaultCR = r;
	self.m_defaultCG = g;
	self.m_defaultCB = b;
end