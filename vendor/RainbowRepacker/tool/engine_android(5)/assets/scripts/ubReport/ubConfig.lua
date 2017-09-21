--[[
    -- 大厅  1000 ~ 2000
    -- 比赛、私人房  2000 ~ 3000
    -- 社交 3000 ~ 4000
    -- 房间 4000 ~ 5000
    -- 其他 5000 ~ 6000

    注意： 子游戏上报 需要采用 如下格式  ID(gameid)_R(1)_(参数) eg ID(201)_R(1)_4002  前面需要加上这个游戏的游戏Id,防止子游戏间冲突或子游戏与大厅字段冲突
]]

DReportConfig = {}; --无用，为了兼容

UBConfig = {	
    -- 大厅  1000 ~ 1500
    kHallGameType                               = "1000",           --各个游戏入口
    kEveryGameId                                = "1001",           --各个游戏场次

    kHallTopTabHall                             = "1002",           -- 大厅
    kHallTopTabMatch                            = "1003",           -- 比赛
    kHallTopTabSocial                           = "1004",           -- 社交
    kHallHead                                   = "1005",           -- 头像
    kHallBottomBackpack                         = "1021",           -- 物品箱

    kHallBottomMall                             = "1006",           -- 商城
    kHallBottomExchange                         = "1007",           -- 兑换
    kHallBottomActivity                         = "1008",           -- 活动
    kHallBottomGroupGame                        = "1009",           -- 团队赛
    kHallBottomMore                             = "1010",           -- 更多
    kHallBottomFreeMoney                        = "1011",           -- 签到（任务）
    kHallBottomMessage                          = "1012",           -- 私信
    kHallBottomRank                             = "1013",           -- 排行榜
    kHallBottomSafeBox                          = "1014",           -- 保险箱
    kHallBottomMoreGame                         = "1015",           -- 更多游戏
    kHallBottomSetting                          = "1016",           -- 设置

    kHallBroadcastPopup                         = "1017",           -- 广播弹框
    kHallBroadcastSend                          = "1018",           -- 发送广播

    PopUpExitGameDialog                         = "1019",           -- 退出游戏弹窗的出现次数
    HideExitGameDialog                          = "1020",           -- 退出游戏弹窗中，点击【我再想想】的次数
    ConfirmExitGame                             = "1022",           -- 退出游戏弹窗中，点击【考虑好了】的次数

    kHallBackpackShop                           = "1023",           -- 物品箱-商城
    kHallBackpackBackHall                       = "1024",           -- 物品箱-返回大厅
    kHallBackpackTabBag                         = "1025",           -- 物品箱-物品箱tab
    kHallBackpackTabRecord                      = "1026",           -- 物品箱-兑换记录tab
    kHallBackpackMatch                          = "1027",           -- 物品箱-兑换记录-比赛拿奖


    kHallExchangeTab                            = "1028",           -- 兑换-导航栏
    kHallExchangeTabItem                        = "1029",           -- 兑换-点击物品
    kHallExchangeGetDiamond                     = "1030",           -- 兑换-如何获得钻石
    kHallExchangeRecords                        = "1031",           -- 兑换-兑奖记录
    kHallBottomGoldBar                          = "1033",           -- 兑换金条
    kHallBottomService                          = "1034",           -- 客服
    kHallBottomFriend                           = "1035",           -- 好友
    kHallMatch                                  = "1036",           --比赛
    kHallBottomAgent                            = "1037",           --大厅代理按钮
    kHallBottomFriendRoom                       = "1038",           --大厅私人房按钮
    kHallBottomRedEnvelope                      = "1039",           --大厅发红包按钮


    kHallAgentEntry                             = "1050",           --大厅代理商入口
    kHallGameLevelGoldBar                       = "1051",           --大厅游戏房间等级金条场
    kHallGameLevelGoldBarFastStart              = "1052",           --大厅游戏房间等级金条场快速开始

    --710改版功能后新按钮  相关统计
    kHallMore                                   = "1060",           --“+'按钮点击次数
    kHallMoreExchange                           = "1061",           -- ”+“里的兑换按钮
    kHallMoreSweep                              = "1062",           -- "+"里的扫一扫功能
    kHallGoldbarToShop                          = "1063",           -- "大厅人物头像区域→金条后方+号按钮"
    kHallMoreTellFriends                        = "1064",           -- "+"里的告诉好友
    kHallMoreFriendsCircle                      = "1065",           -- "+"里的发朋友圈

    -- 签到
    kHallTaskSignup                             = "1100",           -- 签到领取银币
    kHallTaskGetSignupCard                      = "1101",           -- 获取补签卡
    kHallTaskAd                                 = "1102",           -- 签到公告位
    kHallTaskDoing                              = "1103",           -- 做任务taskdId
    kHallTaskDone                               = "1104",           -- 领取奖励taskdId
    ShowDayTaskArea                             = "1105",           -- 新手场引导弹窗中，出现【每日任务】按钮的次数
    ClickDayTaskArea                            = "1106",           -- 新手场引导弹窗中，点击【每日任务】的次数 2015-12-07
    kHallTaskRetroactive                        = "1107",           --补签
    kHallReturnSignup                           = "1108",           --返回签到
    kHallSignupDate                             = "1109",           --点击日期
    kHallTaskTagBtn                             = "1110",           --签到-每日任务tab
    kHallDayRewardTagBtn                        = "1111",           --任务-每日签到

    -- 破产
    kHallBankruptGetMoney                       = "1200",           -- 破产领取补助
    kHallBankruptBuy                            = "1201",           -- 破产购买商品
    kHallBankruptMoreShoping                    = "1202",           -- 更多商品
    kHallBankruptGetVip                         = "1203",           -- 点击购买VIP
    kHallBankruptSafeBoxShow                    = "1204",           -- 显示保险箱
    kHallBankruptClickSafeBox                   = "1205",           -- 点击保险箱
    kHallBankruptShowGetGold                    = "1206",           -- 显示领取银币
    kHallBankruptClickGetGold                   = "1207",           -- 点击领取银币
    kHallBankruptShowShare                      = "1208",           -- 显示分享界面
    kHallBankruptClickShare                     = "1209",           -- 点击分享
    kHallBankruptShowMatch                      = "1210",           -- 引导比赛
    kHallBankruptClickMatch                     = "1211",           -- 点击比赛
    kHallBankruptCutCD                          = "1212",           -- 引导免CD
    kHallBankruptCutCDOK                        = "1213",           -- 破产免CD成功

    -- 个人信息
    kHallUserInfoCity                           = "1300",           -- 地区选择
    kHallUserInfoRegistAccount                  = "1301",           -- 注册登录
    kHallUserInfoSwitchAccount                  = "1302",           -- 切换账号
    kHallUserInfoHead                           = "1303",           -- 修改头像
    kHallUserInfoBuyProp                        = "1304",           -- 购买道具
    kHallHeadTabInfo                            = "1305",           -- 个人头像-导航栏-〔个人信息〕点击
    kHallHeadRecharge                           = "1306",           -- 个人头像-〔充值〕点击
    
    kHallUserInfoVipPrivilege                   = "1307",           -- 点击"了解VIP特权"链接文字次数
    kHallUserInfoImmediatelyRenewals            = "1308",           -- 点击"立即续费"链接文字次数
    kHallUserInfoRenewals                       = "1309",           -- 点击后在"快捷续费框"成功续费次数、并分别记录用户选择的续费方式（日卡、周卡、月卡）
    kHallUserInfoRechargeCardBtn                = "1310",           -- 点击充值卡
    kHallUserInfoAccountUpgradeConfirm          = "1311",           -- 账号升级确定
    kHallUserInfoOldAccountLogin                = "1312",           -- 账号升级已有账号登录
    kHallUserInfoDirectLogin                    = "1313",           -- 账号升级直接登录
    kHallUserInfoNewPhoneRegister               = "1314",           -- 账号升级新手机注册
    kHallUserInfoModifyPhone                    = "1315",           -- 账号升级修改手机号
    kHallUserInfoResendSMS                      = "1316",           -- 账号升级重发短信
    kHallUserInfoResendVoice                    = "1317",           -- 账号升级语音验证

    -- 商城
    kHallMallPrivilege                          = "1401",           -- 查看特权
    kHallMallItemClick                          = "1402",           -- 点击商品
    kHallMallBag                                = "1403",           -- 商城背包按钮 userId
    kHallMallTabMoney                           = "1404",           -- 商城-导航栏-〔银币〕点击
    kHallMallTabCrystal                         = "1405",           -- 商城-导航栏-〔金条〕点击
    kHallMallTabProp                            = "1406",           -- 商城-导航栏-〔道具〕点击
    kHallMallTabVip                             = "1407",           -- 商城-导航栏-〔VIP〕点击

    -- 排行榜
    kHallRankQuickUp                            = "1500",           -- 快速提升排名
    kHallRankTabRich                            = "1501",           -- 排行榜-导航栏-〔富豪榜〕点击
    kHallRankTabEarn                            = "1502",           -- 排行榜-导航栏-〔赚金榜〕点击
    kHallRankTabExp                             = "1503",           -- 排行榜-导航栏-〔经验榜〕点击
    kHallRankYesterday                          = "1504",           -- 排行榜-〔昨日〕点击
    kHallRankToday                              = "1505",           -- 排行榜-〔今日〕点击
    kHallRankTabRedEnvelope                     = "1506",           -- 排行榜 （红包）

    --进入房间银币不足
    kHallSafeBoxGetMoneyLayout                  =  "1601",    --各游戏各场次点击场次-银币不足-保险箱取钱弹框的出现人次；
    kHallSafeBoxGetMoneyBtns                    =  "1602",    --各游戏各场次点击场次-银币不足-保险箱取钱按钮的点击人次；
    kHallChooseRoomPayLayout                    =  "1603",    --各游戏各场次点击场次-银币不足-购买银币弹框的出现人次；
    kHallChooseRoomPayBtns                      =  "1604",    --各游戏各场次点击场次-银币不足-购买银币按钮的点击人次；

    --设置
    kHallSettingFeedBack                        = "1700",      --设置-〔联系客服〕点击
    kHallSettingAboutUs                         = "1701",      --设置-〔关于我们〕点击
    kHallSettingGameHelp                        = "1702",      --设置-〔游戏帮助〕点击
    kHallSettingClearCache                      = "1703",      --设置-〔清除缓存〕点击
    kHallSettingExpandGift                      = "1704",      --设置-〔领取推广礼包〕点击
    kHallSettingAgentBtn                        = "1705",      --设置-〔代理商入口〕点击
    kHallSettingSlienceOnOff                    = "1706",      --设置-〔静音〕点击
    kHallSettingEffectSilder                    = "1707",      --设置-〔音效〕点击
    kHallSettingMusicSlider                     = "1708",      --设置-〔音乐〕点击
    kHallSettingVoiceReadCard                   = "1709",      --设置-〔语音读牌〕点击
    kHallSettingShakeSwitch                     = "1710",      --设置-〔震动〕点击
    kHallSettingDisableChat                     = "1711",      --设置-〔禁用聊天〕点击

    --社交
    kHallCommunityTabFriend                     = "1800",      --社交-好友-进入〔好友〕界面
    kHallCommunityRefresh                       = "1801",      --社交-好友-读取〔好友数量〕
    kHallCommunityRank                          = "1802",      --社交-好友排行-进入〔好友排行〕界面
    kHallCommunityRankSearch                    = "1803",      --社交-好友排行-使用〔好友快捷搜索〕
    kHallCommunityRankChooseList                = "1804",      --社交-好友排行-进入〔在线、银币、经验、等级、大师分〕界面
    kHallCommunityRankInfo                      = "1805",      --社交-好友排行-触发〔个人信息〕弹窗
    kHallCommunityRankBtnWord                   = "1806",      --社交-好友排行-触发〔私聊〕界面
    kHallCommunityKnow                          = "1807",      --社交-认识的人-进入〔认识的人〕入口
    kHallCommunityKnowContacts                  = "1808",      --社交-认识的人-点击〔通讯录〕入口
    kHallCommunityKnowContactsDone              = "1809",      --社交-认识的人-读取〔通讯录〕成功
    kHallCommunityKnowInvite                    = "1810",      --社交-认识的人-点击〔邀请〕按钮
    kHallCommunityKnowAddFriend                 = "1811",      --社交-认识的人-点击〔+好友〕按钮
    --kHallCommunity                              = "1812",      --社交-认识的人-读取〔通讯录〕已成为好友
    kHallCommunityKnowSearch                    = "1813",      --社交-认识的人-使用〔好友快捷搜索〕
    kHallCommunityNearby                        = "1814",      --社交-附近的人-进入〔附近的人〕入口
    kHallCommunityNearbyClick                   = "1815",      --社交-附近的人-点击〔附近的人〕入口
    kHallCommunityNearbyDone                    = "1816",      --社交-附近的人-读取〔附近的人〕成功
    kHallCommunityNearbyAddFriend               = "1817",      --社交-附近的人-点击〔+好友〕按钮
    kHallCommunityNearbyCleanUp                 = "1818",      --社交-附近的人-点击〔清除地理位置〕按钮
    kHallCommunitySearch                        = "1819",      --社交-查找好友-进入〔查找好友〕入口
    kHallCommunitySearchBtn                     = "1820",      --社交-查找好友-使用〔快捷搜索〕按钮
    kHallCommunitySearchDone                    = "1821",      --社交-查找好友-查找用户成功
    kHallCommunitySearchAdd                     = "1822",      --社交-查找好友--点击〔添加〕按钮
    kHallCommunityTabMessage                    = "1823",      --社交-消息-进入〔消息〕入口
    kHallCommunityMessageHead                   = "1824",      --社交-消息-触发〔个人信息〕弹窗
    kHallCommunityMessagePrivate                = "1825",      --社交-消息-触发〔私聊〕界面
    kHallCommunityMessageReadApply              = "1826",      --社交-消息-读取到〔好友申请〕
    kHallCommunityMessageAgree                  = "1827",      --社交-消息-好友申请中，点击〔同意〕按钮
    kHallCommunityMessageRefuse                 = "1828",      --社交-消息-好友申请中，点击〔拒绝〕按钮
    kHallCommunityDetailInfo                    = "1837",      --社交-个人信息-进入〔个人信息〕弹窗
    kHallCommunityDetailDel                     = "1829",      --社交-个人信息-点击〔删除〕按钮
    kHallCommunityDetailGotoChat                = "1830",      --社交-个人信息-点击〔会话〕按钮
    kHallCommunityPrivateTextFinish             = "1831",      --社交-私聊界面-使用〔文本对话〕成功
    kHallCommunityPrivateAudioFinish            = "1832",      --社交-私聊界面-使用〔语音对话〕成功
    kHallCommunityPrivateMaterial               = "1833",      --社交-私聊界面-点击〔查看详细资料〕按钮
    kHallCommunityPrivateCleanUp                = "1834",      --社交-私聊界面-点击〔清空聊天记录〕按钮
    kHallCommunityDelFriend                     = "1835",      --社交-删除-点击〔删除〕好友
    kHallCommunityDelChat                       = "1836",      --社交-删除-点击〔删除〕会话记录


    -- 比赛  2000 ~ 2500
    kMatchExit                                  = "2000",        -- 退赛matchID
    kMatchInvite                                = "2001",        -- 邀请好友matchID
    kMatchChatSend                              = "2002",        -- 发送聊天信息matchID
    kMatchShareFriend                           = "2003",        -- 分享到好友
    kMatchShareMoments                          = "2004",        -- 分享到朋友圈
    kMatchReturnHall                            = "2005",        -- 返回大厅matchID
    kMatchSignupNext                            = "2006",        -- 报名下一场matchID
    kMatchRank                                  = "2007",        -- 赛况排名matchID
    kMatchSetting                               = "2008",        -- 比赛设置matchID

    -- 比赛列表
    kHallMatchItemClickVertical                 = "2009",        -- 比赛列表项点击matchId(竖)
    kHallMatchItemClickHorizontal               = "2010",        -- 比赛列表项点击matchId(横)
    kHallMatchItemClickAd                       = "2012",        -- 比赛列表项点击matchId(运营位)
    kHallMatchViewSwitch                        = "2013",        -- 比赛界面切换按钮
    kHallMatchSingup                            = "2014",        -- 比赛报名matchID
    kHallMatchRuleItem                          = "2015",        -- 比赛规则
    kHallMatchRewardItem                        = "2016",        -- 比赛奖励
    kHallMatchRecord                            = "2017",        -- 比赛战绩
    kHallMatchPackage                           = "2018",        -- 比赛背包
    kHallMatchExitAdvanced                      = "2019",        -- 比赛提前退赛matchID
    kHallMatchConditionsNotMetHelp              = "2020",        -- 报名资格不足matchID
    kHallMatchEnter                             = "2021",        -- 比赛提前进入
    kMatchLoadingSlot                           = "2022",        -- 比赛赛前等待老虎机matchID

    kHallMatchHorizontalTags                    = "2023",        -- 比赛标签tagId(横)
    kHallMatchVerticalTags                      = "2024",        -- 比赛标签tagId(竖)
    kHallMatchHorizontalTagMatchList            = "2025",        -- 比赛类型列表点击Id(横) 2: 即将开赛
    kHallMatchVerticalTagMatchList              = "2026",        -- 比赛类型列表点击Id(竖) 2: 即将开赛
    kHallMatchSignupPay                         = "2027",        -- 比赛报名充值matchID
    kHallMatchExitHelp                          = "2028",        -- 退赛帮助matchID
    kHallMatchHorizontalTagMatch                = "2029",        -- 比赛界面点击全部比赛
    kHallMatchVerticalTagMatch                  = "2030",        -- 比赛界面比赛类型(竖)
    kHallMatchVerificationComfirm               = "2031",        -- 比赛验证码弹框确认matchID
    kHallMatchVerificationClose                 = "2032",        -- 比赛验证码弹框关闭matchID
    kHallMatchRecordMatchShareMoment            = "2033",        -- 比赛战绩分享朋友圈
    kHallMatchRecordMatchShareWechat            = "2034",        -- 比赛战绩分享微信好友
    --kHallMatchRecordMatchShareQQ                = "2039",        -- 比赛战绩分享QQ好友
    kHallMatchRecordTabMyInfo                   = "2035",        -- 比赛战绩我的战绩tab
    kHallMatchRecordTabHistory                  = "2036",        -- 比赛战绩历史战绩tab
    kHallMatchRecordTabRank                     = "2037",        -- 比赛战绩好友排行tab
    kHallMatchRecordMasterDesc                  = "2038",        -- 比赛战绩大师分描述

    kHallMatchTimeToEnterConfirm                = "2039",        -- 定时赛报名成功后赛前提醒现在进入
    kHallMatchTimeToEnterClose                  = "2040",        -- 定时赛报名成功后赛前提醒关闭弹窗
    kHallMatchListToLoadingTime                 = "2041",        -- 比赛列表界面到开赛等待界面的停留时间
    kHallMatchListToLoading                     = "2042",        -- 比赛列表界面到开赛等待界面
    kHallMatchOpenEnroll                        = "2043",        -- 比赛打开报名界面
    kHallMatchThresholdDiscontent               = "2044",        -- 比赛报名界面打开但不满足报名门槛
    kHallMatchEnrollDiscontent                  = "2045",        -- 比赛报名界面打开而没有可满足的满足的报名条件
    kHallMatchShowEnrollSelect                  = "2046",        -- 比赛报名界面展开报名条件列表

    
    ClickSilverInMatchHall                      = "2207",        -- 比赛场，点击顶部【银元】的次数
    PopUpSilverNoFeeDialog                      = "2208",        -- 参与比赛银元不足的弹窗出现次数
    GoToSilverRoomFromMatchHall                 = "2209",        -- 参与比赛银元不足的弹窗,点击【玩牌赚银元】的次数

    kMatchReturnHallReward                      = "2210",        -- 奖状页面返回大厅matchID
    kMatchSignupNextReward                      = "2211",        -- 奖状页面报名下一场matchID
    kMatchShareReward                           = "2212",        -- 奖状页面点击分享matchID
    kMatchReturnHallUnReward                    = "2213",        -- 证书页面返回大厅matchID
    kMatchSignupNextUnReward                    = "2214",        -- 证书页面报名下一场matchID 
    kMatchShareUnReward                         = "2215",        -- 证书页面点击分享matchID
    kMatchShareFriendReward                     = "2216",        -- 奖状页面分享到好友
    kMatchShareMomentsReward                    = "2217",        -- 奖状页面分享到朋友圈
    kMatchShareFriendUnReward                   = "2218",        -- 证书页面分享到好友
    kMatchShareMomentsUnReward                  = "2219",        -- 证书页面分享到朋友圈
    kMatchShowTimeReward                        = "2220",        -- 奖状页面展示时间
    kMatchShowTimeUnReward                      = "2221",        -- 证书页面展示时间

    kMatchOnlookerReward                        = "2222",        -- 奖状页面点击围观按钮
    kMatchOnlookerUnReward                      = "2223",        -- 证书页面点击围观按钮
    kMatchWaitingOnlooker                       = "2224",        -- 赛间等待去围观
    kMatchFinishOnlooker                        = "2225",        -- 淘汰后去围观
    kOnlookerSendMsg                            = "2226",        -- 围观者发送普通弹幕
    kOnlookerSendProps                          = "2227",        -- 围观者发送道具弹幕

    -- 私人房
    kRoomRecruiteBroadcast                      = "2101",        -- 私人房广播招募gameId
    kRoomRecruiteWechat                         = "2102",        -- 私人房微信招募gameId
    -- kHallRoomCreatePopup                        = "2103",        -- 创建房间弹框 (710移除)
    kHallRoomCreateComfirm                      = "2104",        -- 创建房间确定
    kHallRoomSearch                             = "2105",        -- 搜索房间
    -- kHallRoomQuickStart                         = "2106",        -- 快速开始 (710移除)
    kRoomInviteFriendWechat                     = "2107",        -- 邀请好友微信分享
    kRoomInviteFriendQQ                         = "2108",        -- 邀请好友QQ分享
    kRoomInviteFriendMessage                    = "2109",        -- 邀请好友短信分享
    kRoomInviteFriendOnline                     = "2110",        -- 邀请好友在线邀请
    kPsswordViewShow                            = "2111",        -- 口令显示
    -- kPsswordViewEnterPrivateRoom                = "2112",        -- 立即一起玩牌 (710移除)
    -- kHallRoomEmptyCreate                        = "2113",        -- 没有合适的搜索结果时创建房间 (710移除)
    -- kHallRoomEmptyRefresh                       = "2114",        -- 没有合适的搜索结果时刷新房间 (710移除)
    -- kHallRoomDownloadQRCode                     = "2115",        -- 私人房二维码
    kHallRoomGoToOtherGame                      = "2116",        -- 顶部切换游戏按钮
    -- kHallRoomRefreshList                        = "2117",        -- 自建场-〔刷新〕点击 (710移除)
    -- kHallRoomListItemClick                      = "2118",        -- 自建场- 选择类型 (710移除)
    -- kHallRoomFullPeopleHide                     = "2119",        -- 自建场-隐藏已满房间勾选 (710移除)
    -- kHallRoomFullPeopleShow                     = "2120",        -- 自建场-隐藏已满房间取消勾选 (710移除)
    -- kRoomInviteFriendQR                         = "2121",           -- 邀请好友二维码扫描 (900移除)
    -- kPrivateRoomOpenQR                          = "2122";--私人房点击打开二维码 (900移除)
    kPrivateJiFenInvite                         = "2123";--积分房邀请按钮
    kPrivateJiFenChangeSeat                     = "2124";--积分房跟TA换座
    kPrivateJiFenCloseChangeSeat                = "2125";--积分房广播换座提示
    kPrivateJiFenRefuseChangeSeat               = "2126";--积分房拒绝换座
    kPrivateJiFenAgreeChangeSeat                = "2127";--积分房同意换座
    kPrivateJiFenCreateAgain                    = "2128";--积分房再开一轮
    kPrivateJiFenPlayRecord                     = "2129";--积分房玩牌记录
    kPrivateJiFenCloseRecord                    = "2130";--积分房关闭玩牌记录
    kPrivateJiFenCloseGameOver                  = "2131";--积分房关闭本局结束
    kPrivateJiFenCloseFinish                    = "2132";--私人房关闭游戏结算
    kPrivateJiFenRecordConfirm                  = "2133";--积分房玩牌记录确定
    kPrivateJiFenGameOverSaved                  = "2134";--积分房本局结算截图保存
    kPrivateJiFenGameOverContinue               = "2135";--积分房本局结算继续
    kPrivateJiFenFinishWeiChat                  = "2136";--私人房游戏结算微信分享
    kPrivateJiFenFinishContinue                 = "2137";--私人房游戏结算再开一轮
    kPrivateJiFenKickUser                       = "2138";--积分房踢人
    kPrivateRoomOpenDownloadQR                  = "2139";--私人房下载二维码
    -- kPrivateRoomScanQR                          = "2142";--使用“扫码进房” -- 720移除
    kPrivateRoomEnterJiFenBySearch              = "2142";--通过输入房间号进入“熟人积分场”
    kPrivateRoomEnterYouXiBiBySearch            = "2143";--通过输入房间号进入“游戏币房”
    kPrivateRoomEnterJiFenByScan                = "2144";--通过扫码进入“熟人积分场”
    kPrivateRoomEnterYouXiBiByScan              = "2145";--通过扫码进入“游戏币房”
    kPrivateRoomEnterJiFenByPassword            = "2146";--通过邀请口令进入“熟人积分场”
    kPrivateRoomEnterYouXiBiByPassword          = "2147";--通过邀请口令进入“游戏币房”
    kPrivateRoomCreateJiFenTimes                = "2148";--玩家在“开熟人积分房”时，分别记录玩家设置的“倍数”（包括自定义具体数值）
    kPrivateRoomCreateJiFenRounds               = "2149";--玩家在“开熟人积分房”时，分别记录玩家设置的“局数”（包括自定义具体数值）
    kPrivateRoomCreateJiFenSuccess              = "2150";--成功创建“熟人积分场”
    kPrivateRoomCreateYouXiBiSuccess            = "2151";--成功创建“游戏币房”
    kPrivateRoomCreateJiFen                     = "2152";--点击“开熟人积分场”按钮
    kPrivateRoomCreateYouXiBi                   = "2153";--点击“开游戏币房”按钮
    kPrivateJiFenSelectEmptySeat                = "2154";--积分房坐这儿 
    kPrivateRoomOpenRecord                      = "2155";--私人房记录按钮(900添加)
    kRoomInviteFriendViewBtnMessage             = "2156";--私人房短信邀请好友(900添加)
    kRoomInviteFriendViewBtnOnline              = "2157";--私人房在线邀请好友(900添加)
    kPrivateJiFenFinishSave                     = "2158";--私人房游戏结算截图保存(900添加)
    kPrivateRoomEnterJiFenByHtml                = "2159";--通过H5进入“熟人积分场”(900添加)
    kPrivateRoomEnterYouXiBiByHtml              = "2160";--通过H5进入“游戏币房”(900添加)
    kPrivateRoomEnterJiFenByOnline              = "2161";--通过在线好友邀请进入“熟人积分场”(900添加)
    kPrivateRoomEnterYouXiBiByOnline            = "2162";--通过在线好友邀请进入“游戏币房”(900添加)

    -- VIP
    kHallGetVipSignup                           = "2200",        -- 开通VIP_签到
    kHallGetVipExpression                       = "2201",        -- 开通VIP_表情
    kHallGetVipBankrupt                         = "2202",        -- 开通VIP_破产
    kHallGetVipKick                             = "2203",        -- 开通VIP_踢人

    -- 房间 4000 ~ 5000

    --房间toolbar
    kToolBarMenu                                = "4000",        --牌桌菜单展开
    kToolBarQuit                                = "4001",        --牌桌菜单退出
    kToolBarRobot                               = "4002",        --牌桌菜单托管
    kToolBarMall                                = "4003",        --牌桌菜单商场
    kToolBarSetting                             = "4004",        --牌桌菜单设置
    kToolBarQuKuan                              = "4005",        --牌桌菜单取款
    
    --房间聊天
    kChatExpressionWin                          = "4100",        --聊天框展开
    kChatExpressionVipTab                       = "4101",        --聊天框vip tab
    kChatExpressionClassicTab                   = "4102",        --聊天框经典tab
    kChtaExpressionRecentlyUsedTab              = "4103",        --聊天框常用tab
    kExtraChatBtnClick                          = "4104";        --聊天按钮
    kChatExpressionPhrase                       = "4105";        --聊天短语
    kChatExpressionNormalExpress                = "4106";        --子游戏-牌桌-聊天-每一个普通表情的点击人次（按位置判断）
    kChatExpressionVipExpress                   = "4107";        --子游戏-牌桌-聊天-每一个普通表情的点击人次（按位置判断）
    kChatExpressionGetVip                       = "4108";        --子游戏-牌桌-聊天-开通VIP点击人次


    kChatClick1                                 = "4109";        -- 各游戏牌桌【聊天】的点击人次（人数和次数，下同）
    kChatClick2                                 = "4110"; -- 各游戏【快捷语】tab的点击人次
    kChatClick3                                 = "4111"; -- 各游戏【表情】tab的点击人次
    kChatClick4                                 = "4112"; -- 各游戏【聊天记录】tab的点击人次
    kChatClick5                                 = "4113"; -- 各游戏【表情】切换到【VIP】tab的点击人次
    kChatClick6                                 = "4114"; -- 各游戏【表情】切换到【普通】tab的点击人次
    kChatClick7                                 = "4115"; -- 各游戏【表情】中【成为VIP】的点击人次
    kChatClick8                                 = "4116"; -- 各游戏每个编号的快捷语点击人次；
    kChatClick9                                 = "4117"; -- 各游戏每个编号的普通表情点击人次；
    kChatClick10                                = "4118"; -- 各游戏每个编号的VIP表情点击人次；
    kChatClick11                                = "4119"; -- 各游戏点击输入框的人次；
    kChatClick12                                = "4120"; -- 各游戏发送输入内容的人次；


    --房间结算
    kGameOverShare                              = "4201",           --游戏结束分享
    kGameOverContinue                           = "4202",           --游戏结束再来一局
    kGameOverRecharge                           = "4203",           --游戏结束充值
    kGameOverRechargeTable                      = "4204",           --游戏结束换桌

    kGameReadyAction1                           = "4205", --人均组桌时间（玩家由进入牌桌到开局的时间）gameId+levelId+time
    kGameReadyAction2                           = "4206", --人均续局时间（玩家由结束本局到开启下一局的时间） gameId+levelId+time

    -- 实时对讲
    kVideoMicrophoneUse                         = "4300"; -- gameId + roomId + uid
    kVideoMicrophoneUseEnd                      = "4301"; -- gameId + roomId + uid
    kVideoChatSwitchClick                       = "4302"; -- 实时对讲开关点击
    -- kVideoSettingShieldVideoChat                = "4303"; -- 屏蔽语音对讲

    --银元场
    ClickSilverTaskIcon                         = "4400",           -- 牌桌内的【银元】的入口点击次数
    PopUpExitDialogInSilverRoom                 = "4401",           -- 牌桌退出弹窗的出现次数
    ConfirmExitSilverRoom                       = "4402",           -- 牌桌退出弹窗中，点击【确定离开】的次数

    --牌桌资料卡
    kGameDesktopPlayerInfo                      = "4500",           -- 子游戏-牌桌-个人资料卡点击人次
    kGameDesktopPlayerInfoAddFriend             = "4501",           -- 子游戏-牌桌-个人资料卡-加好友点击人次
    kGameDesktopPlayerInfoClickProp             = "4502",        -- 子游戏-牌桌-个人资料卡-各道具使用的情况
    kGameDesktopPlayerInfoClickKick             = "4503",           -- 子游戏-牌桌-个人资料卡-踢走点击人次
    kGameDesktopPlayerInfoClickReport           = "4504",           -- 子游戏-牌桌-个人资料卡-举报点击人次

    kGameShowFriendApply                        = "4505"; --出现“好友申请-确认界面”
    kGameFriendApplyClickAgree                  = "4506"; --点击“好友申请-确认界面”〔同意〕按钮
    kGameFriendApplyClickRefuse                 = "4507"; --点击“好友申请-确认界面”〔拒绝〕按钮
    kGameFriendApplyTimeoutClose                = "4508"; --好友申请-确认界面”超时关闭

    --浮动球
    kFloatBallClick                             = "4600"; --浮动球-被点击 + 场景名字
    kFloatBallJumpClick                         = "4601"; --浮动球-点击跳转 + 场景名字 
    kFloatBallItemClick                         = "4602"; --浮动球-点击跳转item + ID


    -- 老虎机：6300-6399
    kSlotMachineAction1                         = 6300;             -- 详情
    kSlotMachineAction2                         = 6301;             -- 切换幸运图片
    kSlotMachineAction3                         = 6302;             -- 勾选自动玩
    kSlotMachineAction4                         = 6303;             -- 取消自动玩
    kSlotMachineAction5                         = 6304;             -- 底注100
    kSlotMachineAction6                         = 6305;             -- 底注2000
    kSlotMachineAction7                         = 6306;             -- 底注10000
    kSlotMachineAction8                         = 6307;             -- 拉杆
    -- 猜拳
    kMoraGameAction1                            = "4601";           -- 猜拳小游戏打开次数
    kMoraGameAction2                            = "4602";           -- 规则按钮点击次数
    kMoraGameAction3                            = "4603";           -- 勾选自动玩次数
    kMoraGameAction4                            = "4604";           -- 赢
    kMoraGameAction5                            = "4605";           -- 平
    kMoraGameAction6                            = "4606";           -- 输
    kMoraGameAction7                            = "4607";           -- 上          
    kMoraGameAction8                            = "4608";           -- 中
    kMoraGameAction9                            = "4609";           -- 下
    kMoraGameAction10                           = "4610";           -- 石头
    kMoraGameAction11                           = "4611";           -- 剪刀
    kMoraGameAction12                           = "4612";           -- 布

    --邀请赛
    kInvitationalAction1                        = "4701"; --点击大厅更多菜单里邀请赛按钮
    kInvitationalAction2                        = "4702"; --点击比赛场列表页邀请赛按钮
    kInvitationalAction3                        = "4703"; --点击邀请赛大厅左上角返回按钮
    kInvitationalAction4                        = "4704"; --邀请赛大厅的停留时间
    kInvitationalAction5                        = "4705"; --点击创建邀请赛按钮
    kInvitationalAction6                        = "4706"; --点击创建比赛左上角返回按钮
    kInvitationalAction7                        = "4707"; --创建比赛的停留时间
    kInvitationalAction8                        = "4708"; --比赛创建成功
    kInvitationalAction9                        = "4709"; --比赛设置密码且创建成功
    kInvitationalAction10                       = "4710"; --比赛设置不同获奖比例且创建成功
    kInvitationalAction11                       = "4711"; --开赛失败
    kInvitationalAction12                       = "4712"; --邀请赛大厅输入四位比赛编号
    kInvitationalAction13                       = "4713"; --邀请赛大厅点击我创建的邀请赛
    kInvitationalAction14                       = "4714"; --点击我创建的邀请赛左上角返回按钮
    kInvitationalAction15                       = "4715"; --我创建的邀请赛的停留时间
    kInvitationalAction16                       = "4716"; --点击我创建的邀请赛查看完整排名按钮
    kInvitationalAction17                       = "4717"; --点击邀请按钮
    kInvitationalAction18                       = "4718"; --
    kInvitationalAction19                       = "4719"; --
    kInvitationalAction20                       = "4720"; --
};


