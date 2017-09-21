local rankMineBottomView = require(ViewPath.."hall/ranklist/rankMineBottomView");
local ranklist_pin_map = require("qnFiles/qnPlist/hall/ranklist_pin")
local RankMineBottomView = class(CommonGameLayer, false);

local h_index = 0;
local getIndex = function(self)
	h_index = h_index + 1;
	return h_index;
end
RankMineBottomView.Delegate = {
    onMineRankBtnClick = "onMineRankBtnClick",
    showRewardMsgDialog = "showRewardMsgDialog",
}

RankMineBottomView.s_controls = 
{	
    mineRankArea = getIndex(),
	mineRankLeft = getIndex(),
	mineRankName = getIndex(),
	mineRankBtn = getIndex(),
	mineRankCoins = getIndex(),
    mineErrorText = getIndex(),
    mineRankText = getIndex(),
    headBg = getIndex(),
	headView = getIndex(),
	vip_corner_mark = getIndex();
};

RankMineBottomView.ctor = function(self)
	super(self, rankMineBottomView);
    local w, h = self.m_root:getSize();
	self:setSize(w, h);
    self.m_ctrl = RankMineBottomView.s_controls;
    self:__initViews();
    self:__initMineHeadImage();
end

RankMineBottomView.__initViews = function (self)
    self:findViewById(self.s_controls.vip_corner_mark):setVisible( kUserInfoData:getIsVip());
end

RankMineBottomView.dtor = function (self)
    ImageCache.getInstance():cleanRef(self);
end

RankMineBottomView.__initMineHeadImage = function(self)
    local sex = kUserInfoData:getSex();
	local headImg = kUserInfoData:getHallHeadBySex(sex);
	self:__setMyHeadImage(headImg);
	self.m_mineHeadImageUrl = kUserInfoData:getAvatar_s() or kUserInfoData:getAvatar_b();
	ImageCache.getInstance():request(self.m_mineHeadImageUrl,self, self.onUpdateListHeadImage);
end

RankMineBottomView.__setMyHeadImage = function(self, image)
	local headBg = self:findViewById(self.s_controls.headView);
	if self.m_headImage then
		headBg:removeChild(self.m_headImage);
	end
	delete(self.m_headImage);
	self.m_headImage = new(Mask, image, "hall/common/list_head_mask.png");
	headBg:addChild(self.m_headImage);
	self.m_headImage:setAlign(kAlignCenter);
	self.m_headImage:setLevel(-1);
end

RankMineBottomView.__onUpdateMineImage = function(self, imagePath)
	self:__setMyHeadImage(imagePath);
end

RankMineBottomView.__onUpdateListHeadImage = function(self, url, imagePath)
	if url == self.m_mineHeadImageUrl then
		self:__onUpdateMineImage(imagePath);
	end
end

