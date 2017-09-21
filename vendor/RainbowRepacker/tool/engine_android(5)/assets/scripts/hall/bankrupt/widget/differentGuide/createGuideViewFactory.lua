local CreateGuideViewFactory = class();
CreateGuideViewFactory.getView = function(self,p_keyString,p_data)
    local wnd = nil;
    if p_keyString == "safeBox" then
       local _class = require("hall/bankrupt/widget/differentGuide/safeBoxGuide");
       wnd = new(_class,p_data);
    elseif p_keyString == "toShare" then 
       local _class = require("hall/bankrupt/widget/differentGuide/shareGuide");
       wnd = new(_class,p_data);
    elseif p_keyString == "getMoney" then 
       local _class = require("hall/bankrupt/widget/differentGuide/countDownOverGuide");
       wnd = new(_class,p_data);
    elseif p_keyString == "toMatch" then 
       local _class = require("hall/bankrupt/widget/differentGuide/matchGuide");
       wnd = new(_class,p_data);
    elseif p_keyString == "toCutCD" then 
       local _class = require("hall/bankrupt/widget/differentGuide/cutCDGuide");
       wnd = new(_class,p_data); 
    else
        Log.v("CreateGuideViewFactory","CreateGuideViewFactory.getView");
    end
    return wnd;
end
return CreateGuideViewFactory;