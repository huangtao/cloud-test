-- systemEvnet.lua
-- Author: Vicent.Gong
-- Date: 2013-01-25
-- Last modification : 2012-05-30
-- Description: Default engine event listener

-- raw touch 
function event_touch_raw(finger_action, x, y, drawing_id)
	if NativeEvent and NativeEvent.onRawTouch then
		NativeEvent.onRawTouch(finger_action,x,y,drawing_id);
	else
		EventDispatcher.getInstance():dispatch(Event.RawTouch,finger_action,x,y,drawing_id);
	end
end

-- native call callback function
function event_call()
	if NativeEvent and NativeEvent.onEventCall then
		NativeEvent.onEventCall();
	else
    	EventDispatcher.getInstance():dispatch(Event.Call);
    end
end

function event_backpressed()
	if NativeEvent and NativeEvent.onBackPressed then
		NativeEvent.onBackPressed();
	else
    	EventDispatcher.getInstance():dispatch(Event.Back);
    end
end

function event_win_keydown(key)
	if NativeEvent and NativeEvent.onWinKeyDown then
		NativeEvent.onWinKeyDown(key);
	else
    	EventDispatcher.getInstance():dispatch(Event.KeyDown,key);
    end
end

-- application go to background
function event_pause()
	if NativeEvent and NativeEvent.onEventPause then
		NativeEvent.onEventPause();
	else
    	EventDispatcher.getInstance():dispatch(Event.Pause);
    end
end

-- application come to foreground 
function event_resume()
	if NativeEvent and NativeEvent.onEventResume then
    	NativeEvent.onEventResume();
    else
    	EventDispatcher.getInstance():dispatch(Event.Resume); 
    end
end       

-- system timer time up callback
function event_system_timer()
	local timerId = dict_get_int("SystemTimer", "Id", -1);
	if timerId == -1 then
		return;
	end

	if NativeEvent and NativeEvent.onTimeout then
    	NativeEvent.onTimeout(timerId);
    else
    	EventDispatcher.getInstance():dispatch(Event.Timeout,timerId);
    end
end

function event_resize(width,height)
    print_string("event_resize" , "width = ", width, " height = ", height);

    local isLandscape = width > height and true or false;
    local curIsLandscape = System.isLandscape();
    if isLandscape == curIsLandscape then
        --屏幕方向一致，则过滤掉
        return;
    end

    System.resetScreenSize();
    local jsontabe = {};
    jsontabe.isLandscapeState = isLandscape and 1 or 0;
    EventDispatcher.getInstance():dispatch(Event.Call,"changeScreenOrientationCallBack", true, jsontabe);
end

function event_close()
    require("util/log");
    Log.onEventClose();
    require('network.http2').abort_all();
end
