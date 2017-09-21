
local layerBase = require("games/common2/module/layerBase");

--[[
	游戏准备、托管、换桌按钮操作区域
]]
local ReadyLayer = class(layerBase);

ReadyLayer.ctor = function(self)
	local localseat = PlayerSeat.getInstance():getMyLocalSeat();
	if self.m_viewConfig[localseat] then
		self:addView(localseat,self.m_viewConfig[localseat]);
	end
end

ReadyLayer.dtor = function(self)
	
end

ReadyLayer.parseViewConfig = function(self)
    local viewConfig = {
        ["onlooker"] = {};
    };

    return viewConfig;
end


-- 初始化layer的配置
ReadyLayer.initViewConfig = function(self)
	self.m_viewConfig = {
		[1] = {
			path = "games/common2/module/ready/readyView";
			pos = {};
			viewLayer = "view/kScreen_1280_800/games/common2/readyLayout";
			viewConfig = "readyLayout";
			config = {
				isAutoReady = true;
			};
		};
		[2] = {};
		[3] = {};
	};
end

return ReadyLayer;

--[[
	准备换桌逻辑说明：
	处理准备换桌，如果配置了自动准备，进入房间时。登陆成功后会自动发生准备消息
	已经准备后，点击换桌，换桌成功后，会发送准备消息。

	监听状态：
	STATUS_LOGIN：登陆时，显示准备、换桌按钮。开启了自动准备时，会发送准备消息
	STATUS_LOGOUT：登出状态，出于换桌操作时，发送119登陆请求
	STATUS_READY：准备状态，准备按钮隐藏
	STATUS_START：牌局开始，界面隐藏
	STATUS_GAMEOVER：游戏结束后，按钮显示。

	特别注意：
	1、结算弹框有延时处理的，比如：先播放结算的银币+-，再显示弹框。在这个过程中，准备和换桌按钮已经显示了。
	如果这个时候点击了准备，出现结算弹框后又马上点击了再来一局。客户端发送了2次准备的消息，就很有可能会导致界面异常。
	有类似处理的子游戏需要特别注意，结算界面收到消息时，需要先发送ACTION_NS_HIDRWNDVIEW消息通知隐藏按钮，弹框显示完后再发送
	ACTION_NS_SHOWRWNDVIEW消息，通知显示准备换桌的按钮。
	2、准备和换桌操作时，会调用RoomLogic.getInstance():checkIsLevelUp()，进行校验是否可以进行操作。判断是否满足继续在当前场次
	游戏。判断是否破产、升场、降场


	监听动作：
	ACTION_NS_PLAYAGAIN：结算界面点击再来一局，会调用准备逻辑
	ACTION_AUTO_READY：自动准备消息，私人房进入房间时，会触发这个动作
	ACTION_NS_CHANGETABLE：发送换桌请求，其它模块触发
	ACTION_NS_ROOMUPCHANGE：升场时触发，请求换桌
	ACTION_NS_SHOWRWNDVIEW：显示准备界面
	ACTION_NS_HIDRWNDVIEW：隐藏准备界面
]]