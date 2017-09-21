--@brief 包含基础文件
local function loadBaseRequire()
    require("EngineCore/config");
    require("coreex/systemex");
    require("coreex/coreex");
    require("coreex/drawingex");
    require("uiex/uiex")
    require("uilibs/richText")
    require("common/nativeEvent");
    require("hall/gameData/regionConfigDataInterface");
    require("globalConfig");
    require("statesConfig");
    require("audioConfig");
    require("util/TableLib");
    require("util/StringLib");
    require("util/NumberLib");
    require("util/log");
    require("util/toolKit");
    require("common/soundModule");
    require("globalConstant");
    
    require("netWork/ServerConfig");
    require("common/httpModule");
    require("hall/onlineSocket/onlineSocketManager");
    require("hall/onlineSocket/globalSocketSleepManager");
    require("common/timeoutModule");
    require("animation/animFrameNew");
    require("gameData/clientInfo");

    require("gameBaseex/gameBaseex");
    require("hall/hallConfig"); 
    require("hall/common/gameManager");
    require("libs/json_wrap");
end

--@brief 测试期间请使用 测试umeng 账号
local function isTestUmeng()
   --local umengMetaValue = NativeEvent.getInstance():getMetaData();
   -- Log.v("isTestUmeng" ,"umengMetaValue:" , umengMetaValue);
   -- if _DEBUG then
   --     local platform =sys_get_string("platform") or "";
   --     if platform == kPlatformAndroid then
   --         if umengMetaValue == kTestUmeng then
   --             return false;
   --        else
   --             NativeEvent.getInstance():CloseStartScreen();
   --             Toast.setDefaultDisplayTime(60 * 1000);
   --             Toast.getInstance():showText("请在测试期间使用测试umeng 账号",50,30,kAlginLeft,"",26,255,255,255);
   --             return true;
   --         end
   --     end
   -- end
end

--@brief 初始化信息
local function init()
    --基础文件包含
    loadBaseRequire();

    --初始化system
    System.onInit();

    --音频、日志、字符串设置
    kEffectPlayer:setSoundFileMap(EffectsFileMap);
    GameString.load("string","zh");
    GameString.load("hall/php/stringPhpError", "zh");

    TableView.setDefaultMaxClickOffset(10);

    dict_set_int("log", "socket", _DEBUG and 1 or 0);   --引擎socket日志开关,0--关、1--开。
    local Framerate = require("framerate");
    Framerate.show_fps(_DEBUG);

    System.setToErrorLuaInWin32Enable(_DEBUG);
    System.setAlertErrorEnable(_DEBUG);
    System.setSocketLogEnable(_DEBUG);
    System.setAndroidLogLuaErrorEnable(_DEBUG);
    if not _DEBUG then
        Application.instance():set_log_level(Application.LOG_NONE)
    end
    
    System.setLayoutWidth(1280);
    System.setLayoutHeight(720);
    socket_set_conn_timeout(kSocketRoom, 5000)
    System.setImageFilterPicker( function() return kFilterLinear end);
    System.setDefaultFontNameAndSize("simhei", 30);--设置系统字体大小
    System.startTextureThreshold(); --设置纹理内存阀值
    UIConfig.setScrollViewScrollBarWidth(0);
    UIConfig.setScrollerUnitTurningFactor(0.10);--设置viewpager滑动宽度
    Toast.setDefaultDisplayTime(2500);
    Toast.setDefaultFontNameAndSize("simhei",30);
    Toast.setDefaultColor(200,175,115);
    Toast.setDefaultImage("hall/common/loading_bg.png");
    Toast.setDefaultImageGridSpace(18,18,18,18);
    ToolKit.lastLuaErrorCheck();
    RegionConfigDataInterface.getInstance():setDebugSwitch(_DEBUG);

    --检查umeng值是否正确
    if isTestUmeng() then 
        return true;
    end

    --获取手机信息
    kClientInfo:isVirtual();
    kClientInfo:getPhoneInfo();
    GameManager.initInstance();


    --@brief 进入闪屏页
    local function startSplashScreen()
        if kPlatformWin32 == (sys_get_string("platform") or "") then
            mainHandle_toHall()
        else
            require("hall/holidaysBg/data/holidaysBgDataInterface")
            if HolidaysBgDataInterface.getInstance():isShowSplashScreen() then
                kGameManager:startChangeScene(States.HolidaysBg, ScreenOrientationManager.eScreenOrien.LANDSCAPE, {1280,720}, false);
            else
                mainHandle_toHall()
            end
        end
    end

    -- 方便测试，自定义增加用户界面(先关闭，后续有需要再打开吧)
    if _DEBUG and kPlatformWin32 == (sys_get_string("platform") or "") then 
        --win32情况下每一帧都进行3次垃圾回收
        System.startCollectGarbage();

        local t = {
            callback = function(self,guid)
                if type(guid) == "string" and guid ~= "" then 
                    s_guid = guid;
                    kClientInfo:getPhoneInfo();
                end 
                startSplashScreen()
           end
        };
        new(require("guidMakePop"), t, t.callback);
    else
        startSplashScreen()
    end 
