
-- particleSystem.lua
-- Author: Williamwu
-- Date: 2013-04-10
-- Last modification : 2013-10-10
-- Description: Particle Manager


-- require("libs/bit");
require "core.system"

ParticleSystem = class();

kParticleTypeForever = 1;
kParticleTypeBlast	 = 2;

ParticleSystem.s_instance = nil;

-- fix bugs
-- @self.m_vertexArr 少一组数据, 目前是在末尾补充 4 个 0 点.
-- @self.m_colorArr 少一组数据, 目前是在末尾补充 4 个 1111 颜色点.

-- 粒子系统调用方法
-- ParticleSystem.getInstance():create(file, particle, x0, y0, color, parType,maxNum, moredata)
-- @file 粒子效果文件名,可以为单个文件或者拼图
--           如果是拼图类型,请确保拼图文件名为1.png, 2.png 等从 i = i, maxIndex 的"i.png" 
--           !!!请不要修改 ParticleSystem 去适配拼图文件,请修改拼图文件适配 ParticleSystem
-- @particle 粒子效果类型,如 ParticleFireWork, ParticleMoney 等等
-- @x0 @y0 粒子的位置坐标,用于下一次更新粒子的位置坐标,主要是每一个粒子特效类型中的 init, update方法使用.
--           一般设置为0, 0
-- @color 实际上是设置粒子的透明度,nil为不设置透明度(即设置alpha通道为1.0),非nil非false值表示设置透明度,1.0为不透明,0.0为全透.
--           一般设置为 nil 或者 true
-- @parType :kParticleTypeBlast 和 kParticleTypeForever 需要注意的是,同样的代码,仅仅是parType不同,效果也将不同.
--           @kParticleTypeBlast 为一次性粒子效果
--           @kParticleTypeForever 为永久粒子效果
-- @maxNum   粒子的最大数目.不设置即为40.
-- @moredate 粒子更多的信息, 主要有
--			 @h 设置粒子的活动高度
--           @w 设置粒子的活动宽度
--           @rotation 设置粒子的旋转角度
--           @maxIndex 当file为拼图时,设置拼图中图片数目,一定要如实设置.
--           @scale 设置粒子的缩放大小. 一般不要设置放大,会出现锯齿等.

-- 粒子系统调用顺序.
-- 调用 ParticleSystem.create(...) 产生 ParticleNode.
-- ParticleNode 调用 ctor 产生 ParticleNode
-- 根据 parType, ParticleNode 在 ctor 过程中决定是否要调用 ParticleNode.generate(...) 方法(仅 kParticleTypeBlast 会调用).
-- 定时器启动, 调用 ParticleSystem.update(...) 方法, 粒子的 update 方法在其中调用.
--             之后会调用 ParticleNode.generate(...) 方法, 粒子的 init 方法在其中调用.

-- 粒子的 index, coord, 均在第一次生成. 此时 vertex 为空, 故会造成 lua 数组越界BUG. 在粒子数目较多时, 会出现白条等花屏等现象.
-- 故在 ParticleNode.generate(...) 方法中补充以下语句. 在每一次的 vertex 数组后面补上 4个 0坐标.
  -- 	   for i = 1, 8 do
  --           self.m_vertexArr[len*8 + i] = 0
  --       end
  --       res_set_double_array2( self.m_vertexResId,self.m_vertexArr);


-- ----------------------------interface
--得到唯一实例对象
ParticleSystem.getInstance = function()
	if not ParticleSystem.s_instance then 
		ParticleSystem.s_instance = new(ParticleSystem);
	end
	return ParticleSystem.s_instance;
end

--释放唯一实例对象
ParticleSystem.releaseInstance = function()
    delete(ParticleSystem.s_instance);
    ParticleSystem.s_instance = nil;
end

--调用生成一类粒子
ParticleSystem.create = function(self, file, particle, x0, y0, color, parType,maxNum, moredata)
	if not file or not particle then 
		return nil;
	end
	
 	local index = table.maxn(self.m_pars)+1;

 	self.m_pars[index] = new(ParticleNode, index, file, particle, x0, y0, color, parType,maxNum, moredata);

 	return self.m_pars[index];	
end

--停止喷射粒子
ParticleSystem.stopAll = function(self)
	self.m_isStoped = true;
end

--恢复stopAll之前状态
ParticleSystem.startAll = function(self)
	self.m_isStoped = false;
end

ParticleSystem.isStop = function(self)
	return self.m_isStoped
end

--暂停刷新粒子
ParticleSystem.pauseAll = function(self)
	self.m_isPaused = true;
	for i,v in ipairs(self.m_pars) do
		v:pause()
	end
end

--恢复pauseAll之前状态
ParticleSystem.resumeAll = function(self)
	self.m_isPaused = false;
	for i,v in ipairs(self.m_pars) do
		v:resume()
	end
end

--停止并擦除现有粒子效果
ParticleSystem.escape = function(self,node)
	if not node then
		return 
	end
	delete(node)
end

-------------------------private
ParticleSystem.ctor = function(self)
    self.m_pars = {};
	self.m_tick = 0;
    self.m_isStoped = false;
	self.m_isPaused = false;
end

ParticleSystem.dtor = function(self)
	for k, v in pairs(self.m_pars or {}) do
		local parent = v:getParent();
		if parent then
			parent:removeChild(v);
		end
		delete(v);
	end
	self.m_pars = nil;
end

ParticleSystem.remove = function(self, index)
	self.m_pars[index] = nil;
end



local loadUnit = function ( filename,max )
    local tex 
    local units = {}
    if type(filename) == "table" then
        tex = TextureCache.instance():get(filename["1.png"].file)
        for i=1,max do
            local index  = ""..i..".png"
            units[i] = TextureUnit(tex)
            units[i].rect = Rect(filename[index].x,filename[index].y,filename[index].utWidth or filename[index].width,filename[index].utHeight or filename[index].height)
        end
    else
        tex = TextureCache.instance():get(filename)
        units[1] = TextureUnit(tex)
    end
    return units
