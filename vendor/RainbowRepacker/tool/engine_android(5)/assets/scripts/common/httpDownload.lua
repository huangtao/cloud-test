require("core/object");

--该类支持断点续传
HttpDownload = class();

HttpDownload.getInstance = function()
    if not HttpDownload.s_instance then
        HttpDownload.s_instance = new(HttpDownload);
    end
    return HttpDownload.s_instance;
end

HttpDownload.releaseInstance = function()
    delete(HttpDownload.s_instance);
    HttpDownload.s_instance = nil;
end

HttpDownload.ctor = function(self)
    self.m_curid = 0; 
    self.m_callbacks = {};
end

HttpDownload.dtor = function(self)
    self.m_curid = 0; 

    for k, v in pairs(self.m_callbacks) do
        if v and v.handle then
            v.handle.abort(); --停止所有下载连接
        end
    end

    self.m_callbacks = {};
end


--下载
--url 下载地址，带文件名
--filePath 下载文件保存位置，带文件名
--timeout 下载超时时间，单位毫秒 如果 timeout为nil值，则认为不设置超时，让其根据OPT_LOW_SPEED_LIMIT， OPT_LOW_SPEED_TIME 这2个值来进行判断
--obj 下载结束回调及下载进度回调对象
--func 下载结束回调
--periodFunc 下载进度回调
--isResume 是否使用断点续传
HttpDownload.download = function(self, url, filePath, timeout, obj, func, periodFunc, isResume)
    if curl == nil then
        require("isolater/interface/reportIsolater");
        local errMsg = "HttpDownload.download cur is nil, please find the reason plugin load info = " .. System.getPluginLoadErrMsg();
        ReportIsolater.getInstance():umengError(errMsg);

        if _DEBUG then
            error(errMsg);
        end
        return;
    end

    local args = {
        url = url, 
        headers = {
            "Accept=*/*",--接受所有介质类型
            "Connection=Keep-Alive", --使用长连接
        },

        options = {
            [tostring(curl.OPT_LOW_SPEED_LIMIT)] = 1, --最低的下载速度 (此处不能设置为0，0代表不生效)
           [tostring(curl.OPT_LOW_SPEED_TIME)] = 5, --5s内的平均速度为小于一个字节，则认为超时
        },

        connecttimeout = 10, --此次连接请求的超时时间，单位秒 连接超时时间固定位10s
        writer = {
            type = 'file', --以文件的形式保存, rsp.content would be empty.
            filename = filePath, --文件本地保存的路径
            mode = 'w+b',--这里使用更新模式，所有以前的数据将被删除
        }, 
    }

    if timeout then
        --当timeout不为空时进行超时控制
        args.timeout = number.valueOf(timeout)/1000;
    end

    local downloadNums = 0;
    if isResume then
        local isExist = self:exists(filePath)
        if isExist then
            downloadNums = self:filesize(filePath) or 0
            table.insert(args.headers, 'Range: bytes=' .. downloadNums .. '-')
            args.writer.mode = 'a+b' --这里使用附加更新模式，以前的数据将被保留，在文件末尾续写数据
        end
    end

    local var
    if periodFunc then
        var = MVar.create();
        args.progress_var = var.id;
    end


    Log.v("HttpDownload.download args = ", args);

    local id = self:getId();
    local http = require('network.http2')
    local handle = http.request_async(args,
        function(rsp)
            Log.v("HttpDownload.download  http.request_async rsp = ", rsp, " URL = ", url);
            if (rsp.code == 200 or rsp.code == 206) then
                self:onDownloadProgress(id, 100);
                self:onDownloadResult(id, true);
            elseif rsp.code == 416 then --服务器不能满足客户在请求中指定的Range头,删掉重新下载
                os.remove(filePath)
                self:download(url, filePath, timeout, obj, func, periodFunc, false); --此时就不要在断点续传，防止死循环
            elseif rsp.errmsg then
                self:onDownloadResult(id, false);
            end
        end
    )
    self:saveInfo(id,obj,func,periodFunc,filePath,url,handle);

    if periodFunc then
        Clock.instance():schedule(function()
            local value = var:take(false)
            Log.v("HttpDownload.download  var:take value = ", value);
            if value then
                local total_download, current_download = unpack(json.decode(value))
                if total_download > 0 then
                    --过滤掉 0,0,0,0的情况
                    local ret = (downloadNums + current_download) * 100/ (total_download + downloadNums) ; --区间映射到1-100
                    if ret >= 0 and ret <= 100 then
                        self:onDownloadProgress(id, ret);
                    end
                    if ret >= 100 then return true end
                end
            end
            if var.closed then
                self:onDownloadProgress(id, 100);
                return true
            end
        end)
    end
