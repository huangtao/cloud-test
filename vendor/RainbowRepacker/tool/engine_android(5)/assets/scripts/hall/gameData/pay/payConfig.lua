PayConfig = {};

--商品列表id
PayConfig.eGoodsListId = {
	MarketGold = 1; --商城银币商品信息
	MarketVip = 2; --商城VIP商品信息
	MarketProp = 3; --商城道具商品信息
	MarketHot = 4; --商城促销商品信息  (2.0没用了)
	MarketCrystal = 12; --商城金条商品信息

	Broken     = 5; --破产商品

	HallPlus = 6; --快捷支付大厅加号
	RoomPay = 7; --快捷支付房间内 （这个列表会根据gameid 和 level而变化）
	VipCharge = 8, --VIP支付

	FirstRecharge = 9; --首冲
	SecondePay = 10; --二次付费

	Degrade = 11; --快捷支付入场 降级、入场 （这个列表会根据gameid 和 level而变化）
	AgentCard =  999; --代理年卡
}

--枚举存储类型
PayConfig.eCacheType = {
	DictCache = 1; --需要保存到手机内, 下次启动先根据缓存加载数据
	MemoryCache = 2; --保存到内存中， 游戏中只需拉取一次
	NoCache = 3; --不需要进行缓存
}

--商品列表存储类型映射表
PayConfig.GoodsListCacheMap = {
	
	[PayConfig.eCacheType.DictCache] = {
		PayConfig.eGoodsListId.MarketGold,
		PayConfig.eGoodsListId.MarketVip,
		PayConfig.eGoodsListId.MarketProp,
		PayConfig.eGoodsListId.MarketHot,
		PayConfig.eGoodsListId.MarketCrystal,		
	},

	[PayConfig.eCacheType.MemoryCache] = {
		PayConfig.eGoodsListId.Broken,
		PayConfig.eGoodsListId.AgentCard;
	}
}

--枚举支付场景
PayConfig.ePayScene = {
	Market = 1;                --商城
	Broken = 2;				   --破产
	ChooseGoodsLayer = 3;	   --多个商品(如首冲)
	SingleGoodsLayer = 4,      --快捷购买(如大厅加号)
}

--商品列表支付场景映射表
PayConfig.paySceneGoodsListMap = {
	[PayConfig.ePayScene.Market] = {
		PayConfig.eGoodsListId.MarketHot,
		PayConfig.eGoodsListId.MarketProp,
		PayConfig.eGoodsListId.MarketVip,
		PayConfig.eGoodsListId.MarketGold,
		PayConfig.eGoodsListId.MarketCrystal,
	};

	[PayConfig.ePayScene.Broken] = {
		PayConfig.eGoodsListId.Broken;
	};

	[PayConfig.ePayScene.ChooseGoodsLayer] = {
		PayConfig.eGoodsListId.FirstRecharge,
		PayConfig.eGoodsListId.SecondePay,
	};

	[PayConfig.ePayScene.SingleGoodsLayer] = {
		PayConfig.eGoodsListId.HallPlus,
		PayConfig.eGoodsListId.Degrade,
		PayConfig.eGoodsListId.VipCharge,
		PayConfig.eGoodsListId.RoomPay,
	}
}

PayConfig.ALIPAY_NOTIFY_URL = "http://paycn.boyaa.com/pay_order_alipay_notify.php";--支付宝通知地址

