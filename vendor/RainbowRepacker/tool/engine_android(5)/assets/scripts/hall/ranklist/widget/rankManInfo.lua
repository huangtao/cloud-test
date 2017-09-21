local rankManInfo_layout = require(ViewPath.."hall/ranklist/rankManInfo_layout");
require("isolater/widget/layerManagerIsolater");


local RankManInfo = class(CommonGameLayer, false);

RankManInfo.Delegate = {
	onHideUserInfo = "onHideUserInfo";
	sendDirectMsg = "sendDirectMsg";
};

RankManInfo.s_controls =
{
    bg = 1,
    infobg = 2,
    closeBtn = 3,
    ID = 4,
    sexImage = 5,
    nick = 6,
    assets = 7,
    crystal = 8,
    sendMsgBtn = 9,
	headImage = 10,
	processImage = 11,
	leve = 12,
	isFriendsText = 13;
	vip = 14,
	reportBtn  = 15,
};

RankManInfo.ctor = function(self, data,parent)
	super(self, rankManInfo_layout);
	self.m_parentObj = parent;
	self.m_info = data or {};

	self:findViewById(RankManInfo.s_controls.bg):setEventDrag(self, self.onBgImageClick);
  	self.m_headImageBg = self:findViewById(RankManInfo.s_controls.headImage);
	if not table.isEmpty(self.m_info)  then
		-- XXX 列表已经下载为何还要再下载一次？
		local idText = self:findViewById(RankManInfo.s_controls.ID);
		local nickText = self:findViewById(RankManInfo.s_controls.nick);
		local assetsText = self:findViewById(RankManInfo.s_controls.assets);
		local crystalText = self:findViewById(RankManInfo.s_controls.crystal);
		local sexImage = self:findViewById(RankManInfo.s_controls.sexImage);
		local processImage = self:findViewById(RankManInfo.s_controls.processImage);
		local leve = self:findViewById(RankManInfo.s_controls.leve);
	    local isFriendsText = self:findViewById(RankManInfo.s_controls.isFriendsText);
	    local sendMsgBtn = self:findViewById(RankManInfo.s_controls.sendMsgBtn);
		local vipImage = self:findViewById(RankManInfo.s_controls.vip);
        local infobg = self:findViewById(RankManInfo.s_controls.infobg);

		sexImage:setFile( kUserInfoData:getSexIconBySex(self.m_info.sex) );
		
		self:__setHeadImage( kUserInfoData:getHallHeadBySex(self.m_info.sex) );
		ImageCache.getInstance():request(self.m_info.icon,self,self.onHeadImageDownload);
		
		idText:setText(string.concat("ID",":",self.m_info.cid or "0"));
		nickText:setText( string.subUtfStrByCn(self.m_info.nick, 1, 6, "...") );
		assetsText:setText(self.m_info.money);
            crystalText:setText(self.m_info.silver or 0);
            infobg:getChildByName("Text5"):setText("金条：");
            infobg:getChildByName("Image21"):setFile("isolater/crystal.png");
        
		local sizeWidth,sizeHeight = processImage:getSize();
		local pe =  kUserLevelConfigInterface:countLevelPercent(self.m_info.exp);
		local pe_sizeWidth = sizeWidth*pe;
		if pe_sizeWidth <40 then
			pe_sizeWidth = 40;
		end

		processImage:setSize(pe_sizeWidth,nil); --和背景保持点缝隙(左右都需要)


		local leveNum = kUserLevelConfigInterface:countLevelByExp(self.m_info.exp);

		leve:setText(string.concat("LV",leveNum));

		if tonumber(self.m_info.mid) == tonumber(kUserInfoData:getUserId()) then
			sendMsgBtn:setVisible(false);
			reportBtn = self:findViewById(RankManInfo.s_controls.reportBtn):setVisible(false);
		end
		if self.m_info.is_friend == 1 or self.m_info.is_friend =="1" then --是好友
			isFriendsText:setText("已是好友");
			sendMsgBtn:setEnable(false);
		end
		
		if self.m_info.is_vip == 1 or self.m_info.is_vip =="1" then --是vip
			vipImage:setVisible(true);
		end
	end
end

RankManInfo.setReportBtnVisible = function(self,p_bool)
	self:findViewById(RankManInfo.s_controls.reportBtn):setVisible(p_bool);
end

RankManInfo.onHeadImageDownload = function(self,url,fileName)	
	if not string.isEmpty(fileName) then
      	self:__setHeadImage(fileName);
	end
end

RankManInfo.__setHeadImage = function (self, image)
    if self.m_headImage then
		self.m_headImageBg:removeChild(self.m_headImage);
	end
	delete(self.m_headImage);
	self.m_headImage = new(Mask, image, "hall/common/mask_head_156.png");
	self.m_headImageBg:addChild(self.m_headImage);
	self.m_headImage:setAlign(kAlignCenter);
end

RankManInfo.dtor = function(self)
	ImageCache.getInstance():cleanRef(self);
end

RankManInfo.onBgImageClick = function (self)

end

RankManInfo.onCloseBtnClick = function (self)
	self:execDelegate(RankManInfo.Delegate.onHideUserInfo, true);
end

RankManInfo.onSendMsgBtnClick = function (self)
   self:execDelegate(RankManInfo.Delegate.sendDirectMsg, self.m_info.cid);
end

RankManInfo.onreportBtnClick = function(self)
    self:onCloseBtnClick();
	LayerManagerIsolater.getInstance():show("commonReport",self.m_info.mid,"name_head",false);
end

RankManInfo.s_controlConfig = 
{
	[RankManInfo.s_controls.bg] = {"bg"};
	[RankManInfo.s_controls.infobg] = 	{"infobg"};
	[RankManInfo.s_controls.closeBtn] = {"infobg","closeBtn"};
	[RankManInfo.s_controls.ID] = {"infobg","ID"};
	[RankManInfo.s_controls.sexImage] = {"infobg","sexImage"};
	[RankManInfo.s_controls.nick] = {"infobg","nick"};
	[RankManInfo.s_controls.assets] = {"infobg","assets"};
	[RankManInfo.s_controls.crystal] = {"infobg","crystal"};
	[RankManInfo.s_controls.sendMsgBtn] = {"infobg","sendMsgBtn"};
	[RankManInfo.s_controls.isFriendsText] ={"infobg","sendMsgBtn","isFriendsText"};
	[RankManInfo.s_controls.headImage] = {"infobg","headImage"};
	[RankManInfo.s_controls.processImage] = {"infobg","processImage"};
	[RankManInfo.s_controls.leve] = {"infobg","leve"};
	[RankManInfo.s_controls.vip] = {"infobg","vipImage"};
	[RankManInfo.s_controls.reportBtn] = {"infobg","reportBtn"};
}

RankManInfo.s_controlFuncMap =
{	
	[RankManInfo.s_controls.bg] = RankManInfo.onBgImageClick,
	[RankManInfo.s_controls.sendMsgBtn] = RankManInfo.onSendMsgBtnClick,
	[RankManInfo.s_controls.closeBtn] = RankManInfo.onCloseBtnClick,
	[RankManInfo.s_controls.reportBtn] = RankManInfo.onreportBtnClick,

}

return RankManInfo