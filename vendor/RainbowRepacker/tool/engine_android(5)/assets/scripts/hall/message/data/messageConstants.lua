MessageConstants = {};

MessageConstants.TIME_LIMIT = 90 * 24 * 60 * 60;    --消息最长存90天
MessageConstants.SIZE_LIMIT = 50;                   --最多存50条

MessageConstants.ANNOUNCE_ID = "-1";

MessageConstants.eMsgType = {
    TEXT        = "0",
    AWARD       = "1",
    ANNOUNCE    = "-1",
    QRCODE      = "2",
};

MessageConstants.eAwardStatus = {
    GOT         = 1,
    NOT_GOT     = 0,
};

MessageConstants.eMsgStatus = {
	CLOSE  = 0,
	OPENED = 1,
	READED = 2,
};

MessageConstants.text = 
{
    AWARD_TIPS          = "请在三个月内领取物品",
    TEXT_DOUBLE_SPACE   = "        ",
    AWARD_GET_SUCCESS   = "领取成功",
    NO_MESSAGE          = "暂无系统消息",
    LOADING_TIPS        = "领取中...",
    AWARD_COUNT_TEXT    = "X",
};
