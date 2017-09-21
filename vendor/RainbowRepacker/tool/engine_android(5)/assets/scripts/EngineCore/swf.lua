-- v3.0
-- 2016-7-15 fix layout scale
-- 2016-8-15 add playContinue function
-- 2016-9-8  Swf(LuaNode) pack in SwfNode(Node),to fix old swfplayer.lua 
---2016-9-19 apply shaderd shader to colorOffsetShader
-- fredzeng
local Image2dMask_Shader = require("shaders.image2dMask")
local colorOffset = require("shaders.colorOffset")
local maskBlend = require("shaders.maskBlend")
local colorShader = Shader.create(colorOffset)
-----------------------------------
local Sprite = class(Image,false)
local Mask = class(LuaNode)
local MC = class(LuaNode)
local Swf = class(MC,false)
local SpNode = class(Node,false)

function SpNode:ctor()
	super(self)
	self:getWidget().double_sided = true
end

function SpNode:__changeImg(imgName)
	
end

function SpNode:addChild(child)
	child:getWidget().double_sided = true
	Node.addChild(self,child)
end

function SpNode:__setMatrix(a,b,c,d,sx,sy)
	sx = sx * System.getLayoutScale()
	sy = sy * System.getLayoutScale()
    drawing_set_force_matrix(self.m_drawingID,1,a,b,0,0,c,d,0,0,0,0,1,0,sx,sy,0,1)
end

function SpNode:__setColor(r,g,b,a,offsetR,offsetG,offsetB,offsetA)
	local nodeWidget = self:getWidget();
	if nodeWidget then
		nodeWidget.colorf = Colorf(r,g,b,a)
		nodeWidget.colorf_offset = Colorf(offsetR/255,offsetG/255,offsetB/255,offsetA/255)
	end
end

function SpNode:__resume()
	-- body
end

function SpNode:__setBlend(blendMode)
	-- body
end


function Sprite:ctor(imgName,imgPinMap)
	self.m_imgName = imgName
	self.m_imgPinMap = imgPinMap
	super(self,self.m_imgPinMap[imgName])
	self:getWidget().double_sided = true
end
function Sprite:__changeImg(imgName)
	self.m_imgName = imgName
	self:setFile(self.m_imgPinMap[imgName])
	self:setSize(self.m_res.m_width,self.m_res.m_height)
end
function Sprite:__setMatrix(a,b,c,d,sx,sy)
	sx = sx * System.getLayoutScale()
	sy = sy * System.getLayoutScale()
    drawing_set_force_matrix(self.m_drawingID,1,a,b,0,0,c,d,0,0,0,0,1,0,sx,sy,0,1)
end
function Sprite:__setColor(r,g,b,a,offsetR,offsetG,offsetB,offsetA)
	self:getWidget().colorf = Colorf(r,g,b,a)
	self:getWidget().colorf_offset = Colorf(offsetR/255,offsetG/255,offsetB/255,offsetA/255)
end
function Sprite:__resume()
	-- body
end
function Sprite:__setBlend(blendMode)
	-- body
end
-----------------------------------
local blend = require("shaders.blend")
function MC:ctor(cid,frameInfo,mainBody)
	if cid == nil then
		return
	end
	self.m_cid = cid
	self.m_frameInfo = frameInfo
	self.m_mainBody = mainBody
	self.m_maskDepthMap = {}
	self.m_spriteDepthMap = {}
	self.m_spriteMap = {}
	self.m_currFrame = 1
	self.m_totalFrame = #frameInfo
    
end
function MC:__setMatrix(a,b,c,d,sx,sy)
	sx = sx * System.getLayoutScale()
	sy = sy * System.getLayoutScale()
    drawing_set_force_matrix(self.m_drawingID,1,a,b,0,0,c,d,0,0,0,0,1,0,sx,sy,0,1)
end
function MC:__setColor(r,g,b,a,offsetR,offsetG,offsetB,offsetA)
	self:getWidget().colorf = Colorf(r,g,b,a)
	self:getWidget().colorf_offset = Colorf(offsetR/255,offsetG/255,offsetB/255,offsetA/255)
end
function MC:__findMaskLayer(depth)
	for k,v in pairs(self.m_maskDepthMap) do
		if v:__isContent(depth) then
			return v
		end
	end
	return nil
