
require("core/constants");
require("core/object");
require("util/StringLib");
require("gameData/sensitiveWord");

local MoneyUtil = require("util/moneyFormatUtil");
local TimeUtil = require("util/timeFormatUtil");

ToolKit = {};

--@brief 获取二个时间戳相隔多少天
ToolKit.getDayInterval = function(timeA, timeB)
    return TimeUtil.getDayInterval(timeA, timeB);
end

--@brief 将long转换成:xx年xx月xx日xx时xx分xx秒格式
ToolKit.getTimeYMDHMS = function(time)
    return TimeUtil.getTimeYMDHMS(time);
end

--@brief 将long转换成:xx月xx日xx:xx:xx格式
ToolKit.getTimeMDHMS = function(time)
    return TimeUtil.getTimeMDHMS(time);
end

--@brief 拆分时间：00时:00分:00秒
ToolKit.skipTime = function(time)
    return TimeUtil.skipTime(time);
end

--@brief 拆分时间：00时:00分
ToolKit.skipTimeHM = function(time)
    return TimeUtil.skipTimeHM(time);
end

--@brief 将long转换成:xx-xx-xx
ToolKit.getTimeYMD2 = function(time)
    return TimeUtil.getTimeYMD2(time);
end

--@brief 拆分银币每3位用逗号隔开
ToolKit.skipMoney = function(curMoney)
    return MoneyUtil.skipMoney(curMoney);
end

--@brief 将将money以万、亿作为单位 并保留一位小数点
ToolKit.skipMoneyEx = function(curMoney)
    return MoneyUtil.skipMoney2(curMoney);
end

--@brief 同skipMoneyEx
ToolKit.skipMoney2 = function (curMoney)
    return MoneyUtil.skipMoney2(curMoney);
end

--@brief 同skipMoneyEx
ToolKit.skipMoneyEx2 = function (curMoney)
    return MoneyUtil.skipMoney2(curMoney);
end

--@brief 同skipMoneyEx
ToolKit.skipMoneyEx3 = function(curMoney)
    return MoneyUtil.skipMoney2(curMoney);
end

--@brief 同skipMoneyEx
ToolKit.skipMoneyNew = function(curMoney, mtype)
     return MoneyUtil.skipMoneyEx(curMoney);
end

--@brief 将money以万、亿作为单位，不保留小数点
ToolKit.skipMoneyEx4 = function(curMoney)
    return MoneyUtil.skipMoney3(curMoney);
end

--@brief 格式化金钱（四舍五入，不显示小数最后的0） curMoney：当前金钱 decimals:要显示的小数位
ToolKit.skipMoneyEx5 = function (curMoney, decimals)
    return MoneyUtil.skipMoney4(curMoney, decimals);
end

ToolKit.setDebugName = function( obj , name)
   if obj then
        obj:setDebugName(name);
   end 
end

--获取从头开始的指定长度的子字符串，可以避免子字符串末尾处中文乱码问题
--str：源字符串
--count：子字符串长度
--return：子字符串，无需进行转码，即可显示
ToolKit.getSubStr = function ( str,count )
    if str=="" then
        return str;
    end
    local s=GameString.convert2UTF8(str);
    local i=1;
    local cn={};
    while i<=string.len(s) do
        local ss=string.sub(s,1,i);
        local len=string.lenutf8(ss);
        if len+#cn*2<i then
            table.insert(cn,i);
            i=i+3;
        else
            i=i+1;
        end
    end
    for i=1,#cn do
        cn[i]=cn[i]-(i-1);
        if cn[i]==count then
            count=count-1;
            break;
        end
    end
    return string.sub(GameString.convert2Platform(s),1,count);
end

---- lua 日志上报
ToolKit.lastLuaErrorCheck = function()
    if NativeEvent.s_platform == kPlatformWin32 then
        return;
    end
    local luaError = sys_get_string("last_lua_error") or "";
    if luaError =="" then
        Log.v("lastLuaErrorCheck" , "lastLuaErrorCheck luaError is empty!");
    else
        local elmError = dict_get_string("sys_error","lua_load") or "";
        if elmError~="" then
            Log.v("elmError:",elmError);
            luaError = "Bad file number...";--elmError;
            --暂时先屏蔽，日志应该积攒够了。
            -- dict_set_string("sys_error","lua_load","");--means clear
            -- local elmFile = dict_get_string("sys_error","lua_file") or "";
            -- if elmFile~="" then
            --     -- upload file to php server
            --     ToolKit.uploadFile(elmFile);
            --     Log.v("elmFile",elmFile);
            --     dict_set_string("sys_error","lua_file","");
            -- end
        end
        local phoneModel = System.getPhoneModel();
        luaError , flag = ToolKit.luaErrorType(luaError);
        sys_set_string("last_lua_error","");
        Log.v("last_lua_error cleared");
        if flag then return; end
        dict_load(kDFQPGame);
        local crashPrefix = "lua crash:";
        local separator = "|";
        local gameVersion = dict_get_string(kDFQPGame,kGameVersion) or "0";
        local userId = dict_get_int(kDFQPGame , kUserId,0);
        local errorFd = "-";--dict_get_string("error_fd","error_fd") or "";
        local date = os.date("%Y/%m/%d %H:%I:%S" , os.time());
        local separator1 = "-------------------------"; -- 适应umeng 上报规则
        local gamesVersionMap = dict_get_string(kDFQPGame,"GamesVersionMap") or "";

        local errMsg =  "--pluginerror=" .. (System.getPluginLoadErrMsg() or "");

        luaError = string.concat(
            crashPrefix , gameVersion , separator ,
            gamesVersionMap , separator ,
            userId , separator , 
            date , separator , 
            phoneModel , separator ,
            "main" , separator , 
            errorFd , separator1 , 
            luaError ,errMsg
            );
        Log.v("lastLuaErrorCheck" , "lastLuaErrorCheck luaError:" , luaError);
        -- 上报到友盟
        NativeEvent.getInstance():umengError("lua" , luaError);
        
    end
