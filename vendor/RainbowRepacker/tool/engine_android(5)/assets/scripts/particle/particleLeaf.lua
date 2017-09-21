
require("particle/particleBase");

--ParticleLeaf --粒子类
ParticleLeaf = class(ParticleBase);

ParticleLeaf.liveTime = 8;    --粒子生命时长

ParticleLeaf.init = function(self, len, index, node, repeat_or_loop_num)
    local moredata = node:getMoreData();
    if not moredata.repeat_or_loop_num then
        moredata.repeat_or_loop_num = repeat_or_loop_num;
    end
    
    self.m_fade = math.random()/100.0+0.05;--衰减速度
    self.m_active = true;--是否激活状态
    self.m_orgRot = moredata.rotation;
    if self.m_orgRot and math.random()>0.5 then
        self.m_orgRot=-self.m_orgRot;
    end
    self.m_live = moredata.liveTime or ParticleLeaf.liveTime;--粒子生命
    self.m_frame = math.ceil(self.m_live/self.m_fade);
    --移动速度
    self.m_yi = 4.5;
    self.m_xi = math.random()*1.0*(math.random()>0.5 and 1 or -1);
    -- 加速度
    self.m_xg = math.random()*0.2*(math.random()>0.5 and 1 or -1);
    self.m_yg = -math.random()*0.05;
    self.m_alpha = 1.0;
    --初始位置
    local h = moredata.h;
    local w = moredata.w;
    self.m_maxH = h*2/3;
    self.m_x = math.random(w);
    self.m_y = -math.random(h);
    self.m_scale = moredata.scale or 1.0;
    self.m_tick = 0;
    self.m_rotation = moredata.rotation or 0

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
ParticleLeaf.update = function(self)
    if self.m_active then
        self.m_tick = self.m_tick + 1;
        if self.m_tick>self.m_frame then self.m_tick = self.m_frame;end
        self.m_alpha = 1.2-self.m_tick/self.m_frame;
        
        --重新设定粒子在屏幕的位置
        self.m_x = self.m_x + self.m_xi; 
        self.m_y = self.m_y + self.m_yi; 
        -- 更新X,Y轴方向速度大小
        self.m_xi = self.m_xi + self.m_xg;
        self.m_yi = self.m_yi + self.m_yg;
        if self.m_xi>5 then self.m_xg = -0.3;end
        if self.m_xi< -5 then self.m_xg = 0.3;end
        if self.m_yi<2.2 then self.m_yi=2.2;end

        self.m_rotation = self.m_rotation+(self.m_orgRot or 0);

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