end

--1.此方法里面里面只能调用库里的方法,请不要引用其他任何的类
--2.程序第一次启动时，会去解压asset/games/hall.zip包
-- （添加成zip包的原因之一可以使apk的文件更小；注意内置多个游戏时，需要打成一个包，一是减少文件大小，二是解压速度更快）
--3.当程序apk版本有变化时，也会去解压asset/games/hall.zip
local function update_android()
    local platformAndroid   = "android";
    local platform = sys_get_string("platform") or "";

    local isUnZip = false; --标明是否需要解压

    -- step 1:读取文件，获取是否已解压标识  0:未解压  1:已解压
    dict_load("updateDidfinish");
    isUnZip = (dict_get_int("updateDidfinish","updateStatus",0)==0);
    print_string("解压状态 A updateStatus = " .. (isUnZip and "0" or "1") );

    --step 2:判断安装方式 0 无变化 , 1 apk升级覆盖安装, 2 apk相同版本覆盖安装，3 apk 降级覆盖安装
    local replaceInstall = dict_get_int("android_app_info","replaceInstall",0);
    print_string("解压状态 B replaceInstall = " .. replaceInstall);
    if replaceInstall >=1 then
        --如果有变化
        dict_set_int("android_app_info","replaceInstall",0);
        if replaceInstall == 1 then
        elseif replaceInstall == 2 or replaceInstall == 3 then
            --android 中删除所有的lua代码
            local storage_update_root_path = sys_get_string("storage_update_root");
            local ret = os.rmdir(storage_update_root_path);
            print_string("解压状态 删除 storage_update_root_path = " .. storage_update_root_path);
            print_string("解压状态 C delete storage_update_root ret = " .. (ret and "true" or "false"));
        end
    end
    isUnZip = isUnZip or (replaceInstall >=1);

    --step 3:检查license文件
    if not isUnZip then
        --[[增强判断，在Android下有一种情况：当用户清除了数据，但是刚好update目录下有更新包，
            程序启动时，引擎会加压更新包，结果更新下来发现有gameConfig文件，结果程序还是不能用的情况
        ]]
        local fileName=(dict_get_string("android_app_info","files_path") or "") .. "/update/scripts/common/license.lua";
        local _ret , _errMsg=loadfile(fileName);
        isUnZip=(not _ret);--没找到文件需要解压
        print_string("解压状态 D loadfile license ret = " .. (_ret and "true" or "false") );
    end

    -- 2.3.0 2.3.0
    -- 2.3.0 2.3.0.0
    -- 2.3.0.0 2.3.0
    local function isSameApkVersion(oldApkVersionName, currentApkVersionName)
        if oldApkVersionName == currentApkVersionName then
            return true;
        end
        
        oldApkVersionName = string.gsub(oldApkVersionName, "%.", "");
        currentApkVersionName = string.gsub(currentApkVersionName, "%.", "");
        local intOldApkVersionName = tonumber(oldApkVersionName) or 0;
        local intCurrentApkVersionName = tonumber(currentApkVersionName) or 0;
        local big = math.max(intOldApkVersionName, intCurrentApkVersionName);
        local small = math.min(intOldApkVersionName, intCurrentApkVersionName);
        if big % small == 0 then
            return true;
        else
            return false;
        end
    end

    --step 4:检查hall/gameConfig文件中的_dependApkVersion是否和apkVersion一致
    if not isUnZip then
        local currentApkVersionName=dict_get_string("android_app_info","version_name") or "1.0.0";
        local oldApkVersionName="0";
        local fileName = (dict_get_string("android_app_info","files_path") or "") .. "/update/scripts/hall/gameConfig.lua";
        local fun , errMsg=loadfile(fileName);
        if fun then
            fun();
            oldApkVersionName = _dependApkVersion or "0";
        end
        -- currentApkVersionName == oldApkVersionName  不要使用== 防止2.3.0 2.3.0.0 不相同的情况出现
        isUnZip = not isSameApkVersion(currentApkVersionName, oldApkVersionName);--3.版本号不一致需要解压

        print_string("解压状态 E currentApkVersionName:" .. currentApkVersionName .. "_oldApkVersionName:".. oldApkVersionName);
    end

    if isUnZip then
        --开始进行解压
        dict_set_int("updateDidfinish","updateStatus",0);
        dict_save("updateDidfinish");

        local startTime=os.clock();
        dict_set_string("LuaCallEvent","LuaCallEvent","unzipNewGames");--unzipNewGames zips
        call_native("OnLuaCall");

        --将解压标记置为true
        dict_set_int("updateDidfinish","updateStatus",1);
        dict_save("updateDidfinish");

        local endTime=os.clock();
        print_string("解压状态 F cost:" .. (endTime-startTime));
 
        --解压完成，删除update目录
        os.rmdir(sys_get_string("storage_update_zip") or "");

        mainHandle_releaseRes();
        to_lua("main.lua");
        return true;
    else
        return false;
    end
