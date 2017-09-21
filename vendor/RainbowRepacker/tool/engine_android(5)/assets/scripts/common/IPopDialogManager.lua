
--[[
    弹出弹框管理类，此类管理的弹框是哪些各个界面都会显示的弹框信息，
    如支付到账弹框，邀请好友弹框
]]

IPopDialogManager = class();

IPopDialogManager.getInstance = function()
    if not IPopDialogManager.s_instance then
        IPopDialogManager.s_instance = new(IPopDialogManager);
    end

    return IPopDialogManager.s_instance;
end


IPopDialogManager.ctor = function(self)
    self.m_dialogStack = {};
end

--@brief 添加弹出弹框，当用户按返回键时，会将弹框隐藏
--@WARNING 这里的弹框是不依赖于某个场景的 ！！！！
--@param level: 弹框的层次等级
--@param func: 当响应返回键时，回调事件的函数
--@param obj: 当响应返回键时，回调事件的对象
IPopDialogManager.addPopDialog = function(self, dialog, level, func, obj)
    if dialog then
        local item = {
            ["dialog"] = dialog;
            ["level"] = number.valueOf(level, 0);
            ["obj"] = obj;
            ["func"] = func;
        };

        table.insert(self.m_dialogStack,1,item);

        --从大->小
        table.sort(self.m_dialogStack, function(a, b)
            if a and b then
                return a.level > b.level;
            end
        end);
    end
end

--@brief 移除弹出弹框
--@note 弹框自己应该在销毁时，将自身从对栈中进行移除，否则会出现问题
IPopDialogManager.removePopDialog = function(self, dialog)
    for i = #self.m_dialogStack, 1, -1 do 
        local v = self.m_dialogStack[i];
        if v.dialog == dialog then
            table.remove(self.m_dialogStack, i);
        end     
    end
end

--@brief 响应返回键
--@return 是否响应返回键
--@note 此方法外部请不要调用，会在commonState里面统一调用
IPopDialogManager.onBackPressCall = function(self)
    if table.isEmpty(self.m_dialogStack) then
        return false;
    end

    local item = table.remove(self.m_dialogStack, 1); --弹出层级最高的弹框
    local dialog = item.dialog;
    local obj = item.obj;
    local func = item.func;

    if func then
        func(obj);
    elseif dialog and dialog["hide"] then
        dialog:hide();
    end

    return true;
end