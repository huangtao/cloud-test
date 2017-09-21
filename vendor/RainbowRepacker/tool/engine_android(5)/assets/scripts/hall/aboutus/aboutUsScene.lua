require("common/commonScene");
local aboutus_map = require("qnFiles/qnPlist/hall/aboutus")
local AboutUsScene = class(CommonScene);

local h_index = 0;
local getIndex = function(self)
	h_index = h_index + 1;
	return h_index;
end

AboutUsScene.s_controls = 
{	
	backBtn = getIndex(),

	tabAboutUs = getIndex();
	tabAgreement = getIndex();
	tabPrivacy = getIndex();
	tabVersion = getIndex();

	versionBtn = getIndex(),
	privacyBtn = getIndex(),
	agreementBtn = getIndex(),
	aboutUsBtn = getIndex(),

	--{"关于我们", "服务协议", "隐私策略", "版号声明"};
	aboutUsView = getIndex(),
	agreementView = getIndex(),
	privacyView   = getIndex(),
	versionView   = getIndex(),
	rightContent  = getIndex(),
	versionCode   = getIndex(),

	productName = getIndex(),
	versionViewProductName = getIndex(),
	gamesStatement = getIndex(),
	company = getIndex(),
	copyrightText = getIndex(),
}

AboutUsScene.s_cmds = 
{
	initViewData = 1,
}

AboutUsScene.s_tabImageName = 
{
	[AboutUsScene.s_controls.aboutUsBtn] = {"aboutus_nor.png", "aboutus_sel.png"},
	[AboutUsScene.s_controls.agreementBtn] = {"service_nor.png", "service_sel.png"},
	[AboutUsScene.s_controls.privacyBtn] = {"privacy_nor.png", "privacy_sel.png"},
	[AboutUsScene.s_controls.versionBtn] = {"version_nor.png", "version_sel.png"},
}

AboutUsScene.ctor = function(self,viewConfig, controller)
	self.m_controller = controller;
	self.m_ctrls = AboutUsScene.s_controls;
	self.m_versionBtn = self:findViewById(self.s_controls.versionBtn);
	self.m_privacyBtn = self:findViewById(self.s_controls.privacyBtn);
	self.m_agreementBtn = self:findViewById(self.s_controls.agreementBtn);
	self.m_aboutUsBtn = self:findViewById(self.s_controls.aboutUsBtn);
    
    self.m_aboutUsView = self:findViewById(self.s_controls.aboutUsView);
    self.m_agreementView = self:findViewById(self.s_controls.agreementView);
    self.m_privacyView = self:findViewById(self.s_controls.privacyView);
    self.m_versionView = self:findViewById(self.s_controls.versionView);

	self.m_productName = self:findViewById(self.m_ctrls.productName);
	self.m_versionCodeText = self:findViewById(self.m_ctrls.versionCode);
	self.m_versionViewProductName = self:findViewById(self.m_ctrls.versionViewProductName);
	self.m_gamesStatement = self:findViewById(self.m_ctrls.gamesStatement);
	self.m_rightContent = self:findViewById(self.m_ctrls.rightContent);
	self.m_company = self:findViewById(self.m_ctrls.company);
	self.m_copyrightText = self:findViewById(self.m_ctrls.copyrightText);
end

AboutUsScene.resume = function(self)
	CommonScene.resume(self);
	self:initTabs();
	self:initView();
end

AboutUsScene.pause = function(self)
	CommonScene.pause(self);
end

AboutUsScene.dtor = function(self)
	HallDataInterface.getInstance():setWebViewShowing(false);
end

