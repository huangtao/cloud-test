MatchMechineConfig = {};

MatchMechineConfig.STATUS_NONE = "match_status_none"; --非比赛中
MatchMechineConfig.STATUS_LOADING = "match_status_loading"; --报名成功到比赛开始的等待阶段
MatchMechineConfig.STATUS_PLAYING = "match_status_playing"; --游戏阶段
MatchMechineConfig.STATUS_WAITING = "match_status_waiting";--赛间等待
MatchMechineConfig.STATUS_FINISH = "match_status_finish";--比赛结束
MatchMechineConfig.STATUS_RECONNECT	= "match_status_reconnect"; --比赛重连中
MatchMechineConfig.STATUS_ONLOOKER = "match_status_onlooker";--比赛旁观

MatchMechineConfig.STATUS_WAITING_GAMEOVER = "match_status_waiting_gameover";
MatchMechineConfig.STATUS_WAITING_ROUNDOVER = "match_status_waiting_roundover";
MatchMechineConfig.STATUS_WAITING_REVIVE = "match_status_waiting_revive";
MatchMechineConfig.STATUS_WAITING_TABLE = "match_status_waiting_table";
MatchMechineConfig.STATUS_WAITING_FINISH = "match_status_waiting_finish";
----------------------------------------------------------------------------------------------------------------------
MatchMechineConfig.ACTION_RESET = "match_ac_reset"; -- 重置
MatchMechineConfig.ACTION_RECONNECT = "match_ac_reconnect";--重连比赛

MatchMechineConfig.ACTION_SIGNUP_SUCCESS = "match_ac_signup_success";--报名成功
MatchMechineConfig.ACTION_SIGNUP_FAIL = "match_ac_signup_fail";--报名失败
MatchMechineConfig.ACTION_SIGNUP_XIANSHI_SUCCESS = "match_ac_signup_xianshi_success";--定时赛报名成功，但还未到入场时间
MatchMechineConfig.ACTION_NOT_ENOUGH_PROP = "match_ac_not_enough_prop";--参数券不足
MatchMechineConfig.ACTION_EXIT_SUCCESS = "match_ac_exit_success";--退赛成功
MatchMechineConfig.ACTION_EXIT_FAIL = "match_ac_exit_fail";--退赛失败
MatchMechineConfig.ACTION_GET_PLAYER_COUNT = "match_ac_get_player_count";--收到比赛报名人数
MatchMechineConfig.ACTION_START = "match_ac_start";--比赛开始
MatchMechineConfig.ACTION_GET_STAGE_POS = "match_ac_get_stage_pos";--比赛阶段信息(当前第几阶段)
MatchMechineConfig.ACTION_GET_STAGE_INFO = "match_ac_get_stage_info";--比赛阶段信息(当前第几轮第几局)
MatchMechineConfig.ACTION_GET_BASECHIP_INFO = "match_ac_get_baseChip_Info"; --底注信息
MatchMechineConfig.ACTION_GET_TABLE_INFO = "match_ac_get_table_info";--排名信息
MatchMechineConfig.ACTION_GET_PLAYER_SCORE = "match_ac_get_player_score";--收到玩家积分
MatchMechineConfig.ACTION_WAIT_TABLE = "match_ac_wait_table";-- 等待配桌
MatchMechineConfig.ACTION_GAME_OVER = "match_ac_game_over";--每局游戏结束模拟发一个等待动作
MatchMechineConfig.ACTION_ROUND_OVER = "match_ac_round_over";--轮结束
MatchMechineConfig.ACTION_FINISH = "match_ac_finish";--比赛结束
MatchMechineConfig.ACTION_FINISH_REWARD = "match_ac_finish_reward";--比赛结束发奖
MatchMechineConfig.ACTION_GET_REVIVE_NOTIFY = "match_ac_get_revive_notify";--收到复活赛通知
MatchMechineConfig.ACTION_GET_REVIVE_RESULT = "match_ac_get_revive_result";--请求复活回复--不再使用，用成功和失败代替
MatchMechineConfig.ACTION_REVIVE_SUCCESS = "match_ac_revive_success";--复活成功
MatchMechineConfig.ACTION_REVIVE_FAILED = "match_ac_revive_failed";--复活失败
MatchMechineConfig.ACTION_ENTER_ONLOOKER = "match_ac_enter_onlooker";--开始旁观
MatchMechineConfig.ACTION_EXIT_ONLOOKER = "match_ac_exit_onlooker";--结束旁观

