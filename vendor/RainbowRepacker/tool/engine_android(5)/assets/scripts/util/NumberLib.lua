number = {}
--判断参数是非数字（not a number）
function number.isNum(_n)
	return tonumber(_n) and true or false;
end

--转换成数字，若无法转换成数字，返回默认值，没给定默认值则返回0
function number.valueOf(_s, _d)
	return tonumber(_s) or (_d or 0);
end
function number.getRandom(round)
	--math.randomseed(tostring(os.time()):reverse():sub(1, 10))

	return math.random(round);
end

--转换成0x0000格式的十六进制数
function number.formatToHex(num)
	num = number.valueOf(num);
	return string.format("0x%04X",num);
end