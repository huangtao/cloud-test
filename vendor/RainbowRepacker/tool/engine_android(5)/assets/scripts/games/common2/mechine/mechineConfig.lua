
--[[
	定义游戏中的动作和游戏状态
]]

MechineConfig = {};



MechineConfig.VIEW_GAMEOVERWND 							= "view_gameoverwnd"; -- 创建结算view
MechineConfig.VIEW_BROADCAST 							= "view_broadcast"; -- 创建广播view
MechineConfig.VIEW_SAFEBOX 								= "view_safebox"; -- 创建保险箱view
MechineConfig.VIEW_SETTING 								= "view_setting"; -- 创建设置view
MechineConfig.VIEW_REPORT 								= "view_report"; -- 创建举报view
MechineConfig.VIEW_CHAT 								= "view_chat"; -- 创建聊天view
MechineConfig.VIEW_BOXVIEW 								= "view_boxview"; -- 创建宝箱任务view

MechineConfig.BROADCAST_MAINSTATE       				= "broadcast_main_state"; -- 广播通知当前主状态更新
MechineConfig.BROADCAST_STATE           				= "broadcast_state"; -- 广播通知当前的状态
MechineConfig.BROADCAST_ACTION          				= "broadcast_action"; -- 广播通知当前的动作

MechineConfig.STATUS_INVALID							= "status_invalid"; -- 无效状态

-- 游戏主状态
MechineConfig.STATUS_NONE 								= "status_none"; -- 游戏初始状态，未开始游戏
MechineConfig.STATUS_PLAYING							= "status_playing"; -- 游戏中
MechineConfig.STATUS_NOSTATUS							= "status_no_status"; -- 无状态动作的状态机
MechineConfig.STATUS_RECONNECT							= "status_reconnect"; -- 重连中的状态机
MechineConfig.STATUS_ONLOOKER 							= "status_onlooker";--围观状态机

MechineConfig.ACTION_RESET 								= "action_reset"; -- 重置状态
MechineConfig.ACTION_REMOVE_MECHINE 					= "action_remove_mechine"; -- 移除状态机

-- 主状态机的子状态
MechineConfig.STATUS_INIT								= "status_init"; -- 初始化房间状态
MechineConfig.STATUS_JOIN								= "status_join"; -- 加入房间状态
MechineConfig.STATUS_LOGIN								= "status_login"; -- 登陆桌子状态
MechineConfig.STATUS_LOGIN_ERROR						= "status_login_error"; -- 登陆失败状态
MechineConfig.STATUS_LOGOUT								= "status_logout"; -- 登出桌子状态
MechineConfig.STATUS_START								= "status_start"; -- 开始游戏
MechineConfig.STATUS_READY								= "status_ready"; -- 准备状态
MechineConfig.STATUS_GAMEOVER							= "status_over"; -- 结算状态

-- 主状态机动作
MechineConfig.ACTION_INITGAME 							= "ac_initgame"; -- 初始化游戏
MechineConfig.ACTION_JOINGAME 							= "ac_joingame"; -- 加入游戏
MechineConfig.ACTION_LOGOUT 							= "ac_logout"; -- 离开桌子
MechineConfig.ACTION_MYLOGIN 							= "ac_my_login"; -- 自己进入桌子
MechineConfig.ACTION_LOGIN 								= "ac_login"; -- 玩家进入桌子
MechineConfig.ACTION_LOGINERRO 							= "ac_login_erro"; -- 进入桌子失败
MechineConfig.ACTION_EXIT 								= "ac_exit"; -- 离开房间
MechineConfig.ACTION_READY 								= "ac_ready"; -- 准备
MechineConfig.ACTION_AUTO_READY							= "actino_auto_ready"; -- 私人房自动准备
MechineConfig.ACTION_CHANGETABLEERRO					= "ac_change_table_erro"; -- 换桌失败
MechineConfig.ACTION_OVER 								= "ac_over"; -- 结算
MechineConfig.ACTION_START								= "ac_start"; -- 开始游戏

