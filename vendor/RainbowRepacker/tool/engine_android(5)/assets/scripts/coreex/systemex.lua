require("core/system");



--[[
    MemoryMonitor.size	所占内存的大小.
    MemoryMonitor.texture_size	所有纹理的大小.
]]

System.isLandscape = function()
	return System.getScreenWidth() > System.getScreenHeight();
end

System.isPortrait = function()
	return System.getScreenWidth() < System.getScreenHeight();
end

System.getFrameRate = function()
	return math.floor(Clock.instance().fps) or 0;
end

System.setFrameRate = function(fps)
	--
end

System.getTextureMemory = function()
	return MemoryMonitor.instance().texture_size;
end

System.getMemory = function()
	return MemoryMonitor.instance().size;
end

System.getLuaError = function()
	return sys_get_string("last_lua_error");
end

System.getAndroidAudioFullFile = function()
	return sys_get_string("audio_search");
end

System.setAndroidAudioFullFile = function(file)
	return sys_set_string("search_name", file);
end

System.getAudioFullPath = function(self,file)
	sys_set_string("search_name", file);
	return sys_get_string("audio_search");
end

System.setSocketLogEnable = function(boolValue)
	--engine had remove it 
	--return sys_set_int("socket_log_file",boolValue and kTrue or kFalse);
end

System.setSocketConnectTimeout = function(millsecond)
	--socket_sys_set_int("socket_conn_timeout", millsecond);
end


System.setAlertErrorEnable = function(boolValue)
	--engine had remove it 
	--return sys_set_int("alert_error",boolValue and kTrue or kFalse);
end

System.setLuaError = function(strValue)
	--engine had remove it 
	--return sys_set_string("last_lua_error",strValue);
end

System.setToErrorLuaInWin32Enable = function(boolValue)
	--engine had remove it 
	--return sys_set_int("to_error_lua_in_win32",boolValue and kTrue or kFalse);
end

System.setBackpressExitEnable = function(boolValue)
	--engine had remove it 
	--return sys_set_int("backpress_exit",boolValue and kTrue or kFalse);
end

System.setSocketHeaderSize = function(intValue)
	--return socket_sys_set_int("socket_header",intValue or 9);
end

System.setSocketHeaderExtSize = function(intValue)
	--return socket_sys_set_int("socket_header_extend",intValue or 0);
end

System.moveFile = function(srcFilePath,destFilePath)
	return System.copyFile(srcFilePath, destFilePath);
end


System.pushFrontImageSearchPath = function(path)
	sys_set_string("push_front_images_path", path);
end

System.pushFrontAudioSearchPath = function(path)
	sys_set_string("push_front_audio_path", path);
end

System.pushFrontFontSearchPath = function(path)
	sys_set_string("push_front_fonts_path", path);
end

System.setUseRomToStorage = function()
	sys_set_int("android_dict_use_external_storage",0);
end
System.getStorageRoot = function()
	return "";
end

System.setAndroidLogLuaErrorEnable = function(boolValue)
	return "";
end

System.reLoadFile = function( filename )
	package.loaded[filename] = nil;
	require(filename);
end

System.getAndroidVersionCode = function()
	return dict_get_int("android_app_info","version_code",0) or 0;
end

System.getAndroidVersionName = function()
	return dict_get_string("android_app_info","version_name") or "";
end

System.getAndroidPackages = function()
	return dict_get_string("android_app_info","packages") or "";
end

System.getAndroidApkPath = function()
	return dict_get_string("android_app_info","apk_path") or "";
end

System.getAndroidLibPath = function()
	return dict_get_string("android_app_info","lib_path") or "";
end

System.getAndroidFilesPath = function()
	return dict_get_string("android_app_info","files_path") or "";
end

System.getAndroidSdPath = function()
	return dict_get_string("android_app_info","sd_path") or "";
end

System.getAndroidLang = function()
	return dict_get_string("android_app_info","lang") or "";
end

System.getAndroidCountry = function()
	return dict_get_string("android_app_info","country") or "";	
end

System.getAndroidDeviceId = function()
	return dict_get_string("android_app_info","device_id") or "";
end

System.getAndroidCache = function()
	return dict_get_string("android_app_info","cache") or "";
end

System.getAndroidRootPath = function()
	return dict_get_string("android_app_info","rootPath") or "";
end

System.getAndroidImsi = function()
	return dict_get_string("android_app_info","imsi") or "";
