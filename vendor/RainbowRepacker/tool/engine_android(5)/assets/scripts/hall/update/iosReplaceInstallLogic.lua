local s_completeGamesInfo = {}; --记录games目录下完整游戏的信息
local s_lastApkVersion = ""; --缓存上次的ios版本号


local M = {}

--[[
	背景
	ios 包内置的内容存放目录为A
		而下载、更新的文件存放目录为B
		engine 的搜索优先级为 B > A

	当覆盖安装的时候，会对user目录做如下处理
				   

	逻辑
	1、lua根据保存的ios版本号来判断是否为覆盖安装
	2、如果缓存的ios版本号不存在，则认为是从720版本之前升级上来的 or 新安装的apk包(忽略，因为user目录下没有东西)，此时会将user下的所有lua文件进行删除，用户需要重新进行下载游戏
	3、如果缓存的ios版本号不等于当前的ios版本号，则
				->删除games外的其他文件
				->删除games目录下的common 和 common2文件夹
				->删除包已经内置了的所有游戏
				->删除user下games中不是完整包的游戏
				->删除完成后更新缓存中的ios版本号
	4、如何检测user目录下的游戏是否是完整包
		如果一款游戏有过一次下载或完整更新，则认为这款游戏是完整包

]]

M.deleteUnusableFilesWhenReplaceInstall = function()
	M.__loadDictData();

	print_string("IosReplaceInstallLogic.deleteUnusableFilesWhenReplaceInstall ");
	local str = string.format("IosReplaceInstallLogic.deleteUnusableFilesWhenReplaceInstall s_completeGamesInfo = %s, s_lastApkVersion = %s", cjson.encode(s_completeGamesInfo) or "", s_lastApkVersion or "");
	print_string(str);


	local storage_update_scripts = sys_get_string("storage_update_scripts") or "";
	local storage_update_images = sys_get_string("storage_update_images") or "";
	local storage_update_audio_mp3 = ( sys_get_string("storage_update_audio") or "" ) .. "/mp3/";

	local folderArray = {storage_update_scripts, storage_update_images, storage_update_audio_mp3};

	if M.__stringIsEmpty(s_lastApkVersion) then
		--缓存的apkVersion不存在，则认为是从720之前的版本升级上来的
		--将user目录下的所有文件删除

		for k, path in pairs(folderArray) do
			os.rmdir(path, true);
		end

		s_completeGamesInfo = {};
		print_string("IosReplaceInstallLogic.deleteUnusableFilesWhenReplaceInstall AAAAA delete all scripts files");

	elseif not M.__isSameApkVersion() then
		--版本号不同
		local gamesInPackage = M.__getGamesInPackage();
		local deletedGamesMap = {};

		for k, path in pairs(folderArray) do
			local filesInUser = os.lsdirs( path );

			if type(filesInUser) ~= "table" then 
				return;
			end

			for k, path in pairs(filesInUser) do
				if M.__getFileName(path) == "games" then
					local gamesInUsers = os.lsdirs(path);
					for k, gamePath in pairs(gamesInUsers) do
						local gamePkg = M.__getFileName(gamePath);
						print_string("gamePkg is " .. (gamePkg or "") );
						local shouldDelete = true;
						if gamePkg == "common" or gamePkg == "common2" then
							--删除 common 和 common2
							print_string("delete common or common2");
						elseif M.__isGameHasInPackge(gamePkg, gamesInPackage) then
							--删除已经内置的游戏
							print_string("delete game has in package");
						elseif not M.__isCompleteGame(gamePkg) then
							--删除不完整的游戏
							print_string("delete isn't complete game");
						else
							--遗留下的游戏都是完整的
							shouldDelete = false;
							print_string("this game is complete");
						end
						
						if shouldDelete then
							local ret = os.rmdir(gamePath, true);
							print_string("delete game ret = " .. (ret and "true" or "false") );
							if ret then
								deletedGamesMap[gamePkg] = true;
							end
						end
					end
				else
					--删除games外的其他文件
					local ret = os.rmdir(path, true);
					print_string("delete other folder ret = " .. (ret and "true" or "false") );
				end
			end
		end

		--当删除游戏后，将其从完整游戏配置里面删除
		for gamePkg, v in pairs(deletedGamesMap) do
			M.__removeCompleteGameInfoFromRecordWhenDeleteGame(gamePkg);
		end
	else
		print_string("IosReplaceInstallLogic.deleteUnusableFilesWhenReplaceInstall the version is same, and do nothing");
		--版本号相同 do nothing
	end

	--更新缓存中的版本号
	s_lastApkVersion = M.__getCurApkVersion();
	print_string("IosReplaceInstallLogic s_lastApkVersion  = " .. s_lastApkVersion);
	M.__saveDictData();
end

