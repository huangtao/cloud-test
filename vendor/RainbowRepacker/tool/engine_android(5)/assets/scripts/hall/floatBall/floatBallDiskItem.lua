local floatBallDiskItem = require(ViewPath .. "hall/floatBall/floatBallDiskItem");

local FloatBallDiskItem =  class(CommonGameLayer,false);

FloatBallDiskItem.Delegate = {
    onFloatBallDiskItemClick = "onFloatBallDiskItemClick";
}


FloatBallDiskItem.ctor = function(self, data,p_privateScoller)
    super(self, floatBallDiskItem);
    self:declareLayoutVar(ViewPath.."hall/floatBall/floatBallDiskItem".."_layout_var");
    CommonGameLayer.setSize(self,self.m_root:getSize() );
    self.m_data = data;
    self.mm_privateScoller = p_privateScoller;
    self:_init();
end

FloatBallDiskItem._init = function(self)
    --self:updateRemainTime();
    self.m_lightImage = self:findViewById(self.s_controls.Image_light);
    self.m_Image_bg = self:findViewById(self.s_controls.Image_bg);
    self.m_Image_ads = self:findViewById(self.s_controls.Image_ads);
    self.m_lightImage:setVisible(false);

    if not string.isEmpty(self.m_data.image) then
        ImageCache.getInstance():request(self.m_data.image, self, self.__onIconDownloaded);
    end
end

FloatBallDiskItem.setSize = function(self,p_w,p_h)
    CommonGameLayer.setSize(self,p_w,p_h);
    CommonGameLayer.setSize(self.m_Image_bg,p_w,p_h);
    CommonGameLayer.setSize(self.m_Image_ads,p_w,p_h);
    CommonGameLayer.setSize(self.m_lightImage,p_w,p_h);
end

FloatBallDiskItem.setColor = function(self,r,g,b)
    CommonGameLayer.setColor(self.m_Image_bg,r,g,b);
    CommonGameLayer.setColor(self.m_Image_ads,r,g,b);
    CommonGameLayer.setColor(self.m_lightImage,r,g,b);
end

--@brief 刷新剩余时间
--@return true 代表时间已经超出，需要将这个item移除
--        false 代表刷新成功
-- FloatBallDiskItem.updateRemainTime = function(self)
--     local desc = self.m_data.desc
--     local endtime = self.m_data.starttime
--     local nowtime = kAppData:getRightTimeWithServer()
--     local timespan = os.difftime(endtime, nowtime)
--     local subDesc = ""
--     local bTimeEnd = false;
--     if endtime > 0 then
--         --截止时间大于0，才代表存在倒计时
--         if timespan > 0 then
--             local hour = math.floor(timespan / 3600)
--             if hour < 24 then
--                 local minute = math.floor(timespan % 3600 / 60)
--                 local second = math.floor(timespan % 3600 % 60)
--                 subDesc = string.format("%02d:%02d:%02d", hour, minute, second) 
--             else
--                 subDesc = string.format("还剩%s天", ToolKit.getDayInterval(nowtime, endtime))
--             end
--     	else
--     		bTimeEnd = true;
--         end
--     end

--     desc = string.format("%s\n%s", desc, subDesc)

--     self:findViewById(self.m_ctrl.desc):setText(desc)
--     return bTimeEnd
-- end

FloatBallDiskItem.__onIconDownloaded = function(self, url,fileName)
    if not string.isEmpty(fileName) then
        self:findViewById(self.s_controls.Image_ads):setFile(fileName);
    end
end

FloatBallDiskItem.onItemBoxBtnClick = function(self, finger_action, x, y, drawing_id_first, drawing_id_current)
    Log.v("FloatBallDiskItem.onItemBoxBtnClick", self.m_data.jumpcode);
    if finger_action == kFingerDown then
        self.m_max_move = 0;
        self.m_startX = x;
        self.m_startY = y;
    elseif finger_action == kFingerMove then
        local __movY = y - self.m_startY;
        local __movX = x - self.m_startX;
        local __move_distance = math.sqrt(__movY*__movY + __movX*__movX);
        self.m_max_move = __move_distance > self.m_max_move and __move_distance or self.m_max_move;
    else
        if self.m_max_move < 2 then

            local __object = self.mm_privateScoller:getMiddleObject();
            if __object ~= self then
                self.mm_privateScoller:setMiddleByObject(self);
                return;
            end

            UBReport.getInstance():report(UBConfig.kFloatBallItemClick, string.format("itemId%s", self.m_data.sortNum));
            local name = FloatBallDataInterface:getInstance():getSceneName();
            UBReport.getInstance():report(UBConfig.kFloatBallJumpClick, string.format("scene:%s",name));
            local jumpcode = json.decode(self.m_data.jumpcode);
            self:execDelegate(FloatBallDiskItem.Delegate.onFloatBallDiskItemClick, jumpcode);
        end
    end
end

return FloatBallDiskItem;