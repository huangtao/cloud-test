require("core/stateMachine");

StateMachine.getNewState = function(self, state, ...)
	local nextStateIndex;
	for i,v in ipairs(self.m_states) do 
		if v.state == state then
			nextStateIndex = i;
			break;
		end
	end
	
	local nextState;
	if nextStateIndex then
		nextState = table.remove(self.m_states,nextStateIndex);
	else
		nextState = {};
		nextState.state = state;
		if StatesMap[state] and StatesMap[state][1] then
		require(StatesMap[state][1]);
		nextState.stateObj = new(_G[StatesMap[state][2]],...);
	end
	end
	
	return nextState,(not nextStateIndex);
end

--FIX ME
StateMachine.popState = function(self, style)
	if not StateMachine.canPop(self) then
		-- error("Error,no state in state stack\n");
		Log.v("Error,no state in state stack\n");
		return;
	end
	
	local lastState = table.remove(self.m_states,#self.m_states);
	StateMachine.switchState(self,false,false,lastState,true,style);
end

StateMachine.switchState = function(self, needLoadNewState, isNewStatePopup,
										lastState, needReleaseLastState,
										style)	

	self.m_isNewStatePopup = isNewStatePopup;

	self.m_lastState = lastState;
	self.m_releaseLastState = needReleaseLastState;
	self.m_style = style;

	StateMachine.pauseState(self,self.m_lastState);
	
	if needLoadNewState then
		self:loadAndRun();
	else
		StateMachine.run(self);
	end
end

StateMachine.loadAndRun = function(self)
	local stateObj = self.m_states[#self.m_states].stateObj;
	if stateObj:load() then
		stateObj:setStatus(StateStatus.Loaded);
		StateMachine.run(self);
	end
end

StateMachine.onSwitchEnd = function(self)
  	if self.m_lastState then
	    if self.m_releaseLastState then
	      StateMachine.cleanState(self,self.m_lastState);
	      TextureCache.instance():clean_unused()
	    elseif self.m_isNewStatePopup then

	    else
	      self.m_lastState.stateObj:stop();
	    end
 	end

	self.m_lastState = nil;
	self.m_releaseLastState = false;

	local newState = self.m_states[#self.m_states].stateObj;
	newState:resume();
end