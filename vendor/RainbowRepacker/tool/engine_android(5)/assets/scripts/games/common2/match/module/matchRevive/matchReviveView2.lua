
local ViewBase = require("games/common2/module/viewBase");

-- 复活弹框
local MatchReviveView2 = class(ViewBase, false);

MatchReviveView2.s_reviveDuration = 10; -- 复活等待时间,单位s

local h_index = 0;
local getIndex = function(self)
    h_index = h_index + 1;
    return h_index;
end


MatchReviveView2.s_controls = 
{
    reviveCardUse = getIndex(),
    reviveScore = getIndex(),
    revivePeople = getIndex(),
    time = getIndex(),
    bottomView = getIndex(),
};

MatchReviveView2.eType = {
    REVIVE_ENABLE = 1, -- 可复活
    REVIVE_DISABLE = 2, -- 不可复活
};

MatchReviveView2.ctor = function(self,seat,viewConfig)
    super(self, viewConfig);
    self:setFillParent(true, true);
    self.m_root:setFillParent(true, true);
    
    self:_initView();

    self:hide();
end

MatchReviveView2.dtor = function(self)
    self:_timerEnd();
end

-- 复活操作
MatchReviveView2.onConfirmBtnClick = function(self, prop_type)
    self:_timerEnd();

    if prop_type < 0 then
        if self.m_reviveType == MatchReviveView2.eType.REVIVE_ENABLE then
            self:_requestRevive(false, prop_type);
        elseif self.m_reviveType == MatchReviveView2.eType.REVIVE_DISABLE then
            local action = MatchMechineConfig.ACTION_FINISH;
            MatchMechine.getInstance():receiveAction(action,self.m_matchOverData,true,"MatchReviveView2.onConfirmBtnClick");

            local action = MatchMechineConfig.ACTION_FINISH_REWARD;
            MatchMechine.getInstance():receiveAction(action,self.m_matchOverData,true,"MatchReviveView2.onConfirmBtnClick");
        end
    else
        self:_requestRevive(true, prop_type);
    end

    self:hide();

    local action = MatchMechineConfig.ACTION_RELEASE_MATCH_VIEWS;
    local info = {};
    info.viewName = MatchMechineConfig.VIEW_REVIVE;
    MatchMechine.getInstance():receiveAction(action,info); 
end

MatchReviveView2._requestRevive = function(self,isRevived,prop_type)
    local data = {
        flag = isRevived and 1 or 0,
        prop_type = prop_type,
    };
    SocketIsolater.getInstance():sendMsg(MatchSocketCmd.MATCH_REVIVE_REQUEST, data);
end

--------------------------------------private----------------------------------------------
MatchReviveView2._initView = function(self)
    self.m_reviveCardUse = self:findViewById(self.s_controls.reviveCardUse);
    self.m_reviveScore = self:findViewById(self.s_controls.reviveScore);
    self.m_revivePeople = self:findViewById(self.s_controls.revivePeople);
    self.m_time = self:findViewById(self.s_controls.time);

    self:setEventTouch(self, self._onEmptyFunc);
    self:setEventDrag(self, self._onEmptyFunc);
end

MatchReviveView2._resetView = function(self)
    self.m_time:setText("");
    self.m_reviveScore:setText("");
    self.m_revivePeople:setText("");
    self.m_reviveCardUse:removeAllChildren();
end

MatchReviveView2._showData = function(self)
    self:_resetView();
    
    self:_showDataCommon();
end

MatchReviveView2._showDataCommon = function(self)
    self:_showReviveNeed(self.m_data.prop_list);
    self:_showBottomView(self.m_data.prop_list);

    self.m_revivePeople:setText(string.valueOf(self.m_data.rank));
    self.m_reviveScore:setText(string.valueOf(self.m_data.score));

    self:_timerStart(self.m_data.time or MatchReviveView2.s_reviveDuration);
end