--充值上报，这里的字段会上报给php，存在映射关系，所以不能删除也不能修改这里定义的值
UBPaySceneConfig = {

    kHallMarketGold                             = "1",               --大厅商城银币
    kHallMarketVip                              = "2",               --大厅商城VIP购买
    kHallBroken                                 = "3",               --大厅破产
    kGameLevelList                              = "4",               --游戏列表
    -- kHallUserInfo                            = "5",               --个人资料(没有用，会跳转到商城)
    -- kHallRankList                            = "6",               --排行榜(没有用，会跳转到商城)
    -- KRoomRecharge                            = "7",               --房间充值(目前包含了 工具条和桌面上的按钮 已被拆分)
    KRoomBrokenRecharge                         = "8",               --房间破产
    KMatchApplyRecharge                         = "9",               --比赛报名费
    kGameFinishRecharge                         = "10",              --游戏结束充值
    KGameDescendRecharege                       = "11",              --降场充值

    kRoomToolBarRecharge                        = "12",              --房间工具条充值
    kRoomTableRecharge                          = "13",              --房间桌面充值
    kRoomVipPropRecharge                        = "14",              --房间桌面上的vip充值(如马股vip充值)
    kRoomChatWndVipRecharge                     = "15",              --房间聊天框购买vip
    kRoomUserInfoVipRecharge                    = "16",              --房间个人信息Vip充值

    kActivityRecharge                           = "17";              --活动中心直接调用充值
    kAgencyRecharge                             = "18";              --代理商充值

    kHallMarketCrystal                          = "19";              --大厅商城金条购买    
}

