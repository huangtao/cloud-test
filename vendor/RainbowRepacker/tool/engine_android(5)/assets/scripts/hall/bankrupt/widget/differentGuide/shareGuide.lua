--救济领取模块
require("hall/task/taskRewardDialog");
local GuideBase = require("hall/bankrupt/widget/differentGuide/guideBase");
local ShareGuide = class(GuideBase,false);

ShareGuide.ctor = function(self,data)
    UBReport.getInstance():report(UBConfig.kHallBankruptShowShare);
    self.m_data = table.verify(data);
    self.m_taskData = self:getTaskData();
    self.m_data.moneyNum = self.m_taskData.reward;
    self.m_data.isCanFreeGet = kBankruptDataInterface:isBankruptRewardRemain();
    self.m_data.startTime  = kBankruptDataInterface:getCurLeftTime();
    self.m_data.moneyCount = kBankruptDataInterface:getCurBankruptReward();
    super(self);
end

ShareGuide.dtor = function(self)

end

--重写父类函数
ShareGuide._init = function(self)
    GuideBase._init(self);
     --tittle
     if self.m_data.isCanFreeGet then
        self.m_Text_tittleRight:setVisible(true);
        self.m_Text_tittleRight:setText("00:00");
        self.m_Text_tittleLeft:setVisible(true);
        self.m_Text_tittleLeft:setText("免费救济倒计时：");
         --count down time
        self:_countDownTime(self.m_data.startTime,0);
        self.m_View_money_count:setVisible(true);
        self.m_Text_money_count:setText(self.m_data.moneyCount);
    else
        self.m_Text_tittleMiddle:setVisible(true);
        self.m_Text_tittleMiddle:setText("今日救济次数已用完");
    end

    --iconImage
    self.m_Image_iconShare:setVisible(true);

    --tips
    self.m_Text_tips:setVisible(false);
    self.m_View_upTip:setVisible(true);
    local _textLeft = "分享朋友圈，免费领取";
    local _textRight = self.m_data.moneyNum or 0;
    _textRight = "".._textRight.."银币";
    local w,h = self.m_View_upTip:getSize();
    require("uilibs/richText");
    local _tips = string.format("#c8f5c1f%s#ceb4929%s",_textLeft,_textRight );
    local richText = new(RichText, _tips, w, h, kAlignCenter, nil, 22,nil,nil,nil,true);
	richText:setAlign(kAlignCenter);
	self.m_View_upTip:addChild(richText);

    --button des
    self.m_Text_button:setText("分享朋友圈");
end

ShareGuide.getTaskData = function(self)
    local tmpTaskData = nil
    require("hall/task/data/taskRewardDataInterface");
    local _taskData = TaskRewardDataInterface.getInstance():getDayTaskList();

    for k,v in pairs(_taskData ) do
	
	    local jumpInfo = table.verify(json.decode(v.jump_code));
	    local cmd = jumpInfo.cmd;

	    if cmd == CommonJumpCmds.GOTO_WEIXIN_SHARE then
		    tmpTaskData = v;
	    end	
    end

    return tmpTaskData;
end

--重写父类函数
ShareGuide._onbutton_goClick = function(self)
    UBReport.getInstance():report(UBConfig.kHallBankruptClickShare);
    GuideBase._onbutton_goClick(self);
    --做任务
    IBaseDialog.remove("TaskRewardDialog");
 	IBaseDialog.pushDialog(new(TaskRewardDialog, TaskRewardDialog.TAB_TASK));

    TaskRewardDataInterface.getInstance():onToCompleteSomeTask(self.m_taskData); 

    IBaseDialog.remove("bankrupt");
end

return ShareGuide
