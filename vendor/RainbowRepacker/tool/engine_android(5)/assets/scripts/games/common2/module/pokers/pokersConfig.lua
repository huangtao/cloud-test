require("games/common2/pokers/layout/poker_big");

PokersConfig = {};

PokersConfig.s_defaultWidth = 202;--1280*800时扑克牌的大小
PokersConfig.s_defaultHeight = 272;
PokersConfig.s_defaultScreenW = 1280; --默认配置调整时的屏幕分辨率
PokersConfig.s_defaultScreenH = 800;
PokersConfig.mySeat = GamePlayerManager2.getInstance():getMyLocalSeat();

PokersConfig.s_showType = {
	Fore = 1; --正面
	Back = 2; --背面
};

PokersConfig.s_pokerShowType = {
	MyHandCard = "myHandCard";--自己的手牌
	HandCard = "handCard";--别人的手牌
	OutCard = "outCard"; --打出去的牌
	ShowCard = "showCard";--展示牌
};

PokersConfig.defaultHandCardViewConfig = {
	[PokersConfig.mySeat] = {
		["x"] = 0;
    	["y"] = 0;
    	["align"] = kAlignBottom;
		["width"] = 1260;
		["height"] = PokersConfig.s_defaultHeight;
    	["normalSpace"] = 45;
    	["maxSpace"] = 80;   	
    	["dragScale"] = 0.8;
	};
};

PokersConfig.defaultOutCardViewLocation = {
	["bottom"] = {
		["x"] = 0;
    	["y"] = PokersConfig.s_defaultHeight + 50;
    	["align"] = kAlignBottom;
		["space"] = 35; 
		["animScale"] = 2;--默认出牌动画缩放的起始比例
		["animStartX"] = 0; --默认出牌动画移动的起始位置
		["animStartY"] = 50;--默认出牌动画移动的起始位置
		["animDuration"] = 1000; --默认出牌动画的时间
	};	

	["right"] = {
		["x"] = PokersConfig.s_defaultWidth - 30;
    	["y"] = PokersConfig.s_defaultHeight - 80;
    	["align"] = kAlignTopRight;
		["space"] = 35; 
		["animScale"] = 1;--默认出牌动画缩放的起始比例
		["animStartX"] = PokersConfig.s_defaultWidth/2; --默认出牌动画移动的起始位置
		["animStartY"] = -(PokersConfig.s_defaultHeight/2);--默认出牌动画移动的起始位置
		["animDuration"] = 600; --默认出牌动画的时间
	};	

	["top"] = {
		["x"] = 0;
    	["y"] = 120;
    	["align"] = kAlignTop;
		["space"] = 35; 
		["animScale"] = 1;--默认出牌动画缩放的起始比例
		["animStartX"] = 0; --默认出牌动画移动的起始位置
		["animStartY"] = -60;--默认出牌动画移动的起始位置
		["animDuration"] = 300; --默认出牌动画的时间
	};	

	["left"] = {
		["x"] = PokersConfig.s_defaultWidth - 30;
    	["y"] = PokersConfig.s_defaultHeight - 80;
    	["align"] = kAlignTopLeft;
		["space"] = 35; 
		["animScale"] = 1;--默认出牌动画缩放的起始比例
		["animStartX"] = -PokersConfig.s_defaultWidth/2; --默认出牌动画移动的起始位置
		["animStartY"] = -(PokersConfig.s_defaultHeight/2);--默认出牌动画移动的起始位置
		["animDuration"] = 600; --默认出牌动画的时间
	};		
};

PokersConfig.defaultOutCardViewConfig = {
	[PokersConfig.mySeat] = PokersConfig.defaultOutCardViewLocation["bottom"];
};

PokersConfig.defaultPokersConfig = {
	["myHandCard"] = {
		["pokerW"] = PokersConfig.s_defaultWidth;
		["pokerH"] = PokersConfig.s_defaultHeight;
		["showType"] = PokersConfig.s_showType.Fore;
		["scale"] = 1;
		["dragScale"] = 0.8;
	};
	["handCard"] = {
		["pokerW"] = PokersConfig.s_defaultWidth * 0.3;
		["pokerH"] = PokersConfig.s_defaultHeight * 0.3;
		["showType"] = PokersConfig.s_showType.Back;
		["scale"] = 0.3;
	};
	["outCard"] = {
		["pokerW"] = PokersConfig.s_defaultWidth * 0.5;
		["pokerH"] = PokersConfig.s_defaultHeight  * 0.5;
		["showType"] = PokersConfig.s_showType.Fore;
		["scale"] = 0.5; --扑克牌的缩放比例
	};
};