MatchMechineConfig.ACTION_GET_CHAT_MSG = "match_ac_get_chat_msg";--收到聊天信息
MatchMechineConfig.ACTION_REQUEST_RANK_DETAIL = "match_ac_request_rank_detail";--请求比赛排行榜详情
MatchMechineConfig.ACTION_GET_RANK_DETAIL = "match_ac_get_rank_detail";--收到比赛排行榜详情
MatchMechineConfig.ACTION_SHOW_RULE_VIEW = "match_ac_show_rule_view";
MatchMechineConfig.ACTION_HIDE_RULE_VIEW = "match_ac_hide_rule_view";
MatchMechineConfig.ACTION_GET_RULE_INFO = "match_ac_get_rule_info";
MatchMechineConfig.ACTION_GET_ENTER_NOTIFY = "match_ac_get_enter_notify";--定时赛入场通知

MatchMechineConfig.ACTION_REQUEST_EXIT = "match_ac_request_exit";--请求退赛
MatchMechineConfig.ACTION_REQUEST_RECONNECT_INGAME = "match_ac_request_reconnect_in_game";--请求比赛中的重连

MatchMechineConfig.ACTION_NS_FORCE_EXIT = "match_ns_force_exit";--强制退出游戏
MatchMechineConfig.ACTION_NS_SHOW_FAIL_TIPS = "match_ns_show_fail_tips";--展示开赛失败提示
MatchMechineConfig.ACTION_NS_RANK_REWARD_CLICK = "match_ns_rank_reward_click";--点击比赛排行榜奖励
--------------------------------------------------------------------------------------------------------------
MatchMechineConfig.ACTION_ANIM_MATCH_START = "match_anim_match_start"; -- 开始比赛动画
MatchMechineConfig.ACTION_ANIM_MATCH_FUSAI = "match_anim_match_fusai"; -- 复赛动画
MatchMechineConfig.ACTION_ANIM_MATCH_JUESAI = "match_anim_match_juesai"; -- 决赛动画
MatchMechineConfig.ACTION_ANIM_MATCH_TAOTAI = "match_anim_match_taotai"; -- 淘汰动画
MatchMechineConfig.ACTION_ANIM_MATCH_START_COUNTDOWN = "match_anim_match_start_countdown";--比赛开始倒计时动画
--------------------------------------------------------------------------------------------------------------
MatchMechineConfig.ACTION_CREATE_MATCH_VIEWS = "match_ac_create_views";--创建view
MatchMechineConfig.VIEW_EXIT = "match_view_exit";--退出页面
MatchMechineConfig.VIEW_LOADING = "match_view_loading";--赛前等待
MatchMechineConfig.VIEW_GAMEOVER = "match_view_gameover";--局结束
MatchMechineConfig.VIEW_ROUNDOVER = "match_view_roundover";--轮结束
MatchMechineConfig.VIEW_REVIVE = "match_view_revive";--复活
MatchMechineConfig.VIEW_OVER = "match_view_over";--比赛结束
MatchMechineConfig.VIEW_WAIT_TABLE = "match_view_wait_table";--配桌等待
MatchMechineConfig.VIEW_FAIL_TIPS = "match_view_fail_tips";--开赛失败提示
MatchMechineConfig.VIEW_RANK_REWARD = "match_view_rank_reward";--比赛排行榜奖励页面
MatchMechineConfig.VIEW_RULE = "match_view_rule";--比赛赛制页面
MatchMechineConfig.ACTION_RELEASE_MATCH_VIEWS = "match_ac_release_views";--释放view
--------------------------------------------------------------------------------------------------------------
MatchMechineConfig.NOTIFY_STATUS = "match_notify_status";--广播状态更新
MatchMechineConfig.NOTIFY_ACTION = "match_notify_action";--广播动作更新