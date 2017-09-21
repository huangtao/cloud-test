--[[
    Engine从2.x升级到3.x时，顺带升级了编辑器, 导致出现了一些兼容性问题，本文件主要是解决pin图文件的引用以及layout文件的引用

    差异点:
    拼图文件差异点：
    1、新编辑器生成的拼图文件返回值是local变量，其文件存放位置在scripts/qnFiles/qnPlist目录下
    2、由于games中存在common & common2 2个框架，导致某些拼图对应了2个拼图文件(分别在common和common2里面，其变量名也不一致)。

    布局文件差异点:
    1、升级到Engine3.x后，生成的布局文件默认采用的是local变量，但因为担心子游戏引用到公共房间内的布局文件，所以目前策略是
        大厅内的布局文件采用local变量，games下面的布局文件采用全局变量，但也会return这个变量。交由游戏内部去进行排期，将其逐步改过来。

    本文件会在进入房间时(GameManager.startGame)进行引用，每次启动只会引用一次。
]]


package.preload["games/common/animation/animEgg_pin"] = function()
    animEgg_pin_map = require("qnFiles/qnPlist/games/animEgg_pin2");
    animEgg_pin_map2 = animEgg_pin_map;
    return animEgg_pin_map;
end
package.preload["games/common/animation/animEgg_pin2"] = package.preload["games/common/animation/animEgg_pin"];
require("games/common/animation/animEgg_pin");



package.preload["games/common/animation/animRose_pin"] = function()
    animRose_pin_map = require("qnFiles/qnPlist/games/animRose_pin2");
    animRose_pin_map2 = animRose_pin_map;
    return animRose_pin_map;
end
package.preload["games/common/animation/animRose_pin2"] = package.preload["games/common/animation/animRose_pin2"];
require("games/common/animation/animRose_pin");


package.preload["games/common/animation/animSlippers_pin"] = function()
    animSlippers_pin_map = require("qnFiles/qnPlist/games/animSlippers_pin2");
    animSlippers_pin_map2 = animSlippers_pin_map;
    return animSlippers_pin_map;
end
package.preload["games/common/animation/animSlippers_pin2"] = package.preload["games/common/animation/animSlippers_pin"];
require("games/common/animation/animSlippers_pin");


package.preload["games/common/animation/animSocialBomb_pin"] = function()
    animSocialBomb_pin_map = require("qnFiles/qnPlist/games/animSocialBomb_pin2");
    animSocialBomb_pin_map2 = animSocialBomb_pin_map;
    return animSocialBomb_pin_map;
end
package.preload["games/common/animation/animSocialBomb_pin2"] = package.preload["games/common/animation/animSocialBomb_pin"];
require("games/common/animation/animSocialBomb_pin");


package.preload["games/common/animation/coin_rotate_pin"] = function()
    coin_rotate_pin_map = require("qnFiles/qnPlist/games/coin_rotate_pin");
    return coin_rotate_pin_map;
end
package.preload["games/common/animation/coin_rotate_pin_small"] = package.preload["games/common/animation/coin_rotate_pin"];
require("games/common/animation/coin_rotate_pin");


package.preload["games/common/animation/highest_score_num_pin"] = function()
    highest_score_num_pin_map = require("qnFiles/qnPlist/games/highest_score_num_pin");
    return highest_score_num_pin_map;
end
package.preload["games/common/animation/highest_score_num_pin_small"] = package.preload["games/common/animation/highest_score_num_pin"];
require("games/common/animation/highest_score_num_pin");


-- package.preload["games/common/gameChat/chatExpression_pin"] = function()
--     chatExpression_pin_map = require("qnFiles/qnPlist/games/chatExpression_pin2");
--     chatExpression_pin_map2 = chatExpression_pin_map;
--     return chatExpression_pin_map;
-- end
-- package.preload["games/common2/module/chatWnd/res/chatExpression_pin2"] = package.preload["games/common/gameChat/chatExpression_pin"];
-- require("games/common/gameChat/chatExpression_pin");


package.preload["games/common/gameChat/faceq_res"] = function()
    faceq_res_map = require("qnFiles/qnPlist/games/faceq_res2");
    faceq_res_map2 = faceq_res_map;
    return faceq_res_map;
end
package.preload["games/common2/module/chatWnd/res/faceq_res2"] = package.preload["games/common/gameChat/faceq_res"];
require("games/common/gameChat/faceq_res");


package.preload["games/common/gameChat/vip_faceq_res"] = function()
    vipFace_map = require("qnFiles/qnPlist/games/vip_faceq_res2");
    vipFace_map2 = vipFace_map;
    return vipFace_map;
end
package.preload["games/common2/module/chatWnd/res/vip_faceq_res2"] = package.preload["games/common/gameChat/vip_faceq_res"];
require("games/common/gameChat/vip_faceq_res");