end

--------------------
ParticleNode = class(Node);

ParticleNode.ctor = function(self, index, file, particle, x0, y0, color, parType, maxNum, moredata)
	self.m_index = index;
 	self.m_fileName = file;
 	self.m_particle = particle;
	self.m_x0 = x0;
 	self.m_y0 = y0;
 	--color暂时没用
 	self.m_color = color;
	self.m_type = parType==kParticleTypeBlast and kParticleTypeBlast or kParticleTypeForever;
	self.m_maxNum = maxNum or 40;
 	self.m_moredata = moredata;
 	self.m_newNum = 0;
 	self.m_stepNum = moredata and moredata.stepNum or 3;

 	self.m_particles = {};

 	local max_index = moredata and moredata.maxIndex or 1
 	self.unit = loadUnit(self.m_fileName,max_index)


    self.m_isStoped = false
	if self.m_type == kParticleTypeBlast then 
		
		for i = 1, self.m_maxNum do
	    	self:generate();
		end
		self.m_isPaused = true;
	end
	if type(self.m_fileName) == "table" then
		self._texture =TextureCache.instance():get(self.m_fileName["1.png"].file)
	else
		self._texture =TextureCache.instance():get(self.m_fileName)
	end
	self:getWidget().relative = true

    local root_size = Window.instance().drawing_root.size
    self:setSize(root_size.x / System.getLayoutScale(),root_size.y / System.getLayoutScale())

    self:getWidget().on_cleanup = function (  )
        Log.v("ParticleSystem on_cleanup " .. tostring(Clock.now()))
    end

end



ParticleNode.generate = function(self, step)
	if self.m_isStoped then 
		return;
	end
    local par, len, particles;
    particles = self.m_particles;
   	for loop = 1, #particles do 
		 if not particles[loop].m_active then 
		 	par = particles[loop];
		 	len = loop - 1;
		 	break;
		 end
	end
	
	if par == nil then 
	    len = #particles;
		par = new(self.m_particle, self.unit)
		particles[len+1] = par;
	end
	par:init(len, index, self, step);
end

--停止喷射粒子
ParticleNode.stop = function(self)
	self.m_isStoped = true;
    self:pause();
end

--开始喷射粒子
ParticleNode.start = function(self)
	self.m_isStoped = false;
    self:resume();
end

--暂停刷新粒子
ParticleNode.pause = function(self)
	self._handle.paused = true
end

--恢复刷新粒子
ParticleNode.resume = function(self)
	if not self._handle then
		self._loop_count = 0
		self._handle = Clock.instance():schedule(function ( ... )
			self._loop_count = self._loop_count + 1
			self:update(self._loop_count)
		end)
	end
	self._handle.paused = false
end


ParticleNode.getMoreData = function(self)
	return self.m_moredata;
end

ParticleNode.getFileName = function(self)
	return self.m_fileName;
end
ParticleNode.getMaxNum = function ( self )
	return self.m_maxNum
end
ParticleNode.getMaxActive = function ( self )
	return self.m_activeNum or 0
end

ParticleNode.setAlign = function(self)
end

ParticleNode.update = function ( self )
	local rets = {BindTexture(self._texture)}
	self.m_activeNum = 0;
	for i,par in ipairs(self.m_particles) do
		if par.m_active then
			self.m_activeNum = self.m_activeNum + 1
			local ret = par:update()
			if ret then
				table.insert(rets, ret )
			end
		end
	end
	if not (self.m_isStoped or ParticleSystem.getInstance():isStop()) then
    	if self.m_type == kParticleTypeBlast then 
    		for i = 1, self.m_maxNum do
	        	self:generate(self._loop_count);
    		end
    		self.m_isStoped = true;
	    elseif self.m_activeNum < self.m_maxNum then 
	        self:generate(self._loop_count);
	    end
	end
	if #rets > 0 then
        Log.v("ParticleSystem update " ..tostring(self:getWidget()) .."   "..tostring(Clock.now()))
        if self and self:getWidget() then
            self:getWidget().pre_instructions = rets
        end
    end
    if self.m_activeNum <= 0 and self.m_type ~= kParticleTypeForever then
    	self._handle:cancel()
    	self._handle = nil
    	delete(self)
    end
end
ParticleNode.dtor = function(self)
	for k, v in pairs(self.m_particles or {}) do
		delete(v);
		v = nil;
	end
	self.m_particles = nil;
	self.m_isStoped = true;
    Log.v("ParticleSystem dtor " ..tostring(self._handle) .."   "..tostring(Clock.now()))
	if self._handle then
		self._handle:cancel()
		self._handle = nil
	end
	

	ParticleSystem.getInstance():remove(self.m_index);
end

local old_setPos = ParticleNode.setPos
ParticleNode.setPos = function ( self ,x,y)
    old_setPos(self,x,y)
    if not self._child then
        self._child = Widget()
        self._child.size = Window.instance().drawing_root.size
        self:getWidget():add(self._child)
        -- self._child.lua_on_enter = function ( ... )
        --     self._child.pos = Point(-x ,-y )
        -- end
    end
    -- print(self:getPos())
    -- Clock.instance():schedule_once(function ( ... )
    --     self:getWidget():print_tree()
    -- end)
    -- 
    self._child.pos = Point(-x  ,-y )
    -- self._child.background_color = Colorf(1.0,1.0,1.0,0.1)
    -- print(tostring(self:getWidget():from_world(Point(0,0))))
    -- self:getWidget().background_color = Colorf(0.0,1.0,1.0,0.1)
end
