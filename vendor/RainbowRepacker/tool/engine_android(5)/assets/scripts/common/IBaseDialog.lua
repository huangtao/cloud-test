require("common/commonGameLayer");
require("util/StringLib");


--[[
	弹出弹框基类，会创建一个对栈来保持push进来的弹框，会根据level的大小来对弹框的显示顺序进行排列
	,当关闭一个弹框时，会显示对栈中的下一个弹框

	注：加入到此对栈中的弹框应该需要依赖于具体的场景，场景在处理返回键时应该判断这个对栈是否为空。
]]

--[[
	local A = class(IBaseDialog)
	show --> IBaseDialog.pushDialog( new(A) );
	hide --> IBaseDialog.hide();
]]
--------------------------------------类方法----------------------------------------
--类方法用作管理用。
IBaseDialog = class(CommonGameLayer,false);

IBaseDialog.s_instance = nil;
IBaseDialog.dialogStack={};
IBaseDialog.s_isQueueing = false;

--@brief 开始排队
--@note 用于解决登录后对弹框进行排序的需求
IBaseDialog.startQueue = function(p_time)
    Log.v("IBaseDialog.startQueue","开始dialog排队");
	if IBaseDialog.anim_queue then
		delete(IBaseDialog.anim_queue);
		IBaseDialog.anim_queue = nil;
	end
		
	p_time = p_time or 1000;
	
	IBaseDialog.s_isQueueing = true;
	IBaseDialog.anim_queue = new(AnimInt , kAnimNormal, 0, 1 ,p_time, -1);
	IBaseDialog.anim_queue:setDebugName("IBaseDialog.anim_queue");
	IBaseDialog.anim_queue:setEvent(nil, function()
		IBaseDialog.stopQueue();
	end);
end

--@brief 停止排队
IBaseDialog.stopQueue = function()
	if IBaseDialog.anim_queue then
		delete(IBaseDialog.anim_queue);
		IBaseDialog.anim_queue = nil;
        Log.v("IBaseDialog.stopQueue","结束dialog排队");
		IBaseDialog.s_isQueueing = false;
		IBaseDialog.show();
	end	
end

--@brief 是否正在排队中
IBaseDialog.isQueueing = function()
	return IBaseDialog.s_isQueueing;
end

--@brief 是否有弹框正在显示中
IBaseDialog.isDialogShowing = function()	
	return IBaseDialog.s_instance and true or false;
end

--@brief 弹框压栈
IBaseDialog.pushDialog = function(dialog)
	if  not dialog then
		return;
	end
	
	--如果与当前的对话框是同一个，则关闭老的，展示最新的
	if IBaseDialog.s_instance then
		if IBaseDialog.s_instance.token == dialog.token then
			table.insert(IBaseDialog.dialogStack,1,dialog);	
			delete(IBaseDialog.s_instance);
			IBaseDialog.s_instance = nil;
			IBaseDialog.show();
			return;
		end
	end

	--删除相同token的对话框,即删除相同的对话框
	for i,v in ipairs(IBaseDialog.dialogStack) do
		if v.token == dialog.token then
			v.m_isNeedDeleteFromTable = false;    --析构函数不需要再次遍历删除。
			delete(v);
			table.remove(IBaseDialog.dialogStack,i);
			break;
		end
	end

	--根据level进行排列
	dialog.level = dialog.level or 0;
	table.insert(IBaseDialog.dialogStack, dialog);	
	table.sort(IBaseDialog.dialogStack, function (a, b)
		return a.level > b.level
	end)

	if not IBaseDialog.isQueueing() then
		IBaseDialog.show();
	end
end

--@brief 弹框出栈
IBaseDialog.popDialog = function()
	local mDialog=table.remove(IBaseDialog.dialogStack,1);
	return mDialog;
end

--@brief 显示弹框
IBaseDialog.show = function()	
	Log.v("IBaseDialog show");
	if not IBaseDialog.isDialogShowing() then
		IBaseDialog.s_instance = IBaseDialog.popDialog();
		if IBaseDialog.s_instance then
            Log.v("IBaseDialog token",IBaseDialog.s_instance.token);
			IBaseDialog.s_instance:addToRoot();
		    IBaseDialog.s_instance:setAlign(kAlignCenter);
		    IBaseDialog.s_instance:setFillParent(true,true);
		    IBaseDialog.s_instance:onShow();
		end
	end
end

--@brief 隐藏弹框
IBaseDialog.hide = function()	
	Log.v("IBaseDialog hide");
	if IBaseDialog.isDialogShowing() then
		delete(IBaseDialog.s_instance);
		IBaseDialog.s_instance = nil;
	end

	IBaseDialog.show();
end

--@brief 隐藏所有弹框
IBaseDialog.hideAll = function()	
	Log.v("IBaseDialog hiddAll");

	for k,v in pairs(IBaseDialog.dialogStack) do
		v.m_isNeedDeleteFromTable = false;
		delete(v);
	end
	IBaseDialog.dialogStack={};
	
	IBaseDialog.hide();
end

--@brief 根据token移除弹框
IBaseDialog.remove = function(token)	
	Log.v("IBaseDialog remove");
	
	if token then
		for i = 1, table.getn(IBaseDialog.dialogStack) do
			local v = IBaseDialog.dialogStack[i];
			if token == v.token then
				v.m_isNeedDeleteFromTable = false;
				delete(v);
				table.remove(IBaseDialog.dialogStack,i);
				break;
			end
		end

		if IBaseDialog.s_instance and IBaseDialog.s_instance.token == token then
			IBaseDialog.hide();
		end
	end
end

--@brief 模拟单击返回键
IBaseDialog.onBackHidden= function()	
	Log.v("IBaseDialog onBackHidden");

	if IBaseDialog.isDialogShowing() then
		if IBaseDialog.s_instance:isCancelable() then
			IBaseDialog.hide();
		end
	end
end

--@brief 对话框是可否可见
IBaseDialog.setVisibleAble = function(visibility)	
	if IBaseDialog.isDialogShowing() then
		IBaseDialog.s_instance:setVisible(visibility);
	else
		if visibility then
			IBaseDialog.show();
		end
	end
end

--------------------------------------对象的相关方法--------------------------------------------

IBaseDialog.ctor = function(self,viewConfig,token,level)	
	super(self,viewConfig);
	self.token=token or "";
	self.level=level or 0;
	self.m_root:setEventDrag(nil, function () end); --设置拖动监听，防止事件被下层穿透
	self.m_isNeedDeleteFromTable = true; --默认在析构的时候需要把对自己的引用从IBaseDialog.dialogStack 中删除。
end

IBaseDialog.dtor = function(self)
	--析构函数要消灭掉所有对自己的应用，防止lua内存泄露。
	if self == IBaseDialog.s_instance then
		IBaseDialog.s_instance = nil;
	end

	if self.m_isNeedDeleteFromTable then
		for i = table.getn(IBaseDialog.dialogStack) ,1,-1 do
			if IBaseDialog.dialogStack[i] == self then
				table.remove(IBaseDialog.dialogStack,i);
				break;
			end
		end	
	end
end

IBaseDialog.onShow = function(self)
end

IBaseDialog.setCancelable= function(self,cancelable)	
	self.cancelable=cancelable;
end

IBaseDialog.isCancelable= function(self)
	return self.cancelable ==nil and true or false;
end

