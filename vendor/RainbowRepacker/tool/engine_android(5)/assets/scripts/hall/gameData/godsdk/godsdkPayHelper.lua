require("hall/gameData/pay/payConfig");
require("hall/gameData/appData");

--WIKI -> http://paywiki.oa.com/doku.php?id=%E6%8E%A5%E5%85%A5%E6%96%87%E6%A1%A3:%E5%8A%A8%E6%80%81%E8%A3%B8%E7%A0%81%E6%94%AF%E4%BB%98:%E6%8E%A5%E5%85%A5api

GodSDKPayHelper = {};

GodSDKPayHelper.getPayParams = function(pmode, rechargeData, orderData)
	if GodSDKPayHelper.payParamsConfigTable and GodSDKPayHelper.payParamsConfigTable[pmode] then
		return GodSDKPayHelper.payParamsConfigTable[pmode](pmode, rechargeData, orderData);
	end
end

-------------------------------------------支付配置 函数-----------------------------------------------

--安智支付
GodSDKPayHelper.onGetAnzhiPayParam = function(pmode, rechargeData, orderData)
    local paramPay = {};
    paramPay.orderid = orderData.ORDER;
    paramPay.price = orderData.PAMOUNT;
    paramPay.desc = rechargeData.pname;
    paramPay.pmode = pmode;
    return paramPay;
end

-- 微信支付
GodSDKPayHelper.onGetWeiXinPayParam = function(pmode, rechargeData, orderData)
    local orderinfo = orderData.orderinfo;
    if table.isEmpty(orderinfo) then
        return {};
    end

    local paramPay = {};
    paramPay.partnerId = orderinfo.partnerid;
    paramPay.prepayId = orderinfo.prepayid;
    paramPay.nonceStr = orderinfo.noncestr;
    paramPay.timeStamp = orderinfo.timestamp;
    paramPay.packageValue = orderinfo.package;
    paramPay.sign = orderinfo.sign;
    paramPay.extData = orderinfo.ORDER; -- 透传订单号
    paramPay.pmode = pmode;

    return paramPay;
end

--  银联
GodSDKPayHelper.onGetUnionPayParam = function(pmode , rechargeData , orderData)
	local paramPay = {};
	paramPay.porder =  orderData.ORDER;		--订单号
	paramPay.merchantId = orderData.merchantId;
	paramPay.merchantOrderId = orderData.merchantOrderId or " ";
	paramPay.merchantOrderTime = orderData.merchantOrderTime or " ";
	paramPay.sign = orderData.sign or " ";
	paramPay.isCreditCard = 0; --0借记卡，1信用卡
	paramPay.payResultUrl = nil;
	paramPay.pmode = pmode;		--支付方式	
	return paramPay;
end

-- 沃商店支付pmode="109"
GodSDKPayHelper.onGetWoPayParam = function(pmode , rechargeData , orderData)
    if table.isEmpty(orderData.orderSundry) or table.isEmpty(orderData.orderinfo) then
        return;
    end

    local paramPay = {};
    paramPay.customCode = orderData.orderSundry.codeWord;
    paramPay.porder = orderData.orderinfo.ORDER;
	paramPay.pmode = pmode;

    Log.v("GodSDKPayHelper.onGetWoPayParam paramPay = ", paramPay);

    return paramPay;
end


--话付宝 pmode="349"
GodSDKPayHelper.onGetWordsPayParam = function(pmode , rechargeData , orderData)
    if table.isEmpty(orderData.orderSundry) or table.isEmpty(orderData.orderinfo) then
        return;
    end
    local paramPay = {};
    paramPay.merid = orderData.orderSundry.merid; --商户号
    paramPay.goodsid = orderData.orderSundry.codeWord;--rechargeData.goodId-- 商品号
    paramPay.goodsname = rechargeData.name --商品名称; 
    paramPay.orderid = orderData.orderinfo.ORDER;--订单号
    paramPay.orderdate = orderData.orderinfo.date;--时间
    paramPay.amount = orderData.orderinfo.PAMOUNT; --商品价格
    paramPay.goodsinfo = paramPay.amount .. GameString.get("RechargeMessageText_25") .. "=" .. paramPay.goodsname;--商品描述
    paramPay.appid = orderData.orderinfo.APPID;--应用ID
    paramPay.date = os.date("%Y%m%d", kAppData:getRightTimeWithServer() ); --server系统时间

    Log.v("GodSDKPayHelper.onGetWordsPayParam paramPay = ", paramPay);
    
    return paramPay;
end

