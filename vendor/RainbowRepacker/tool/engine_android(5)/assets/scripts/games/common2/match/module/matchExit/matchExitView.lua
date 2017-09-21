local ViewBase = require("games/common2/module/viewBase");
require("uilibs/richText");
local MatchExitView = class(ViewBase,false);

MatchExitView.s_config = {
	[MatchMechineConfig.STATUS_LOADING] = {
		["normal"] = {
			title = "退出比赛",
            content = {"#c8F5C1F老板，真的要退出比赛吗？","#c8F5C1F这么多#cE04713奖励#c8F5C1F您不要了吗？"}, 
		};
		["special"] = {
			title = "退出比赛",
            content = {"#c8F5C1F老板，真的要退出比赛吗？","#c8F5C1F这么多#cE04713奖励#c8F5C1F您不要了吗？"}, 
		};
	};
	[MatchMechineConfig.STATUS_WAITING] = {
        ["freeNotFinal"] = {
        	title = "退赛提示",
			content = "现在离开将会放弃当前比赛，是否要退赛？", 
		};
        ["freeFinal"] = {
        	title = "退赛提示",
			content = "比赛尚未结束，是否要退出比赛？", 
		};
		["chargeNotFinal"] = {
			title = "退赛提示",
			content = "现在离开将会放弃当前比赛，是否要退赛？", 
			tips = "放弃比赛无法获得奖励，也不会退还报名费",
			tipsTextAlign = kAlignCenter,
		};
		["chargeFinal"] = {
			title = "退赛提示",
			content = "比赛尚未结束，是否要退出比赛？",
			tips = "您已经提前完成比赛，比赛奖励将通过系统私信发放",
			tipsTextAlign = kAlignLeft,
		};
		["normal"] = {
			title = "退赛提示",
            content = "比赛尚未结束，是否要退出比赛？", 
		};
	};
};

MatchExitView.s_controls = 
{
	bg 				= 1;
	maskView 		= 2;

	exitBtn 		= 3;
	cancelBtn 		= 4;
	contentView		= 5;
	closeBtn		= 6;
	title 			= 7;
	icon 		= 8;
	championBg = 9;
	contentView2 = 10;
	tipsView = 11;
};

MatchExitView.ctor = function(self,seat,viewConfig)	
	super(self,viewConfig);
	self:setFillParent(true,true);
	self:hide();

	MatchIsolater.getInstance():setObserver(self);
end

MatchExitView.dtor = function(self)	
	MatchIsolater.getInstance():clearObserver(self);

    ImageCache.getInstance():cleanRef(self);
end
----------------------------------------------
MatchExitView.onEmptyfunc = function(self)
end

MatchExitView.onExitBtnClick = function(self)
	self:hide();

	local data = MatchIsolater.getInstance():getMatchData();
	MatchIsolater.getInstance():requestExitMatch(data);
end

MatchExitView.onCancelBtnClick = function(self)
	self:hide();

	local action = MatchMechineConfig.ACTION_RELEASE_MATCH_VIEWS;
	local info = {};
	info.viewName = MatchMechineConfig.VIEW_EXIT;
	MatchMechine.getInstance():receiveAction(action,info); 
end
-------------------------------------------------------
MatchExitView._initView = function(self, exitMatchType)	
	local curState = MatchMechine.getInstance():getStates();
	local stateConfig = MatchExitView.s_config[curState];
	if table.isEmpty(stateConfig) then
		return;
	end
	local config = stateConfig[exitMatchType];
	if table.isEmpty(config) then
		return;
	end 

	self:_resetView();
	self:_initViewCommon(config)
	
	if curState == MatchMechineConfig.STATUS_LOADING then
		self:_initViewLoading(config);
	elseif curState == MatchMechineConfig.STATUS_WAITING then
		self:_initViewWaiting(config);
	end
end

MatchExitView._resetView = function(self)
	local contentView = self:findViewById(self.s_controls.contentView);
	local contentView2 = self:findViewById(self.s_controls.contentView2);
	local championBg = self:findViewById(self.s_controls.championBg);
	local tipsView = self:findViewById(self.s_controls.tipsView);

	contentView:setVisible(false);
	contentView2:setVisible(false);
	championBg:setVisible(false);
	tipsView:setVisible(false);
end

MatchExitView._initViewCommon = function(self, config)
	local title = self:findViewById(self.s_controls.title);
	title:setText(config.title);
end

MatchExitView._initViewLoading = function(self, config,info)
	local contentView = self:findViewById(self.s_controls.contentView);
	local championBg = self:findViewById(self.s_controls.championBg);
	contentView:removeAllChildren(true);
	local w,h = contentView:getSize();
    local len = table.getSize(config.content);
    local startY = len > 2 and 5 or 20;
    for k, v in pairs(table.verify(config.content)) do
        if v and v ~="" then
            local richText = new(RichText, v, w, h, kAlignTopLeft, nil, 32,nil,nil,nil,true);
	        richText:setAlign(kAlignTopLeft);
	        contentView:addChild(richText);
            richText:setPos(nil, startY + 36*k);
        end
    end

    local data = MatchIsolater.getInstance():getMatchData();
    MatchIsolater.getInstance():requestMatchDetail(data.id); --请求比赛奖励

    contentView:setVisible(true);
    championBg:setVisible(true);