-- 无状态动作
MechineConfig.ACTION_KICK               				= "ac_kick" -- server升级踢人
-- MechineConfig.ACTION_GETROOMLEVEL       				= "ac_get_room_level" -- 获取房间level
MechineConfig.ACTION_UPLEVEL       						= "ac_up_level" -- 场次升级
MechineConfig.ACTION_SENDCHATMSG       					= "ac_send_msg" -- 广播聊天信息
MechineConfig.ACTION_VIPKICK       						= "ac_vip_kick" -- VIP踢人
MechineConfig.ACTION_GETTASK       						= "ac_get_task" -- 广播特殊任务
MechineConfig.ACTION_COMPLETASK       					= "ac_comple_task" -- 广播任务完成
MechineConfig.ACTION_GETROOMTASK       					= "ac_get_room_task" -- 获取宝箱任务成功
MechineConfig.ACTION_GETTASKREWARD      				= "ac_get_task_reward" -- 获取宝箱任务奖励
MechineConfig.ACTION_REFRESH_BOX_TASK_INFO 				= "ac_refresh_box_task_info";
MechineConfig.ACTION_RECEIVE_CHAT      					= "ac_receive_chat" -- 收到聊天信息
MechineConfig.ACTION_RECEIVE_FACE      					= "ac_receive_face" -- 收到表情信息
MechineConfig.ACTION_BROAD_BOXTASK      				= "ac_broad_boxtask" -- 广播刷新宝箱任务
MechineConfig.ACTION_REQUESTEXITGAME 					= "ac_request_exit_playing"; -- 游戏中请求退出

MechineConfig.ACTION_RECHARGE      						= "ac_recharge" -- 支付
MechineConfig.ACTION_UPDATEMUTIPLE 						= "ac_update_mutiple"; -- 更新倍数
MechineConfig.ACTION_NS_CLOSEGAMEOVER  					= "ac_ns_closegameover"; -- 关闭结算弹框
MechineConfig.ACTION_NS_PLAYAGAIN  						= "ac_ns_playagain"; -- 再来一局
MechineConfig.ACTION_NS_OPENCLOCK  						= "ac_ns_openclock"; -- 显示闹钟
MechineConfig.ACTION_NS_CLOSECLOCK  					= "ac_ns_closeclock"; -- 关闭闹钟
MechineConfig.ACTION_NS_ROBOT  							= "ac_ns_robot"; -- 通知托管与取消托管状态
MechineConfig.ACTION_NS_CHANGETABLE  					= "ac_ns_changetable"; -- 换桌
MechineConfig.ACTION_SHOWKICKANIM  						= "ac_ns_showkickanim"; -- 播放踢人动画
MechineConfig.ACTION_SHOWPROPNIM  						= "ac_ns_showpropanim"; -- 播放互动道具动画
MechineConfig.ACTION_NS_ADDFRIENDRESULT 				= "ac_ns_addfriend_result"; -- 请求加好友结果
MechineConfig.ACTION_NS_ADDFRIEND_CALLBACK 				= "ac_ns_addfriend_callback";--收到加好友的回复：同意/拒绝
MechineConfig.ACTION_NS_LOGIN_VIDEO						= "ac_ns_login_video"; -- 登录实时对讲
MechineConfig.ACTION_NS_LOGOUT_VIDEO					= "ac_ns_logout_video"; -- 登出实时对讲
MechineConfig.ACTION_NS_UPDATE_CHAT_VOICE 				= "ac_ns_update_voice"; -- 更新实时对讲音效
MechineConfig.ACTION_NS_REFRESH_CHAT_VOICE 				= "ac_ns_refresh_voice"; -- 刷新实时对讲音效
MechineConfig.ACTION_NS_SHOW_MICROPHONE					= "ac_ns_show_microphone"; -- 显示实时对讲
MechineConfig.ACTION_NS_HIDE_MICROPHONE 				= "ac_ns_hide_microphone"; -- 隐藏实时对讲
MechineConfig.ACTION_NS_REQUESTINVITELIST 				= "ac_ns_request_invit_list";-- 显示私人房邀请框
MechineConfig.ACTION_NS_CLOSEINVITE 					= "ac_ns_close_invite";-- 关闭邀请好友弹框
MechineConfig.ACTION_NS_HIDEINVITE 						= "ac_ns_hide_invite";-- 隐藏邀请好友弹框
MechineConfig.ACTION_NS_INITINVITE 						= "ac_ns_init_invit";-- 初始化私人房邀请框
MechineConfig.ACTION_NS_ENVELOPANIM 					= "ac_ns_envelop_anim";-- 播放申请加好友动画
MechineConfig.ACTION_NS_ENVELOP_AGREE_ANIM 				= "ac_ns_envelop_agree_anim";-- 播放同意加好友动画
MechineConfig.ACTION_NS_ENVELOP_REFUSE_ANIM 			= "ac_ns_envelop_refuse_anim";-- 播放拒绝加好友动画
MechineConfig.ACTION_NS_FRIENDAPPLY      				= "ac_friends_apply" -- 有人申请加自己为好友
MechineConfig.ACTION_SETTING 							= "ac_ns_setting";--打开设置
MechineConfig.ACTION_RADIO								= "ac_ns_radio";--广播消息
MechineConfig.ACTION_NS_CHATFASEANIM					= "ac_ns_chat_face_anim";--表情动画
MechineConfig.ACTION_NS_CHATMSGANIM						= "ac_ns_chat_msg_anim";--聊天消息动画
MechineConfig.ACTION_NS_CHANGEDEGRADE_ANIM				= "ac_ns_changeDegrade_anim";--播放配桌换场动画
MechineConfig.ACTION_NS_OPENGAMEOVER					= "ac_ns_opengameover_wnd";--显示结算详情弹框
MechineConfig.ACTION_NS_KICKOUT_SUCCESS					= "ac_ns_kick_out_success"; -- 自己被踢出房间

