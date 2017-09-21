-- 窗口弹框管理类
-- 用于按物理返回键时，隐藏弹框
WindowManage = class();

WindowManage.getInstance = function (  )
    -- body
    if not WindowManage.s_instance then 
        WindowManage.s_instance = new(WindowManage);    
    end
    return WindowManage.s_instance;
end

WindowManage.ctor = function ( self )
    -- body
    self.m_windows = {};
end
-- 将窗口推入栈中
-- window : 窗体弹框
-- tag ：窗口标识
-- isDelete ：弹出时，是否删除，不删除，则隐藏弹框
-- callbakObj ：关闭回调对象
-- callbackFunc ：关闭后回调方法
WindowManage.push = function ( self, window, tag, isDelete, callbackObj, callbackFunc )
    -- body
    local isExist, index = self:isExistWindow(tag); 
    if isExist and index > 0 then 
        table.remove(self.m_windows, index);
    end
    
    local item = new(WindowItem, window);
    item:setCallback(callbackObj, callbackFunc);
    item:setTag(tag);
    item:setIsDelete(isDelete);
    
    table.insert(self.m_windows, item);
end
-- 将窗口移除
-- tag ：窗口标识
WindowManage.pop = function ( self, tag )
    -- body
    local result = false;
    local isExist, index = self:isExistWindow(tag); 
    if isExist and index > 0 then 
        self.m_windows[index]:hide();
        table.remove(self.m_windows, index);
        result = true;
	elseif #self.m_windows > 0 then
		self.m_windows[#self.m_windows]:hide();
		table.remove(self.m_windows, #self.m_windows);
		result = true;
	else
		result = false;
    end
    return result;
end

WindowManage.isExistWindow = function ( self, tag )
    -- body
    local isExist = false;
    local index = 0;
    if tag ~= nil then 
        for k, v in pairs(self.m_windows) do 
            if v and v:getTag() == tag then
                isExist = true;
                index = k; 
                break;
            end    
        end
    end
    return isExist, index;
end



WindowItem = class();

WindowItem.ctor = function ( self, window )
    -- body
    self.m_callback = {};
    self.m_tag = nil;
    self.m_isDelete = false;
    self.m_window = window;
end

WindowItem.dtor = function ( self )
    -- body
end

WindowItem.hide = function ( self, isForceDelete )
    -- body
    self:executeCallback();
    if isForceDelete or self.m_isDelete then 
        delete(self.m_window)
        self.m_window = nil;
    else
        self.m_window:setVisible(false);
    end
end

WindowItem.executeCallback = function ( self )
    -- body
    if self.m_callback then
        local obj = self.m_callback.obj;
        local func = self.m_callback.func; 
        if obj and func then 
            func(obj);
        end    
    end
end

WindowItem.setTag = function ( self, tag )
    -- body
    self.m_tag = tag;
end

WindowItem.getTag = function ( self )
    -- body
    return self.m_tag;
end

WindowItem.setCallback = function ( self, callbackObj, callbackFunc )
    -- body
    self.m_callback.obj = callbackObj;
    self.m_callback.func = callbackFunc;
end

WindowItem.setWindow = function ( self, window )
    -- body
    self.m_window = window;
end

WindowItem.setIsDelete = function ( self, isDelete )
    -- body
    self.m_isDelete = isDelete;
end