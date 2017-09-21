require("regionConfigCommon");

RegionConfigDataInterface = {};

RegionConfigDataInterface.getInstance = function()
    return RegionConfigDataInterface;
end

--地区appid
RegionConfigDataInterface.getRegionAppId = function(self)
    if self.m_appid then
        return self.m_appid;
    else
        local platform = System.getPlatform();
        local appid = kAndroidAppId;
        if platform == kPlatformIOS then
            appid = kIosAppId;
        end
        self:setRegionAppId(appid);
        return appid;
    end
end
RegionConfigDataInterface.setRegionAppId = function(self, newAppid)
    self.m_appid = newAppid;
    kAppId = self.m_appid;
end

RegionConfigDataInterface.getDependApkVersion = function(self)
    return Region_dependApkVersion;
end

--正式服cdn配置
--Region_OnlineCdn_Url = "http://uchead.static.17c.cn/dfqp/static/site/dongbei.mobile.json";
RegionConfigDataInterface.getRegionOnlineCdnUrl = function(self)
    return Region_OnlineCdn_Url;
end

--正式服ip port配置
RegionConfigDataInterface.getRegionOnlineIpPort = function(self)
    assert(#Region_Online_IpPort > 0, "Region_Online_IpPort  ni empty");
    return Region_Online_IpPort;
end

--[[
    大厅支持的游戏最小版本号
    RegionGamesPlayableConfig = {
        [1] = { ["gameid"] = 203, ["ver"] = 76};  203:游戏id 76:游戏版本号
    }
]]
RegionConfigDataInterface.getRegionGamesPlayableConfig = function(self)
    return RegionGamesPlayableConfig
end

--[[
    地区默认的游戏列表
    Region_default_games_config = {
        [1]={ ["id"]=9, ["game_pkg"]="games/eqs"},
        [2]={ ["id"]=2, ["game_pkg"]="games/scmj"},   
    }
]]
RegionConfigDataInterface.getRegionDefaultGamesConfig = function(self)
    return Region_default_games_config;
end

--默认城市
--RegionText_default_city = "四川"
RegionConfigDataInterface.getRegionDefaultCity = function(self)
    return RegionText_default_city;
end

--产品名称
--RegionText_productName = "四川棋牌"
RegionConfigDataInterface.getRegionProductName = function(self)
    return RegionText_productName;
end

--各游戏版号声明
--RegionText_gamesStatement = "川味斗地主：新出审字[2014]1094号\n　血战到底：新出审字[2014]1094号\n 贰柒拾：新出审字[2015]8号\n 斗地主：新出审字[2013]1094号\n　 马股：新出审字[2015]9号";
RegionConfigDataInterface.getGamesStatement = function(self)
    return RegionText_gamesStatement;
end

--[[
    游戏帮助界面tab和对应的xml文件
    Region_gameHelpHtml_Config = {
        [1] = { ["name"] = "通用", ["fileName"] = "help" };
        [1] = { ["name"] = "贰柒拾", ["fileName"] = "eqs_help" };
    }
]]
RegionConfigDataInterface.getGameHelpHtmlConfig = function(self)
    return Region_gameHelpHtml_Config;
end

--关于中需要显示的tabs和其顺序
--Region_aboutus_tabNames = {"aboutUsView", "agreementView", "privacyView", "versionView"};
RegionConfigDataInterface.getAboutusTabSortedNames = function(self)
    return Region_aboutus_tabNames;
end

--关于中的公司名称
--Region_aboutus_company = "博雅互动 版权所有"
RegionConfigDataInterface.getAboutusCompanyName = function(self)
    return Region_aboutus_company;
end

--关于中的版权名称
--Region_aboutus_copyrightText =  "Copyright(c)2014-2017 Boyaa\nAll Rights Reserved.";
RegionConfigDataInterface.getAboutusCopyrightText = function(self)
    return Region_aboutus_copyrightText;
end

--个人信息是否显示等级经验
-- Region_show_user_level_exp = true
RegionConfigDataInterface.getShowUserLevelExpFlag = function(self)
    return Region_show_user_level_exp;
end

--设置声音文本
--Region_setting_voice_text = "读牌"
RegionConfigDataInterface.getSettingVoiceText = function(self)
    return Region_setting_voice_text;
end

--反馈时间文本
--Region_suggestion_time_text = "牌局时间"
RegionConfigDataInterface.getSuggestionTimeText = function(self)
    return Region_suggestion_time_text;
end

--[[
    反馈参数
    Region_suggestion_paramData = {
        game = "scqp"
        android = "4045";
        ios = "2032"
    }
]]
RegionConfigDataInterface.getSuggestionParams = function(self)
    return Region_suggestion_paramData
end

--联系客服页面的的电话号码是否显示
--Region_show_suggestion_phone_text = true
RegionConfigDataInterface.getShowSuggestionPhoneTextFlag = function(self)
    return Region_show_suggestion_phone_text;
end

--退出游戏界面是否显示今日的银币输赢
--Region_show_exitGame_today_money = true
RegionConfigDataInterface.getShowExitGameTodayMoneyFlag = function(self)
    return Region_show_exitGame_today_money;
end

--video是否支持2G
--Region_video_support_2G = true
RegionConfigDataInterface.getVideoSupport2GFlag = function(self)
    return Region_video_support_2G;
end

--默认破产线
--Region_Default_Bankrupt_Money = 3000;
RegionConfigDataInterface.getDefautBankruptMoney = function(self)
    return Region_Default_Bankrupt_Money;
end

--[[
    分享按钮配置
    Region_default_shareConfig = {
        ["weixinGroup"] = true;
        ["weixinFriend"] = true;
    }
]]
RegionConfigDataInterface.getDefaultShareConfig = function(self)
    return Region_default_shareConfig;
end

--默认客服电话, 如果PHP没返回则采用这个
--Region_default_hotline = "400-663-1888"
RegionConfigDataInterface.getDefaultHotline = function(self)
    return Region_default_hotline;
end

--[[
    解析regionConfig710
    格式为
    local regionConfig710 = {
        xxx
    };
    return regionConfig710;
]]
RegionConfigDataInterface.__parseRegionConfig710 = function(self)
    local config = require("regionConfig710");
    config = type(config) == "table" and config or {};
    for k, v in pairs(config) do
        if _G[k] then
            _G[k] = v; --refresh global variable value
        end
    end
end

--@brief 设置DEBUG开关，业务里面所有的日志都应该是用这个标记进行控制， 包括 lua、ios、android、插件等
RegionConfigDataInterface.setDebugSwitch = function(self, debugSwitch)
    _DEBUG = debugSwitch;
    NativeEvent.getInstance():invokeNativeFunc("refreshPlatformLogSwitch", _DEBUG);
end

RegionConfigDataInterface.getInstance():__parseRegionConfig710();