PokersConfig.pokerTypeNamesMap = {
	[1] = "spade";--黑桃
	[2] = "heart";--红心
	[3] = "plum";--梅花
	[4] = "square";--方块
	[5] = "jokerred";--大王
	[6] = "jokerblack";--小王
};

-------------------------------------------------------------------------------------
--进入游戏前一定要调用，重置配置
PokersConfig.initData = function()
	PokersConfig.m_configMap = {};
	PokersConfig.m_callFuncMap = {};
	PokersConfig.m_filePathMap = {};
	PokersConfig.m_infoData = {};
end 

--退出游戏前一定要调用，重置配置
PokersConfig.clear = function()
	PokersConfig.initData();
end 

-------------------------------------------------------------------------------------
PokersConfig.setPokersConfig = function(config)
	PokersConfig._setConfigMap("pokersConfig",config);
end 

PokersConfig.setPokerConfigByShowType = function(pokerShowType,config)
	local pokersConfig = PokersConfig._getConfigMap("pokersConfig");

	if config and type(config) == "table" then 
		pokersConfig = table.verify(pokersConfig);
		pokersConfig[pokerShowType] = config;
	end

	PokersConfig._setConfigMap("pokersConfig",pokersConfig);
end 

PokersConfig.getPokerConfig = function(pokerShowType)
	local pokersConfig = PokersConfig._getConfigMap("pokersConfig");

	local pokerConfig;
	if pokersConfig then 
		pokerConfig = pokersConfig[pokerShowType];
	end 

	pokerConfig = pokerConfig or PokersConfig.defaultPokersConfig[pokerShowType];
	return table.verify(pokerConfig);
end

PokersConfig.getPokerSize = function(pokerShowType)
	local pokerConfig = PokersConfig.getPokerConfig(pokerShowType);
	local w = pokerConfig.pokerW or PokersConfig.s_defaultWidth;
	local h = pokerConfig.pokerH or PokersConfig.s_defaultHeight;
	return w,h;
end

-------------------------------------------------------------------------------------
--游戏必须重写该方法、实现牌值转换
PokersConfig.setPokerConvertFunc = function(obj,func)
	PokersConfig._setCallFunc("pokerConvert",obj,func);
end

--获取牌的花色与牌值
PokersConfig.getPokerTypeAndValue = function(pokerByte)
	local config = PokersConfig._getCallFunc("pokerConvert");
	if not config.func then
        error("u must set pokerConvertFunc");
    else
    	if not pokerByte then 
    		PokersConfig.eLog("getPokerTypeAndValue","没有数据啊！！！");
    		return;
    	end 

    	return config.func(config.obj,pokerByte);
    end
end

--设置牌型计算器
PokersConfig.setCardTypeCalculator = function(obj,func)
	PokersConfig._setCallFunc("cardTypeCalculator",obj,func);
end
--获取牌型
PokersConfig.getCardType = function(byteList)
	local config = PokersConfig._getCallFunc("cardTypeCalculator");
	if config.func then 
		byteList = table.verify(byteList);
		return config.func(config.obj,byteList);
	end 
end

--获取错误牌型的定义
PokersConfig.setErrorCardType = function(cardType)
	PokersConfig._setInfoData("errorCardType",cardType);
end
PokersConfig.getErrorCardType = function()
	return PokersConfig._getInfoData("errorCardType");
end

--检验是否是合法的牌型
PokersConfig.checkCardTypeIsLegal = function(byteList)
	local cardType = PokersConfig.getCardType(byteList);
	if cardType then 
		return cardType ~= PokersConfig.getErrorCardType();
	else 
		return true;
	end 
end

--设置出牌合法性检验的方法
PokersConfig.setOutCardLegalCheckFunc = function(ob,func)
	PokersConfig._setCallFunc("outCardLegalChecker",obj,func);
