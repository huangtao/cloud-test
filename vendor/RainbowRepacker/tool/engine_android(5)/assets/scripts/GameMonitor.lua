---
--lua内存泄漏检测工具
--@module GameMonitor
--@author myc


--监控间隔配置（单位：秒） 
local print = print_string; 
local MonitorConfig =   
{  
    --内存泄露监控间隔  
    memLeaksInterval    = 1,  
}  
  
local GameMonitor = class();  
 
function GameMonitor:ctor()  
   --内存泄露弱引用表  
    self.__memLeakTbl   = {}  
   setmetatable(self.__memLeakTbl, {__mode='kv'})  
    --内存泄露监控器  
    self.__memLeakMonitor   = nil  
end  
 
---开始检测
--@usage g_GameMonitor:start();  
function GameMonitor:start()  
    self.__memLeakMonitor = self:__memLeaksMonitoring()  
end  
  
function GameMonitor:update(dt)  
    if self.__memLeakMonitor then
        self.__memLeakMonitor(dt)  
    end
end  
  
  
---------------------------------------------  
--公有方法  
--功能：       增加一个受监视的表  
--参数tblName:    该表的名字（字符串类型），名字的用途是方便人来记忆，字符串值总比OX002D0EFF之类的好记  
--参数tbl:        该表的引用  
--返回：       无  
--增加一个受监视的表 
--@usage g_GameMonitor:addTblToUnderMemLeakMonitor("test",textaaa);
function GameMonitor:addTblToUnderMemLeakMonitor(tblName, tbl)  
    if not self.__memLeakMonitor then
        return;
    end
    assert('string' == type(tblName), "Invalid parameters")  
    --必须以名字+地址的方式作为键值  
    --内存泄露经常是一句代码多次分配出内存而忘了回收，因此tblName经常是相同的  
    local name = string.format("%s@%s", tblName, tostring(tbl))  
    if nil == self.__memLeakTbl[name] then  
        self.__memLeakTbl[name] = tbl  
    end  
end  
  
--内存泄露监控逻辑  
function GameMonitor:__memLeaksMonitoring()  
    local monitorTime   = MonitorConfig.memLeaksInterval  
    local interval      = MonitorConfig.memLeaksInterval  
    local str           = nil  
  
    return function(dt)  
        interval = interval + dt  
        if interval >= monitorTime then  
            interval = interval - monitorTime  
            --强制性调用gc  
            collectgarbage("collect")  
            collectgarbage("collect")
            local flag = false;  
            --打印当前内存泄露监控表中依然存在（没有被释放）的对象信息  
            str = "memory leak monitoring,rightnow these tables is still valid:"  
            for k, v in pairs(self.__memLeakTbl) do  
                str = str..string.format("  \n%s = %s", tostring(k), tostring(v))  
                flag = true;
            end  
            str = str.."\nDoes it meet your expectation?"  
            if flag then
                -- print(str);
                Log.d("GameMonitor",str);
            else
                Log.d("GameMonitor","no table still valid");
            end
       end  
    end  
end

return GameMonitor;