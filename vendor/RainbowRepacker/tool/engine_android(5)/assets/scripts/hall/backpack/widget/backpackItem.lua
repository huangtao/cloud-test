local newObjectCaseItem = require(ViewPath .. "hall/newObjectCase/newObjectCaseItem");
require("hall/backpack/data/typeAdapter");
require("hall/backpack/commonOperationInterface");

BackpackItem = class(CommonGameLayer,false);

BackpackItem.ctor = function(self,data)
    if not data then
        return ;
    end

    self.m_data = data;
    local __layout = require(ViewPath .. "hall/newObjectCase/newObjectCaseItem");
    super(self,__layout);
    self:declareLayoutVar(ViewPath.."hall/newObjectCase/newObjectCaseItem".."_layout_var");

    local offX,offY = 20,20;
    local width,height = self.m_root:getSize();
    self.m_root:setPos(offX/2,offY/2);
    self:setSize(width + offX,height + offY);

    self:getHandle();
    local moduleData = self:dataAdapter(data);
    self:init(moduleData);
end

BackpackItem.getHandle = function(self)
   self.numFrameBack = self:findViewById(self.s_controls.numFrameBack);
   self.numText = self:findViewById(self.s_controls.numText);
   self.Text_name = self:findViewById(self.s_controls.Text_name);
   self.Image_past_day = self:findViewById(self.s_controls.Image_past_day);
   self.Text_past_day = self:findViewById(self.s_controls.Text_past_day);
   self.iconImageBg = self:findViewById(self.s_controls.iconImageBg);
   
end

BackpackItem.dataAdapter = function(self,p_data)
    local moduleData = {};

    if table.isEmpty(p_data) then
        return moduleData;
    end

    moduleData.iconPath = p_data.iconPath;
    moduleData.number = p_data.number;
    moduleData.name = p_data.name;
    return moduleData ;
end

BackpackItem.init = function(self,p_data)
    self:__initPastDay();
    local numShowText = p_data.number > 99 and "99+" or p_data.number;
    self.numText:setText(numShowText);
    local __tmpText = string.subUtfStrByCn(p_data.name,1,7,"");
    self.Text_name:setText(__tmpText);
    ImageCache.getInstance():request(p_data.iconPath,self,self.onGetImage);
    if p_data.number <= 1 then
        self.numFrameBack:setVisible(false);
    end
end

BackpackItem.__initPastDay = function(self)
    if self.m_data.day == -1 or self.m_data.day > 10 then
        self.Image_past_day:setVisible(false);
        return;
    else
        self.Image_past_day:setVisible(true);
        local __day = self.m_data.day - 1 ;
        local __dayString = __day.."天到期";
        if __day < 1 then
            __dayString = "到期";
        end
        self.Text_past_day:setText(__dayString); 
        self.Image_past_day:addPropRotateSolid(1, -45, kCenterDrawing);    
    end 
end

BackpackItem.onGetImage = function(self,url, imagePath)
    local icon = UIFactory.createImage(imagePath);
    if icon then
        local w,h = self.iconImageBg:getSize();
        local iconW , iconH = icon:getSize();
        local scaleW = iconW>iconH and w or h*iconW/iconH;
        local scaleH = iconW>iconH and w*iconH/iconW or h;
        icon:setSize(scaleW,scaleH);
        icon:setAlign(kAlignCenter);
        self.iconImageBg:addChild(icon);
        self.iconImage = icon;
    end
end

 

--------------------------------UI handle and envet-------------------------------------
BackpackItem.onBindToCommonInfo = function(self)
    local _instance = kCaseOperationInstance:getInterfaceByType(self.m_data.clientType);
    if _instance then
        _instance:showCommonInfo(self.m_data);
    end
end

return BackpackItem;