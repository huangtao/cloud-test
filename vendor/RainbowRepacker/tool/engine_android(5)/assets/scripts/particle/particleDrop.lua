require("particle/particleBase");

--ParticleDrop --粒子类
--爆炸喷发
ParticleDrop = class(ParticleBase);

ParticleDrop.liveTime = 8;	--粒子生命时长
ParticleDrop.colortable = {{1.0,1.0,1.0,1.0},{1.0,1.0,1.0,1.0},{1.0,1.0,1.0,1.0},{1.0,1.0,1.0,1.0},{1.0,1.0,1.0,1.0},{1.0,1.0,1.0,1.0},{1.0,1.0,1.0,1.0},
								{1.0,1.0,1.0,1.0},{1.0,1.0,0.0,1.0},};

ParticleDrop.init = function(self, len, index, node)
    local moredata = node:getMoreData();
	self.m_fade = (math.random()*100)/1000.0 +0.05;--衰减速度
	self.m_active  = true;		--是否激活状态
 	self.m_live = moredata.liveTime or ParticleDrop.liveTime;--粒子生命
 	local h = moredata.h;
    local w = moredata.w;
 	self.m_frame = math.ceil(self.m_live/self.m_fade);
 	self.m_yi = math.random(h)/self.m_frame;
	if math.random(10) > 5 then self.m_yi = -self.m_yi;end 
	self.m_alpha = 1.0;
	--移动速度/方向
	self.m_y0 = node.y0;
	self.m_x = math.random(1, moredata.w);--起始横坐标
	self.m_y = 0;--self.m_y0;--起始纵坐标
	self.m_scale = 1;
	self.m_tick = 0;
    --node:setParPos(self.m_x, self.m_y, self.m_scale, len);
    --node:setParColor(self.colortable, self.m_alpha, len);
 	self.m_xi = 0;--math.random(w)/self.m_frame;

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
ParticleDrop.update = function(self)
    if self.m_active then  --激活
        
        --重新设定粒子在屏幕的位置
    	self.m_x = self.m_x + self.m_xi;
    	self.m_y = self.m_y + self.m_yi; 
     
        -- 减少粒子的生命值
        self.m_live = self.m_live - self.m_fade;

        -- 如果粒子生命小于0
        -- 减少粒子的生命值

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