MechineConfig.ACTION_ONLINE_RECONNECT_GAME 				= "ac_online_reconnect_game"; --socket未断刷新数据
MechineConfig.ACTION_OFFLINE_RECONNECT_GAME 			= "ac_offline_reconnect_game"; --断线重连游戏
MechineConfig.ACTION_REQUEST_EXIT 						= "ac_request_exit";--请求退出
MechineConfig.ACTION_NS_FORCE_EXIT 						= "ac_ns_force_exit";--强制退出游戏
MechineConfig.ACTION_REQUEST_LOGIN_FALSE_ROOM 			= "ac_request_login_false_room";--请求进入假房间
MechineConfig.ACTION_NS_CLICKACHAT 						= "ac_ns_click_chat";--点击聊天按钮
MechineConfig.ACTION_NS_EXTRAHELP 						= "ac_ns_extra_help";--扩展按钮，帮助
MechineConfig.ACTION_NS_EXTRASWITCH 					= "ac_ns_extra_switch";--扩展按钮，切换牌
MechineConfig.ACTION_NS_EXTRASHARE 						= "ac_ns_extra_share";--扩展按钮，分享

MechineConfig.ACTION_NS_CLOSEPLAYERWND 					= "ac_ns_close_playerwnd";--关闭个人信息弹框
MechineConfig.ACTION_NS_HEADCLICK 						= "ac_ns_head_click";--点击玩家头像
MechineConfig.ACTION_NS_CREATVIEW 						= "ac_ns_creat_view";--创建view
MechineConfig.ACTION_NS_CHECK_ROOM_BANKRUPT				= "ac_ns_check_room_bankrupt";--检测房间破产