end

--获取lua 错误类型
ToolKit.luaErrorType = function(errStr)
    local errTab = {
        "\'=\' expected";
        "No such file or directory";
        "bad header in precompiled chunk";
    }
    --XXX umeng bug 机型为Coolpad 7295C 会报重复错误信息
    --    1.3.4 过滤此机型重复报错内容
    local falg = false;
    local phoneModel = System.getPhoneModel();
    local umengBugPhoneModel = "Coolpad 7295C";
    for k , v in pairs(errTab) do 
        if string.find(errStr , v) then
            errStr = v;
            if errStr == errTab[2] and string.find(phoneModel , umengBugPhoneModel) then
                falg = true;
            end
            break;
        end
    end
    return errStr , falg;
end


--FIXME 临时增加内存回收方法 测试内存泄露
ToolKit.tempCollectgarbage = function()
    if not _DEBUG then return; end 
    Log.i("ToolKit.tempCollectgarbage->" , "内存回收 start ...");
    local animCollect = new(AnimInt,kAnimRepeat, 0, 1 , 300, -1);
    animCollect:setDebugName("animCollect");
    animCollect:setEvent(obj,
        function(obj,anim_type, anim_id, repeat_or_loop_num)
            Log.i("ToolKit.tempCollectgarbage->" , "内存回收 start ...");
            collectgarbage("collect");
        end
    );
end

ToolKit.uploadFile = function(filePath)
    local info = {};
    info.app = kClientInfo:getAppId();
    info.action = "report.file";
    info.url = ServerConfig.getInstance():getHostUrl();
    info.filePath = filePath;
    info.timeout = 10000;
    info.time = os.time();
    info.sigkey = md5_string("LOG**CRASH@@FILE" .. info.time);
    info.fileKey = "file";
    info.mimeType = "application/octet-stream";
    local json_data = json.encode(info);
end

--统计引擎报错次数到umeng
ToolKit.uploadDumpToUmeng = function()
    local dump = "dumpError";
    -- 上报到友盟
    NativeEvent.getInstance():umengError("dump" , dump);
end

------------------------------------用于动态显示图片------------------------
ToolKit.getNextImagePos = function(pos , obj , space , imageWidth)
    space = space or 0;
    if(not imageWidth) then
        local width , height = obj:getSize();
        pos.x = pos.x + width + space;
    else
        pos.x = pos.x + imageWidth + space;
    end
    return pos;
end

ToolKit.getNum=function (val,arr,count )
    local val=val;
    local index=1;
    if val==0 then 
        arr[1]=0;
    else
        while val>0 do
            arr[index]= val%10;
            val=math.floor(val/10);
            index=index+1;
        end
        for i=index,count do
            arr[i]=0;
        end
    end
end

--去除空格
ToolKit.trim = function(s)
    -- return (string.gsub(s,"^%s*(.-)%s*$","%1"));
    return (string.gsub(s, " ", ""));
end

ToolKit.isValidString = function(str)
    return str and str ~= ""; 
end

-- 将前缀 key 和 图片地址进行md5加密
ToolKit.getMd5ImageName = function(kPrefix, key, imgUrl)
    key = key or 0;
    imgUrl = imgUrl or "";
    kPrefix = kPrefix or "";
    local md5Str = string.sub(md5_string(imgUrl),9,24);
    return kPrefix .. "_" .. key .. "_" .. md5Str .. ".png";
end

ToolKit.getMd5Key = function(md5Str)
    local startPos, endPos = string.find(md5Str, "%_%w+%_");
    if startPos and endPos then
        return string.sub(md5Str, startPos + 1, endPos - 1);
    end
    return "";
end

ToolKit.getIntPart = function(num)
   
    if num <= 0 then
       return math.ceil(num);
    end
    if math.ceil(num) == num then
       num = math.ceil(num);
    else
       num = math.ceil(num) - 1;
    end
    return num;