--话付宝API支付 pmode="644"
GodSDKPayHelper.onGetWordsFuBaoBareParam = function(pmode, rechargeData, orderData)
    if table.isEmpty(orderData.orderSundry) or table.isEmpty(orderData.orderinfo) then
        return;
    end

    local paramPay = {};
    paramPay.paytype = orderData.orderinfo.PAYTYPE;   --裸码类型
    paramPay.orderid = orderData.orderinfo.ORDER;
    paramPay.pamount = orderData.orderinfo.PAMOUNT;

    paramPay.customize = false; --采用god的裸码弹框
    paramPay.display = true;
    paramPay.shield = false;
    paramPay.pname = rechargeData.name;
    paramPay.pmode = orderData.orderSundry.pmode;

    local strSmsData = orderData.orderinfo.SMS_RECEIVERS;
    local smsData = json.decode(orderData.orderinfo.SMS_RECEIVERS) or {};
    Log.v("onGetWordsFuBaoBareParam", "smsData = ", smsData);
    local data = {
        smsbody = {};
    };

    for k, v in pairs( table.verify(smsData) ) do
        if not table.isEmpty(v) then 
            if not table.isEmpty(v.address1) then
                table.insert(data.smsbody, v.address1);
            end

            if not table.isEmpty(v.address2) then
                table.insert(data.smsbody, v.address2);
            end           
        end
    end
    paramPay.receivers = data;

    Log.v("onGetWordsFuBaoBareParam", "afterFormat params = ", paramPay);

    return paramPay;
end

--@brief 咪咕音乐支付 630
GodSDKPayHelper.onGetMiguMusicPayParams = function(self, rechargeData, orderData)
    if table.isEmpty(orderData.orderSundry) or table.isEmpty(orderData.orderinfo) then
        return;
    end

    local paramPay = {};
    paramPay.paycode = orderData.orderSundry.codeWord;
    paramPay.pmode = orderData.orderSundry.pmode;
    paramPay.porder = orderData.orderinfo.ORDER;
    paramPay.payType = orderData.orderSundry.migupayType;

    return paramPay;
end

--联通第4套裸码支付备用 pmode="462"
GodSDKPayHelper.onGetUnicomFourthBareBackPmode = function(pmode, rechargeData, orderData)
    if table.isEmpty(orderData.orderSundry) or table.isEmpty(orderData.orderinfo) then
        return;
    end

    local paramPay = {};
    paramPay.orderid = orderData.orderinfo.ORDER;--订单号
    paramPay.customize = false; --是否自定义 true:采用业务自己定义的弹框， false：采用god里面的
    paramPay.pname = rechargeData.name --商品名称; 
    paramPay.pamount = rechargeData.pamount; --商品价格
    paramPay.content = orderData.orderSundry.content;--短信内容
    paramPay.address = orderData.orderSundry.address; -- 短信地址
    paramPay.pmode = pmode

    return paramPay;
end 

--短信支付裸码 pmode="36"
--包含 爱动漫(282)
GodSDKPayHelper.onGetMessageBareCodePayParam = function(pmode , rechargeData , orderData)
    if table.isEmpty(orderData.orderSundry) or table.isEmpty(orderData.orderinfo) then
        return;
    end
    local paramPay = {};
    paramPay.orderid = orderData.orderinfo.ORDER;--订单号
    paramPay.customize = false; --是否显示裸码界面 true:采用业务自己定义的弹框， false：采用god里面的
    paramPay.pname = rechargeData.name --商品名称; 
    paramPay.pamount = rechargeData.pamount; --商品价格
    paramPay.content = orderData.orderSundry.content;--短信内容
    paramPay.address = orderData.orderSundry.address; -- 短信地址
    paramPay.pmode = pmode
    Log.v("GodSDKPayHelper.onGetMessageBareCodePayParam paramPay = ", paramPay);
    
    return paramPay;
end

--电信爱游戏纯短代 pmode="34"
GodSDKPayHelper.onGetEgamePayParam = function(pmode , rechargeData , orderData)
    if table.isEmpty(orderData.orderSundry) or table.isEmpty(orderData.orderinfo) then
        return;
    end
    local paramPay = {};
    paramPay.orderid = orderData.orderinfo.ORDER;--订单号
    paramPay.desc = ""
    paramPay.price = rechargeData.pamount; --商品价格
    paramPay.pmode = pmode
    Log.v("GodSDKPayHelper.onGetMessageBareCodePayParam paramPay = ", paramPay);
    
    return paramPay;
end


--移动基地联运 pmode="31"
GodSDKPayHelper.onGetMobilePayParam = function(self, rechargeData, orderData)
    if table.isEmpty(orderData.orderSundry) or table.isEmpty(orderData.orderinfo) then
        return;
    end

    local paramPay = {};
    paramPay.consumeCode = orderData.orderSundry.codeWord;
    paramPay.cpparam = orderData.orderinfo.ORDER;
    
    return paramPay;
end

