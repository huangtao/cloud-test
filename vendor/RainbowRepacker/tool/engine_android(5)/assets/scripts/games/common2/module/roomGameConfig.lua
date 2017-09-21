

--[[
	公共房间内用到的全局类的引用配置，进入房间时需要第一时间调用
]]

--1.基本库 
	 
require("libs/bit");
require("libs/json");
require("libs/json_wrap");

require("ui/adapter");
require("ui/image");
require("ui/node");
require("uiex/urlImage");
require("uiex/spannableText");
require("uiex/newTextView");

require("core/gameString"); 
require("core/prop"); 
require("core/constants");
require("core/drawing");
require("core/object");
require("core/global");
require("core/sceneLoader");
require("core/system");
require("core/dict");
require("core/anim");
require("coreex/coreex");
require("coreex/globalex");

require("particle/particleFlower");
require("particle/particleBubble");
require("particle/particleFireWork");
require("particle/particleTail");
require("particle/particleSystem");

require("swfTween/drawingex2");
require("swfTween/swfPlayer");

require("util/UICreator");
require("util/fileUtil");
require("util/NumberLib");
require("util/TableLib");
require("util/StringLib");
require("util/toolKit");
require("util/ImageCache");

require("common/base64");
require("common/uiFactory");
require("common/animFactory");
require("common/commonGameLayer");
require("common/commonLogic");
require("common/loadingView");
require("common/IBaseDialog");
require("common/socketHandlerBase");
require("common/commonSocketWriter");
require("common/commonSocketReader");
require("common/popupWindow");
require("common/nativeEvent");
require("common/commonScene");
require("common/commonState");

require("animation/animBase");
require("animation/animFrameNew");
require("animation/animDef");
require("animation/animManager");
require("animation/animFrame");

require("gameData/dataInterfaceBase");
require("gameData/gameData");

require("isolater/interface/settingIsolater");
require("isolater/interface/videoIsolater");
require("isolater/interface/socketIsolater");
require("isolater/interface/radioIsolater");
require("isolater/interface/weiXinIsolater");
require("isolater/interface/reportIsolater");
require("isolater/interface/clientInfoIsolater")
require("isolater/interface/safeboxIsolater");
require("isolater/interface/QRUtilIsolater");
require("isolater/interface/bankruptIsolater");
require("isolater/interface/propIsolater");
require("isolater/interface/userBaseInfoIsolater");
require("isolater/interface/privateRoomIsolater");
require("isolater/interface/communityIsolater");
require("isolater/interface/userIdentityIsolater");
require("isolater/interface/userExpInfoIsolater");
require("isolater/interface/payIsolater");
require("isolater/interface/gameInfoIsolater");
require("isolater/interface/matchIsolater");
require("isolater/interface/passwordIsolater");
require("isolater/interface/userGameInfoIsolater");
require("isolater/interface/userPropertyIsolater");
require("isolater/interface/regionConfigIsolater");
require("isolater/widget/slotMachineLayerIsolater");
require("isolater/widget/layerManagerIsolater"); 

require("isolater/common/commonController");

require("games/common2/tools/pokerUtil");
require("games/common2/tools/gameTimer2");
require("games/common2/tools/serverLifeDetector2");
require("games/common2/tools/moneyTools");
require("games/common2/tools/msgProcessTools");
require("games/common2/tools/commonRoomTimer2");

require("games/common2/data/commonPlayerInfoHandler2");
require("games/common2/data/loginGameLogic2");
require("games/common2/data/gameCommonData");
require("games/common2/data/gameRoomData");
require("games/common2/data/roomPropertyData");

require("games/common2/network/socket/commonGameSocketCmd2");
require("games/common2/network/socket/commonGameSocketProcesser2");
require("games/common2/network/socket/commonGameSocketReader2");
require("games/common2/network/socket/commonGameSocketWriter2");

require("games/common2/module/logic/communityLogic");
require("games/common2/module/props/roomPropsLogic");
-- require("games/common2/module/layerBase");
require("games/common2/module/logic/roomTaskData");
require("games/common2/module/chatRealTime/chatRealTimeLogic");
require("games/common2/module/logic/roomLogic");
require("games/common2/module/logic/dialogLogic");
require("games/common2/module/config/roomLevelConfig");
require("games/common2/module/interactionInfo");
require("games/common2/module/silver/data/silverroomDataInterface2");
require("games/common2/module/friend/roomFriendConfig");
require("games/common2/module/chat/data/roomChatConfig");

require("games/common2/animation/AnimHeadVip2");

require("games/common2/plugin/windowManage");