end

ToolKit.clickLimit = function(intervalTime)
    intervalTime = intervalTime or 500;
    local nowTime = System.getBootTime();
    if (nowTime - (ToolKit.lastCickTime or 0)) < intervalTime then
        return true;
    end
    ToolKit.lastCickTime = nowTime;
    return false;
end

ToolKit.safeRequire = function(filename)
	package.loaded[filename] = nil;

    local isSuccess, ret = pcall(require, filename);
    if isSuccess then
        return ret;
    else
        return nil;
    end
end

--是否开启屏蔽词（设置后会影响所有的输入框，使用后要及时恢复该状态）
ToolKit.setIsShieldSensitiveWord = function(isShield) 
    ToolKit.m_isShieldSensitiveWord = isShield;
end

ToolKit.shieldSensitiveWord = function(orgMsg)
    if not orgMsg then
        return "";
    end

    if ToolKit.m_isShieldSensitiveWord == false then --不设置的时候默认为开启屏蔽词
        return orgMsg;
    end 

    Log.v("orgMsg = ", orgMsg);

    local replaceWord = {"*", "**", "***", "****"};
    for k, v in ipairs(KSensitiveWord) do
        local len = math.floor( string.len(v)/3 ); --注意一个中文字符，长度为3
        if len > 4 then --最多用4个"*"替换
            len = 4;
        end
        if len < 1 then
            len = 1;
        end

        orgMsg = string.gsub(orgMsg, v, replaceWord[len]);
    end

    return orgMsg;
end

--获取utf8字符串的子字符串
ToolKit.utf8_substring = function(str, first, num)
    local ret = "";
    
    local n = string.len(str);
    local offset = 1;
    local cp;
    local b, e;
    local i = 1;
    while i <= n do
        if not b and offset >= first then
            b = i;
        end;
        if not e and offset >= first + num then
            e = i;
            break;
        end;
        cp = string.byte(str, i);
        if cp >= 0xF0 then
            i = i + 4;
            offset = offset + 2;
        elseif cp >= 0xE0 then
            i = i + 3;
            offset = offset + 2;
        elseif cp >= 0xC0 then
            i = i + 2;
            offset = offset + 2;
        else
            i = i + 1;
            offset = offset + 1;
        end;
    end;
    
    if not b then
        return "",0;
    end;
    
    if not e then
        e = n + 1;
    end;
    
    ret = string.sub(str, b, e-b);

    return ret,offset-1;
end;

ToolKit.subString = function(str,strMaxLen)
    if nil == str then
        return "";
    end
    return ToolKit.utf8_substring(str, 1, strMaxLen);
end

ToolKit.split = function(str, delim, maxNb)
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

ToolKit.formatNick = function(nick,count)
    local subStr = ToolKit.subString(nick, count or 8);
    if subStr == "" then
    elseif subStr ~= nick then
        subStr = subStr .. ".."
    end;
    return subStr;
end

ToolKit.utf8_len = function(str)
    local n = string.len(str);
    local utf_count = 0;
    local cn, en = 0, 0
    local p_byte;
    local i = 1;
    while i <= n do
        p_byte = string.byte(str, i);
        if p_byte >= 0xF0 then
            i = i + 4;
            utf_count = utf_count + 1;
            cn = cn + 1
        elseif p_byte >= 0xE0 then
            i = i + 3;
            utf_count = utf_count + 1;
            cn = cn + 1
        elseif p_byte >= 0xC0 then
            i = i + 2;
            utf_count = utf_count + 1;
            cn = cn + 1
        else
            i = i + 1;
            utf_count = utf_count + 1;
            en = en + 1
        end;
    end;

    return utf_count, cn, en;
end;

-- 用来截取utf8字符串
-- utf8_sub("hi你好", 1, 3) --> hi你
-- utf8_sub("hi你好", 4, 4) --> 好 
ToolKit.utf8_sub = function(str, u_start, u_end)
    local ret = "";

    local n = string.len(str);
    local offset = 1;
    local cp;
    local b, e;
    local i = 1;
    while i <= n do
        if not b and offset >= u_start then
            b = i;
        end;
        
        cp = string.byte(str, i);
        if cp >= 0xF0 then
            i = i + 4;
        elseif cp >= 0xE0 then
            i = i + 3;
        elseif cp >= 0xC0 then
            i = i + 2;
        else
            i = i + 1;
        end;
        offset = offset + 1;


        if not e and offset > u_end then
            e = i-1;
            break;
        end;
    end;
    
    if not b then
        return "",0;
    end;

    if not e then
        e = n;
    end;

    ret = string.sub(str, b, e);

    return ret,offset-1;
end;

ToolKit.index = 99999;
ToolKit.getIndex = function()
    ToolKit.index = ToolKit.index + 1;
    return ToolKit.index;
end
getIndex = ToolKit.getIndex;