end
function MC:__createSprite(cid,depth)
	if self.m_spriteMap[cid.. "_"..depth] then
		self.m_spriteMap[cid.. "_"..depth]:setVisible(true)
		return self.m_spriteMap[cid.. "_"..depth]
	end
	local sprite = self.m_mainBody:__getNodeByCid(cid)
	self.m_spriteMap[cid.. "_"..depth] = sprite
	return sprite
end
function MC:__resetSprite()
	for k,v in pairs(self.m_spriteMap) do
		delete(v)
	end
	self.m_spriteMap = {}
	self.m_spriteDepthMap = {}
	for k,v in pairs(self.m_maskDepthMap) do
		delete(v)
	end
	self.m_maskDepthMap = {}
end
local _shaders = {}
local function get_shader(blendmode)
   if _shaders[blendmode] == nil then
        id = createBlend(blendmode)
        _shaders[blendmode] = Shader.create(id)
   end
   return _shaders[blendmode]
end
function MC:__setBlend(blendMode)
	if blendMode > 0 then
		self:getWidget():set_shared_shader(get_shader(blendMode))
		self:getWidget().lua_do_draw = function(self, canvas)
	        canvas:add(BindTexture(Window.instance().root.fbo.texture,1))
	    end
	else
		self:getWidget().shader = -1
	    self:getWidget().lua_do_draw = nil
	end
	self:getWidget():invalidate()
end
function MC:__parseTags(info)
	if info[1] == 2 then
		local node
		local isMaskLayer = info[6] ~= 0
		if isMaskLayer then
			if info[3] ~= 0 then
				node = self.m_maskDepthMap[info[2]]
				if node then
					local mask = self.m_mainBody:__getNodeByCid(info[3])
					node:__setMask(mask)
				else
					node = new(Mask,info[2],info[6],self.m_blend)
					local mask = self.m_mainBody:__getNodeByCid(info[3])
					node:__setMask(mask)
					node:setLevel(info[2])
					self.m_maskDepthMap[info[2]] = node
					self:addChild(node)
				end
			else 
				node = self.m_maskDepthMap[info[2]]
			end
			if node then
				for i = info[2] + 1,info[6] do
					local sprite = self.m_spriteDepthMap[i]
					if sprite then
						node:__addContent(sprite,i)
					end
					local mask = self.m_maskDepthMap[i]
					if mask then
						node:__addContent(mask,i)
					end
				end
			end
		else
			if info[7] and info[7] ~= 0 then
				if info[3] ~= 0 then
					node = new(SpNode)
					node:setLevel(info[2])
					self.m_spriteDepthMap[info[2]] = node
					self:addChild(node)
				else
					node = self.m_spriteDepthMap[info[2]]
					node:setVisible(true)
				end
			else
				if info[3] ~= 0 then
					node = self.m_spriteDepthMap[info[2]]
					if node then
						local imgName = self.m_mainBody:__getImageNameByCid(info[3])
						node:__changeImg(imgName)
						node:setVisible(true)
					else
						node = self:__createSprite(info[3],info[2])
						node:setLevel(info[2])
						self.m_spriteDepthMap[info[2]] = node
						local maskLayer = self:__findMaskLayer(info[2])
						if maskLayer then
							maskLayer:__addContent(node,info[2])
						else
							self:addChild(node)
						end
					end
				else 
					node = self.m_spriteDepthMap[info[2]]
					if node == nil then
						node = self.m_maskDepthMap[info[2]]
					end
				end
			end
		end
		if info[7] and info[7] ~= 0 and node then
			self.m_mainBody:__processNodeCallback(info[7],node)
		end
		if info[4] ~= 0 and node then
			node:__setMatrix(unpack(info[4]))
		end
		if info[5] ~= 0 and node then
			node:__setColor(unpack(info[5]))
		end
		if info[8] and info[8] ~= -1 and node then
			node:__setBlend(info[8])
		end
	elseif info[1] == 3 then
		local lastSprite = self.m_spriteDepthMap[info[2]]
		if lastSprite then
			local maskLayer = self:__findMaskLayer(info[2])
			if maskLayer then
				maskLayer:__removeContent(info[2])
			else
				self:removeChild(lastSprite)
			end
			lastSprite:setVisible(false)
			lastSprite:__setColor(1,1,1,1,0,0,0,0)
			lastSprite:__setBlend(0)
			self.m_spriteDepthMap[info[2]] = nil
		end
		local lastMask = self.m_maskDepthMap[info[2]]
		if lastMask then
			local contents = lastMask:__getContents()
			for k,v in pairs(contents) do
				self:addChild(v)
			end
			delete(lastMask)
			self.m_maskDepthMap[info[2]] = nil
		end
	end
