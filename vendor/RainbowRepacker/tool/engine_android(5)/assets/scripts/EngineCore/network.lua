
package.preload[ "network/http" ] = function( ... )
if curl ~= nil then
    return require('network.http_compat')
else
    return require('network.http_old')
end

end
        

package.preload[ "network.http" ] = function( ... )
    return require('network/http')
end
            

package.preload[ "network/http2" ] = function( ... )
---
-- 新http库
-- @module network.http2
-- @usage local Http = require('network.http2')
local M = {}
local _pool
local function pool()
    if not _pool then
        _pool = ThreadPool(1, 10, false)
    end
    return _pool
end

local function http_worker(args)
    local function buffer_writer()
        local result
        local closed = true
        return {
            open = function()
                result = {}
                closed = false
            end,
            write = function(buf)
                table.insert(result, buf)
            end,
            close = function()
                closed = true
                local s = table.concat(result)
                result = nil
                return s
            end,
            closed = function()
                return closed
            end,
        }
    end

    local function file_writer(filename,mode)
        local fp
        local closed = true
        return {
            open = function()
                closed = false
                mode = mode or "wb"
                fp = io.open(filename, mode)
            end,
            write = function(buf)
                fp:write(buf)
            end,
            close = function()
                closed = true
                fp:close()
                fp = nil
            end,
            closed = function()
                return closed
            end,
        }
    end

    local function chan_writer(chan_id)
        local ch
        local closed = true
        return {
            open = function()
                ch = Chan.get_by_id(chan_id)
                closed = false
            end,
            write = function(buf)
                ch:put(buf)
            end,
            close = function()
                closed = true
                ch:close()
                ch = nil
            end,
            closed = function()
                return closed
            end,
        }
    end

    local function urlencode(easy, args)
        if type(args) == 'table' then
            local buf = {}
            for k, v in pairs(args) do
                table.insert(buf, string.format('%s=%s', easy:escape(k), easy:escape(v)))
            end
            return table.concat(buf, '&')
        else
            return easy:escape(tostring(args))
        end
    end

    args = cjson.decode(args)
    local writer
    if args.writer ~= nil then
        if args.writer.type == 'file' then
            writer = file_writer(args.writer.filename, args.writer.mode)
        elseif args.writer.type == 'chan' then
            writer = chan_writer(args.writer.chan_id)
        else
            error('invalid writer argument')
        end
    else
        writer = buffer_writer()
    end
    local abort_var = MVar.get_by_id(args._abort_var_id)

    local progress_var
    local function execute(args)
        local easy = curl.easy()

        -- 设置自动跳转
        easy:setopt(curl.OPT_FOLLOWLOCATION,1)
        -- 设置最大跳转次数
        easy:setopt(curl.OPT_MAXREDIRS,10)
        local url = args.url
        if args.query then
            if not string.find(url, '?') then
                url = url .. '?'
            end
            url = url .. urlencode(easy, args.query)
        end
        if args.useragent then
            easy:setopt(curl.OPT_USERAGENT, args.useragent)
        end

        easy:setopt(curl.OPT_NOSIGNAL, 1)
        easy:setopt(curl.OPT_SSL_VERIFYPEER, 0)
        easy:setopt(curl.OPT_SSL_VERIFYHOST, 0)
        if args.connecttimeout then
            easy:setopt_connecttimeout(args.connecttimeout)
        end

        if args.timeout then
            easy:setopt_timeout(args.timeout)
        end

        local headers = {}
        easy:setopt_url(url)
            :setopt_writefunction(function(buf)
                if abort_var:take(false) then
                    return false
                end
                writer.write(buf)
            end):setopt_headerfunction(function ( head )
                local s,e = string.find(head, ": ")
                if s then
                    local key = string.sub(head, 1,s-1)
                    local value = string.gsub(string.sub(head, e,#head), "^%s*(.-)%s*$", "%1") 
                    headers[key] = value
                end
            end)
        if args.progress_var then
            progress_var = MVar.get_by_id(args.progress_var)
            easy:setopt(curl.OPT_NOPROGRESS, 0)
            easy:setopt_progressfunction(function(total_download, current_download, total_upload, current_upload)
                if abort_var:take(false) then
                    return false
                end
                progress_var:modify(cjson.encode{
                    total_download, current_download, total_upload, current_upload
                })
            end)
        end
        if args.headers and #args.headers > 0 then
            easy:setopt_httpheader(args.headers)
        end
        local form 
        if args.post ~= nil then
            if type(args.post) == "string" then
                easy:setopt_postfields(args.post)
            else
                form = curl.form()
                for i,v in ipairs(args.post) do
                    if type(v) == "table" then
                        if v.type == "file" then
                            form:add_file(v.name or "",
                            v.filepath or "",
                            v.file_type or "text/plain",
                            v.filename,
                            v.headers)
                        elseif v.type == "content" then
                            form:add_content(v.name or "",v.contents or "",
                                    v.content_type or nil,v.headers)
                        elseif v.type == "buffer" then
                            form:add_buffer(v.name or "",v.filename ,
                                    v.content or "",
                                    v.buffer_type ,v.headers)
                        end
                    end
                end
                easy:setopt_httppost(form)
            end
        elseif args.put ~= nil then
            args.options[curl.OPT_PUT] = 1
            easy:setopt_readfunction(function (  )
                return tostring(args.put)
            end)
        end
        if args.options then
            for k, v in pairs(args.options) do
                easy:setopt(tonumber(k), v)
            end
        end

        local ok, msg = pcall(function()
            easy:perform()
        end)
        local result
        if ok then
            -- only close if success.
            result = writer.close()
        end

        if form then
            form:free()
        end

        local rsp
        if ok then
            rsp = {
                code = easy:getinfo(curl.INFO_RESPONSE_CODE),
                content = result,
                tags = args.tags,
                headers = headers,
            }
            easy:close()
            return rsp
        else
            rsp = {
                errno = easy:getinfo(curl.INFO_OS_ERRNO),
                errmsg = msg,
            }
            easy:close()
        end
        return rsp
    end
    writer.open()
    if not args.options then
        args.options = {}
    end
    args.options[curl.OPT_IPRESOLVE] = 1 -- AF_INET
    local begin
    if Clock then
        begin = Clock.now()
    end
    local rsp = execute(args)
    if rsp.errno == 51 then -- network unreachable.
        if Clock then
            local passed = (Clock.now() - begin) / 1000
            if args.connecttimeout then
                args.connecttimeout = args.connecttimeout - passed
            end
        end
        if not args.connecttimeout or args.connecttimeout > 0 then
            args.options[curl.OPT_IPRESOLVE] = 2 -- AF_INET6
            rsp = execute(args)
        end
    end
    if progress_var then
        progress_var:close()
    end
    if not writer.closed() then
        writer.close()
    end
    return cjson.encode(rsp)
end

---
-- 发起http请求，异步接口，通过回调函数获取结果。
-- @function [parent=#network.http2] request_async
-- @param #table args 参数
-- @param #function callback 接受rsp的回调, 成功时rsp为``{code=#number, content=#string}``，失败时rsp为``{errmsg=#string}``
-- @return #table 该返回table现只有一个字段 'abort' 为function类型，可以用于取消一个http连接。
-- 
--
--
-- #args有以下可选字段。
--
-- args.url 
-----------------
-- 
-- 类型: #string
--
-- 请求需要的url地址。 此参数必须有。
--
-- args.query 
-----------------
-- 
-- 类型: #string 或 #table
-- 
-- 可选参数。<br>
-- HTTP 查询字符串 (HTTP query string) 是由问号 (?) 之后的值规定的。
-- 例如:http://www.w3school.com.cn/test/names.asp?a=John&b=Susan
-- 其中a=John&b=Susan就是查询字符串，你可以用 query = 'a=John&b=Susan' 方式来传递，
-- 也可以用table的格式来传递，例如:query = {a='John',b='Susan'} 的方式来传递。
--
--
-- args.useragent 
-----------------
-- 
-- 类型: #string 
-- 
-- 可选参数。<br>
-- userAgent 属性是一个只读的字符串，是一个特殊字符串头，被广泛用来标示浏览器客户端的信息，使得服务器能识别客户机使用的操作系统和版本，CPU类型，浏览器及版本，浏览器的渲染引擎，浏览器语言等。
-- 例如：useragent = 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.2; SV1; .NET CLR 1.1.4322)'。
-- 
--
-- args.headers 
-----------------
-- 
-- 类型: #table 
-- 
-- 可选参数。<br>
-- headers 包含了客户端环境与请求实体的一些有用的信息。你可以在此处填写你想要的请求头信息，例如'Content-Type','Accept-Charset'等。
--
-- 使用的方式为每一个请求头信息都是一个字符串 'Content-Type:application/json',你可以在table中添加多个请求信息.
--
-- <pre> 
-- <p>headers = 
--     {'Content-Type:application/json',
--      'Accept:application/json',
--      'charset:utf-8'
--      }
-- </p>
-- </pre> 
--
--
--
--
--
--
-- args.timeout 
-----------------
-- 
-- 类型: #number 
-- 
-- 可选参数。<br>
-- timeout表示此次连接的总超时时间，单位s。例如:timeout = 20。
-- 
--
-- args.connecttimeout 
-----------------
-- 
-- 类型: #number 
-- 
-- 可选参数。<br>
-- connecttimeout表示此次连接请求的超时时间，单位s。例如:connecttimeout = 10。
--
--
-- args.post 
-----------------
-- 
-- 类型: #string 
-- 
-- 可选参数。<br>
-- 你可以将一个http post请求完整的数据通过给定的string进行发送，需要用户来保证此数据是服务器端希望接受的格式。此时的默认的'Content-Type' 为'application/x-www-form-urlencoded',
-- 如果你需要传递不同的类型，那么你需要在headers中去显示的表示。例如传递json，你需要显示的指定'Content-Type' 为'application/json'。
-- 
-- <pre> 
-- <p>headers = {
--             'Content-Type:application/json',
--             'Accept:application/json',
--             'charset:utf-8'
--         },
--   post = cjson.encode({a=1,b=2}),
-- </p>
-- </pre> 
-- 
--
-- args.post 
-----------------
-- 
-- 类型: #table 
-- 
-- 可选参数。<br>
-- 如果你需要multipart/formdata HTTP POST 的方式进行请求，那么你可以用table的方式进行传参。
-- 
-- post的每一个元素都是一个table,每一个table表示一个服务器希望接受的类似 ‘name=value’的键值对。有三种不同的键值对的传递方式.
--
-- <pre> 
-- <p>
--  {
--      type = "file",            -- post 发送的数据类型 有'file' (表示文件)，'content'(表示变量)，'buffer' (表示二进制流)。
--      name = "file",             -- 后台对应接受此数据的变量名称
--      filepath = "./sprite.png",  -- 需要上传的文件全路径
--      file_type = "image/png",   -- 上传的文件类型
--   -- filename = "xxx.png",      -- 服务器上存储的名字，可不填，则采用服务器的默认策略
--  },
-- </p>
-- </pre> 
--
-- <pre> 
-- <p>
--  {
--      type = "content",      -- post 发送的变量
--      name = "name",             -- 服务器接受此内容的变量名称
--      contents = "upload",   -- 发送的内容
--      content_type = ""       -- 发送的类型,按照服务器端的要求来填写
--  },
-- </p>
-- </pre> 
-- <pre> 
-- <p>
--  {
--      type = "buffer",      -- post 发送的二进制流
--      name = "name",         -- 服务器接受此内容的变量名称
--      filename = "1321321321",   -- 发送的内容
--      buffer_type = ""       -- 发送类型,按照服务器端的要求来填写
--  },
-- </p>
-- </pre> 
--
-- args.writer  
-----------------
-- 
-- 类型: #table 
-- 
-- 可选参数。<br>
-- 如果需要http下载的功能，那么你需要要有此字段。如果没有，将在请求完成后的content中以字符串的方式返回。<br>
-- 有两种不同的下载方式:写入到文件和写入到管道。
-- 
-- <pre> 
-- <p>
--  writer = {                    
--          type = 'file',              -- 以文件的形式保存, rsp.content would be empty.
--          filename = './log.txt',     -- 文件本地保存的路径
--          mode = 'wb',                -- 文件写入的模式
--       },
-- </p>
-- </pre> 
-- <pre> 
-- <p>
--   writer = {                     -- optional, override writer behaviour.
--      type = 'chan',              -- 以chan来保存流, rsp.content would be empty.
--      chan_id = chan.id,          -- 保存二进制流的chan的id。
--   },
-- </p>
-- </pre> 
--
--
-- args.progress_var 
-----------------
-- 
-- 类型: #number 
-- 
-- 可选参数。<br>
-- 通过传入一个Mvar的id，你可以通过此id得到当前的下载进度。
--
--
-- @usage
-- --取消一个http连接
-- Http = require('network.http2')
-- local event = Http.request_async({
--         url = 'http://127.0.0.1:8000/log.txt',  -- required
--     }, function(rsp) end)
--  event.abort()    -- 取消一个连接
--
--
-- @usage
--采用put的方式上传一个json,如果有post字段存在则会覆盖put.
-- Http = require('network.http2')
-- local event = Http.request_async({
--         url = 'http://127.0.0.1:8000',  -- required
--         put = cjson.encode{a=1,b=2},
--     }, function(rsp) end)
--
--
--
--
-- @usage 
-- -- 下载文件并读取下载进度
-- local var = MVar.create()
--     Http = require('network.http2')
--     Http.request_async({
--         url = 'http://127.0.0.1:8000/log.txt',  -- required
--         timeout = 10,                    -- optional, seconds
--         connecttimeout = 20,             -- optional, seconds
--         writer = {                     -- optional, override writer behaviour.
--          type = 'file',              -- save to file, rsp.content would be empty.
--          filename = './log.txt',
--          mode = 'wb',
--       },
--       progress_var = var.id,         -- optional, id of mvar used to receive progress infomation.
--     }, function(rsp)
--       if rsp.errmsg then
--         print_string('failed', rsp.errmsg)
--       else
--         print_string('success', rsp.code, rsp.content)
--       end
--     end)
--     Clock.instance():schedule(function()
--         -- query without blocking.
--         local value = var:take(false)
--         if value then
--             local total_download, current_download, total_upload, current_upload = unpack(cjson.decode(value))
--             print('download progress:', current_download / total_download)
--         end
--         if var.closed then
--             -- stop when MVar is closed.
--             return true
--         end
--     end)
--
--
-- @usage
-- -- 表单上传文件
-- local var = MVar.create()
--   Http = require('network.http2')
--   Http.request_async({
--       url = 'http://127.0.0.1:8000',  -- required
--       headers = {
--           'referer:hello'             -- 需要填写的header
--       },
--       post = {                       -- optional, set upload data
--           {
--               type = "file",            -- post 发送的数据类型 有'file' (表示文件)，'content'(表示变量)，'buffer' (表示二进制流)。
--               name = "file",             -- 后台对应接受此数据的变量名称
--               filepath = "./sprite.png",  -- 需要上传的文件全路径
--               file_type = "image/png",   -- 上传的文件类型
--            -- filename = "xxx.png",      -- 服务器上存储的名字，可不填，则采用服务器的默认策略
--           },
--           {
--               type = "content",      -- post 发送的变量
--               name = "name",             -- 服务器接受此内容的变量名称
--               contents = "upload",   -- 发送的内容
--               content_type = ""       -- 发送的类型
--           },
--       }
--   }, function(rsp)
--     if rsp.errmsg then
--       print_string('failed', rsp.errmsg)
--     else
--       print_string('success', rsp.code, rsp.content)
--     end
--   end)
-- @usage
-- -- 普通的post请求
--   Http = require('network.http2')
--   Http.request_async({
--       url = 'http://127.0.0.1:8000',  -- required
--       headers = {
--           'referer:hello'             -- 需要填写的header
--       },
--       post = "a=1"
--   }, function(rsp)
--     if rsp.errmsg then
--       print_string('failed', rsp.errmsg)
--     else
--       print_string('success', rsp.code, rsp.content)
--     end
--   end)
-- @usage
-- -- 更多参数
-- Http = require('network.http2')
-- Http.request_async({
--   url = 'http://www.boyaa.com',  -- required
--   query = {                      -- optional, query_string
--      a = 1,
--   },
--   useragent = '',                -- optional
--   headers = {                    -- optional, http headers,
--      'XX-Header: xxx',
--   },
--   timeout = ,                    -- optional, seconds
--   connecttimeout = ,             -- optional, seconds
--   post = 'a=1&b=2',              -- optional, set post data, and change http method to post.
--   post = {                       -- optional, set upload data
--     {
--         type = "file",
--         name = "file",
--         filepath = "./blurWidget_before.png",
--         file_type = "image/png",
--         -- filename = "xxx.png",
--     },
--     {
--         type = "file",
--         name = "file",
--         filepath = "./log.txt",
--     },
--     {
--         type = "content",
--         name = "",
--         contents = "upload",
--         content_type = ""
--     },
--     {
--         type = "buffer",
--         name = "",
--         filename = "log.txt",
--         contents = "1321313213132",
--         buffer_type = "text/plain"
--     },
--   },
--   writer = {                     -- optional, override writer behaviour.
--      type = 'file',              -- save to file, rsp.content would be empty.
--      filename = '/path/to/file',
--      mode = 'wb',
--   },
--   writer = {                     -- optional, override writer behaviour.
--      type = 'chan',              -- send response content stream through Chan, rsp.content would be empty.
--      chan_id = chan.id,
--   },
--   progress_var = var.id,         -- optional, id of mvar used to receive progress infomation.
-- }, function(rsp)
--   if rsp.errmsg then
--     print_string('failed', rsp.errmsg)
--   else
--     print_string('success', rsp.code, rsp.content)
--   end
-- end)
--
function M.request_async(args, callback)
    local abort_var = MVar.create()
    args._abort_var_id = abort_var.id
    local obj = {
        abort = function()
            abort_var:put('abort', false)
        end,
    }
    if not M._running_task then
        M._running_task = {}
    end
    table.insert(M._running_task, obj)

    pool():lua_task(http_worker, function(rsp)
        -- remove from running task
        for i, t in ipairs(M._running_task) do
            if t == obj then
                table.remove(M._running_task, i)
                break
            end
        end
        local tmp = abort_var -- prevent gc-ed
        callback(cjson.decode(rsp))
    end, cjson.encode(args))
    return obj
end

function M.abort_all()
    for _, t in ipairs(M._running_task or {}) do
        t.abort()
    end
end

---
-- http同步请求，在``tasklet``中执行，详细的参数描述见``request_async``。
-- @function [parent=#network.http2] request
-- @param #table args
-- @return #table rsp 成功时rsp为``{code=#number, content=#string}``，失败时rsp为``{errmsg=#string}``
-- @usage
-- local rsp = Http.request({
--     url = 'http://www.boyaa.com'
-- })
-- if rsp.errmsg then
--     print('request failed', rsp.errmsg)
-- else
--     print('response', rsp.code, rsp.content)
-- end
function M.request(args)
    return coroutine.yield(function(callback)
        M.request_async(args, callback)
    end)
end






return M

end
        

package.preload[ "network.http2" ] = function( ... )
    return require('network/http2')
end
            

package.preload[ "network/http_compat" ] = function( ... )
-- http.lua
-- Author: Vicent Gong
-- Date: 2012-09-30
-- Last modification : 2013-05-29
-- Description: provide basic wrapper for http functions

--------------------------------------------------------------------------------
-- 用于简单的http请求。
-- **规范请参考 [RFC2616](http://www.ietf.org/rfc/rfc2616.txt)。**
-- @module network.http
-- @return #nil
-- @usage require("network.http")


require("core.object");
require("core.system");
require("core.constants");
require("core.global");
local Http2 = require('network.http2')

--- http请求类型：get
kHttpGet    = 0;
--- http请求类型：post
kHttpPost   = 1;
--- http返回类型(这是唯一可用的类型)
kHttpReserved = 0;

---
--@type Http
Http = class();
Http.s_platform = System.getPlatform();

---
-- 构造方法.
-- 
-- @param self
-- @param #number requestType http请求类型（未使用）。 取值[```kHttpGet```](network.http.html#kHttpGet)、
-- [```kHttpPost```](network.http.html#kHttpPost)。Android、win32平台目前只支持post方式，win10、ios平台均支持Get和Post两种方式。
-- @param #number responseType （未使用）。目前仅能取值[```kHttpReserved```](network.http.html#kHttpReserved)。
-- @param #string url 请求的url。
Http.ctor = function(self, requestType, responseType, url)
    self.m_url = url
    self.m_headers = {}
    self.m_requestType = requestType
    self.m_data = ''
    self.m_eventCallback = {}
end


---  
-- 析构方法.
-- 
-- @param self
Http.dtor = function(self)
    if self.m_response == nil then
        -- not finished, abort
        self:abortRequest()
    end
end


---
-- 设置请求超时时间.  
-- 若多次设置，则取最后一次的值。在@{#Http.execute}前设置才有效 。
-- 
-- @param self
-- @param #number connectTimeout 请求超时时间，单位毫秒。  
-- Android平台：若设置小于1000，则默认为1000；  
-- win32、ios平台：超时时间参考 [RFC2616](http://www.ietf.org/rfc/rfc2616.txt)；  
-- win10平台：默认为10000。
-- @param #number timeout Android、win32、win10平台未使用；ios平台表示[请求过程的最长耗时](https://curl.haxx.se/libcurl/c/CURLOPT_TIMEOUT.html)。
Http.setTimeout = function(self, connectTimeout, timeout)
    self.m_connecttimeout = connectTimeout
    self.m_timeout = timeout
end

---
-- 设置请求消息的User-Agent.
-- 
-- 在@{#Http.execute}前设置才有效。
-- Android未实现；    
-- win32平台：若未调用@{#Http.setAgent}，将使用默认值`Mozilla/5.0 (iPhone; U; CPU like Mac OS X; en) AppleWebKit/420+ (KHTML, like Gecko) Version/3.0 Mobile/1C28 Safari/419.3`；  
-- win10平台：已实现，无默认值。  
-- ios平台:若未调用@{#Http.setAgent},将使用默认值`Mozilla/5.0 (iPhone; U; CPU like Mac OS X; en) AppleWebKit/420+ (KHTML, like Gecko) Version/3.0 Mobile/1C28 Safari/419.3`。
-- @param self
-- @param #string str 请求消息的userAgent。
Http.setAgent = function(self, str)
    self.m_userAgent = str
end

---
-- 请求消息添加Header.
--   
-- Android平台未实现；  
-- win32平台:首个header为“Accept-Encoding:UTF-8”；用户多次调用@{#Http.addHeader}之后,win32平台上将依次添加header到请求消息中；  
-- win10：用户调用@{#Http.addHeader}之后,平台添加header到请求消息中。每个请求添加多次header时，取最后一次的header；  
-- ios平台：用户多次调用@{#Http.addHeader}之后,平台依次添加header到请求消息中。
-- @param self
-- @param #string str 请求消息的Header。
Http.addHeader = function(self, str)
    table.insert(self.m_headers, str)
end


---
-- 设置请求消息的body.  
-- 
-- 仅支持post请求。
-- Android、win32、win10、ios平台均已实现:请求的消息body默认为空；调用@{#Http.setData}后，更新请求消息的body。
--
-- @param self
-- @param #string str 请求消息的body。
Http.setData = function(self, str)
    self.m_data = str
end

---
-- 发送请求.
--   
-- Android、win32、ios平台请求完成后首先回调[```event_http_response_httpEvent```](network.http.html#event_http_response_httpEvent)方法，然后回调@{#Http.setEvent}方法；  
-- win10平台请求完成后，回调@{#Http.setEvent}方法。
-- 
-- @param self
Http.execute = function(self)
    self.m_req = Http2.request_async({
        url = self.m_url,
        headers = self.m_headers,
        post = self.m_requestType == kHttpPost and self.m_data or nil,
        connecttimeout = self.m_connecttimeout,
        timeout = self.m_timeout,
        useragent = self.m_userAgent,
    }, function(rsp)
        self.m_response = rsp
        if self.m_aborted then
            return
        end
        if not rsp.errmsg and self.m_eventCallback.func then
            self.m_eventCallback.func(self.m_eventCallback.obj, self)
        end
    end)
end

---
-- 取消请求，在@{#Http.execute}之后执行有效.
-- 注：此方法并没有真正取消请求，而是改变了一个变量的值供各平台调度，以达到真正意义上取消请求的目的。
-- 
-- Android、win32平台未实现；    
-- win10、ios平台已实现:调用各自平台的取消方法来达到取消请求的目的。
--
-- @param self
Http.abortRequest = function(self)
    self.m_aborted = true
    if self.m_req then
        self.m_req:abort()
    end
end

---
-- 请求是否被取消.
-- 
-- Android、win32平台未实现；  
-- win10、ios平台已实现：若已调用过@{#Http.abortRequest}，且平台成功取消请求，则返回true；否则，返回false。
--
-- @param self
-- @return #boolean 若成功取消请求，则返回true；否则，返回false。
Http.isAbort = function(self)
    return self.m_aborted == true
end

---
-- 获得响应的状态码.
-- 
-- Android、win32、win10、ios平台：已实现。返回HTTP状态代码。
--  
-- @param self
-- @return #number 如果请求未完成，返回0；若请求完成，则返回相应的状态码。
Http.getResponseCode = function(self)
    return self.m_response and self.m_response.code or 0
end

---
-- 获得响应的内容.
-- 
-- Android、win32、win10平台:返回全部相应内容。
-- ios平台：返回响应内容（不一定是全部内容）。
--
-- @param self
-- @return #string 响应结果。如果请求未完成，则返回空字符串；否则返回响应结果。
Http.getResponse = function(self)
    return self.m_response and self.m_response.content or ''
end

---
-- 获得错误码.
-- 
-- Android、win32、ios平台，若出现异常返回1；否则返回0。  
-- win10平台：当请求不存在或在请求过程中获取错误码返回-1；未发送请求而去获取错误码，返回0；其他情况返回错误码的整数值。参考[win10平台错误码类型](https://curl.haxx.se/libcurl/c/libcurl-errors.html)。
-- 
-- @param self
-- @return #number 返回错误码。
Http.getError = function(self)
    return self.m_response and self.m_response.errmsg or 0
end

---
-- 设置请求完成后的回调函数.
-- 
-- @param self
-- @param obj 任意类型，当做回调函数func的第一个参数传入。
-- @param #function func 回调函数。
-- 传入参数为:(obj, http),其中obj为任意类型；
-- http即为当前的Http对象。
Http.setEvent = function(self, obj, func)
    self.m_eventCallback.obj = obj;
    self.m_eventCallback.func = func;
end

end
        

package.preload[ "network.http_compat" ] = function( ... )
    return require('network/http_compat')
end
            

package.preload[ "network/http_old" ] = function( ... )
-- http.lua
-- Author: Vicent Gong
-- Date: 2012-09-30
-- Last modification : 2013-05-29
-- Description: provide basic wrapper for http functions

--------------------------------------------------------------------------------
-- 用于简单的http请求。
-- **规范请参考 [RFC2616](http://www.ietf.org/rfc/rfc2616.txt)。**
-- @module network.http
-- @return #nil
-- @usage require("network.http")


require("core.object");
require("core.system");
require("core.constants");
require("core.global");


--- http请求类型：get
kHttpGet    = 0;
--- http请求类型：post
kHttpPost   = 1;
--- http返回类型(这是唯一可用的类型)
kHttpReserved = 0;

---
--@type Http
Http = class();
Http.s_objs = CreateTable("v");
Http.s_platform = System.getPlatform();

if Http.s_platform == kPlatformAndroid then
    require("network.httpRequest");
end


---
-- 构造方法.
-- 
-- @param self
-- @param #number requestType http请求类型（未使用）。 取值[```kHttpGet```](network.http.html#kHttpGet)、
-- [```kHttpPost```](network.http.html#kHttpPost)。Android、win32平台目前只支持post方式，win10、ios平台均支持Get和Post两种方式。
-- @param #number responseType （未使用）。目前仅能取值[```kHttpReserved```](network.http.html#kHttpReserved)。
-- @param #string url 请求的url。
Http.ctor = function(self, requestType, responseType, url)
    self.m_requestID = http_request_create(requestType, responseType, url);
    Http.s_objs[self.m_requestID] = self;
    self.m_eventCallback = { };
end


---  
-- 析构方法.
-- 
-- @param self
Http.dtor = function(self)
    http_request_destroy(self.m_requestID);
    self.m_requestID = nil;
end


---
-- 设置请求超时时间.  
-- 若多次设置，则取最后一次的值。在@{#Http.execute}前设置才有效 。
-- 
-- @param self
-- @param #number connectTimeout 请求超时时间，单位毫秒。  
-- Android平台：若设置小于1000，则默认为1000；  
-- win32、ios平台：超时时间参考 [RFC2616](http://www.ietf.org/rfc/rfc2616.txt)；  
-- win10平台：默认为10000。
-- @param #number timeout Android、win32、win10平台未使用；ios平台表示[请求过程的最长耗时](https://curl.haxx.se/libcurl/c/CURLOPT_TIMEOUT.html)。
Http.setTimeout = function(self, connectTimeout, timeout)
    http_set_timeout(self.m_requestID, connectTimeout, timeout)
end

---
-- 设置请求消息的User-Agent.
-- 
-- 在@{#Http.execute}前设置才有效。
-- Android未实现；    
-- win32平台：若未调用@{#Http.setAgent}，将使用默认值`Mozilla/5.0 (iPhone; U; CPU like Mac OS X; en) AppleWebKit/420+ (KHTML, like Gecko) Version/3.0 Mobile/1C28 Safari/419.3`；  
-- win10平台：已实现，无默认值。  
-- ios平台:若未调用@{#Http.setAgent},将使用默认值`Mozilla/5.0 (iPhone; U; CPU like Mac OS X; en) AppleWebKit/420+ (KHTML, like Gecko) Version/3.0 Mobile/1C28 Safari/419.3`。
-- @param self
-- @param #string str 请求消息的userAgent。
Http.setAgent = function(self, str)
    http_request_set_agent(self.m_requestID, str);
end

---
-- 请求消息添加Header.
--   
-- Android平台未实现；  
-- win32平台:首个header为“Accept-Encoding:UTF-8”；用户多次调用@{#Http.addHeader}之后,win32平台上将依次添加header到请求消息中；  
-- win10：用户调用@{#Http.addHeader}之后,平台添加header到请求消息中。每个请求添加多次header时，取最后一次的header；  
-- ios平台：用户多次调用@{#Http.addHeader}之后,平台依次添加header到请求消息中。
-- @param self
-- @param #string str 请求消息的Header。
Http.addHeader = function(self, str)
    http_request_add_header(self.m_requestID, str);
end


---
-- 设置请求消息的body.  
-- 
-- 仅支持post请求。
-- Android、win32、win10、ios平台均已实现:请求的消息body默认为空；调用@{#Http.setData}后，更新请求消息的body。
--
-- @param self
-- @param #string str 请求消息的body。
Http.setData = function(self, str)
    http_request_set_data(self.m_requestID, str);
end

---
-- 发送请求.
--   
-- Android、win32、ios平台请求完成后首先回调[```event_http_response_httpEvent```](network.http.html#event_http_response_httpEvent)方法，然后回调@{#Http.setEvent}方法；  
-- win10平台请求完成后，回调@{#Http.setEvent}方法。
-- 
-- @param self
Http.execute = function(self)
    local eventName = "httpEvent";
    http_request_execute(self.m_requestID, eventName);
end

---
-- 取消请求，在@{#Http.execute}之后执行有效.
-- 注：此方法并没有真正取消请求，而是改变了一个变量的值供各平台调度，以达到真正意义上取消请求的目的。
-- 
-- Android、win32平台未实现；    
-- win10、ios平台已实现:调用各自平台的取消方法来达到取消请求的目的。
--
-- @param self
Http.abortRequest = function(self)
    http_request_abort(self.m_requestID);
end

---
-- 请求是否被取消.
-- 
-- Android、win32平台未实现；  
-- win10、ios平台已实现：若已调用过@{#Http.abortRequest}，且平台成功取消请求，则返回true；否则，返回false。
--
-- @param self
-- @return #boolean 若成功取消请求，则返回true；否则，返回false。
Http.isAbort = function(self)
    return(http_request_get_abort(self.m_requestID) == kTrue);
end

---
-- 获得响应的状态码.
-- 
-- Android、win32、win10、ios平台：已实现。返回HTTP状态代码。
--  
-- @param self
-- @return #number 如果请求未完成，返回0；若请求完成，则返回相应的状态码。
Http.getResponseCode = function(self)
    return http_request_get_response_code(self.m_requestID);
end

---
-- 获得响应的内容.
-- 
-- Android、win32、win10平台:返回全部相应内容。
-- ios平台：返回响应内容（不一定是全部内容）。
--
-- @param self
-- @return #string 响应结果。如果请求未完成，则返回空字符串；否则返回响应结果。
Http.getResponse = function(self)
    return http_request_get_response(self.m_requestID);
end

---
-- 获得错误码.
-- 
-- Android、win32、ios平台，若出现异常返回1；否则返回0。  
-- win10平台：当请求不存在或在请求过程中获取错误码返回-1；未发送请求而去获取错误码，返回0；其他情况返回错误码的整数值。参考[win10平台错误码类型](https://curl.haxx.se/libcurl/c/libcurl-errors.html)。
-- 
-- @param self
-- @return #number 返回错误码。
Http.getError = function(self)
    return http_request_get_error(self.m_requestID);
end

---
-- 设置请求完成后的回调函数.
-- 
-- @param self
-- @param obj 任意类型，当做回调函数func的第一个参数传入。
-- @param #function func 回调函数。
-- 传入参数为:(obj, http),其中obj为任意类型；
-- http即为当前的Http对象。
Http.setEvent = function(self, obj, func)
    self.m_eventCallback.obj = obj;
    self.m_eventCallback.func = func;
end

---
-- Android、win32、ios平台在请求消息后执行的回调函数，win10平台未执行。
-- **开发者不应主动调用此函数**
-- @param #number  requestID 请求的id。
function event_http_response_httpEvent(requestID)
    requestID = requestID or http_request_get_current_id();
    local http = Http.s_objs[requestID];
    if http and http.m_eventCallback.func then
        http.m_eventCallback.func(http.m_eventCallback.obj, http);
    end
end

end
        

package.preload[ "network.http_old" ] = function( ... )
    return require('network/http_old')
end
            

package.preload[ "network/httpRequest" ] = function( ... )

--------------------------------------------------------------------------------
-- Http类与java(或c#)层通信传递数据的桥梁.
-- 此文件里的方法均只在http.lua内部使用，开发者应使用@{core.http}，而不应直接使用此文件。
--
-- @module network.httpRequest
-- @return #nil 
-- @usage require("network.httpRequest")

kHttpRequestNone=0;
kHttpRequestCreate=1;
kHttpRequestRuning=2;
kHttpRequestFinish=3;

HttpRequestNS = {};
HttpRequestNS.http_request_id=0;
HttpRequestNS.kHttpRequestExecute="http_request_execute";
HttpRequestNS.kHttpResponse="http_response";
HttpRequestNS.kId="id";
HttpRequestNS.kStep="step";
HttpRequestNS.kUrl="url";
HttpRequestNS.kData="data";
HttpRequestNS.kTimeout="timeout";
HttpRequestNS.kEvent="event";
HttpRequestNS.kAbort="abort";
HttpRequestNS.kError="error";
HttpRequestNS.kCode="code";
HttpRequestNS.kRet="ret";
HttpRequestNS.kMethod="method";

HttpRequestNS.allocId = function ()
	HttpRequestNS.http_request_id = HttpRequestNS.http_request_id + 1;
	return HttpRequestNS.http_request_id;
end
HttpRequestNS.getKey = function ( iRequestId )
	local key = string.format("http_request_%d",iRequestId);
	return key;
end

---
-- 创建一个http请求.
--
-- @param #number iTypePost http method
-- @param #number iResponseType 未使用
-- @param #string strUrl 请求网址
-- @return #number iRequestId 此请求的唯一id
function http_request_create( iTypePost, iResponseType, strUrl )
	local iRequestId = HttpRequestNS.allocId();
	local key = HttpRequestNS.getKey(iRequestId);
	dict_set_int(key,HttpRequestNS.kStep,kHttpRequestCreate);
	dict_set_int(key,HttpRequestNS.kMethod,iTypePost);
	dict_set_string(key,HttpRequestNS.kUrl,strUrl);
	return iRequestId;
end

---
-- 取消一个http请求.
-- 请求一旦开始就无法取消
--
-- @param #number iRequestId 请求id
function http_request_destroy(iRequestId)
	local key = HttpRequestNS.getKey(iRequestId);

	local step = dict_get_int(key,HttpRequestNS.kStep,kHttpRequestNone);
	if step == kHttpRequestNone then
		FwLog(string.format("http_request_destroy failed %d, not create",iRequestId));
		return
	end
	if step == kHttpRequestRuning then
		FwLog(string.format("http_request_destroy failed %d, can't destroy while execute ",iRequestId));
		return
	end
	
	dict_delete(key);

end

---
-- 设置请求超时时间.
--
-- @param #number iRequestId 请求id
-- @param #number timeout1 超时时间
-- @param #number timeout2 未使用
function http_set_timeout ( iRequestId, timeout1, timeout2 )
	local key = HttpRequestNS.getKey(iRequestId);

	local step = dict_get_int(key,HttpRequestNS.kStep,kHttpRequestNone);
	if step == kHttpRequestNone then
		FwLog(string.format("http_set_timeout failed %d, not create",iRequestId));
		return
	end
	if step == kHttpRequestRuning then
		FwLog(string.format("http_set_timeout failed %d, can't set timeout while execute ",iRequestId));
		return
	end

	dict_set_int(key,HttpRequestNS.kTimeout,timeout1);

end

---
-- 设置请求体.
--
-- @param #number iRequestId 请求id
-- @param #string strValue 请求体.使用key1=value1&key2=value2的格式
function http_request_set_data (iRequestId, strValue )
	local key = HttpRequestNS.getKey(iRequestId);

	local step = dict_get_int(key,HttpRequestNS.kStep,kHttpRequestNone);
	if step == kHttpRequestNone then
		FwLog(string.format("http_request_set_data failed %d, not create",iRequestId));
		return
	end
	if step == kHttpRequestRuning then
		FwLog(string.format("http_request_set_data failed %d, can't set data while execute ",iRequestId));
		return
	end

	dict_set_string(key,HttpRequestNS.kData,strValue);

end

---
-- 未使用
function http_request_set_agent(iRequestId,strValue)
	FwLog("not support on android platform");
end

---
-- 未使用
function http_request_add_header(iRequestId,strValue)
	FwLog("not support on android platform");
end

---
-- 开始发送请求.
--
-- @param #number iRequestId 请求id
-- @param #string strEventName 事件名. 
-- 如果传nil,则请求完成后会回调lua里的`event_http_response`方法，
-- 如果传abc，则请求完成后会回调lua里的`event_http_response_abc`方法。
function http_request_execute(iRequestId,strEventName )
	local key = HttpRequestNS.getKey(iRequestId);
	local step = dict_get_int(key,HttpRequestNS.kStep,kHttpRequestNone);
	if step ~= kHttpRequestCreate then
		FwLog(string.format("http_request_execute failed %d",iRequestId));
		return
	end
	
	dict_set_int(HttpRequestNS.kHttpRequestExecute,HttpRequestNS.kId,iRequestId);
	dict_set_int(key,HttpRequestNS.kStep,kHttpRequestRuning);
	dict_set_string(key,HttpRequestNS.kEvent,strEventName);

	if dict_get_int(key,HttpRequestNS.kMethod, kHttpGet) == kHttpGet then
        call_native("HttpGet");
    else
        call_native("HttpPost");
    end

end

---
-- 取消某个请求.
-- 如果已经开始，则无法取消.
--
-- @param #number iRequestId 请求id
function http_request_abort(iRequestId)
	local key = HttpRequestNS.getKey(iRequestId);
	local step = dict_get_int(key,HttpRequestNS.kStep,kHttpRequestNone);
	if step ~= kHttpRequestRuning then
		FwLog(string.format("http_request_abort failed %d",iRequestId));
		return
	end
	dict_set_int(key,HttpRequestNS.kAbort,1);
end

---
-- 获得请求结果.
--
-- @param #number iRequestId 请求id
-- @return #string 请求结果
function http_request_get_response(iRequestId)
	local key = HttpRequestNS.getKey(iRequestId);
	local step = dict_get_int(key,HttpRequestNS.kStep,kHttpRequestNone);
	if step ~= kHttpRequestFinish then
		FwLog(string.format("http_request_get_response failed %d",iRequestId));
		return "";
	end

	local str = dict_get_string(key,HttpRequestNS.kRet);
	if nil == str then
		return "";
	end
	return str;
end

---
-- 检查某个请求是否被取消.
-- 
-- @param #number iRequestId 请求id
-- @return #number 1表示已取消
function http_request_get_abort(iRequestId)
	local key = HttpRequestNS.getKey(iRequestId);
	local step = dict_get_int(key,HttpRequestNS.kStep,kHttpRequestNone);
	if step ~= kHttpRequestFinish then
		FwLog(string.format("http_request_get_abort failed %d",iRequestId));
		return 0;
	end
	
	return dict_get_int(key,HttpRequestNS.kAbort,0);
	
end

---
-- 获得请求的错误码.
-- 0表示成功，1表示失败
-- 
-- @param #number iRequestId 请求id
-- @return #number 错误码
function http_request_get_error(iRequestId)
	local key = HttpRequestNS.getKey(iRequestId);
	local step = dict_get_int(key,HttpRequestNS.kStep,kHttpRequestNone);
	if step ~= kHttpRequestFinish then
		FwLog(string.format("http_request_get_error failed %d",iRequestId));
		return 0;
	end
	
	return dict_get_int(key,HttpRequestNS.kError,0);

end

---
-- 获得请求返回的状态码 status code.
--
-- @param #number iRequestId 请求id
-- @return #number http status code
function http_request_get_response_code(iRequestId)
	local key = HttpRequestNS.getKey(iRequestId);
	local step = dict_get_int(key,HttpRequestNS.kStep,kHttpRequestNone);
	if step ~= kHttpRequestFinish then
		FwLog(string.format("http_request_get_response_code failed %d",iRequestId));
		return 0;
	end
	
	return dict_get_int(key,HttpRequestNS.kCode,0);
end

---
-- 获得当前被回调的请求Id.
--
-- @param #number id 未使用
-- @return #number requestId
function http_request_get_current_id ( id )
	return dict_get_int(HttpRequestNS.kHttpResponse,HttpRequestNS.kId,0);
end

end
        

package.preload[ "network.httpRequest" ] = function( ... )
    return require('network/httpRequest')
end
            

package.preload[ "network/manager" ] = function( ... )
require('core.object')

local MainThreadSocketManager = class()
MainThreadSocketManager.ctor = function(self)
    self._handler = nil
    self._sockets = {}
end

MainThreadSocketManager.started = function(self)
    return self._handler ~= nil
end
MainThreadSocketManager.start = function(self)
    self._uv = require_uv()
    self._handler = require('network.start_uvloop')
end
MainThreadSocketManager.stop = function(self)
    error('not support')
end
MainThreadSocketManager.set_protocol = function(self, name, offset, size, initsize, endianess)
    local socket = self._sockets[name]
    local function create_stream()
        return PacketStream(offset, size, initsize, endianess)
    end
    if socket ~= nil then
        socket.create_stream = create_stream
    else
        self._sockets[name] = {
            create_stream = create_stream
        }
    end
end
MainThreadSocketManager.connect = function(self, name, ip, port, callback)
    if self._sockets[name] == nil then
        print_string('socket not initialised.')
        return
    end
    if self._sockets[name].sock ~= nil then
        print_string('socket already opened.')
        return
    end
    local socket = self._uv.new_tcp()
    socket:connect(ip, port, function(err)
        if err then
            socket:close()
            self._sockets[name].sock = nil
            callback(err)
        else
            self._sockets[name].sock = socket
            callback()
        end
    end)
end
MainThreadSocketManager.close = function(self, name, callback)
    local socket = assert(self._sockets[name], 'socket not exists')
    if not socket.sock then
        print_string('close failed, socket not opened:' .. name)
    else
        socket.sock:close(callback)
    end
    self._sockets[name].sock = nil
end
MainThreadSocketManager.read_start = function(self, name, callback)
    local socket = assert(self._sockets[name], 'socket not exists')
    assert(socket.sock, 'socket not opened')
    local stream = socket.create_stream()
    socket.sock:read_start(function(err, chunk)
        if err or not chunk then
            if err then
                print_string('read error:' .. err)
            else
                print_string('connection closed')
            end
            -- closed by remote.
            socket.sock:close()
            self._sockets[name] = nil
            callback()
            return
        end
        for _, packet in ipairs{stream:feed(chunk)} do
            callback(packet)
        end
    end)
end
MainThreadSocketManager.write = function(self, name, buffer, callback)
    local socket = assert(self._sockets[name], 'socket not exists')
    assert(socket.sock, 'socket not opened')
    socket.sock:write(buffer, function(err)
        if err then
            print_string('write error:' .. err)
            socket.sock:close()
            self._sockets[name] = nil
        end
        callback(err)
    end)
end
MainThreadSocketManager.getaddrinfo = function(self, node, service, hints, callback)
    self._uv.getaddrinfo(node, service, hints, callback)
end

local MultiThreadSocketManager = class(MainThreadSocketManager)
MultiThreadSocketManager.start = function(self)
    if not self._started then
        self:_start()
        self._started = true
        function event_close()
            self:stop()
        end

    end
end
MultiThreadSocketManager._start = function(self)
    self.m_request_chan = Chan.create()
    self.m_response_chan = Chan.create()
    local async_id_mvar = MVar.create()
    ThreadPool.instance():lua_task(function(request_chan_id, response_chan_id, async_id_mvar_id)
        local sockets = {}
        local request_chan = Chan.get_by_id(request_chan_id)
        local response_chan = Chan.get_by_id(response_chan_id)
        local async_id_mvar = MVar.get_by_id(async_id_mvar_id)
        local uv = require_uv()
        local function handle_request(type, name, ...)
            if type == 'stop' then
                uv.stop()
            elseif type == 'set_protocol' then
                local socket = sockets[name]
                local args = {...}
                local create_stream = function()
                    return PacketStream(unpack(args))
                end
                if socket ~= nil then
                    socket.create_stream = create_stream
                else
                    sockets[name] = {
                        create_stream = create_stream
                    }
                end
            elseif type == 'connect' then
                assert(sockets[name], 'socket ' .. name .. ' has no protocol')
                assert(sockets[name].sock == nil, 'socket ' .. name .. ' already exists.')
                local sock = uv.new_tcp()
                local ip, port = ...
                sock:connect(ip, port, function(status)
                    if not status then
                        -- success
                        sockets[name].sock = sock
                    else
                        sock:close()
                    end
                    response_chan:put(name, 'connect', status)
                end)
            elseif type == 'close' then
                local socket = sockets[name]
                if socket.sock then
                    socket.sock:close()
                    socket.sock = nil
                end
            elseif type == 'read_start' then
                local socket = sockets[name]
                assert(socket and socket.sock, 'socket ' .. name .. ' not opened')
                local stream = socket.create_stream()
                socket.sock:read_start(function(err, chunk)
                    if err or not chunk then
                        if err then
                        end
                        -- closed
                        socket.sock:close()
                        socket.sock = nil
                        response_chan:put(name, 'read', nil)
                        return
                    end
                    for _, packet in ipairs{stream:feed(chunk)} do
                        response_chan:put(name, 'read', packet)
                    end
                end)
            elseif type == 'write' then
                local socket = sockets[name]
                assert(socket and socket.sock, 'socket ' .. name .. ' not opened')
                local data, callback = ...
                if socket and socket.sock then
                    socket.sock:write(data, function(err)
                        if err then
                            socket.sock:close()
                            socket.sock = nil
                        end
                        response_chan:put(name, callback, err)
                    end)
                end
            elseif type == 'getaddrinfo' then
                local name, node, service, hints = ...
                uv.getaddrinfo(node, service, cjson.decode(hints), function(err, result)
                    response_chan:put(name, 'getaddrinfo', cjson.encode{err, result})
                end)
            end
        end
        local async_id = UVAsync.create(function()
            while true do
                local req = {request_chan:take(false)}
                if not req or not req[1] then
                    break
                end
                -- handle requests
                local err, msg = pcall(handle_request, unpack(req))
                if err then
                    print_string('handle request error:' .. msg)
                end
            end
        end)
        async_id_mvar:put(async_id)
        uv.run()
    end, nil, self.m_request_chan.id, self.m_response_chan.id, async_id_mvar.id)

    -- block waiting for async.
    self.m_async_id = async_id_mvar:take()
end

MultiThreadSocketManager.send_request = function(self, ...)
    self.m_request_chan:put(...)
    UVAsync.send(self.m_async_id)
end

MultiThreadSocketManager.set_protocol = function(self, name, offset, size, initsize, endianess)
    self:send_request('set_protocol', name, offset, size, initsize, endianess)
end

MultiThreadSocketManager.stop = function(self)
    if self._started then
        self:send_request('stop')
    end
end
MultiThreadSocketManager.started = function(self)
    return self._started
end
MultiThreadSocketManager.connect = function(self, name, ip, port, callback)
    assert(self._sockets[name] == nil, 'socket already exists.');
    -- notify
    self._sockets[name] = {
        write_callback_id = 0,
        connect = callback,
        close = nil,
        read = nil,
    }

    self:send_request('connect', name, ip, port)
    self:_ensure_scheduler()
end
MultiThreadSocketManager.close = function(self, name, callback)
    self._sockets[name] = nil
    self:send_request('close', name)
end
MultiThreadSocketManager._ensure_scheduler = function(self)
    if not self._scheduler then
        self._scheduler = Clock.instance():schedule(function()
            -- check response
            while true do
                local name, callback, arg = self.m_response_chan:take(false)
                if not name then
                    break
                end
                local callback = self._sockets[name][callback]
                if (callback == 'read' and not arg) or (callback == 'write' and arg) then
                    self._sockets[name] = nil
                elseif callback ~= 'read' then
                    self._sockets[name][callback] = nil
                end
                if callback == nil then
                    print_string('callback is nil ' .. callback)
                end
                callback(arg)
            end
        end)
    end
end

MultiThreadSocketManager.read_start = function(self, name, callback)
    assert(self._sockets[name].read == nil, 'duplicate read request')
    self._sockets[name].read = callback
    self:send_request('read_start', name)
end

MultiThreadSocketManager.write = function(self, name, buffer, callback)
    local socket = assert(self._sockets[name], 'socket not exists')
    socket.write_callback_id = socket.write_callback_id + 1
    socket[socket.write_callback_id] = callback
    self:send_request('write', name, buffer, socket.write_callback_id)
end

MultiThreadSocketManager.getaddrinfo = function(self, node, service, hints, callback)
    self._sockets[name].getaddrinfo = function(result)
        callback(unpack(cjson.decode(result)))
    end
    self:send_request('getaddrinfo', name, node, service, cjson.encode(hints))
end

return {
    singleThread = new(MainThreadSocketManager),
    multiThread = new(MultiThreadSocketManager),
}

end
        

package.preload[ "network.manager" ] = function( ... )
    return require('network/manager')
end
            

package.preload[ "network/protobuf" ] = function( ... )
local pb = {}

-- define message
local wire_types = {
    int32 = 0,
    int64 = 0,
    sint32 = 0,
    sint64 = 0,
    uint32 = 0,
    uint64 = 0,
    bool = 0,
    enum = 0,
    fixed64 = 1,
    sfixed64 = 1,
    double = 1,
    string = 2,
    bytes = 2,
    fixed32 = 5,
    sfixed32 = 5,
    float = 5,
}
local default_objects = {
    int32 = 0,
    int64 = 0,
    sint32 = 0,
    sint64 = 0,
    uint32 = 0,
    uint64 = 0,
    bool = false,
    enum = 0,
    fixed64 = 0,
    sfixed64 = 0,
    double = 0.0,
    string = '',
    bytes = '',
    fixed32 = 0,
    sfixed32 = 0,
    float = 0.0,
}
local function encode_varint(writer, n)
    writer(c_pb.signed_varint_encoder(n))
end
local function encode_unsigned_varint(writer, n)
    writer(c_pb.varint_encoder(n))
end
local function encode_zigzag_varint32(writer, n)
    encode_unsigned_varint(writer, c_pb.zig_zag_encode32(n))
end
local function encode_zigzag_varint64(writer, n)
    encode_unsigned_varint(writer, c_pb.zig_zag_encode64(n))
end
local function encode_type(writer, type, index)
    encode_unsigned_varint(writer, index * 8 + type)
end
local function encode_bool(writer, v)
    writer(v and '\1' or '\0')
end
local function struct_encoder(fmt)
    return function(writer, v)
        writer(c_pb.struct_pack(string.byte(fmt), v))
    end
end
local function encode_bytes(writer, v, name)
    assert(type(v) == 'string', name and ('invalid value ' .. name))
    encode_unsigned_varint(writer, #v)
    writer(v)
end
local function message_encoder(msg)
    return function(writer, value)
        for _, f in ipairs(msg._fields) do
            local v = value[f.name]
            if v ~= nil then
                if f.packed then
                    assert(type(v) == 'table')
                    local buf = {}
                    local writer2 = function(vv)
                        table.insert(buf, vv)
                    end
                    for _, i in ipairs(v) do
                        f.encoder(writer2, i, f.name)
                    end
                    encode_type(writer, f.wire_type, f.index)
                    encode_bytes(writer, table.concat(buf), f.name)
                elseif f.repeated then
                    assert(type(v) == 'table')
                    for _, i in ipairs(v) do
                        encode_type(writer, f.wire_type, f.index)
                        if type(f.type) == 'table' then
                            local buf = {}
                            local writer2 = function(vv)
                                table.insert(buf, vv)
                            end
                            f.encoder(writer2, i, f.name)
                            encode_bytes(writer, table.concat(buf), f.name)
                        else
                            f.encoder(writer, i, f.name)
                        end
                    end
                else
                    encode_type(writer, f.wire_type, f.index)
                    if type(f.type) == 'table' then
                        local buf = {}
                        local writer2 = function(vv)
                            table.insert(buf, vv)
                        end
                        f.encoder(writer2, v, f.name)
                        encode_bytes(writer, table.concat(buf))
                    else
                        f.encoder(writer, v, f.name)
                    end
                end
            end
        end
    end
end

local encoders = {
    int32 = encode_varint,
    int64 = encode_varint,
    sint32 = encode_zigzag_varint32,
    sint64 = encode_zigzag_varint64,
    uint32 = encode_unsigned_varint,
    uint64 = encode_unsigned_varint,
    fixed32 = struct_encoder('I'),
    fixed64 = struct_encoder('Q'),
    sfixed32 = struct_encoder('i'),
    sfixed64 = struct_encoder('q'),
    float = struct_encoder('f'),
    double = struct_encoder('d'),
    bool = encode_bool,
    enum = encode_varint,
    string = encode_bytes,
    bytes = encode_bytes,
}
local function skip_unknown_field(buffer, pos, wtype)
    if wtype == 0 then
        -- varint
        return c_pb.varint_size(buffer, pos)
    elseif wtype == 1 then
        -- fixed 64 / double
        assert(pos + 8 <= #buffer, 'skip failed, not enough space.')
        return pos + 8
    elseif wtype == 5 then
        -- fixed 32 / float
        assert(pos + 4 <= #buffer, 'skip failed, not enough space.')
        return pos + 4
    elseif wtype == 2 then
        -- bytes
        local len, pos = c_pb.varint_decoder(buffer, pos)
        assert(pos + len <= #buffer, 'skip failed, not enough space.')
        return pos + len
    else
        error('unknown wire type:' .. wtype)
    end
end
local function decode_zigzag32(buffer, pos)
    local v
    v, pos = c_pb.varint_decoder(buffer, pos)
    return c_pb.zig_zag_decode32(v), pos
end
local function decode_zigzag64(buffer, pos)
    local v
    v, pos = c_pb.varint_decoder(buffer, pos)
    return c_pb.zig_zag_decode32(v), pos
end
local function decode_delimited(buffer, pos)
    local len
    len, pos = c_pb.signed_varint_decoder(buffer, pos)
    return pos + len, pos
end
local function decode_bytes(buffer, pos)
    local offset
    pos, offset = decode_delimited(buffer, pos)
    return string.sub(buffer, offset, pos-1), pos
end
local meta_message = {
    __index = function(self, name)
        -- return default value
        local f = self.___message[name]
        if f then
            if f.repeated then
                local v = {}
                self[name] = v
                return v
            else
                return f.default
            end
        end
    end,
}
local function decode_message(buffer, pos, stop, msg)
    local o = setmetatable({
        ___message = msg
    }, meta_message)
    local v
    while pos <= stop do
        local tag
        tag, pos = c_pb.varint_decoder(buffer, pos)
        local findex = bit.rshift(tag, 3)
        local wtype = bit.band(tag, 0x07)
        local f = msg._by_index[findex]
        if not f then
            -- try to skip
            pos = skip_unknown_field(buffer, pos, wtype)
        else
            local packed = wtype == 2 and f.is_numeric
            if packed then
                assert(f.repeated, 'packed encoding data must is repeated field.')
                local offset
                pos, offset = decode_delimited(buffer, pos)
                if o[f.name] == nil then
                    o[f.name] = {}
                end
                v = o[f.name]
                while offset < pos do
                    local i
                    i, offset = f.decoder(buffer, offset)
                    table.insert(v, i)
                end
            else
                v, pos = f.decoder(buffer, pos)
                if f.repeated then
                    if o[f.name] == nil then
                        o[f.name] = {}
                    end
                    table.insert(o[f.name], v)
                else
                    o[f.name] = v
                end
            end
        end
    end
    return o
end
local function message_decoder(msg)
    return function(buffer, pos)
        local offset
        pos, offset = decode_delimited(buffer, pos)
        return decode_message(buffer, offset, pos-1, msg), pos
    end
end
local function struct_decoder(fmt)
    return function(buffer, pos)
        return c_pb.struct_unpack(string.byte(fmt), buffer, pos)
    end
end
local function decode_bool(buffer, pos)
    return string.byte(buffer, pos)~=0, pos+1
end

local decoders = {
    int32 = c_pb.signed_varint_decoder,
    int64 = c_pb.signed_varint_decoder,
    sint32 = decode_zigzag32,
    sint64 = decode_zigzag64,
    uint32 = c_pb.varint_decoder,
    uint64 = c_pb.varint_decoder,
    fixed32 = struct_decoder('I'),
    fixed64 = struct_decoder('Q'),
    sfixed32 = struct_decoder('i'),
    sfixed64 = struct_decoder('q'),
    float = struct_decoder('f'),
    double = struct_decoder('d'),
    bool = decode_bool,
    enum = c_pb.varint_decoder,
    string = decode_bytes,
    bytes = decode_bytes,
}

pb.message = function(msg_name, fields)
    local obj = {
        _class = pb.message,
        _by_index = {},
        _fields = {},
        _name = msg_name,
    }
    for k, v in pairs(fields) do
        obj[k] = v
    end
    -- indexes
    for name, f in pairs(fields) do
        if type(f) == 'table' then
            f.name = name
            assert(obj._by_index[f.index] == nil, 'conflict field index')
            obj._by_index[f.index] = f
            table.insert(obj._fields, f)
        end
    end
    table.sort(obj._fields, function(a,b)
        return a.index < b.index
    end)
    obj._encoder = message_encoder(obj)
    obj._decoder = message_decoder(obj)
    return obj
end
local function extend_message(msg, name, f)
    assert(msg[f.name] == nil, 'conflict field name')
    assert(msg._by_index[f.index] == nil, 'conflict field index')
    msg[name] = f
    f.name = name
    msg._by_index[f.index] = f
    table.insert(msg._fields, f)
    table.sort(msg._fields, function(a,b)
        return a.index < b.index
    end)
end
local function is_numeric_type(type_)
    -- not message, not string, not bytes.
    return type(type_) == 'string' and type_ ~= 'string' and type_ ~= 'bytes'
end
pb.field = function(type_, index, opt)
    -- name, type, index, packed, required, repeated, default
    local field = {
        _class = pb.field,
        type = type_,
        index = index,
        required = true,
        repeated = false,
        packed = false,
        is_numeric = is_numeric_type(type_)
    }
    if opt and opt.required ~= nil then
        field.required = opt.required
    end
    if opt and opt.packed ~= nil then
        field.packed = opt.packed
    end
    if field.packed then
        assert(field.is_numeric, 'packed field must be primitive numeric type.')
        field.repeated = true
    elseif opt and opt.repeated ~= nil then
        field.repeated = opt.repeated
    end
    if opt and opt.default ~= nil then
        field.default = field.default
    else
        field.default = default_objects[field.type]
    end
    field.wire_type = field.packed and 2 or (wire_types[field.type] or 2)
    if type(type_) == 'table' and #type_ == 2 then
        -- unresolved reference.
        field.resolved = false
    else
        if type(type_) == 'table' then
            field.encoder = field.type._encoder
            field.decoder = field.type._decoder
        else
            field.encoder = encoders[field.type] or field.type._encoder
            field.decoder = decoders[field.type] or field.type._decoder
        end
        assert(field.encoder and field.decoder, 'not found encoder/decoder' .. tostring(field.type))
        field.resolved = true
    end
    return field
end
local _rpc_impl = nil
pb.set_rpc_impl = function(fn)
    _rpc_impl = fn
end
local meta_method = {
    async = function(self, req, callback)
        assert(_rpc_impl, 'no rpc implementation.')
        _rpc_impl(self.service, self.name, pb.encode(self.request_message, req), function(rsp)
            callback(pb.decode(self.response_message, rsp))
        end)
    end,
    __call = function(self, req)
        return coroutine.yield(function(callback)
            self:async(req, callback)
        end)
    end
}
meta_method.__index = meta_method
pb.method = function(name, req_msg, rsp_msg)
    return setmetatable({
        name = name,
        request_message = req_msg,
        response_message = rsp_msg,
    }, meta_method)
end
pb.service = function(name, methods)
    local obj = {}
    for _, m in ipairs(methods) do
        m.service = name
        obj[m.name] = m
    end
    return obj
end
pb.encode = function(msg, value)
    assert(type(value) == 'table')
    local str = {}
    local writer = function(value)
        table.insert(str, value)
    end
    msg._encoder(writer, value)
    return table.concat(str)
end
pb.decode = function(msg, buffer, offset)
    return decode_message(buffer, offset or 1, #buffer, msg)
end
pb.resolve_message_references = function(m)
    for _, msg in pairs(m) do
        if type(msg) == 'table' and msg._class == pb.message then
            for _, f in ipairs(msg._fields) do
                assert(f._class == pb.field)
                if not f.resolved then
                    assert(type(f.type) == 'table' and #f.type == 2, 'invalid unresolved type.')
                    local t, name = unpack(f.type)
                    f.type = t[name]
                    assert(f.type and f.type._class == pb.message, 'invalid message reference: ' .. name)
                    f.encoder = f.type._encoder
                    f.decoder = f.type._decoder
                    f.resolved = true
                end
            end
        end
    end
end

local plugin = {}
pb.plugin = plugin

plugin.Location = pb.message('Location', {
    path            = pb.field('int32',	1, { repeated=true, packed=true}),
    span            = pb.field('int32',	2, { repeated=true, packed=true}),
})

plugin.SourceCodeInfo = pb.message('SourceCodeInfo', {
    location        = pb.field(plugin.Location,	1, { repeated=true}),
})

plugin.NamePart = pb.message('NamePart', {
    name_part       = pb.field('string',	1),
    is_extension    = pb.field('bool',	2),
})

plugin.UninterpretedOption = pb.message('UninterpretedOption', {
    name            = pb.field(plugin.NamePart,	2, { repeated=true}),
    identifier_value = pb.field('string',	3, { required=false}),
    positive_int_value = pb.field('uint64',	4, { required=false}),
    negative_int_value = pb.field('int64',	5, { required=false}),
    double_value    = pb.field('double',	6, { required=false}),
    string_value    = pb.field('bytes',	7, { required=false}),
    aggregate_value = pb.field('string',	8, { required=false}),
})

plugin.EnumValueOptions = pb.message('EnumValueOptions', {
    uninterpreted_option = pb.field(plugin.UninterpretedOption,	999, { repeated=true}),
})

plugin.FieldOptions = pb.message('FieldOptions', {
    -- enum CType
    STRING=0,
    CORD=1,
    STRING_PIECE=2,
    ctype           = pb.field('enum',	1, { required=false, default=0}),
    packed          = pb.field('bool',	2, { required=false}),
    deprecated      = pb.field('bool',	3, { required=false, default=false}),
    experimental_map_key = pb.field('string',	9, { required=false}),
    uninterpreted_option = pb.field(plugin.UninterpretedOption,	999, { repeated=true}),
})

plugin.MessageOptions = pb.message('MessageOptions', {
    message_set_wire_format = pb.field('bool',	1, { required=false, default=false}),
    no_standard_descriptor_accessor = pb.field('bool',	2, { required=false, default=false}),
    uninterpreted_option = pb.field(plugin.UninterpretedOption,	999, { repeated=true}),
})

plugin.ExtensionRange = pb.message('ExtensionRange', {
    start           = pb.field('int32',	1, { required=false}),
    end_             = pb.field('int32',	2, { required=false}),
})

plugin.EnumValueDescriptorProto = pb.message('EnumValueDescriptorProto', {
    name            = pb.field('string',	1, { required=false}),
    number          = pb.field('int32',	2, { required=false}),
    options         = pb.field(plugin.EnumValueOptions,	3, { required=false}),
})

plugin.FileOptions = pb.message('FileOptions', {
    -- enum OptimizeMode
    SPEED=1,
    CODE_SIZE=2,
    LITE_RUNTIME=3,
    java_package    = pb.field('string',	1, { required=false}),
    java_outer_classname = pb.field('string',	8, { required=false}),
    java_multiple_files = pb.field('bool',	10, { required=false, default=false}),
    java_generate_equals_and_hash = pb.field('bool',	20, { required=false, default=false}),
    optimize_for    = pb.field('enum',	9, { required=false, default=1}),
    cc_generic_services = pb.field('bool',	16, { required=false, default=false}),
    java_generic_services = pb.field('bool',	17, { required=false, default=false}),
    py_generic_services = pb.field('bool',	18, { required=false, default=false}),
    uninterpreted_option = pb.field(plugin.UninterpretedOption,	999, { repeated=true}),
})

plugin.ServiceOptions = pb.message('ServiceOptions', {
    uninterpreted_option = pb.field(plugin.UninterpretedOption,	999, { repeated=true}),
})

plugin.FieldDescriptorProto = pb.message('FieldDescriptorProto', {
    -- enum Type
    TYPE_DOUBLE=1,
    TYPE_FLOAT=2,
    TYPE_INT64=3,
    TYPE_UINT64=4,
    TYPE_INT32=5,
    TYPE_FIXED64=6,
    TYPE_FIXED32=7,
    TYPE_BOOL=8,
    TYPE_STRING=9,
    TYPE_GROUP=10,
    TYPE_MESSAGE=11,
    TYPE_BYTES=12,
    TYPE_UINT32=13,
    TYPE_ENUM=14,
    TYPE_SFIXED32=15,
    TYPE_SFIXED64=16,
    TYPE_SINT32=17,
    TYPE_SINT64=18,
    -- enum Label,
    LABEL_OPTIONAL=1,
    LABEL_REQUIRED=2,
    LABEL_REPEATED=3,
    name            = pb.field('string',	1, { required=false}),
    number          = pb.field('int32',	3, { required=false}),
    label           = pb.field('enum',	4, { required=false}),
    type            = pb.field('enum',	5, { required=false}),
    type_name       = pb.field('string',	6, { required=false}),
    extendee        = pb.field('string',	2, { required=false}),
    default_value   = pb.field('string',	7, { required=false}),
    options         = pb.field(plugin.FieldOptions,	8, { required=false}),
})

plugin.EnumOptions = pb.message('EnumOptions', {
    uninterpreted_option = pb.field(plugin.UninterpretedOption,	999, { repeated=true}),
})

plugin.EnumDescriptorProto = pb.message('EnumDescriptorProto', {
    name            = pb.field('string',	1, { required=false}),
    value           = pb.field(plugin.EnumValueDescriptorProto,	2, { repeated=true}),
    options         = pb.field(plugin.EnumOptions,	3, { required=false}),
})

plugin.DescriptorProto = pb.message('DescriptorProto', {
    name            = pb.field('string',	1, { required=false}),
    field           = pb.field(plugin.FieldDescriptorProto,	2, { repeated=true}),
    extension       = pb.field(plugin.FieldDescriptorProto,	6, { repeated=true}),
    nested_type     = pb.field({plugin, 'DescriptorProto'},	3, { repeated=true}),
    enum_type       = pb.field(plugin.EnumDescriptorProto,	4, { repeated=true}),
    extension_range = pb.field(plugin.ExtensionRange,	5, { repeated=true}),
    options         = pb.field(plugin.MessageOptions,	7, { required=false}),
})

plugin.MethodOptions = pb.message('MethodOptions', {
    uninterpreted_option = pb.field(plugin.UninterpretedOption,	999, { repeated=true}),
})

plugin.MethodDescriptorProto = pb.message('MethodDescriptorProto', {
    name            = pb.field('string',	1, { required=false}),
    input_type      = pb.field('string',	2, { required=false}),
    output_type     = pb.field('string',	3, { required=false}),
    options         = pb.field(plugin.MethodOptions,	4, { required=false}),
})

plugin.ServiceDescriptorProto = pb.message('ServiceDescriptorProto', {
    name            = pb.field('string',	1, { required=false}),
    method          = pb.field(plugin.MethodDescriptorProto,	2, { repeated=true}),
    options         = pb.field(plugin.ServiceOptions,	3, { required=false}),
})

plugin.FileDescriptorProto = pb.message('FileDescriptorProto', {
    name            = pb.field('string',	1, { required=false}),
    package         = pb.field('string',	2, { required=false}),
    dependency      = pb.field('string',	3, { repeated=true}),
    message_type    = pb.field(plugin.DescriptorProto,	4, { repeated=true}),
    enum_type       = pb.field(plugin.EnumDescriptorProto,	5, { repeated=true}),
    service         = pb.field(plugin.ServiceDescriptorProto,	6, { repeated=true}),
    extension       = pb.field(plugin.FieldDescriptorProto,	7, { repeated=true}),
    options         = pb.field(plugin.FileOptions,	8, { required=false}),
    source_code_info = pb.field(plugin.SourceCodeInfo,	9, { required=false}),
})

plugin.FileDescriptorSet = pb.message('FileDescriptorSet', {
    file            = pb.field(plugin.FileDescriptorProto,	1, { repeated=true}),
})

-- file: plugin.proto
plugin.CodeGeneratorRequest = pb.message('CodeGeneratorRequest', {
    file_to_generate = pb.field('string',	1, { repeated=true}),
    parameter       = pb.field('string',	2, { required=false}),
    proto_file      = pb.field(plugin.FileDescriptorProto,	15, { repeated=true}),
})

plugin.File = pb.message('File', {
    name            = pb.field('string',	1, { required=false}),
    insertion_point = pb.field('string',	2, { required=false}),
    content         = pb.field('string',	15, { required=false}),
})

plugin.CodeGeneratorResponse = pb.message('CodeGeneratorResponse', {
    error           = pb.field('string',	1, { required=false}),
    file            = pb.field(plugin.File,	15, { repeated=true}),
})

pb.resolve_message_references(plugin)

local function register_enum(t, enum_type)
    for _, e in ipairs(enum_type) do
        for _, i in ipairs(e.value) do
            t[i.name] = i.number
        end
    end
end

local string_types = {
    [plugin.FieldDescriptorProto.TYPE_DOUBLE]='double',
    [plugin.FieldDescriptorProto.TYPE_FLOAT]='float',
    [plugin.FieldDescriptorProto.TYPE_INT64]='int64',
    [plugin.FieldDescriptorProto.TYPE_UINT64]='uint64',
    [plugin.FieldDescriptorProto.TYPE_INT32]='int32',
    [plugin.FieldDescriptorProto.TYPE_FIXED64]='fixed64',
    [plugin.FieldDescriptorProto.TYPE_FIXED32]='fixed32',
    [plugin.FieldDescriptorProto.TYPE_BOOL]='bool',
    [plugin.FieldDescriptorProto.TYPE_STRING]='string',
    [plugin.FieldDescriptorProto.TYPE_BYTES]='bytes',
    [plugin.FieldDescriptorProto.TYPE_UINT32]='uint32',
    [plugin.FieldDescriptorProto.TYPE_ENUM]='enum',
    [plugin.FieldDescriptorProto.TYPE_SFIXED32]='sfixed32',
    [plugin.FieldDescriptorProto.TYPE_SFIXED64]='sfixed64',
    [plugin.FieldDescriptorProto.TYPE_SINT32]='sint32',
    [plugin.FieldDescriptorProto.TYPE_SINT64]='sint64',
}

local _registered_messages = {} -- tracking reference between messages.
local function register_field(f)
    local fargs = {}
    if f.label == plugin.FieldDescriptorProto.LABEL_REPEATED then
        fargs.repeated = true
    elseif f.label == plugin.FieldDescriptorProto.LABEL_OPTIONAL then
        fargs.required = false
    end
    if f.default_value then
        if f.type == plugin.FieldDescriptorProto.TYPE_STRING or f.type == plugin.FieldDescriptorProto.TYPE_BYTES then
            fargs.default = f.default_value
        else
            fargs.default = loadstring('return ' .. f.default_value)()
        end
    end
    return pb.field(string_types[f.type] or {_registered_messages, f.type_name}, f.number, fargs)
end
local function register_msg(pkg_name, msg)
    local fullname = pkg_name and ('.' .. pkg_name .. '.' .. msg.name) or ('.' .. msg.name)
    local args = {}
    for _, f in ipairs(msg.field) do
        args[f.name] = register_field(f)
    end
    for _, f in ipairs(msg.extension) do
        args[f.name] = register_field(f)
    end
    register_enum(args, msg.enum_type)
    local result = pb.message(fullname, args)
    _registered_messages[fullname] = result

    -- nest message
    local nest_pkg_name = (pkg_name and  pkg_name .. '.' or '') .. msg.name
    for _, nest_msg in ipairs(msg.nested_type) do
        result[nest_msg.name] = register_msg(nest_pkg_name, nest_msg)
    end

    return result
end

local function register_service(srv)
    local methods = {}
    for _, m in ipairs(srv.method) do
        table.insert(methods, pb.method(
            m.name, 
            _registered_messages[m.input_type],
            _registered_messages[m.output_type]
        ))
    end
    return pb.service(srv.name, methods)
end

local function register_package(pkg_name, files)
    local m = {}
    for _, file in ipairs(files) do
        for _, msg in ipairs(file.message_type) do
            assert(m[msg.name] == nil, 'conflict message name.')
            local t = register_msg(pkg_name, msg)
            m[msg.name] = t
        end
        for _, f in ipairs(file.extension) do
            local msg = _registered_messages[f.extendee]
            assert(msg, 'msg not found' .. f.extendee)
            extend_message(msg, f.name, register_field(f))
        end
        for _, srv in ipairs(file.service) do
            assert(m[srv.name] == nil, 'conflict service name.')
            m[srv.name] = register_service(srv)
        end
        register_enum(m, file.enum_type)
    end
    return m
end
function pb.register_file(...)
    local files = {...}
    local buffers = {}
    for _, filename in ipairs(files) do
        local fp = io.open(filename, 'rb')
        table.insert(buffers, fp:read('*a'))
        fp:close()
    end
    return pb.register(unpack(buffers))
end
function pb.register(...)
    local buffers = {...}
    local fileset
    for _, buffer in ipairs(buffers) do
        if not fileset then
            fileset = pb.decode(plugin.FileDescriptorSet, buffer)
        else
            local tmp = pb.decode(plugin.FileDescriptorSet, buffer)
            for _, file in ipairs(tmp.file) do
                table.insert(fileset.file, file)
            end
        end
    end
    local toplevel = {}
    local packages = {}
    for _, file in ipairs(fileset.file) do
        if not file.package or #file.package == 0 then
           table.insert(toplevel, file)
        else
            if packages[file.package] == nil then
                packages[file.package] = {}
            end
            table.insert(packages[file.package], file)
        end
    end
    local m = register_package(nil, toplevel)
    for pkg_name, files in pairs(packages) do
        m[pkg_name] = register_package(pkg_name, files)
    end
    pb.resolve_message_references(_registered_messages)
    _registered_messages = {}
    return m
end

local function gen_options(opt)
end
local function gen_field(f)
    --return string.format('pb.field(%s, %d, {%s})', f.type, f.index, gen_options(f))
end

local function gen_message(msg)
end

local function test_gen()
    print(gen_field(pb.field('int32', 1, {
    })))
end
test_gen()

return pb

end
        

package.preload[ "network.protobuf" ] = function( ... )
    return require('network/protobuf')
end
            

package.preload[ "network/protocols" ] = function( ... )
require('core.object')

local function encrypt_buffer(buffer)
    if #buffer ~= 1 then
        buffer = table.concat(buffer)
    else
        buffer = buffer[1]
    end
    return PacketStream.encrypt_buffer(buffer, 0)
end

local Packet = class()

Packet.ctor = function(self, headformat, index_of_size, endian)
    self.headformat = endian .. headformat
    self.headsize = struct.size(self.headformat)
    self.index_of_size = index_of_size
    self.endian = endian
    self.buffer = {}
    self.headvalue = {}
end

Packet.readBegin = function(endian, packet)
    error('not implementated')
    -- return position, {cmd=, subcmd=,}
end

Packet.writeBegin = function(self, ...)
    self.headvalue = {...}
end

Packet.preWrite = function(self)
    -- update body size
    local len = 0
    for _, buf in ipairs(self.buffer) do
        len = len + #buf
    end
    self.headvalue[self.index_of_size] = len
end

Packet.writeEnd = function(self)
    self:preWrite()
    local head = struct.pack(self.headformat, unpack(self.headvalue))
    local buf = self.buffer
    self.buffer = {}
    table.insert(buf, 1, head)
    return table.concat(buf)
end

Packet.write = function(self, buf)
    table.insert(self.buffer, buf)
end

local Packet_BY9 = class(Packet, false)
Packet_BY9.headformat = 'HBBBBHB'
Packet_BY9.ctor = function(self, endian)
    super(self, Packet_BY9.headformat, 1, endian)
end
Packet_BY9.readBegin = function(endian, packet)
    packet.position = struct.size(Packet_BY9.headformat)+1
    packet.data = PacketStream.decrypt_buffer(packet.data, packet.position-1)
    packet.head = {
        size = struct.unpack(endian .. 'H', packet.data, 1),
        cmd = struct.unpack(endian .. 'H', packet.data, 7),
    }
end
Packet_BY9.writeBegin = function(self, cmd, ver, subver, dev)
    Packet.writeBegin(self, 0, string.byte('B'), string.byte('Y'), ver, subver, cmd, 0)
end
Packet_BY9.preWrite = function(self)
    Packet.preWrite(self)
    self.headvalue[1] = self.headvalue[1] + self.headsize - 2
    -- encrypt
    local buffer, check = encrypt_buffer(self.buffer)
    self.headvalue[7] = check
    self.buffer = {buffer}
end

local Packet_BY7 = class(Packet, false)
Packet_BY7.headformat = 'HBBBH'
Packet_BY7.ctor = function(endian)
    super(Packet_BY7.headformat, 1, endian)
end
Packet_BY7.writeBegin = function(self, cmd, ver)
    Packet.writeBegin(self, 0, string.byte('B'), string.byte('Y'), ver, cmd)
end
Packet_BY7.preWrite = function(self)
    Packet.preWrite(self)
    self.headvalue[1] = self.headvalue[1] + self.headsize - 2
    -- encrypt
    local buffer, check = encrypt_buffer(self.buffer)
    self.buffer = {buffer}
end
Packet_BY7.readBegin = function(endian, buffer)
    packet.position = struct.size(Packet_BY9.headformat)+1
    packet.data = PacketStream.decrypt_buffer(packet.data, packet.position-1)
    packet.head = {
        size = struct.unpack(endian .. 'H', buffer, 1),
        cmd = struct.unpack(endian .. 'H', buffer, 6),
    }
end

local Packet_BY14 = class(Packet, false)
Packet_BY14.headformat = 'HBBBBHBHHB'
Packet_BY14.ctor = function(endian)
    super(Packet_BY14.headformat, 1, endian)
end
Packet_BY14.writeBegin = function(self, cmd, ver, subver, dev)
    Packet.writeBegin(self, 0, string.byte('B'), string.byte('Y'), ver, subver, cmd, 0, subCmd, 0, dev)
end
Packet_BY14.preWrite = function(self)
    Packet.preWrite(self)
    self.headvalue[1] = self.headvalue[1] + self.headsize - 2
    -- set sequeuce
    self.headvalue[9] = 0
    local buffer, check = encrypt_buffer(self.buffer)
    self.headvalue[7] = check
    self.buffer = {buffer}
end

local Packet_TEXAS = class(Packet, false)
Packet_TEXAS.headformat = 'BBHBBHBI4'
Packet_TEXAS.ctor = function(endian)
    super(Packet_TEXAS.headformat, 6, endian)
end
Packet_TEXAS.writeBegin = function(self, cmd, ver, subver, dev)
    Packet.writeBegin(self, string.byte('I'), string.byte('C'), cmd, ver, subver, 0, 0, 0)
end
Packet_TEXAS.preWrite = function(self)
    Packet.preWrite(self)
    local buffer, check = encrypt_buffer(self.buffer)
    self.buffer = {buffer}
    self.headvalue[7] = check
    --self.headvalue[8] = sequence
end

local Packet_VOICE = class(Packet, false)
Packet_VOICE.headformat = 'BBHBBI4BI4'
Packet_VOICE.ctor = function(endian)
    super(Packet_VOICE.headformat, 6, endian)
end
Packet_VOICE.writeBegin = function(self, cmd, ver, subver, dev)
    Packet.writeBegin(self, string.byte('I'), string.byte('C'), cmd, ver, subver, 0, 0, 0)
end
Packet_VOICE.preWrite = function(self)
    Packet.preWrite(self)
    local buffer, check = encrypt_buffer(self.buffer)
    self.buffer = {buffer}
    self.headvalue[7] = check
    --self.headvalue[8] = sequence
end

local Packet_QE = class(Packet, false)
Packet_QE.headformat = 'I4BBBBI4HB'
Packet_QE.ctor = function(endian)
    super(Packet_QE.headformat, 1, endian)
end
Packet_QE.writeBegin = function(self, ver, cmd, gameId)
    Packet.writeBegin(self, 0, string.byte('Q'), string.byte('E'), ver, 0, cmd, gameId, 0)
end
Packet_QE.preWrite = function(self)
    Packet.preWrite(self)
    self.headvalue[1] = self.headvalue[1] + self.headsize - 4
    local buffer, check = encrypt_buffer(self.buffer)
    self.buffer = {buffer}
    self.headvalue[8] = check
end

local Packet_IPOKER = class(Packet, false)
Packet_IPOKER.headformat = 'BBHHH'
Packet_IPOKER.ctor = function(endian)
    super(Packet_IPOKER.headformat, 5, endian)
end
Packet_IPOKER.writeBegin = function(self, cmd, ver)
    Packet.writeBegin(self, string.byte('E'), string.byte('S'), cmd, ver, 0)
end

return {
    IPOKER = Packet_IPOKER,
    TEXAS = Packet_TEXAS,
    BY9 = Packet_BY9,
    BY7 = Packet_BY7,
    BY14 = Packet_BY14,
    QE = Packet_QE,
    VOICE = Packet_VOICE,
}

end
        

package.preload[ "network.protocols" ] = function( ... )
    return require('network/protocols')
end
            

package.preload[ "network/socket" ] = function( ... )
if require_uv ~= nil then
    require('network.socket_compat')
else
    require('network.socket_old')
end

end
        

package.preload[ "network.socket" ] = function( ... )
    return require('network/socket')
end
            

package.preload[ "network/socket2" ] = function( ... )
require('network.start_uvloop')

---
-- socket库
-- @module network.socket2
-- @usage local socket = require('network.socket2')
-- @usage
-- -- 自动重连示例：
-- function auto_reconnect(ip, port, handler)
--     local tasklet = require('tasklet')
--     local socket = require('network.socket2')
--     print('connecting')
--     socket.connect_async(ip, port, function(sock, err)
--         if not sock then
--             print('connected failed, retry in 500ms.', err)
--             Clock.instance():schedule_once(function()
--                 auto_reconnect(ip, port, handler)
--             end, 0.5)
--             return
--         end
--         print('connect success')
--         sock:set_on_closed(function(reason)
--             print('client on closed', reason)
--             auto_reconnect(ip, port, handler)
--         end)
--         tasklet.spawn(handler, sock)
--     end)
-- end
--
-- @usage
-- -- client 示例：
-- auto_reconnect('127.0.0.1', 8000, function(sock)
--     -- send test request every second.
--     tasklet.spawn(function()
--         while true do
--             tasklet.sleep(1)
--             local buf = struct.pack('>I4c4', 8, 'test')
--             assert(sock:write(buf))
--             print('client write', #buf)
--         end
--     end)
--     -- keep receiving packets.
--     while true do
--         local header = assert(sock:read(4))
--         local len = struct.unpack('>I4', header)
--         print('client recv', assert(sock:read(len-4)))
--     end
-- end)
--
-- @usage
-- -- echo server 示例
-- socket.spawn_server('127.0.0.1', 8000, function(sock)
--     print('server new connection')
--     sock:set_on_closed(function(reason)
--         print('server on closed', reason)
--     end)
--     while true do
--         assert(sock:write(assert(sock:read(0))))
--     end
-- end)

local M = {}
local uv = require_uv()

---
-- socket对象，不能直接构造，通过 connect connect_async 等方法获得。
-- @type socket
function M.socket(sock)
    local wait_size = 0         -- current read wait
    local _callback             -- current read callback, one shot.
    local bufs = {}             -- current pending buffers
    local size = 0              -- size of current pending buffers
    local status = 'normal'     -- status of socket: normal | closing | closed
    local closed_reason = nil   -- if status is closing or closed, close reason.
    local on_closed             -- callback to listen on_closed event.
    local function do_callback(...)
        -- auto remove callback when called.
        local cb = _callback
        _callback = nil
        cb(...)
    end
    local function check()
        -- try to call current read callback.
        if not _callback then
            return
        end
        if status ~= 'normal' then
            do_callback(nil, 'socket closed')
            return
        end
        if size == 0 then
            return
        end
        if wait_size == 0 then
            -- return whatever we got.
            local result = table.concat(bufs)
            bufs = {}
            size = 0
            do_callback(result)
        elseif size >= wait_size then
            local buf = table.concat(bufs)
            local result = string.sub(buf, 1, wait_size)
            bufs = {}
            local left = string.sub(buf, wait_size+1)
            size = #left
            if size > 0 then
                table.insert(bufs, left)
            end
            do_callback(result)
        end
    end
    local function feed(chunk)
        table.insert(bufs, chunk)
        size = size + #chunk
        check()
    end
    local function on_error(err, callback)
        -- could be read error, write error, user close
        status = 'closed'
        closed_reason = err
        if sock and not sock:is_closing() then
            sock:close()
        end
        sock = nil
        check()
        if callback then
            callback(err)
        end
        if on_closed then
            on_closed(closed_reason)
        end
    end

    -- auto start reading.
    sock:read_start(function(err, chunk)
        if err or not chunk then
            on_error(err or 'remote closed')
            return
        end
        feed(chunk)
    end)

    return {
        ---
        -- 异步读，传入回调获取结果，读够size长度才回调，size为0表示任意大于0的长度。
        --
        -- 回调函数的参数：成功为``buffer``，失败为 ``nil, err_string`` 。
        -- @function [parent=#socket] read_async
        -- @param #socket self
        -- @param #number size
        -- @param #function cb
        read_async = function(self, size, cb)
            assert(cb, 'callback can not be nil')
            wait_size = size
            _callback = cb
            check()
        end,
        ---
        -- 同步读，在``tasklet``中调用，读够size长度才返回，size为0表示任意大于0的长度，默认值为0。
        -- @function [parent=#socket] read
        -- @param #socket self
        -- @return #string 成功返回``buffer``，失败返回 ``nil, err_string``
        read = function(self, size)
            return coroutine.yield(function(callback)
                self:read_async(size, callback)
            end)
        end,
        ---
        -- 异步写，可通过回调等待结束。
        -- @function [parent=#socket] write_async
        -- @param #socket self
        -- @param #string buffer 写入的内容
        -- @param #function cb 接受结果的回调，可选，参数：成功为``nil``，失败为``err_string``。
        write_async = function(self, buffer, cb)
            assert(cb, 'callback can not be nil')
            if status ~= 'normal' then
                cb(nil, 'socket closed')
                return
            end
            sock:write(buffer, function(err)
                if err then
                    on_error(err)
                end
                if cb then
                    if err then
                        cb(nil, err)
                    else
                        cb(true)
                    end
                end
            end)
        end,
        ---
        -- 同步写，在``tasklet``中调用。写成功返回 ``nil`` ，写失败返回 ``err_string``
        -- @function [parent=#socket] write
        -- @param #socket self
        -- @param #string buffer
        write = function(self, buffer)
            return coroutine.yield(function(callback)
                self:write_async(buffer, callback)
            end)
        end,
        ---
        -- 异步关闭，通过回调等待关闭结束。
        -- @function [parent=#socket] close_async
        -- @param #socket self
        -- @param #function cb
        close_async = function(self, cb)
            assert(status == 'normal', 'socket is ' .. status)
            on_error('user close', cb)
        end,
        ---
        -- 同步关闭，在``tasklet``中使用。
        -- @param #socket self
        -- @function [parent=#socket] close
        close = function(self)
            return coroutine.yield(function(callback)
                self:close_async(callback)
            end)
        end,
        ---
        -- 获取当前状态，``normal|closing|closed`` 。
        -- @function [parent=#socket] status
        -- @param #socket self
        -- @return #string 
        status = function(self)
            return status
        end,
        ---
        -- 设置监听关闭事件的回调.
        -- @function [parent=#socket] set_on_closed 接受字符串参数 ``close_reason``
        -- @param #socket self
        -- @param #function cb
        -- @usage
        -- local sock = socket.connect('127.0.0.1', 8000)
        -- sock:set_on_closed(function(reason)
        --     print('closed', reason)
        --     -- start reconnect.
        -- end)
        set_on_closed = function(self, cb)
            on_closed = cb
        end,
    }
end

---
-- 异步连接，通过回调获取结果，成功返回``socket``对象，失败返回 ``nil, err_string`` 。
-- @function [parent=#network.socket2] connect_async
-- @param #string ip
-- @param #string port
-- @param #string cb
-- @param #table options 选项，目前只有 { timeout = seconds }
-- @usage
-- socket.connect_async('127.0.0.1', 8000, function(sock, err)
--     assert(sock, err)
-- end)
function M.connect_async(ip, port, cb, options)
    local sock = uv.new_tcp()
    local done = false
    options = options or {}
    timeout = options.timeout or 5
    local timer
    sock:connect(ip, port, function(err)
        if done then
            return
        end
        done = true
        if timer and not timer:is_closing() then
            timer:close()
            timer = nil
        end
        if err then
            cb(nil, err)
        else
            cb(M.socket(sock))
        end
    end)
    timer = uv.new_timer()
    timer:start(timeout * 1000, 0, function()
        if done then
            return
        end
        done = true
        timer:close()
        timer = nil
        cb(nil, 'timeout')
    end)
end

---
-- 同步连接，在``tasklet``中使用，成功返回``socket``对象，失败返回 ``nil, err_string`` 。
-- @function [parent=#network.socket2] connect
-- @param #string ip ip
-- @param #number port 端口
-- @param #table options 选项，目前只有 { timeout = seconds }
-- @return #socket 成功：socket示例，失败：``nil, err_string``
-- @usage
-- tasklet.spawn(function()
--     local sock = assert(socket.connect('127.0.0.1', 8000))
--     local len = struct.unpack('>I4', sock:read(4))
--     print('recv body', sock:read(len))
-- end)
function M.connect(ip, port, options)
    return coroutine.yield(function(callback)
        M.connect_async(ip, port, callback, options)
    end)
end

---
-- 创建服务器。
-- @function [parent=#network.socket2] spawn_server
-- @param #string host ip
-- @param #number port 端口
-- @param #function on_connection 处理单个连接的回调，运行为``tasklet``。
-- @usage
-- socket.spawn_server('127.0.0.1', 8000, function(sock)
--    sock:write(sock:read())
-- end)
function M.spawn_server(host, port, on_connection)
    local tasklet = require('tasklet')
    local uv = require_uv()
    local server = uv.new_tcp()
    server:bind(host, port)
    server:listen(128, function(err)
        assert(not err, err)
        local client = uv.new_tcp()
        server:accept(client)
        tasklet.spawn(on_connection, M.socket(client))
    end)
end

---
-- 异步解析地址。
--
-- 为了支持IPv6网络环境下使用IPv4地址，需要调用这个接口进行转换。
function M.getaddrinfo_async(node, service, hints, callback)
    local uv = require_uv()
    uv.getaddrinfo(node, service, hints, callback)
end
---
-- 同步解析地址，在协程中执行。
function M.getaddrinfo(node, service, hints)
    return coroutine.yield(function(callback)
        return M.getaddrinfo_async(node, service, hints, callback)
    end)
end

return M

end
        

package.preload[ "network.socket2" ] = function( ... )
    return require('network/socket2')
end
            

package.preload[ "network/socket_compat" ] = function( ... )
require("core.object");
local Packets = require('network.protocols')
local manager = require('network.manager').singleThread
manager:start()

--- socket连接成功
kSocketConnected        = 1;
--- socket连接失败
kSocketConnectFailed    = 4;
--- socket关闭成功
kSocketUserClose        = 5;
--- socket收到数据包
kSocketRecvPacket       = 9;

Socket = class();

Socket.s_sockets = {};
Socket.ctor = function(self,sockName,sockHeader,netEndian, gameId, deviceType, ver, subVer)
    if Socket.s_sockets[sockName] then
        error("Already have a " .. sockName .. " socket");
        return
    end
    self.m_name = sockName
    self.m_socketType = sockName; 
    Socket.s_sockets[sockName] = self;

    self:setProtocol(sockHeader, netEndian)
    self.m_packet_id = 0
    self.m_packets = {}

    self.m_gameId = gameId
    self.m_deviceType = deviceType
    self.m_ver = ver
    self.m_subVer = subVer
end

Socket.setProtocol = function(self, protocol, netEndian)
    self.m_endian = netEndian and '>' or '<'
    self.m_protocol = protocol
    -- for stream reader, { offset, size, initsize }.
    local size_field = {
        TEXAS = {6, 2, struct.size(Packets.TEXAS.headformat)},
        VOICE = {6, 2, struct.size(Packets.VOICE.headformat)},
        BY9 = {0, 2, 2},
        BY14 = {0, 2, 2},
        QE = {0, 4, 4},
        BY7 = {0, 2, 2},
        IPOKER = {6, 2, struct.size(Packets.IPOKER.headformat)},
    }
    local args = size_field[protocol]
    table.insert(args, self.m_endian)
    table.insert(args, 1, self.m_name)
    manager:set_protocol(unpack(args))
end

Socket.setConnTimeout = function (self,timeOut)
end

Socket.setEvent = function(self,obj,func)
    self.m_cbObj = obj;
    self.m_cbFunc = func;
end

Socket.onSocketEvent = function(self,eventType, param)
    if self.m_cbFunc then
        self.m_cbFunc(self.m_cbObj,eventType, param);
    end
end

Socket.open = function(self, ip, port)
    -- resolve first
    manager:getaddrinfo(ip, tostring(port), {
        socktype='stream',
        v4mapped=true,
        all=true,
    }, function(err, result)
        if err then
            self:onSocketEvent(kSocketConnectFailed, err)
            return
        end
        manager:connect(self.m_name, result[1].addr, port, function(status)
            if not status then
                -- success
                self:onSocketEvent(kSocketConnected)
                manager:read_start(self.m_name, function(packet)
                    if packet == nil then
                        -- connection lost
                        self:onSocketEvent(kSocketUserClose)
                        return
                    end
                    local packetId = self:_addPacket(packet)
                    self:onSocketEvent(kSocketRecvPacket, packetId)
                end)
            else
                self:onSocketEvent(kSocketConnectFailed, status)
            end
        end)
    end)
end

Socket._addPacket = function(self, packet)
    self.m_packet_id = self.m_packet_id + 1
    self.m_packets[self.m_packet_id] = {
        data = packet,
        position = 1
    }
    return self.m_packet_id
end

Socket.close = function(self, callback)
    manager:close(self.m_name, callback)
end
Socket.readBegin = function(self, packetId)
    local packet = self.m_packets[packetId]
    Packets[self.m_protocol].readBegin(self.m_endian, packet)
    return packet.head.cmd
end
Socket.readEnd = function(self, packetId)
    self.m_packets[packetId] = nil
end

Socket.readInt = function(self, packetId, defaultValue)
    local packet = self.m_packets[packetId]
    if #packet.data + 1 < packet.position + 4 then
        return defaultValue
    end
    local n
    n, packet.position = struct.unpack(self.m_endian .. 'I4', packet.data, packet.position)
    return n
end

Socket.writeBegin = function(self, ...)
    local packet = new(Packets[self.m_protocol], self.m_endian)
    packet:writeBegin(...)

    self.m_packet_id = self.m_packet_id + 1
    self.m_packets[self.m_packet_id] = packet
    return self.m_packet_id
end

Socket.writeBegin2 = function(self, ...)
    return self:writeBegin(...)
end

Socket.writeBegin3 = function(self, ...)
    return self:writeBegin(...)
end

Socket.writeBegin4 = function(self, ...)
    return self:writeBegin(...)
end

Socket.writeInt = function(self, packetId, n)
    local packet = self.m_packets[packetId]
    packet:write(struct.pack(self.m_endian .. 'I4', n))
end

Socket.writeEnd = function(self, packetId)
    local packet = self.m_packets[packetId]
    local buffer = packet:writeEnd()
    manager:write(self.m_name, buffer, function(err)
        if err then
            self:onSocketEvent(kSocketUserClose)
        end
    end)
    self.m_packets[packetId] = nil
end

Socket.readBinary = function(self, packetId)
    local n1 = self:readInt(packetId, 0)
    local len = self:readInt(packetId, 0)
    local str
    local packet = self.m_packets[packetId]
    str, packet.position = struct.unpack('c' .. tostring(len), packet.data, packet.position)
    if n1 == 0 then
        return str
    else
        return gzip_decompress(str)
    end
end

Socket.writeBinary = function(self, packetId, string, compress)
    self:writeInt(packetId, compress)
    self:writeString(packetId, compress and gzip_compress(string) or string)
end

Socket.readString = function(self, packetId)
    local packet = self.m_packets[packetId]
    local len = self:readInt(packetId, 0)
    local str
    str, packet.position = struct.unpack('c' .. tostring(len-1), packet.data, packet.position)
    assert(string.sub(packet.data, packet.position, packet.position) == '\0', 'not zero terminated.')
    packet.position = packet.position + 1
    return str
end

Socket.writeString = function(self, packetId, str)
    local packet = self.m_packets[packetId]
    packet:write(struct.pack(self.m_endian .. 'I4s', #str + 1, str))
end

Socket.readByte = function(self, packetId, defaultValue)
    local packet = self.m_packets[packetId]
    if #packet.data + 1 < packet.position + 1 then
        return defaultValue
    end
    local n
    n, packet.position = struct.unpack(self.m_endian .. 'B', packet.data, packet.position)
    return n
end

Socket.writeByte = function(self, packetId, b)
    local packet = self.m_packets[packetId]
    packet:write(struct.pack(self.m_endian .. 'B', b))
end

Socket.readShort = function(self, packetId, defaultValue)
    local packet = self.m_packets[packetId]
    if #packet.data + 1 < packet.position + 2 then
        return defaultValue
    end
    local n
    n, packet.position = struct.unpack(self.m_endian .. 'H', packet.data, packet.position)
    return n
end

Socket.writeShort = function(self, packetId, b)
    local packet = self.m_packets[packetId]
    packet:write(struct.pack(self.m_endian .. 'H', b))
end

Socket.writeBuffer = function(self, buffer)
    manager:write(self.m_name, buffer, function(err)
        if err then
            self:onSocketEvent(kSocketUserClose)
        end
    end)
end

function socket_close(name)
    manager:close(name)
end

end
        

package.preload[ "network.socket_compat" ] = function( ... )
    return require('network/socket_compat')
end
            

package.preload[ "network/socket_old" ] = function( ... )

--------------------------------------------------------------------------------
-- socket，用于和游戏服务器通信.
-- 只支持博雅游戏的各种协议，数据加密与解密已经内置在引擎中。
-- 
-- @module network.socket
-- @return #nil 
-- @usage     require("network.socket")
--     local PROTOCOL_TYPE_QE="QE"                           -- 注：具体协议应与server确定
--     -- 创建一个socket，socketName为"DOUDIZHU",此名称唯一
--     -- socketHeader为PROTOCOL_TYPE_QE，netEndian网络字节序设为1， gameId为10010
--     -- deviceType为192，ver主版本号为20.5，subVer子版本号为0.08
--     local socket = new(Socket,"DOUDIZHU",PROTOCOL_TYPE_QE,1, 10010, 192, 20.5, 0.08)
--     -- 设置10s内连接有效
--     socket:setConnTimeout(10*1000) 
--     -- 服务器的地址为192.168.1.1 端口号为80   
--     socket:open("192.168.1.1",80) 
--      
--     -- socket成功连接后，可以发送数据。
--     -- cmd的值此处为1，应与server确认。由于ver，subVer，deviceType已经在构造函数中设置，所以这里传nil；也可以传其他值覆盖。
--     -- 返回packetId,收到消息、设置回调会用到
--     local packetId=socket:writeBegin (1, nil, nil, nil)   --先写入包头
--     socket:writeString(packetId,"发送的内容")              -- 写入数据
--     socket:writeEnd(packetId)                             -- 数据写入完成，可以发送了 
--   
--     -- 设置回调函数。设置事件kSocketRecvPacket，那么每次收到消息时即触发。
--     socket:setEvent(packetId,function(kSocketRecvPacket,packetId)
--          socket:readString(packetId)                        -- 读取消息。 调用readString或readInt等，应与server确认。
--     end
--     )
--     
--     -- 关闭连接
--     socket:close()

-- socket.lua
-- Author: Vicent Gong
-- Date: 2012-09-30
-- Last modification : 2015-12-15 by DengXuanYing
-- Description: provide basic wrapper for socket functions


require("core.object");

--- socket连接成功
kSocketConnected        = 1;
--- socket连接失败
kSocketConnectFailed    = 4;
--- socket关闭成功
kSocketUserClose        = 5;
--- socket收到数据包
kSocketRecvPacket       = 9;

---
--
-- @type Socket
Socket = class();

---
-- 保存所有的socket实例.
Socket.s_sockets = {};

---
-- 构造函数.
--
-- @param self
-- @param #string sockName socket名字，同名的socket只能同时存在一个。
-- @param #number sockHeader 包头类型，请联系游戏server来确定。
-- @param #number netEndian 网络字节序， 目前固定传1。 
-- @param #number gameId 游戏的id，此值是游戏server确定的。
-- @param #number deviceType 设备类型，此值是游戏server确定的。
-- @param #number ver 协议版本号，此值是游戏server确定的。
-- @param #number subVer 协议子版本号，此值是游戏server确定的。
Socket.ctor = function(self,sockName,sockHeader,netEndian, gameId, deviceType, ver, subVer)

  if Socket.s_sockets[sockName] then
    error("Already have a " .. sockName .. " socket");
    return
  end

  self.m_socketType = sockName; 
  Socket.s_sockets[sockName] = self;
  self:setProtocol ( sockHeader, netEndian ); 

  self.m_gameId = gameId;
  self.m_deviceType = deviceType;
  self.m_ver = ver;
  self.m_subVer = subVer;
  
end

---
-- 析构函数.
--
-- @param self
Socket.dtor = function(self)
  Socket.s_sockets[self.m_socketType] = nil;
end


---
-- 设置协议类型.
-- 此方法仅在构造方法内调用。
--
-- @param self
-- @param #number sockHeader 包头类型，请联系游戏server来确定。
-- @param #number netEndian 网络字节序，目前固定传1。 
Socket.setProtocol = function ( self,sockHeader,netEndian )
  socket_set_protocol ( self.m_socketType, sockHeader, netEndian );
end

---
-- 设置连接超时时间.
--
-- @param self
-- @param #number timeOut 超时时间(毫秒)。
Socket.setConnTimeout = function ( self,timeOut )
  socket_set_conn_timeout ( self.m_socketType, timeOut );
end

---
-- 设置QE协议的扩展包头长度.
--
-- @param self
-- @param #number sizeExt 扩展包头大小，单位为字节。
Socket.setHeaderExtSize = function ( self,sizeExt )
  socket_set_header_extend ( self.m_socketType, sizeExt );
end

---
-- 该接口已废除.
--
Socket.setReconnectParam = function(self, reconnectTimes, interval)
  --return Socket.callFunc(self,"reconnect",reconnectTimes,interval);
end

---
-- 设置事件回调函数.
-- 
-- @param self
-- @param obj 任意类型，回调时传回。
-- @param #function func 回调函数，传入参数为：(obj, eventType, param)。
-- eventType: 事件类型。  
-- 取值[```kSocketConnected```](network.socket.html#kSocketConnected)(连接成功)，
-- [```kSocketConnectFailed```](network.socket.html#kSocketConnectFailed)(连接失败)，
-- [```kSocketUserClose```](network.socket.html#kSocketUserClose)(关闭连接)，
-- [```kSocketRecvPacket```](network.socket.html#kSocketRecvPacket)(收到数据包)。  
-- param: 辅助参数，任意类型。当eventType取值kSocketRecvPacket时，param应传数据包的id。
Socket.setEvent = function(self,obj,func)
  self.m_cbObj = obj;
  self.m_cbFunc = func;
end

---
-- 用于接收事件回调.
-- **开发者不应主动调用此函数。**
--
-- @param self
-- @param #number eventType 事件类型。
-- @param #number param 额外参数。
Socket.onSocketEvent = function(self,eventType, param)
  if self.m_cbFunc then
    self.m_cbFunc(self.m_cbObj,eventType, param);
  end
end

--- 
-- 该函数已经废除.
Socket.reconnect = function(self,num,interval)
  
end

---
-- 开始连接socket.
-- 成功仅表示开始连接，并不代表已经连上。
--
-- @param self
-- @param #string ip 连接ip。
-- @param #number port 端口号。
-- @return #number 返回0表示连接成功，-1表示连接失败。
Socket.open = function(self, ip, port)
  return socket_open(self.m_socketType,ip,port);
end

---
-- 关闭socket.
-- 关闭是异步的，关闭完成后会收到kSocketUserClose事件。
--
-- @param self
-- @param #number param 保留，目前未使用。
Socket.close = function(self, param)
  return socket_close(self.m_socketType,param or -1);
end

---
-- 生成一个数据包，并写入包头信息.
-- 
-- @param self
-- @param #number cmd 命令号。
-- @param #number ver 协议版本号。
-- @param #number subVer 协议子版本号。
-- @param #number deviceType 设备类型。
-- @return #number 该数据包的packetId。
Socket.writeBegin = function(self, cmd, ver, subVer, deviceType)
  return socket_write_begin(self.m_socketType,cmd,
    ver or self.m_ver,
    subVer or self.m_subVer,
    deviceType or self.m_deviceType);
end

---
-- 生成一个数据包，并写入包头信息.
-- 
-- @param self
-- @param #number cmd 命令号。
-- @param #number subCmd 子命令号。
-- @param #number ver 协议版本号。
-- @param #number subVer 协议子版本号。
-- @param #number deviceType 设备类型。
-- @return #number 该数据包的packetId。
Socket.writeBegin2 = function(self, cmd, subCmd, ver, subVer, deviceType)
  return socket_write_begin2(self.m_socketType,cmd,subCmd,
    ver or self.m_ver,
    subVer or self.m_subVer,
    deviceType or self.m_deviceType);
end

---
-- 生成一个数据包，并写入包头信息.
-- 
-- @param self
-- @param #number cmd 命令号。
-- @param #number ver 协议版本号。
-- @param #number gameId 游戏类型id。
-- @return #number 该数据包的packetId。
Socket.writeBegin3 = function(self, cmd, ver, gameId)
  return socket_write_begin3(self.m_socketType,
      ver or self.m_ver,
      cmd,
      gameId or self.m_gameId);
end

---
-- 生成一个数据包，并写入包头信息.
--
-- @param self
-- @param #number cmd 命令号。
-- @param #number ver 协议版本号。
-- @return #number 该数据包的packetId。
Socket.writeBegin4 = function(self,cmd,ver)
  return socket_write_begin4(self.m_socketType,ver or self.m_ver,cmd);
end

---
-- 写入一个byte.
-- 向指定的数据包末尾位置写入一个byte数据。
--
-- @param self
-- @param #number packetId 数据包id, 由@{#Socket.writeBegin}或类似的接口返回。
-- @param #number value 写入的byte数据。
Socket.writeByte = function(self, packetId, value)
  return socket_write_byte(packetId,value);
end

---
-- 写入一个short.
-- 向指定的数据包末尾位置写入一个short数据。
--
-- @param self
-- @param #number packetId packetId 数据包id,由@{#Socket.writeBegin}或类似的接口返回。
-- @param #number value 写入的short数据。
Socket.writeShort = function(self, packetId, value)
  return socket_write_short(packetId,value);
end

---
-- 写入一个int.
-- 向指定的数据包末尾位置写入一个int数据。
--
-- @param self
-- @param #number packetId packetId 数据包id,由@{#Socket.writeBegin}或类似的接口返回。
-- @param #number value 写入的int数据。
Socket.writeInt = function(self, packetId, value)
  return socket_write_int(packetId,value);
end


---
-- 写入一个int64.
-- 向指定的数据包末尾位置写入一个int64数据。
--
-- @param self
-- @param #number packetId packetId 数据包id,由@{#Socket.writeBegin}或类似的接口返回。
-- @param #number value 写入的int64数据。
Socket.writeInt64 = function(self,packetId,value)
  return socket_write_int64(packetId,value);
end

---
-- 写入一个string.
-- 向指定的数据包末尾位置写入一个字符串数据。
--
-- @param self
-- @param #number packetId packetId 数据包id,由@{#Socket.writeBegin}或类似的接口返回。
-- @param #string value 写入的字符串数据。
Socket.writeString = function(self, packetId, value)
  return socket_write_string(packetId,value);
end

---
-- 直接发送字符串.
-- 创建一个包，向包里写入一个字符串，覆盖包的全部内容（包括包头），然后发送该包。
--
-- @param self
-- @param #string value 要发送的字符串，最大32k。
Socket.writeBuffer = function(self,value)
  return socket_write_buffer(self.m_socketType,value);
end

---
-- 数据包内容写入完成.
-- 调用该函数后代表数据包已经完成，并开始发送数据包给服务器。
--
-- @param self
-- @param #number packetId packetId 数据包id,由@{#Socket.writeBegin}或类似的接口返回。
Socket.writeEnd = function(self, packetId)
  return socket_write_end(packetId);
end

---
-- 开始读取一个数据包.
--
-- @param self
-- @param #number packetId 数据包的id。
Socket.readBegin = function(self, packetId)
  return socket_read_begin(packetId);
end

---
-- 读取子命令号.
--
-- @param self
-- @param #number packetId 数据包的id。
-- @return #number subCmd 返回子命令号。
Socket.readSubCmd = function(self, packetId)
  return socket_read_sub_cmd(packetId);
end

---
-- 读取一个byte.
--
-- @param self
-- @param #number packetId 数据包的id。
-- @param #number defaultValue 默认值，如果读取失败，返回该值。
-- @return #number 返回一个byte数据。
Socket.readByte = function(self, packetId, defaultValue)
  return socket_read_byte(packetId,defaultValue);
end


---
-- 读取一个short.
--
-- @param self
-- @param #number packetId 数据包的id。
-- @param #number defaultValue 默认值，如果读取失败，返回该值。
-- @return #number 返回一个short数据。
Socket.readShort = function(self, packetId, defaultValue)
  return socket_read_short(packetId,defaultValue);
end


---
-- 读取一个int.
--
-- @param self
-- @param #number packetId 数据包的id。
-- @param #number defaultValue 默认值，如果读取失败，返回该值。
-- @return #number 返回一个int数据。
Socket.readInt = function(self, packetId, defaultValue)
  return socket_read_int(packetId,defaultValue);
end

---
-- 读取一个int64.
--
-- @param self
-- @param #number packetId 数据包的id。
-- @param #number defaultValue 默认值，如果读取失败，返回该值。
-- @return #number 返回一个int64数据。
Socket.readInt64 = function(self, packetId, defaultValue)
  return socket_read_int64(packetId,defaultValue);
end

---
-- 读取一个string.
--
-- @param self
-- @param #number packetId 数据包的id。
-- @return #string 读到的string。
Socket.readString = function(self,packetId)
  return socket_read_string(packetId);
end


---
-- 读取结束后调用此方法释放数据包所占内存.
--
-- @param self
-- @param #number packetId 数据包的id。
Socket.readEnd = function(self, packetId)
  return socket_read_end(packetId);
end

Socket.writeBinary = function(self, packetId, string, compress)
  return socket_write_string_compress(packetId, string, compress)
end

Socket.readBinary = function(self, packetId)
  return socket_read_string_compress(packetId)
end

---
-- 用于接收c++的socket事件通知.
-- **开发者不应直接调用此方法。**
--
-- @param #string sockName socket的名称。
-- @param #number eventType 事件类型，取值：[```kSocketConnected```](network.socket.html#kSocketConnected)(连接成功)，
-- [```kSocketConnectFailed```](network.socket.html#kSocketConnectFailed)(连接失败)，
-- [```kSocketUserClose```](network.socket.html#kSocketUserClose)(关闭连接)，
-- [```kSocketRecvPacket```](network.socket.html#kSocketRecvPacket)(收到数据包)。
-- @param #number param1 eventType为kSocketRecvPacket时是packetId。
-- @param #number param2 eventType为kSocketRecvPacket时是接收包队列里数据包的数量。
function event_socket(sockName, eventType, param1, param2)
  if Socket.s_sockets[sockName] then
    Socket.s_sockets[sockName]:onSocketEvent(eventType, param1);
  end
end

end
        

package.preload[ "network.socket_old" ] = function( ... )
    return require('network/socket_old')
end
            

package.preload[ "network/start_uvloop" ] = function( ... )
local uv = require_uv()
-- start event loop
return Clock.instance():schedule(function()
    uv.run('nowait')
end)

end
        

package.preload[ "network.start_uvloop" ] = function( ... )
    return require('network/start_uvloop')
end
            

package.preload[ "network/version" ] = function( ... )

--返回版本号
return '3.1(7691a1e14736929809f302d991d4f1aafea28097)'

end
        

package.preload[ "network.version" ] = function( ... )
    return require('network/version')
end
            