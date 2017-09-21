LoginConstants = {};

--用户登录方式
LoginConstants.loginType = {
 	Token = 1;
 	Acount = 2;
 	BoyaaPassportResetPsd = 3;--博雅通行证重置密码
 	Notoken = 4;
 	BoyaaPassportRegister=5;--博雅通行证注册
 	BoyaaPassportLogin   =6;--博雅通行证登录
 	TaobaoLogin = 10; --淘宝账号登录
 	Qihu360Login = 11; --360账号登录
 	HeYouXiLogin = 12; --移动基地联运(和游戏)
 	AiYouXiLogin = 13; --爱游戏联运
 	HuaWeiLogin  = 14; --华为登录
};

--用户类型
LoginConstants.uType = 
{	
	None = -1;--没有登录过
	Guest = 1;--游客登录
	BoyaaPassport = 2;--博雅通行证
	Sina = 3;--新浪/微游戏
	Tencent = 4;--腾讯
	Taobao  = 5;--淘宝
	Qihu360 = 6;--360
	HeYouXi = 7;--移动基地联运(和游戏)
	AiYouXi = 8;--爱游戏
	HuaWei  = 9;--华为
};

--注册错误码
LoginConstants.eRegisterErr = {
	NoSimCard = -1; --没有sim卡
	Registered = 1031; --已经注册过了
};

--踢人错误码
LoginConstants.eKickoutErr = {
	ERR_BACKSTAGE_DISABLE_ACCOUNT = 1003; --封号
	ERR_MULTILOGIN = 1072; --同一账号不同地区登陆
    ERR_KICKOUT = 1073;  --踢人  
};

LoginConstants.eLoginFailErr = {
	ERR_MOVE_SERVER = 1004; --server迁服
	ERR_FOBID_GUEST_LOGIN = 1051; --禁止游客账号登录
	ERR_FORBID_VIRTUAL_MACHINE_LOGIN = 1070; --禁止模拟器登录
    ERR_STOP_SERVER = 1; --停服
    ERR_DISABLE_ACCOUNT= 1003; --账号被封
}

--验证码类型
LoginConstants.eVerifyCodeType = {
	VerifyCodeFailed = 1026; --验证码发送失败
	Register = 1027; --注册验证码
	ResetPswd = 1028; --重置短信验证码
};

--玩家登录状态
LoginConstants.eLoginState = {
	None = 0; 			--没登录
	Logining = 1;		--正常登录中
	Switching = 2;		--切换账户中
	LoginSuccess = 3;	--登录成功
	LoginFailed = 4;	--登录失败
	Offline = 5;		--网络断线
	Kicked = 6;			--被踢出房间
	MultiDeviceLogin = 7;	--异地登录
	PhpKickout = 8;      --在后台管理页上被踢
	SessionTimeOut = 9;  --会话超时
	ServerStop = 10;      --server停服
	DisableAccount = 1003;	--账户被禁用了
	ForbidGuestLogin = 1051; --禁止游客登录
};


---------------------------错误上报定义值----------------
--登录错误类型
LoginConstants.eLoginError = {
	ERR_DOMAIN_UNKNOWN = 1;		-- 1 域名无法解析
	ERR_CONNECT_FAIL = 2;		-- 2 服务器连接失败
	ERR_TIME_OUT = 3;			-- 3 服务器无响应或超时
	ERR_RETURN_DATA = 4;		-- 4 服务器返回错误 
	ERR_CLIENT_ERR = 5;			-- 5 客户端错误
};

LoginConstants.eServerError = {
	SER_ERR_CONNECT_FAIL = 1;-- 2 服务器连接失败
	SER_ERR_LOGIN_TIME_FAIL = 2;-- 3 登录PHP失敗
	SER_ERR_LOGIN_TIME_OUT = 3;-- 3 登录PHP失败
	SER_ERR_RETURN_DATA = 4;-- 4 服务器返回错误
	SER_ERR_CLIENT_ERR = 5;-- 5 客户端数据错误	
};

--弹注册绑定框几种情况
LoginConstants.eBindingGuideType = {
    MORE_COIN_OR_GOLD = 1;
    RECHARGE_SUCCESS  = 2;
    SEND_WORLD_SUONA  = 3;
    MALL_EXCHANGE     = 4;
    INVITATIONAL      = 5; 
};