MatchReviveView2._showReviveNeed = function(self, list)
    if table.isEmpty(list) then
        return;
    end

    local node = UIFactory.createNode();
    local w = 0;
    local count = 1;
    for k, v in ipairs(list) do 
        if v.need_count > 0 then
            if count > 1 then 
                local text = UIFactory.createText("或", 40, 60, 40, kAlignCenter, 255, 222, 0);
                text:setAlign(kAlignLeft);
                text:setPos(w, nil);
                node:addChild(text);
                local wText = text:getSize();
                w = wText + w;
            end
            
            local nodeTextIcon = self:_createTextAndIcon(v.prop_type, v.need_count, 40, 0.4);
            nodeTextIcon:setAlign(kAlignLeft);
            nodeTextIcon:setPos(w, nil);
            node:addChild(nodeTextIcon);
            local wNode = nodeTextIcon:getSize();
            w = wNode + w;    

            count = count + 1;
        end
    end

    node:setAlign(kAlignCenter);
    node:setSize(w, 40);
    self.m_reviveCardUse:addChild(node);
end

MatchReviveView2._showBottomView = function(self, list)
    local config = {
        {propType = -1, text = "不复活", img = "isolater/btns/btn_orange_164x89_l25_r25_t25_b25.png", enable = true},
    }

    list = table.verify(list);
    local listSize = #list;

    for k, v in ipairs(list) do 
        if v.need_count > 0 then
            local name = PropIsolater.getInstance():getPropName(v.prop_type);
            local count = self:_getPropNum(v.prop_type);
            local enable = count >= v.need_count;
            local str = listSize > 1 and "使用"..name or "复活";
            local text = enable and str or name.."不足";
            table.insert(config, {propType = v.prop_type, text = text, img = "isolater/btns/btn_green_164x89_l25_r25_t25_b25.png", enable = enable});
        end
    end

    local configSize = #config;
    local itemWidth = configSize > 2 and 260 or 330;
    local totalWidth = configSize * itemWidth;
    
    local bottomView = self:findViewById(self.s_controls.bottomView);
    bottomView:setSize(totalWidth);

    for k, v in pairs(config) do
        local node = UIFactory.createNode();
        local btn = UIFactory.createButton(v.img, "isolater/btns/btn_gray_163x89_l25_r25_t25_b25.png", nil, nil, 25, 25, 25, 25);
        local text = UIFactory.createText(v.text, 30, 40, 40, kAlignCenter, 255, 245, 204);
        text:setAlign(kAlignCenter);
        btn:setAlign(kAlignCenter);
        btn:setSize(220, 80);
        btn:addChild(text);
        btn:setOnClick({self = self, prop_type = v.propType}, function(obj)
            if obj.self and obj.prop_type then
                obj.self:onConfirmBtnClick(obj.prop_type);
            end
        end);
        node:setAlign(kAlignLeft);
        node:setSize(itemWidth, 80);
        node:addChild(btn);
        node:setPos((k - 1)*itemWidth);
        bottomView:addChild(node);

        btn:setEnable(v.enable);
        if not v.enable then
            local propNode = UIFactory.createNode();
            propNode:setSize(200, 60);
            propNode:setAlign(kAlignBottom);
            propNode:setPos(0, -60);

            local textIconTitle = UIFactory.createText("拥有 ", 25, 25, 25, kAlignCenter, 255, 245, 204);
            local num = self:_getPropNum(v.propType);
            textIconTitle:setAlign(kAlignLeft);
            local w1 = textIconTitle:getSize();
            local textIconNode = self:_createTextAndIcon(v.propType, num, 25, 0.35);
            textIconNode:setAlign(kAlignLeft);
            textIconNode:setPos(w1);
            propNode:addChild(textIconTitle);
            propNode:addChild(textIconNode);
            node:addChild(propNode);
        end
    end
end

