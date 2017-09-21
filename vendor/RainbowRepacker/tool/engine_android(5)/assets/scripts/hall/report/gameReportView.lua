-- Author:Demon
-- Date:2016/1/11
-- Last modification:
-- Description:
-- Note:

local ReportViewBase = require("hall/report/reportViewBase");
local GameReportView = class(ReportViewBase,false);
--id:被举报人id，isInRoom:在房间内:true,大厅：false,
-- isDefaultSelectedAll:是否默认选中全部选项，可不传
-- selectItemIndex:被选中的那些选项的index(table)，可不传
GameReportView.ctor = function(self,id,whichItems,isPlaying,isDefaultSelectedAll,selectItemIndex) 
	self.m_isPlaying = isPlaying or false;
	super(self,id,whichItems,isDefaultSelectedAll,selectItemIndex);
end

GameReportView.init = function(self,...)
	
	--如果在游戏里面self.m_whichItems才生效
	ReportViewBase.init(self,...);
	self.m_Button_Sure:setOnClick(self,self.onbutton_SureClick); 		--重新绑定
end	

--是否有举报游戏作弊
GameReportView.isContainGame = function(self,reportType)
	local isHaveGameType = string.find(reportType,""..ReportViewBase.s_TYPE_GAME);
	isHaveGameType =  isHaveGameType or false;
	return isHaveGameType;
end
	
--是否举报同一个人
GameReportView.isReportSamePersonForGame = function(self,reportType)
	
	local isContainGame = self:isContainGame(reportType);
	if not isContainGame then
		return false;
	end	
	
	if self.m_isPlaying == true then
		local tempResult = ReportPlayerData.getInstance():isOldId(self.m_otherId);
		 ReportPlayerData.getInstance():pushLastIds(self.m_otherId);
		return tempResult;
	end
	return false;
end	

--重写举报按钮回掉，同一牌局ID举报游戏作弊，第二次及以后不再向服务器发送请求。
GameReportView.onbutton_SureClick = function(self)
		
	local reportType = self:getReportType();
	if reportType == "" then
		return;
	end
	
	local isSame = self:isReportSamePersonForGame(reportType);
	
	if isSame then
		local tmpSuccesString = GameString.get("kReportSucces");
		Toast.getInstance():showText(tmpSuccesString..".",50,30,kAlignLeft,"",24,200,175,110);
	else
		ReportPlayerData:getInstance():requestReport(self.m_otherId,nil,nil,reportType);	
	end
	
	self:close();
end

return GameReportView;