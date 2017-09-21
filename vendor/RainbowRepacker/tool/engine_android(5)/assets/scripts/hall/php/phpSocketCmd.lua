require("php/phpCmd");
require("hall/php/phpManager");

local getIndex = function(self)
	return PhpManager.getInstance():getPhpCmdValue();
end


PHP_CORE_LOGIN = PHP_CMD_CONSTANT + 0x0001;---!!!此处必须为0x01,server会去理解此cmd

PHP_UPDATE_USERINFO = getIndex();	--用户信息更新

PHP_NOTICE = getIndex();
PHP_MODIFY_PWD = getIndex();

PHP_USER_INFO_REWARD = getIndex();

PHP_REWARD_CONFIG = getIndex();
PHP_REWARD_MONEY = getIndex();


PHP_ACTIVITY_LISTS = getIndex();
PHP_ACTIVITY_NUMBER = getIndex();

PHP_GET_RANK_LIST = getIndex();--获取排行列表
PHP_GET_RANK_INFO = getIndex();--获取某个用户排行信息
PHP_GET_RANK_TAB = getIndex(); --获取排行榜tab

PHP_CORE_INIT = getIndex();--登录初始化接口

PHP_UPDATE = getIndex();--APK升级

PHP_KEEPALIVE =  getIndex();--保持会话？？？？？

PHP_LOGIN_sendResetToken= getIndex(); --重置token下发
PHP_LOGIN_resetPwd= getIndex(); --通行证手机|邮箱账号重置密码
PHP_LOGIN_checkReg= getIndex(); --检查是否绑定手机
PHP_LOGIN_LOGIC_checkReg  = getIndex(); --检查是否绑定手机LoginLogic
PHP_LOGIN_bindPhone= getIndex(); --通行证手机绑定
PHP_GET_MSGCODE = getIndex(); --获取运营商号码
PHP_MSGUPCHECK= getIndex(); --短信上行检测接口
PHP_LEVEL_PLAYER_NUM = getIndex(); --短信上行检测接口
PHP_SEND_GETUI_ID = getIndex();--上报个推id

PHP_REGISTER_GETCODE = getIndex();--获取注册验证码
PHP_REGISTER_GETCODE_BY_VOICE = getIndex(); --语音验证获取注册验证码
PHP_FILLINFO_CONFIG = getIndex(); --首次设置资料奖励配置
PHP_REGISTER_FILLINFO = getIndex(); --首次设置资料奖励领取

PHP_UPDATE_SAFEBOX = getIndex(); --更新保险箱
PHP_GET_SAFEBOX_CONFIG = getIndex(); --获取保险箱配置


PHP_GET_MESSAGE = getIndex();	--获取消息
PHP_READ_MESSAGE = getIndex();	--阅读消息
PHP_Radio_List = getIndex();		--广播列表
PHP_Radio_Send = getIndex();		--发布广播

PHP_TASK_GETWEICHATINFO = getIndex(); -- 获取微信分享中的内容（标题、链接、主题文字）

PHP_DAY_MISSION_GET_LIST = getIndex();	--获取每日任务列表 
PHP_DAY_MISSION_GET_REWARD = getIndex();  --获取每日任务奖励
PHP_DAY_MISSION_SEND_SHARE_FLAG = getIndex(); --每日任务发送分享标识

PHP_GET_USERINFO = getIndex();

PHP_HALL_BOTTOM_BUTTON = getIndex();
PHP_clientMessages 		= getIndex();

---社交
PHP_FRIENDS_AD = getIndex();	--获取社交广告
PHP_NEWS_DEL = getIndex();
PHP_FRIENDS_SEND_MSG = getIndex();--发送消息

PHP_RANK_AWARD_PERMSG = getIndex(); --排行榜填写领奖信息

PHP_USER_GETAWARDS = getIndex(); ---私信获取奖励

PHP_SIGNINAWARD_SIGNININFO = getIndex(); --新版签到
PHP_SIGININAWARD_SIGININ = getIndex();---新版获取签到奖励
PHP_SIGNINAWARD_GETSIGNINCALENDAR = getIndex(); --获取签到日历