MatchReviveView2._getPropNum = function(self, propType)
    propType = number.valueOf(propType);
    if propType == UserPropertyIsolater.getInstance():getPropertySilverCoinID() or 
        propType == UserPropertyIsolater.getInstance():getPropertyGoldBarID() or 
        propType == UserPropertyIsolater.getInstance():getPropertyDiamondID() then
        return UserPropertyIsolater.getInstance():getMoneyById(propType) or 0;
    else
        return PropIsolater.getInstance():getPropNumByPropType(propType) or 0;
    end
    return num or 0;
end

MatchReviveView2._createTextAndIcon = function(self, propType, num, size, scale)    
    local node = UIFactory.createNode();
    local text = UIFactory.createText(string.valueOf(num), size, size, size, kAlignCenter, 255, 222, 0);
    local icon = UIFactory.createImage("isolater/bg_blank.png");
    icon:setSize(scale*196, scale*168);
    text:setAlign(kAlignLeft);
    icon:setAlign(kAlignLeft);
    node:addChild(text);
    node:addChild(icon);
    local w1, h1 = text:getSize();
    local w2 = icon:getSize();
    icon:setPos(w1);
    node:setSize(w1 + w2, h1);

    self:_downloadImage(propType, icon);
    return node;
end

MatchReviveView2._downloadImage = function(self, propType, img)
    local path = PropIsolater.getInstance():getPropIcon(propType);

    if not string.isEmpty(path) then
        ImageCache.getInstance():request(path, self, self._onImageDownloaded, img);
    end
end

MatchReviveView2._onImageDownloaded = function(self, url, imagePath, img)
    if not string.isEmpty(imagePath) and img and img.m_res then
        img:setFile(imagePath);

        local w1, _ = img:getSize();
        local w2 = img.m_res:getWidth();
        local h2 = img.m_res:getHeight();
        img:setSize(w1, h2 * w1 / w2);
    end
end

MatchReviveView2._onEmptyFunc = function(self)
end

----------------------------------------计时器---------------------------------------------
MatchReviveView2._timerStart = function(self, count)
    self:_timerEnd();

    self.m_count = count;

    self.m_timer = Clock.instance():schedule(function(dt)
            self:_onTimer();
        end,1);
end

MatchReviveView2._onTimer = function(self)
    if self.m_count < 0 then
        self:_timerEnd();
        self:onConfirmBtnClick(-1);
        return;
    end

    self:_setTime(self.m_count);
    self.m_count = self.m_count - 1;
end


MatchReviveView2._timerEnd = function(self)  
    if self.m_timer then 
        self.m_timer:cancel();
    end 
    self.m_timer = nil; 
end

-- 显示时间
MatchReviveView2._setTime = function(self, time)
    self.m_time:setText(string.valueOf(time));
end

---------------------------------------------------------------------------------
MatchReviveView2.showReviveView = function(self,seat,uid,info,isFast)
    info = table.verify(info);
    self.m_reviveType = info.reviveType;
    self.m_data = info.data;
    self.m_matchOverData = info.matchOverData;
    
    if self.m_data then
        self:_showData();

        self:show();
    end
end
---------------------------------------------------------------------------------

MatchReviveView2.s_controlConfig =
{   
    [MatchReviveView2.s_controls.reviveCardUse] = {"content", "center", "one", "view"};
    [MatchReviveView2.s_controls.reviveScore] = {"content", "center", "two", "num"};
    [MatchReviveView2.s_controls.revivePeople] = {"content", "center", "three", "num"};
    [MatchReviveView2.s_controls.time] = {"content", "top", "time"};
    [MatchReviveView2.s_controls.bottomView] = {"content", "bottom"};
};

MatchReviveView2.s_controlFuncMap =
{

};

MatchReviveView2.s_actionFuncMap = {
    [MatchMechineConfig.ACTION_GET_REVIVE_NOTIFY]     = "showReviveView";
};

return MatchReviveView2;