end

HttpDownload.cancleGrapFile = function(self,url,file)
    local id = -1;
    for k,v in pairs(self.m_callbacks) do
        if table.isTable(v) then 
            if v.file == file then
                id = k;
                break;
            end
        end
    end

    if self.m_callbacks[id] then
        local handle = self.m_callbacks[id].handle;
        if handle then
            handle.abort();
        end
    end
    self.m_callbacks[id] = nil;
end

HttpDownload.getId = function(self)
    self.m_curid = self.m_curid + 1;
    return self.m_curid;
end

HttpDownload.saveInfo = function(self,id,obj,func,periodFunc,file,url,handle)
    self.m_callbacks[id] = {["obj"] = obj,["func"]=func,["file"]=file,["url"] = url,["periodFunc"]=periodFunc, ["handle"] = handle};
end

HttpDownload.onDownloadResult = function(self, id, result)
    local callback = self.m_callbacks[id];
    if callback and callback["func"] then
        callback["func"](callback["obj"],result,callback["file"],callback["url"]);
    end

    self.m_callbacks[id] = nil;
end

HttpDownload.onDownloadProgress = function(self, id, period)
    local callback = self.m_callbacks[id];
    if callback and callback["periodFunc"] then
        callback["periodFunc"](callback["obj"],period,callback["file"],callback["url"]);
    end
end

HttpDownload.exists = function(self, path)
    local file = io.open(path, "r")
    if file then
        io.close(file)
        return true
    end
    return false
end

HttpDownload.filesize = function(self, path)
    local size = false
    local file = io.open(path, "r")
    if file then
        local current = file:seek()
        size = file:seek("end")
        file:seek("set", current)
        io.close(file)
    end
    return size
end


--表单上传文件
--url 服务器地址 必传
--post 结构为table,其中每一个元素是一个table,每一个table表示一个服务器希望接受的类似 ‘name=value’的键值对。有三种不同的键值对的传递方式. 必传
--发送的数据类型为文件
-- {
--     type = "file",            -- 文件
--     name = "file",             -- 后台对应接受此数据的变量名称
--     filepath = "./sprite.png",  -- 需要上传的文件全路径
--     file_type = "image/png",   -- 上传的文件类型 Mime 类型
--      filename = "xxx.png",      -- 服务器上存储的名字，可不填，则采用服务器的默认策略
-- },
--发送的数据类型为变量
-- {
--  type = "content",      -- 变量
--  name = "name",         -- 服务器接受此内容的变量名称
--  contents = "upload",   -- 发送的内容
--  content_type = ""       -- 发送的类型,按照服务器端的要求来填写
--  },
--发送的数据类型为二进制流
-- {
--  type = "buffer",      -- 二进制流
--  name = "name",         -- 服务器接受此内容的变量名称
--  filename = "1321321321",   -- 发送的内容
--  buffer_type = ""       -- 发送类型,按照服务器端的要求来填写
-- },
--headers HTTP Headers(可选)
--cb_obj 上传回调对象(可选)
--cb_func 上传回调方法，参数为response及cb_func后面的透传参数 (可选)
HttpDownload.upload = function(self, url, post, headers, cb_obj, cb_func, ...)
    local http = require('network.http2')
    local params = {...}
    local args = {
        url = url,
        headers = headers or {},
        post = post
    }
    local function callback(rsp)
        if cb_func then
            cb_func(cb_obj, rsp, unpack(params))
        end
    end
    http.request_async(args, callback)
end