--包类型
kBranch = 1; --0:正常(小包) 1:完整

--全局view布局路径
ViewPath = "view/kScreen_1280_800/";

--方便测试，自定义增加用户界面
s_guid = nil;

--测试umeng 账号
kTestUmeng = "552c8f28fd98c54c18000149";

NETWORK_TYPE_TEST   = 1;
NETWORK_TYPE_PREPUBLISH = 2;
NETWORK_TYPE_ONLINE = 3;
NETWORK_TYPE_HALL  = 4;

NETWORK_TYPE = 3; --{1:测试环境，2：预发布环境， 3：外网  4:大厅测试环境}

load_network_type = function()
    dict_load("network_config");
    return dict_get_int("network_config", "ver_type", NETWORK_TYPE);
end

set_network_type = function(networkType)
    NETWORK_TYPE = networkType or NETWORK_TYPE;
    dict_set_int("network_config", "ver_type", NETWORK_TYPE);
    dict_save("network_config");
end

NETWORK_TYPE = load_network_type();

require("coreex/dictex");
if NETWORK_TYPE == 3 then
    --保证正式不会影响到正式环境！！
    Dict.setDictNamePrefix("");
else
    Dict.setDictNamePrefix( NETWORK_TYPE );
end