end
--检测出牌是否合法
PokersConfig.checkOutCardIsLegal = function(byteList,lastCards,lastType)
	local config = PokersConfig._getCallFunc("outCardLegalChecker");
	if config.func then 
		byteList = table.verify(byteList);
		return config.func(config.obj,byteList,lastCards,lastType);
	else 
		return true;
	end 
end

--设置扑克牌提示
PokersConfig.setCardTipsFunc = function(obj,func)
	PokersConfig._setCallFunc("cardTips",obj,func);
end
--获取提示
--myHandCardData:我的手牌数据(table)
--clickCards:点击选中的牌(table或nil)
--movingCards:滑动选中的牌(table或nil)
--lastCards,lastType:上个玩家出的牌和牌型（如果有数据则为table与number，否则为nil）
--返回值为某合法牌组(table)或nil
PokersConfig.getCardTips = function(myHandCardData,clickCards,movingCards,lastCards,lastType)
	local config = PokersConfig._getCallFunc("cardTips");
	if config.func then 
		myHandCardData = table.verify(myHandCardData);
		return config.func(config.obj,myHandCardData,clickCards,movingCards,lastCards,lastType);
	else 
		return;
	end
end

--------------------------------------------------------------------------------------
--设置手牌的排序方法
PokersConfig.setHandPokerSortFunc = function(obj,func)
	PokersConfig._setCallFunc("pokerSort",obj,func);
end
--对手牌进行排序
PokersConfig.sortHandCard = function(handList)
	handList = table.verify(handList);

	local config = PokersConfig._getCallFunc("pokerSort");
	if config.func then 
		return config.func(config.obj,handList);
	else 
		table.sort(handList,function(a,b)
			if a and b then 
				return number.valueOf(a) < number.valueOf(b);
			end 
		end)
	end 
end
-------------------------------------------------------------------------------------
--设置发牌的动画
PokersConfig.setDealCardAnimFunc = function(obj,func)
	PokersConfig._setCallFunc("dealCardAnim",obj,func);
end
PokersConfig.playDealCardAnim = function(byteList,callObj,callFunc)
	local config = PokersConfig._getCallFunc("dealCardAnim");
	if config.func then 
		return true,config.func(config.obj,byteList,callObj,callFunc);
	else 
		return false;
	end 
end

-------------------------------------------------------------------------------------
--设置加入手牌的动画
PokersConfig.setAddHandCardAnimFunc = function(obj,func)
	PokersConfig._setCallFunc("addHandCardAnim",obj,func);
end
PokersConfig.playAddHandCardAnim = function(byteList,seat,callObj,callFunc)
	local config = PokersConfig._getCallFunc("addHandCardAnim");
	if config.func then 
		byteList = table.verify(byteList);
		return true,config.func(config.obj,byteList,seat,callObj,callFunc);
	else 
		return false;
	end 
end
-------------------------------------------------------------------------------------
--绘制打出去的静止的牌（例如斗地主、不同的牌型可以绘制不同的样式）
PokersConfig.setOutCardCreateFunc = function(obj,func)
	PokersConfig._setCallFunc("outCardCreater",obj,func);
end

--返回一个node
PokersConfig.getOutCardModelLayer = function(outbyteList,cardType,seat)
	local config = PokersConfig._getCallFunc("outCardCreater");
	if config.func then 
		outbyteList = table.verify(outbyteList);
		return config.func(config.obj,outbyteList,cardType,seat);
	end 
end

--设置出牌动画获取方法
PokersConfig.setOutCardAnimGetFunc = function(obj,func)
	PokersConfig._setCallFunc("outCardAnimGainer",obj,func);
end

--获取出牌动画(多返回值：是否已获取过出牌动画，播放动画的返回值)
--PokersConfig.m_outCardAnimCalculatorFunc的返回值为true或者动画的根节点
PokersConfig.getOutCardAnim = function(outbyteList,cardType,seat,callObj,callFunc)
	local config = PokersConfig._getCallFunc("outCardAnimGainer");
	if config.func then 
		outbyteList = table.verify(outbyteList);
		return true,config.func(config.obj,outbyteList,cardType,seat,callObj,callFunc);
	else 
		return false;
	end 
end

--设置播放音效的方法
PokersConfig.setOutCardEffectPlayFunc = function(obj,func)
	PokersConfig._setCallFunc("outCardEffectPlayer",obj,func);
