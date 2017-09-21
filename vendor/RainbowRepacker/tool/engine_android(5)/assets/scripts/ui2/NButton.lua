--
-- @@LIB_NAME@@, Version: @@Version@@
--
-- This file is a part of @@LIB_NAME@@.
--
-- Author:
-- Xiaofeng Yang     2015
--
--

---
--
-- @module NButton

require("core/object")
require("core/res")
require("core/drawing")
require("core/constants")

local OO = require 'ui2.util.oo'
local Enum = require 'ui2.util.enum'
local Misc = require 'ui2.util.misc'
local NNode = require 'ui2.NNode'
local createDrawingImage = function (pathOrConfig)
    if type(pathOrConfig) == 'string' then
        local res = new(ResImage, pathOrConfig)
        local image = new(DrawingImage, res)
        return image
    elseif type(pathOrConfig) == 'table' then
        local config = pathOrConfig
        local res = new(ResImage,
            config.file,
            config.fmt,
            config.filter)
        local image = new(DrawingImage, res,
            config.leftWidth,
            config.rightWidth,
            config.topWidth,
            config.bottomWidth)
        return image
    else
        error('type error')
    end
end
local setResImageFile = function (obj, pathOrConfig)
    if type(pathOrConfig) == 'string' then
        obj:setFile(pathOrConfig)
    elseif type(pathOrConfig) == 'table' then
        local config = pathOrConfig
        obj:setFile(
            config.file,
            config.fmt,
            config.filter)
-- TODO the following fields are ignored
--            config.leftWidth,
--            config.rightWidth,
--            config.topWidth,
--            config.bottomWidth)
    else
        error('type error')
    end
end

--animation = {
--    play = function () end,
--    interrupt = function () end
--}

local ButtonState = Enum {
    Normal = {},
    Pushing = {},
    Down = {},
    Popping = {}
}


-- defaults

local defaultNormalImageFile = 'ui2/nbutton/normal.png'


local M

