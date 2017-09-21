
local match_chat_addAndReport = require(ViewPath .. "games/common2/match/match_chat_addAndReport");
require("games/common2/module/logic/communityLogic");


local MatchAddAndReport = class(CommonGameLayer,false);
local COUNT_DOWN = 15

local h_index = 0;
local getIndex = function(self)
    h_index = h_index + 1;
    return h_index;
end

--比赛列表点击报名，确认弹框
MatchAddAndReport.s_controls =
{
    Button_add    = getIndex(),
    Button_report = getIndex(),
    Button_report_text = getIndex(),
    name = getIndex(),
};

MatchAddAndReport.ctor = function(self)
    super(self,match_chat_addAndReport);
    self:setSize(self.m_root:getSize());
end

MatchAddAndReport.dtor = function(self)
    if self.m_clockHandle then 
        self.m_clockHandle:cancel();
    end 
    self.m_clockHandle = nil;
end

MatchAddAndReport.refreshData = function(self,data)
	data = table.verify(data);
	self.m_data = data;

	self:_init();
end

-----------------------------------------------------------
MatchAddAndReport._init = function(self)
    self.m_Button_report = self:findViewById(self.s_controls.Button_report);
    self.m_Button_report_text = self:findViewById(self.s_controls.Button_report_text);
    local nameStr = self.m_data.userName or "";
    local subNameStr = string.subUtfStr(nameStr, 1, 12, "");
    if string.len(nameStr) > string.len(subNameStr) then
        subNameStr = string.subUtfStr(nameStr, 1, 11, "...");
    end

    local name = self:findViewById(self.s_controls.name);
    name:setText(subNameStr);

    local addBtn = self:findViewById(self.s_controls.Button_add);
    local text = addBtn:getChildByName("text");
    local img = addBtn:getChildByName("img");
    if CommunityIsolater.getInstance():checkIsFriend(self.m_data.cid) then
        text:setText("已是好友");
        text:setPos(0);
        img:setVisible(false);
        addBtn:setEnable(false);
    else
        text:setText("好友");
        text:setPos(15);
        img:setVisible(true);
        addBtn:setEnable(true);
    end
    local dis = 98;
    local w,h = self:getSize();
    local x = number.valueOf(self.m_data.x);
    local y = number.valueOf(self.m_data.y);
    local width = System.getScreenScaleWidth();
    local height = System.getScreenScaleHeight();
    x = x <= 0 and 0 or x;
    x = x >= width and width - w or x;

    y = y <= 0 and 0 or y;
    y = y >= (height - h - dis) and (height - h - dis) or y;

    self:setPos(x,y);
end

MatchAddAndReport.onbutton_addClick = function(self)
    if not CommunityIsolater.getInstance():checkIsFriend(self.m_data.cid) then
        CommunityLogic.getInstance():requestAddFriend(self.m_data.cid);

        self:_close();
    end
end

MatchAddAndReport.onbutton_reportClick = function(self)
    self.m_Button_report:setGray(true)
    self.m_Button_report:setEnable(false)
    self.m_Button_report_text:setText(string.format("举报(%sS)", COUNT_DOWN))
    local countdown = 0
    local function cb()
        if not self.m_Button_report or not self.m_Button_report_text then
            return true
        end
        countdown = countdown + 1
        if countdown >= COUNT_DOWN then
            self.m_Button_report:setGray(false)
            self.m_Button_report:setEnable(true)
            self.m_Button_report_text:setText("举报")
            return true
        else
            self.m_Button_report_text:setText(string.format("举报(%sS)", COUNT_DOWN - countdown))
        end
    end
    self.m_clockHandle = Clock.instance():schedule(cb, 1, COUNT_DOWN);
	local myUserId = UserBaseInfoIsolater.getInstance():getUserId();
    local info = {mid = myUserId,otherMid = self.m_data.mid or 0};

    SocketIsolater.getInstance():sendMsg(MatchSocketCmd.CLIENT_CMD_MATCH_CHAT_COMPLAINT, info);

    local tmpSuccesString = GameString.get("kReportNewSucces")
    local chatInfo = {
        sendFlag = -1,
        msgInfo = tmpSuccesString,
    }
    MatchMechine.getInstance():receiveAction(MatchMechineConfig.ACTION_GET_CHAT_MSG, chatInfo);

    self:_close();
end

MatchAddAndReport._close = function(self)
	EventDispatcher.getInstance():dispatch("match_cancle_select_chat_item_event");
	self:hide();
end

MatchAddAndReport.s_controlConfig =
{
    [MatchAddAndReport.s_controls.Button_add]    = {"bg", "Button_add"},
	[MatchAddAndReport.s_controls.Button_report] = {"bg", "Button_report"},
    [MatchAddAndReport.s_controls.Button_report_text] = {"bg", "Button_report", "text"},
    [MatchAddAndReport.s_controls.name] = {"bg", "name"},
};

MatchAddAndReport.s_controlFuncMap =
{
    [MatchAddAndReport.s_controls.Button_add]    = MatchAddAndReport.onbutton_addClick;
	[MatchAddAndReport.s_controls.Button_report] = MatchAddAndReport.onbutton_reportClick;
};

return MatchAddAndReport;