RankMineBottomView.refreshMineRankInfo = function (self, data, rankType, flag)
    flag = number.valueOf(flag , -2);
	if table.isEmpty(data) then 
        self:refreshErrorTextAndRankArea(true, false);
		return;
	end
    self:refreshErrorTextAndRankArea(false, true);
	local mineLeft = self:findViewById(self.m_ctrl.mineRankLeft);
	local mineName = self:findViewById(self.m_ctrl.mineRankName);
	local mineBtn = self:findViewById(self.m_ctrl.mineRankBtn);
	local mineBtnText = mineBtn:getChildByName("mine_getcoins_text");
	local mineCoins = self:findViewById(self.m_ctrl.mineRankCoins);
	
	local mineLeftCrown = mineLeft:getChildByName("mine_left_crown");
	local mineLeftView = mineLeft:getChildByName("mine_left_rank_bg");
	local mineLeftText = mineLeftView:getChildByName("mine_left_text");
	local mineLeftRankNum = mineLeftView:getChildByName("mine_left_rank_num");
	local miniRankTextView = self:findViewById(self.m_ctrl.mineRankText);

	local nick = kUserInfoData:getNickname() or data["nick"] or "";
	self.m_mineHeadImageUrl = kUserInfoData:getAvatar_s() or kUserInfoData:getAvatar_b();
	local account =number.valueOf(data["account"]);
	local pos = number.valueOf(data["curpos"], -1);

	-- 设置头像
	mineName:setText(nick, 1); 
    local x,_ = mineName:getPos();
    local w,_ = mineName:getSize();
    self:findViewById(self.s_controls.vip_corner_mark):setPos(x + w + 3);
	---以下设置左侧排名区域
	mineLeftCrown:setVisible(true);
	mineLeftView:setVisible(false);
	mineLeftText:setVisible(false);

	if pos < 1 then
		mineLeftCrown:setVisible(false);
		mineLeftView:setVisible(true);
		mineLeftText:setVisible(true);
		mineLeftRankNum:setVisible(false);
	elseif pos == 1 then
		mineLeftCrown:setFile( ranklist_pin_map["rank_1.png"] );
	elseif pos == 2 then
		mineLeftCrown:setFile( ranklist_pin_map["rank_2.png"] );
	elseif pos == 3 then
		mineLeftCrown:setFile( ranklist_pin_map["rank_3.png"] );
	else
		mineLeftCrown:setVisible(false);
		mineLeftView:setVisible(true);
		mineLeftText:setVisible(false);
		mineLeftRankNum:setVisible(true);
	end
    mineLeftRankNum:setText(pos);
	----设置头像
	ImageCache.getInstance():request(self.m_mineHeadImageUrl,self, self.__onUpdateListHeadImage);

	----设置右侧信息区域
	local rankInfoText = "";
	local rankInfoBtnText = "快速提升排名";
	local rankInfoByDay = "当前排名";

	---以下设置银币和经验数
	local coinHead = "昨日";
	if flag == RankListConstants.eFlag.Today then
		rankInfoByDay = "当前排名";
		coinHead = "今日";
	elseif flag == RankListConstants.eFlag.LastDay then
		rankInfoByDay = "昨日排名";
	end

	mineBtn:setVisible(false);
	local funcData = self;
	local func = self.onMineRankBtnClick;
	if rankType == RankListConstants.eRankType.Money then
		miniRankTextView:setVisible(true);
		coinHead = coinHead .. "收益" .. "：";
		rankInfoBtnText = "快速提升排名";
		if pos < 1 then
			rankInfoText = "您未能进榜，加油！"
			mineBtn:setVisible(true);
		elseif pos >=1 and pos <=3 then
			rankInfoText = "恭喜你，".. rankInfoByDay .."：" .. pos;
		else
			rankInfoText = rankInfoByDay .."：" .. pos;
			mineBtn:setVisible(true);
		end

	elseif rankType == RankListConstants.eRankType.Exp then
		miniRankTextView:setVisible(true);
		coinHead = coinHead .. "经验" .. "：";
		if pos < 1 then
			rankInfoText = "您未能进榜，加油！"
		elseif pos >=1 and pos <=3 then
			rankInfoText = "恭喜你，".. rankInfoByDay .."：" .. pos;
		else
			rankInfoText = rankInfoByDay .."：" .. pos;
		end
	elseif rankType == RankListConstants.eRankType.Vip then
		miniRankTextView:setVisible(true);
		coinHead = coinHead .. "：";
		if pos < 0 then
			rankInfoText = "您未参加比赛，无排名";
		elseif pos == 0 then
			rankInfoText = "您未能进榜，加油！";
		else
			local rewardFlag = number.valueOf(data.reward);
			if rewardFlag == 1 then
				rankInfoText = string.concat("恭喜你，", rankInfoByDay, "：", pos);
				mineBtn:setVisible(true);
			else
				rankInfoText = string.concat(rankInfoByDay, "：", pos);
			end
		end
		rankInfoBtnText = "填写奖励信息";

		funcData.obj = self;
		funcData.data = data;
		func = self.onVipMyRankBtnClick;
	elseif rankType == RankListConstants.eRankType.RedEnvelope then
		miniRankTextView:setVisible(true);
		coinHead = "发出红包数：";
		if pos < 1 then
			rankInfoText = "您未能进榜，加油！"
		elseif pos >=1 and pos <=3 then
			rankInfoText = "恭喜你，" .."目前排名：" .. pos;
		else
			rankInfoText = "目前排名：" .. pos;
		end	
	else
		if pos < 1 or pos > 3 then
			mineBtn:setVisible(true);
		end
		miniRankTextView:setVisible(true);
		coinHead = coinHead .. "：";
	end
	mineBtnText:setText(rankInfoBtnText);
	miniRankTextView:setText(rankInfoText .. "　");

	if account and account>0 then 
		if rankType == RankListConstants.eRankType.Exp then
			mineCoins:setText(coinHead..account);
		else 
			mineCoins:setText(coinHead..ToolKit.skipMoneyEx2(account));
		end 
	else 
		mineCoins:setText(coinHead.."0");
	end
	mineBtn:setOnClick(funcData, func);
end

RankMineBottomView.onMineRankBtnClick = function(self)
    self:execDelegate(RankMineBottomView.Delegate.onMineRankBtnClick);
end

RankMineBottomView.refreshErrorTextAndRankArea = function (self, errorTextIsShow, rankAreaIsShow)
    self:findViewById(self.m_ctrl.mineErrorText):setVisible(errorTextIsShow);
	self:findViewById(self.m_ctrl.mineRankArea):setVisible(rankAreaIsShow);
end

RankMineBottomView.onVipMyRankBtnClick = function(funcData)
	if funcData then
		local self = funcData.obj;
		local data = funcData.data;
		local tmpData = {};
		tmpData.adress = data.addr;
		tmpData.phone = data.tel;
		tmpData.name = data.name;
        self:execDelegate(RankMineBottomView.Delegate.showRewardMsgDialog, tmpData);
	end
end

RankMineBottomView.s_controlConfig =
{   
    [RankMineBottomView.s_controls.mineRankArea] = {"mine_rank", "mine_info_container"},
	[RankMineBottomView.s_controls.mineRankLeft] = {"mine_rank", "mine_info_container", "mine_left"},
	[RankMineBottomView.s_controls.headView] = {"mine_rank", "mine_info_container", "mine_head"},
	[RankMineBottomView.s_controls.headBg] = {"mine_rank", "mine_info_container", "mine_head", "mine_head_bg"},
	[RankMineBottomView.s_controls.vip_corner_mark] = {"mine_rank", "mine_info_container","vip_corner_mark"},
	[RankMineBottomView.s_controls.mineRankName] = {"mine_rank", "mine_info_container", "mine_name"},
	[RankMineBottomView.s_controls.mineRankBtn] = {"mine_rank", "mine_info_container", "mine_getcoin"},
	[RankMineBottomView.s_controls.mineRankCoins] = {"mine_rank", "mine_info_container", "mine_coins_num"},
	[RankMineBottomView.s_controls.mineRankText] = {"mine_rank", "mine_info_container", "mine_rank_text"},
	[RankMineBottomView.s_controls.mineErrorText] = {"mine_rank", "mine_error_text"},
};

RankMineBottomView.s_controlFuncMap =
{
    [RankMineBottomView.s_controls.mineRankBtn] = RankMineBottomView.onMineRankBtnClick,
};

return RankMineBottomView;