end
--播放出牌音效
PokersConfig.playOutPokerEffect = function(outbyteList,cardType,seat)
	local config = PokersConfig._getCallFunc("outCardEffectPlayer");
	if config.func then 
		outbyteList = table.verify(outbyteList);
		config.func(config.obj,outbyteList,cardType,seat);
	end 
end
-------------------------------------------------------------------------------------
PokersConfig.getPokerFilesMapByByte = function(pokerByte)
	if not pokerByte then 
		PokersConfig.eLog("getPokerFilesMapByByte","没有用来获取扑克牌图片的数据");
		return {};
	end
	local pokerType,pokerValue = PokersConfig.getPokerTypeAndValue(pokerByte);
	return PokersConfig.getPokerFilesMap(pokerType,pokerValue);
end 

--设置获取扑克牌的图片
--该方法返回的是一个table,可查看getPokerFilesMap返回格式
PokersConfig.setPokerFilesMapGetFunc = function(obj,func)
	PokersConfig._setCallFunc("pokerFilesMapGainer",obj,func);
end
PokersConfig.getPokerFilesMap = function(pokerType,pokerValue)
	if not(pokerType and pokerValue) then 
		PokersConfig.eLog("getPokerFilesMap","没有用来获取扑克牌图片的正确数据","pokerType = ",pokerType,"pokerValue = ",pokerValue);
		return {};
	end 

	local config = PokersConfig._getCallFunc("pokerFilesMapGainer");
	if config.func then 
		return config.func(config.obj,pokerType,pokerValue);
	else 
		local typeName = PokersConfig.getPokerTypeName(pokerType,pokerValue);
		if typeName == "" then 
			PokersConfig.eLog("getPokerFilesMap","获取到的牌型不对");
			return {};
		end 

		local bigIcon,smallIcon = PokersConfig.getPokerTypeFile(pokerType,pokerValue);
			
		local temp = {};
		temp.foreBg = PokersConfig.getPokerForeBgFile();
		temp.backBg = PokersConfig.getPokerBackBgFile();
		temp.numFile = PokersConfig.getPokerNumFile(pokerType,pokerValue);
		temp.bigIcon = bigIcon;
		temp.smallIcon = smallIcon;

		return temp;
	end 
end

--由外部写入的获取poker牌图片的方法、得到的都是全路径
--获取扑克牌正面背景图片
PokersConfig.setPokerForeBgFile = function(pokerForeBg)
	PokersConfig._setFilePath("pokerForeBg",pokerForeBg);
end
PokersConfig.getPokerForeBgFile = function()
	return PokersConfig._getFilePath("pokerForeBg");
end

--获取扑克牌背面图片
PokersConfig.setPokerBackBgFile = function(pokerBackBg)
	PokersConfig._setFilePath("pokerBackBg",pokerBackBg);
end
PokersConfig.getPokerBackBgFile = function()
	return PokersConfig._getFilePath("pokerBackBg");
end

--获取扑克牌数字图片
PokersConfig.setGetPokerNumFileFunc = function(obj,func)
	PokersConfig._setCallFunc("pokerNumFileGainer",obj,func);
end
PokersConfig.getPokerNumFile = function(pokerType,pokerValue)
	if not(pokerType and pokerValue) then 
		PokersConfig.eLog("getPokerNumFile","没有用来获取扑克牌图片的正确数据","pokerType = ",pokerType,"pokerValue = ",pokerValue);
		return;
	end 

	local config = PokersConfig._getCallFunc("pokerNumFileGainer");
	if config.func then 
		return config.func(config.obj,pokerType,pokerValue);
	else 
		local numFile;
		local isJoker,typeName = PokersConfig.checkIsJoker(pokerType,pokerValue); 
		if isJoker then 
			numFile = typeName.."word.png";
		else 
			local color = PokersConfig.getPokerNumColor(typeName);
			numFile = pokerValue..color..".png";
		end

		return PokersConfig.formatPokerFileFullPath(numFile);
	end 
end

--获取扑克牌花色图片
PokersConfig.setGetPokerTypeFileFunc = function(obj,func)
	PokersConfig._setCallFunc("pokerTypeFileGainer",obj,func);
