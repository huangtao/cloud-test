local taskContinueTip = require(ViewPath.."hall/task/taskContinueTip");
require("hall/recharge/data/rechargeDataInterface");

TaskContinueTip = class(CommonGameLayer,false);

TaskContinueTip.s_controls=
{
	root = 0;
	subView = 1;
	bg = 2;
	numText = 3;
	nameText = 4;
	rewardImage = 5;
	okBtn = 6;
	closeBtn = 7;
}

TaskContinueTip.ctor = function(self,data)
	super(self,taskContinueTip);
	self.m_ctrl = self.s_controls;
	self:setFillParent(true,true);
	self:addToRoot();
	self:setLevel(100);
	self.m_data = data;
	self:findViews();
	self:init();
end

TaskContinueTip.dtor = function(self)
	self.m_data = nil;
end

TaskContinueTip.findViews = function(self)
	self.m_subView = self:findViewById(self.m_ctrl.subView);
	self.m_subView:setTransparency(0);
	self.m_bg = self:findViewById(self.m_ctrl.bg);
	self.m_numText = self:findViewById(self.m_ctrl.numText);
	self.m_nameText = self:findViewById(self.m_ctrl.nameText);
	self.m_rewardImage = self:findViewById(self.m_ctrl.rewardImage);
	self.m_okBtn = self:findViewById(self.m_ctrl.okBtn);
	self.m_closeBtn = self:findViewById(self.m_ctrl.closeBtn);
end

TaskContinueTip.init = function(self)
	if not table.isEmpty(self.m_data) then 
		local continueInfos = TaskRewardDataInterface.getInstance():getContinueInfos();
		local continueConfig = table.verify(continueInfos.config);
		local awardItemName = table.verify(RechargeDataInterface.getInstance():getGoodInfoByTypeId(self.m_data.type)).item_name or "奖励";
		if self.m_data.type == 0 then 
			awardItemName = "银币";
		elseif self.m_data.type == 2 then 
			awardItemName = "钻石";
		end 
		local ratio = self.m_data.ratio or 1;
		local awardItemNum = tonumber(self.m_data.award)*tonumber(ratio); --获得个数
		if self.m_data.continue_days and continueConfig[tostring(self.m_data.continue_days)] then
			local imagePath = continueConfig[tostring(self.m_data.continue_days)].icon or "";--获得图片链接
			ImageCache.getInstance():request(imagePath or "",self,self.onUpdateRewardIconImage);--下载图片
		end
		local tempText;
		if self.m_data.continue_days and tostring(self.m_data.continue_days) == "0" then
			tempText = "满月";
		else 
			--todo
			tempText = string.concat(self.m_data.continue_days or "7","天");
		end
		self.m_numText:setText(string.concat("恭喜你连续签到 ",tempText));
		self.m_nameText:setText(string.concat(awardItemName,"",awardItemNum));
	
	end
end

TaskContinueTip.onUpdateRewardIconImage = function(self,url,imagePath)
	if imagePath then
		self.m_rewardImage:setFile(imagePath);
        self.m_imagePath = imagePath;
	end
end

TaskContinueTip.onCloseClick = function(self)
    if self.m_data.type == 0 or self.m_data.type == 1 or self.m_data.type == 2 then
        AnimManager.getInstance():playAnim(AnimIds.MoneyDropPar, 100);
    else
        --播放飞向背包的动画
        local _x,_y = self.m_rewardImage:getAbsolutePos();
        local _absPos = {x=_x,y=_y };
  
        local _image = self.m_imagePath;
        if _absPos and (_image and _image ~= "") then
            local _class = require("hall/animation/animBackpack");
            local _param = {image = _image,startPos = _absPos};
            local ani = new(_class,_param);
            ani:play();
        end
    end
    
	delete(self);--props
end

TaskContinueTip.onBgTouch = function(self)
end

TaskContinueTip.s_controlConfig =
{
	[TaskContinueTip.s_controls.subView]={"subView"};
	[TaskContinueTip.s_controls.bg]={"bg"};
	[TaskContinueTip.s_controls.numText]={"bg","numText"};
	[TaskContinueTip.s_controls.nameText]={"bg","nameText"};
	[TaskContinueTip.s_controls.rewardImage]={"bg","Image1","rewardImage"};
	[TaskContinueTip.s_controls.okBtn]={"bg","okBtn"};
	[TaskContinueTip.s_controls.closeBtn]={"bg","closeBtn"};
}

TaskContinueTip.s_controlFuncMap = 
{
	[TaskContinueTip.s_controls.okBtn]=TaskContinueTip.onCloseClick;
	[TaskContinueTip.s_controls.closeBtn]=TaskContinueTip.onCloseClick;
	[TaskContinueTip.s_controls.bg]=TaskContinueTip.onBgTouch;
}