PHP_AGENCY_CONFIG = getIndex();--代理商系统配置信息
----------------------------------------------------------------------------------------
PHP_LEVEL_MEDEL_CONFIG = getIndex();  --等级信息列表
PHP_GAME_LEVEL_LIST = getIndex();	--房间列表新接口
PHP_GAME_LEVEL_COUNT = getIndex();	--房间列表人数

PHP_HALL_GAME_PLAYER_NUM = getIndex();	--大厅获取各游戏人数
PHP_HALLVIEW_CONFIG = getIndex();--大厅配置
PHP_HALLVIEW_CONFIG_SORT = getIndex(); -- 大厅游戏位列表

PHP_MODULELIST_CONFIG = getIndex();--大厅支持的模块的配置

PHP_MOREGAMES_UPDATEINSTALL = getIndex();--用户安装的游戏更新
-----------------------------------------------------------------------------------------
PHP_VIPPROPS = getIndex();	-- VIP特权

PHP_MALL_VIP_AD = getIndex();	---商城底部广告条
PHP_DEGRADE_GET_GOODS_BY_MONEY_DIS =  getIndex();--

PHP_SHOP_DIAMOND_BUY = getIndex();		--钻石商品购买
PHP_SHOP_DIAMOND_RECORD = getIndex();	--钻石购买记录

--diamond.dmdinit，diamond.dmdtabgoods
PHP_DIAMOND_DMDINIT = getIndex(); --新版兑换商城，获取配置
PHP_DIAMOND_DMDTABGOODS = getIndex();--获取钻石商品tab中的详细信息


PHP_SEND_PAYMENT_ORDER = getIndex(); --IOS支付获取orderID

PHP_SEND_PAY_ORDER = getIndex(); --IOS支付回调支付中心
PHP_GAME_PLAY_INFO = getIndex(); --请求php获取用户某个游戏的信息
PHP_ROOM_PAY_SEND_ORDER = getIndex();--请求上报订单信息

PHP_IOS_SWITCH_3RDPay =  getIndex();	-- IOS第三方支付开关

PHP_GOODS_INFO = getIndex();--支付列表统一接口
PHP_MARKET_TABS = getIndex();--商城Tab配置
PHP_PROPS_INFO = getIndex(); --请求自己的道具信息
PHP_BUY_MALL_PROP = getIndex(); --请求自己的道具信息

PHP_GET_MESSAGE_NUM = getIndex();	--获取消息数量

-----------------------------私人房 ---------------------------------------
PHP_PRIVATE_ROOM_CONFIG = getIndex();	--可建私人房的游戏列表
PHP_PRIVATE_ROOM_RECORD_LIST = getIndex(); -- 约牌记录列表
PHP_PRIVATE_ROOM_RECORD_DETAIL = getIndex(); -- 约牌记录详情

-----------------------------比赛相关 ---------------------------------------
PHP_SHARE_TEMPLE = getIndex();	---获取分享主题模板
PHP_REQUEST_MATCH_LIST = getIndex();
PHP_REQUEST_MATCH_DETAIL = getIndex();   --获取某个比赛奖励，描述信息
PHP_REQUEST_MATCH_BASIC = getIndex();   --获取某个比赛的完整信息，不包括奖励
PHP_GET_NEXT_LOOP_MATCH = getIndex();       --获取循环赛信息
PHP_REQUEST_MATCH_TAG_LIST = getIndex(); -- 比赛标签列表
PHP_MATCH_RECORD_STATISTICS = getIndex(); -- 比赛战绩统计
PHP_MATCH_RECORD_MATCH_LIST = getIndex(); -- 比赛历史战绩
PHP_MATCH_RECORD_REWARD_STATISTICS = getIndex(); -- 比赛奖励统计
PHP_MATCH_RECORD_MASTER_RANK_LIST = getIndex(); -- 比赛大师分排行
-----------------------------比赛相关 end------------------------------------

PHP_USE_PROPS = getIndex();
PHP_BAG_PROP_INFO = getIndex(); --获取背包内道具列表
PHP_BAG_PROP_ABANDON = getIndex(); --丢弃背包内道具


