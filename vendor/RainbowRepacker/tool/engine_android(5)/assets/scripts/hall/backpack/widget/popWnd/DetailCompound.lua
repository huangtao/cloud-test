-- DetailWidgetOffline.lua
-- Author:Demon
-- Date:2017/1/9
-- Last modification:
-- Description:合成多个物品详情界面
-- Note:

require("common/IPopDialogManager");
require("hall/backpack/data/backpackDataInterface");

local CompoundItem = class(CommonGameLayer,false);

CompoundItem.ctor = function(self,p_data)
    self.m_data = p_data;
    local __layout = require(ViewPath.."hall/newObjectCase/newObjectCaseCompoundItem");
    super(self,__layout);
    self:declareLayoutVar(ViewPath.."hall/newObjectCase/newObjectCaseCompoundItem".."_layout_var");
    self:setSize(self.m_root:getSize());
    self:setSize(650,self.m_data.item_height);
    self.m_root:setAlign(kAlignCenter);
    self:getHandle();
    self:init();
end

CompoundItem.getHandle = function(self)
    self.m_Button_use = self:findViewById(self.s_controls.Button_use);
    self.m_Text_compound_des = self:findViewById(self.s_controls.Text_compound_des);
end

CompoundItem.init = function(self)
    if self.m_data.number >= self.m_data.compoundData.debris_num then
        local __canCompoundCount = math.floor(self.m_data.number/self.m_data.compoundData.debris_num);
        local __remainCount = self.m_data.number - __canCompoundCount*self.m_data.compoundData.debris_num;
        local __desString = string.format("合成%sX%d(剩余%d碎片)",self.m_data.compoundData.target_name,__canCompoundCount,__remainCount);
        self.m_Text_compound_des:setText(__desString);
    else
        local __desString = string.format("合成%s(碎片数量不足)",self.m_data.compoundData.target_name);
        self.m_Text_compound_des:setText(__desString);
        self.m_Text_compound_des:setColor(135,132,129);
        self.m_Button_use:setEnable(false);
    end
end

CompoundItem.onBindToCompound = function(self)
    BackpackDataInterface.getInstance():shardMerge(self.m_data,self.m_data.compoundData.target_id);
end

CompoundItem.dtor = function(self)

end



local hallLayerBaseWithName = require("hall/widget/hallLayerBaseWithName")
local DetailWidgetCompound = class(hallLayerBaseWithName,false);
DetailWidgetCompound.s_layerName = "case_detail_shard";


DetailWidgetCompound.ctor = function(self,p_data)	
    local __layout = require(ViewPath .. "hall/newObjectCase/newObjectCaseCompoundDetail");
    super(self,__layout,nil,DetailWidgetCompound.s_layerName);
    self:declareLayoutVar(ViewPath.."hall/newObjectCase/newObjectCaseCompoundDetail".."_layout_var");
    self.m_data = p_data;
	self:setFillParent(true, true);
    self:addToRoot();
    self:getHandle();
	self:init();
    self:setListenBackEvent(true);
end

DetailWidgetCompound.dtor = function(self)	
	
end

--得到相关句柄
DetailWidgetCompound.getHandle = function(self)
    self:getComponent();
    self:runUiAction(UiAnimConfig.ACTION.BEGIN, self.mm_ImageBack);
end	

DetailWidgetCompound.init = function(self)
    ImageCache.getInstance():request(self.m_data.iconPath,self,self.onGetImage);
    self.mm_name:setText(self.m_data.name);
    self.mm_Text_numOrday:setText("数量： "..self.m_data.number);

    local sizeX,sizeY = self.mm_View_compound_bg:getSize();

    self.m_compoundList = UIFactory.createScrollView(0,0,sizeX,sizeY,true);

    self.m_compoundList:setScrollBarWidth(0);

    local __formatCompoundData = self:getFormatCompoundData();    
    for kk,vv in pairs(__formatCompoundData) do 
        local __item = new(CompoundItem,vv);
        self.m_compoundList:addChild(__item);
    end
    self.mm_View_compound_bg:addChild(self.m_compoundList);

    if #__formatCompoundData < 4 then
        self.m_compoundList:setEventDrag(self.m_recordList,function() end);
    end

end

DetailWidgetCompound.getFormatCompoundData = function(self)
    local __formatData = {};
    local __couldCompoundKind = #self.m_data.compoundTable;

    local __item_height = 100;
    if __couldCompoundKind <3 then
        __item_height = 120;
        self.mm_View_compound_bg:setSize(nil,285);
    end
    for __kk,__vv in pairs(self.m_data.compoundTable) do
        __item = Copy(self.m_data);
        __item.compoundData = __vv;
        __item.item_height =__item_height; 
        table.insert(__formatData,__item);
    end

    return __formatData;
end

DetailWidgetCompound.onGetImage = function(self,url,imagePath)
    local icon = UIFactory.createImage(imagePath);
    if icon then
        local w,h = self.mm_icon:getSize();
        local iconW , iconH = icon:getSize();
        local scaleW = iconW>iconH and w or h*iconW/iconH;
        local scaleH = iconW>iconH and w*iconH/iconW or h;
        icon:setSize(scaleW,scaleH);
        icon:setAlign(kAlignCenter);
        self.mm_iconFrame:removeChild(self.mm_icon,true);
        self.mm_iconFrame:addChild(icon);
        self.mm_icon = icon;
    end
end

DetailWidgetCompound.oncloseBtnClick = function(self)
    self:close();
end

return DetailWidgetCompound;