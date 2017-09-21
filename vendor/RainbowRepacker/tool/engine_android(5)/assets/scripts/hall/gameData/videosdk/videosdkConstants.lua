VideoSDKConstants = {};

VideoSDKConstants.DICT_NAME = "boyaa_videosdk";

VideoSDKConstants.KEY_APP_ID = "app_id";
VideoSDKConstants.KEY_USER_ID = "user_id";
VideoSDKConstants.KEY_ROOM_ID = "room_id";
VideoSDKConstants.KEY_SUPPORT_2G = "support_2g";
VideoSDKConstants.KEY_VERSION = "version";
VideoSDKConstants.KEY_NETWORK_TIPS = "network_tips";

-- 回调消息
VideoSDKConstants.CMD_UNDEFINE = "cmd_undefine";
VideoSDKConstants.CMD_LOGIN_SUCCESS = "cmd_login_success";
VideoSDKConstants.CMD_LOGIN_FAIL = "cmd_login_fail";
VideoSDKConstants.CMD_MICROPHONE_OPEN = "cmd_microphone_open";
VideoSDKConstants.CMD_MICROPHONE_CLOSE = "cmd_microphone_close";
VideoSDKConstants.CMD_MICROPHONE_OPERATE_FAIL = "cmd_microphone_operate_fail";
VideoSDKConstants.CMD_MICROPHONE_OPEN_ERROR = "cmd_microphone_open_error";
VideoSDKConstants.CMD_USERS_STATUS_CHANGE = "cmd_users_status_change";
VideoSDKConstants.CMD_DIALOG_SHOWING = "cmd_dialog_showing";
VideoSDKConstants.CMD_USER_LEAVE = "cmd_user_leave";

-- 服务器映射
VideoSDKConstants.VERSION_TEST = 2;
VideoSDKConstants.VERSION_PRE_RELEASE = 1;
VideoSDKConstants.VERSION_RELEASE = 0;

VideoSDKConstants.VersionMap = {
	[1] = {VideoSDKConstants.VERSION_TEST, "测试"},
	[2] = {VideoSDKConstants.VERSION_PRE_RELEASE, "预发布"},
	[3] = {VideoSDKConstants.VERSION_RELEASE, "正式"},
	[4] = {VideoSDKConstants.VERSION_TEST, "测试"},
}