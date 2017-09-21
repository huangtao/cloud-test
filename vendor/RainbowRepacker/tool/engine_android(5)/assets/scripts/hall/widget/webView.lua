require("util/log")

local WebView = class(Node);

WebView.ctor = function(self)
end

WebView.dtor = function(self)
    NativeEvent.getInstance():DelView();
end

WebView.create = function(self, url, x, y, w, h, bx, by, bw, bh)
    local info = {};
    info.x = x or 0;
    info.y = y or 0;
    info.w = w or 0;
    info.h = h or 0;

    info.bx = bx or 0;
    info.by = by or 0;
    info.bw = bw or 0;
    info.bh = bh or 0;

    info.url = url;
    info.tip = GameString.get("ActivityLoading");
    info.mid = kUserInfoData:getUserId();
    info.money = kUserInfoData:getMoney();

    Log.v("WebView.create = ", info);
    NativeEvent.getInstance():NewWebView(info);
end

WebView.goBackWebView = function(self)
    return NativeEvent.getInstance():GoBackWebView();
end

return WebView;