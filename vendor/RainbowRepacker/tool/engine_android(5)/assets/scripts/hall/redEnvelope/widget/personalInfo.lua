require("hall/community/data/communityDataInterface");
local RankManInfo = require("hall/ranklist/widget/rankManInfo")
local PersonalInfo = class(RankManInfo);
--重写方法

PersonalInfo.ctor = function(self)
	CommunityDataInterface.getInstance():setObserver(self);
	self:findViewById(RankManInfo.s_controls.sendMsgBtn):setOnClick(self,self.onSendMsgBtnClick);
end

PersonalInfo.dtor = function(self)
	CommunityDataInterface.getInstance():clearObserver(self);
end

PersonalInfo.onSendMsgBtnClick = function (self)
	local param = {};
    param.dst_cid = self.m_info.cid;
    param.message = "";
    CommunityDataInterface.getInstance():requestAddFriend(param.dst_cid,param.message);
end


PersonalInfo.onRequestAddFriendCallBack = function(self, isSuccess, msg)
	msg = isSuccess and "发送成功，等待验证" or  "发送失败，请稍后重试";
	Toast.getInstance():showText(msg, 400,60 , kAlignCenter, "", 30,200,175,115);
end

return PersonalInfo;