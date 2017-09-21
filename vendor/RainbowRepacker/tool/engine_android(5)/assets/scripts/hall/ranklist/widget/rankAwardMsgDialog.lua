local rankAwardMsgLayout = require("view/kScreen_1280_800/hall/ranklist/rankAwardMsgLayout");

local RankAwardMsgDialog = class(CommonGameLayer, false);

RankAwardMsgDialog.s_controls = 
{	
    etName = 2;
    etPhone = 3;
    etAdress = 4;
    btnSub = 5;
    btnClose = 6;
};

RankAwardMsgDialog.s_cmds = 
{

};

RankAwardMsgDialog.ctor = function(self, data)
	super(self, rankAwardMsgLayout);
	self.m_data = data;

    self:addToRoot();
    self:setFillParent(true, true);
    self.m_ctrl = RankAwardMsgDialog.s_controls;

    self.m_etName = self:findViewById(self.m_ctrl.etName);
    self.m_etPhone = self:findViewById(self.m_ctrl.etPhone);
    self.m_etAdress = self:findViewById(self.m_ctrl.etAdress);

    self:setEventDrag(self, self.onEmptyFunc);
    self:setEventTouch(self, self.onEmptyFunc);

    RankListDataInterface.getInstance():setObserver(self);

    local adress = data.adress or "";
    local phone = data.phone or "";
    local name = data.name or "";
    self.m_etName:setText(name);
    self.m_etPhone:setText(phone);
    self.m_etAdress:setText(adress);
    self.m_socket = OnlineSocketManager.getInstance();
end

RankAwardMsgDialog.dtor = function(self)
    RankListDataInterface.getInstance():clearObserver(self);
end

RankAwardMsgDialog.onSubBtnClick = function(self)
	local name = string.trim(self.m_etName:getText());
	local phone =  string.trim(self.m_etPhone:getText());
	local adress =  string.trim(self.m_etAdress:getText());

	local errStr = "";
	if string.isEmpty(name) then
		errStr = "名字不能为空";
	elseif string.isEmpty(phone) then
		errStr = "电话不能为空";
	elseif string.isEmpty(adress) then
		errStr = "地址不能为空";
	end

    if string.isEmpty(errStr) then
        if tonumber(phone) and string.len(phone) == 11 then

        else
            errStr = "电话格式有误";
        end
    end

	if not string.isEmpty(errStr) then
		Toast.getInstance():showText(errStr,50,30,kAlginLeft,"",26,250,210,70);
		return;
	end

	LoadingView.getInstance():showText("提交中，请稍候...");
	RankListDataInterface.getInstance():submitRankAwardMsg(name, phone, adress);
end

RankAwardMsgDialog.onSubmitRankAwardMsgCallBack = function(self, isSuccess, msg)
	LoadingView.getInstance():hidden();
	if isSuccess then
		Toast.getInstance():showText(msg or "",50,30,kAlginLeft,"",26,250,210,70);
	else
		Toast.getInstance():showText(kTextNoNetworkOrRetry,50,30,kAlginLeft,"",26,250,210,70);
	end
end

RankAwardMsgDialog.onEmptyFunc = function(self)
end

RankAwardMsgDialog.onCloseBtnClick = function(self)
	self:setVisible(false);
	delete(self);
end

RankAwardMsgDialog.s_controlConfig =
{   
    [RankAwardMsgDialog.s_controls.etName] = {"content", "content_bg", "nameView", "nameBg", "et"};
    [RankAwardMsgDialog.s_controls.etPhone] = {"content", "content_bg", "phoneView", "phoneBg", "et"};
    [RankAwardMsgDialog.s_controls.etAdress] = {"content", "content_bg", "addressView", "adressBg", "et"};
    [RankAwardMsgDialog.s_controls.btnSub] = {"content", "submit_btn"};
    [RankAwardMsgDialog.s_controls.btnClose] = {"content", "detail_close_btn"};
};

RankAwardMsgDialog.s_controlFuncMap =
{
    [RankAwardMsgDialog.s_controls.btnSub] = RankAwardMsgDialog.onSubBtnClick;
    [RankAwardMsgDialog.s_controls.btnClose] = RankAwardMsgDialog.onCloseBtnClick;
};

RankAwardMsgDialog.s_cmdConfig =
{
};

return RankAwardMsgDialog
