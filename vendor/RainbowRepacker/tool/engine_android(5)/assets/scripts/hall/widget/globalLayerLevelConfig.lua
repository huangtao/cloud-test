--游戏中除了依赖于场景的层，还有一些不受场景管理的层，对于这些层的层级，我们原则上在这个文件里统一引用，方便管理。
--如果是受LayerManagerIsolater管理的层，可以直接使用层名字作为键值，会自动设定。
local levelConfig = {};

---------------浮标-----------------
levelConfig['floatBall'] = 10000;
levelConfig['floatBallDisk'] = 10000;

---------------红包-----------------
local RED_ENVELOPE_2 = 10001;
local RED_ENVELOPE = 10002;
local RED_ENVELOPE_3 = 10003;

levelConfig['redenvelope_anim_send'] = RED_ENVELOPE_3;
levelConfig['redenvelope_detail'] = RED_ENVELOPE;
levelConfig['redenvelope_get'] = RED_ENVELOPE;
levelConfig['redenvelope_congratulation'] = RED_ENVELOPE;
levelConfig['redenvelope_fail'] = RED_ENVELOPE;
levelConfig['redenvelope_reciever'] = RED_ENVELOPE_2;

---------------物品箱---------------

---------------Toast----------------
local TOAST = 11000
levelConfig['Toast'] = TOAST;     --理论上toast的层级应该是最高的。

return levelConfig;