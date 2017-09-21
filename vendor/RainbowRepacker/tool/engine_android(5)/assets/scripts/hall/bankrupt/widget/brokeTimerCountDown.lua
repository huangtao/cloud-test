-- file: 'BrokeTimerCountDown.lua'
-- Description: 倒计时 动画 ; 
-- 接口说明：
-- play      "播放"提示 动画.(允许多次调用)
-- reset     "隐藏"提示 动画.(允许多次调用 , 如果播放期间隐藏,则附加执行中断动画)
-- release "删除"相关资源

-- 可能的调用情景：
-- 动画模式；
-- (1) 播放一次(调play) -> (调release)
-- (2) 播放和隐藏多次(在同一请求页面时播放动画)  (模式：play->reset->play->reset ... ) -> (调release)
-- (3) 播放和隐藏多次但中途直接调release(在同一请求页面时播放动画)(模式：play->reset->play ... ->release)

-- 其他要求：
-- 调用例子 BrokeTimerCountDown.play(drawingText);

require("core/anim");
require("animation/animBase");
require("util/log")

BrokeTimerCountDown = class(AnimBase);
-- 动画总时常

BrokeTimerCountDown.countStart = 0;
BrokeTimerCountDown.s_countMax = 0;
BrokeTimerCountDown.countEnd = 0;

BrokeTimerCountDown.msTimer = 1000; 
BrokeTimerCountDown.loaded=false;


BrokeTimerCountDown.type_going=1;
BrokeTimerCountDown.type_stop=2;

BrokeTimerCountDown.interval=1;
--[[
   public
   [METHOD] getCountStart
   [ACTION] 
   Parameters:nil
]]

BrokeTimerCountDown.getCountStart = function()
  return BrokeTimerCountDown.countStart;
end

--[[
   public
   [METHOD] play
   [ACTION] BrokeTimerCountDown 动画 入口
   Parameters:
              startTime -- 开始时间
              endTime   -- 结束时间
]]

BrokeTimerCountDown.play = function(startTime , endTime , obj,objCallBack,speed,interval)
    if not obj or not objCallBack or not number.isNum(startTime) or not number.isNum(endTime) then
      return;
    end
    BrokeTimerCountDown.obj = obj;
    BrokeTimerCountDown.objCallBack = objCallBack;

    if startTime<= endTime then
        objCallBack(obj, BrokeTimerCountDown.type_stop, endTime);
        return;
    end
    BrokeTimerCountDown.interval= interval or 1;
    BrokeTimerCountDown.msTimer = speed or 1000;
    Log.v("---------BrokeTimerCountDown.play ----------",BrokeTimerCountDown.msTimer );
    BrokeTimerCountDown.countStart = startTime;
    BrokeTimerCountDown.countEnd = endTime;

    BrokeTimerCountDown.onBrokeTimerCountDownStart();
   
end


BrokeTimerCountDown.load = function()
end

--private
BrokeTimerCountDown.creatAnim = function ()
    BrokeTimerCountDown.onBrokeTimerCountDownStop(false, BrokeTimerCountDown.type_going, BrokeTimerCountDown.countStart);
    BrokeTimerCountDown.animCount = AnimFactory.createAnimDouble(kAnimRepeat, 0, 1 , BrokeTimerCountDown.msTimer, -1);
    BrokeTimerCountDown.animCount:setEvent(BrokeTimerCountDown.animCount , BrokeTimerCountDown.onTimer);
    ToolKit.setDebugName(BrokeTimerCountDown.animCount , "AnimInt|BrokeTimerCountDown.animCount");
end

--private
BrokeTimerCountDown.onTimer = function (self,anim_type, anim_id, repeat_or_loop_num)
    BrokeTimerCountDown.countStart = BrokeTimerCountDown.countStart - BrokeTimerCountDown.interval;
    if BrokeTimerCountDown.countStart > BrokeTimerCountDown.countEnd then
      -- BrokeTimerCountDown.drawingText:setText(BrokeTimerCountDown.changeCount());
      BrokeTimerCountDown.onBrokeTimerCountDownStop(false, BrokeTimerCountDown.type_going, BrokeTimerCountDown.countStart);
    else
      -- BrokeTimerCountDown.drawingText:setText(BrokeTimerCountDown.changeCount());
      BrokeTimerCountDown.onBrokeTimerCountDownStop(true, BrokeTimerCountDown.type_stop, BrokeTimerCountDown.countStart);
    end
end

--计算倒计时间
BrokeTimerCountDown.changeCount = function ()
    return BrokeTimerCountDown.countStart < 10 and string.format("0%d",BrokeTimerCountDown.countStart) or BrokeTimerCountDown.countStart;
end

--倒计时继续
BrokeTimerCountDown.onBrokeTimerCountDownStart = function ()
    BrokeTimerCountDown.reset();
    BrokeTimerCountDown.creatAnim();
end

--停止倒计时
BrokeTimerCountDown.onBrokeTimerCountDownStop = function (isstop, dtype, time)
    if isstop then
        BrokeTimerCountDown.reset();
    end
    BrokeTimerCountDown.onCallBack(BrokeTimerCountDown.obj,BrokeTimerCountDown.objCallBack, dtype,time)
end


--停止倒计时
BrokeTimerCountDown.onCallBack = function (obj,objCallBack, dtype, time)
    if obj and objCallBack then
        objCallBack(obj, dtype, time);
    end
end

--[[
   public
   [METHOD] reset
   [ACTION] 中断或复位动画
   Parameters: 无
]]
BrokeTimerCountDown.reset=function()
       BrokeTimerCountDown.stop();
end

--[[
   private
   [METHOD] stop
   [ACTION] 执行 删除赋给prop的anim ; 删除赋给drawing的prop 复位动画
   Parameters: 无
]]
BrokeTimerCountDown.stop =function()
    --删除anim
    delete(BrokeTimerCountDown.animCount);
    BrokeTimerCountDown.animCount = nil;
end

--[[
   public
   [METHOD] release
   [ACTION] 动画结束 释放资源
   Parameters: 无
]]
BrokeTimerCountDown.dtor = function()
    Log.d("BrokeTimerCountDown dtor start ...");
    BrokeTimerCountDown.stop();
end