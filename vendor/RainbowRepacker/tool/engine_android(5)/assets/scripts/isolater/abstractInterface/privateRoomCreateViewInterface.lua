-- @note 私人房创建弹框公共接口，游戏自定义私人房创建弹框必须继承此接口，并设置_gameCustomView._privateRoomParamSetView720和
--		 _gameCustomView._privateRoomParamSetViewScore720，若无设置这两个字段将默认沿用旧的接口，处理完子游戏逻辑后需要回调大厅方法

local PrivateRoomCreateViewInterface = class(CommonGameLayer);
--[[
	@brief 构造函数
	@param data (table) 私人房配置数据
		data = {
			id 					游戏id
			name 				游戏名称
			configList = {		配置列表
				tableType			房间类型(0:银币房, 1:金条房, 3:积分房)
				baseChip 			底注 {"100", "200", "300", "400"}
				name				底注类型名称
				times				倍数(积分房使用) {"100", "200", "300", "400"}
				rounds 				局数(积分房使用) {"100", "200", "300", "400"}
				isOpenVideo			实时对讲开关
				subgameminversion	子游戏最低版本限制
				subgamemaxversion	子游戏最高版本限制
				icon				私人房icon
				isOpenEscape 		此字段暂时无用
				extParams			子游戏扩展字段
			}
			
		}
	@param comfirmCallback (function) 确认回调函数，不需要参数
	@note 子游戏处理自定义逻辑后需要回调closeCallback(关闭弹框)和comfirmCallback(确认进入私人房)
--]]
PrivateRoomCreateViewInterface.ctor = function(self, data, comfirmCallback)
end

-----------------子类需重写下面这些方法-------------------------------
--[[
	@brief 获取自定义参数
	@return (boolean) 是否合法
	@return (table) 自定义参数
		{
			tableType		房间类型(0:银币房, 1:金条房, 3:积分房)
			baseChip		底注
			requireMoney	进场限制
			times			倍数(积分房)
			rounds			局数(积分房)
		}
--]]
PrivateRoomCreateViewInterface.getCustomParamData = function(self)
	return false, {};
end

--[[
	@brief 设置默认数据
	@param data (table) 默认选择数据
		{
			tableType		房间类型(0:银币房, 1:金条房, 3:积分房)
			baseChip		底注
			requireMoney	进场限制
			times			倍数(积分房)
			rounds			局数(积分房)
		}
	@note 此接口用来默认选中某些选项
--]]
PrivateRoomCreateViewInterface.resetParamData = function(self, data)
	
end

return PrivateRoomCreateViewInterface;
