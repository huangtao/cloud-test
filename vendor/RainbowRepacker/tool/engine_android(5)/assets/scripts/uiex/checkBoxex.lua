require("ui/checkBox");

CheckBoxGroup.e_Mode = {
	SINGLE = 1,			--单选
	MULTIPLE = 2		--多选
}

CheckBoxGroup.onItemClickSingle = function(self, box)
	if not box then return end;
    local index = CheckBoxGroup.getCheckBoxIndex(self,box);
    local isChecked = box:isChecked();

    --如果是已经选中的，则返回。
    if isChecked then
        return ;
    else
        --把其他所有变成非选中状态
        for k,box1 in ipairs(self.m_items) do
            box1:setChecked(false);
            if box1 == box then
                --自己变成选中
                box1:setChecked(true);
            end
        end
        if self.m_eventCallback.func then
            self.m_eventCallback.func(self.m_eventCallback.obj,index,not isChecked);
        end
    end
end

--之前默认的是多选
CheckBoxGroup.setCheckBoxGroupMode = function(self, p_mode)
	if p_mode == CheckBoxGroup.e_Mode.SINGLE then
		self.onItemClick = CheckBoxGroup.onItemClickSingle;
	elseif p_mode == CheckBoxGroup.e_Mode.MULTIPLE then
		self.onItemClick = CheckBoxGroup.onItemClick;
	end
end

--初始化CheckBoxGroup的状态
CheckBoxGroup.initStatus = function(self,p_index)
	p_index = tonumber(p_index);

	if not p_index then
		return ;
	end

	if not(self.m_items[p_index]) then
		return;
	end

	--保证自己的状态是非选中状态
	self.m_items[p_index]:setChecked(false);
	--根据CheckBox的下标初始化，并调用相应的业务回掉
	self:onItemClick(self.m_items[p_index]);
end