end
PokersConfig.getPokerTypeFile = function(pokerType,pokerValue)
	if not(pokerType and pokerValue) then 
		PokersConfig.eLog("getPokerTypeFile","没有用来获取扑克牌图片的正确数据","pokerType = ",pokerType,"pokerValue = ",pokerValue);
		return;
	end

	local config = PokersConfig._getCallFunc("pokerTypeFileGainer");
	if config.func then 
		return config.func(config.obj,pokerType,pokerValue);
	else
		local bigIcon,smallIcon;
				
		local isJoker,typeName = PokersConfig.checkIsJoker(pokerType,pokerValue); 
		if isJoker then
			bigIcon = typeName..".png";
			bigIcon = PokersConfig.formatPokerFileFullPath(bigIcon);
		else
			if pokerValue <= 10 then 
				bigIcon = typeName.."Big.png";			
			else 
				local color = PokersConfig.getPokerNumColor(typeName);
				if pokerValue == 11 then 
		            bigIcon = "j";
		        elseif pokerValue == 12 then 
		            bigIcon = "q";
		        else
		            bigIcon = "k";
		        end
		        bigIcon = bigIcon..color..".png";
			end 
			bigIcon = PokersConfig.formatPokerFileFullPath(bigIcon);
			smallIcon = PokersConfig.formatPokerFileFullPath(typeName.."Small.png");
		end

		return bigIcon,smallIcon;
	end 
end

--游戏需设置该方法，获取到正确的牌类型
PokersConfig.setPokerTypeNameGetFunc = function(obj,func)
	PokersConfig._setCallFunc("pokerTypeNameGainer",obj,func);
end
PokersConfig.getPokerTypeName = function(pokerType,pokerValue)
	if not(pokerType and pokerValue) then 
		PokersConfig.eLog("getPokerTypeName","没有用来获取扑克牌图片的正确数据","pokerType = ",pokerType,"pokerValue = ",pokerValue);
		return "";
	end

	local config = PokersConfig._getCallFunc("pokerTypeNameGainer");
	if config.func then 
		return config.func(config.obj,pokerType,pokerValue);
	else
		return PokersConfig.pokerTypeNamesMap[pokerType] or "";
	end 
end

--获取扑克牌数字的颜色
PokersConfig.getPokerNumColor = function(typeName)
	local color = "black";
	if typeName == PokersConfig.pokerTypeNamesMap[1] or 
		typeName == PokersConfig.pokerTypeNamesMap[3] or
		typeName == PokersConfig.pokerTypeNamesMap[6] then 
		color = "black";
	elseif typeName == PokersConfig.pokerTypeNamesMap[2] or 
			typeName == PokersConfig.pokerTypeNamesMap[4] or
			typeName == PokersConfig.pokerTypeNamesMap[5] then
		color = "red";
	end

	return color;
end

--检查扑克牌是不是王
PokersConfig.checkIsJokerByByte = function(pokerByte)
	if not pokerByte then 
		PokersConfig.eLog("checkIsJokerByByte","扑克牌数据不正确");
		return false,"";
	end

	local pokerType,pokerValue = PokersConfig.getPokerTypeAndValue(pokerByte);
	return PokersConfig.checkIsJoker(pokerType,pokerValue)
end 
PokersConfig.checkIsJoker = function(pokerType,pokerValue)
	if not(pokerType and pokerValue) then 
		PokersConfig.eLog("checkIsJoker","扑克牌数据不正确","pokerType = ",pokerType,"pokerValue = ",pokerValue);
		return false,"";
	end

	local typeName = PokersConfig.getPokerTypeName(pokerType,pokerValue);
	if typeName == PokersConfig.pokerTypeNamesMap[5] or
		typeName == PokersConfig.pokerTypeNamesMap[6] then 
		return true,typeName;
	else 
		return false,typeName;
	end 
end

--设置扑克牌图片路径
PokersConfig.setPokerFilePath = function(filePath)
	PokersConfig._setFilePath("pokerFile",filePath);
end
PokersConfig.getPokerFilePath = function()
	local path = PokersConfig._getFilePath("pokerFile");
	if path then 
		return path;
	else 
		return poker_big_map;
	end 
end

--获取扑克牌图片的全路径
PokersConfig.formatPokerFileFullPath = function(fileName)
	if not fileName then 
		return;
	end 

	local filePath = PokersConfig.getPokerFilePath();
	if type(filePath) == "string" then 
		return filePath..fileName;
	elseif type(filePath) == "table" then 
		return filePath[fileName];
	end
