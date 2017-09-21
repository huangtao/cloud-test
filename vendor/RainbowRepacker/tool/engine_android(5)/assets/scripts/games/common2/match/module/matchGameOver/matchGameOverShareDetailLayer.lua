-- 比赛分享竖版
local MatchGameOverShareDetailLayer = class(CommonGameLayer, false);
require("uilibs/userMoneyItem");

MatchGameOverShareDetailLayer.Delegate = {
};

MatchGameOverShareDetailLayer.s_controls = 
{
	nameText = ToolKit.getIndex(),
	wheatLeft = ToolKit.getIndex(),
	rankFirst = ToolKit.getIndex(),
	rankNumView = ToolKit.getIndex(),
    rank = ToolKit.getIndex(),
    rankName = ToolKit.getIndex(),
    wheatRight = ToolKit.getIndex(),
    arrowLeft = ToolKit.getIndex(),
    defeatTips = ToolKit.getIndex(),
    defeatNumView = ToolKit.getIndex(),
    defeatName = ToolKit.getIndex(),
    arrowRight = ToolKit.getIndex(),
    timeText = ToolKit.getIndex(),
    championLine = ToolKit.getIndex(),
    rewardIcon = ToolKit.getIndex(),
    rewardName = ToolKit.getIndex(),
    notRewardTips = ToolKit.getIndex(),
    headBgView = ToolKit.getIndex(),
    defeatView = ToolKit.getIndex(),
    matchTipsView = ToolKit.getIndex(),
};

MatchGameOverShareDetailLayer.s_cmds = 
{
};

MatchGameOverShareDetailLayer.ctor = function(self, data)
	local shareLayout = require(ViewPath.."games/common2/match/match_shareDetail_layout");
	super(self, shareLayout);
	self:setSize(self.m_root:getSize());
    self.m_ctrl = MatchGameOverShareDetailLayer.s_controls;
	self.m_data = data;
	self:__initView();
    self:__initData();
end

-----------------------------------------------------------
MatchGameOverShareDetailLayer.__initView = function(self)
	if table.isEmpty(self.m_data) then
		return;
	end
    self.m_rank = self:findViewById(self.m_ctrl.rank);
    self.m_wheatLeft = self:findViewById(self.m_ctrl.wheatLeft);
    self.m_rankFirst = self:findViewById(self.m_ctrl.rankFirst);
    self.m_rankNumView = self:findViewById(self.m_ctrl.rankNumView);
    self.m_rankName = self:findViewById(self.m_ctrl.rankName);
    self.m_wheatRight = self:findViewById(self.m_ctrl.wheatRight);
    self.m_arrowLeft = self:findViewById(self.m_ctrl.arrowLeft);
    self.m_defeatTips = self:findViewById(self.m_ctrl.defeatTips);
    self.m_defeatNumView = self:findViewById(self.m_ctrl.defeatNumView);
    self.m_defeatName = self:findViewById(self.m_ctrl.defeatName);
    self.m_arrowRight = self:findViewById(self.m_ctrl.arrowRight);
    self.m_championLine = self:findViewById(self.m_ctrl.championLine);
    self.m_rewardIcon = self:findViewById(self.m_ctrl.rewardIcon);
    self.m_notRewardTips = self:findViewById(self.m_ctrl.notRewardTips);
    self.m_rewardName = self:findViewById(self.m_ctrl.rewardName);
    self.m_headBgView = self:findViewById(self.m_ctrl.headBgView);
end


MatchGameOverShareDetailLayer.__resetRankingPos = function (self)
    local bit = string.len(number.valueOf(self.m_data.Rank));
    self.m_wheatLeft:setPos(-140+(-20*bit), nil);
    self.m_rankFirst:setPos(-65+(-20*bit), nil);
    self.m_rankName:setPos(65+20*bit, nil);
    self.m_wheatRight:setPos(140+20*bit,nil);
    local tmp = {15,-10,-40,-66,-90,-114};
    self.m_rankNumView:setPos(tmp[bit],nil)
end

