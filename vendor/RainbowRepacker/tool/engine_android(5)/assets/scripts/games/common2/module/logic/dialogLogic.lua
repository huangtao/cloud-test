
--[[
	管理弹框
]]

DialogLogic = class();


DialogLogic.Delegate = {
};

DialogLogic.getInstance = function()
	if not DialogLogic.s_instance then
		DialogLogic.s_instance = new(DialogLogic);
	end
	return DialogLogic.s_instance;
end

DialogLogic.releaseInstance = function()
	delete(DialogLogic.s_instance);
	DialogLogic.s_instance = nil;
end

DialogLogic.ctor = function(self)
    self.m_dialogStack = {};
end

DialogLogic.dtor = function(self)
    self.m_stateStack = {};
end

DialogLogic.getStackNum = function(self)
    return  #self.m_dialogStack;
end

-- 注册监听
DialogLogic.pushDialogStack = function(self, obj, func)
    if not self.m_dialogStack then
        return;
    end    
    local t = {};
    t["obj"] = obj;
    t["func"] = func;
    self.m_dialogStack[#self.m_dialogStack+1] = t;
end

-- 释放监听
DialogLogic.popDialogStack = function(self)
    if not self.m_dialogStack then
        return;
    end    
    if #self.m_dialogStack > 0 then
        return table.remove(self.m_dialogStack,#self.m_dialogStack);
    else
        return nil;
    end
end

-- 关闭弹框
DialogLogic.popDialog = function(self, ...)
    local lastDialogCallback = self:popDialogStack();
    local lastDialogCbFunc = lastDialogCallback and lastDialogCallback["func"];
    if lastDialogCbFunc then
        lastDialogCbFunc(lastDialogCallback["obj"],...);
        return true;
    else
        return false;
    end
end