--des:一个简单的服务器逻辑处理模拟（只限于PHP协议）
--    便于客户端独立于server开发调试，把数据源等模拟代码提取到这里，使你的有效代码更加清晰。
--by Demon 2016.07.27

--用法
--1.在你的看数据接口文件开头  lcoal OnlineSocketManager = require('hall/common/simpleVirtualServer');  重载掉全局的OnlineSocketManager（不要时请去掉，切记）
--2.在handle文件里增加对这个cmd的处理方法Handle[cmd] = function(cmd,param) return {data = {},isSuccess = false ,waitTime = 500} end 


local SimpleVirtualServer = {};

SimpleVirtualServer.handle = require('hall/common/simpleVirtualServer/handle');
SimpleVirtualServer.anim = {};

SimpleVirtualServer.getInstance = function()
	return SimpleVirtualServer;
end

SimpleVirtualServer.sendMsg = function(self,cmd,param,time)
	if type(cmd) ~= 'number' then
		return;
	end	

	if SimpleVirtualServer.handle[cmd] and type(SimpleVirtualServer.handle[cmd]) == 'function' then

		if SimpleVirtualServer.anim[cmd] then
			Log.v("SimpleVirtualServer.sendMsg","前面还没返回呢");
			Log.v("SimpleVirtualServer.sendMsg",param);
			return;
		end	

		local _backConfig = SimpleVirtualServer.handle[cmd](cmd,param);
		local callBack = function()
			SocketHandlersStack.getInstance():handlePacket(cmd,_backConfig.isSuccess, _backConfig.data, param);
		end

		local _waitTime = _backConfig.waitTime or 500;
		SimpleVirtualServer.anim[cmd] =  new(AnimInt , kAnimNormal, 0, 1 ,_waitTime, -1);
		SimpleVirtualServer.anim[cmd]:setDebugName("SimpleVirtualServer.anim");
		SimpleVirtualServer.anim[cmd]:setEvent(nil, function() 
			callBack();
			delete(SimpleVirtualServer.anim[cmd])
			SimpleVirtualServer.anim[cmd] = nil;
		end);
	end 
end

return SimpleVirtualServer;