MechineConfig.ACTION_NS_CLICK_DESKTOP 					= "ac_ns_click_desktop"; --桌面单击
MechineConfig.ACTION_NS_DOUBLE_CLICK_DESKTOP 			= "ac_ns_double_click_desktop";-- 双击桌面
MechineConfig.ACTION_NS_CLEAR_TABLE 					= "ac_ns_clear_table"; -- 清台

MechineConfig.ACTION_NS_UPDATE_USERINFO					= "ac_ns_update_userinfo"; -- 更新玩家头像信息



MechineConfig.ACTION_NS_HID_CHATWND 			        = "action_ns_hit_chatwnd"; -- 隐藏聊天弹框

MechineConfig.ACTION_NS_ROOMUPCHANGE 					= "ac_ns_room_up_change"; -- 升场换桌



MechineConfig.ACTION_NS_MATCH_SCORE 			 		= "ac_ns_match_score";--比赛积分
MechineConfig.ACTION_REFRESH_MAINSTATUS 			 	= "ac_ns_refresh_main_status";--刷新主状态
MechineConfig.ACTION_REFRESH_NONESTATUS 			 	= "ac_ns_refresh_none_status";--刷新非游戏中的状态机
MechineConfig.ACTION_NS_REFRESH_USERPROPERTY		 	= "ac_ns_refresh_userProperty";--刷新资产
MechineConfig.ACTION_NS_REFRESH_USERGAMERECORD 			= "ac_ns_refresn_userGameRecord";--刷新用户战绩
MechineConfig.ACTION_NS_REFRESH_WIFI		 			= "ac_ns_refresh_wifi";--刷新网络状态
MechineConfig.ACTION_NS_RECEIVE_RADIOMSG		 		= "ac_ns_receive_radiomsg";--接收广播消息
MechineConfig.ACTION_NS_RECEIVE_SENDRAIAOCALLBACK		= "ac_ns_send_radio_callback";--发送语音消息回调

MechineConfig.ACTION_NS_CANCEL_AI						= "ac_ns_cancel_ai";--取消托管



MechineConfig.ACTION_NS_ROOMLEVELUP_ANIM 				= "ac_ns_room_level_up"; -- 播放升场动画
MechineConfig.ACTION_NS_WEIXIN_SHARE_CALLBACK 			= "ac_ns_weixin_share_callback"; -- 微信分享回调
MechineConfig.ACTION_NS_DOWNLOAD_SHARE_IMAGE_CALLBACK   = "as_ns_donwload_share_image_callback"; --下载分享图片回调
MechineConfig.ACTION_NS_SAVEIMAGE_TO_PHOTOALBUM__CALLBACK	= "as_ns_saveImage_to_photoalbum_callback";--保存相册回调
MechineConfig.ACTION_NS_OPEN_SHARE_CALLBACK 			= "ac_ns_open_share_callback"; -- 打开分享APP结果回调
MechineConfig.ACTION_NS_STATUS_ERROR 					= "ac_ns_status_error"; -- 状态机校验错误，请求重连操作
MechineConfig.ACTION_NS_SEND_CHAT 						= "ac_ns_send_chat"; -- 发送聊天信息
MechineConfig.ACTION_NS_GET_BATTERYLEVEL 				= "ac_ns_get_batteryLevel"; -- 获取电量信息
MechineConfig.ACTION_NS_SHOWRWNDVIEW 					= "ac_ns_show_readyview"; -- 显示准备界面
MechineConfig.ACTION_NS_HIDRWNDVIEW 					= "ac_ns_hid_readyview"; -- 隐藏准备界面
MechineConfig.ACTION_NS_REFRESH_CURSTATUS               = "ac_ns_refresh_cur_status"; -- 强制刷新当前状态机状态
MechineConfig.ACTION_NS_CREATE_QR_CALLBACK              = "ac_ns_create_qr_callback"; -- 创建二维码回调
MechineConfig.ACTION_NS_REFRESH_TABLEINFO               = "ac_ns_refresh_table_info"; -- 刷新当前状态桌子信息
MechineConfig.ACTION_NS_MENUBAR_BTN_ENABLE          	= "ac_ns_menubar_btn_enable"; -- 菜单栏按钮是否可以点击


