require("isolater/common/commonController");
require("hall/common/commonJumpLogic")

CommunityController = class(CommonController);
local CommunityScene = require("hall/community/communityScene");
local h_index = 0;
local getIndex = function(self)
	h_index = h_index + 1;
	return h_index;
end

CommunityController.s_cmds =
{
	onBackClick = getIndex(),
    onChangeToOtherState = getIndex();
};

CommunityController.ctor = function(self, state, viewClass, viewConfig)
	self.m_state = state;
    CommunityDataInterface.getInstance():setObserver(self);
end

CommunityController.dtor = function(self)
    CommunityDataInterface.getInstance():clearObserver(self);
end

CommunityController.resume = function(self)
	CommonController.resume(self);
end

CommunityController.pause = function(self)
	CommonController.pause(self);
end

CommunityController.onBackClick = function(self)
    if IBaseDialog.isDialogShowing() then
        IBaseDialog.hide();
        return;
    end
	GameManager.getInstance():startGame(GameType.HALL);
end

CommunityController.onRefreshUnReadMessageNumCallBack = function(self)
    self:updateView(CommunityScene.s_cmds.refreshUnReadMessageNum) 
end
CommunityController.onChangeToOtherState = function(self, state, ...)
	self.m_state:changeState(state, ...);
end

CommunityController.onAddFriendResultCallBack = function (self,isSuccess,data)
    if isSuccess then
         local msg = data.result == 1 and data.nickname.."已添加为好友" or data.nickname.."拒绝加为好友";
         self:showNoticeView(msg);
    end
end

CommunityController.showNoticeView = function(self,msg,width ,height)
    Toast.setDefaultDisplayTime(ImSdkConstants.toastDisplayTime);
    Toast.getInstance():showTextView(msg,width or 640, height or 60,kAlignCenter,"",30,200,175,115);
    Toast.setDefaultDisplayTime();
end 

CommunityController.s_cmdConfig =
{
	[CommunityController.s_cmds.onBackClick] 		= CommunityController.onBackClick,
	[CommunityController.s_cmds.onChangeToOtherState] = CommunityController.onChangeToOtherState;
};

CommunityController.socketEventFuncMap =
{
	
};
