-- 定制说明：
-- 大厅通过构造函数把数据，模板父节点，tab回掉函数，默认显示的tab下标。
-- 为了让tab和现实的listView保持一致，在构建完tab后必须触发一次回掉函数
-- 大厅直接把self加在父节点上。

local GameLevelTabInterface = class(CommonGameLayer);
--virtual 构造函数
GameLevelTabInterface.ctor = function(self,p_data,p_parent,p_call,p_showWhich)
								--p_data:level数据
								--p_parent:大厅给的空白节点，定制者可根据p_parent的大小确定自己self的大小
								--p_call:通过这个函数来回调大厅逻辑p_call(index)
								--p_showWhich:初始化显示哪个tab

end
--virtual 跳到指定tab
GameLevelTabInterface.toWhich = function(self,p_which)
								--p_which:调到p_which tab
end

--virtual 大厅是否显示广播条。
GameLevelTabInterface.isShowBroadcast = function(self)
	--return ture or false
end
return GameLevelTabInterface;