end

System.getAndroidImei = function()
	return dict_get_string("android_app_info","imei") or "";
end

System.getAndroidIccid = function()
	return dict_get_string("android_app_info","iccid") or "";
end

System.getAndroidPhoneNumber = function()
	return dict_get_string("android_app_info","phoneNumber") or "";
end

System.getAndroidId = function()
	return dict_get_string("android_app_info","androidId") or "";
end

System.getPhoneModel = function()
	return dict_get_string("android_app_info","phoneModel") or "0";
end

----------data/data-------------
--android -> data/data/files/scripts
--ios -> XXX.app/scripts
--指向包里面的scripts路径
System.getPackageDataScripts = function()
	return sys_get_string("cache_scripts") or "";
end

--android -> data/data/files/images
System.getPackageDataImages = function()
	local scriptsPath = System.getPackageDataScripts();
	return (string.sub(scriptsPath,0,string.find(scriptsPath, "scripts", 0) - 1 ) ) .. "images/"
end

--android -> data/data/files/update
System.getPackageDataUpdate = function()
	local scriptsPath = System.getPackageDataScripts();
	return (string.sub(scriptsPath,0,string.find(scriptsPath, "scripts", 0) - 1 ) ) .. "update/"
end

System.getLayoutScale = function()
	local xScale = System.getScreenWidth() / System.getLayoutWidth();
	local yScale = System.getScreenHeight() / System.getLayoutHeight();
	System.s_layoutScale = xScale>yScale and yScale or xScale;
	
	return System.s_layoutScale;
end

System.getScreenScaleWidth = function(self)
	System.s_screenScaleWidth = System.getScreenWidth() / System.getLayoutScale();

	return System.s_screenScaleWidth;
end

System.getScreenScaleHeight = function(self)
	System.s_screenScaleHeight = System.getScreenHeight() / System.getLayoutScale();

	return System.s_screenScaleHeight;
end

System.refreshScreenWidth = function()
	System.s_screenWidth = sys_get_int("screen_width",0);
end

System.refreshScreenHeight = function()
	System.s_screenHeight = sys_get_int("screen_height",0);
end

System.startTextureThreshold = function()
	local platform = System.getPlatform();
	local threshold;
	if platform == kPlatformAndroid then
		local availableMemory = NativeEvent.getInstance():getAvailMemoryForLua();
		if availableMemory < 200 then
			--如果剩余内存低于200M，则将阀值设为30M，让其释放资源
			threshold = 30*1024*1024;
		else
			--如果剩余内存高于200M，则将阀值设为剩余内存的二分之一
			threshold = availableMemory/2;
		end
	else
		--其他平台默认为100M
		threshold = 100*1024*1024; 
	end

	print_string("System.startTextureThreshold threshold = " .. threshold);

    local _paused = false
    MemoryMonitor.instance():add_listener(threshold, function(size)
        if not _paused then
            _paused = true
            --延迟1s进行清理
            Clock.instance():schedule_once(function()
                if MemoryMonitor.instance().size > threshold then
                    TextureCache.instance():clean_unused()
                end
                _paused = false
            end, 1)
        end
    end)
end

System.startCollectGarbage = function()
	Clock.instance():schedule(function()
			collectgarbage("collect");
		end)
end

--@brief 屏幕截图
--@param x：相对于左上角的x
--@param y: 相对于左上角的y
--@param savePath：保存路径
--@return 截图图片
--[[
    local ctrl = self:findViewById(xxx);
    local p = ctrl:getWidget():to_world(Point(0,0));
    local w, h = ctrl:getRealSize();
	
	savePath = string.format("%scapture_%s.jpg", System.getStorageImagePath(), os.time());
--]]
System.captureScreen = function(x, y, width, height, savePath)
	local img = Window.instance().root.fbo:to_image()
	img:clip(x, y, width, height);

	if not string.isEmpty(savePath) then
		img:save(savePath);
	end
	
	return img;
end

System.captureFullScreenAndReturnPath = function(p_path)
	local path = p_path or string.format("%soffscreenRender.png", System.getStorageImagePath());
	local img = Window.instance().root.fbo:to_image();
	img:save(path);
	return path;
end