AboutUsScene.initView = function(self)
	--初始化一些数据
	local productName = RegionConfigDataInterface.getInstance():getRegionProductName();
	self.m_productName:setText(productName);
	self.m_versionViewProductName:setText("《"..productName.."》");
	self.m_gamesStatement:setText( RegionConfigDataInterface.getInstance():getGamesStatement() );
	self.m_company:setText( RegionConfigDataInterface.getInstance():getAboutusCompanyName() );
	self.m_copyrightText:setText( RegionConfigDataInterface.getInstance():getAboutusCopyrightText());

	local hallVersion=kGameManager:getGameVersion(GameType.HALL);
	local apkVersion = kClientInfo:getApkVersion();
	local appVer = "";
	if apkVersion then
		appVer = "V" .. apkVersion .. "." .. hallVersion;
	else
		appVer = hallVersion;
	end

	local channelId = kClientInfo:getChannelId();
	if channelId ~= "" then
		appVer = appVer .. "(" .. channelId .. ")";
	end
	
	self.m_versionCodeText:setText(appVer);
	self:onAboutUsClick();
	--获取右侧内容区域大小和位置
	Log.d("rightContent pos: ", self.m_rightContent:getAbsolutePos());
	Log.d("rightContent size: ", self.m_rightContent:getSize());
	kSecrecyData:setWebViewPos(self.m_rightContent:getAbsolutePos());
	local w,h = self.m_rightContent:getSize();
	kSecrecyData:setWebViewSize(w*System.getLayoutScale(),h*System.getLayoutScale());
end

AboutUsScene.initTabs = function(self)
	local viewsCtrls = {
		[1]	= self.m_ctrls.tabAboutUs,
		[2] = self.m_ctrls.tabAgreement,
		[3] = self.m_ctrls.tabPrivacy,
		[4] = self.m_ctrls.tabVersion
	};

	local tabNames = {"aboutUsView", "agreementView", "privacyView", "versionView"};
    local regionNames = RegionConfigDataInterface.getInstance():getAboutusTabSortedNames();
	local startPos = 20;
	local space = 0;
	for index = #tabNames, 1, -1 do
		local ctrl = self:findViewById( viewsCtrls[index] );
		local hasFound = false;
		for _, v in ipairs( table.verify(regionNames) ) do
			if tabNames[index] == v then
				ctrl:setVisible(true);
				ctrl:setPos(startPos, nil);
				local w, _ = ctrl:getSize();
				startPos = startPos + w + space;

				hasFound = true;
				break;
			end
		end

		if not hasFound then
			ctrl:setVisible(false);
		end
	end
end

--版本声明
AboutUsScene.onVersionClick = function(self)
    self:setSelectTab(self.m_versionBtn);
    self:showViews(self.m_versionView);
end

--隐私策略
AboutUsScene.onPrivacyClick = function(self)
    self:setSelectTab(self.m_privacyBtn);
    self:showViews(self.m_privacyView);
end

--服务协议
AboutUsScene.onAgreementClick = function(self)
    self:setSelectTab(self.m_agreementBtn);
    self:showViews(self.m_agreementView);
end

--关于我们
AboutUsScene.onAboutUsClick = function(self)
    self:setSelectTab(self.m_aboutUsBtn);
    self:showViews(self.m_aboutUsView);
end

AboutUsScene.setSelectTab = function(self, selectTab)
    self:resetTabs();
    local tabs = {self.m_aboutUsBtn, self.m_agreementBtn, self.m_privacyBtn, self.m_versionBtn};
	local tabIndexs = {AboutUsScene.s_controls.aboutUsBtn, AboutUsScene.s_controls.agreementBtn, AboutUsScene.s_controls.privacyBtn, AboutUsScene.s_controls.versionBtn};
	self.m_curShowTab = selectTab;
	for k, v in pairs(tabs) do
		if v == selectTab then
			v:getChildByName("tabText"):setFile(aboutus_map[AboutUsScene.s_tabImageName[tabIndexs[k]][2]]);
			v:getChildByName("selImg"):setVisible(true);
			v:setPickable(false);
		else
			v:getChildByName("selImg"):setVisible(false);
			v:setPickable(true);
		end
	end
end

AboutUsScene.resetTabs = function (self)
    self.m_aboutUsBtn:getChildByName("tabText"):setFile(aboutus_map[AboutUsScene.s_tabImageName[AboutUsScene.s_controls.aboutUsBtn][1]]);
	self.m_agreementBtn:getChildByName("tabText"):setFile(aboutus_map[AboutUsScene.s_tabImageName[AboutUsScene.s_controls.agreementBtn][1]]);
	self.m_privacyBtn:getChildByName("tabText"):setFile(aboutus_map[AboutUsScene.s_tabImageName[AboutUsScene.s_controls.privacyBtn][1]]);
	self.m_versionBtn:getChildByName("tabText"):setFile(aboutus_map[AboutUsScene.s_tabImageName[AboutUsScene.s_controls.versionBtn][1]]);
