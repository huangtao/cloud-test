PasswordConstants = {};

-- 口令类型
PasswordConstants.TYPE_EMPTY = 0; -- 空口令
PasswordConstants.TYPE_MATCH = 1; -- 比赛
PasswordConstants.TYPE_PRIVATE_ROOM = 2; -- 私人房
PasswordConstants.TYPE_ADD_FRIENDS = 3;  -- 加好友
PasswordConstants.TYPE_MATCH_INVITE = 4; -- 邀请赛

-- 口令过滤类型
PasswordConstants.TYPE_FILTER_USER = 0;	-- 过滤自己
PasswordConstants.TYPE_FILTER_NONE = 1; -- 不过滤

-- 口令来源类型
PasswordConstants.TYPE_SOURCE_CLIPBOARD = 0; -- 剪贴板
PasswordConstants.TYPE_SOURCE_HTML = 1; -- HTML
PasswordConstants.TYPE_SOURCE_QR = 2; -- 二维码

-- 口令码解析类型
PasswordConstants.TYPE_ANALYSE_CODE_BY_PHP = 0; -- 通过php解析口令码
PasswordConstants.TYPE_ANALYSE_CODE_BY_CUSTOM = 1; -- 自定义解析口令码

-- 口令弹框类型
PasswordConstants.TYPE_VIEW_WITHOUT_CONTENT = 0; -- 不显示弹框内容
PasswordConstants.TYPE_VIEW_WITH_CONTENT = 1; -- 显示弹框内容

-------------------------------------------------------------------------------------------------------
-- 口令类型配置
PasswordConstants.typeConfig = {
    [PasswordConstants.TYPE_EMPTY] = {path = "hall/password/type/passwordTypeObjectEmpty"};
    [PasswordConstants.TYPE_MATCH] = {path = "hall/password/type/passwordTypeObjectMatch"};
    [PasswordConstants.TYPE_PRIVATE_ROOM] = {path = "hall/password/type/passwordTypeObjectPrivateRoom"};
    [PasswordConstants.TYPE_ADD_FRIENDS] = {path = "hall/password/type/passwordTypeObjectAddFriends"};
    [PasswordConstants.TYPE_MATCH_INVITE] = {path = "hall/password/type/passwordTypeObjectMatchInvite"};
}

-- 口令版本配置
PasswordConstants.versionConfig = {
	[PasswordConstants.TYPE_EMPTY] = 0,
	[PasswordConstants.TYPE_MATCH] = 0,
    [PasswordConstants.TYPE_PRIVATE_ROOM] = 1,
    [PasswordConstants.TYPE_ADD_FRIENDS] = 0,
    [PasswordConstants.TYPE_MATCH_INVITE] = 0,
}

-- 口令过滤类型配置
PasswordConstants.filterConfig = {
	[PasswordConstants.TYPE_SOURCE_CLIPBOARD] = {
		[PasswordConstants.TYPE_EMPTY] = PasswordConstants.TYPE_FILTER_USER,
		[PasswordConstants.TYPE_MATCH] = PasswordConstants.TYPE_FILTER_NONE,
	    [PasswordConstants.TYPE_PRIVATE_ROOM] = PasswordConstants.TYPE_FILTER_USER,
	    [PasswordConstants.TYPE_ADD_FRIENDS] = PasswordConstants.TYPE_FILTER_USER,
	    [PasswordConstants.TYPE_MATCH_INVITE] = PasswordConstants.TYPE_FILTER_USER,
	},
	[PasswordConstants.TYPE_SOURCE_HTML] = {
		[PasswordConstants.TYPE_EMPTY] = PasswordConstants.TYPE_FILTER_USER,
		[PasswordConstants.TYPE_MATCH] = PasswordConstants.TYPE_FILTER_NONE,
    	[PasswordConstants.TYPE_PRIVATE_ROOM] = PasswordConstants.TYPE_FILTER_NONE,
    	[PasswordConstants.TYPE_ADD_FRIENDS] = PasswordConstants.TYPE_FILTER_USER,
    	[PasswordConstants.TYPE_MATCH_INVITE] = PasswordConstants.TYPE_FILTER_NONE,
	},
	[PasswordConstants.TYPE_SOURCE_QR] = {
		[PasswordConstants.TYPE_EMPTY] = PasswordConstants.TYPE_FILTER_USER,
		[PasswordConstants.TYPE_MATCH] = PasswordConstants.TYPE_FILTER_NONE,
    	[PasswordConstants.TYPE_PRIVATE_ROOM] = PasswordConstants.TYPE_FILTER_NONE,
    	[PasswordConstants.TYPE_ADD_FRIENDS] = PasswordConstants.TYPE_FILTER_USER,
    	[PasswordConstants.TYPE_MATCH_INVITE] = PasswordConstants.TYPE_FILTER_NONE,
	}
}

-- 口令解析配置
PasswordConstants.analyseConfig = {
	[PasswordConstants.TYPE_EMPTY] = PasswordConstants.TYPE_ANALYSE_CODE_BY_PHP;
	[PasswordConstants.TYPE_MATCH] = PasswordConstants.TYPE_ANALYSE_CODE_BY_CUSTOM,
	[PasswordConstants.TYPE_PRIVATE_ROOM] = PasswordConstants.TYPE_ANALYSE_CODE_BY_PHP;
	[PasswordConstants.TYPE_ADD_FRIENDS] = PasswordConstants.TYPE_ANALYSE_CODE_BY_PHP;
	[PasswordConstants.TYPE_MATCH_INVITE] = PasswordConstants.TYPE_ANALYSE_CODE_BY_PHP;
}

-- 口令解析文字提示配置
PasswordConstants.analyseTipsConfig = {
	[PasswordConstants.TYPE_EMPTY] = kTextPasswordTips;
	[PasswordConstants.TYPE_PRIVATE_ROOM] = "正在进入房间";
	[PasswordConstants.TYPE_ADD_FRIENDS] = kTextPasswordTips;
	[PasswordConstants.TYPE_MATCH_INVITE] = "正在进入邀请赛，请稍候...";
}

-- 口令弹框配置
PasswordConstants.viewConfig = {
	[PasswordConstants.TYPE_EMPTY] = PasswordConstants.TYPE_VIEW_WITH_CONTENT,
	[PasswordConstants.TYPE_MATCH] = PasswordConstants.TYPE_VIEW_WITHOUT_CONTENT,
    [PasswordConstants.TYPE_PRIVATE_ROOM] = PasswordConstants.TYPE_VIEW_WITHOUT_CONTENT,
    [PasswordConstants.TYPE_ADD_FRIENDS] = PasswordConstants.TYPE_VIEW_WITH_CONTENT,
    [PasswordConstants.TYPE_MATCH_INVITE] = PasswordConstants.TYPE_VIEW_WITHOUT_CONTENT,
}

