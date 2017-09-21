require("particle/particleBase");
--ParticleFlower --粒子类

ParticleFlower = class(ParticleBase);

ParticleFlower.liveTime = 4;	--粒子生命时长

ParticleFlower.init = function(self, len, index, node)
    local moredata = node:getMoreData();
	self.m_fade = (math.random()*100)/1000.0 +0.05;--衰减速度
	self.m_node = node;
	self.m_active  = true;		--是否激活状态
 	self.m_live = moredata.liveTime or ParticleFlower.liveTime;--粒子生命
 	local h = moredata.h;
    local w = moredata.w;
 	self.m_frame = math.ceil(self.m_live/self.m_fade);
 	local yi = 0--h/self.m_frame/20;
 	local xi = 0--w/self.m_frame/20;
	--移动速度/方向
    local active = node:getMaxActive() > self.m_frame and node:getMaxActive() or self.m_frame
	local pos = len/active
    if pos>1 then pos = pos-1;end
	if pos<0.25 then--left
		self.m_xi = -xi;
		self.m_yi = 0;
		self.m_x = 0;
		self.m_y = h*pos*4;
	elseif pos<0.5 then--top
		self.m_xi = 0;
		self.m_yi = -yi;
		self.m_x = w*(pos-0.25)*4;
		self.m_y = 0;
	elseif pos<0.75 then--rights
		self.m_xi = xi;
		self.m_yi = 0;
		self.m_x = w;
		self.m_y = h*(pos-0.5)*4;
	else
		self.m_xi = 0;
		self.m_yi = yi;
		self.m_x = w*(pos-0.75)*4;
		self.m_y = h;
	end

	self.m_scale = math.random();
	if self.m_scale<0.2 then self.m_scale=0.2;end
	self.m_tick = 0;

    -- node:setParPos(self.m_x, self.m_y, self.m_scale, len);
	self.m_rotation = 0;
    self.m_rotStep = moredata.rotation;



    self.unit_index = math.random(10000)%(#self.unit)

    self._instruction = Rectangle(Rect(0,0,self.unit[self.unit_index+1].size.x * System.getLayoutScale(),self.unit[self.unit_index+1].size.y* System.getLayoutScale()), Matrix(), self.unit[self.unit_index+1].uv_rect)
    self._instruction.colorf = Colorf(1.0,1.0,1.0,1.0)
    self._mat = Matrix()

    self.width = self.unit[self.unit_index+1].size.x
    self.height = self.unit[self.unit_index+1].size.y
end

local Rad = math.rad
local Cos = math.cos
local Sin = math.sin
ParticleFlower.update = function(self)
	--匀速移动+旋转
    if self.m_active then  --激活
		self.m_rotation = self.m_rotation+self.m_rotStep;
        -- 返回X，Y轴的位置
        self.m_tick = self.m_tick + 1;
        if self.m_tick > self.m_frame then  self.m_tick = self.m_frame;end
        
        -- 减少粒子的生命值
        self.m_live = self.m_live - self.m_fade;
        self._instruction.colorf = Colorf(1.0,1.0,1.0,self.m_alpha)
        self._instruction.uv_rect = self.unit[self.unit_index+1].uv_rect
        
        

        local rad = Rad(self.m_rotation or 0);         --角度转弧度
        local cosA = Cos(rad);
        local sinA = Sin(rad);
        local w, h = self.width,self.height
        w = w / 2 * self.m_scale ;
        h = h / 2 * self.m_scale;
        -- setForceMatrix的旋转点为父节点位置.如果要绕Image中心点旋转，则需要先平移-w, -h，之后再旋转，再平移w,h
        --下面是x,y最终结果
        local x = -w*cosA + h*sinA + w + self.m_x;
        local y = -w*sinA - h*cosA + h + self.m_y;
        self._mat:load(self.m_scale*cosA,  self.m_scale*sinA, 0, 0,
            -self.m_scale*sinA, self.m_scale*cosA, 0, 0,
            0,     0,    1, 0,
            x,     y,    0, 1)

        self._instruction.matrix = self._mat

        if self.m_live < 0.0 then
            self.m_active = false;
            self.m_scale = 0;
            self._instruction:release()
            return
        else
            return  self._instruction
        end
    end	
end
