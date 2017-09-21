require("gameBase/gameScene");


CommonScene = class(GameScene);

CommonScene.ctor = function(self, viewConfig, controller)

end

CommonScene.dtor = function(self)
    ImageCache.getInstance():cleanRef(self);
    self:__deleteDelayResumeSceneAnim();
end

CommonScene.resume = function(self)
    GameScene.resume(self);

    self:__deleteDelayResumeSceneAnim();
    self.m_delayResumeSceneAnim = AnimFactory.createAnimInt(kAnimNormal, 0, 1, 1, -1);
    self.m_delayResumeSceneAnim:setDebugName("CommonScene|self.m_delayResumeSceneAnim");
    self.m_delayResumeSceneAnim:setEvent(self, self.__onDelayResumeScene);
end

CommonScene.__onDelayResumeScene = function(self)
    self:__deleteDelayResumeSceneAnim();
end

CommonScene.__deleteDelayResumeSceneAnim = function(self)
    delete(self.m_delayResumeSceneAnim);
    self.m_delayResumeSceneAnim = nil;
end

CommonScene.canPopStateStack = function(self)
    if not self.m_controller then
        return false;
    end

    return self.m_controller:canPopStateStack();
end

CommonScene.findViewById = function(self, control)
    if self.m_controlsMap[control] ~= nil then
        return self.m_controlsMap[control] or nil;
    end

    -- local config = self.s_controlConfig[control];

    local config = nil;
    local curObj = self; 
    while curObj and curObj.s_controlConfig do
        config = curObj.s_controlConfig[control];
        if config then
            break;
        else
            curObj = curObj.super;
        end
    end

    if not config or #config < 1 then

        if control then
            self.m_controlsMap[control] = false;
        end

        return nil;
    end

    local itorNestValues = function(t)
        local index = {1};

        return function()
            local getValue = function(t,idx)
                local c = t;
                for i=1,#idx-1 do
                    c = c[ idx[i] ]; 
                end
                c = c[ idx[#idx] ];
                return c;
            end

            local value = getValue(t,index);
            while not value do
                table.remove(index,#index);
                if #index < 1 then
                    return nil;
                end
                index[#index] = index[#index] + 1;
                value = getValue(t,index);
            end

            while type(value) == "table" do
                index[#index+1] = 1;
                value = getValue(t,index);
            end

            index[#index] = index[#index] + 1;
            return value;
        end
    end
    
    local ctrl = self.m_root;
    for v in itorNestValues(config) do
        ctrl = ctrl:getChildByName(v);
        self.m_controlsMap[control] = ctrl;
        if not ctrl then
            self.m_controlsMap[control] = false;
            break;
        end
    end
    
    return self.m_controlsMap[control] or nil;
end

--@override
CommonScene.handleCmd = function(self, cmd, ...)
	local func = nil;
    local curObj = self;
    while curObj and curObj.s_cmdConfig do
        func = curObj.s_cmdConfig[cmd];
        if func then
            break;
        else
            curObj = curObj.super;
        end
    end

	if type(func) == "function" then
    	return func(self, ...);
    elseif type(func) == "string" then
        local funcSelf = nil;
        local curObj = self;
        while curObj do
            funcSelf = curObj[func];
            if funcSelf then
                break;
            else
                curObj = curObj.super;
            end
        end
        if funcSelf then
            return funcSelf(self,...);
        end
    end
	Log.w("Not such Scene cmd[", cmd, "] in current CommonScene");	
end