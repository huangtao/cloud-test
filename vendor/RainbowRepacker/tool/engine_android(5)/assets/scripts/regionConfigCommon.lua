
--[[
    不同地区大厅配置差异列表
    xBuild会根据XML文件来修改这里面的值，以适应不同的地区

    WARNING WARNING 
    切记不可以直接访问此处的变量切记不可以直接访问此处的变量

    1、配置如何更新(添加|删除)
        1.1 添加  每个版本更新时，如果需要新添加配置
            step1:在regionConfigCommon中添加此变量名(以Region为开头)，并附加详细的注释
            step2:在regionConfigDataInterface中添加接口供外部访问
            step3:如果此变量游戏需要进行访问，则需要在regionConfigIsolater中也添加接口
            step4:在打包工具后台 http://tools.oa.com/?c=config&m=show 进行配置

        1.2：删除 版本更新时，如果老的配置不再需要时(切记需要确认清楚，尤其是涉及到子游戏时)
            step1:在regionConfigCommon中删除此变量
            step2:在regionConfigDataInterface中对接口进行兼容处理(格式、变量都需要保持一致)
            step3:在打包工具后台 http://tools.oa.com/?c=config&m=show 进行修改配置

    2、配置如何访问
        2.1 大厅访问此配置，应该通过regionConfigDataInterface接口进行访问
        2.2 子游戏访问此配置，应该通过regionConfigIsolater接口进行访问

--]]

--全局测试开关, 用于日志|临时测试等(此变量允许全局访问)
--当_DEBUG开关为true时，此时UMENG号则设置为552c8f28fd98c54c18000149(打包后台自动处理)
_DEBUG = true;

--android & win32平台appid
kAndroidAppId = 103000;

--ios平台appid
kIosAppId = 101000;

-------------------------------------非常重要的配置，新建地区的时候必须要进行配置--------------------

--与游戏内gameConfig区别:大厅依赖的APK的版本号
Region_dependApkVersion = "2.3.0.0";

--正式服CDN配置，地区接入时需要找PHP获取
Region_OnlineCdn_Url = "http://uchead.static.17c.cn/dfqp/static/site/sichuan.mobile.json";

--正式服 ip port 
Region_Online_IpPort = {
    {ip="access.yunnangames.com", port=7000};
    {ip="access.yunnangames.com", port=7000};
    {ip="access.sichuanyouxi.com", port=7000};
    {ip="access.sichuanyouxi.com", port=7000};
    {ip="access.shandonggames.com", port=7000};
    {ip="access.shandonggames.com", port=7000};
    {ip="access.shandonggames.com", port=7000};
    {ip="access.shandonggames.com", port=7000};
    {ip="106.14.55.74", port=7000};
    {ip="59.110.90.152", port=7000};
}


--[[
    大厅支持的游戏最小版本号
    RegionGamesPlayableConfig = {
        [1] = { ["gameid"] = 203, ["ver"] = 76};  203:游戏id 76:游戏版本号
    }
]]
RegionGamesPlayableConfig = {};

--[[
    地区默认的游戏列表
    Region_default_games_config = {
        [1]={ ["id"]=9, ["game_pkg"]="games/eqs"},
        [2]={ ["id"]=2, ["game_pkg"]="games/scmj"},   
    }
]]
Region_default_games_config = {};

--默认城市
RegionText_default_city = "四川" 

--产品名称
RegionText_productName = "四川棋牌"; 

--各游戏版号声明
RegionText_gamesStatement = "川味斗地主：新出审字[2014]1094号\n　血战到底：新出审字[2014]1094号\n 贰柒拾：新出审字[2015]8号\n 斗地主：新出审字[2013]1094号\n　 马股：新出审字[2015]9号";

--[[
    游戏帮助界面tab和对应的xml文件
    Region_gameHelpHtml_Config = {
        [1] = { ["name"] = "通用", ["fileName"] = "help" };
        [1] = { ["name"] = "贰柒拾", ["fileName"] = "eqs_help" };
    }
]]
Region_gameHelpHtml_Config = {}

--[[
    反馈参数
    Region_suggestion_paramData = {
        game = "scqp"
        android = "4045";
        ios = "2032"
    }
]]
Region_suggestion_paramData = {   
    game = "scqp";
    android = "4045";
    ios = "2032"
};

--[[
    分享按钮配置
    Region_default_shareConfig = {
        ["weixinGroup"] = true;
        ["weixinFriend"] = true;
    }
]]
Region_default_shareConfig = {
    weixinGroup = true;
    weixinFriend = true;
};


--默认客服电话, 如果PHP没返回则采用这个
Region_default_hotline = "400-663-1888";


-------------------------------------------非常规配置项----------------------------

--关于中需要显示的tabs和其顺序
Region_aboutus_tabNames = {"aboutUsView", "agreementView", "privacyView", "versionView"};

--关于中的公司名称
Region_aboutus_company = "博雅互动 版权所有";

--关于中的版权名称
Region_aboutus_copyrightText = "Copyright(c)2014-2017 Boyaa\nAll Rights Reserved.";

--个人信息是否显示等级经验
Region_show_user_level_exp = true;

--设置声音文本
Region_setting_voice_text = "读牌"

--反馈时间文本
Region_suggestion_time_text = "牌局时间";

--联系客服页面的的电话号码是否显示
Region_show_suggestion_phone_text = true;

--退出游戏界面是否显示今日的银币输赢
Region_show_exitGame_today_money = true;

--video是否支持2G
Region_video_support_2G = false;

--默认破产线
Region_Default_Bankrupt_Money = 3000; -- 默认破产线，因为四川的特殊性，加了这个字段
