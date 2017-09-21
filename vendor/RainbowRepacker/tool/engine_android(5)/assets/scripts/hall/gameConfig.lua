_gameVersion=1000;
_gameName="大厅";
_buildTime="2015-6-16 10:30";--打包时间

 require("hall/gameData/regionConfigDataInterface");
_dependApkVersion = RegionConfigDataInterface.getInstance():getDependApkVersion(); --大厅依赖APK版本号，此处版本号必须apkVersion一致

_States = {   
    Hall          = 100;--程序入口，同gameId
    UserInfo      = 100*1000+1;--大厅/用户信息
    Setting       = 100*1000+3;--大厅/设置
    Recharge      = 100*1000+4;--大厅/商城
    Activity      = 100*1000+6;--大厅/活动
    RankList      = 100*1000+7,--大厅/排名
    -- Bankrupt      = 100*1000+10;--大厅/破产
    Suggestion    = 100*1000+11;
    SafeBox       = 100*1000+13;--大厅/保险箱
    Message       = 100*1000+14; -- 大厅/公告
    AboutUs       = 100*1000+15;--设置/关于我们
    GameHelp      = 100*1000+16;--设置/游戏帮助
    PrivateRoom   = 100*1000+17;--私人房
    Backpack      = 100*1000+18;--背包（新物品箱）
    DiamondShop   = 100*1000+20;--钻石商城
    Community       = 100*1000+23;--社区
    GroupGame     = 100*1000+24;--团队赛
    ShortCutRecharge = 100*1000 + 25; --快捷支付
    
	GameMatchHall	= 100 * 1000 + 26; -- 比赛场

    MoreGames = 100 * 1000 + 27; -- 比赛场
    PrivateMatch = 100 * 1000 + 28;

    AgencyH5          = 100 * 1000 + 29; --代理商系统

    BankruptGuide = 100*1000+30;

    RechargeCard  = 100*1000+31;
    Invitational = 100*1000+32;
    GameMatchRoom = 20000000;
}


_StatesMap =
{
    [_States.Hall]          = {"hall/main/widget/hallState","HallState"};
    [_States.UserInfo]      = {"hall/userInfo/userInfoState","UserInfoState"};
    [_States.Setting]       = {"hall/setting/settingState","SettingState"};
    [_States.Recharge]      = {"hall/recharge/rechargeState","RechargeState"};
    [_States.Activity]      = {"hall/activity/activityState","ActivityState"};
    [_States.RankList]      = {"hall/ranklist/widget/rankState","RankState"};
    [_States.Suggestion]    = {"hall/suggestion/suggestionState","SuggestionState"};
    [_States.Message]       = {"hall/message/messageState","MessageState"};
    [_States.AboutUs]       = {"hall/aboutus/aboutUsState","AboutUsState"};
    [_States.GameHelp]      = {"hall/gameHelp/gameHelpState","GameHelpState"};
    [_States.Backpack]      = {"hall/backpack/backpackState","BackpackState"};
    [_States.DiamondShop]   = {"hall/diamondShop/diamondShopState", "DiamondShopState"};
    [_States.Community]       = {"hall/community/communityState","CommunityState"};
    [_States.GroupGame]     = {"hall/groupGame/groupgameState", "GroupGameState"};
    [_States.ShortCutRecharge] = {"hall/shortCutRecharge/shortCutRechargeState", "ShortCutRechargeState"};
    [_States.PrivateRoom]     = {"hall/privateRoom/privateRoomState","PrivateRoomState"};
    [_States.GameMatchHall]		= {"hall/matchHall/gameMatchHall/gameMatchHallState", "GameMatchHallState"};
    [_States.SafeBox]        = {"hall/safeBox/safeBoxState","SafeBoxState"};
    [_States.MoreGames]        = {"hall/moreGames/moreGamesState","MoreGamesState"};
    [_States.PrivateMatch]        = {"hall/privateMatch/privateMatchState","PrivateMatchState"};
    -- [_States.Bankrupt]         = {"hall/bankrupt/bankruptState","BankruptState"};
    [_States.AgencyH5]        = {"hall/agency/agencyState", "AgencyState"};
    [_States.BankruptGuide] = {"hall/bankruptGuide/bankruptGuideState", "BankruptGuideState"};
    [_States.GameMatchRoom]        = {"games/common2/match/room/matchState", "MatchState"};
    [_States.RechargeCard]      = {"hall/rechargeCard/rechargeCardState","RechargeCardState"};
    [_States.Invitational]        = {"hall/invitational/invitationalState","InvitationalState"};
}