end
function MC:__resume_childs()
	for k,v in pairs(self:getChildren()) do
		if v.__resume then
			v:__resume()
		end
	end
end
function MC:__resume()
	if self.m_currFrame > self.m_totalFrame then
		if self.m_totalFrame == 1 then
			self:__resume_childs()
			return
		end
		self:__resetSprite()
		self.m_currFrame = 1
	end
	local frameInfo = self.m_frameInfo[self.m_currFrame]
	for i = 1,#frameInfo do
		local info = frameInfo[i]
		self:__parseTags(info)
	end
	self:__resume_childs()
	self.m_currFrame = self.m_currFrame + 1
end
function MC:dtor()
	self:__resetSprite()
end
-----------------------------------
function Mask:ctor(maskDepth,clipDepth,blend)
	self.m_maskLayer = new(Node)
	self.m_contentLayer = new(Node)
	self:addChild(self.m_maskLayer)
	self:addChild(self.m_contentLayer)
    
    local maskWg = nil
    
    maskWg = self.m_maskLayer:getWidget()
	
    local contentWg = self.m_contentLayer:getWidget()
	maskWg.double_sided = true
	local rc = RenderContext(Image2dMask_Shader)
    local rcBlend = RenderContext(maskBlend)
    

    local blendMask = function (_,canvas)
        if self.m_mask then
            maskWg = self.m_mask:getWidget()
        end
        canvas:add(PushStencil())    
        canvas:begin_rc(rc)
        maskWg:draw(canvas)
        canvas:end_rc(rc)
        
        canvas:add(UseStencil(gl.GL_EQUAL))
        canvas:add(PushBlendFunc(gl.GL_ZERO,gl.GL_ONE,gl.GL_ONE,gl.GL_ZERO))
        maskWg:draw(canvas)
        canvas:add(PopBlendFunc())
        
           
        canvas:begin_rc(rcBlend)
        canvas:add(PushBlendFunc(gl.GL_ONE,gl.GL_ONE_MINUS_SRC_ALPHA,gl.GL_ZERO,gl.GL_ONE))
        canvas:add(BindTexture(Window.instance().root.fbo.texture,1) )
        contentWg:draw(canvas) 
        canvas:add(PopBlendFunc())
        canvas:end_rc(rcBlend)
        
    
        canvas:add(UnUseStencil())
        maskWg:draw(canvas)
        canvas:add(PopStencil())   
    end

    local stencilMask = function (_,canvas)
        if self.m_mask then
            maskWg = self.m_mask:getWidget()
        end
        canvas:add(PushStencil())    
        canvas:begin_rc(rc)
		canvas:add(SetState("discardRange",Shader.uniform_value_float(0.5)))
        maskWg:draw(canvas)
        canvas:end_rc(rc)
        
        canvas:add(UseStencil(gl.GL_EQUAL))
        contentWg:draw(canvas) 
      
        canvas:add(UnUseStencil())
        maskWg:draw(canvas)
        canvas:add(PopStencil())   
    end

    if blend == true then
        self:getWidget().lua_do_draw = blendMask
    else
        self:getWidget().lua_do_draw = stencilMask
    end

    self:getWidget():invalidate()
	self.m_maskDepth = maskDepth
	self.m_clipDepth = clipDepth
	self.m_contents = {}
end
function Mask:__setMask(mask)
	self.m_maskLayer:removeAllChildren()
	self.m_maskLayer:addChild(mask)
	self.m_mask = mask
end
function Mask:__changeImg(imgName)
	self.m_mask:setFile(self.m_imgPinMap[imgName])
	self.m_mask:setSize(self.m_mask.m_res.m_width,self.m_mask.m_res.m_height)
end
function Mask:__isContent(depth)
	return depth > self.m_maskDepth and depth <= self.m_clipDepth
end
function Mask:__setMatrix(a,b,c,d,sx,sy)
	sx = sx * System.getLayoutScale()
	sy = sy * System.getLayoutScale()
    drawing_set_force_matrix(self.m_maskLayer.m_drawingID,1,a,b,0,0,c,d,0,0,0,0,1,0,sx,sy,0,1)
