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
-- @module ui2.NVerticalListView

require('core/system')

local OO = require('ui2.util.oo')
local NScrollView = require('ui2.NScrollView')
local DSM2 = require('ui2.compat.internal.DoubleScrollingModel2')
local Task = require('ui2.util.task')
local Misc = require('ui2.util.misc')
local UniqId = require('ui2.util.uniqId')
local Queue = require('ui2.util.queue')
local Debug = require('ui2.util.debug')

local genNewPropId = function (drawing)
    local newId = UniqId.get()

    if drawing.m_props[newId] then
        return #(drawing.m_props) + 1
    else
        return newId
    end
end

---
-- @field [parent=#global] #table __protected__

---
-- @field [parent=#global] #table __private__ 

local M = OO.defineClass({
    extend = NScrollView,

    ctor = function (self)
        -- default handlers
        __private__.onScrollHandler = function () end
        __private__.onStopHandler = function () end
        __private__.onBeginBouncing = function () end
        __private__.onItemResize = function (_index, item, newWidth, newHeight)
             item:setSize(newWidth, newHeight)
        end
        __private__.onBottomBannerUpdate = function () end
        __private__.onTopBannerUpdate = function () end
        __private__.onTopBannerVisibleChanged = function () end
        __private__.onBottomBannerVisibleChanged = function () end

        -- events
        self:setEventTouch(nil,function () end);
        self:setEventDrag(self,__protected__.onEventDrag);

        local contentNode = __protected__.getContentNode(self)
        contentNode:setSize(nil, 1)

        -- init scrolling model
        __private__.createScrollingModel(self)


        local left, top = contentNode:getUnalignPos()
        local width, height = contentNode:getSize()

        -- __private__.currentMostLeft = left
        -- __private__.currentMostRight = left + width
        -- __private__.currentMostTop = top
        -- __private__.currentMostBottom = top + height
        -- __private__.currentMostBottom

        local w, h = self:getSize()
        __private__.minimumContentSize = h + 1
        __private__.currentMostBottom = 0

        -- invoke on stop service
        __private__.invokeOnStop = Queue.create() 
        local invokeOnStopServiceTerminated = false        
        Task.runEveryFrames( function(stop)
            if invokeOnStopServiceTerminated then
                stop()
                return
            end
            
            __protected__.invokeStopHandler(self)
        end )
        __private__.terminateInvokeOnStopService = function ()
            invokeOnStopServiceTerminated = true            
        end
         
        
         

        -- data/child
        __private__.items = {}
        __private__.isChanging = false


        -- bouncing state
        __private__.isBouncing = false
        __private__.isBouncingPaused = false
        __private__.isTopBannerLocked = false
        __private__.isBottomBannerLocked = false

        -- top banner
        __private__.topBannerMinSize = nil
        __private__.topBannerNode = nil
        
        -- bottom banner
        __private__.bottomBannerMinSize = nil
        __private__.bottomBannerNode = nil        

        -- finger action
        __private__.hasFingerAction = false
        __private__.isFingerActionEnabled = true
        __private__.touchInfo = nil
        __private__.touchHistory = {}
    end,

    __private__ = {

        -- methods
        createScrollingModel = function (self)
            local viewLength = __protected__.getViewLength(self)
            local contentSize = __protected__.getContentSize(self)

            if contentSize <= viewLength then
                contentSize = viewLength + 1
            end

            __private__.scrollingModel = DSM2.create(contentSize, viewLength, function (offset)
                local fn = function ()
                    -- content
                    local contentNode = __protected__.getContentNode(self)
                    contentNode:setPos(0, offset)
                    
                    local isAtBannerMinSizePoint = false 

                    -- top banner
                    if __private__.topBannerNode then
                        -- visibility
                        local origVisible = __private__.topBannerNode:getVisible()
                        local newVisible = offset > 0
                        __private__.topBannerNode:setVisible(newVisible)
                        
                        if origVisible ~= newVisible then
                            __private__.onTopBannerVisibleChanged(newVisible)
                        end

                        -- size
                        local newSize = math.max( __private__.topBannerMinSize, offset )
                        __private__.topBannerNode:setSize(nil, newSize)

                        -- position
                        local newPosition = math.min(offset - __private__.topBannerMinSize, 0)
                        __private__.topBannerNode:setPos(nil, newPosition)
                        
                        if newPosition + newSize > 0 then 
                            __private__.onTopBannerUpdate(nil, newSize, newPosition + newSize)
                        end                        
                        
                        -- pause point detection
                        if __private__.topBannerMinSize > 0 then
                            if offset == __private__.topBannerMinSize then
                                isAtBannerMinSizePoint = true
                            end  
                        end
                    end
                    
                    -- bottom banner
                    if __private__.bottomBannerNode then
                        local viewLength = __protected__.getViewLength(self)
                        local contentSize = __private__.scrollingModel.getContentSize()

                        -- print_string(string.format('offset = %d, contentSize = %d, viewLength = %d', offset, contentSize, viewLength))

                        -- visibility
                        local origVisible = __private__.bottomBannerNode:getVisible()
                        local newVisible = offset + contentSize < viewLength
                        __private__.bottomBannerNode:setVisible(offset + contentSize < viewLength)

                        if origVisible ~= newVisible then
                            __private__.onBottomBannerVisibleChanged(newVisible)
                        end

                        -- size
                        local newSize = math.max( __private__.bottomBannerMinSize, viewLength - (offset + contentSize) )
                        __private__.bottomBannerNode:setSize(nil, newSize)

                        -- position
                        local newPosition = offset + contentSize
                        __private__.bottomBannerNode:setPos(nil, newPosition)
                        
                        if viewLength - newPosition > 0 then
                            __private__.onBottomBannerUpdate(nil, newSize, viewLength - newPosition)
                        end
                        
                        -- pause point detection
                        if __private__.bottomBannerMinSize > 0 then
                            if offset == viewLength - __private__.bottomBannerMinSize - contentSize then
                                isAtBannerMinSizePoint = true
                            end  
                        end
                    end
                    

                    -- scrollbar
                    __protected__.updateScrollBarScrollPos(self, offset)

                    -- subclass handler
                    __protected__.handleOnScroll(self, offset)

                    -- event handler
                    __private__.onScrollHandler(offset, isAtBannerMinSizePoint)
                    
                    -- limit move             
                    if __private__.topBannerNode then       
                        if __private__.topBannerMinSize > 0 then
                            if (offset == __private__.topBannerMinSize) and __private__.isTopBannerLocked then
                                __private__.scrollingModel.setTopStretchMoveLimit(__private__.topBannerMinSize, nil)
                            end  
                        end
                    end
                    
                    if __private__.bottomBannerNode then
                        if __private__.bottomBannerMinSize > 0 then
                            if (offset == viewLength - __private__.bottomBannerMinSize - contentSize) and __private__.isBottomBannerLocked then
                                __private__.scrollingModel.setBottomStretchMoveLimit(__private__.bottomBannerMinSize, nil)                                
                            end  
                        end
                    end
                    
                end

--                if __private__.isBouncing then
--                    if __private__.onCheckNeedPauseBouncing(offset) then
--                        self:pauseBouncing()
--                        __private__.resumeCallback = fn
--                    else
--                        fn()
--                    end
--                else
                    fn()
--                end

            end)

            ------------------------------- default scheme ---------------------------------------

            __private__.scrollingModel.setScrollingScheme('s1', 'r3')

            --------------------------------------------------------------------------------------


            __private__.scrollingModel.setOnStop(function ()
                __private__.isBouncing = false
                __private__.isBouncingPaused = false

                self.setScrollBarVisible(self, false)

                -- handlers
                __protected__.handleStop(self)
                __private__.onStopHandler()

                -- invoke callbacks
                
                -- __protected__.invokeStopHandlers(self)                    
            end)

            __private__.scrollingModel.setOnBeginBouncing(function ()
                __private__.isBouncing = true
                __private__.isBouncingPaused = false

                local function adjustCursorBase(p)
                    local min = p
                    local stretchFunctions = __private__.scrollingModel.getStretchFunction()
                    
                    while true do
                        local limitFingerOffset = stretchFunctions.inverseFn(p)
                        local x = stretchFunctions.fn(limitFingerOffset)
                        
                        if x >= min then
                            return limitFingerOffset                                 
                        end
                        
                        p = p + 1
                    end 
                end

                if __private__.topBannerMinSize then
                    __private__.scrollingModel.setBounceToTopNeedPauseAt(__private__.topBannerMinSize)
                    
                    __private__.topBannerCursorBase = adjustCursorBase(__private__.topBannerMinSize)
                end
                
                if __private__.bottomBannerMinSize then
                    local viewLength = __protected__.getViewLength(self)
                    local contentSize = __private__.scrollingModel.getContentSize()

                    __private__.scrollingModel.setBounceToBottomNeedPauseAt(viewLength - __private__.bottomBannerMinSize - contentSize)
                    
                    __private__.bottomBannerCursorBase = adjustCursorBase(__private__.bottomBannerMinSize)
                end
                                

                __protected__.handleBeginBouncing(self)
                __private__.onBeginBouncing()
            end)

            __private__.scrollingModel.setContentPosition(0)
        end,

        stopScrollingModelSilently = function (self)
            __private__.isBouncing = false
            __private__.isBouncingPaused = false

            if __private__.scrollingModel then
                __private__.scrollingModel.forceStop()
            end
        end,

        lockTopBanner = function (self)
            if not __private__.isBouncing then
                error('Invalid operation.')
            end

            __private__.isTopBannerLocked = true

            -- TODO might something need to process
        end,
        
        lockBottomBanner = function (self)
            if not __private__.isBouncing then
                error('Invalid operation.')
            end

            __private__.isBottomBannerLocked = true

            -- TODO might something need to process
        end,

        unlockTopBanner = function (self)
            __private__.isTopBannerLocked = false

            -- TODO might something need to process
        end,

        unlockBottomBanner = function (self)
            __private__.isBottomBannerLocked = false

            -- TODO might something need to process
        end,

        touchHistory = {},

        replayTouchHistory = function ()
            local n = #(__private__.touchHistory)
            for i = 1, n do
                local args = __private__.touchHistory[i]
                Misc.apply(__private__.processTouch, args)
            end

            __private__.touchHistory = {}
        end,

        processTouch = function (self, finger_action, x, y, drawing_id_first, drawing_id_current, event_time)
            local curPos = y
            
            if finger_action == kFingerDown then
                __private__.hasFingerAction = true

                __private__.touchInfo = {
                    beginCursor = curPos,
                    beginContentPosition = __protected__.getContentPosition(self),
                    -- beginMinimumContentSize = __private__.topBannerMinSize      <-- unused
                }

                __private__.touchInfo = nil
                __private__.scrollingModel.handlePressLogic(curPos, event_time)

            elseif finger_action == kFingerMove then

                __private__.scrollingModel.handleMoveLogic(curPos, event_time)
            elseif (finger_action == kFingerUp) or (finger_action == kFingerCancel) then

                __private__.hasFingerAction = false

--                __private__.scrollingModel.setTopStretchMoveLimit(nil, nil)
--                __private__.scrollingModel.setBottomStretchMoveLimit(nil, nil)
                __private__.scrollingModel.handleReleaseLogic(curPos, event_time)                
            end
        end,
        
        addResizeAnimation = function (item, duration, beginWidth, endWidth, beginHeight, endHeight)
            if duration <= 0 then
                return
            end
        
            if (beginHeight == endHeight) and (beginWidth == endWidth) then
                return
            end
        
            local newSeqId = genNewPropId(item)
        
            local update = function (newWidth, newHeight)
        --         item:setClip2(true,0, 0, newWidth, newHeight)
                -- item:setSize(newWidth, newHeight)
                __private__.onItemResize(nil, item, newWidth, newHeight)
            end
        
            local terminated = false
        
            item.m_props[newSeqId] = {
                prop = {
                    -- TODO
                    dtor = function ()
                        item.m_props[newSeqId] = nil
                        terminated = true
                    end
                },
                anim = {}
            }
        
            update(beginWidth, beginHeight)
        
            local startTime = sys_get_int("tick_time", 0)
        
            Task.runEveryFrames( function(stop)
                if terminated then
                    -- item:setClip2(false, - 65536,- 65536, - 65536, - 65536)  -- release clip effect
                    
                    update(endWidth, endHeight)
                    
                    stop()
                    return
                end
        
                local currentTime = sys_get_int("tick_time", 0)
        
                if currentTime - startTime >= duration then
                    terminated = true -- for some reason
                    -- item:setClip2(false, - 65536,- 65536, - 65536, - 65536)  -- release clip effect
                    
                    update(endWidth, endHeight)
                    
                    stop()
                    return
                end
        
                local newWidth = beginWidth + (endWidth - beginWidth) / duration * (currentTime - startTime)
                local newHeight = beginHeight + (endHeight - beginHeight) / duration * (currentTime - startTime)
        
                update(newWidth, newHeight)
            end )
        end,        

    },

    __protected__ = {
        getItem = function (self, index)
            return __private__.items[index]
        end,

        --------------------------------------------------------------------------------




        getContentSize = function (self)
            local w, h = __protected__.getContentNode(self):getSize()
            return h
        end,

        getViewLength = function (self)
            local w, h = self:getSize()
            return h
        end,

        getDirection = function (self)
            return NScrollView.Direction.VERTICAL
        end,

        getContentPosition = function (self)
            local contentNode = __protected__.getContentNode(self)
            local x, y = contentNode:getPos()
            return y
        end,

        --------------------------------------------------------------------------------

        addItemImmediately = function (self, item, index, config)
            -- { needAnimation = 是否播放动画, durationOfAnimation = 动画时长（毫秒）,
            -- onFinished = function () end }


            if not self:isSilent() then
                error('Invalid operation.')
            end

            if index == #(__private__.items) + 1 then
                index = nil
            end

            if index then
                if (index < 1) or (index > #(__private__.items) + 1) then
                    error('Index out of range.')
                end
            end

            -- add item
            super.addChild(self, item)

            if drawing_set_visible_test then
                local optimize
                optimize = function (obj)
                    drawing_set_visible_test( obj.m_drawingID, 1 )
                    local children = obj:getChildren()
                    for k, v in pairs(children) do
                        optimize(v)
                    end
                end
                optimize(item)
            end

            local contentNode = __protected__.getContentNode(self)

            local needAnimation = config.needAnimation
            local durationOfAnimation = config.durationOfAnimation

            local worthToAddTranslateAnimation = (function ()
                local selfX, selfY = self:getAbsolutePos()
                local selfW, selfH = self:getSize()
                local top = selfY
                local bottom = selfH + top
                local inRange = function (pos)
                    return (top <= pos) and (pos <= bottom)
                end
                return function (beginPosition, endPosition)
                    return inRange(beginPosition) or inRange(endPosition)
                end
            end)()

            local newContentSize

            -- for animation
            local animCounter = 0 

            local decreaseAnimCounter = function ()
                animCounter = animCounter - 1

                if animCounter == 0 then 
                    -- really stopped now 
                    __private__.isChanging = false 
                end 
            end



            if index then
                -- insert

                local origItem = __protected__.getItem(self, index)
                local origX, origY = origItem:getPos()

                local left = 0
                local top = origY

                item:setAlign(kAlignTopLeft)
                item:setPos(left, top)

                local width, height = item:getSize()

                -- for animation
                local origItemCount = #(__private__.items)
                for i = origItemCount, index, -1 do
                    local it = __private__.items[i]
                    __private__.items[i+1] = it

                    local x, y = it:getPos()


                    it:setPos(nil, height + y)
                    
                    if needAnimation then
                        local absX, absY = it:getAbsolutePos()
                        local itWidth, itHeight = it:getSize()
                        if worthToAddTranslateAnimation(absY - height, absY + itHeight ) then
                            local newSeq = genNewPropId(it)
                            animCounter = animCounter + 1
                            local prop = it:addPropTranslate(newSeq, kAnimNormal, durationOfAnimation, -1, 0, 0, -height, 0)
                            prop:setEvent(nil, (function ()
                                local currentSeq = newSeq
                                return function ()
                                    it:removeProp(currentSeq)
                                    decreaseAnimCounter()
                                end
                            end)())
                        end
                    end


                end

                __private__.items[index] = item

                do
                    local it = __protected__.getItem(self, #(__private__.items))
                    local x, y = it:getPos()
                    local w, h = it:getSize()
                    __private__.currentMostBottom = y + h
                end
                newContentSize = math.max(__private__.currentMostBottom, __private__.minimumContentSize)


                -- add animation of the inserted item
                if needAnimation then
                    __private__.addResizeAnimation(item, durationOfAnimation, width, width, 0, height)

                    local newSeq = genNewPropId(item)
                    local prop = item:addPropTransparency(newSeq, kAnimNormal, durationOfAnimation, -1, 0, 1)
                    animCounter = animCounter + 1
                    prop:setEvent(nil, (function ()
                        local currentSeq = newSeq
                        return function ()
                            item:removeProp(currentSeq)
                            decreaseAnimCounter()                        
                        end
                    end)())
                end


            else
                -- append

                local left = 0
                local top = __private__.currentMostBottom

                item:setAlign(kAlignTopLeft)
                item:setPos(left, top)

                local width, height = item:getSize()

                local right = left + width
                local bottom = top + height

                table.insert(__private__.items, item)

                __private__.currentMostBottom = bottom
                newContentSize = math.max(__private__.currentMostBottom, __private__.minimumContentSize)

                -- add animation of the inserted item
                if needAnimation then
                    local newSeq = genNewPropId(item)
                    local prop = item:addPropTransparency(newSeq, kAnimNormal, durationOfAnimation, -1, 0, 1)
                    animCounter = animCounter + 1
                    prop:setEvent(nil, (function ()
                        local currentSeq = newSeq
                        return function ()
                            item:removeProp(currentSeq)
                            decreaseAnimCounter()                        
                        end
                    end)())

                end
            end

            if needAnimation then   
                __private__.isChanging = true       
                -- print_string('__private__.isChanging = true, ' .. debug.traceback())
            end 

            contentNode:setSize(nil, newContentSize)

            -- update scrolling model

            __private__.stopScrollingModelSilently()

            if __private__.currentMostBottom > __protected__.getViewLength(self) then
                __private__.scrollingModel.setContentSize(newContentSize)
            end

            __protected__.update(self)

        end,

        setItemSizeImmediately = function (self, index, newSize, config)
            -- { needAnimation = 是否播放动画, durationOfAnimation = 动画时长（毫秒）}

            if not self:isSilent() then
                error('Invalid operation.')
            end

            if index then
                if (index < 1) or (index > #(__private__.items)) then
                    error('Index out of range.')
                end
            end

            local contentNode = __protected__.getContentNode(self)

            local needAnimation = config.needAnimation
            local durationOfAnimation = config.durationOfAnimation

            local worthToAddTranslateAnimation = (function ()
                local selfX, selfY = self:getAbsolutePos()
                local selfW, selfH = self:getSize()
                local top = selfY
                local bottom = selfH + top
                
                local inRange = function (pos)
                    return (top <= pos) and (pos <= bottom)
                end
                return function (beginPosition, endPosition)
                    return inRange(beginPosition) or inRange(endPosition)
                end
            end)()

            local newContentSize

            -- for animation
            local animCounter = 0 

            local decreaseAnimCounter = function ()
                animCounter = animCounter - 1

                if animCounter == 0 then 
                    -- really stopped now 
                    __private__.isChanging = false 
                end 
            end

            local item = __protected__.getItem(self, index)
            local origWidth, origHeight = item:getSize() 
            local newHeight = newSize
            local deltaSize = newHeight - origHeight
            
            if deltaSize == 0 then
                -- skip if nothing to do 
                return  
            end 
            
            -- update item size
            if needAnimation then
                __private__.addResizeAnimation(item,durationOfAnimation,origWidth,origWidth,origHeight,newHeight)                
            else
                -- not need animation
                item:setSize(nil, newHeight)                    
            end                
            
            -- update rest components
            if index < #(__private__.items) then 
                local itemCount = #(__private__.items)
                for i = itemCount, index + 1, -1 do
                    local it = __private__.items[i]
                    local x, y = it:getPos()
    
                    it:setPos(nil, y + deltaSize)
    
                    if needAnimation then
                        local absX, absY = it:getAbsolutePos()
                        local itWidth, itHeight = it:getSize()
                        if worthToAddTranslateAnimation(
                            math.min(absY - deltaSize + deltaSize, absY - deltaSize),
                            math.max(absY + itHeight, absY - deltaSize + itHeight) 
                        ) then
                            local newSeq = genNewPropId(it)
                            animCounter = animCounter + 1
                            local prop = it:addPropTranslate(newSeq, kAnimNormal, durationOfAnimation, -1, 0, 0, - deltaSize, 0)
                            prop:setEvent(nil, (function ()
                                local currentSeq = newSeq
                                return function ()
                                    it:removeProp(currentSeq)
                                    decreaseAnimCounter()
                                end
                            end)())
                        end
                    end
                end
            end            
            
            -- update content size
            do
                local it = __protected__.getItem(self, #(__private__.items))
                local x, y = it:getPos()
                local w, h = it:getSize()
                __private__.currentMostBottom = y + h
            end
            newContentSize = math.max(__private__.currentMostBottom, __private__.minimumContentSize)

            if needAnimation then   
                __private__.isChanging = true       
                -- print_string('__private__.isChanging = true, ' .. debug.traceback())
            end 

            contentNode:setSize(nil, newContentSize)

            -- update scrolling model

            __private__.stopScrollingModelSilently()

            if __private__.currentMostBottom > __protected__.getViewLength(self) then
                __private__.scrollingModel.setContentSize(newContentSize)
            end

            __protected__.update(self)
        end,


        removeItemImmediately = function (self, index, doCleanup, config)
            if not self:isSilent() then
                error('Invalid operation.')
            end
    
            local item = __protected__.getItem(self, index)
            if item == nil then
                return
            end
    
            if #(__private__.items) == 1 then
                self:removeAllChildren()
                return
            end
    
            local needAnimation = config.needAnimation
            local durationOfAnimation = config.durationOfAnimation
                
            local contentNode = __protected__.getContentNode(self)
    
            local worthToAddTranslateAnimation = (function ()
                local selfX, selfY = self:getAbsolutePos()
                local selfW, selfH = self:getSize()
                local top = selfY
                local bottom = selfH + top
                local inRange = function (pos)
                    return (top <= pos) and (pos <= bottom)
                end
                return function (beginPosition, endPosition)
                    return inRange(beginPosition) or inRange(endPosition)
                end
            end)()
    
            -- for animation
            local animCounter = 0 

            local decreaseAnimCounter = function ()
                animCounter = animCounter - 1

                if animCounter == 0 then 
                    -- really stopped now 
                    __private__.isChanging = false 
                end 
            end
    
            if index == #(__private__.items) then
                -- remove last item, no animation
                if needAnimation then
                    local newSeq = genNewPropId(item)
                    local prop = item:addPropTransparency(newSeq, kAnimNormal, durationOfAnimation, -1, 1, 0)
                    animCounter = animCounter + 1
                    prop:setEvent(nil, function ()
                        contentNode:removeChild(item, doCleanup)
                        decreaseAnimCounter()
                    end)
                else
                    contentNode:removeChild(item, doCleanup)
                end
                __private__.items[index] = nil
            else
                -- item in the middle
    
                local deltaWidth, deltaHeight = item:getSize()
    
                for i = index, #(__private__.items) - 1 do
                    local it = __private__.items[i + 1]
                    __private__.items[i] = it
    
                    local x, y = it:getPos()
                    it:setPos(nil, y - deltaHeight)
    
                    if needAnimation then
                        local absX, absY = it:getAbsolutePos()
                        local itWidth, itHeight = it:getSize()
                        if worthToAddTranslateAnimation(absY, absY + deltaHeight + itHeight) then
                            local newSeq = genNewPropId(it)
                            local prop = it:addPropTranslate(newSeq, kAnimNormal, durationOfAnimation, -1, 0, 0, deltaHeight, 0)
                            animCounter = animCounter + 1
                            prop:setEvent(nil, (function ()
                                local currentSeq = newSeq
                                return function ()
                                    it:removeProp(currentSeq)
                                    decreaseAnimCounter()
                                end
                            end)())
    
                        end
                    end
                end
    
                __private__.items[ #(__private__.items) ] = nil
    
                -- add animation of the inserted item
                if needAnimation then
                    __private__.addResizeAnimation(item, durationOfAnimation, deltaWidth, deltaWidth, deltaHeight, 0)
    
                    local newSeq = genNewPropId(item)
                    local prop = item:addPropTransparency(newSeq, kAnimNormal, durationOfAnimation, -1, 1, 0)
                    animCounter = animCounter + 1
                    Misc.addGlobalReference(prop)
                    prop:setEvent(nil, function ()
                        Misc.removeGlobalReference(prop)
                        contentNode:removeChild(item, doCleanup)
                        decreaseAnimCounter()
                    end)
                else
                    contentNode:removeChild(item, doCleanup)
                end
            end
    
    
            do
                local lastItem = __private__.items[ #(__private__.items) ]
                local left, top = lastItem:getPos()
                local w, h = lastItem:getSize()
                __private__.currentMostBottom = top + h
            end
    
            local newContentSize = math.max(__private__.currentMostBottom, __private__.minimumContentSize)
    
            if needAnimation then   
                __private__.isChanging = true       
            end 

            -- update scrolling model
    
            __private__.stopScrollingModelSilently()
    
            __private__.scrollingModel.setContentSize(newContentSize)
    
            __protected__.update(self)
    
        end,


        invokeStopHandler = function (self)
            if self:isSilent() then 
                while not __private__.invokeOnStop.isEmpty() do
                    local elem = __private__.invokeOnStop.dequeue()
                    if elem then 
                        elem.exec()
                        break
                    end 
                end
            end 
        end,

        -- handlers
        onEventDrag = function (self, finger_action, x, y, drawing_id_first, drawing_id_current, event_time)
            -- local Debug = require('ui2.util.debug')

            if __private__.scrollingModel == nil then
                return
            end

            if (finger_action == kFingerDown) or (finger_action == kFingerCancel) or (finger_action == kFingerUp) then
                __private__.touchHistory = {}
            end

            if not __private__.isFingerActionEnabled then
                -- recording
                table.insert(__private__.touchHistory, {
                    self, finger_action, x, y, drawing_id_first, drawing_id_current, event_time
                })

                return
            end

            __private__.processTouch(self, finger_action, x, y, drawing_id_first, drawing_id_current, event_time)

        end,

        -- preserve for subclasses
        handleStop = function (self)
            -- do nothing
        end,

        handleOnScroll = function (self, offset)
            -- do nothing
        end,

        handleBeginBouncing = function (self)
            -- do nothing
        end
    },
    
    -- fn(obj, newValue)
    -- 当top banner的visible改变时回调。
    -- 这个貌似可以作为拉伸的起始和结束。
    setOnTopBannerVisibleChanged = function (self, fn, obj)
        if fn then 
            __private__.onTopBannerVisibleChanged = function (...)
                return fn(obj, ...)
            end
        else 
            __private__.onTopBannerVisibleChanged = function () end
        end
    end,

    -- fn(obj, newValue)
    -- bottom banner的visible改变时回调。
    -- 这个貌似可以作为拉伸的起始和结束。
    setOnBottomBannerVisibleChanged = function (self, fn, obj)
        if fn then 
            __private__.onBottomBannerVisibleChanged = function (...)
                return fn(obj, ...)
            end
        else 
            __private__.onBottomBannerVisibleChanged = function () end
        end
    end,

    -- fn(obj, newWidth, newHeight, newPosition)
    -- 当位置大小更新的时候回调。
    -- newPosition是banner底边距离上边缘的距离。
    -- newWidth, newHeight是实际大小。    
    -- 注：只有当newPosition > 0的时候才会回调，所以收尾工作应该在onstop的时候做。
    setOnTopBannerUpdate = function (self, fn, obj)
        if fn then 
            __private__.onTopBannerUpdate = function (...)
                return fn(obj, ...)
            end
        else 
            __private__.onTopBannerUpdate = function () end
        end
    end,

    -- fn(obj, newWidth, newHeight, newPosition)
    -- 当位置大小更新的时候回调。
    -- newPosition是banner顶边距离下边缘的距离。
    -- newWidth, newHeight是实际大小。
    -- 注：只有当newPosition > 0的时候才会回调，所以收尾工作应该在onstop的时候做。    
    setOnBottomBannerUpdate = function (self, fn, obj)
        if fn then 
            __private__.onBottomBannerUpdate = function (...)
                return fn(obj, ...)
            end
        else 
            __private__.onBottomBannerUpdate = function () end
        end
    end,

    -- fn(obj, index, item, newWidth, newHeight)
    -- index为预留。目前统一为nil（并非所有时候都能确定index）。
    setOnItemResize = function (self, fn, obj)
        if fn then 
            __private__.onItemResize = function (...)
                return fn(obj, ...)
            end
        else 
            __private__.onItemResize = function (_index, item, newWidth, newHeight)
                 item:setSize(newWidth, newHeight)
            end
        end
    end,

    setOnCreateView = function (self, fn, obj)
        if fn then
            __private__.onCreateView = function (...)
                return fn(obj, ...)
            end
        else
            __private__.onCreateView = function () end
        end
    end,

    -- fn(obj, isAtBannerMinSizePoint)
    setOnScroll = function (self, fn, obj)
        if fn then
            __private__.onScrollHandler = function (...)
                return fn(obj, ...)
            end
        else
            -- nil
            __private__.onScrollHandler = function () end
        end
    end,

    setOnStop = function (self, fn, obj)
        if fn then
            __private__.onStopHandler = function ()
                return fn(obj)
            end
        else
            __private__.onStopHandler = function () end
        end
    end,

    setOnBeginBouncing = function (self, fn, obj)
        if fn then
            __private__.onBeginBouncing = function ()
                return fn(obj)
            end
        else
            -- nil
            __private__.onBeginBouncing = function () end
        end
    end,

    -- 在下一次静止状态时执行fn(obj)。若当前处于静止状态，则立即执行。
    addInvokeOnStop = function (self, fn, obj)
        if self:isSilent() then
            fn(obj)
        else
            __private__.invokeOnStop.enqueue({
                fn = fn, 
                exec = function ()
                    return fn(obj)
                end
            })
        end
    end,

    removeInvokeOnStop = function (self, fnToRemove)
        __private__.invokeOnStop.replaceAll(function (elem)
            return elem.fn == fnToRemove
        end, nil)
    end,

    -----------------------------------------------------------------

    -- 当前是否处于没有滚动动作。
    isCurrentlyNoScrolling = function (self)
        return (__private__.scrollingModel.isStopState()) and (__private__.isBouncing == false) -- 第二个条件可能不需要。
    end,

    -- 当前数据是否正在修改。
    isDataChanging = function (self)
        return __private__.isChanging 
    end,

    -- 当前是否处于静止状态。
    isSilent = function (self)
        return self:isCurrentlyNoScrolling() and (not self:isDataChanging())
    end,

    ---
    -- 插入项目。
    -- 
    -- @param self
    -- @param core.drawing#DrawingBase item 任意节点。
    -- @param #number index 从哪个item开始插入。若为nil，则从最后进行追加。
    -- @param ... 若不传，则不播放动画。若传了nil，则播放动画，默认时长为300ms。
    -- 若传了个整数，则播放动画，并且该数字为动画时长（毫秒）。
    -- 若传个{ needAnimation = 是否播放动画, durationOfAnimation = 动画时长（毫秒）}，则可以设置是否播放动画和其它参数。
    addItem = function (self, item, index, ...)
        local config = {}
        local durationOfAnimation
        local needAnimation            

        if arg.n > 0 then
            durationOfAnimation = arg[1]

            if durationOfAnimation == nil then
                durationOfAnimation = 300
            end

            if durationOfAnimation > 0 then
                needAnimation = true
            else
                needAnimation = false
            end
        end

        config.durationOfAnimation = durationOfAnimation
        config.needAnimation = needAnimation

--        config.onFinished = function ()
--            -- __protected__.invokeStopHandlers(self)
--        end 

        __protected__.addItemImmediately(self, item, index, config)
    end,
    
    -- add sequence of items
    -- config == { needAnimation = 是否播放动画, durationOfAnimation = 动画时长（毫秒）}, 可以是nil
    addItems = function (self, items, index, config)
        local newConfig 
        if config == nil then 
            newConfig = {
                needAnimation = false
            }
        else 
            newConfig = {
                needAnimation = config.needAnimation,
                durationOfAnimation = config.durationOfAnimation or 300
            }
        end
    
        for k, v in ipairs(items) do
            self:addInvokeOnStop((function ()
                local actualIndex = index + k - 1
                local obj = v
                return function ()
                    __protected__.addItemImmediately(self, obj, actualIndex, newConfig)
                end
            end)()) 
        end 
    end,

    appendItem = function (self, newItem)
        return self:addItem(newItem)
    end,
    
    setItemSize = function (self, index, newSize, config)
        local newConfig 
        if config == nil then 
            newConfig = {
                needAnimation = false
            }
        else 
            newConfig = {
                needAnimation = config.needAnimation,
                durationOfAnimation = config.durationOfAnimation or 300
            }
        end
    
        __protected__.setItemSizeImmediately(self, index, newSize, newConfig)
    end,

--    notifyItemChanged = function (self, index)
--        -- TODO 当item大小改变的时候调用这个。下一个版本再加入吧。
--    end,

--    changeItem = function (self, index, newItem)
--        -- TODO
--    end,

--    getTopIndex = function (self)
--        -- TODO
--    end,

--    getBottomIndex = function (self)
--        -- TODO
--    end,

--    setTopIndex = function (self, index)
--        -- TODO
--    end,

--    setBottomIndex = function (self, index)
--        -- TODO
--    end,

    removeAllItems = function (self)
        self:removeAllChildren(true)
    end,

    removeItem = function (self, index, doCleanup, ...)
        if not self:isSilent() then
            error('Invalid operation.')
        end

        local needAnimation
        local durationOfAnimation
        if arg.n > 0 then
            durationOfAnimation = arg[1]

            if durationOfAnimation == nil then
                durationOfAnimation = 300
            end

            if durationOfAnimation > 0 then
                needAnimation = true
            else
                needAnimation = false
            end
        end

        __protected__.removeItemImmediately(self, index, doCleanup, {
            needAnimation = needAnimation,
            durationOfAnimation = durationOfAnimation
        })
    end,

    -- config = { needAnimation = 是否播放动画, durationOfAnimation = 动画时长（毫秒）}
    -- 删除的对象会同时被delete()       
    removeItemRange = function (self, beginIndex, endIndex, config)
        if not self:isSilent() then
            error('Invalid operation.')
        end
        
        if not ( (beginIndex <= #(__private__.items)) and (beginIndex > 0) ) then
            error('index out of range')
        end
        
        if not ( (endIndex <= #(__private__.items)) and (endIndex > 0) ) then
            error('index out of range')
        end
        
        if beginIndex > endIndex then
            beginIndex, endIndex = Misc.swap(beginIndex, endIndex)             
        end 

        local newConfig 
        if config == nil then 
            newConfig = {
                needAnimation = false
            }
        else 
            newConfig = {
                needAnimation = config.needAnimation,
                durationOfAnimation = config.durationOfAnimation or 300
            }
        end
        
        if beginIndex > endIndex then
        end 
    
        for i = 1, endIndex - beginIndex + 1 do 
            self:addInvokeOnStop((function ()
                return function ()
                    __protected__.removeItemImmediately(self, beginIndex, true, newConfig)
                end
            end)()) 
        end 
    end,

    getItem = function (self, index)
        if (index <= #(__private__.items)) and (index > 0) then
            return __protected__.getItem(self, index)
        else
            error('index out of range')
        end
    end,

    getIndexOfItem = function (self, item)
        for k, v in ipairs(__private__.items) do
            if v == item then
                return k
            end
        end
        return nil
    end,

    getItemCount = function (self)
        return #(__private__.items)
    end,

    -- 必须静止的时候调用。
    -- 将内容物整体移动，使得上边缘位于相对于控件上边缘的坐标 position 处。
    -- 注：根据目标位置的不同，可能会引发回弹等动作。
    moveTo = function (self, position)
        if not self:isSilent() then
            error('Invalid operation.')
        end

        __private__.scrollingModel.setContentPosition(position)
        self.setScrollBarVisible(self, false)
    end,

    -- 必须静止的时候调用。
    -- 将内容物整体移动，使得第 index 个 item 的上边缘位于相对于控件上边缘的坐标 position 处。
    -- 注：根据目标位置的不同，可能会引发回弹等动作。
    moveByItem = function (self, index, position)
        local item = self:getItem(index)
        local x, y = item:getPos()
        local destination = position - y
        self:moveTo(destination)
    end,

    -- 获得某个item相对于控件上边缘的坐标。
    getItemPosition = function (self, index)
        local contentPosition = __protected__.getContentPosition(self)
        local item = self:getItem(index)
        local x, y = item:getPos()
        return contentPosition + y
    end,

    -- 根据某个相对于控件上边缘的坐标position，获得一个item的index，
    -- item的上边缘 <= position，下边缘 > position。
    -- 如果找到，则返回对应item的index；否则，返回nil。
    getItemByPosition = function (self, position)
        local contentPosition = __protected__.getContentPosition(self)
        local itemCount = #(__private__.items)

        if itemCount == 0 then
            return nil
        end

        local validateItem = function (index)
            local item = __protected__.getItem(self, index)
            local x, y = item:getPos()
            local w, h = item:getSize()

            local upper = contentPosition + y
            local bottom = contentPosition + y + h

            if (upper <= position) and (bottom > position) then
                return index
            else
                return nil
            end
        end

        local findInRange
        findInRange = function (min, max)
            if min == max then
                return validateItem(min)
            elseif min > max then
                return nil
            elseif min + 1 == max then
                return findInRange(min, min) or findInRange(max, max)
            else
                -- normal
                local splitPosition = math.floor((min + max) / 2)
                return findInRange(min, splitPosition) or findInRange(splitPosition, max)
            end
        end

        return findInRange(1, itemCount)
    end,

    -----------------------------------------------------------------

    addChild = function(self, child)
        self:appendItem(child)
    end,

    removeChild = function(self, child, doCleanup)
        local index = self:getIndexOfItem(child)
        return self:removeItem(index, doCleanup)
    end,

    setSize = function(self, w, h)
        if not self:isSilent() then
            error('Invalid operation.')
        end

        super.setSize(self,w,h)

        if __private__.scrollingModel then
            __private__.stopScrollingModelSilently()

            __private__.minimumContentSize = h + 1

            local contentSize = __protected__.getContentSize(self)
            if contentSize <= __private__.minimumContentSize then
                __private__.scrollingModel.setContentSize(__private__.minimumContentSize)
            end

            __private__.scrollingModel.setViewLength(h)
        end
    end,

    removeAllChildren = function(self, doCleanup)
        if not self:isSilent() then
            error('Invalid operation.')
        end

        local contentNode = __protected__.getContentNode(self)
        local result = contentNode:removeAllChildren(doCleanup)

        contentNode:setSize(nil, 1)
        __private__.stopScrollingModelSilently(self)
        __private__.scrollingModel.setContentSize(__protected__.getViewLength(self) + 1)

        local w, h = self:getSize()
        __private__.minimumContentSize = h + 1
        __private__.currentMostBottom = 0

        __private__.items = {}

        __protected__.update(self)

        return result
    end,

    setTopBanner = function (self, bannerNode)
        if not self:isSilent() then
            error('Invalid operation.')
        end

        if __private__.topBannerNode == bannerNode then
            return
        end

        if __private__.topBannerNode then
            __protected__.removeChild(self, __private__.topBannerNode)
            __private__.topBannerNode = nil
            __private__.topBannerMinSize = nil
        end

        if bannerNode then
            local contentPosition = __protected__.getContentPosition(self)

            local w, h = bannerNode:getSize()
            bannerNode:setAlign(kAlignTopLeft)
            -- bannerNode:setPos(nil, contentPosition - h)  <-- 貌似用不着？

            __protected__.addChild(self, bannerNode)

--            if contentPosition <= 0 then
--                bannerNode:setVisible(false)
--            end
            
            bannerNode:setVisible(false) -- 貌似直接这样就够了。静止状态，是不会有这些东西出现的。

            __private__.topBannerNode = bannerNode

            if __private__.topBannerMinSize == nil then
                self:setTopBannerMinSize(h)
            end
        end

    end,

    setBottomBanner = function (self, bannerNode)
        if not self:isSilent() then
            error('Invalid operation.')
        end

        if __private__.bottomBannerNode == bannerNode then
            return
        end

        if __private__.bottomBannerNode then
            __protected__.removeChild(self, __private__.bottomBannerNode)
            __private__.bottomBannerNode = nil
            __private__.bottomBannerMinSize = nil
        end

        if bannerNode then
            -- TODO 跟着改一改
        
            local contentPosition = __protected__.getContentPosition(self)

            local w, h = bannerNode:getSize()
            bannerNode:setAlign(kAlignTopLeft)
            -- bannerNode:setPos(nil, contentPosition - h)

            __protected__.addChild(self, bannerNode)

            -- if contentPosition <= 0 then
                bannerNode:setVisible(false)
            -- end

            __private__.bottomBannerNode = bannerNode

            if __private__.bottomBannerMinSize == nil then
                self:setBottomBannerMinSize(h)
            end
        end

    end,

    getTopBanner = function (self)
        return __private__.topBannerNode
    end,

    getBottomBanner = function (self)
        return __private__.bottomBannerNode
    end,

    getTopBannerMinSize = function (self)
        return __private__.topBannerMinSize
    end,

    getBottomBannerMinSize = function (self)
        return __private__.bottomBannerNode
    end,

    setTopBannerMinSize = function (self, value)
        if not self:isSilent() then
            error('Invalid operation.')
        end

        if __private__.topBannerNode then
            if value then
                __private__.topBannerMinSize = value
            else
                local w, h = __private__.topBannerNode:getSize()
                __private__.topBannerMinSize = h
            end
        else
            __private__.topBannerMinSize = value
        end
    end,

    setBottomBannerMinSize = function (self, value)
        if not self:isSilent() then
            error('Invalid operation.')
        end

        if __private__.bottomBannerNode then
            if value then
                __private__.bottomBannerMinSize = value
            else
                local w, h = __private__.bottomBannerNode:getSize()
                __private__.bottomBannerMinSize = h
            end
        else
            __private__.bottomBannerMinSize = value
        end
    end,

    isBouncingToTop = function (self)
        local contentPosition = __protected__.getContentPosition(self)
        
        return (contentPosition >= 0) and self:isBouncing() 
    end,

    isBouncingToBottom = function (self)
        local viewLength = __protected__.getViewLength(self)
        local contentSize = __private__.scrollingModel.getContentSize()
        local contentPosition = __protected__.getContentPosition(self)
        
        return (contentPosition + contentSize <= viewLength) and self:isBouncing() 
    end,

    isBouncing = function (self)
        return __private__.isBouncing
    end,

    isBouncingPaused = function (self)
        return __private__.isBouncingPaused
    end,

    pauseBouncing = function (self)
        if not __private__.isBouncing then
            error('Invalid operation.')
        end

        __private__.isBouncingPaused = true

        if self:isBouncingToTop() then 
            __private__.lockTopBanner(self)
        elseif self:isBouncingToBottom() then
            __private__.lockBottomBanner(self)
        end

        __private__.scrollingModel.pauseBouncing()
    end,

    resumeBouncing = function (self)
        if not __private__.isBouncing then
            error('Invalid operation.')
        end

        if not __private__.isBouncingPaused then
            error('Invalid operation.')
        end

        __private__.isBouncingPaused = false

        if self:isBouncingToTop() then 
            __private__.unlockTopBanner(self)
        elseif self:isBouncingToBottom() then
            __private__.unlockBottomBanner(self)
        end

        -- TODO 可能会有一瞬间突然被拉下来。
        __private__.scrollingModel.setTopStretchMoveLimit(nil, nil)
        __private__.scrollingModel.setBottomStretchMoveLimit(nil, nil)


        __private__.scrollingModel.resumeBouncing()
    end,

    dtor = function (self)
        if __private__.topBannerNode then
            delete(__private__.topBannerNode)
        end
        
        if __private__.bottomBannerNode then
            delete(__private__.bottomBannerNode)
        end
        
        local contentNode = __protected__.getContentNode(self)
        contentNode:removeAllChildren(true)

        __private__.scrollingModel.setOnStop(function () end);
        __private__.scrollingModel.forceStop();
        
        __private__.terminateInvokeOnStopService()
    end,

    isFingerActionEnabled = function (self)
        return __private__.isFingerActionEnabled
    end,

    setFingerActionEnabled = function (self, value, processRecordedFingerAction)
        if __private__.hasFingerAction and (value == false) and (__private__.isFingerActionEnabled == true) then
            error('Invalid operation.')
        end

        __private__.isFingerActionEnabled = value

        if processRecordedFingerAction and (value == true) then
            __private__.replayTouchHistory()
        end

        __private__.touchHistory = {}
    end,

    hasFingerAction = function (self)
        return __private__.hasFingerAction
    end




})

return M