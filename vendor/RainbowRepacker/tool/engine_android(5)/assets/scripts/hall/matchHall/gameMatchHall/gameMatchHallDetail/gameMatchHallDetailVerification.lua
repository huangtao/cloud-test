require("common/popupWindow");
local match_hall_detail_verification_layout = require(ViewPath .. "hall/matchHall/widget/match_hall_detail_verification_layout");

-- 比赛邀请码
local GameMatchHallDetailVerification = class(PopupWindow, false);

local h_index = 0;
local getIndex = function(self)
    h_index = h_index + 1;
    return h_index;
end

GameMatchHallDetailVerification.s_controls = 
{
    content = getIndex(),
    closeBtn = getIndex(),
    editor = getIndex(),
    info = getIndex(),
    confirmBtn = getIndex(),
};

GameMatchHallDetailVerification.Delegate = {
    onDetailVerificationConfirmCallback = "onDetailVerificationConfirmCallback";
}


GameMatchHallDetailVerification.s_cmds = 
{

};


GameMatchHallDetailVerification.ctor = function(self)
    super(self, match_hall_detail_verification_layout);
   
    self:setFillParent(true, true);
    self:setAlign(kAlignCenter);
    self:setEventTouch(self, self.onEmptyFunc)
    self:setEventDrag(self, self.onEmptyFunc);
    self:_initView();
end

GameMatchHallDetailVerification.dtor = function(self)
end

GameMatchHallDetailVerification.isShowing = function(self)
    return self.m_isShowing;
end

GameMatchHallDetailVerification.show = function(self, data)
    PopupWindow.show(self, PopupWindowStyle.NORMAL);

    self.m_isShowing = true;

    self:_resetView();
    self:_initData(data);
    self:_showData();
end

GameMatchHallDetailVerification.hidden = function(self)
    if self.m_isShowing then
        self.m_isShowing = false;
        PopupWindow.hidden(self, PopupWindowStyle.NORMAL);
    end
end

GameMatchHallDetailVerification.onEmptyFunc = function(self)
end

GameMatchHallDetailVerification.onCloseBtnClick = function(self)
    self:_closeView();
end

GameMatchHallDetailVerification.onConfirmBtnClick = function(self)

    if not self:_checkEditorWidthCode() then
        self:_resetEditor();
        Toast.getInstance():showText("请输入正确邀请码", 50, 30, kAliginCenter, "", 24, 255, 255, 255); 
        return;
    end
    
    self:_closeView();

    self:execDelegate(GameMatchHallDetailVerification.Delegate.onDetailVerificationConfirmCallback);
end

GameMatchHallDetailVerification.onEditorChange = function(self)
    if not self:_checkEditorLawful() then
        self:_resetEditor();
        Toast.getInstance():showText("请输入正确邀请码", 50, 30, kAliginCenter, "", 24, 255, 255, 255); 
    end
end

GameMatchHallDetailVerification._closeView = function(self)
    EventDispatcher.getInstance():dispatch(kClosePopupWindows);
end

GameMatchHallDetailVerification._resetView = function(self)
    self.m_info:setText("");
    self.m_info:gotoTop();
    self:_resetEditor();
end

GameMatchHallDetailVerification._initData = function(self, data)
	self.m_data = data;
end

GameMatchHallDetailVerification._showData = function(self)
    local data = self.m_data;

    self.m_info:setText(data.matchentryinfo);
    self.m_info:gotoTop();
end

GameMatchHallDetailVerification._initView = function(self)
    self.m_content = self:findViewById(self.s_controls.content);
    self.m_info = self:findViewById(self.s_controls.info);
    self.m_editor = self:findViewById(self.s_controls.editor);

    self:_resetEditor();
end

GameMatchHallDetailVerification._checkEditorWidthCode = function(self)
    local data = self.m_data;
    local code = string.lower(data.matchentrycode);
    local text = string.trim(self.m_editor:getText());
    text = string.lower(text);
    return string.equal(text, code);
end

GameMatchHallDetailVerification._checkEditorLawful = function(self)
    local text = string.trim(self.m_editor:getText());
    local result = string.find(text, "[^%a%d]");
    return not result;
end

GameMatchHallDetailVerification._resetEditor = function(self)
    self.m_editor:setText("");
    self.m_editor:setHintText("输入邀请码，开启比赛", 215, 171, 127);
end

--------------------------------------------------------------------------------
GameMatchHallDetailVerification.s_controlConfig =
{   
    [GameMatchHallDetailVerification.s_controls.content] = {"content"};
    [GameMatchHallDetailVerification.s_controls.closeBtn] = {"content", "closeBtn"};
    [GameMatchHallDetailVerification.s_controls.editor] = {"content", "editorBg", "editor"};
    [GameMatchHallDetailVerification.s_controls.info] = {"content", "infoBg", "info"};
    [GameMatchHallDetailVerification.s_controls.confirmBtn] = {"content", "confirmBtn"};
};

GameMatchHallDetailVerification.s_controlFuncMap =
{
    [GameMatchHallDetailVerification.s_controls.closeBtn] = GameMatchHallDetailVerification.onCloseBtnClick;
    [GameMatchHallDetailVerification.s_controls.confirmBtn] = GameMatchHallDetailVerification.onConfirmBtnClick;
    [GameMatchHallDetailVerification.s_controls.editor] = GameMatchHallDetailVerification.onEditorChange;
};

GameMatchHallDetailVerification.s_cmdConfig =
{
};

return GameMatchHallDetailVerification;