end

MatchExitView.onResponseMatchDetail = function(self,info)
    local iconImg = self:findViewById(self.s_controls.icon);
    local url = ""
    if not table.isEmpty(info.icon) then
        url = info.icon["1"];
    end
    if not string.isEmpty(url) then
        ImageCache.getInstance():request(url, self, self.__onImageDownload, iconImg);
    end
end

MatchExitView._initViewWaiting = function(self, config)
	local contentView2 = self:findViewById(self.s_controls.contentView2);
	local tipsView = self:findViewById(self.s_controls.tipsView);

	contentView2:removeAllChildren(true);
	if not string.isEmpty(config.content) then 
		local w,h = contentView2:getSize();
		local align = string.isEmpty(config.tips) and kAlignCenter or kAlignTop;
		local content = new(TextView, config.content, w, h, align, nil, 32, 173, 92, 31);
		contentView2:addChild(content);
	end 

	tipsView:removeAllChildren(true);
	if not string.isEmpty(config.tips) then 
		local w,h = tipsView:getSize();
		local tips = new(TextView, config.tips, w - 50, h - 10, config.tipsTextAlign or kAlignCenter, nil, 22, 167, 142, 96);
		tips:setAlign(kAlignCenter);
		tipsView:addChild(tips);

		tipsView:setVisible(true);
	else 
		tipsView:setVisible(false);
	end 

	contentView2:setVisible(true);
end

MatchExitView.__onImageDownload = function(self, url, file, iconImg)
    if iconImg and not string.isEmpty(iconImg) then
        iconImg:setFile(file);
    end
end

-------------------------------------------------------
MatchExitView.showExitView = function(self,seat,uid,info,isFast)
	info = table.verify(info);
	exitMatchType = self:_checkExitMatchType(info.exitMatchType);
	self:_initView(exitMatchType);
	self:show();
end

MatchExitView._checkExitMatchType = function(self,exitMatchType)
	if exitMatchType then 
		return exitMatchType;
	else 
		local curState = MatchMechine.getInstance():getStates();
		local data = MatchIsolater.getInstance():getMatchData();	
		if curState == MatchMechineConfig.STATUS_LOADING then 
			local isFree;
			if not data.fee or #data.fee == 0 then
				isFree = true;
			end 
			return isFree and "normal" or "special";

		elseif curState == MatchMechineConfig.STATUS_WAITING then 
			 local desType = "normal";
             if not data.fee or #data.fee == 0 then
                 if data.isFinalRound then
                    desType = "freeFinal";
                 else
                    desType = "freeNotFinal";
                 end   
             else
                if data.isFinalRound then
                    desType = "chargeFinal";
                else
                    desType = "chargeNotFinal";
                end   
             end
             return desType;
		else
			return "normal";
		end 
	end
end

MatchExitView.s_controlConfig = 
{	
	[MatchExitView.s_controls.bg] 			= {"bg"};
	[MatchExitView.s_controls.maskView] 	= {"maskView"};
	[MatchExitView.s_controls.exitBtn] 		= {"bg","exitBtn"};
	[MatchExitView.s_controls.cancelBtn] 	= {"bg","cancelBtn"};
	[MatchExitView.s_controls.contentView]	= {"bg", "contentView"};
	[MatchExitView.s_controls.closeBtn]		= {"bg", "closeBtn"};
	[MatchExitView.s_controls.title]		= {"bg", "title","titleText"};
	[MatchExitView.s_controls.icon]         = {"bg", "championBg","icon"};
	[MatchExitView.s_controls.championBg] 	= {"bg", "championBg"};
	[MatchExitView.s_controls.contentView2] = {"bg", "contentView2"};
	[MatchExitView.s_controls.tipsView] 	= {"bg", "tipsView"};
};

MatchExitView.s_controlFuncMap =
{
	[MatchExitView.s_controls.exitBtn] 		= MatchExitView.onExitBtnClick;
	[MatchExitView.s_controls.cancelBtn] 	= MatchExitView.onCancelBtnClick;
	[MatchExitView.s_controls.bg] 			= MatchExitView.onEmptyfunc;
	[MatchExitView.s_controls.maskView] 	= MatchExitView.onEmptyfunc;
	[MatchExitView.s_controls.closeBtn]		= MatchExitView.onCancelBtnClick;
};

MatchExitView.s_actionFuncMap = {
    [MatchMechineConfig.ACTION_REQUEST_EXIT]	= "showExitView";
    [MatchMechineConfig.ACTION_START]			= "hide";
    [MatchMechineConfig.ACTION_FINISH]			= "hide";
};


return MatchExitView;