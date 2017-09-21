require("common/nativeEvent");
require("hall/agency/data/agencyDataInterface");

AgencyWebView = class(Node);

AgencyWebView.ctor = function(self)
end

AgencyWebView.dtor = function(self)
	NativeEvent.getInstance():DelView();
end

AgencyWebView.showLoginAgency = function(self,x, y, w, h, bx, by, bw, bh)
	local url = AgencyDataInterface.getInstance():getLoginUrl();
	return self:_create(url,x, y, w, h, bx, by, bw, bh);
end

AgencyWebView.showAgencyPaySuccess = function(self,x, y, w, h, bx, by, bw, bh)
	local url = AgencyDataInterface.getInstance():getPaySuccessUrl();
	return self:_create(url,x, y, w, h, bx, by, bw, bh);
end

AgencyWebView._create = function (self,url,x, y, w, h, bx, by, bw, bh)
	url = url or "";
	url = string.trim(url);
	if url == "" then 
		return false;
	end 

	local ssid = kUserInfoData:getSsid();
	local mid = kUserInfoData:getUserId();
	local nick = kUserInfoData:getNickname();
	local deviceid = kClientInfo:getDeviceId();
	url = url.."?ssid="..ssid.."&mid="..mid.."&nick="..nick.."&deviceid="..deviceid;

	local info = {};
	info.x = x or 0;
	info.y = y or 0;
	info.w = w;
	info.h = h;

	info.bx = bx or 0;
	info.by = by or 0;
	info.bw = bw;
	info.bh = bh;

	info.url = url;
	info.tip = GameString.get("ActivityLoading");
	info.mid = kUserInfoData:getUserId();
	info.money = kUserInfoData:getMoney();

	NativeEvent.getInstance():NewWebView(info);
	return true;
end

AgencyWebView.showWebView = function(self)
	NativeEvent.getInstance():ShowEmbedWebView();
end

AgencyWebView.hideWebView = function(self)
	NativeEvent.getInstance():HideEmbedWebView();
end

AgencyWebView.goBackWebView = function(self)
	return NativeEvent.getInstance():GoBackWebView();
end