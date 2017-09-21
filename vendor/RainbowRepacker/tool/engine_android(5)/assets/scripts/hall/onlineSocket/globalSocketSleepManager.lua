
k_socket_sleep_startTime = os.time();
k_socket_sleep_time = 0;
k_socket_maxAllowSleeping_time = 13*60;
k_socket_php_session_dead_event = EventDispatcher.getInstance():getUserEvent();
function java2lua_socketDead()
	 local socket = OnlineSocketManager.getInstance();
	 if socket then 
	 	if socket:isSocketOpen() then 
	 		socket:closeSocketSync();
	 		k_socket_hasSleeping = true;
	 		
	 		k_socket_sleep_startTime = os.time();
	 		Log.d("java2lua_socketDead","lua挂在后台那么久，我关掉socket了哈");

	 		kLoginDataInterface:setLoginState(LoginConstants.eLoginState.Offline);
	 		kGameManager:startGame(GameType.HALL);
	 	end 
	 end
end

function java2lua_socketWakeUp()
	local socket = OnlineSocketManager.getInstance();
	 if socket then 
	 	if socket:isSocketOpen() == false then 
	 		socket:openSocket();
	 		Log.d("java2lua_socketWakeUp","lua挂在后台关闭，回来了，我打开socket了哈,我睡眠了",os.time()-k_socket_sleep_startTime,"秒");

	 		local platform = System.getPlatform();
				if platform == kPlatformIOS then
 					EventDispatcher.getInstance():dispatch(k_socket_php_session_dead_event);	            	

				elseif platform == kPlatformAndroid then
					
					if os.time()-k_socket_sleep_startTime > k_socket_maxAllowSleeping_time then 
            			--发送广播，通知界面，需要重新登录php了
	                	EventDispatcher.getInstance():dispatch(k_socket_php_session_dead_event);
          			end
				end
	 	end 
	 end
end