System.offscreenRender = function(drawing, w, h, savePath)
	if not drawing then
		return "";
	end

	local widget = drawing:getWidget();
	local realW, realH = drawing:getSize();
	local __scale = System.getLayoutScale();
	widget.scale = Point(1/__scale, 1/__scale);
	local fbo = FBO.create(Point(w or realW, h or realH));
    fbo:render(widget);
    local path = savePath or string.format("%soffscreenRender.png", System.getStorageImagePath());
    fbo:save(path);
    return path;
end

System.offscreenRenderWithDrawingList = function(drawingList, width, height, clipX, clipY, clipW, clipH, savePath)
	if table.isEmpty(drawingList) then
		return "";
	end
	local fbo = FBO.create(Point(width, height));
	for k, v in ipairs(drawingList) do
		local widget = v:getWidget();
	    fbo:render(widget);
	end
	local img = fbo:to_image();
	img:clip(clipX, clipY, clipW, clipH);
	local path = savePath or string.format("%soffscreenRender.png", System.getStorageImagePath());
	img:save(path);
    return path;
end

--@brief 获取插件加载错误信息
System.getPluginLoadErrMsg = function()
	return sys_get_string('plugin_err_msg') or "";
end

System.setWin32ConsoleColor = function(color)
	return sys_set_int("win32_console_color",color);
end


-----------------------------------以后请使用下面的接口来获取地方棋牌的文件存放目录-------------------------

-- .app 目录相关

--win32 Resource\
--android /data/data/APP_PKG_NAME/files/
--ios /var/containers/Bundle/Application/D88634B7-7253-47E2-9A41-A13061527072/dfqp_v3.0.app/
System.getAppRootPath = function()
	return sys_get_string("storage_app_root");
end

--win32 Resource\
--android /data/data/APP_PKG_NAME/files/
--ios /var/mobile/Containers/Data/Application/4AEB13FD-CBBE-49E7-8383-EEEAEA9E6DF0/Documents/ 
System.getInnerStorageRoot = function()
	return sys_get_string("storage_inner_root");
end

--win32 Resource\outer\
--android /storage/emulated/0/APP_PKG_NAME/ 
--ios /var/mobile/Containers/Data/Application/4AEB13FD-CBBE-49E7-8383-EEEAEA9E6DF0/Documents/outer/
System.getOuterStorageRoot = function()
	return sys_get_string("storage_outer_root");
end

--win32 Resource\scripts\
--android /data/data/APP_PKG_NAME/files/scripts/
--ios /var/containers/Bundle/Application/D88634B7-7253-47E2-9A41-A13061527072/dfqp_v3.0.app/scripts/
System.getStorageAppScripts = function()
	return sys_get_string("storage_app_scripts");
end

--win32 Resource\images\
--android /data/data/APP_PKG_NAME/files/images/
--ios /var/containers/Bundle/Application/D88634B7-7253-47E2-9A41-A13061527072/dfqp_v3.0.app/images/
System.getStorageAppImages = function()
	return sys_get_string("storage_app_images");
end

--win32 Resource\audio\
--android /data/data/APP_PKG_NAME/files/audio/
--ios /var/containers/Bundle/Application/D88634B7-7253-47E2-9A41-A13061527072/dfqp_v3.0.app/audio/
System.getStorageAppAudio = function()
	return sys_get_string("storage_app_audio");
end

--win32 Resource\fonts\
--android /data/data/APP_PKG_NAME/files/fonts/
--ios /var/containers/Bundle/Application/D88634B7-7253-47E2-9A41-A13061527072/dfqp_v3.0.app/fonts/
System.getStorageAppFonts = function()
	return sys_get_string("storage_app_fonts");
end

--win32 Resource\update\ 
--android /data/data/APP_PKG_NAME/files/update/
--ios /var/mobile/Containers/Data/Application/4AEB13FD-CBBE-49E7-8383-EEEAEA9E6DF0/Documents/user/ 
System.getStorageUpdateRoot = function()
	return sys_get_string("storage_update_root");
end

--win32 Resource\update\scripts\
--android /data/data/APP_PKG_NAME/files/update/scripts/
--ios --ios /var/mobile/Containers/Data/Application/4AEB13FD-CBBE-49E7-8383-EEEAEA9E6DF0/Documents/user/scripts/
System.getStorageUpdateScripts = function()
	return sys_get_string("storage_update_scripts");
end

--win32 Resource\update\images\
--android /data/data/APP_PKG_NAME/files/update/images/
--ios /var/mobile/Containers/Data/Application/4AEB13FD-CBBE-49E7-8383-EEEAEA9E6DF0/Documents/user/images/
System.getStorageUpdateImages = function()
	return sys_get_string("storage_update_images");
