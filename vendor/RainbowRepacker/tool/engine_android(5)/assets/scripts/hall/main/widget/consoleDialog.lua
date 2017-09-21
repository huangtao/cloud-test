local debugConsoleDialog = require("view/kScreen_1280_800/hall/main/debugConsoleDialog")

local ConsoleDialog = class(CommonGameLayer, false)

local h_index = 0
local getIndex = function(self)
    h_index = h_index + 1
    return h_index
end

ConsoleDialog.s_controls = 
{
    title = getIndex(),
    closeBtn = getIndex(),
    btn = getIndex(),
    btnText = getIndex(),
    contentView = getIndex(),
    editText = getIndex(),
    textView = getIndex(),
}

ConsoleDialog.show = function()
    delete(ConsoleDialog.s_instance)
    ConsoleDialog.s_instance = new(ConsoleDialog)
    ConsoleDialog.s_instance:addToRoot()
    return ConsoleDialog.s_instance
end

ConsoleDialog.hide = function()
    delete(ConsoleDialog.s_instance)
    ConsoleDialog.s_instance = nil
end

ConsoleDialog.ctor = function(self)
    super(self, debugConsoleDialog)
    self:setSize(self.m_root:getSize())
    self:setFillParent(true, true)
    self:setEventDrag(self, self.onEventDragFunc)
    self:setEventTouch(self, self.onEventTouchFunc)
    self.m_ctrl = ConsoleDialog.s_controls

    IPopDialogManager.getInstance():addPopDialog(self, 99, self.onBack, self)
    ToolKit.setIsShieldSensitiveWord(false)
end

ConsoleDialog.dtor = function(self)
    IPopDialogManager.getInstance():removePopDialog(self)
    ToolKit.setIsShieldSensitiveWord(true)
end

ConsoleDialog.onBack = function()
    ConsoleDialog.hide()
end

ConsoleDialog.onCloseClick = function(self)
    ConsoleDialog.hide()
end

ConsoleDialog.onBtnClick = function(self)
    local text = self:findViewById(ConsoleDialog.s_controls.editText):getText()
    local ConsoleUtility = require("util/consoleUtility")
    local str = ConsoleUtility.printExpr(text)
    self:findViewById(ConsoleDialog.s_controls.editText):setText("")
    self:findViewById(ConsoleDialog.s_controls.textView):setText(str)
end

ConsoleDialog.onEventTouchFunc = function(self)
    
end

ConsoleDialog.onEventDragFunc = function(self)
    
end

ConsoleDialog.s_controlConfig = 
{   
    [ConsoleDialog.s_controls.title] = {"contentView", "titleBg", "title"},
    [ConsoleDialog.s_controls.closeBtn] = {"contentView", "closeBtn"},
    [ConsoleDialog.s_controls.btn] = {"contentView", "btn"},
    [ConsoleDialog.s_controls.btnText] = {"contentView", "btn", "text"},
    [ConsoleDialog.s_controls.editText] = {"contentView", "editTextBg", "editText"},
    [ConsoleDialog.s_controls.textView] = {"contentView", "textViewBg", "textView"},
}

ConsoleDialog.s_controlFuncMap =
{
    [ConsoleDialog.s_controls.closeBtn] = ConsoleDialog.onCloseClick,
    [ConsoleDialog.s_controls.btn] = ConsoleDialog.onBtnClick,
}

return ConsoleDialog