-----------------------------统一支付-------------------------------------
PHP_GET_PMODECONFIG = getIndex();
PHP_SEND_VALIDATE =        getIndex();
PHP_SEND_PAYMENT_ORDER_TEST =   getIndex(); --联运下单
PHP_CRYSTAL_BUY_GOODS = getIndex(); --用金条购买商品
PHP_NEW_GOODS_BASE = getIndex(); --物品配置
PHP_GOODS_DETAIL_INFO = getIndex();

------------------------------摇摇乐模块--------------------------------------
PHP_SLOT_MACHINE_SWITCH = getIndex(); --获取老虎机开关配置
PHP_SLOT_MACHINE_CONFIG = getIndex(); --获取老虎机配置
PHP_SLOT_MACHINE_REWARD = getIndex(); --老虎机抽奖
PHP_SLOT_MACHINE_RECORD = getIndex(); --获取老虎机抽奖记录
PHP_SLOT_MACHINE_GAME_SWITCH = getIndex(); --获取小游戏开关配置


------------------------------IOS、ANDROID 审核过滤----------------------------
PHP_IOS_FILTER_OPEN   = getIndex(); --ios审核过滤开关
PHP_ANDROID_FILTER_OPEN = getIndex(); -- android 审核过滤开关

------------------------------举报----------------------------
PHP_REPORT_PLAYER = getIndex(); -- 举报

-----------------------------商城广告-------------------------
PHP_MARKET_TABS_AD = getIndex(); -- 商城广告

PHP_REPORT_GAME_VERSION = getIndex(); --子游戏版本号上报

PHP_ROOM_GET_GAME_BG = getIndex(); --房间背景桌布等配置

----------------------------- 银元场 -------------------------------------
PHP_REQUEST_SILVER_DATA = getIndex();

--------------------------社交短信邀请好友注册---------------------------------------
PHP_SMS_INVITE_FRIEND = getIndex();
PHP_GET_EXTERNAL_IMDOMAIN = getIndex();

--------------------------------口令-------------------------------
PHP_PASSWORD_PUSH_INFO = getIndex(); -- 获取口令
PHP_PASSWORD_POP_INFO = getIndex(); -- 获取口令数据

PHP_SMS_INVITE_FRIEND_LIST = getIndex();

------------------------------新背包模块----------------------------
PHP_PACKAGE_BAGLIST     = getIndex(); -- 拉取背包列表
PHP_PACKAGE_USE         = getIndex(); -- 合成，使用，丢弃等功能都用这个接口
PHP_PACKAGE_SELL        = getIndex(); -- 回兑
PHP_PACKAGE_RECORD      = getIndex(); -- 拉取兑换历史记录
PHP_SCAN_SHANGJIA   	= getIndex(); -- 扫描线下商家二维码
PHP_EXCHANGE_APPLY   	= getIndex(); -- 线下商家兑换申请
PHP_PACKAGE_REFRESH_PROP= getIndex(); -- 根据物品ID获取玩家对应的该物品信息 

PHP_GET_FLOATBALL_CONFIG = getIndex(); --拉取浮动球配置信息
PHP_HOLIDAYS_BG         = getIndex(); -- 获取节假日特色背景图

PHP_BINDATOM        	= getIndex(); -- 代理商V2.0-客户端扫码绑定代理商

------------------------------金条兑换------------------------------
PHP_GOLDBAR_CONFIG		= getIndex(); -- 获取金条兑换的配置
PHP_GOLDBAR_EXCHANGE		= getIndex(); -- 兑换金条

------------------------------红包------------------------------
PHP_REDENVELOPE_CONFIG	= getIndex(); -- 红包配置
PHP_REDENVELOPE_SEND	= getIndex(); -- 发红包
PHP_REDENVELOPE_SEND_LIST	= getIndex(); -- 发红包列表
PHP_REDENVELOPE_DETAIL	= getIndex(); -- 红包领取详情

-----------------------猜拳模块--------------------------
PHP_MORA_GAME_SWITCH = getIndex(); --获取猜拳开关配置
PHP_MORA_GAME_CONFIG = getIndex(); --获取猜拳配置
PHP_MORA_GAME_REWARD = getIndex(); --猜拳结果
PHP_MORA_GAME_RECORD = getIndex(); --猜拳记录