end
-------------------------------------------------------------------------------------
PokersConfig.setHandCardViewConfig = function(handCardViewConfig)
	PokersConfig._setConfigMap("handCardViewConfig",handCardViewConfig);
end
PokersConfig.getHandCardViewConfig = function(seat)
	local handCardViewConfig = PokersConfig._getConfigMap("handCardViewConfig");

	handCardViewConfig = handCardViewConfig or PokersConfig.defaultHandCardViewConfig;
	return table.verify(handCardViewConfig[seat]);
end

PokersConfig.setOutCardViewConfig = function(outCardViewConfig)
	PokersConfig._setConfigMap("outCardViewConfig",outCardViewConfig);
end
PokersConfig.getOutCardViewConfig = function(seat)
	local outCardViewConfig = PokersConfig._getConfigMap("outCardViewConfig") or PokersConfig.defaultOutCardViewConfig;
	return table.verify(outCardViewConfig[seat]);
end
-------------------------------------------------------------------------------------
--设置扑克牌大不过上家的图片路径
PokersConfig.setPokerSmallerTipsFilePath = function(filePath)
	PokersConfig._setFilePath("pokerSmallerTips",filePath);
end
PokersConfig.getPokerSmallerTipsFilePath = function()
	return PokersConfig._getFilePath("pokerSmallerTips") or "games/common/pokers/smaller_tips.png";
end

--设置出牌不合法提示图片的路径
PokersConfig.setOutCardIllegalTipsFilePath = function(filePath)
	PokersConfig._setFilePath("outCardIllegalTips",filePath);
end
PokersConfig.getOutCardIllegalTipsFilePath = function()
	return PokersConfig._getFilePath("outCardIllegalTips") or "games/common/pokers/illegal_tips.png";
end
-------------------------------------------------------------------------------------
PokersConfig.eLog = function(funcName,...)
	Log.iWF("PokersConfig_error"," ",funcName," ",...);
end

PokersConfig.log = function(funcName,...)
	Log.iWF("PokersConfig"," ",funcName," ",...);
end
-------------------------------------------------------------------------------------
--存储配置表
--从该处获得的数据，如果存在的话一定为table
PokersConfig._setConfigMap = function(name,config)
	if not(name and config) then 
		return;
	end 

	PokersConfig.m_configMap = table.verify(PokersConfig.m_configMap);
	if type(config) == "table" then 
		PokersConfig.m_configMap[name] = config;
	end
end 
PokersConfig._getConfigMap = function(name)
	if not name then 
		return;
	end 
	PokersConfig.m_configMap = table.verify(PokersConfig.m_configMap);
	return PokersConfig.m_configMap[name];
end

--存储回调函数
--从中获取的为table
PokersConfig._setCallFunc = function(name,obj,func,...)
	if not(name and func) then 
		return;
	end 

	local config = {};
	config.obj = obj;
	config.func = func;
	config.arg = {...};

	PokersConfig.m_callFuncMap = table.verify(PokersConfig.m_callFuncMap);
	PokersConfig.m_callFuncMap[name] = config;
end 
PokersConfig._getCallFunc = function(name)
	if not name then 
		return {};
	end

	PokersConfig.m_callFuncMap = table.verify(PokersConfig.m_callFuncMap);
	return table.verify(PokersConfig.m_callFuncMap[name]);
end 

--存储图片路径
PokersConfig._setFilePath = function(name,path)
	if not(name and path and path ~= "") then 
		return;
	end 

	PokersConfig.m_filePathMap = table.verify(PokersConfig.m_filePathMap);
	PokersConfig.m_filePathMap[name] = path;
end 
PokersConfig._getFilePath = function(name)
	if not name then 
		return;
	end

	PokersConfig.m_filePathMap = table.verify(PokersConfig.m_filePathMap);
	return PokersConfig.m_filePathMap[name];
end 

--存储一些其他数据
PokersConfig._setInfoData = function(name,value)
	if not(name and value) then 
		return;
	end 

	PokersConfig.m_infoData = table.verify(PokersConfig.m_infoData);
	PokersConfig.m_infoData[name] = value;
end 
PokersConfig._getInfoData = function(name)
	if not name then 
		return;
	end

	PokersConfig.m_infoData = table.verify(PokersConfig.m_infoData);
	return PokersConfig.m_infoData[name];
end 