--@brief 是否是完整游戏
M.__isCompleteGame = function(gamePkg)
	for k, v in pairs(s_completeGamesInfo) do
		if v.game_pkg == gamePkg then
			return true;
		end
	end

	return false;
end

--@brief 判断游戏是否已经内置
M.__isGameHasInPackge = function(gamePkg, gamesInPackage)
	for k, v in pairs(gamesInPackage) do
		if v == gamePkg then
			return true;
		end
	end

	return false;
end

--@brief 获取内置的游戏
M.__getGamesInPackage = function()
	local storage_app_scripts = sys_get_string("storage_app_scripts") or "";
	local buildInFiles = os.lsdirs( storage_app_scripts .. "/games/");
	if type(buildInFiles) ~= "table" then
		return {};
	end

	local filesNames = {};
	for k, path in pairs(buildInFiles) do
		table.insert(filesNames, M.__getFileName(path) );
	end
	return filesNames;
end

--@brief 当删除user目录下的游戏时，将其记录也一并进行删除
M.__removeCompleteGameInfoFromRecordWhenDeleteGame = function(game_pkg)
	for k, v in pairs(s_completeGamesInfo) do
		if v.game_pkg == game_pkg then
			table.remove(s_completeGamesInfo, k);
			return;
		end
	end
end

--@brief 记录users目录下完整游戏的信息
M.recordCompleteGameInfo = function(update_mode, game_pkg, version)
	local str = string.format("IosReplaceInstallLogic.recordCompleteGameInfo update_mode = %s, game_pkg = %s, version = %s ", update_mode or "", game_pkg or "", version or "");
	print_string(str);
	if not (update_mode and game_pkg) then
		return;
	end

	if update_mode ~= 2 then
		--不是下载或完整更新
		return;
	end
	
	--完整更新，则记录下来
	local s, e = string.find(game_pkg, "games/");
    if s and e then
        game_pkg =  string.sub(game_pkg, e+1);
    end

	local completeGamesInfo = {game_pkg = game_pkg, version = version};
	print_string("IosReplaceInstallLogic.recordCompleteGameInfo completeGamesInfo = " .. ( cjson.encode(completeGamesInfo) or "") );

	local found = false;
	for k, v in pairs(s_completeGamesInfo) do
		if v.game_pkg == completeGamesInfo.game_pkg then
			found = true;
			break;
		end
	end

	if not found then
		table.insert(s_completeGamesInfo, completeGamesInfo);
	end

	M.__saveDictData();
end
 
M.__isSameApkVersion = function()
	return s_lastApkVersion == M.__getCurApkVersion();
end

M.__getCurApkVersion = function()
	return dict_get_string("android_app_info","version_name") or "-1";
end

M.__loadDictData = function()
	local dictName = M.__getLocalDictName();
	dict_load(dictName);
	s_lastApkVersion = dict_get_string(dictName, "lastApkVersion") or "";
	local strGamesInfo = dict_get_string(dictName, "completeGamesInfo") or "[]";
	local completeGamesInfo = M.__jsonDecode(strGamesInfo);
	if M.__isTable(completeGamesInfo) then
		s_completeGamesInfo = completeGamesInfo;
	end
end

M.__saveDictData = function(dict)
	local dictName = M.__getLocalDictName();
	dict_set_string(dictName, "lastApkVersion", s_lastApkVersion or "");
	dict_set_string(dictName, "completeGamesInfo", cjson.encode(s_completeGamesInfo) or "");
	dict_save(dictName);
end

M.__getLocalDictName = function()
	return "IosReplaceInstallLogic";
end

M.__getFileName = function(path)
	if not path then
		return "";
	end

	path = string.gsub(path, "\\", "/");
	if path[#path] == '/' then
		path = string.sub(path, 0, #path - 1);
	end
	local ret = M.__split(path, "/");
	return ret[#ret];
end

M.__split = function(str, delim, maxNb)
    -- Eliminate bad cases...
    if string.find(str, delim) == nil then
        return { str }
    end
    if maxNb == nil or maxNb < 1 then
        maxNb = 0    -- No limit
    end
    local result = {}
    local pat = "(.-)" .. delim .. "()"
    local nb = 0
    local lastPos
    for part, pos in string.gfind(str, pat) do
        nb = nb + 1
        result[nb] = part
        lastPos = pos
        if nb == maxNb then break end
    end
    -- Handle the last field
    if nb ~= maxNb then
        result[nb + 1] = string.sub(str, lastPos)
    end
    return result;
end

M.__isTable = function (t)
    if type(t)=="table" then 
        return true;
    end
    return false;            
end

M.__stringIsEmpty = function (str)
	if (str == '' or str == nil) then
		return true
	end
	return false
end

M.__jsonDecode = function(s)
	local isSuccess, extInfo = pcall(cjson.decode, s);
	if isSuccess then
		return extInfo;
	end
	return nil;
end

return M;