end

--win32 Resource\update\audio\
--android /data/data/APP_PKG_NAME/files/update/audio/
--ios /var/mobile/Containers/Data/Application/4AEB13FD-CBBE-49E7-8383-EEEAEA9E6DF0/Documents/user/audios/
System.getStorageUpdateAudio = function()
	return sys_get_string("storage_update_audio");
end

--win32 Resource\update\fonts\
--android /data/data/APP_PKG_NAME/files/update/fonts/
--ios /var/mobile/Containers/Data/Application/4AEB13FD-CBBE-49E7-8383-EEEAEA9E6DF0/Documents/user/fonts/
System.getStorageUpdateFonts = function()
	return sys_get_string("storage_update_fonts");
end

--win32 Resource\Outer\update
--android /storage/emulated/0/APP_PKG_NAME/update/
--ios /var/mobile/Containers/Data/Application/4AEB13FD-CBBE-49E7-8383-EEEAEA9E6DF0/Documents/outer/update/ 
System.getStorageUpdateZip = function()
	return sys_get_string("storage_update_zip");
end

--win32 Resource\Outer\user\
--android --android /storage/emulated/0/APP_PKG_NAME/user/
--ios /var/mobile/Containers/Data/Application/4AEB13FD-CBBE-49E7-8383-EEEAEA9E6DF0/Documents/outer/user
System.getStorageUser = function()
	return sys_get_string("storage_user_root");
end

--win32 Resource\Outer\scripts\
--android /storage/emulated/0/APP_PKG_NAME/scripts/
--ios /var/mobile/Containers/Data/Application/4AEB13FD-CBBE-49E7-8383-EEEAEA9E6DF0/Documents/outer/user/scripts/ 
System.getStorageUserScripts = function()
	return sys_get_string("storage_user_scripts");
end

--win32 Resource\Outer\images\
--android /storage/emulated/0/APP_PKG_NAME/images/
--ios /var/mobile/Containers/Data/Application/4AEB13FD-CBBE-49E7-8383-EEEAEA9E6DF0/Documents/outer/user/images/ 
System.getStorageUserImages = function()
	return sys_get_string("storage_user_images");
end

--win32 Resource\Outer\audio\
--android /storage/emulated/0/APP_PKG_NAME/audio/
--ios /var/mobile/Containers/Data/Application/4AEB13FD-CBBE-49E7-8383-EEEAEA9E6DF0/Documents/outer/user/auido/ 
System.getStorageUserAudio = function()
	return sys_get_string("storage_user_audio");
end

--win32 Resource\Outer\fonts\
--android /storage/emulated/0/APP_PKG_NAME/fonts/
--ios /var/mobile/Containers/Data/Application/4AEB13FD-CBBE-49E7-8383-EEEAEA9E6DF0/Documents/outer/user/fonts/ 
System.getStorageUserFonts = function()
	return sys_get_string("storage_user_fonts");
end

--win32 Resource\Outer\xml\
--android /storage/emulated/0/APP_PKG_NAME/xml/
--ios /var/mobile/Containers/Data/Application/4AEB13FD-CBBE-49E7-8383-EEEAEA9E6DF0/Documents/user/xml/ 
System.getStorageXml = function()
	return sys_get_string("storage_xml");
end

--win32 Resource\Outer\dict\
--android /storage/emulated/0/APP_PKG_NAME/dict/
--ios /var/mobile/Containers/Data/Application/4AEB13FD-CBBE-49E7-8383-EEEAEA9E6DF0/Documents/user/dict/ 
System.getStorageDict = function()
	return sys_get_string("storage_dic");
end

--win32 Resource\Outer\log\
--android /storage/emulated/0/APP_PKG_NAME/log/
--ios /var/mobile/Containers/Data/Application/4AEB13FD-CBBE-49E7-8383-EEEAEA9E6DF0/Documents/user/log/ 
System.getStorageLog = function()
	return sys_get_string("storage_log");
end

--win32 Resource\Outer\tmp\
--android /storage/emulated/0/APP_PKG_NAME/tmp/
--ios /var/mobile/Containers/Data/Application/4AEB13FD-CBBE-49E7-8383-EEEAEA9E6DF0/Documents/user/tmp/ 
System.getStorageTemp = function()
	return sys_get_string("storage_tmp");
end