end
function Mask:__setColor(r,g,b,a,offsetR,offsetG,offsetB,offsetA)
end
function Mask:__addContent(sprite,depth)
	self.m_contentLayer:addChild(sprite)
	sprite:setName("n_" .. depth)
	sprite:setLevel(depth)
	self.m_contents[depth] = sprite
end
function Mask:__getContentByDepth(depth)
	return self.m_contentLayer:getChildByName("n_" .. depth)
end
function Mask:__removeContent(depth)
	local sprite = self.m_contentLayer:getChildByName("n_"..depth)
	if sprite then
		self.m_contentLayer:removeChild(sprite)
	end
	self.m_contents[depth] = nil
	return sprite
end
function Mask:__getContents()
	return self.m_contents
end
function Mask:__resume()
	if self.m_mask then
		self.m_mask:__resume()
	end
	for k,v in pairs(self.m_contents) do
		if v.__resume then
			v:__resume()
		end
	end
end
function Mask:dtor()
	if self.m_maskLayer then
		delete(self.m_maskLayer)
	end
	self.m_maskLayer = nil
	self.m_mask = nil
	if self.m_contentLayer then
		delete(self.m_contentLayer)
	end
	self.m_contents = nil
	self.m_contentLayer = nil
	self:removeAllChildren()
end
------------------------------------
function Swf:ctor(swfInfo,pinMap)
	super(self)
	self.m_swfInfo = swfInfo
	self.m_perTime = 1/swfInfo["fps"]
	self.m_playTimes = 0
	self.m_passTime = 0
	self.m_repeatCount = -1
	self.m_mainBody = self
	self.m_maskDepthMap = {}
	self.m_spriteDepthMap = {}
	self.m_spriteMap = {}
	self.m_currFrame = 0
	self.m_totalFrame = swfInfo["frames"]
	self.m_bitmapCidMap = {}
	self.m_movieClipCidMap = {}
	self:setSize(swfInfo["width"],swfInfo["height"])
	self.m_startFrame = 1
	self.m_endFrame = swfInfo["fnum"]
	self.m_imgPinMap = pinMap or _G[swfInfo["imagePinMapName"]]
	assert(self.m_imgPinMap ~= nil,swfInfo["imagePinMapName"])
	self.m_imgCache = nil
    self:getWidget():set_shared_shader(colorShader)
    self.m_count = 0
end
function Swf:setPinMap(pinMap)
	self.m_imgPinMap = pinMap
end
function Swf:__getImageNameByCid(cid)
	return self.m_swfInfo["imageName"] .. "_" .. self.m_bitmapCidMap[cid] .. ".png"
end
function Swf:__getNodeByCid(cid)
	local mcInfo = self.m_movieClipCidMap[cid]
	if mcInfo then
		local mc = new(MC,cid,mcInfo,self)
		return mc
	else
		local bitmapId = self.m_bitmapCidMap[cid]
		if bitmapId then
			local imgName = self:__getImageNameByCid(cid)
			if self.m_imgCache == nil then
				self.m_imgCache = new(Image,self.m_imgPinMap[imgName])
			end
			local sprite = new(Sprite,imgName,self.m_imgPinMap)
			self.m_count = self.m_count + 1
			return sprite
		end
	end
end
function Swf:__resetSprite()
	MC.__resetSprite(self)
	self.m_bitmapCidMap = {}
	self.m_movieClipCidMap = {}
end
-- 设置完成事件回调
function Swf:setCompleteEvent(obj, func)
    self.m_completeCallback = self.m_completeCallback or {}
	self.m_completeCallback.obj = obj
	self.m_completeCallback.func = func
end
--设置帧事件，到第frame帧会调用
function Swf:setFrameEvent(obj,func,frame)
	self.m_frameCallback = self.m_frameCallback or {}
	self.m_frameCallback[frame] = {}
	self.m_frameCallback[frame].obj = obj
	self.m_frameCallback[frame].func = func
end
function Swf:setNodeCallback(nodeName,obj,func)
	self.m_nodeCallback = self.m_nodeCallback or {}
	self.m_nodeCallback[nodeName] = {}
	self.m_nodeCallback[nodeName].obj = obj
	self.m_nodeCallback[nodeName].func = func
