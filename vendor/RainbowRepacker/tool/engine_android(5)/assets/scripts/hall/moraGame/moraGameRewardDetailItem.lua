local moraGameRewardDetailItem = require(ViewPath.."hall/moraGame/moraGameRewardDetailItem");
local MoraGameRewardDetailItem = class(Node);
local moraGame_pin = require("qnFiles/qnPlist/hall/moraGame_pin");

MoraGameRewardDetailItem.ctor = function(self, data)
   
    local view = SceneLoader.load(moraGameRewardDetailItem);
    local w,h = view:getSize()
	self:addChild(view);
    view:setFillParent(true, true);
    self:setFillParent(true,false);
    self:setSize(w,h);
    self.m_view = view;
	self.m_data = data;
	self:__initView();
end

MoraGameRewardDetailItem.dtor = function(self)
    
end

MoraGameRewardDetailItem.__initView = function(self)
    local itemView = self.m_view:getChildByName("itemView");
	local moraIcon = itemView:getChildByName("moraIcon");
    local tips1 = itemView:getChildByName("tips1");
    local moneyIcon = itemView:getChildByName("moneyIcon");
    local tips2 = itemView:getChildByName("tips2");
    moraIcon:setFile(moraGame_pin[string.format("hisMora_%d.png",self.m_data.gesture)]);
    moraIcon:setSize(moraIcon.m_res:getWidth(),moraIcon.m_res:getHeight());
    if self.m_data.iswin == 2 then 
        tips1:setText("打成平手",nil,nil,23,191,240);
        moneyIcon:setVisible(false);
        tips2:setVisible(false);
    elseif self.m_data.iswin == 1 or self.m_data.iswin == 3  then 
        moneyIcon:setVisible(true);
        tips2:setVisible(true);
        local img;
        if self.m_data.moneytype == 0 then
            img = moraGame_pin["hisSilverIcon.png"];
        elseif self.m_data.moneytype == 1 then  
            img = moraGame_pin["hisGoldBarIcon.png"];
        end
        moneyIcon:setFile(img);
        moneyIcon:setSize(moneyIcon.m_res:getWidth(),moneyIcon.m_res:getHeight());
        tips2:setText(math.abs(self.m_data.reward));
        if self.m_data.iswin == 1 then
            tips1:setText("赢取",nil,nil,255,235,12);
        else
            tips1:setText("损失",nil,nil,164,164,164);    
        end
    end
end

return MoraGameRewardDetailItem;