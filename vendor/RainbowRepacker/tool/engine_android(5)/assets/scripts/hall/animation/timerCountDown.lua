require("animation/animBase");
require("common/animFactory");
require("common/uiFactory");

TimerCountDown = class(AnimBase);
TimerCountDown.timer = {};

TimerCountDown.play = function(index,time,x,y,width,height,fontSize,r,g,b,cbObj,cbFunc)
    TimerCountDown.load(index,width,height,fontSize,r,g,b);
    TimerCountDown.stop(index);
    
    TimerCountDown.timer[index].curTime = time;
    TimerCountDown.timer[index].cbObj = cbObj;
    TimerCountDown.timer[index].cbFunc = cbFunc;
    TimerCountDown.timer[index].countDownTimer:setPos(x,y);
    TimerCountDown.timer[index].countDownTimer:setText(TimerCountDown.formatTime(time));
    TimerCountDown.timer[index].countDownTimer:setVisible(true);

    TimerCountDown.timer[index].animTimer = AnimFactory.createAnimDouble(kAnimRepeat,0,1,1000,0);
    TimerCountDown.timer[index].animTimer:setDebugName("AnimDouble|TimerCountDown.timer["..index.."].animTimer");
    TimerCountDown.timer[index].animTimer:setEvent(index,TimerCountDown.onTimer);

    return TimerCountDown.timer[index].countDownTimer;
end

TimerCountDown.load = function(index,width,height,fontSize,r,g,b)
    if not TimerCountDown.timer[index] then 
      TimerCountDown.timer[index] = {};
      TimerCountDown.timer[index].countDownTimer = TimerCountDown.loadText(width,height,fontSize,r,g,b);
    end 
end

TimerCountDown.loadText = function(width,height,fontSize,r,g,b)
    local tx = UIFactory.createText("",fontSize, width, height, kAlignLeft, r, g, b, "");
    tx:addToRoot();

    return tx;
end 

TimerCountDown.onTimer = function (index,anim_type, anim_id, repeat_or_loop_num)
    local curTime = TimerCountDown.timer[index].curTime;
    curTime = curTime - 1;
    if curTime > 0 then
        TimerCountDown.timer[index].countDownTimer:setText(TimerCountDown.formatTime(curTime));
    else
        TimerCountDown.timer[index].countDownTimer:setText(TimerCountDown.formatTime(curTime));
        TimerCountDown.stop(index);

        if TimerCountDown.timer[index].cbFunc then 
            TimerCountDown.timer[index].cbFunc(TimerCountDown.timer[index].cbObj);
        end
    end
    TimerCountDown.timer[index].curTime = curTime;
end

TimerCountDown.stop = function(index)
    if TimerCountDown.timer[index] then 
        if TimerCountDown.timer[index].countDownTimer then
           TimerCountDown.timer[index].countDownTimer:setVisible(false);
        end 

        if TimerCountDown.timer[index].animTimer then 
          delete(TimerCountDown.timer[index].animTimer);
        end 
        TimerCountDown.timer[index].animTimer = nil;
    end 
end

TimerCountDown.release = function(index)
    if index then         
        TimerCountDown.reset(index);
    else 
        for k,v in pairs(TimerCountDown.timer) do 
            TimerCountDown.reset(k);
        end 
        
        TimerCountDown.timer = {};
    end 
end

TimerCountDown.reset = function(index)
    if TimerCountDown.timer[index] then 
        TimerCountDown.stop(index);
        if TimerCountDown.timer[index].countDownTimer then 
            local countDownTimer = TimerCountDown.timer[index].countDownTimer;
            local parent = countDownTimer:getParent();
            if parent then
                parent:removeChild(countDownTimer);
            end
            delete(countDownTimer);
        end 
    end 
    TimerCountDown.timer[index] = nil;
end 

TimerCountDown.formatTime = function(time)
    local hour;
    local minute;
    local second;
    local time = time or 0;
    second =  time % 60;
    time = math.floor(time / 60);

    minute = time % 60;

    hour = math.floor(time / 60);

    if( math.floor(second / 10) == 0 ) then
      second = "0" .. second;
    end
    
    if( math.floor(minute / 10) == 0 ) then
      minute = "0" .. minute;
    end

    if(math.floor(hour / 10) == 0 )then
      hour = "0" .. hour;
    end

    local str = minute .. ":" .. second;
    return str;
end