-- 移动mm弱联网 pmode = "218"
GodSDKPayHelper.onGetMMbillingWeakOnlinePayParam = function(self, rechargeData, orderData)
    if not table.isEmpty(orderData.orderinfo) then
        local paramPay = {};
        paramPay.porder = orderData.orderinfo.ORDER;
        paramPay.paycode = orderData.orderSundry.codeWord;
        return paramPay;
    end
    return nil;
end

--支付宝极简
GodSDKPayHelper.onGetAlixJiJianPayParam = function(self , rechargeData , orderData)
    if orderData.PAMOUNT and rechargeData.pname and orderData.PAMOUNT then
    	local paramPay = {};
    	paramPay.porder =  orderData.ORDER;		--订单号
    	paramPay.pname = rechargeData.pname;	--商品名称
    	paramPay.pamount = orderData.PAMOUNT;   --价格
    	paramPay.udesc = orderData.PAMOUNT .. GameString.get("RechargeMessageText_25") .. "=" .. orderData.PAMOUNT;--商品描述
    	paramPay.notify_url = orderData.notify_url or PayConfig.ALIPAY_NOTIFY_URL;--地址
    	paramPay.PARTNER =  orderData.orderSundry.PARTNER;--合作商户ID(2088511711438483)
    	paramPay.SELLER = orderData.orderSundry.SELLER;   --账户ID(2088511711438483)
    	paramPay.RSA_PRIVATE = "MIICeAIBADANBgkqhkiG9w0BAQEFAASCAmIwggJeAgEAAoGBALf5yOge64u9/6fFBgPrKSL7czPo4iliuVptRH29As88/d9zOpo0yYdQsQwYsWGDpuE3ajEro98jcAIw5WO7nu7pbjd/mg1s4cYHsG/zlHK3OWNMMTycPar3yJGsmfQNV37DvcXdGsZzKXF+2qmkPjiumsD5Y8bNB8BNfHCmwQ9LAgMBAAECgYEAoBePWVYWuFqUjqRnMJ/BAzz2KbS8oTDUhDjTQeto93dmn7xAwZGv0L1J43HVYTrTy+WR1cnY5sKKpI1x/5Bzoo4c5f5KR+4UsZeNO5U3zQehDeCTAL5GNQgE7FXsZ1HS/Q4vgpQ5HPHLDa7wY1T0dYq8IiSZGerRCgo0c9DJBykCQQDn5xK/AmZH87Z3WO8eL77EaWmqJPjYs5xE0YXTviHG8W6eYOTderxSqh3goCbOGH9MveWXULZsGE7HC+Qf/r33AkEAyxfKU4A3E334BdBTuyrP+JW1+jBZkwlV5/vxLvd+oIIkV0b/ERIRJMHkG7ZRxno2e9nGCzryKNG5CZT6A+J0TQJAEOOmXNzq4BCi2FxUxekKRrm6pVad/QJPvj9YNMyjHx8URFqgMHUw5ABZvrNLQDVOiCNIZlXNg1/d1OdLzPy7jwJBAITj7UUUGXXMsHUFazSGgA0V0TyDVKlsq2Sfq6Ji2d2nKqZdU1tVKhiWMm+brgikQXBrADaq/HePO3e0np/aFuUCQQCgozkGNtsqhA9RWpRCQPxIPOfzukw+I2bHwRBPR2thi1TkPqoBJEEbchsF8p9OOPPmLTwZ4467SjD5gR07XbN4";
    	Log.i("GodSDKPayHelper.onGetAlixJiJianPayParam",paramPay)
    	return paramPay;
    end
    return nil;
end