end

--@brief IOS更新包解压后重启虚拟机
--@note 接口方法， ios会直接回调这个方法
function onUnziped()
    mainHandle_releaseRes();

    --解压完成，删除update目录
    os.rmdir(sys_get_string("storage_update_zip") or "");

    to_lua("main.lua");
end

--@brief 进入大厅
function mainHandle_toHall()

    local local_server_config = require("local_server_config");
    if local_server_config.isSwitchOpen() then
        local_server_config.connect_local_server( tonumber(s_guid) );
    else
        OnlineSocketManager.getInstance():openSocket();
        if ServerConfig.getInstance():getDefendAttackSwitch() then
            --如果本地配置的防攻击开关是开启的话，则去确认下本次启动开关的情况
            ServerConfig.getInstance():requestDefendAttackConfig();
        end
        kGameManager:startGame(GameType.HALL);

        local gameVersion = kGameManager:getGameVersion(GameType.HALL);
        dict_set_string(kDFQPGame , kGameVersion ,gameVersion);
        dict_save(kDFQPGame);
    end
end

-- 添加一个总是显现的按钮，用于重启虚拟机
function mainHandle_restartVM()
    mainHandle_releaseRes();
    Sound.pauseMusic();
    System.setLayoutWidth(1280);
    System.setLayoutHeight(720);
    to_lua("main.lua");
end

--@brief 释放资源
function mainHandle_releaseRes()
    socket_room_close(-1);
    res_delete_group(-1); 
    anim_delete_group(-1);
    prop_delete_group(-1);
    drawing_delete_all();
    Clock.instance():cancel_all();
end

--@brief 入口函数
function mainHandle(width,height)
    mainHandle_releaseRes();

    math.randomseed(tostring(os.time()):reverse():sub(1, 6));
  
    local platformAndroid = "android";
    local platformIOS     = "ios";
    local platform = sys_get_string("platform") or "";

    --if platform == platformAndroid then
    --    local isUpdating = update_android();
    --    if isUpdating then
    --        return;
    --    end
    --end

    local function deleteUnusableFilesWhenIosReplaceInstall()
        if "ios" == (sys_get_string("platform") or "") then
            local IosReplaceInstallLogic = require("hall/update/iosReplaceInstallLogic");
            IosReplaceInstallLogic.deleteUnusableFilesWhenReplaceInstall();
        end
    end

    --ios覆盖安装，删除无用文件
    deleteUnusableFilesWhenIosReplaceInstall();

    init();
end