--枚举支付渠道
PayConfig.ePayMode = {

	--本地定义
	LOCAL_CRYSTAL_PMODE = "-123456789"; --本地定义的金条购买支付方式 

	--短信统称
	SMS_PMODE = "0"; --短信支付(一个统称)	

	--移动
	MOBILE_PMODE               = "31";      --移动基地
	MMBILLING_WEAKONLINE_PMODE = "218"; 	--移动mm支付（弱联网）
	HUAFUBAOPAY_PMODE = "35"; 			--话付宝支付
	SIKAI_WEAK_MM_PMODE = "341";             	--斯凯弱网mm
	WORDS_FUBAO_PMODE = "349";              --话付宝
	WORDS_FUBAO_BARE_PMODE = "644";         --话付宝裸码
	MIGU_MUSIC_PMODE = "630";               --咪咕音乐支付

	--联通
	WO_PMODE = "109";                        --WO支付
	UNICOM_BARECARDBACK_PMODE    = "308";    --联通裸码备用支付
    UNICOM_FOURTHBAREBACK_PMODE  = "462";    --联通第四套裸码  
   

	--电信
	TELECOM_PMODE = "117";                --电信天翼支付
	EGAME_PMODE = "34"; 					--爱游戏支付
	EDONGMAN_PMODE = "282";               --电信爱动漫裸码

	--other
	ALIPAY_PMODE  = "244"; 				--支付宝极简版专业版
	ALIPAY_STANDARD_PMODE  = "265"; 		--支付宝极简版标准版
    WEIXIN_V3_PMODE = "431";            --微信支付3.0

	UNION_V2_PMODE = "198";                --银联支付2.0

	TENTPAY_PMODE = "33";                --财付通;

    --其他联运支付
	QI_HU_360_PMODE = "136";

	--IOS
	LIAN_DONG_WEB_PMODE = "36";          --联动WEB(移动短信)-->IOS
	ALIPAY_WEB_PMODE = "26";            --支付宝(WEB版)
	WEIXIN_IOS_V3_PMODE = "463";        --微信IOS支付3.0 (SDK)
	APPLE_PMODE     = "99";             --苹果支付
	ALIPAY_STANDARD_PMODE_IOS = "265";  --支付宝极简版标准版(SDK)
	ALIPAY_STANDARD_PMODE_IOS_2 = "620"; --支付宝极简版标准版(SDK2)
	UNION_V2_PMODE_IOS = "198";         --银联支付
	UNION_V2_PMODE_IOS_NEW = "728";     --新银联支付
}


local payChannelIcons_pin_map = require("qnFiles/qnPlist/hall/payChannelIcons_pin");
PayConfig.ePayModeIconMap = {
	{
		icon = payChannelIcons_pin_map["pmode_4.png"], --支付宝
		pmodeList = {
			PayConfig.ePayMode.ALIPAY_PMODE,
			PayConfig.ePayMode.ALIPAY_STANDARD_PMODE,
			PayConfig.ePayMode.ALIPAY_WEB_PMODE,
			PayConfig.ePayMode.ALIPAY_STANDARD_PMODE_IOS,
			PayConfig.ePayMode.ALIPAY_STANDARD_PMODE_IOS_2,
		},
	};

	{
		icon = payChannelIcons_pin_map["pmode_33.png"], --财付通
		pmodeList = {
			PayConfig.ePayMode.TENTPAY_PMODE,
		},
	};

	{
		icon = payChannelIcons_pin_map["pmode_99.png"], --苹果
		pmodeList = {
			PayConfig.ePayMode.APPLE_PMODE,
		},
	};

	{
		icon = payChannelIcons_pin_map["pmode_171.png"], --微信
		pmodeList = {
			PayConfig.ePayMode.WEIXIN_V3_PMODE,
			PayConfig.ePayMode.WEIXIN_IOS_V3_PMODE,
		},
	};

	{
		icon = payChannelIcons_pin_map["pmode_198.png"], --银联
		pmodeList = {
			PayConfig.ePayMode.UNION_V2_PMODE,
			PayConfig.ePayMode.UNION_V2_PMODE_IOS,
			PayConfig.ePayMode.UNION_V2_PMODE_IOS_NEW,
		},
	};

	{
		icon = payChannelIcons_pin_map["pmode_crystal.png"], --金条
		pmodeList = {
			PayConfig.ePayMode.LOCAL_CRYSTAL_PMODE,
		},
	};

    {
        icon = payChannelIcons_pin_map["pmode_136.png"], --360联运
		pmodeList = {
			PayConfig.ePayMode.QI_HU_360_PMODE,
		},
    }
}