end
function Swf:__processFrameEvent(frame)
	if self.m_frameCallback and self.m_frameCallback[frame] then
		if self.m_frameCallback[frame].obj and self.m_frameCallback[frame].func then
            self.m_frameCallback[frame].func(self.m_frameCallback[frame].obj,frame)
        end
	end
end
function Swf:__processNodeCallback(nodeName,node)
	if self.m_nodeCallback and self.m_nodeCallback[nodeName] then
		if self.m_nodeCallback[nodeName].func then
            self.m_nodeCallback[nodeName].func(self.m_nodeCallback[nodeName].obj,nodeName,node)
        end
	end
end
-- 获取某两帧之间的时间
function Swf:getTimeBetween(startFrame,endFrame)
	endFrame = endFrame or self.m_swfInfo["fnum"]
	assert(startFrame < endFrame,"the startFrame must small then endFrame")
	return (endFrame - startFrame + 1) * self.m_perTime
end
function Swf:playBetween(startFrame,endFrame,repeatCount)
	self:__resetSprite()
	self.m_currFrame = 0
	self:gotoAndStop(startFrame)
	self.m_currFrame = startFrame - 1
	self.m_startFrame = startFrame
	self.m_endFrame = endFrame
	self.m_repeatCount = repeatCount or -1
	self.m_playTimes = 0
	if startFrame < endFrame then
		self:__startTimer()
	end
end
function Swf:resetPlayInfo(startFrame,endFrame,repeatCount)
	self.m_startFrame = startFrame or self.m_startFrame
	self.m_endFrame = endFrame or self.m_endFrame
	self.m_repeatCount = repeatCount or self.m_repeatCount or -1
end
--暂停。frame为停在第几帧，默认为当前帧
function Swf:pause(frame,isVisible)
	self:__stopTimer()
	local f = frame or self.m_currFrame or 1
	self:gotoAndStop(f)
	if isVisible == false then
		self:setVisible(false)
	end
end
--仅用于暂停之后的继续播放
--frame 从第几帧开始继续播放。如果从暂停那帧开始播放，传nil即可。
--isResetPlayTimes  是否重置已播放次数
function Swf:playContinue(frame,isResetPlayTimes)
	local f = frame or self.m_currFrame + 1 or 1
	self.m_currFrame = f - 1
	self:setVisible(true)
	if isResetPlayTimes == true then
		self.m_playTimes = 0
	end
	self:__startTimer()
end
function Swf:gotoAndStop(frame)
	frame = math.floor(frame)
	if self.m_currFrame > frame then
		self.m_currFrame = 0
		self:__resetSprite()
		for i = 1,frame do
			self:__onTimer()
		end
		return
	elseif self.m_currFrame == frame then
		return
	else 
		for i = 1, frame - self.m_currFrame do
			self:__onTimer()
		end
	end
end
function Swf:play(frame,isKeep,repeatCount,delay,autoClean,blend)
	self:__resetSprite()
	if frame and frame > 1 then
		self:gotoAndStop(frame)
	end
	if not frame then frame = 1 end
	self.m_currFrame = frame - 1
	self.m_startFrame = frame
	self.m_endFrame = self.m_swfInfo["fnum"]
	self.m_repeatCount = repeatCount or 1
	self.m_isKeep = isKeep
	self.m_delay = delay or -1
	self.m_autoClean = autoClean
	self:__startTimer()
	self.m_playTimes = 0
	self.m_blend = blend
end
function Swf:__stop()
	self:__stopTimer()
	self.m_passTime = 0
	if self.m_completeCallback then
        if self.m_completeCallback.obj and self.m_completeCallback.func then
            self.m_completeCallback.func(self.m_completeCallback.obj)
        end
    end
    if self.m_isKeep ~= true and self.m_autoClean ~= false then
		delete(self)
	end
end
function Swf:__startTimer()
	self:__stopTimer()
 	self.m_passTime = 0
 	self.m_clock = Clock.instance():schedule(function(dt)
 			self:__update(dt)
 		end)
end
function Swf:__stopTimer()
	if self.m_clock then
		self.m_clock:cancel()
		self.m_clock = nil
	end
end
function Swf:__isNeedRepeat()
	return self.m_repeatCount <= 0 or self.m_playTimes < self.m_repeatCount