MatchGameOverShareDetailLayer.__showRanking = function (self)
    if self.m_data.Rank > 0 and self.m_data.Rank < 4 then
        self.m_rankFirst:setVisible(false);
        self.m_rankName:setVisible(false);
        self.m_rank:setVisible(true);
        self.m_rank:setFile("games/common/match/match_share/"..self.m_data.Rank..".png");
    else
        local rankNum = new(UserMoneyItem);
        rankNum:setAlign(kAlignCenter);
        self.m_rankNumView:addChild(rankNum);
        UserMoneyItem.setFilePath( UserMoneyItem.s_matchShareRankingNumFilePath);
        rankNum:setNormalMoneyNum(number.valueOf(self.m_data.Rank));
        UserMoneyItem.setFilePath();
        self:__resetRankingPos();
    end
end

MatchGameOverShareDetailLayer.__resetDefeatPos = function (self)
    local defeatNum = self.m_data.matchusers - self.m_data.Rank;
    local bit = string.len(number.valueOf(defeatNum));
    self.m_arrowLeft:setPos(-90-bit*13, nil);
    self.m_defeatTips:setPos(self.m_arrowLeft:getPos()+self.m_arrowLeft:getSize() + 10);
    self.m_defeatNumView:setPos(self.m_defeatTips:getPos() + self.m_defeatTips:getSize() + 10);
    self.m_defeatName:setPos(self.m_defeatNumView:getPos() + bit * 20 );
    self.m_arrowRight:setPos(self.m_defeatName:getPos() + 40);
end

MatchGameOverShareDetailLayer.__showDefeat = function (self)
    local defeatCount = number.valueOf(self.m_data.matchusers - self.m_data.Rank);
    if defeatCount == 0 then
        self:findViewById(self.m_ctrl.defeatView):setVisible(false);
        return;
    end
    local defeatNum = new(UserMoneyItem);
    defeatNum:setAlign(kAlignCenter);
    self.m_defeatNumView:addChild(defeatNum);
    UserMoneyItem.setFilePath( UserMoneyItem.s_matchShareDefeatNumFilePath);
    defeatNum:setNormalMoneyNum(defeatCount);
    UserMoneyItem.setFilePath();
    self:__resetDefeatPos();
end

MatchGameOverShareDetailLayer.__showIsReward = function (self)
    local img = self.m_data.isReward and "games/common/match/match_share/rewardLine.png" or "games/common/match/match_share/line.png";
    self.m_championLine:setFile(img);
    self.m_notRewardTips:setVisible(not self.m_data.isReward);
    
    if self.m_data.isReward then
        if not table.isEmpty(self.m_data.awardsList) then
            local param = self.m_data.awardsList[1];
            self.m_rewardName:setText(param.desc or "");
            local goodsInfo = RechargeDataInterface.getInstance():getGoodInfoByTypeId(param.type);
            if not table.isEmpty(goodsInfo) then
                ImageCache.getInstance():request(goodsInfo.item_icon, self, self.onImageDownloadedReward);
            end   
        end
    else
        if not table.isEmpty(self.m_data.awardsWiner) then
            local award = self.m_data.awardsWiner.award[1];
            local url = self.m_data.awardsWiner.icon["1"];
            if not table.isEmpty(award) then
                self.m_rewardName:setText(award.desc or "");
            end
            if url then
                ImageCache.getInstance():request(url, self, self.onImageDownloadedReward);
            end
       end
    end
end

MatchGameOverShareDetailLayer.onImageDownloadedReward = function (self, url, imagePath)
    if not string.isEmpty(imagePath) then
		self.m_rewardIcon:setFile(imagePath);
	end
end

MatchGameOverShareDetailLayer.__showHeadImage = function (self)
    self:onImageDownload();

	local url = kUserInfoData:getAvatar_b();
	if url and url~="" then
		ImageCache.getInstance():request(url,self,self.onImageDownload);
	end
end

MatchGameOverShareDetailLayer.onImageDownload = function(self,url,file)	
	if self.m_headImage then
		self.m_headImage:getParent():removeChild(self.m_headImage, true);
	end

    local headImgFile = string.isEmpty(file) and kUserInfoData:getHallHeadBySex(kUserInfoData:getSex()) or file;

	self.m_headImage = new(Mask, headImgFile, "games/common/match/match_share/mask.png");
	self.m_headBgView:addChild(self.m_headImage);
    self.m_headImage:setSize(self.m_headBgView:getSize());