--首次点击
UBFirstReport = {
    Items = {--采集点
        [UBConfig.kHallTopTabHall]                                             = true,           -- 大厅
        [UBConfig.kHallTopTabMatch]                                            = true,           -- 比赛
        [UBConfig.kHallTopTabSocial]                                           = true,           -- 社交
        [UBConfig.kHallBroadcastPopup]                                         = true,           -- 广播弹框
        [UBConfig.kHallGameType]                                               = true,           -- 各个游戏入口
        [UBConfig.kHallHead]                                                   = true,           -- 头像
        [UBConfig.kHallBottomMessage]                                          = true,           -- 私信
        [UBConfig.kHallBottomMall]                                             = true,           -- 商场
        [UBConfig.kHallBottomExchange]                                         = true,           -- 兑换
        [UBConfig.kHallBottomFreeMoney]                                        = true,           -- 任务
        [UBConfig.kHallBottomActivity]                                         = true,           -- 活动
        [UBConfig.kHallBottomBackpack]                                         = true,           -- 物品箱
        [UBConfig.kHallBottomMore]                                             = true,           -- 更多
        [UBConfig.kHallBottomSafeBox]                                          = true,           -- 保险箱
        [UBConfig.kHallBottomSetting]                                          = true,           -- 设置
        [UBConfig.kHallBottomRank]                                             = true,           -- 排行榜
        [UBConfig.kHallBottomGroupGame]                                        = true,           -- 团队赛
    },

    Type = {--玩家类型
        Non_Rmb = "Non_Rmb",    --非人民币玩家
        Rmb = "Rmb",            --人民币玩家
        New = "New",            --新玩家
        Old = "Old",            --老玩家 
    },
}