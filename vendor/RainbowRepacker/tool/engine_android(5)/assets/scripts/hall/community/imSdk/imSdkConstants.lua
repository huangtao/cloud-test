
ImSdkConstants = {};

--@brief 返回类型
--note 用于映射调用sdk时，sdk的返回值类型
ImSdkConstants.eReturnType = {
    TYPE_OK                 = 1; --返回成功
    TYPE_ERROR              = -1; --返回失败
    -- ...
}

--@brief 协议id
--note 用于映射sdk返回的数据是对应哪个接口
ImSdkConstants.eProtoId = {
    INIT                    = 0;    --初始化成功
    LOGIN                   = 1;    --登录返回
    GET_FRIEND_LIST         = 2;    --好友列表
    SEND_TEXT_OR_VIDEO      = 3;    --发送文本、语音
    ADD_FRIEND              = 4;    --添加好友
    DELETE_FRIEND           = 5;    --删除好友
    HANDLE_ADD_FRIEND       = 6;    --处理添加好友信息
    GET_VIDEO_INFO          = 7;    --获取音频信息
    MATCH_CONTACT_FRIEND    = 8;    --匹配通信录
    GET_FRIEND_INFO         = 9;    --获取指定人信息
    GET_NEARBY_LIST         = 10;   --获取附近的人
    PUSH_FRIEND_LIST        = 11;   --服务器推送好友列表
    PUSH_ONLINE_OFFLINE     = 12;   --推送好友上下线消息
    PUSH_TEXT_MESSAGE       = 13;   --推送文本消息
    PUSH_VIDEO_MESSAGE      = 14;   --推送语音消息
    PUSH_ADD_FRIEND_MSG     = 15;   --推送添加好友消息
    PUSH_DEL_FRIEND_MSG     = 16;   --推送删除好友消息
    PUSH_ADD_FRIEND_RESULT  = 17;   --推送加好友消息结果
    PUSH_KICKOUT_MSG        = 18;   --推送踢人消息
    PUSH_OFFLINE_MSG_OR_VIDEO= 19;   --推送离线文本语音消息  
    PUSH_OFFLINE_ADD_FRIEND  = 20;   --推送离线被加好友消息  offline
    PUSH_NEW_FRIEND_INFO     = 21;   --推送新的朋友消息
    GET_MAYBE_FAMILIAR       = 22;   --获取可能认识的人
    INVITEFRIEND             = 23;   --邀请好友
    PUSH_INVITEFRIEND        = 24;   --推送好友邀请   
    PUSH_INVITED_ANSWER = 26; -- 邀请回复回调
    PUSH_INVITED_RESULT = 27; -- 通知被邀请人对方回复结果
    SEND_PROXY_MESSAGE = 28; --自定义消息透传
    -- ...
}

ImSdkConstants.sendMsgType = {
    SEND_TYPE  = 1,--发送
    RECV_TYPE  = 2,--接受
}

ImSdkConstants.msgType = {
    TEXT   = 1,--文本
    AUDIO   = 2,--语音
    PIC  = 3,--图
    FRIEND = 4,--好友
}

ImSdkConstants.HandleFriendRequestType = {
    AGREE = 1; --同意
    REFUSE = 2; --拒绝
}

ImSdkConstants.msgStatus = {
    SUCC_SEND    = 1,--发送成功
    SENDING    = 2,--消息发送中
    FAILED_SEND   = 3,--发送失败
    UNOPERATE  = 4,--好友未操作
    REFUSE  =5,--拒绝
}

ImSdkConstants.msgReaded = {
    READED   = 1,--已读
    UNREADED  = 2,--未读
}


--和java交互协议
ImSdkConstants.kImSdkJavaResultCallBack = "kImSdkResultCallBack";
ImSdkConstants.kImSdkIosResultCallBack  = "kImSdkOpenGpsResultCallBack";

--im java回调lua 命令字
ImSdkConstants.eCmds = {
    IMSDK_CMD_PLAY_AUDIO_FINISH = 1;
    IMSDK_CMD_RECORD_AUDIO_FINISH = 2;
}

ImSdkConstants.dict =  {
    DICT_NAME       = "boyaa_imsdk";
    KEY_COORD       = "coordinate";
    KEY_CONTRACTS   = "contracts";
    KEY_SESSIONID   = "sessionidPath";
    KEY_AUDIOPATH   =  "audioPath";
}

ImSdkConstants.fromInvite = {
    MATCH = 1,
    PRIVATE_ROOM = 2,
}

ImSdkConstants.eFriendApplyOp = {
    AGREE = 1;
    REFUSE = 2;
}

ImSdkConstants.eAddFriendType = {
    AUTO = "password",
}

ImSdkConstants.eInviteFriendErrorType = {
    GAME_PLAYING = "game_playing"
}

--透传消息的类型
ImSdkConstants.eProxyMessageType = {
    ANSWER_FRIEND_REQUEST = 1;--回复加好友
    ROB_RED_ENVELOPE = 3;--抢红包/回复抢红包结果
    BROAD_NEW_RED_ENVELOPE = 4; --广播有新红包到来
    NOTIFY_RED_ENVELOP_BLESS = 5; --当别人抢了我的红包时，广播祝福语
}

--toast 显示时间
ImSdkConstants.toastDisplayTime = 500;

--消息列表最大数量
ImSdkConstants.msgListMaxNum = 50;
--好友之间会话聊天
ImSdkConstants.friendChatListMaxNum = 100;