end

AboutUsScene.showViews = function (self,selectViews)
    local views = {self.m_aboutUsView,self.m_agreementView,self.m_privacyView,self.m_versionView};
    for k,v in pairs(views) do
        if v == selectViews then
            v:setVisible(true);
            if selectViews == self.m_agreementView or selectViews == self.m_privacyView  then
                if selectViews == self.m_agreementView then
                    self:requestCtrlCmd(AboutUsController.s_cmds.open_secrecy, "service");
                elseif selectViews == self.m_privacyView then
                    self:requestCtrlCmd(AboutUsController.s_cmds.open_secrecy, "secrecy");
                end
                HallDataInterface.getInstance():setWebViewShowing(true);
            else 
                NativeEvent.getInstance():hideWebView();
                HallDataInterface.getInstance():setWebViewShowing(false);
            end
        else
            v:setVisible(false);
        end
    end
end

AboutUsScene.onReturnBtnClick = function(self)
	self:requestCtrlCmd(AboutUsController.s_cmds.goBack);
end


AboutUsScene.s_controlConfig = 
{
	[AboutUsScene.s_controls.backBtn] 		= {"top" , "backBtn"},
	[AboutUsScene.s_controls.rightContent]  = {"content", "c_right"};

	[AboutUsScene.s_controls.aboutUsView] 	= {"content" , "c_right" , "aboutView"},
	[AboutUsScene.s_controls.productName]   = {"content" , "c_right" , "aboutView" , "productName"};
	[AboutUsScene.s_controls.versionCode]	= {"content" , "c_right" , "aboutView", "version"};
	[AboutUsScene.s_controls.company]       = {"content" , "c_right" , "aboutView", "company"};
	[AboutUsScene.s_controls.copyrightText]       = {"content" , "c_right" , "aboutView", "copyrightText"};


	[AboutUsScene.s_controls.agreementView] 	= {"content" , "c_right" , "agreementView"},
	[AboutUsScene.s_controls.privacyView] 	= {"content" , "c_right" , "privacyView"},
	[AboutUsScene.s_controls.versionView] 	= {"content" , "c_right" , "versionView"},
	[AboutUsScene.s_controls.versionViewProductName] = {"content" , "c_right" , "versionView", "View1", "title"},
	[AboutUsScene.s_controls.gamesStatement] = {"content" , "c_right" , "versionView", "View1", "games_statement"},

	[AboutUsScene.s_controls.tabAboutUs]	= {"top", "topView", "aboutUsView"},
	[AboutUsScene.s_controls.tabAgreement]	= {"top", "topView", "agreementView"},
	[AboutUsScene.s_controls.tabPrivacy]	= {"top", "topView", "privacyView"},
	[AboutUsScene.s_controls.tabVersion]	= {"top", "topView", "versionView"},
	
	[AboutUsScene.s_controls.versionBtn]	= {"top", "topView", "versionView", "tab1Btn"},
	[AboutUsScene.s_controls.privacyBtn]	= {"top", "topView", "privacyView", "tab2Btn"},
	[AboutUsScene.s_controls.agreementBtn]	= {"top", "topView", "agreementView", "tab3Btn"},
	[AboutUsScene.s_controls.aboutUsBtn]	= {"top", "topView", "aboutUsView", "tab4Btn"},
}

AboutUsScene.s_controlFuncMap = 
{
	[AboutUsScene.s_controls.backBtn] = AboutUsScene.onReturnBtnClick ;
	[AboutUsScene.s_controls.versionBtn] = AboutUsScene.onVersionClick,
	[AboutUsScene.s_controls.privacyBtn] = AboutUsScene.onPrivacyClick,
	[AboutUsScene.s_controls.agreementBtn] = AboutUsScene.onAgreementClick,
	[AboutUsScene.s_controls.aboutUsBtn] = AboutUsScene.onAboutUsClick,
}

AboutUsScene.s_cmdConfig = 
{
	[AboutUsScene.s_cmds.initViewData] = AboutUsScene.onInitViewData,
}

return AboutUsScene