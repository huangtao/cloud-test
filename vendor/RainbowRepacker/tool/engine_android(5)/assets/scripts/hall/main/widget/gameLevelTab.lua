
local interface = require("isolater/abstractInterface/gameLevelTabInterface");

local GameLevelTab = class(interface);

GameLevelTab.ctor = function(self,p_data,p_parent,p_call,p_showWhich)
	self:setSize(p_parent:getSize());
	self.m_data = p_data;
	self.m_parent = p_parent;
	self.m_callFunc = p_call;
	self.m_upDataImageCount = 0;
	self.m_showWhich = p_showWhich or 1;
	self.m_isShowBroadcast = false; 
    self.m_isInit = false;

	self.m_taskInstance = new(require("util/ImageCacheBatch"));

    self:createTab();
end

GameLevelTab.dtor = function(self)
	delete(self.m_taskInstance);
end

--定制的时候必须维护这个接口
--virtual
GameLevelTab.toWhich = function(self,p_which)
     self:initStatus(p_which);
end

--修饰 initStatus功能
GameLevelTab.initStatus = function(self,p_which)
    self.m_isInit = true;
    self.m_levelTabCheckBox:initStatus(p_which);
    self.m_isInit = false;
end

--当只有一个tab的时候时候要显示广播条
GameLevelTab.isShowBroadcast = function(self)
	return self.m_isShowBroadcast;
end


--大厅提供一个self.m_parent的父节点，具体TAB可定制，回掉self.m_callFunc传入tabIndex值调用大厅逻辑即可。
GameLevelTab.createTab = function(self)
	if self.m_data and self.m_data.data and table.getn(self.m_data.data) > 0 then
        
    else
        return;   
    end

    local tableNode = new(Node);
    tableNode:setSize(1,1);
    tableNode:setAlign(kAlignTop);
    self:addChild(tableNode);


    local tabNum = table.getn(self.m_data.data);

    local unitCheckBoxsWidth = 170;
    local unitCheckBoxsHeight = 68;
    local offX = 0;
    local levelTabCheckBox = UIFactory.createCheckBoxGroup();
    self.m_levelTabCheckBox = levelTabCheckBox;  --暴露给上下文
    levelTabCheckBox:setSize((unitCheckBoxsWidth + offX)*tabNum,unitCheckBoxsHeight);
    levelTabCheckBox:setAlign(kAlignBottomLeft);
    tableNode:addChild(levelTabCheckBox);

    local _startX = 0;
    local _intervalX = unitCheckBoxsWidth + offX;

    local function __getImages(p_which)
    	if p_which == 1 then
    		return{"hall/common/checkBox/checkBox11_dis.png","hall/common/checkBox/checkBox11_sel.png"};
    	elseif p_which == tabNum then
    		return{"hall/common/checkBox/checkBox13_dis.png","hall/common/checkBox/checkBox13_sel.png"};
    	else
    		return{"hall/common/checkBox/checkBox12_dis.png","hall/common/checkBox/checkBox12_sel.png"};
    	end
    end

    local count = 1;
    for k,v in pairs(self.m_data.data) do

        local _checkBox = UIFactory.createCheckBox(__getImages(count));
        _checkBox:setAlign(kAlignBottomLeft);
        _checkBox:setPos(_startX,0);
        _checkBox:setChecked(false);
        levelTabCheckBox:addCheckBox(_checkBox);
        _startX = _startX + _intervalX;
       

        --默认加上系统字
        local _label = new(Text,v.tab_name, nil, nil, kAlignCenter, nil, 28, 255, 255, 255);
        _label:setName("tab_name");
        _label:setAlign(kAlignCenter);
        _checkBox:addChild(_label);

       	self.m_taskInstance:addTask(v.tab_selImage, self, self.onSetImageFont,count,"select");
        self.m_taskInstance:addTask(v.tab_disImage, self, self.onSetImageFont,count,"disable");
        count = count + 1;
    end

    tableNode:setPos(_intervalX*tabNum/-2,65); --居中

    levelTabCheckBox:setOnChange(self,self.onCheckBoxClick);

    levelTabCheckBox:setCheckBoxGroupMode(CheckBoxGroup.e_Mode.SINGLE);
    self:initStatus(self.m_showWhich);

    self.m_taskInstance:setDelay(true);
    self.m_taskInstance:startTask();
	
	if tabNum < 2 then
		self.m_isShowBroadcast = true;
		self:setVisible(false);
	end

end



GameLevelTab.onCheckBoxClick = function(self,index,isChecked)
	--音效
    if not self.m_isInit then
        kEffectPlayer:play(Effects.AudioButtonClick);
    end

    local function setFontColor()
        for i=1,table.getn(self.m_data.data) do
            local __checkBox = self.m_levelTabCheckBox:getCheckBox(i);
            if __checkBox:getChildByName("tab_name") then
                if i == index then
                    __checkBox:getChildByName("tab_name"):setColor(115,62,5);
                else
                    __checkBox:getChildByName("tab_name"):setColor(255,255,255);
                end
                
            end
        end
    end

    setFontColor();

    local function setImageFont()
        for i=1,table.getn(self.m_data.data) do
            local __checkBox1 = self.m_levelTabCheckBox:getCheckBox(i);

                if i == index then
                    if __checkBox1:getChildByName("disable") and __checkBox1:getChildByName("select") then
                        __checkBox1:getChildByName("disable"):setVisible(false);
                        __checkBox1:getChildByName("select"):setVisible(true);
                    end
                else
                    if __checkBox1:getChildByName("disable") and __checkBox1:getChildByName("select") then
                        __checkBox1:getChildByName("disable"):setVisible(true);
                        __checkBox1:getChildByName("select"):setVisible(false);
                    end
                end
                
        end
    end

    setImageFont();
	
	--回掉大厅逻辑
	self.m_callFunc(index);
end

GameLevelTab.onSetImageFont = function(self, p_url,p_path,p_which,p_name) 
	local __checkBox = self.m_levelTabCheckBox:getCheckBox(p_which);
	local __image = UIFactory.createImage(p_path);
	__image:setAlign(kAlignCenter);
	__image:setName(p_name);
	__checkBox:addChild(__image);

	__isChecked = self.m_levelTabCheckBox:isChecked(p_which);

	if (__isChecked and p_name == "disable") or (not __isChecked	and  p_name == "select") then
		__image:setVisible(false);
	end

	--删除之前的系统字
    local __label = __checkBox:getChildByName("tab_name");
    if __label then
        __checkBox:removeChild(__label,true);
    end
	self.m_upDataImageCount = self.m_upDataImageCount + 1;

end

return GameLevelTab;
