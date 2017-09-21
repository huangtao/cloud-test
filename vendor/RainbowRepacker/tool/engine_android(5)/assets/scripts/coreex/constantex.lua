

--性别
kSexMale = 1;
kSexFemale = 2;

PROTOCOL_TYPE_BUFFER="BUFFER"
PROTOCOL_TYPE_BY9="BY9"
PROTOCOL_TYPE_BY14="BY14"
PROTOCOL_TYPE_QE="QE"
PROTOCOL_TYPE_TEXAS="TEXAS"
PROTOCOL_TYPE_VOICE="VOICE"
PROTOCOL_TYPE_BY7="BY7"

--SocketProtocal
kProtocalVersion 	= 1;
kProtocalSubversion	= 1;
KClientVersionCode 	= 1024;

--Socket type
kSocketRoom = "room";
kSocketHall	= "hall";

kLuacallEvent="event_call"; -- 原生语言调用lua 入口方法
kcallEvent = "LuaEventCall"; -- 获得 指令值的key
kCallResult="CallResult"; --结果标示  0 -- 成功， 1--失败,2 -- ...
kResultPostfix="_result"; --返回结果后缀  与call_native(key) 中key 连接(key.._result)组成返回结果key
kparmPostfix="_parm"; --参数后缀 

Kwin32Call="gen_guid";

kFBLogin="FBLogin"; -- facebook 登陆
kFBShare="FBShare"; -- facebook 分享
kFBLogout="FBLogout" -- facebook 退出
kGuestZhLogin="GuestZhLogin"; -- 简体游客 登陆
kGuestZwLogin="GuestZwLogin"; -- 繁体游客 登陆
kGuestLogout="GuestLogout" -- 游客 退出
kSinaLogin="SinaLogin"; -- 新浪 登陆
kSinaShare="SinaShare"; -- 新浪 分享
kSinaLogout="SinaLogout" -- 新浪 退出
kQQConnectLogin="QQConnectLogin"; -- QQ互联 登陆
kQQConnectLogout="QQConnectLogout" -- QQ互联 退出
kRenRenLogin="RenRenLogin"; --人人 登陆
kRenRenShare="RenRenShare"; -- 人人 分享
kRenRenLogout="RenRenLogout" -- 人人 退出
kKaiXinLogin="KaiXinLogin"; -- 开心 登陆
kKaiXinLogout="KaiXinLogout" -- 开心 退出
-----------------------------------------------------------------------------------

------------------------------------Language---------------------------------------
kZhCNLang="zh_CN";
kZhLang="zh";
kZhTW="zh_TW";
kZhHKLang="zh_HK";
kEnLang="en";
kFRLang="fr_FR";
-----------------------------------------------------------------------------------

------------------------------------Android Keys-----------------------------------
kBackKey="BackKey";
kHomeKey="HomeKey";
kEventPause="EventPause";
kEventResume="EventResume";
kExit="Exit";
-----------------------------------------------------------------------------------



-------------------------------------Sound-----------------------------------------
ksetBgSound = "setBgSound"; -- 设置音效 
kbgSoundsync="bgSound__sync";--设置音效数据 key
ksetBgMusic = "setBgMusic"; -- 设置音乐
kbgMusicsync="bgMusic__sync";-- 设置音乐数据 key
kPreloadSound="preloadSound";-- 预加载声音
-----------------------------------------------------------------------------------



-------------------------------------Android Update version------------------------
kVersion_sync="Version_sync"; -- 获得android 版本 
kversionCode  = "versionCode"; -- 获得android versionCode  数据 key
kversionName  = "versionName"; --  获得android versionName  数据 key
kupdateVersion ="updateVersion"; -- 更新版本
kupdateUrl = "updateUrl"; -- 设置更新版本数据 key
