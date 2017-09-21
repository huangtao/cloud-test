-- @note 私人房进入弹框公共接口，游戏自定义私人房进入弹框必须继承此接口，并设置_gameCustomView._privateRoomEnterView，处理完子游戏逻辑后回调大厅方法

local PrivateRoomEnterViewInterface = class(CommonGameLayer);
--[[
	@brief 构造函数
	@param data (table) 私人房数据
		data = {
			tId 				桌子id
			gameId 				游戏id
			svId 				服务器id
			userCount_on 		当前人数
			userCount_max 		最大人数
			requireMoney 		银币要求
			baseChip 			底注
			password 			私人房密码(兼容老版本)
			roomName 			房间名称(兼容老版本)
			isCanEscape 		是否允许逃跑
			isAlwaysBanker 		此字段暂时无用
			ownerName			房主名称
			tableType			房间类型(0:银币房, 1:金条房, 3:积分房)
			times				倍数
			rounds				局数
			extParams			子游戏扩展字段
		}
	@param closeCallback (function) 关闭回调函数，不需要参数
	@param comfirmCallback (function) 确认回调函数，不需要参数
	@note 子游戏处理自定义逻辑后需要回调closeCallback(关闭弹框)和comfirmCallback(确认进入私人房)
--]]
PrivateRoomEnterViewInterface.ctor = function(self, data, closeCallback, comfirmCallback)

end

return PrivateRoomEnterViewInterface;