--支付宝极简
GodSDKPayHelper.onGetAlixJiJianStandardPayParam = function(self , rechargeData , orderData)
    local orderinfo = table.verify(orderData.orderinfo);
    if orderinfo.ORDER and orderinfo.PAMOUNT and rechargeData.name then
        local paramPay = {};
        paramPay.porder =  orderinfo.ORDER;     --订单号
        paramPay.pname = rechargeData.name;    --商品名称
        paramPay.pamount = orderinfo.PAMOUNT;   --价格
        paramPay.udesc = paramPay.pamount .. GameString.get("RechargeMessageText_25") .. "=" .. paramPay.pname;--商品描述
        paramPay.notify_url = orderinfo.NOTIFY_URL or PayConfig.ALIPAY_NOTIFY_URL;--地址
        paramPay.PARTNER =  orderData.orderSundry.PARTNER;--合作商户ID(2088511711438483)
        paramPay.SELLER = orderData.orderSundry.SELLER;   --账户ID(2088511711438483)
        paramPay.RSA_PRIVATE = "MIICeAIBADANBgkqhkiG9w0BAQEFAASCAmIwggJeAgEAAoGBALf5yOge64u9/6fFBgPrKSL7czPo4iliuVptRH29As88/d9zOpo0yYdQsQwYsWGDpuE3ajEro98jcAIw5WO7nu7pbjd/mg1s4cYHsG/zlHK3OWNMMTycPar3yJGsmfQNV37DvcXdGsZzKXF+2qmkPjiumsD5Y8bNB8BNfHCmwQ9LAgMBAAECgYEAoBePWVYWuFqUjqRnMJ/BAzz2KbS8oTDUhDjTQeto93dmn7xAwZGv0L1J43HVYTrTy+WR1cnY5sKKpI1x/5Bzoo4c5f5KR+4UsZeNO5U3zQehDeCTAL5GNQgE7FXsZ1HS/Q4vgpQ5HPHLDa7wY1T0dYq8IiSZGerRCgo0c9DJBykCQQDn5xK/AmZH87Z3WO8eL77EaWmqJPjYs5xE0YXTviHG8W6eYOTderxSqh3goCbOGH9MveWXULZsGE7HC+Qf/r33AkEAyxfKU4A3E334BdBTuyrP+JW1+jBZkwlV5/vxLvd+oIIkV0b/ERIRJMHkG7ZRxno2e9nGCzryKNG5CZT6A+J0TQJAEOOmXNzq4BCi2FxUxekKRrm6pVad/QJPvj9YNMyjHx8URFqgMHUw5ABZvrNLQDVOiCNIZlXNg1/d1OdLzPy7jwJBAITj7UUUGXXMsHUFazSGgA0V0TyDVKlsq2Sfq6Ji2d2nKqZdU1tVKhiWMm+brgikQXBrADaq/HePO3e0np/aFuUCQQCgozkGNtsqhA9RWpRCQPxIPOfzukw+I2bHwRBPR2thi1TkPqoBJEEbchsF8p9OOPPmLTwZ4467SjD5gR07XbN4";
        Log.i("GodSDKPayHelper.onGetAlixJiJianStandardPayParam",paramPay)
        return paramPay;
    end
    return nil;
end

GodSDKPayHelper.onGetUnionV2PayParam = function(self, rechargeData, orderData)
    if not table.isEmpty(orderData.orderinfo) then
        local paramPay = {};
        paramPay.tn = orderData.orderinfo.tn;
        
        Log.i("GodSDKPayHelper.onGetUnionV2PayParam", " param = ", paramPay);
        return paramPay;
    end
    return nil;
end

GodSDKPayHelper.onGetTentPayParam = function(self, rechargeData, orderData)
    if not table.isEmpty(orderData.orderinfo) then
        local paramPay = {};
        paramPay.token_id = orderData.orderinfo.TOKENID;
        paramPay.bargainor_id = orderData.orderSundry.bargainor_id; --"1214840101"
        return paramPay;
    end
    return nil;
end

--------------------------------------------支付配置 表------------------------------------------------------
GodSDKPayHelper.payParamsConfigTable = {
    [PayConfig.ePayMode.MOBILE_PMODE]   = GodSDKPayHelper.onGetMobilePayParam;
    [PayConfig.ePayMode.MMBILLING_WEAKONLINE_PMODE] = GodSDKPayHelper.onGetMMbillingWeakOnlinePayParam;
    [PayConfig.ePayMode.WO_PMODE]       = GodSDKPayHelper.onGetWoPayParam;
    [PayConfig.ePayMode.WORDS_FUBAO_PMODE]       = GodSDKPayHelper.onGetWordsPayParam; --话付宝综合支付
    [PayConfig.ePayMode.WORDS_FUBAO_BARE_PMODE]  = GodSDKPayHelper.onGetWordsFuBaoBareParam; --话付宝裸码
    [PayConfig.ePayMode.MIGU_MUSIC_PMODE] = GodSDKPayHelper.onGetMiguMusicPayParams;

    [PayConfig.ePayMode.UNICOM_FOURTHBAREBACK_PMODE]     = GodSDKPayHelper.onGetUnicomFourthBareBackPmode; --联通第四套裸码
    [PayConfig.ePayMode.EDONGMAN_PMODE]     = GodSDKPayHelper.onGetMessageBareCodePayParam; --爱动漫裸码

    [PayConfig.ePayMode.EGAME_PMODE]     = GodSDKPayHelper.onGetEgamePayParam; --电信爱游戏


    [PayConfig.ePayMode.ALIPAY_PMODE] = GodSDKPayHelper.onGetAlixJiJianPayParam;
    [PayConfig.ePayMode.ALIPAY_STANDARD_PMODE] = GodSDKPayHelper.onGetAlixJiJianStandardPayParam;

    [PayConfig.ePayMode.UNION_V2_PMODE]  = GodSDKPayHelper.onGetUnionV2PayParam;
    [PayConfig.ePayMode.WEIXIN_V3_PMODE]  = GodSDKPayHelper.onGetWeiXinPayParam;
    [PayConfig.ePayMode.TENTPAY_PMODE] = GodSDKPayHelper.onGetTentPayParam;
};