end
function Swf:__update(dt)
	if dt then
		self.m_passTime = self.m_passTime + dt
		if self.m_passTime < self.m_perTime then
			return
		end
		self.m_passTime = self.m_passTime - self.m_perTime
	end
	self:__onTimer()
end
function Swf:__onTimer()
	if self.m_isReleased == true then
		return
	end
	self.m_currFrame = self.m_currFrame + 1
	if self.m_currFrame > self.m_endFrame then
		self.m_playTimes = self.m_playTimes + 1
		local isRepeat = self:__isNeedRepeat()
		if self.m_isKeep ~= true or isRepeat then
			self:__resetSprite()
			self.m_currFrame = 0
			if isRepeat then
				self:gotoAndStop(self.m_startFrame)
			end
	  end
   	if isRepeat ~= true then
			self:__stop()
		end
		return
	end
	local frameInfo = self.m_swfInfo["frames"][self.m_currFrame]
	if not frameInfo then
		self:__stop()
		return
	end
	for i = 1,#frameInfo do
		local info = frameInfo[i]
		if info[1] == 1 then
			if info[3] == -1 then
				self.m_movieClipCidMap[info[2]] = info[4]
			else
				self.m_bitmapCidMap[info[2]] = info[3]
			end
		else
			self:__parseTags(info)
		end
	end
	for k,v in pairs(self:getChildren()) do
		if v.__resume then
			v:__resume()
		end
	end
	self:__processFrameEvent(self.m_currFrame)
end
function Swf:__setBlend(blendMode)
	-- body
end
function Swf:dtor()
	self.m_isReleased = true
	self:__stopTimer()
	self:__resetSprite()
	if self.m_imgCache then
		delete(self.m_imgCache)
		self.m_imgCache = nil
	end
end
local SwfNode = class(Node)
function SwfNode:ctor(swfInfo,pinMap)
	self.m_swf = new(Swf,swfInfo,pinMap)
	self:addChild(self.m_swf)
	self:setSize(swfInfo["width"],swfInfo["height"])
end
function SwfNode:setPinMap(pinMap)
	if self.m_swf then
		self.m_swf:setPinMap(pinMap)
	end
end
-- 设置完成事件回调
function SwfNode:setCompleteEvent(obj, func)
	if self.m_swf then
  	self.m_swf:setCompleteEvent(obj,func)
  end
end
--设置帧事件，到第frame帧会调用
function SwfNode:setFrameEvent(obj,func,frame)
	if self.m_swf then
		self.m_swf:setFrameEvent(obj,func,frame)
	end
end
function SwfNode:setNodeCallback(nodeName,obj,func)
	if self.m_swf then
		self.m_swf:setNodeCallback(nodeName,obj,func)
	end
end
-- 获取某两帧之间的时间
function SwfNode:getTimeBetween(startFrame,endFrame)
	if self.m_swf then
		return self.m_swf:getTimeBetween(startFrame,endFrame)
	end
end
function SwfNode:playBetween(startFrame,endFrame,repeatCount)
	if self.m_swf then
		self.m_swf:playBetween(startFrame,endFrame,repeatCount)
	end
end
function SwfNode:resetPlayInfo(startFrame,endFrame,repeatCount)
	if self.m_swf then
		self.m_swf:resetPlayInfo(startFrame,endFrame,repeatCount)
	end
end
--暂停。frame为停在第几帧，默认为当前帧
function SwfNode:pause(frame,isVisible)
	if self.m_swf then
		self.m_swf:pause(frame,isVisible)
	end
end
--仅用于暂停之后的继续播放
--frame 从第几帧开始继续播放。如果从暂停那帧开始播放，传nil即可。
--isResetPlayTimes  是否重置已播放次数
function SwfNode:playContinue(frame,isResetPlayTimes)
	if self.m_swf then
		self.m_swf:playContinue(frame,isResetPlayTimes)
	end
end
function SwfNode:gotoAndStop(frame)
	if self.m_swf then
		self.m_swf:gotoAndStop(frame)
	end
end
function SwfNode:play(frame,isKeep,repeatCount,delay,autoClean,blend)
	if self.m_swf then
		self.m_swf:play(frame,isKeep,repeatCount,delay,autoClean,blend)
	end
end
function SwfNode:dtor()
	if self.m_swf then
		self.m_swf:dtor()
	end
	self.m_swf = nil
end
function SwfNode:stop()
	if self.m_swf then
		self.m_swf:__stop();
	end
end
return SwfNode