-- ReportViewBase.lua
-- Author:Demon
-- Date:2016/1/6
-- Last modification:
-- Description:
-- Note:
require("view/kScreen_1280_800/games/gamesCommon/roomReport");
require("hall/report/reportPlayerData");
require("common/IPopDialogManager");

local _index = 0;
local function getIndex()
	_index = _index + 1;
	return _index;
end	

local hallLayerBaseWithName = require("hall/widget/hallLayerBaseWithName")
local ReportViewBase = class(hallLayerBaseWithName,false);
ReportViewBase.layerName = "commonReport";

ReportViewBase.s_controls =
{
	touchLayer     = getIndex(),
	ImageBack      = getIndex(),
	CheckBoxGroup1 = getIndex(),
	Button_Cancel  = getIndex(),
	Button_Sure    = getIndex(),
};

ReportViewBase.s_TYPE_HEAD = 2; 									--这里填写服务器给的标识
ReportViewBase.s_TYPE_NAME = 1;
ReportViewBase.s_TYPE_GAME = 3;
ReportViewBase.s_TYPE_MATCH = 4;

ReportViewBase.ctor = function(self,id,whichItems,isDefaultSelectedAll,selectItemIndex)	
	
	--编辑器没有file1,file2接口，只能赶在new之前改变类默认images,这样做存在隐患。后面点改成手动创建。
	CheckBox.setDefaultImages({"games/common/checkbox/report_select_back.png","games/common/checkbox/report_select.png"});
	super(self,roomReport,nil,self.layerName);
	CheckBox.setDefaultImages(nil); 								 --恢复默认值
	
	self:setLevel(21);
	self:setFillParent(true, true);
    self:addToRoot();
	self.m_otherId = id;
	self.m_whichItems = whichItems or "all";
	if self.m_whichItems == "match_cheat" then 
		self.m_boxIndexMatchServer = {   
			[1] = ReportViewBase.s_TYPE_MATCH,
		};
	else  										
		self.m_boxIndexMatchServer = {
			[1] = ReportViewBase.s_TYPE_GAME,
			[2] = ReportViewBase.s_TYPE_NAME,
			[3] = ReportViewBase.s_TYPE_HEAD,
		};
	end 
	
	IPopDialogManager.getInstance():addPopDialog(self, 101, self.close,self);
	self:findViewById(ReportViewBase.s_controls.touchLayer):setEventDrag(nil, function()
		end);
	
	self:init(isDefaultSelectedAll,selectItemIndex);
end

ReportViewBase.dtor = function(self)	
	ShaderManager.removeShader( self:findViewById(self.s_controls.touchLayer) );

	IPopDialogManager.getInstance():removePopDialog(self);
end

ReportViewBase.getHandle = function(self)
	self.m_checkBoxGroup = self:findViewById(self.s_controls.CheckBoxGroup1);
	self.m_Button_Sure = self:findViewById(self.s_controls.Button_Sure);
end	

ReportViewBase.init = function(self,isDefaultSelectedAll,selectItemIndex)
	self:getHandle(); 												--得到需要调用的控件句柄	
	self:changeUi(isDefaultSelectedAll,selectItemIndex);
end	