------------------------------邀请赛------------------------------
PHP_INVITATIONAL_SELECT_CONFIG = getIndex(); --创建比赛参数选项配置
PHP_INVITATIONAL_RULES_CONTENT = getIndex(); --获取比赛规则内容
PHP_INVITATIONAL_AWARD_FORMULA = getIndex(); --奖圈对应奖金分配公式
PHP_INVITATIONAL_MATCH_MIN_PLAYERS = getIndex(); --比赛创建界面最低参赛人数选项
PHP_INVITATIONAL_MY_APPLY_LISTS = getIndex(); --我报名的列表
PHP_INVITATIONAL_QCODEURL = getIndex(); --邀请好友二维码地址
PHP_INVITATIONAL_AWARDRANK = getIndex(); --完整排名

HallPhpCmdMap = {
	
	[PHP_CORE_LOGIN] = "core.login";
	[PHP_UPDATE] = "system.update";
	[PHP_HALLVIEW_CONFIG] = "system.gamesposCfg";
	[PHP_HALLVIEW_CONFIG_SORT] = "system.gamesposIds";
	[PHP_MODULELIST_CONFIG] = "system.modules";

	[PHP_MOREGAMES_UPDATEINSTALL] = "system.updateinstalled";
	
	[PHP_LEVEL_MEDEL_CONFIG] = "core.getLevelConfig";
	[PHP_REWARD_CONFIG] = "dailyloginaward.config";
	[PHP_NOTICE] = "notices.getList";
	[PHP_REWARD_MONEY] = "dailyloginaward.get";
	[PHP_UPDATE_USERINFO] = "user.setuinfo";
	[PHP_GET_USERINFO] = "user.getuinfo";
	[PHP_SEND_PAYMENT_ORDER] = "order.create";
	[PHP_SEND_PAYMENT_ORDER_TEST] = "order.auditCreate";
	[PHP_SEND_PAY_ORDER] = "order.repost";
	[PHP_ACTIVITY_LISTS] = "activity.url";
	[PHP_SEND_VALIDATE] = "order.validate";
	[PHP_ACTIVITY_NUMBER] = "activity.number";

	[PHP_TASK_GETWEICHATINFO] = "tasks.getsharetopic";

	[PHP_GET_RANK_LIST] = "rank.getranklist";
	[PHP_GET_RANK_INFO] = "rank.getrank";
	[PHP_GET_RANK_TAB]  = "rank.tabs";

	[PHP_CORE_INIT] = "core.init";
	[PHP_DEGRADE_GET_GOODS_BY_MONEY_DIS] = "mall.payback";
	[PHP_KEEPALIVE] = "user.keepalive";
	[PHP_GAME_PLAY_INFO] = "user.playinfo";
	[PHP_ROOM_PAY_SEND_ORDER] = "order.creat_order_stat";

	[PHP_GET_MSGCODE] = "system.msgcode";
	[PHP_MSGUPCHECK] = "system.msgupcheck";

	[PHP_LOGIN_sendResetToken] = "passport.sendResetToken";
	[PHP_LOGIN_resetPwd] 	   = "passport.resetPwd";
	[PHP_LOGIN_checkReg] 	   = "passport.checkReg";
	[PHP_LOGIN_LOGIC_checkReg]  = "passport.checkReg";
	[PHP_REGISTER_GETCODE] 	   = "passport.regToken";
	[PHP_REGISTER_GETCODE_BY_VOICE] = "passport.voiceToken";
	[PHP_LOGIN_bindPhone]      = "passport.reg";
	[PHP_LEVEL_PLAYER_NUM]		="system.statLevelPlayersByGame";
	[PHP_SEND_GETUI_ID]       = "user.setPushToken";
	[PHP_FILLINFO_CONFIG] 	  = "user.awardSetUinfoCfg";
	[PHP_REGISTER_FILLINFO]	  = "user.awardSetUinfo";

	[PHP_UPDATE_SAFEBOX]       = "user.updatesafebox";
    [PHP_GET_SAFEBOX_CONFIG]   = "system.safeboxConfig";
	[PHP_GET_MESSAGE]			= "message.getMess";
	[PHP_READ_MESSAGE]			= "message.readNewMessage";
	[PHP_Radio_List]		   = "broadcast.getlist";
	[PHP_Radio_Send]		   = "broadcast.send";

	[PHP_SHOP_DIAMOND_BUY]	   	= "diamond.buy";
	[PHP_SHOP_DIAMOND_RECORD]	= "diamond.record";

	[PHP_GAME_LEVEL_LIST] = "system.getLevelInfoByGameV2"; --system.getLevelPlayersByGame（注释掉的以后不用了）
	[PHP_GAME_LEVEL_COUNT] = "system.getLevelCnt";

	[PHP_HALL_GAME_PLAYER_NUM] = "system.statPlayersByGame";
	[PHP_DAY_MISSION_GET_LIST] = "mission.getList";
	[PHP_DAY_MISSION_GET_REWARD] = "mission.finish";
	[PHP_DAY_MISSION_SEND_SHARE_FLAG] = "mission.setShareFlagNew";
	[PHP_HALL_BOTTOM_BUTTON] = "system.getclienttoolbar";
	[PHP_clientMessages] = "lang.clientMessages";
	[PHP_NEWS_DEL] = "news.del";
	[PHP_FRIENDS_SEND_MSG] = "chat.send";

	[PHP_VIPPROPS] = "shop.vipprops";

	[PHP_IOS_SWITCH_3RDPay] = "shop.switch3rdpay";
    [PHP_RANK_AWARD_PERMSG] = "match.address";
    [PHP_USER_GETAWARDS] = "user.getnewawards";

    [PHP_DIAMOND_DMDINIT] = "diamond.dmdtabs"; --新版兑换商城，获取配置
	[PHP_DIAMOND_DMDTABGOODS] = "diamond.dmdtabgoods";--获取钻石商品tab中的详细信息
	[PHP_MALL_VIP_AD] = "shop.vipadv";--商城底部广告

	[PHP_GOODS_INFO] = "shop.info";
	[PHP_MARKET_TABS] = "shop.tabcfg";
	[PHP_CRYSTAL_BUY_GOODS] = "crystal.buy";

	[PHP_SIGNINAWARD_SIGNININFO]				="signinaward.getSigninInfos";
	[PHP_SIGININAWARD_SIGININ]					="signinaward.signin";
	[PHP_SIGNINAWARD_GETSIGNINCALENDAR] 		= "signinaward.getSigninCalendar";

	[PHP_PROPS_INFO] 							= "props.propsCoreInfo";
	[PHP_BUY_MALL_PROP] 						= "shop.props";
	[PHP_NEW_GOODS_BASE]						= "shop.getgoodsbase";
	[PHP_GOODS_DETAIL_INFO]						= "shop.goodsbasedetail";


	[PHP_GET_MESSAGE_NUM]						= "message.getMessageNum";

	[PHP_SHARE_TEMPLE] = "mission.getShareTopicList";--获取分享主题模板
    [PHP_REQUEST_MATCH_LIST]                    = "match.lists";                -- php请求比赛列表 since 15/10/26
    [PHP_REQUEST_MATCH_DETAIL]                  = "match.detail";               --
    [PHP_REQUEST_MATCH_BASIC]                   = "match.basic";               --

	[PHP_AGENCY_CONFIG] = "agent.agentConfig";

    [PHP_BAG_PROP_ABANDON]		= "bag.abandon";
    [PHP_BAG_PROP_INFO]			= "bag.info";
	[PHP_USE_PROPS]				= "props.consume";	-- 请求使用房间道具

	[PHP_GET_PMODECONFIG] = "shop.pmodeCfg";

	[PHP_SLOT_MACHINE_SWITCH] = "slot.getSwitch";
	[PHP_SLOT_MACHINE_CONFIG] = "slot.getConfig";
	[PHP_SLOT_MACHINE_REWARD] = "slot.setDraw";
	[PHP_SLOT_MACHINE_RECORD] = "slot.getHistory";
	[PHP_SLOT_MACHINE_GAME_SWITCH] = "slot.getGameSwitch";


	[PHP_IOS_FILTER_OPEN]     = "system.iosFilterOpen";
	[PHP_ANDROID_FILTER_OPEN] = "system.andriodFilterOpen";
	
	[PHP_REPORT_PLAYER] = "jubao.setData";  --举报

	[PHP_MARKET_TABS_AD] = "goodsdocument.getData"; -- 商城广告
	[PHP_REPORT_GAME_VERSION] = "system.saveGameVer";
	
	[PHP_ROOM_GET_GAME_BG] = "system.getGameBg";

	[PHP_REQUEST_SILVER_DATA] = "silver.show"; -- 银元场任务
	[PHP_GET_EXTERNAL_IMDOMAIN] = "externals.getImdomain";
	[PHP_SMS_INVITE_FRIEND] = "friends.sendInviteMsg";
	[PHP_FRIENDS_AD] = "friends.ad";
	
	[PHP_PASSWORD_PUSH_INFO] = "command.generate";
	[PHP_PASSWORD_POP_INFO] = "command.get";
	[PHP_SMS_INVITE_FRIEND_LIST] = "friends.tokenInviteMsg";
	
	[PHP_PACKAGE_BAGLIST] = "bag.boxlist";
	[PHP_PACKAGE_USE] = "bag.boxuse";
	[PHP_PACKAGE_SELL] = "bag.reverse";
	[PHP_PACKAGE_RECORD] = "bag.boxRecord";
	[PHP_SCAN_SHANGJIA] = "bag.scanShangjiaGoods";
	[PHP_EXCHANGE_APPLY] = "bag.exchangeApply";
	[PHP_PACKAGE_REFRESH_PROP] = "bag.getboxItemIDsInfo";
    [PHP_GET_NEXT_LOOP_MATCH] = "match.getnextloopmatch";

    [PHP_GET_FLOATBALL_CONFIG] = "system.getAssistiveBallCfg";

    [PHP_REQUEST_MATCH_TAG_LIST] = "match.taglist";
    [PHP_HOLIDAYS_BG] = "system.getHolidaysBg";
    [PHP_MATCH_RECORD_STATISTICS] = "user.matchstats";
    [PHP_MATCH_RECORD_MATCH_LIST] = "user.matchrecord";
    [PHP_MATCH_RECORD_REWARD_STATISTICS] = "user.awardsstat";
    [PHP_MATCH_RECORD_MASTER_RANK_LIST] = "friends.getMasterRank";
    [PHP_BINDATOM] = "agent.binda2m";

    [PHP_GOLDBAR_CONFIG] = "crystal.moneyExchangeConfig";
    [PHP_GOLDBAR_EXCHANGE] = "crystal.moneyExchange";

	[PHP_PRIVATE_ROOM_CONFIG] = "system.privateroom";
    [PHP_PRIVATE_ROOM_RECORD_LIST] = "privateroom.records";
    [PHP_PRIVATE_ROOM_RECORD_DETAIL] = "privateroom.detail";
	[PHP_REDENVELOPE_CONFIG] = "lucky.getLuckyConf";
    [PHP_REDENVELOPE_SEND] = "lucky.shareLuckyMoney";
    [PHP_REDENVELOPE_SEND_LIST] = "lucky.shareLuckyList";
    [PHP_REDENVELOPE_DETAIL] = "lucky.getLuckyDetail";
    
    [PHP_MORA_GAME_SWITCH] = "morra.getSwitch";
	[PHP_MORA_GAME_CONFIG] = "morra.getConfig";
	[PHP_MORA_GAME_REWARD] = "morra.setDraw";
	[PHP_MORA_GAME_RECORD] = "morra.getHistory";
    [PHP_INVITATIONAL_SELECT_CONFIG] = "matchinvite.getSelectConfig";
    [PHP_INVITATIONAL_RULES_CONTENT] = "matchinvite.getRulesContent";
    [PHP_INVITATIONAL_AWARD_FORMULA] = "matchinvite.getAwardFormula";
    [PHP_INVITATIONAL_MATCH_MIN_PLAYERS] = "matchinvite.getInMatchNum";
    [PHP_INVITATIONAL_MY_APPLY_LISTS] = "matchinvite.myApplyLists";
    [PHP_INVITATIONAL_QCODEURL] = "matchinvite.inviteQcodeUrl";
    [PHP_INVITATIONAL_AWARDRANK] = "matchinvite.awardRank";
    };
PhpSocketCmdMap = CombineTables(PhpSocketCmdMap or {}, HallPhpCmdMap or {});