MechineConfig.ACTION_NS_OPEN_BOX 						= "ac_ns_open_box"; -- 打开任务宝箱
MechineConfig.ACTION_NS_OPEN_SAFEBOX 					= "ac_ns_open_safebox"; -- 打开保险箱
MechineConfig.ACTION_NS_CLOSE_SAFEBOX 					= "ac_ns_close_safebox"; -- 关闭保险箱
MechineConfig.ACTION_NS_OPEN_SETTING 					= "ac_ns_open_setting"; -- 打开设置界面
MechineConfig.ACTION_NS_CLOSE_SETTING 					= "ac_ns_close_setting"; -- 关闭设置界面
MechineConfig.ACTION_NS_OPEN_REPORT 					= "ac_ns_open_report"; -- 打开举报界面
MechineConfig.ACTION_NS_CLOSE_REPORT 					= "ac_ns_close_report"; -- 关闭举报界面

MechineConfig.ACTION_NS_SHOWBOXVIEW 					= "ac_ns_show_box_view"; -- 显示宝箱任务界面
MechineConfig.ACTION_NS_SAFEBOXRESULT 					= "ac_ns_safebox_result"; -- 保险箱操作结果
MechineConfig.ACTION_NS_INITTIMEVIEW 					= "ac_ns_init_time_view"; -- 设置时间界面

MechineConfig.ACTION_NS_GET_SILVER_DATA 				= "ac_ns_get_silver_data"; -- 获取银元数据
MechineConfig.ACTION_NS_GET_SILVER_REWARD 				= "ac_ns_get_silver_reward"; -- 获取银元奖励


MechineConfig.ACTION_NS_REFRESH_ROOMLEVEL 				= "ac_ns_refresh_room_level"; -- 房间level发生变化

MechineConfig.ACTION_NS_REFRESH_READY_STATUS 			= "ac_ns_refresh_ready_status";--隐藏\显示准备状态

MechineConfig.ACTION_NS_JIFEN_CHANGE_SEATE_NOTIFY 		= "ac_ns_jifen_change_seate_notify";--收到换座位的请求
MechineConfig.ACTION_NS_JIFEN_HIDE_CHANGE_SEATE 		= "ac_ns_jifen_hide_change_seate";--隐藏换座按钮
MechineConfig.ACTION_NS_RECEIVE_JIFEM_RECORD 			= "ac_ns_receive_jifen_record";--收到积分房玩牌记录
MechineConfig.ACTION_NS_JIFEN_RECORD_CLICK 				= "ac_ns_jifen_record_click";--点击积分房玩牌记录
MechineConfig.ACTION_JIFEN_STARTGAME 				    = "ac_jifen_startGame";--积分房开始游戏
MechineConfig.ACTION_JIFEN_GAMEOVER 				    = "ac_jifen_gameOver";--积分房结算
MechineConfig.ACTION_JIFEN_FINISHED 					= "ac_jifen_finished";--积分房所有游戏结束
MechineConfig.ACTION_NS_JIFEN_DISMISS 					= "ac_ns_jifen_dismiss";--积分房解散
MechineConfig.ACTION_NS_JIFEN_MASTER					= "ac_ns_jifen_mater";--广播积分房房主
MechineConfig.ACTION_NS_JIFEN_FINISHED_CONTINUE_CLICK 	= "ac_ns_jifen_finished_continue_click";--点击再开一轮
MechineConfig.ACTION_NS_JIFEN_CONTINUE_PLAY 			= "ac_ns_jifen_continue_play";--广播房主再开一轮
MechineConfig.ACTION_NS_JIFEN_SHOW_FINISHED_CONTINUE 	= "ac_ns_jifen_show_finished_continue";--显示再开一轮