ReportViewBase.changeUi = function(self,isDefaultSelectedAll,selectItemIndex)
	self.m_Button_Sure:setEnable(false);

	if self.m_whichItems == "match_cheat" then
		self.m_checkBoxGroup:removeCheckBoxByIndex(2,true);				--删除不用的
		self.m_checkBoxGroup:removeCheckBoxByIndex(2,true);		
		
		local item = self.m_checkBoxGroup:getCheckBox(1);
		item:addPropTranslateSolid(1,0,50);--重新布置位置，
		local name = item:getChildByName("Text211");
		if name then 
			name:setText("比赛作弊");
		end 
				
		self.m_boxIndexMatchServer = {    								-- 复选框对应的类型调整
			[1] = ReportViewBase.s_TYPE_MATCH,
		};

	elseif self.m_whichItems == "only_game" then
		
		self.m_checkBoxGroup:removeCheckBoxByIndex(2,true);				--删除不用的
		self.m_checkBoxGroup:removeCheckBoxByIndex(2,true);
		
		
		self.m_checkBoxGroup:getCheckBox(1):addPropTranslateSolid(1,0,50);--重新布置位置，
		
		
		self.m_boxIndexMatchServer = {    								-- 复选框对应的类型调整
			[1] = ReportViewBase.s_TYPE_GAME,
		}	
	elseif self.m_whichItems == "name_head" then 									--如果不在大厅则去掉游戏作弊复选框
		
		self.m_checkBoxGroup:removeCheckBoxByIndex(1,true);
		
		for i = 1, 2 do
			self.m_checkBoxGroup:getCheckBox(i):addPropTranslateSolid(1,0,-50);
		end
		
		self.m_boxIndexMatchServer = {    								
			[1] = ReportViewBase.s_TYPE_NAME,
			[2] = ReportViewBase.s_TYPE_HEAD,
		}
	elseif self.m_whichItems == "all" then 									
		--不改变
	end
 	
 	if isDefaultSelectedAll then 
		for k,_ in pairs(self.m_boxIndexMatchServer) do 
			local item = self.m_checkBoxGroup:getCheckBox(k);
			item:setChecked(true);
		end
		self.m_Button_Sure:setEnable(true);
	else 
		if not table.isEmpty(selectItemIndex) then
			local isSelected;
			for _,v in pairs(selectItemIndex) do 
				local item = self.m_checkBoxGroup:getCheckBox(v);
				if item then 
					item:setChecked(true);
					isSelected = true;					
				end 
			end 
			self.m_Button_Sure:setEnable(isSelected);
		end 
	end  
end	

ReportViewBase.getReportType = function(self) 						--得到此时的举报类型
	
	local _stateTabble = self.m_checkBoxGroup:getResultPairs();
	
	local typeString = "";
	if table.getn(_stateTabble) == 0 then  							--防呆
		return typeString;
	end	
	
	for k,v in pairs(_stateTabble) do  								--合成服务器约定的格式
		if v then
			typeString = typeString..self.m_boxIndexMatchServer[k]..",";
		end
	end
	
	typeString = string.sub(typeString,1,-2);
	return typeString;
end

ReportViewBase.ontouchLayerClick = function(self, finger_action, x, y, drawing_id_first, drawing_id_current)
	if finger_action == kFingerUp then
		self:close();
	end
end

ReportViewBase.onimageBackClick = function(self)
end

ReportViewBase.oncheckBoxGroup1Click = function(self)
	local _stateTabble = self.m_checkBoxGroup:getResultPairs();
	local flag = false;
	for k,v in pairs(_stateTabble) do  
		if v then
			flag = true;
		end
	end
	
	if flag then
		self.m_Button_Sure:setEnable(true);
	else	
		self.m_Button_Sure:setEnable(false);
	end
end

ReportViewBase.onbutton_CancelClick = function(self)
	self:close();
end

ReportViewBase.onbutton_SureClick = function(self)
	local reportType = self:getReportType();
	if reportType == "" then
		return;
	end
	ReportPlayerData:getInstance():requestReport(self.m_otherId,nil ,nil,reportType);
	self:close();
end

ReportViewBase.s_controlConfig = 
{
	[ReportViewBase.s_controls.touchLayer]     = { "touchLayer"},
	[ReportViewBase.s_controls.ImageBack]  	   = {"ImageBack"},
	[ReportViewBase.s_controls.CheckBoxGroup1] = { "ImageBack", "CheckBoxGroup1"},
	[ReportViewBase.s_controls.Button_Cancel]  = { "ImageBack", "Button_Cancel"},
	[ReportViewBase.s_controls.Button_Sure]    = { "ImageBack", "Button_Sure"},
};

ReportViewBase.s_controlFuncMap = 
{
	[ReportViewBase.s_controls.touchLayer]     = ReportViewBase.ontouchLayerClick;
	[ReportViewBase.s_controls.ImageBack]      = ReportViewBase.onimageBackClick;
	[ReportViewBase.s_controls.CheckBoxGroup1] = ReportViewBase.oncheckBoxGroup1Click;
	[ReportViewBase.s_controls.Button_Cancel]  = ReportViewBase.onbutton_CancelClick;
	[ReportViewBase.s_controls.Button_Sure]    = ReportViewBase.onbutton_SureClick;
};


return ReportViewBase;