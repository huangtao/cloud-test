--此文件为比赛配置说明

local GameMatchConfig = {};

----------------------------------------------------------------------------------------
-- --场景配置,它必须配
-- GameMatchConfig.scene = {
-- 	["controller"] 		= {filePath,className};
-- 	["scene"]			= {filePath,className};
-- 	["sceneLayout"] 	= {filePath,className}; --可以不必配置该项，前两项必须配
-- };

------------------------------------------------------------------------------------------
-- GameMatchConfig.match_backgroundFile = "";--比赛房间背景，不配就使用普通房间的背景
-- ----------------------------------------------------------------------------------------
-- --以下部分为控件配置（比赛中所有可以配置的控件），可以不用配，不配的时候就使用公共的控件
-- GameMatchConfig.matchExit = {}; --退赛提示
-- GameMatchConfig.matchFinish = {}; --比赛结束发奖页面
-- GameMatchConfig.matchGameOver = {}; --比赛结算界面
-- GameMatchConfig.matchLoading = {};--报名等待页面
-- GameMatchConfig.matchDetailInfo = {};--比赛详情
-- GameMatchConfig.matchRevive = {}; --复活赛
-- GameMatchConfig.matchTips = {}; --提示
-- GameMatchConfig.matchToolbar = {}; --工具栏
-- GameMatchConfig.matchWaiting = {}; --晋级等待页面
-- GameMatchConfig.matchWaitTable = {}; --配桌等待
-- GameMatchConfig.matchAnimLayer = {}; --比赛动画
-- GameMatchConfig.matchFailTips = {};--比赛开赛失败提示
-- GameMatchConfig.matchRankAndReward = {};--比赛排行和奖励页面
------------------------------------------------------------------------------------------
-- --下面为控件配置说明
-- GameMatchConfig.matchToolbar = {
-- 	[1] = {
-- 				path = viewFilePath; --必须配置
-- 				--下面几项可以不配
-- 				pos = {			
-- 					["x"] = x;
--                 	["y"] = y;
-- 				};
-- 				viewLayer = viewLayer;
-- 				viewConfig = viewConfig;
-- 				align = align;
-- 				config = config;--view需要的配置信息
-- 			};
-- 	[2] = {};
-- 	...
-- };
----------------------------------------------------------------------------------------

return GameMatchConfig;