MechineConfig.ACTION_NS_REFRESH_PRIVATE_ROOM 			= "ac_ns_refresh_private_room"; -- 刷新私人房信息

MechineConfig.ACTION_NS_RELOGIN_FOR_RECONNECT 			= "ac_ns_relogin_for_reconnect";--游戏开始前网络重连，重新进游戏

MechineConfig.ACTION_NS_RECRUIT_VISIBLE					= "ac_ns_recruit_visible"; -- 是否显示广播邀人按钮
MechineConfig.ACTION_NS_REFRESH_HEADPOS					= "ac_ns_refresh_pos"; -- 刷新头像位置
MechineConfig.ACTION_NS_SHOW_MICROPHONE_OPEN_TIPS		= "ac_ns_show_microphone_open_tips"; -- 显示语音开启提示
MechineConfig.ACTION_NS_SHOW_MICROPHONE_CLOSE_TIPS		= "ac_ns_show_microphone_close_tips"; -- 显示语音关闭提示

MechineConfig.ACTION_NS_RECEIVE_PRIVATEROOMINFO			= "ac_ns_receive_private_roominfo"; -- 刷新私人房的房间信息
MechineConfig.ACTION_NS_SEARCH_PRIVATEROOM				= "ac_ns_search_privite_room"; -- 搜索到私人房
MechineConfig.ACTION_NS_GET_PASSWORD_BY_INFO			= "ac_ns_get_password_by_info";--获取口令
MechineConfig.ACTION_NS_RECEIVE_JIFEN_RECORD_INFO		= "ac_ns_jifen_receive_record_info";--接收积分房记录信息
MechineConfig.ACTION_NS_CLOSE_RECRUITEWND				= "ac_ns_close_recruitwnd";--关闭广播邀人弹框

MechineConfig.ACTION_NS_REFRESH_FRIENDS_LIST 			= "ac_ns_refresh_friends_list";--刷新好友列表信息
--------------------------------------------------------------------------------------------------------------------
MechineConfig.ACTION_REQUEST_ENTER_ONLOOKER 			= "ac_request_onlooker";--请求进入围观
MechineConfig.ACTION_REQUEST_EXIT_ONLOOKER 				= "ac_ns_request_exit_onlooker";--请求退出围观
MechineConfig.ACTION_ENTER_ONLOOKER 					= "ac_enter_onlooker";--进入围观
MechineConfig.ACTION_ENTER_ONLOOKER_SUC 				= "ac_enter_onlooker_suc";--成功进入围观
MechineConfig.ACTION_EXIT_ONLOOKER_SUC 					= "ac_exit_onlooker_suc";--成功退出围观
MechineConfig.ACTION_NS_RECEIVE_ONLOOKER_EXTEND			= "ac_ns_receive_onlooker_extend";--收到进入围观模式的扩展消息
MechineConfig.ACTION_NS_RECEIVE_BARRAGE_MSG 			= "ac_ns_receive_onlooker_barrage_msg";--收到弹幕消息
MechineConfig.ACTION_NS_SHOW_ONLOOKER_DETAIL_INFO 		= "ac_ns_show_onlooker_detail_info";--展示围观者列表和聊天详情
MechineConfig.ACTION_ONLOOKER_LOGIN 					= "ac_ns_onlooker_login";--围观者进入
MechineConfig.ACTION_ONLOOKER_LOGOUT 					= "ac_ns_onlooker_logout";--围观者退出
MechineConfig.ACTION_NS_RECEIVE_SHUTUP 					= "ac_ns_receive_shutup";--禁言通知
MechineConfig.ACTION_NS_BARRAGE_SWITCH_CHANGE 			= "ac_ns_barrage_switch_change";--弹幕开关改变

function MechineConfig.initMechineConfig(config)
	MechineConfig.mechineConfig = Copy(config);
end

return MechineConfig;