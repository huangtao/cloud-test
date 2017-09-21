local announcementWithHtmlLayout = require(ViewPath .. "hall/announcement/announcementWithHtmlLayout");
require("hall/common/commonJumpLogic")
require("common/IBaseDialog")

--房间内用户的头像控制
local AnnoucementHtmlPop = class(IBaseDialog,false);
AnnoucementHtmlPop.s_controls = 
{ 
   closeBtn = 1;
   bg = 2;
   webArea = 3;
   titleText = 4;
   contentView = 5;
};

AnnoucementHtmlPop.ctor = function(self, data,isNeedWait) 
    self.m_isNeedWait = isNeedWait or true;
    super(self,announcementWithHtmlLayout, "AnnoucementHtmlPop", 998);
    self:setSize(self.m_root:getSize());
    self:setFillParent(true, true);
    self.m_ctrl = AnnoucementHtmlPop.s_controls;
    self.m_closeBtn = self:findViewById(self.m_ctrl.closeBtn);
    self.m_webArea = self:findViewById(self.m_ctrl.webArea);

    self.m_titleText = self:findViewById(self.m_ctrl.titleText);

    self.m_bg = self:findViewById(self.m_ctrl.bg);
    self.m_bg:setEventDrag(self, self.onBgDrag);
    self.m_data = data;
    self:setLevel(100);
    self.m_mebOkFunction = function() end;

    if self.m_isNeedWait then
        self:loadWeb(data);
    end
end 

AnnoucementHtmlPop.setWebOkFunc = function(self,func)
    self.m_mebOkFunction = func;
end

AnnoucementHtmlPop.onShow = function(self)
	-- body
    self:show(self.m_data);
end

AnnoucementHtmlPop.show = function(self,data)
	-- body
    if not self.m_isNeedWait then
        self:loadWeb(data);
    end
	self:setVisible(true);
    NativeEvent.getInstance():ShowEmbedWebView();
end

AnnoucementHtmlPop.loadWeb = function(self,data)
    --此处加载网页
    local w, h, x, y = self:getWebViewSize();
    local bx, by, bw, bh = 0,0,0,0;

    -- local url = self:getPostDate(nil, width, height,"activities","");
    local  url = data.content or "";

    self.m_titleText:setText(string.subUtfStrByCn(data.title or "", 1, 14, ""));

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

    info.isNeedLoading = 1;
    if self.m_isNeedWait then
        info.isNeedLoading = 0; --0:表示不要，1表示要
    end
    
    NativeEvent.getInstance():NewWebView(info);

    if self.m_isNeedWait then
        NativeEvent.getInstance():HideEmbedWebView();
    end
    
end

AnnoucementHtmlPop.getWebViewSize = function(self)
	-- body
	local w,h = self.m_webArea:getSize();
	local x,y = self.m_webArea:getAbsolutePos();
	return w*System.getLayoutScale(), h*System.getLayoutScale(), x*System.getLayoutScale(), y*System.getLayoutScale();
end

AnnoucementHtmlPop.setOnCloseCallBack = function(self,obj,callback)
	-- body
	self.m_obj = obj;
    self.m_callback = callback;
end

AnnoucementHtmlPop.setOnExecuteJsCallBack = function(self,obj,callback)
    self.m_executeObj = obj;
    self.m_executeCallBack = callback;
end

AnnoucementHtmlPop.dtor = function(self)
    --EventDispatcher.getInstance():unregister(AnnoucementHtmlPopDataManager.getInstance():getNotifyId(), self, self.onChange);
    self:removeAllChildren();
	NativeEvent.getInstance():DelView();
end 

AnnoucementHtmlPop.onClose = function(self)
	if self.m_obj then
		if self.m_callback then
			self.m_callback(self.m_obj);
			self.m_callback = nil;
		end 
		self.m_obj = nil;
	end 
	NativeEvent.getInstance():DelView();
    self:setVisible(false);
    if self.m_data.msgType ~= MessageConstants.eMsgType.ANNOUNCE then
        MessageDataInterface.getInstance():closeMsg(self.m_data.id);
    end
end

AnnoucementHtmlPop.release = function()
    -- body
    if AnnoucementHtmlPop.s_instance then 
        AnnoucementHtmlPop.s_instance:setVisible(false);
        delete(AnnoucementHtmlPop.s_instance);
        AnnoucementHtmlPop.s_instance = nil;
    end
end

AnnoucementHtmlPop.onBgTouch = function(self )
    self:onClose()
end

AnnoucementHtmlPop.onBgDrag = function(self )
    
end

AnnoucementHtmlPop.onContentViewTouch = function (self)
    
end

AnnoucementHtmlPop.onWebviewCall = function(self, status, jsonTable, jsonStr)
	if table.isEmpty(jsonTable) then return; end
	if status and jsonTable then
		local jsonData = json.decode(jsonStr);
		local cmd = number.valueOf(jsonData.cmd);
        self:onClose();
        local isNeedBackToHall = CommonJumpLogic.getInstance():executeJsCall(jsonData);
        if isNeedBackToHall then
            if self.m_executeObj and self.m_executeCallBack then
                self.m_executeCallBack(self.m_executeObj);
                self.m_executeObj = nil;
                self.m_executeCallBack = nil;
            end
        end
	end
end

AnnoucementHtmlPop.onWebState = function(self, status, jsonTable)

    if self.isFirstWebFinished then
        return;
    end 
    self.isFirstWebFinished = true;
    
    if status and not table.isEmpty(jsonTable) then

        local __state =  GetNumFromJsonTable(jsonTable, "state");
        Log.v("___loading_web","state"..__state);
        if __state == 1 then
            if self.m_mebOkFunction then
                self.m_mebOkFunction();
                self.m_mebOkFunction = nil;
            end
        else
            delete(self);
        end 
    end
end

AnnoucementHtmlPop.s_controlConfig =
{   
    [AnnoucementHtmlPop.s_controls.closeBtn] = {"contentView","closeBtn"};
    [AnnoucementHtmlPop.s_controls.bg] = {"shiled"};
    [AnnoucementHtmlPop.s_controls.webArea] = {"contentView","centerView","webArea"};
    [AnnoucementHtmlPop.s_controls.titleText] = {"contentView","titleBg","title"};
    [AnnoucementHtmlPop.s_controls.contentView] = {"contentView"};
};

AnnoucementHtmlPop.s_controlFuncMap =
{
    [AnnoucementHtmlPop.s_controls.closeBtn] = AnnoucementHtmlPop.onClose;
    [AnnoucementHtmlPop.s_controls.bg] = AnnoucementHtmlPop.onBgTouch;
    [AnnoucementHtmlPop.s_controls.contentView] = AnnoucementHtmlPop.onContentViewTouch;
};

AnnoucementHtmlPop.s_nativeEventFuncMap = {

	["OnWebViewCall"] = AnnoucementHtmlPop.onWebviewCall;
    ["onWebState"] = AnnoucementHtmlPop.onWebState;
};

return AnnoucementHtmlPop;