M = OO.defineClass {
    extend = NNode,

    autoConstructSuper = true,

    __private__ = {

        isShouldHandleEvent = function (self)
            if __private__._manuallySetAllowFingerActions then
                -- 如果手动允许，那么可以处理也可以不处理。
                return __private__._isAllowFingerActions
            else
                -- 如果手动禁止，那么将会一直禁止。
                return false
            end
        end,

        setPlayingAnimation = function (self, value)
            __private__._isPlayingAnimation = value

            -- print_string('updatePlayingAnimation to ' .. tostring(value) .. ' stacktrace: ' .. debug.traceback())
        end,
    },

    __protected__ = {
        playAnimation = function (self, animation, invokeOnStop)

--        __private__._isPlayingAnimation = false
--        __private__._currentPlayingAnimation = {}

            __protected__.interruptAnimation (self)


            if animation == nil then
                if invokeOnStop then
                    invokeOnStop()
                end

                return
            end


            if __private__._isPlayingAnimation then
                error('illegal state: trying to play multiple animations at the same time')
            end

            -- __private__._isPlayingAnimation = true
            __private__.setPlayingAnimation(self, true)

            __private__._currentPlayingAnimation.play = animation.play
            __private__._currentPlayingAnimation.interrupt = animation.interrupt
            __private__._currentPlayingAnimation.invokeOnStop = invokeOnStop or function () end

            __private__._currentPlayingAnimation.play()
        end,

        interruptAnimation = function (self, nocleanup)
            if __private__._isPlayingAnimation then
                __private__._currentPlayingAnimation.interrupt()
                -- __private__._isPlayingAnimation = false
                __private__.setPlayingAnimation(self, false)

--                if not nocleanup then
--                    __private__._currentPlayingAnimation.invokeOnStop()
--                end
            end
        end,

        updatePicture = function (self)
            -- can only be called by visible/enabled changed

            if __private__._enabled then
                __private__._downImage:setVisible(false)
                __private__._normalImage:setVisible(true)

                if __private__._disabledImage then
                    __private__._disabledImage:setVisible(false)
                end

                if __private__._disabledStyle == M.DisabledStyle.ChangeColor then
                    __private__._normalImage:setColor(255, 255, 255)
                end

            else
                if __private__._disabledStyle == M.DisabledStyle.ChangeImage then
                    __private__._downImage:setVisible(false)
                    __private__._normalImage:setVisible(false)

                    if __private__._disabledImage then
                        local res = new(ResImage, __private__._disabledImageFile)
                        __private__._disabledImage = new(DrawingImage, res)

                        __private__._disabledImage:setAlign(kAlignCenter)

                        self:addChild(__private__._disabledImage)
                    else
                        __private__._disabledImage:setVisible(true)
                    end
                else
                    -- change color
                    __private__._downImage:setVisible(false)

                    __private__._normalImage:setVisible(true)

                    __private__._normalImage:setColor(128,128,128)
                end
            end

            super.setVisible(self, __private__._visible)

        end,

    },

    -- config.x default 0
    -- config.y default 0
    -- config.width default normalPictureSize or 100
    -- config.height default normalPictureSize or 100
    -- config.visible default true
    -- config.enabled default true
    -- config.normalImageFile default 'images/ui2/nbutton/normal.png'
    --                        string or a table with fields for resimage: file, fmt, filter, leftWidth, rightWidth, topWidth, bottomWidth
    -- config.downImageFile default: if config.normalImageFile is default then 'images/ui2/nbutton/down.png' else setcolor
    -- config.disabledStyle default M.DisabledStyle.ChangePicture
    -- config.disabledImageFile default 'images/ui2/nbutton/disabled.png'
    -- config.onClicked default function () end
    --
    --
    --
    -- animations:
    --
    -- config.animationOnInvisible default { do nothing }
    -- config.animationOnVisible ....
    --
    -- config.animationOnNormalPlaying default { do nothing }
    -- config.animationOnPushing default { do nothing }
    -- config.animationOnDownPlaying default { do nothing }
    -- config.animationOnPopping default { do nothing }
    --
    -- TODO more, covers all properties
    ctor = function (self, config)
        -- prologue
        __private__._isDisposing = false
        __private__._isDisposed = false
        __private__._isInitializing = true
        -- *********************************************************************

        -- config parameter
        if config == nil then
            config = {}
        end

        __private__._visible = true
        __private__._normalImageFile = config.normalImageFile or 'ui2/nbutton/normal.png'

        if defaultNormalImageFile == __private__._normalImageFile then
            __private__._downImageFile = config.downImageFile or 'ui2/nbutton/down.png'
        else
            __private__._downImageFile = nil
        end

        __private__._disabledStyle = config.disabledStyle or M.DisabledStyle.ChangeColor
        __private__._disabledImageFile = config.disabledImageFile or 'ui2/nbutton/disabled.png'
        __private__._onClicked = config.onClicked or function () end

        -- animations
        __private__._animationOnInvisible = config.animationOnInvisible
        __private__._animationOnVisible = config.animationOnVisible

        __private__._animationOnNormalPlaying = config.animationOnNormalPlaying
        __private__._animationOnPushing = config.animationOnPushing
        __private__._animationOnDownPlaying = config.animationOnDownPlaying
        __private__._animationOnPopping = config.animationOnPopping


        if type(config.visible) ~= 'nil' then
            __private__._visible = config.visible
        end

        -- images
        -- local normalImageRes = createResImage(__private__._normalImageFile)
        -- __private__._normalImage = new(DrawingImage, normalImageRes)
        __private__._normalImage = createDrawingImage(__private__._normalImageFile)
        local w, h = __private__._normalImage:getSize()

        if __private__._downImageFile then
--            local downImageRes = createResImage(__private__._downImageFile)
--            __private__._downImage = new(DrawingImage, downImageRes)
            __private__._downImage = createDrawingImage(__private__._downImageFile)
        else
--            local downImageRes = createResImage(__private__._normalImageFile)
--            __private__._downImage = new(DrawingImage, downImageRes)
            __private__._downImage = createDrawingImage(__private__._normalImageFile)
            __private__._downImage:setColor(128, 128, 128)
        end

        self:addChild(__private__._downImage)
        self:addChild(__private__._normalImage)

        __private__._downImage:setAlign(kAlignCenter)
        __private__._normalImage:setAlign(kAlignCenter)

        -- size
        local width = config.width or w or 100
        local height = config.height or h or 100

        __private__._downImage:setSize(width, height)
        __private__._normalImage:setSize(width, height)
        self:setSize( width, height )

        -- visible

        if config.visible ~= nil then
            self:setVisible(config.visible)
        end

        -- enabled

        if config.enabled ~= nil then
            self:setEnabled(config.enabled)
        else
            self:setEnabled(true)
        end


        -- initialization

        __private__._downImage:setVisible(false)

        -- XXX can it be public ?
        __private__._buttonState = ButtonState.Normal

        -- __private__._isPlayingAnimation = false
        __private__.setPlayingAnimation(self, false)
        __private__._currentPlayingAnimation = {}

        __private__._manuallySetAllowFingerActions = true -- 手动设置的：是否允许手指事件
        __private__._isAllowFingerActions = true -- 内部的：是否允许手指事件

        local fingerEventId = 0
        local currentFingerEventId  -- 手指事件ID

        -- handle events
        self:setEventTouch(nil, function(__, finger_action, x, y, drawing_id_first, drawing_id_current)

            if not __private__.isShouldHandleEvent() then
                fingerEventId = fingerEventId + 1
                return
            end

            local enterPushingState = function ()
                -- play down animation
                __private__._buttonState = ButtonState.Pushing

                -- __protected__.interruptAnimation (self)
                __protected__.playAnimation(self, __private__._animationOnPushing, function ()
                    __private__._downImage:setVisible(true)
                    __private__._normalImage:setVisible(false)

                    __private__._buttonState = ButtonState.Down

                    __protected__.playAnimation(self, __private__._animationOnDownPlaying, function () end)

                end)
            end

            local enterPoppingState = function ()
                -- play up animation
                __private__._buttonState = ButtonState.Popping

                -- __protected__.interruptAnimation (self)
                __protected__.playAnimation(self, __private__._animationOnPopping, function ()
                    __private__._downImage:setVisible(false)
                    __private__._normalImage:setVisible(true)

                    __private__._buttonState = ButtonState.Normal

                    __private__._onClicked()

                    -- 遇到这样的逻辑：
                    -- onclick的时候，调用:setVisible(false)，带动画，但是normal状态无动画。
                    -- 结果，invisible动画刚开始，就被interrupt。
                    -- 于是无论如何都动不了。
                    --
                    -- TODO 重构逻辑。
                    if __private__._animationOnNormalPlaying then
                    __protected__.playAnimation(self, __private__._animationOnNormalPlaying, function () end)
                    end
                end)
            end


            local handleDownLogic = function ()
                currentFingerEventId = fingerEventId

                if __private__._buttonState == ButtonState.Normal then
                    enterPushingState()
                end

            end

            local handleMoveLogic = function ()

                if currentFingerEventId ~= fingerEventId then
                    -- ensure complete finger lifecycle
                    return
                end

                if __private__._buttonState == ButtonState.Pushing then
                    -- do nothing
                    return
                end
            end

            local handleUpLogic = function ()
                if currentFingerEventId ~= fingerEventId then
                    -- ensure complete finger lifecycle
                    return
                end

                fingerEventId = fingerEventId + 1

                if (__private__._buttonState == ButtonState.Pushing)  or  (__private__._buttonState == ButtonState.Down) then
                    enterPoppingState ()
                    return
                end
            end


            if finger_action == kFingerDown then
                handleDownLogic ()
            elseif finger_action == kFingerMove then
                handleMoveLogic ()
            elseif (finger_action == kFingerUp) or (finger_action == kFingerCancel) then
                handleUpLogic ()
            end
        end)



        -- *********************************************************************
        -- epilogue
        __private__._isInitializing = false
        __private__._isInitialized = true
    end,

    -- animations

    setAnimationOnVisible = function (self, value)
        -- 在下次开启动画的时候才有效果
        __private__._animationOnVisible = value
    end,

    getAnimationOnVisible = function (self)
        return __private__._animationOnVisible
    end,

    setAnimationOnInvisible = function (self, value)
        __private__._animationOnInvisible = value
    end,

    getAnimationOnInvisible = function (self)
        return __private__._animationOnInvisible
    end,

    setAnimationOnNormalPlaying = function (self, value, affectImmediately)
        __private__._animationOnNormalPlaying = value

        if affectImmediately and (__private__._buttonState == ButtonState.Normal) then
            -- __protected__.interruptAnimation (self)
            __protected__.playAnimation(self, __private__._animationOnNormalPlaying, function () end)
        end
    end,

    getAnimationOnNormalPlaying = function (self)
        return __private__._animationOnNormalPlaying
    end,

    setAnimationOnPushing = function (self, value)
        __private__._animationOnPushing = value
    end,

    getAnimationOnPushing = function (self)
        return __private__._animationOnPushing
    end,

    setAnimationOnDownPlaying = function (self, value, affectImmediately)
        __private__._animationOnDownPlaying = value

        if affectImmediately and (__private__._buttonState == ButtonState.Down) then
            -- __protected__.interruptAnimation (self)
            __protected__.playAnimation(self, __private__._animationOnDownPlaying, function () end)
        end
    end,

    getAnimationOnDownPlaying = function (self)
        return __private__._animationOnDownPlaying
    end,

    setAnimationOnPopping = function (self, value)
        __private__._animationOnPopping = value
    end,

    getAnimationOnPopping = function (self)
        return __private__._animationOnPopping
    end,

    isPlayingAnimation = function (self)
        return self._isPlayingAnimation
    end,

    -- *************************************************************************

    isDisposing = function (self)
        return __private__._isDisposing
    end,

    isDisposed = function (self)
        return __private__.isDisposed
    end,

    setOnClicked = function (self, fn)
        __private__._onClicked = fn or function ()end
    end,

    setVisible = function (self, value, animation)
        if value == __private__._visible then
            return
        end

        if __private__._isInitializing then
            __private__._visible = value
            super.setVisible(self, value)
        else
            __protected__.interruptAnimation (self)

            __private__._visible = value
            __private__._isAllowFingerActions = false

            __private__._buttonState = ButtonState.Normal

            if value then
                __protected__.updatePicture(self)
                __protected__.playAnimation(self, __private__._animationOnVisible, function ()
                    __private__._isAllowFingerActions = __private__._enabled and __private__._visible
                    if __private__._enabled then
                        __protected__.playAnimation(self, __private__._animationOnNormalPlaying, function () end)
                    end
                end)
            else
                __protected__.playAnimation(self, __private__._animationOnInvisible, function ()
                    __protected__.updatePicture(self)
                end)
            end
        end
    end,

    setEnabled = function (self, value)
        if __private__._enabled == value then
            return
        end

        if __private__._isInitializing then
            __private__._enabled = value
            __protected__.updatePicture (self)
        else
            __protected__.interruptAnimation (self)

            __private__._enabled = value

            __protected__.updatePicture(self)

            if value then
                __private__._isAllowFingerActions = true

                __protected__.playAnimation(self, __private__._animationOnNormalPlaying, function () end)
            else
                __private__._isAllowFingerActions = false
                __private__._buttonState = ButtonState.Normal
            end

        end
    end,


    setDisabledStyle = function (self, value)
        __private__._disabledStyle = value
        -- TODO
    end,

    getDisabledStyle = function (self)
        return __private__._disabledStyle
    end,

    setDisabledImageFile = function (self, value)
        -- TODO might bug here ?
        if __private__._disabledImage then
        local res = __private__._disabledImage.m_res
            setResImageFile(res, value)
            -- res:setFile(value)
        __private__._disabledImage:setResRect(0, res)
        end

        __private__._disabledImageFile = value
    end,

    getDisabledImageFile = function (self)
        return __private__._disabledImageFile
    end,

    setNormalImageFile = function (self, value)
        local res = __private__._normalImage
        setResImageFile(res, value)
        -- res:setFile(value)
        __private__._normalImage:setResRect(0, res)

        __private__._normalImageFile = value
    end,

    getNormalImageFile = function (self)
        return __private__._normalImageFile
    end,

    setDownImageFile = function (self, value)
        local res = __private__._downImage.m_res

        if value then
            -- res:setFile(value)
            setResImageFile(res, value)
            __private__._downImage:setResRect(0, res)
        else
            -- res:setFile(__private__._normalImageFile)
            setResImageFile(res, __private__._normalImageFile)
            __private__._downImage:setResRect(0, res)
            __private__._downImage:setColor(128, 128, 128)
        end

        __private__._downImageFile = value
    end,

    getDownImageFile = function (self)
        return __private__._downImageFile
    end,

    getNormalImage = function (self)
        return __private__._normalImage
    end,

    getDownImage = function (self)
        return __private__._downImage
    end,

    resume = function (self)
        if __private__._isPlayingAnimation then
            -- __private__._isPlayingAnimation = false
            __private__.setPlayingAnimation(self, false)
            __private__._currentPlayingAnimation.invokeOnStop()
        end
    end,

    setAllowFingerActions = function (self, value)
        __private__._manuallySetAllowFingerActions = value
    end,

    isAllowFingerActions = function (self)
        return __private__._manuallySetAllowFingerActions
    end,

    dtor = function (self)
        -- prologue
        __private__._isDisposing = true
        -- *********************************************************************

        -- TODO what to clean ?

        -- epilogue
        __private__._isDisposed = true
        -- *********************************************************************
    end,
    -- override from parents
    setSize = function(self, w, h)
        super.setSize(self,w,h)
        __private__._downImage:setSize(w, h)
        __private__._normalImage:setSize(w, h)
        if __private__._disabledImage then
            __private__._disabledImage:setSize(w, h)
    end
    end,

}


M.DisabledStyle = Enum {
    ChangeColor = {},

    -- TODO algebric data type, like ChangeImage(path)
    ChangeImage = {}
}



return M