package.preload["games/common/image_pin/popup"] = function()
    popup_map = require("qnFiles/qnPlist/games/popup");
    return popup_map;
end
require("games/common/image_pin/popup");


package.preload["games/common/match/pin/match_toolbar_pin"] = function()
    match_toolbar_pin_map = require("qnFiles/qnPlist/games/match_toolbar_pin");
    return match_toolbar_pin_map;
end
require("games/common/match/pin/match_toolbar_pin");



package.preload["games/common/match/pin/match_wait_pin"] = function()
    match_wait_pin_map = require("qnFiles/qnPlist/games/match_wait_pin");
    return match_wait_pin_map;
end
package.preload["games/common2/match/pin/match_wait_pin"] = package.preload["games/common/match/pin/match_wait_pin"];
require("games/common/match/pin/match_wait_pin");


-- package.preload["games/common/roomTask/boxFireWorkPin"] = function()
--     boxFireWorkPin_map = require("qnFiles/qnPlist/games/boxFireWorkPin2");
--     boxFireWorkPin_map2 = boxFireWorkPin_map;
--     return boxFireWorkPin_map;
-- end
-- package.preload["games/common2/module/roomtaskreward/anim/boxFireWorkPin2"] = package.preload["games/common/roomTask/boxFireWorkPin"];
-- require("games/common/roomTask/boxFireWorkPin");




package.preload["games/common/roomTask/diamondpin"] = function()
    diamond_map = require("qnFiles/qnPlist/games/diamondpin2");
    diamond_map2 = diamond_map;
    return diamond_map;
end
package.preload["games/common2/module/roomtaskreward/anim/diamondpin2"] = package.preload["games/common/roomTask/diamondpin"];
require("games/common/roomTask/diamondpin");



package.preload["games/common2/animation/animHeadVip_pin2"] = function()
    animHeadVip_pin_map2 = require("qnFiles/qnPlist/games/animHeadVip_pin2");
    return animHeadVip_pin_map2;
end
require("games/common2/animation/animHeadVip_pin2");



package.preload["games/common/animation/brokenHeart_pin"] = function()
    brokenHeart_pin_map = require("qnFiles/qnPlist/games/brokenHeart_pin");
    return brokenHeart_pin_map;
end
require("games/common/animation/brokenHeart_pin");


package.preload["games/common/animation/result_win_pin"] = function()
    feng_pin_map = require("qnFiles/qnPlist/games/result_win_pin");
    return feng_pin_map;
end
require("games/common/animation/result_win_pin");


package.preload["games/common/animation/roomVipHeadPin"] = function()
    vipheadFream_map = require("qnFiles/qnPlist/games/roomVipHeadPin");
    return vipheadFream_map;
end
require("games/common/animation/roomVipHeadPin");


package.preload["games/common/animation/envelopPin"] = function()
    envelopPin_map = require("qnFiles/qnPlist/games/envelopPin2");
    envelopPin_map2 = envelopPin_map;
    return envelopPin_map;
end
package.preload["games/common/animation/envelopPin2"] = package.preload["games/common/animation/envelopPin"];
require("games/common/animation/envelopPin");




--------------------------------------这些lua文件的图片资源不见了--------------------
package.preload["games/common/match/pin/match_gameicon_pin"] = function ()   end
package.preload["games/common/match/pin/match_gameover_pin"] = function ()   end
package.preload["games/common/match/pin/match_rankinfo_pin"] = function ()   end
package.preload["games/common2/module/pokers/layout/poker_big"] = function()  end







----------------------------------------------兼容某些游戏调用到大厅的资源文件----------------------------
package.preload["hall/main/pin/animHallVip_pin"] = function()
    animHallVip_pin_map = require("qnFiles/qnPlist/hall/animHallVip_pin");
    return animHallVip_pin_map;
end
require("hall/main/pin/animHallVip_pin");


package.preload["hall/main/pin/hall_pin"] = function()
    hall_pin_map = require("qnFiles/qnPlist/hall/hall_pin");
    return hall_pin_map;
end
require("hall/main/pin/hall_pin");


package.preload["hall/main/pin/roomLevels_pin"] = function()
    roomLevels_pin_map = require("qnFiles/qnPlist/hall/roomLevels_pin");
    return roomLevels_pin_map;
end
require("hall/main/pin/roomLevels_pin");

package.preload["hall/main/pin/roomLevels_pin"] = function()
    roomLevels_pin_map = require("qnFiles/qnPlist/hall/roomLevels_pin");
    return roomLevels_pin_map;
end

package.preload["games/common/animation/particleDrop"] = function()
    require("particle/particleDrop");
end

package.preload["games/common/data/gameConstant"] = function()
    require("isolater/interface/gameConstantIsolater");
end