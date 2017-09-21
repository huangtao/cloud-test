-- 富文本图片配置文件

--Lua里的转义字符: ( ) . % + - * ? [ ^ $ 
function SpecialCharSafe2Str(str)
	return string.gsub(str, "[%(%)%.%%%+%-%*%?%[%]%^%$]", 
		function(ret)
			-- Log.w("try to find special char", ret)
			ret = "%"..ret
			return ret
		end)
end

-- ctrl(id)aaaa --> id, aaaa
function SplitIdAndStr(str, ctrl)
	local ret1, ret2 = nil, nil
	string.gsub(str, ctrl.."%(%D*(%d*).*%)(.*)", function(str1, str2) ret1 = str1; ret2 = str2; end)
	return ret1, ret2
end

kRichIdStrTbl = kRichIdStrTbl or {}
__RichSharpKey = __RichSharpKey or 10000
function __getKey()
	__RichSharpKey = __RichSharpKey + 1
	return __RichSharpKey
end

function SafeToRichStr(str)
	if string.find(str, "#") then
		local key = __getKey()
		kRichIdStrTbl[key] = str
		str = "#k("..key..")"
	end
	return str
end

-- 从tbl里重新取回原本的str
function RegainStr(sharp_key)
	sharp_key = tonumber(sharp_key)
	if not sharp_key then return "" end
	local str = kRichIdStrTbl[sharp_key] or ""
	kRichIdStrTbl[sharp_key] = nil

	return str
end


-- string.rep(kRichUnderLine, ntimes)
kRichUnderLine = "__________________________________________________________________"

kRichImageConf = {
	------------------------ sample ------------------------
	[101] = {file="isolater/male_head.png", w=80,h=80,},
	
	------------------add your images below-----------------
	[102] = {file="2.0/common/femal.png", w=32,h=32},
	[103] = {file="2.0/common/male.png", w=32,h=32},

	[104] = {file="2.0/common/coin_icon.png", w=45,h=45},	-- 每日登录奖励VIP银币图标配置
	[105] = {file = "hall/common/blank.png", w=65, h=50},	-- Vip3的图标配置
	[106] = {file = "hall/common/blank.png", w=45, h=35},	-- Vip1、Vip2的图标配置
	-- max is [999]
}
