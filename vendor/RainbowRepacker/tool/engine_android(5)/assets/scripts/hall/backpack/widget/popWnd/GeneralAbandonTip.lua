-- GenernalAbandonTip.lua
-- Author:Demon
-- Date:2016/3/17
-- Last modification:
-- Description:老背包的道具物品丢弃操作的二次确认弹窗
-- Note:
require("hall/backpack/data/backpackDataInterface");

local hallLayerBaseWithName = require("hall/widget/hallLayerBaseWithName")
local GenernalAbandonTip = class(hallLayerBaseWithName,false);
GenernalAbandonTip.s_layerName = "case_abandonTips";

GenernalAbandonTip.ctor = function(self,p_data)	

    local __layout = require(ViewPath .. "hall/newObjectCase/abandonTips");
    super(self,__layout,nil,GenernalAbandonTip.s_layerName );
    self:declareLayoutVar(ViewPath.."hall/newObjectCase/abandonTips".."_layout_var");

    self.m_data = p_data;

	self:setFillParent(true, true);
    self:addToRoot();
    self:getHandle();
	self:init();
    self:setListenBackEvent(true);
end

GenernalAbandonTip.dtor = function(self)	

end

--得到相关句柄
GenernalAbandonTip.getHandle = function(self)
    self:getComponent();
    self:runUiAction(UiAnimConfig.ACTION.BEGIN, self.mm_ImageBack);
end	

GenernalAbandonTip.init = function(self)
	ImageCache.getInstance():request(self.m_data.iconPath,self,self.onGetImage);

    self.mm_name:setText(self.m_data.name);
    self.mm_Text_numOrday:setText("数量："..self.m_data.number);
end

GenernalAbandonTip.onGetImage = function(self,url,imagePath)
    local icon = UIFactory.createImage(imagePath);
    if icon then
        local w,h = self.mm_icon:getSize();
        local iconW , iconH = icon:getSize();
        local scaleW = iconW>iconH and w or h*iconW/iconH;
        local scaleH = iconW>iconH and w*iconH/iconW or h;
        icon:setSize(scaleW,scaleH);
        icon:setAlign(kAlignCenter);
        self.mm_icon:addChild(icon);
    end
end



GenernalAbandonTip.oncloseBtnClick = function(self)
    self:close();
end

GenernalAbandonTip.onBindToUse = function(self)
    BackpackDataInterface.getInstance():abandon(self.m_data);
    --self:close();
end


return GenernalAbandonTip;