end

MatchGameOverShareDetailLayer.__createMatchNameLayer = function (self)
    local lb = Label();
    lb:set_data{
        { text = self.m_data.djName
        , size = 48
        , style = Label.STYLE_NORMAL
        , color = Color(255,255,255)
        , weight = 6
        }
    }
    lb.align_h = Label.LEFT;
    local tips = self:findViewById(self.m_ctrl.matchTipsView):getWidget();
    tips:add(lb);
    lb.pos = Point((tips.width-lb.width)/2, (tips.height-lb.height)/2);
end

MatchGameOverShareDetailLayer.__initData = function (self)

    self:findViewById(self.m_ctrl.nameText):setText(UserBaseInfoIsolater.getInstance():getNickname());
    self:__createMatchNameLayer();
    self:__showRanking();
    self:__showDefeat();
    local curtime = os.date("%Y年%m月%d日 %H:%M",AppData.getInstance():getRightTimeWithServer());
    self:findViewById(self.m_ctrl.timeText):setText(curtime);
    self:__showIsReward();
    self:__showHeadImage();
end

MatchGameOverShareDetailLayer.s_controlConfig = {
    [MatchGameOverShareDetailLayer.s_controls.nameText] = {"bg", "headBg","nameBg","nameText"};
    [MatchGameOverShareDetailLayer.s_controls.headBgView] = {"bg", "headBg","headBgView"};
	[MatchGameOverShareDetailLayer.s_controls.wheatLeft] = {"bg", "headBg", "rankView","wheatLeft"};
	[MatchGameOverShareDetailLayer.s_controls.rankFirst] = {"bg", "headBg","rankView","rankFirst"};
	[MatchGameOverShareDetailLayer.s_controls.rankNumView] = {"bg", "headBg", "rankView","rankNumView"};
    [MatchGameOverShareDetailLayer.s_controls.rank] = {"bg", "headBg", "rankView","rankNumView","rank"};
    [MatchGameOverShareDetailLayer.s_controls.rankName] = {"bg", "headBg", "rankView","rankName"};
    [MatchGameOverShareDetailLayer.s_controls.wheatRight] = {"bg", "headBg", "rankView","wheatRight"};
    [MatchGameOverShareDetailLayer.s_controls.defeatView] = {"bg", "defeatView"};
    [MatchGameOverShareDetailLayer.s_controls.arrowLeft] = {"bg", "defeatView","arrowLeft"};
    [MatchGameOverShareDetailLayer.s_controls.defeatTips] = {"bg", "defeatView","defeatTips"};
    [MatchGameOverShareDetailLayer.s_controls.defeatNumView] = {"bg", "defeatView","defeatNumView"};
    [MatchGameOverShareDetailLayer.s_controls.defeatName] = {"bg", "defeatView","defeatName"};
    [MatchGameOverShareDetailLayer.s_controls.arrowRight] = {"bg", "defeatView","arrowRight"};
    [MatchGameOverShareDetailLayer.s_controls.timeText] = {"bg", "timeText"};
    [MatchGameOverShareDetailLayer.s_controls.championLine] = {"bg", "championLine"};
    [MatchGameOverShareDetailLayer.s_controls.rewardIcon] = {"bg", "prizeBg","rewardIcon"}; 
    [MatchGameOverShareDetailLayer.s_controls.rewardName] = {"bg", "prizeBg","rewardName"};
    [MatchGameOverShareDetailLayer.s_controls.notRewardTips] = {"bg", "prizeBg","notRewardTips"};
    [MatchGameOverShareDetailLayer.s_controls.matchTipsView] = {"bg", "headBg","matchTipsView"};
};

MatchGameOverShareDetailLayer.s_controlFuncMap = {
};

MatchGameOverShareDetailLayer.s_cmdConfig = {
	
};

return MatchGameOverShareDetailLayer;