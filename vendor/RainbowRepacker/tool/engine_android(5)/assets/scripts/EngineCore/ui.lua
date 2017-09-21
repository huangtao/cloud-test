
package.preload[ "ui/adapter" ] = function( ... )
-- adapter.lua
-- Author: Vicent.Gong
-- Date: 2012-05-17
-- Last modification : 2013-07-01
-- Description: Implemented an adapter,which now is for listView and ViewPager

--------------------------------------------------------------------------------
-- 这个模块提供了 Adapter 等相关类.
--
-- @module ui.adapter
-- @return #nil
-- @usage require("ui/adapter")


require("core/object");

---
-- 该类提供了几个空方法，可以用作 @{#Adapter} 的参数的模板。
--
-- @type AdapterDataChangeListener
AdapterDataChangeListener = class();

---
-- 当 @{#Adapter.appendData} 被调用的时候，回调该方法。
AdapterDataChangeListener.onAppendData = function(self)

end

---
-- 当 @{#Adapter.changeData} 被调用的时候，回调该方法。
AdapterDataChangeListener.onChangeData = function(self)

end

---
-- 当 @{#Adapter.updateData} 被调用的时候，回调该方法。
--
-- @param self
-- @param index 其值为 @{#Adapter.updateData} 的index参数。
AdapterDataChangeListener.onUpdateData = function(self, index)

end


---
-- @{#Adapter} 提供了一个框架，用于为TableView提供数据.
--
-- @{ui.tableView#TableView} 的子类，@{ui.listView#ListView} 和 @{ui.viewPager#ViewPager} 也使用该类提供的数据。
--
-- @type Adapter
Adapter = class();

---
-- 构造函数，传入的参数将会被保存.
--
-- view和data会被保存。当通过 @{#Adapter.getView} 获取一个内容对象的时候，会调用 new(view, data[index]) 来创建该对象。
--
-- @param self
-- @param view 类对象，通常是 @{ui.node#Node} 的子类。
-- @param #table data 一个lua数组。
Adapter.ctor = function(self, view, data)
    self.m_view = view;
    self.m_data = data;
end

---
-- 设置event listener。当有数据变更动作的时候，@{#Adapter} 会回调该listener。
--
-- @param self
-- @param #AdapterDataChangeListener listener 要设置event listener。该值可以是个普通的table，提供 @{#AdapterDataChangeListener} 的几个接口中的任意几个均可。
Adapter.setEventListener = function(self, listener)
    self.m_listener = listener;
end

---
-- 返回data数组。
--
-- @param self
-- @return #table data数组。
Adapter.getData = function(self)
    return self.m_data;
end

---
-- 往data数组中追加一个元素.
--
-- 追加完成后，回调event listener的onAppendData（如果存在的话）。
--
-- @param self
-- @param data 要往data数组追加的元素。
Adapter.appendData = function(self, data)
    if type(data) == 'table' then
        for _, v in pairs(data) do
            self.m_data[#self.m_data + 1] = v;
        end

    else
        self.m_data[#self.m_data + 1] = data
    end

    if self.m_listener and self.m_listener.onAppendData then
        self.m_listener.onAppendData(self.m_listener);
    end
end

---
-- 替换data数组.
--
-- 替换完成后，回调event listener的onChangeData（如果存在的话）。
--
-- @param self
-- @param data 新的data数组。
Adapter.changeData = function(self, data)
    self.m_data = data;

    if self.m_listener and self.m_listener.onChangeData then
        self.m_listener.onChangeData(self.m_listener);
    end
end

---
--
-- 将data[index]替换成dataItem.
--
-- 替换完成后，回调event listener的onUpdateData（如果存在的话）。
--
-- @param self
-- @param #number index data数组的下标。
-- @param dataItem 要替换的新值。
Adapter.updateData = function(self, index, dataItem)
    self.m_data[index] = dataItem;

    if self.m_listener and self.m_listener.onUpdateData then
        self.m_listener.onUpdateData(self.m_listener, index);
    end
end

---
-- 创建一个新的view对象并返回.
--
-- 新的对象通过 new(view, data[index]) 来创建。
--
-- @param self
-- @param #number index 要创建对象的参数为data数组的一个元素。该参数指定了元素的下标。
-- @return 返回新对象。
-- @return #nil 若 data[index] 为 false 或者 nil，则返回nil。
Adapter.getView = function(self, index)
    if not self.m_data[index] then
        return nil;
    end
    local view = new(self.m_view, self.m_data[index]);
    return view;
end

---
-- 对参数v进行delete()。被 @{ui.tableView#TableView} 用于释放通过 @{#Adapter.getView} 创建的对象。
--
-- @param self
-- @param v 要删除的对象。
Adapter.releaseView = function(self, v)
    delete(v);
end

---
-- 获得data数组的长度。
--
-- @param self
Adapter.getCount = function(self)
    return #self.m_data;
end

---
-- 析构函数。
--
-- @param self
Adapter.dtor = function(self)
    self.m_view = nil;
    self.m_data = nil;
end


---
--
-- 和 @{#Adapter} 一样，用于为 @{ui.tableView#TableView} 提供数据.
--
-- 和 @{#Adapter} 不同，@{#CacheAdapter} 保存创建的节点（view）类和节点对象（通过new(view, data[index])创建），以及所有数据（data数组）。
--
-- @type CacheAdapter
-- @extends #Adapter 
CacheAdapter = class(Adapter)

---
--
-- 构造函数.
--
-- @param self
-- @param view 节点类。可以是任意 @{core.drawing#DrawingBase} 的子类。
-- @param #table data 一个数组。内容为提供给 @{ui.tableView#TableView} 创建内容时用的所有数据。
CacheAdapter.ctor = function(self, view, data)
    self.m_views = { };
    self.m_changedItems = { };
end

---
-- 根据所传入的数据，通过 @{#CacheAdapter.getView} 创建所有对应的 节点对象并保存 。
--
-- @param self
CacheAdapter.perloadAll = function(self)
    for i = 1, self:getCount() do
        self:getView(i);
    end
end

---
-- Override @{#Adapter.updateData} .
--
-- @param self
-- @param #number index See @{#Adapter.updateData}.
-- @param dataItem See @{#Adapter.updateData}.
CacheAdapter.updateData = function(self, index, dataItem)
    if self.m_views[index] then
        self.m_changedItems[self.m_views[index]] = index;
    end

    Adapter.updateData(self, index, dataItem);
end

---
-- Override @{#Adapter.changeData}.
--
-- @param self
-- @param data See @{#Adapter.changeData}.
CacheAdapter.changeData = function(self, data)
    for k, v in pairs(self.m_views) do
        self.m_changedItems[v] = k;
    end

    Adapter.changeData(self, data);
end

---
-- 获取下标为 index 的数据所对应的节点对象.
--
-- 注：
--
-- * 若对象不存在，则会被重建。
-- * 创建后的对象，对象会被保存。下一次调用的时候，该对象的visible会被设置成true。
-- * 若该对象之前更新过，则会被删除并重建。
--
-- @param self
-- @param #number index 数据的下标。
-- @return 返回获取的节点对象。
CacheAdapter.getView = function(self, index)
    local view = self.m_views[index];

    if view and self.m_changedItems[view] then
        self.m_changedItems[view] = nil;
        delete(view);
        self.m_views[index] = nil
    end

    if self.m_views[index] then
        self.m_views[index]:setVisible(true);
    else
        self.m_views[index] = Adapter.getView(self, index);
    end

    return self.m_views[index];
end

---
-- 释放或隐藏节点对象v.
--
-- 若节点对象存在并修改过，则对其调用delete()； 否则，将其 visible 设置为 false。
--
-- @param self
-- @param v 节点对象。
CacheAdapter.releaseView = function(self, v)
    local index = self.m_changedItems[v];
    if index then
        self.m_changedItems[v] = nil;
        delete(v);
        self.m_views[index] = nil;
    else
        v:setVisible(false);
    end
end

---
-- 析构函数。所有由本对象保存的节点对象也会跟着销毁。
--
-- @param self
CacheAdapter.dtor = function(self)
    for _, v in pairs(self.m_views) do
        delete(v);
    end

    self.m_views = nil;
    self.m_changedItems = nil;
end

end
        

package.preload[ "ui.adapter" ] = function( ... )
    return require('ui/adapter')
end
            

package.preload[ "ui/button" ] = function( ... )
-- button.lua
-- Author: Vicent Gong
-- Date: 2012-09-24
-- Last modification : 2013-06-25
-- Description: Implement a button

--------------------------------------------------------------------------------
-- 这个模块提供了按钮控件的实现.
--
-- @module ui.button
-- @return #nil 
-- @usage require("ui/button")


require("core/constants");
require("core/object");
require("core/global");
require("ui/images");


--- 手指在按钮内部松起时触发点击事件
kButtonUpInside     = 1;
--- 手指在按钮外面松起时触发点击事件
kButtonUpOutside    = 2;
--- 手指在任意位置松起均触发点击事件
kButtonUp           = 3;



---
-- @{#Button} 提供了一个简单的按钮封装.
-- 
-- 按钮的背景是一张png图片，点击的时候会变灰或者变成其它图片。可以设置为不可点击，不可点击和按下是同一个效果。
-- 
-- 实质上 @{#Button} 只是一个重载了事件处理函数的 @{ui.images#Images} 而已。
-- 
-- @type Button
-- @extends ui.images#Images 
Button = class(Images,false);

---
-- 构造函数.
-- 
-- 通过 normalFile 和 disableFile 来指定图片。其它参数同 @{ui.images#Images.ctor} 。   
-- 
-- @param self
-- @param #string normalFile 按钮背景图片。
-- @param disableFile 若类型为 #string，则为按钮在按下时的图片。若为 nil 或者 false，则按下或者不可点击的时候变灰，而不是切换图片。
-- @param fmt See @{ui.images#Images.ctor}.
-- @param filter See @{ui.images#Images.ctor}.
-- @param leftWidth See @{ui.images#Images.ctor}.
-- @param rightWidth See @{ui.images#Images.ctor}.
-- @param topWidth See @{ui.images#Images.ctor}.
-- @param bottomWidth See @{ui.images#Images.ctor}.
Button.ctor = function(self, normalFile, disableFile, fmt, filter, leftWidth, rightWidth, topWidth, bottomWidth)
    super(self,{normalFile, disableFile},fmt,filter,leftWidth,rightWidth,topWidth,bottomWidth);

    self.m_showEnbaleFunc = disableFile
                        and self.showEnableWithDisableImage
                        or self.showEnableWithoutDisableImage;

    self.m_enable = true;
    Button.setEventTouch(self,self,self.onClick);

    self.m_eventCallback = {};
end

---
-- 设置按钮是否为“不可点击”状态.
-- 
-- @param self
-- @param #boolean enable 若为true，则按钮可点击；否则，按钮不可点击。
Button.setEnable = function(self, enable)
    self.m_enable = enable;
    self.m_showEnbaleFunc(self,self.m_enable);
end

---
-- 设置按钮在手指抬起时的回调函数.
-- 
-- 手指抬起时，会调用 ```func(obj, finger_action, x, y, drawing_id_first,drawing_id_current) ``` 。
-- 其中，除了 ```obj``` 为传进来的参数以外，其它参数均为 @{core.drawing#DrawingBase.setEventTouch} 所设置的回调函数所接收的参数。
-- 
-- 根据 responseType 的不同，按钮在手指抬起时，根据实际情况，决定是否调用 ```func```。
-- 
-- @param self
-- @param obj 回调的时候传给 ```func``` 的值。
-- @param #function func 回调函数。
-- @param #number responseType 决定 ```func``` 调用时机的一个数字。
-- 
-- 若为 nil 或者 false 或者不提供此参数，则默认为 [```kButtonUpInside```](core.constants.html#kButtonUpInside) 。
-- 
-- 
-- 该参数决定了在手指抬起时，什么情况下会回调 ```func```：
-- 
-- * 若手指抬起时，手指位置在该控件上，且该参数的值为 [```kButtonUpInside```](core.constants.html#kButtonUpInside)，则调用```func```。
-- * 若手指抬起时，手指位置不在该控件上，且该参数的值为 [```kButtonUpOutside```](core.constants.html#kButtonUpOutside)，则调用```func```。
-- 
-- 
-- 另外，在调用过一次该函数后，该参数也起到另一个作用。在手指在按钮上移动的过程中：
-- 
-- * 若手指位置不在按钮上，且该参数的值为 [```kButtonUpInside```](core.constants.html#kButtonUpInside)，则显示为“按下”状态。
-- * 否则，显示为通常状态。
Button.setOnClick = function(self, obj, func, responseType)
    self.m_eventCallback.func = func;
    self.m_eventCallback.obj = obj;

    self.m_responseType = responseType or kButtonUpInside;
end

---
-- 析构函数.
-- 
-- 按下状态的图片 res 也会被 delete()。
-- 
-- @param self
Button.dtor = function(self)
    delete(self.m_resDisable);
    self.m_resDisable = nil;

    self.m_eventCallback = nil;
end

---------------------------------private functions-----------------------------------------

---
-- 以“变灰”的形式，改变按钮的显示状态.
-- 
-- **注：该函数被标记为“private function”，不建议直接调用该函数。**
--
-- @param self
-- @param #boolean enable 若为 true，则按钮按正常显示；否则，按钮变灰。 
Button.showEnableWithoutDisableImage = function(self, enable)
    if enable then
        Button.setColor(self,255,255,255);
    else
        Button.setColor(self,128,128,128);
    end
end

---
-- 以“替换显示的图片”的形式，改变按钮的显示状态.
-- 
-- **注：该函数被标记为“private function”，不建议直接调用该函数。**
--
-- @param self
-- @param #boolean enable 若为 true，则按钮显示“按下”的图片；否则，按钮显示通常状态的图片。 
Button.showEnableWithDisableImage = function(self, enable)
    if enable then
        Button.setImageIndex(self,0);
    else
        Button.setImageIndex(self,1);
    end
end

---
-- 按钮提供给  @{core.drawing#DrawingBase.setEventTouch} 的回调函数。
-- 
-- **注：该函数被标记为“private function”，不建议直接调用该函数。**
-- 
-- @param self
-- @param #number finger_action See @{core.drawing#DrawingBase.setEventTouch}.
-- @param #number x See @{core.drawing#DrawingBase.setEventTouch}.
-- @param #number y See @{core.drawing#DrawingBase.setEventTouch}.
-- @param #number drawing_id_first See @{core.drawing#DrawingBase.setEventTouch}.
-- @param #number drawing_id_current See @{core.drawing#DrawingBase.setEventTouch}.
Button.onClick = function(self, finger_action, x, y, drawing_id_first, drawing_id_current)
    if not self.m_enable then
        return
    end

    if finger_action == kFingerDown then
       self.m_showEnbaleFunc(self,false);
    elseif finger_action == kFingerMove then
        if not (self.m_responseType == kButtonUpInside and drawing_id_first ~= drawing_id_current) then
            self.m_showEnbaleFunc(self,false);
        else
            self.m_showEnbaleFunc(self,true);
        end
    elseif finger_action == kFingerUp then
        self.m_showEnbaleFunc(self,true);

        local responseCallback = function()
            if self.m_eventCallback.func then
                self.m_eventCallback.func(self.m_eventCallback.obj,finger_action,x,y,
                    drawing_id_first,drawing_id_current);
            end
        end

        if self.m_responseType == kButtonUpInside then
            if drawing_id_first == drawing_id_current then
                responseCallback();
            end
        elseif self.m_responseType == kButtonUpOutside then
            if drawing_id_first ~= drawing_id_current then
                responseCallback();
            end
        else
            responseCallback();
        end
    elseif finger_action==kFingerCancel then
        self.m_showEnbaleFunc(self,true);
    end
end

end
        

package.preload[ "ui.button" ] = function( ... )
    return require('ui/button')
end
            

package.preload[ "ui/checkBox" ] = function( ... )
-- checkBox.lua
-- Author: Vicent Gong
-- Date: 2012-09-24
-- Last modification : 2013-07-05
-- Description: Implemented check box

--------------------------------------------------------------------------------
-- 选择框, @{core.checkBox#CheckBox}  @{core.checkBox#CheckBoxGroup}
-- @module ui.checkBox
-- @return #nil 
-- @usage require("ui/checkBox")


require("core/object");
require("core/global");
require("ui/groupNode");


---
-- CheckBoxGroup是一组多选框.
--
-- @type CheckBoxGroup
-- @extends ui.groupNode#GroupNode
CheckBoxGroup = class(GroupNode);

---
-- 添加一个选择框.
--
-- @param self
-- @param #CheckBox box 选择框条目。
CheckBoxGroup.addCheckBox = function(self, box)
    return CheckBoxGroup.addItem(self,box);
end

---
-- 移除一个选择框.
--
-- @param self
-- @param #CheckBox box 选择框条目。
-- @param #boolean doCleanup 是否对这个移除的控件执行delete操作。若doCleanup为true则执行，否则不执行。
CheckBoxGroup.removeCheckBox = function(self, box, doCleanup)
    return CheckBoxGroup.removeItem(self,box,doCleanup);
end

---
-- 移除一个选择框.
--
-- @param self
-- @param #number index 索引值。参数解释见 @{ui.groupNode#GroupNode.removeItemByIndex}。
-- @param #boolean doCleanup 是否对这个移除的控件执行delete操作。若doCleanup为true则执行，否则不执行。
CheckBoxGroup.removeCheckBoxByIndex = function(self, index, doCleanup)
    return CheckBoxGroup.removeItemByIndex(self,index,doCleanup);
end

---
-- 查找某个选择框的index.
--
-- @param self
-- @param #CheckBox box 选择框条目。
-- @return #number 选择框的索引值。
CheckBoxGroup.getCheckBoxIndex = function(self, box)
    return CheckBoxGroup.getItemIndex(self,box);
end

---
-- 通过index查找选择框.
--
-- @param self
-- @param #number index 选择框的索引值。
-- @return #CheckBox 选择框条目。
CheckBoxGroup.getCheckBox = function(self, index)
    return CheckBoxGroup.getItem(self,index);
end

---
-- 得到所有选择框的选择状态.
--
-- @param self
-- @return #table 返回一个lua数组，按index顺序包含所有选择框的选择状态，如：{true, true, false}
CheckBoxGroup.getResultPairs = function(self)
    local result = {};
    for k,box in ipairs(self.m_items) do
        result[k] = box:isChecked();
    end
    return result;
end

---
-- 设置某一个选择框的状态.
--
-- @param self
-- @param #number index 选项框的索引。
-- @param #boolean doChecked 设置是否被选中。设置为true则被选中；否则，设置为未被选中。
CheckBoxGroup.setChecked = function(self, index, doChecked)
    if not (index and self.m_items[index]) then
        return
    end
    self.m_items[index]:setChecked(doChecked);
end

---
-- 判断某一个选择框是否被选中.
--
-- @param self
-- @param #number index 选项框的索引。
-- @return #boolean 是否被选中。返回true则被选中；否则，未被选中。
CheckBoxGroup.isChecked = function(self, index)
    if not (index and self.m_items[index]) then
        return
    end

    return self.m_items[index]:isChecked();
end

---
-- 得到所有被选中的选择框.
--
-- @param self
-- @return #table 返回一个lua数组，包含所有被选中的选择框的index，如：{1,2,4,5}
CheckBoxGroup.getResult = function(self)
    local result = {};
    for k,box in ipairs(self.m_items) do
        if box:isChecked() then
            result[#result+1] = k;
        end
    end

    return result;
end

---
-- 某一个选择框的状态发生改变的回调函数.
-- **注：该函数被标记为“private function”，不建议直接调用该函数。**
--
-- @param self
-- @param #CheckBox box 选择框条目。
CheckBoxGroup.onItemClick = function(self, box)
    if not box then return end;
    local index = CheckBoxGroup.getCheckBoxIndex(self,box);
    local isChecked = box:isChecked();

    CheckBoxGroup.setChecked(self,index,not isChecked);

    if self.m_eventCallback.func then
        self.m_eventCallback.func(self.m_eventCallback.obj,index,not isChecked);
    end
end


---------------------------------------------------------------------------------------------
-----------------------------------[CLASS] CheckBox------------------------------------------
---------------------------------------------------------------------------------------------

---
-- CheckBox是一个单独的选择框条目.
--
-- @type CheckBox
-- @extends ui.groupNode#GroupItem
CheckBox = class(GroupItem,false);

---默认的默认图片样式。
CheckBox.s_defaultImages = {"ui/checkBox1.png","ui/checkBox2.png"};


---
-- 默认的图片样式.
-- 
-- @field [parent=#CheckBox] #number s_images


---
-- 为CheckBox设置一个默认的图片样式.
-- 样式包含两个图片，一个未选中状态，一个选中状态.
--
-- @param #table images 默认样式图片，格式如下：`{unchecked.png, checked.png}`
CheckBox.setDefaultImages = function(images)
    CheckBox.s_images = images or CheckBox.s_defaultImages;
end

---
-- 构造函数.
--
-- @param self
-- @param #table fileNameArray 图片样式，格式如下：`{unchecked.png, checked.png}`，如果未提供，则使用默认图片样式.
-- @param #number fmt 图片的纹理像素格式。详见： @{ui.groupNode#GroupItem.ctor}.
-- @param #number filter 图片的纹理过滤方式。详见： @{ui.groupNode#GroupItem.ctor}.
-- @param #number leftWidth 图片九宫拉伸的左边宽度。详见： @{ui.groupNode#GroupItem.ctor}.
-- @param #number rightWidth 图片九宫拉伸的右边宽度。详见： @{ui.groupNode#GroupItem.ctor}.
-- @param #number topWidth 图片九宫拉伸的顶部宽度。详见： @{ui.groupNode#GroupItem.ctor}.
-- @param #number bottomWidth 图片九宫拉伸的底部宽度。详见： @{ui.groupNode#GroupItem.ctor}.
CheckBox.ctor = function(self, fileNameArray, fmt, filter, leftWidth, rightWidth, topWidth, bottomWidth)
    local array = fileNameArray or self.s_images or CheckBox.s_defaultImages;
    super(self,array,fmt,filter,leftWidth,rightWidth,topWidth,bottomWidth);

    self.m_changeCallback = {};
end

---
-- 设置选中状态改变的回调.
--
-- @param self
-- @param obj 任意类型，回调时回传
-- @param #function func 回调函数,传入参数为```(obj, isChecked)```。
CheckBox.setOnChange = function(self, obj, func)
    self.m_changeCallback.obj = obj;
    self.m_changeCallback.func = func;
end

---
-- 用于处理触摸事件，处理选中逻辑.
-- **注：该函数被标记为“private function”，不建议直接调用该函数。**
--
-- @param self
-- @param #number finger_action 手指事件。详见： <a href="core.drawing.html#008">**8.触摸机制回调函数的参数的意义。**</a>
-- @param #number x 是手指触摸时的全局横坐标。
-- @param #number y 是手指触摸时的全局纵坐标。
-- @param #number drawing_id_first 是[```kFingerDown```](core.constants.html#kFingerDown)时拾取到的drawing可绘制对象的id。
-- @param #number drawing_id_current 是引擎根据当前坐标拾取到的drawing可绘制对象的id。
-- @param #number event_time 当前事件的触发时间(单位：毫秒)。
CheckBox.onEventTouch = function(self, finger_action, x, y, drawing_id_first, drawing_id_current,event_time)
    if not self.m_enable then return end;

    if finger_action == kFingerUp then
        if self.m_group then
            self.m_group.onItemClick(self.m_group,self);
        else
            CheckBox.setChecked(self,not self.m_checked);
            if self.m_changeCallback.func then
                self.m_changeCallback.func(self.m_changeCallback.obj,self.m_checked);
            end
        end
    end
end

end
        

package.preload[ "ui.checkBox" ] = function( ... )
    return require('ui/checkBox')
end
            

package.preload[ "ui/editText" ] = function( ... )
-- editText.lua
-- Author: Vicent Gong
-- Date: 2012-09-27
-- Last modification : 2013-07-04
-- Description: Implement a single line edit text field

--------------------------------------------------------------------------------
-- 这个模块实现了一个可编辑的单行文本控件。
--
-- @module ui.editText
-- @return #nil 
-- @usage require("ui/editText")


require("core/object");
require("core/global");
require("ui/text");

---
--  @{#EditText}提供了一个可编辑的单行文本控件。
--
-- @type EditText
-- @extends ui.text#Text 
EditText = class(Text);

---
-- 默认的默认提示文字。
EditText.s_defaultHintText = " ";

---
-- 默认的默认提示文字的RGB颜色的R分量。范围0-255。
EditText.s_defaultHintTextColorR = 128;

---
-- 默认的默认提示文字的RGB颜色的G分量。范围0-255。
EditText.s_defaultHintTextColorG = 128;

---
-- 默认的默认提示文字的RGB颜色的B分量。范围0-255。
EditText.s_defaultHintTextColorB = 128;

---
-- 默认的默认最大点击距离。详见@{#EditText.setMaxClickOffset}.
EditText.s_defaultMaxClickOffset = 5;

EditText.s_ex_dict_table_name = "inputEditExTable";

---
-- 默认提示文本。
-- 
-- @field [parent=#EditText] #string s_hintText 

---
-- 默认提示文字的RGB颜色的R分量。
--
-- @field [parent=#EditText] #number s_hintTextColorR

---
-- 默认提示文字的RGB颜色的G分量。
--
-- @field [parent=#EditText] #number s_hintTextColorG

---
-- 默认提示文字的RGB颜色的B分量。
--
-- @field [parent=#EditText] #number s_hintTextColorB

---
-- 设置默认提示文字极其颜色。
-- 
-- @param #string hintText 提示文字的颜色。
-- 
-- 若hintText为nil或false，则@{#EditText.s_hintText}被设置成@{#EditText.s_defaultHintText}。
-- 否则，@{#EditText.s_hintText}被设置成hintText。
-- 
-- @param #number r 提示文字的RGB颜色的R分量。
-- 
-- 若 r 为nil或false，则@{#EditText.s_hintTextColorR}被设置成@{#EditText.s_defaultHintTextColorR}。
-- 否则，@{#EditText.s_hintTextColorR}被设置成 r 。
-- 
-- @param #number g 提示文字的RGB颜色的G分量。
-- 
-- 若 g 为nil或false，则@{#EditText.s_hintTextColorG}被设置成@{#EditText.s_defaultHintTextColorG}。
-- 否则，@{#EditText.s_hintTextColorG}被设置成 g 。
-- 
-- @param #number b 提示文字的RGB颜色的B分量。
-- 
-- 若 b 为nil或false，则@{#EditText.s_hintTextColorB}被设置成@{#EditText.s_defaultHintTextColorB}。
-- 否则，@{#EditText.s_hintTextColorB}被设置成 b 。
-- 
EditText.setDefaultHintText = function(hintText, r, g, b)
    EditText.s_hintText = hintText or EditText.s_defaultHintText;
    EditText.s_hintTextColorR = r or EditText.s_defaultHintTextColorR;
    EditText.s_hintTextColorG = g or EditText.s_defaultHintTextColorG;
    EditText.s_hintTextColorB = b or EditText.s_defaultHintTextColorB;
end

---
-- 默认最大点击距离。
--
-- @field [parent=#EditText] #number s_maxClickOffset

---
-- 设置默认最大点击距离。
-- 
-- @param #number maxClickOffset 默认最大点击距离。
-- 
-- 若 maxClickOffset 为nil或false，则@{#EditText.s_maxClickOffset}被设置成@{#EditText.s_defaultMaxClickOffset}。
-- 否则，@{#EditText.s_maxClickOffset}被设置成 maxClickOffset 。
-- 
EditText.setDefaultMaxClickOffset = function(maxClickOffset)
    EditText.s_maxClickOffset = maxClickOffset or EditText.s_defaultMaxClickOffset;
end

---
-- 构造函数.
-- 
-- @param self
-- @param #string str See @{ui.text#Text.ctor}.
-- @param #number width See @{ui.text#Text.ctor}.
-- @param #number height See @{ui.text#Text.ctor}.
-- @param #number align See @{ui.text#Text.ctor}. 
-- @param #string fontName See @{ui.text#Text.ctor}.
-- @param #number fontSize See @{ui.text#Text.ctor}.
-- @param #number r See @{ui.text#Text.ctor}.
-- @param #number g See @{ui.text#Text.ctor}.
-- @param #number b See @{ui.text#Text.ctor}.
EditText.ctor = function(self, str, width, height, align, fontName, fontSize, r, g, b)
    self.m_textColorR = r or 0;
    self.m_textColorG = g or 0;
    self.m_textColorB = b or 0;
    self.m_fontName   = fontName;
    self.m_fontSize   = fontSize


    self.m_hintText = EditText.s_hintText or EditText.s_defaultHintText;
    self.m_hintTextColorR = EditText.s_hintTextColorR or EditText.s_defaultHintTextColorR;
    self.m_hintTextColorG = EditText.s_hintTextColorG or EditText.s_defaultHintTextColorG;
    self.m_hintTextColorB = EditText.s_hintTextColorB or EditText.s_defaultHintTextColorB;

    self.m_maxClickOffset = EditText.s_maxClickOffset or EditText.s_defaultMaxClickOffset;


    EditText.setEventTouch(self,self,self.onEventTouch);

    self.m_textChangeCallback = {};

    self.m_enable = true;

    self.m_inputMode = kEditBoxInputModeSingleLine;
   self.m_inputFlag = kEditBoxInputFlagInitialCapsSentence;
end

---
-- 设置输入文本的“模式”。
-- 
-- @param self
-- @param #number mode 输入文本的“模式”，其值可以是以下的其中一个：
-- 
-- * [```kEditBoxInputModeAny```](core.constants.html#kEditBoxInputModeAny)
-- * [```kEditBoxInputModeEmailAddr```](core.constants.html#kEditBoxInputModeEmailAddr)
-- * [```kEditBoxInputModeNumeric```](core.constants.html#kEditBoxInputModeNumeric)
-- * [```kEditBoxInputModePhoneNumber```](core.constants.html#kEditBoxInputModePhoneNumber)
-- * [```kEditBoxInputModeUrl```](core.constants.html#kEditBoxInputModeUrl)
-- * [```kEditBoxInputModeDecimal```](core.constants.html#kEditBoxInputModeDecimal)
-- * [```kEditBoxInputModeSingleLine```](core.constants.html#kEditBoxInputModeSingleLine)
-- 
EditText.setInputMode = function(self,mode)
    self.m_inputMode = mode;
end

---
-- 设置输入文本的“标识”。
-- 
-- @param self
-- @param #number flag 输入文本的“标识”，其值可以是以下的其中一个：
-- 
-- * [```kEditBoxInputFlagPassword```](core.constants.html#kEditBoxInputFlagPassword)
-- * [```kEditBoxInputFlagSensitive```](core.constants.html#kEditBoxInputFlagSensitive)
-- * [```kEditBoxInputFlagInitialCapsWord```](core.constants.html#kEditBoxInputFlagInitialCapsWord)
-- * [```kEditBoxInputFlagInitialCapsSentence```](core.constants.html#kEditBoxInputFlagInitialCapsSentence)
-- * [```kEditBoxInputFlagInitialCapsAllCharacters```](core.constants.html#kEditBoxInputFlagInitialCapsAllCharacters)
-- 
EditText.setInputFlag = function(self,flag)
    self.m_inputFlag = flag;
end

---
-- 设置提示文字.
-- 
-- 没有文字的时候，通过这些文字来提示用户输入。
-- 
-- @param self 
-- @param #string str 用来提示用户输入的文字。
-- @param #number r 提示文字RGB颜色的R分量。范围0-255。
-- 
-- 提示文字RGB颜色的R分量，会被设置成 r，@{#EditText.m_hintTextColorR}，@{#EditText.s_defaultHintTextColorR} 中第一个不为nil或false的。
-- 若均为nil或false，则被设置成 @{#EditText.s_defaultHintTextColorR} 。
--  
-- @param #number g 提示文字RGB颜色的G分量。范围0-255。
-- 
-- 提示文字RGB颜色的G分量，会被设置成 ，@{#EditText.s_hintTextColorG}，@{#EditText.s_defaultHintTextColorG} 中第一个不为nil或false的。
-- 若均为nil或false，则被设置成 @{#EditText.s_defaultHintTextColorG} 。
--  
-- @param #number b 提示文字RGB颜色的B分量。范围0-255。 
-- 
-- 提示文字RGB颜色的B分量，会被设置成 b，@{#EditText.s_hintTextColorB}，@{#EditText.s_defaultHintTextColorB} 中第一个不为nil或false的。
-- 若均为nil或false，则被设置成 @{#EditText.s_defaultHintTextColorB} 。
--  
EditText.setHintText = function(self, str, r, g, b)
    str = EditText.convert2SafePlatformString(self,str);

    self.m_hintText = str or EditText.s_hintText or EditText.s_defaultHintText;
    self.m_hintTextColorR = r or EditText.s_hintTextColorR or EditText.s_defaultHintTextColorR;
    self.m_hintTextColorG = g or EditText.s_hintTextColorG or EditText.s_defaultHintTextColorG;
    self.m_hintTextColorB = b or EditText.s_hintTextColorB or EditText.s_defaultHintTextColorB;

    local text = EditText.getText(self);
    if text == " " then
        EditText.setText(self,str,nil,nil,self.m_hintTextColorR,self.m_hintTextColorG,self.m_hintTextColorB);
    end
end

---
-- 设置最大点击距离.
-- 若从手指按下到抬起来的过程中，在x轴或y轴坐标的总位移差超过最大点击距离，则不响应手指操作。
-- 
-- @param self
-- @param #number offset 最大点击距离。
-- 
-- 最大点击距离，会被设置成 offset，@{#EditText.s_maxClickOffset}，@{#EditText.s_defaultMaxClickOffset} 中第一个不为nil或false的。
-- 若均为nil或false，则被设置成 @{#EditText.s_defaultMaxClickOffset} 。
--  
EditText.setMaxClickOffset = function(self, offset)
    self.m_maxClickOffset = offset
                        or EditText.s_maxClickOffset
                        or EditText.s_defaultMaxClickOffset;
end

---
-- Override @{ui.text#Text.setText}.
-- 
-- @param self
-- @param #string str See @{ui.text#Text.setText}.
-- @param #number width See @{ui.text#Text.setText}.
-- @param #number height See @{ui.text#Text.setText}.
-- @param #number r See @{ui.text#Text.setText}.
-- @param #number g See @{ui.text#Text.setText}.
-- @param #number b See @{ui.text#Text.setText}.
EditText.setText = function(self, str, width, height, r, g, b)
    self.m_textColorR = r or self.m_textColorR;
    self.m_textColorG = g or self.m_textColorG;
    self.m_textColorB = b or self.m_textColorB;

    if not str or str == self.m_hintText then
        str = self.m_hintText;
        r = self.m_hintTextColorR;
        g = self.m_hintTextColorG;
        b = self.m_hintTextColorB;
    else
        r = self.m_textColorR;
        g = self.m_textColorG;
        b = self.m_textColorB;
    end

    Text.setText(self,str,width,height,r,g,b);
end

---
-- 获取当前文字.
-- 
-- @return #string 当前文字。若当前文字和提示文字一样，则返回```' '```。
-- 
EditText.getText = function(self)
    local text = Text.getText(self);
    text = (text == self.m_hintText) and " " or text;
    return text;
end

---
-- 设置是否接受用户输入。
-- 
-- @param self 
-- @param #boolean enable 若为true，则接受用户输入；否则，不接受用户输入。
EditText.setEnable = function(self, enable)
    self.m_enable = enable;
end

---
-- 设置输入文字的最大允许长度。
--
-- @param self 
-- @param #number maxLength 输入文字的最大允许长度。 
EditText.setMaxLength = function(self, maxLength)
    self.m_maxLength = maxLength;
end

---
-- 设置当用户输入文本的时候，调用的回调函数.
-- 
-- 在回调的时候，会执行 ```func(obj)```。
-- 
-- @param self  
-- @param obj 任意lua值。
-- @param #function func 回调函数。
EditText.setOnTextChange = function(self, obj, func)
    self.m_textChangeCallback.obj = obj;
    self.m_textChangeCallback.func = func;
end

---
-- 调用事件回调函数。详见@{#EditText.setOnTextChange}。
EditText.onTextChange = function(self)
    if self.m_textChangeCallback.func then
        self.m_textChangeCallback.func(self.m_textChangeCallback.obj,EditText.getText(self));
    end
end

---
-- 析构函数。
-- 
EditText.dtor = function(self)
    ime_close_edit();
end

---------------------------------private functions-----------------------------------------

---
-- 控件提供给  @{core.drawing#DrawingBase.setEventTouch} 的回调函数.
-- 
-- **注：该函数被标记为“private function”，不建议直接调用该函数。**
-- 
-- @param self
-- @param #number finger_action See @{core.drawing#DrawingBase.setEventTouch}.
-- @param #number x See @{core.drawing#DrawingBase.setEventTouch}.
-- @param #number y See @{core.drawing#DrawingBase.setEventTouch}.
-- @param #number drawing_id_first See @{core.drawing#DrawingBase.setEventTouch}.
-- @param #number drawing_id_current See @{core.drawing#DrawingBase.setEventTouch}.
-- @param #number event_time 当前事件的触发时间(单位：毫秒)。
EditText.onEventTouch = function(self, finger_action, x, y, drawing_id_first, drawing_id_current,event_time)
    if finger_action == kFingerDown then
        self.m_startX = x;
        self.m_startY = y;
        self.m_touching = true;
    elseif finger_action == kFingerUp then
        if not self.m_touching then return end;

        self.m_touching = false;

        local diffX = math.abs(x - self.m_startX);
        local diffY = math.abs(y - self.m_startY);
        if diffX > self.m_maxClickOffset
            or diffY > self.m_maxClickOffset
            or (not self.m_enable)
            or (drawing_id_first ~= drawing_id_current) then
            return
        end

        EditTextGlobal = self;
        local x,y = self:getAbsolutePos();
        local actualX= x * System.getLayoutScale();
        local actualY= y * System.getLayoutScale();


        local w,h = self:getSize();
        local actualW= w * System.getLayoutScale();
        --local actualH= h * System.getLayoutScale();
        local actualH = 0;
        if System.getPlatform() == kPlatformAndroid then 
	   		actualH = (h+12) * System.getLayoutScale();
		else 
	        actualH = h * System.getLayoutScale();
		end

        self:setVisible(false);
        local textStr=EditText.getText(self)
        if textStr == " " then
            textStr = ""
        end
        -- inputeModel,inputFlag,returnType
		dict_set_int(EditText.s_ex_dict_table_name,"inputMode",self.m_inputMode);
		dict_set_int(EditText.s_ex_dict_table_name,"inputFlag",self.m_inputFlag);
		dict_set_int(EditText.s_ex_dict_table_name,"returnType", kKeyboardReturnTypeDone);

		ime_open_edit(textStr,
			"",
			self.m_inputMode,
			self.m_inputFlag,
			kKeyboardReturnTypeDone,
			self.m_maxLength or -1,"global",self.m_fontName or "",(self.m_res.m_fontSize or 24)* System.getLayoutScale(),
            self.m_textColorR,self.m_textColorG,self.m_textColorB,
            actualX,actualY,actualW,actualH);
		EditTextGlobal.setText(EditTextGlobal,"");
    end
end
                                             
---                                          
-- 用于 [```event_ime_close_global```](#event_ime_close_global) 的一个全局变量.
-- 
-- 其值为一个 @{#EditText} 对象。
--
-- @field [parent=#global] #EditText EditTextGlobal 

---
-- 按钮提供给 ```ime_open_edit``` 的回调函数，用于将系统输入的信息显示到控件上. 
-- 
-- **注：该函数被标记为“private function”，不建议直接调用该函数。**
-- 
-- @param #string strNewValue 用户输入的信息。
-- @param #number flag 若为1，则更新输入，并调用相应事件。
function event_ime_close_global(strNewValue, flag)

    if EditTextGlobal then
       EditTextGlobal:setVisible(true)
        EditTextGlobal.setText(EditTextGlobal,strNewValue);
        if (not strNewValue) or strNewValue == "" or strNewValue == EditTextGlobal.m_hintText then
            EditTextGlobal.setText(EditTextGlobal,EditTextGlobal.m_hintText,nil,nil,EditTextGlobal.m_hintTextColorR,EditTextGlobal.m_hintTextColorG,EditTextGlobal.m_hintTextColorB);
        else
            EditTextGlobal.setText(EditTextGlobal,strNewValue,nil,nil,EditTextGlobal.m_textColorR,EditTextGlobal.m_textColorG,EditTextGlobal.m_textColorB);
        end
        EditTextGlobal.onTextChange(EditTextGlobal);
    end
    EditTextGlobal = nil;
end

end
        

package.preload[ "ui.editText" ] = function( ... )
    return require('ui/editText')
end
            

package.preload[ "ui/editTextView" ] = function( ... )
-- editTextView.lua
-- Author: Vicent Gong
-- Date: 2012-09-27
-- Last modification : 2013-06-24
-- Description: Implement a single line edit text field

--------------------------------------------------------------------------------
-- 多行文字输入框.
-- @module ui.editTextView
-- @return #nil 
-- @usage require("ui/editTextView")


require("core/object");
require("core/global");
require("ui/textView");

---
-- @type EditTextView
-- @extends ui.textView#TextView
EditTextView = class(TextView);

---
-- 默认的默认提示文字。
EditTextView.s_defaultHintText = " ";

---
-- 默认的默认提示文字的RGB颜色的R分量。范围0-255。
EditTextView.s_defaultHintTextColorR = 128;

---
-- 默认的默认提示文字的RGB颜色的G分量。范围0-255。
EditTextView.s_defaultHintTextColorG = 128;

---
-- 默认的默认提示文字的RGB颜色的B分量。范围0-255。
EditTextView.s_defaultHintTextColorB = 128;

---
-- 默认的默认最大点击距离。详见@{#EditTextView.setMaxClickOffset}.
EditTextView.s_defaultMaxClickOffset = 5;


---
-- 默认提示文本。
-- 
-- @field [parent=#EditTextView] #string s_hintText 

---
-- 默认提示文字的RGB颜色的R分量。
--
-- @field [parent=#EditTextView] #number s_hintTextColorR

---
-- 默认提示文字的RGB颜色的G分量。
--
-- @field [parent=#EditTextView] #number s_hintTextColorG

---
-- 默认提示文字的RGB颜色的B分量。
--
-- @field [parent=#EditTextView] #number s_hintTextColorB

---
-- 设置默认提示文字极其颜色。
-- 
-- @param #string hintText 提示文字的颜色。
-- 
-- 若hintText为nil或false，则@{#EditTextView.s_hintText}被设置成@{#EditTextView.s_defaultHintText}。
-- 否则，@{#EditTextView.s_hintText}被设置成hintText。
-- 
-- @param #number r 提示文字的RGB颜色的R分量。
-- 
-- 若 r 为nil或false，则@{#EditTextView.s_hintTextColorR}被设置成@{#EditTextView.s_defaultHintTextColorR}。
-- 否则，@{#EditTextView.s_hintTextColorR}被设置成 r 。
-- 
-- @param #number g 提示文字的RGB颜色的G分量。
-- 
-- 若 g 为nil或false，则@{#EditTextView.s_hintTextColorG}被设置成@{#EditTextView.s_defaultHintTextColorG}。
-- 否则，@{#EditTextView.s_hintTextColorG}被设置成 g 。
-- 
-- @param #number b 提示文字的RGB颜色的B分量。
-- 
-- 若 b 为nil或false，则@{#EditTextView.s_hintTextColorB}被设置成@{#EditTextView.s_defaultHintTextColorB}。
-- 否则，@{#EditTextView.s_hintTextColorB}被设置成 b 。
-- 
EditTextView.setDefaultHintText = function(hintText, r, g, b)
    EditTextView.s_hintText = hintText or EditTextView.s_defaultHintText;
    EditTextView.s_hintTextColorR = r or EditTextView.s_defaultHintTextColorR;
    EditTextView.s_hintTextColorG = g or EditTextView.s_defaultHintTextColorG;
    EditTextView.s_hintTextColorB = b or EditTextView.s_defaultHintTextColorB;
end

---
-- 默认最大点击距离。
--
-- @field [parent=#EditTextView] #number s_maxClickOffset

---
-- 设置默认最大点击距离。
-- 
-- @param #number maxClickOffset 默认最大点击距离。
-- 
-- 若 maxClickOffset 为nil或false，则@{#EditText.s_maxClickOffset}被设置成@{#EditText.s_defaultMaxClickOffset}。
-- 否则，@{#EditText.s_maxClickOffset}被设置成 maxClickOffset 。
-- 
EditTextView.setDefaultMaxClickOffset = function(maxClickOffset)
    EditTextView.s_maxClickOffset = maxClickOffset or EditTextView.s_defaultMaxClickOffset;
end

---
-- 构造函数.
-- 
-- @param self
-- @param #string str See @{ui.textView#TextView.ctor}.
-- @param #number width See @{ui.textView#TextView.ctor}.
-- @param #number height See @{ui.textView#TextView.ctor}.
-- @param #number align See @{ui.textView#TextView.ctor}. 
-- @param #string fontName See @{ui.textView#TextView.ctor}.
-- @param #number fontSize See @{ui.textView#TextView.ctor}.
-- @param #number r See @{ui.textView#TextView.ctor}.
-- @param #number g See @{ui.textView#TextView.ctor}.
-- @param #number b See @{ui.textView#TextView.ctor}.
EditTextView.ctor = function(self, str, width, height, align, fontName, fontSize, r, g, b)
    self.m_textColorR = r or 0;
    self.m_textColorG = g or 0;
    self.m_textColorB = b or 0;
    self.m_fontName   = fontName;
    self.m_fontSize   = fontSize


    self.m_hintText = EditTextView.s_hintText or EditTextView.s_defaultHintText;
    self.m_hintTextColorR = EditTextView.s_hintTextColorR or EditTextView.s_defaultHintTextColorR;
    self.m_hintTextColorG = EditTextView.s_hintTextColorG or EditTextView.s_defaultHintTextColorG;
    self.m_hintTextColorB = EditTextView.s_hintTextColorB or EditTextView.s_defaultHintTextColorB;



    self.m_maxClickOffset = EditTextView.s_maxClickOffset or EditTextView.s_defaultMaxClickOffset;


    self.m_drawing:setEventTouch(self,self.onEventTouch);

    self.m_textChangeCallback = {};

    self.m_enable = true;

    self.m_inputMode = kEditBoxInputModeAny;
    self.m_inputFlag = kEditBoxInputFlagInitialCapsSentence;
end

---
-- 设置输入文本的“模式”。
-- 
-- @param self
-- @param #number mode 输入文本的“模式”，其值可以是以下的其中一个：
-- 
-- * [```kEditBoxInputModeAny```](core.constants.html#kEditBoxInputModeAny)
-- * [```kEditBoxInputModeEmailAddr```](core.constants.html#kEditBoxInputModeEmailAddr)
-- * [```kEditBoxInputModeNumeric```](core.constants.html#kEditBoxInputModeNumeric)
-- * [```kEditBoxInputModePhoneNumber```](core.constants.html#kEditBoxInputModePhoneNumber)
-- * [```kEditBoxInputModeUrl```](core.constants.html#kEditBoxInputModeUrl)
-- * [```kEditBoxInputModeDecimal```](core.constants.html#kEditBoxInputModeDecimal)
-- * [```kEditBoxInputModeSingleLine```](core.constants.html#kEditBoxInputModeSingleLine)
-- 
EditTextView.setInputMode = function(self,mode)
    self.m_inputMode = mode;
end

---
-- 设置输入文本的“标识”。
-- 
-- @param self
-- @param #number flag 输入文本的“标识”，其值可以是以下的其中一个：
-- 
-- * [```kEditBoxInputFlagPassword```](core.constants.html#kEditBoxInputFlagPassword)
-- * [```kEditBoxInputFlagSensitive```](core.constants.html#kEditBoxInputFlagSensitive)
-- * [```kEditBoxInputFlagInitialCapsWord```](core.constants.html#kEditBoxInputFlagInitialCapsWord)
-- * [```kEditBoxInputFlagInitialCapsSentence```](core.constants.html#kEditBoxInputFlagInitialCapsSentence)
-- * [```kEditBoxInputFlagInitialCapsAllCharacters```](core.constants.html#kEditBoxInputFlagInitialCapsAllCharacters)
-- 
EditTextView.setInputFlag = function(self,flag)
    self.m_inputFlag = flag;
end

---
-- 设置提示文字.
-- 
-- 没有文字的时候，通过这些文字来提示用户输入。
-- 
-- @param self 
-- @param #string str 用来提示用户输入的文字。
-- @param #number r 提示文字RGB颜色的R分量。范围0-255。
-- 
-- 提示文字RGB颜色的R分量，会被设置成 r，@{#EditTextView.m_hintTextColorR}，@{#EditTextView.s_defaultHintTextColorR} 中第一个不为nil或false的。
-- 若均为nil或false，则被设置成 @{#EditTextView.s_defaultHintTextColorR} 。
--  
-- @param #number g 提示文字RGB颜色的G分量。范围0-255。
-- 
-- 提示文字RGB颜色的G分量，会被设置成 ，@{#EditTextView.s_hintTextColorG}，@{#EditTextView.s_defaultHintTextColorG} 中第一个不为nil或false的。
-- 若均为nil或false，则被设置成 @{#EditTextView.s_defaultHintTextColorG} 。
--  
-- @param #number b 提示文字RGB颜色的B分量。范围0-255。 
-- 
-- 提示文字RGB颜色的B分量，会被设置成 b，@{#EditTextView.s_hintTextColorB}，@{#EditTextView.s_defaultHintTextColorB} 中第一个不为nil或false的。
-- 若均为nil或false，则被设置成 @{#EditTextView.s_defaultHintTextColorB} 。
--  
EditTextView.setHintText = function(self, str, r, g, b)
    str = EditTextView.convert2SafePlatformString(self,str);


    self.m_hintText = str or EditTextView.s_hintText or EditTextView.s_defaultHintText;
    self.m_hintTextColorR = r or EditTextView.s_hintTextColorR or EditTextView.s_defaultHintTextColorR;
    self.m_hintTextColorG = g or EditTextView.s_hintTextColorG or EditTextView.s_defaultHintTextColorG;
    self.m_hintTextColorB = b or EditTextView.s_hintTextColorB or EditTextView.s_defaultHintTextColorB;


    local text = EditTextView.getText(self);
    if text == " " then
        EditTextView.setText(self,str,nil,nil,self.m_hintTextColorR,self.m_hintTextColorG,self.m_hintTextColorB);
    end
end

---
-- Override @{ui.textView#TextView.setText}.
-- 
-- @param self
-- @param #string str See @{ui.textView#TextView.setText}.
-- @param #number width See @{ui.textView#TextView.setText}.
-- @param #number height See @{ui.textView#TextView.setText}.
-- @param #number r See @{ui.textView#TextView.setText}.
-- @param #number g See @{ui.textView#TextView.setText}.
-- @param #number b See @{ui.textView#TextView.setText}.)
EditTextView.setText = function(self, str,width, height,r,g,b)
    self.m_textColorR = r or self.m_textColorR;
    self.m_textColorG = g or self.m_textColorG;
    self.m_textColorB = b or self.m_textColorB;
   
    TextView.setText(self,str,width,height,self.m_textColorR,self.m_textColorG, self.m_textColorB);
end

---
-- 获取当前文字.
-- 
-- @return #string 当前文字。若当前文字和提示文字一样，则返回```' '```。
-- 
EditTextView.getText = function(self)
    local text = TextView.getText(self);
    text = (text == self.m_hintText) and "" or text;
    return text;
end

---
-- 设置是否接受用户输入。
-- 
-- @param self 
-- @param #boolean enable 若为true，则接受用户输入；否则，不接受用户输入。
EditTextView.setEnable = function(self, enable)
    self.m_enable = enable;
end

---
-- 设置输入文字的最大允许长度。
--
-- @param self 
-- @param #number maxLength 输入文字的最大允许长度。
EditTextView.setMaxLength = function(self, maxLength)
    self.m_maxLength = maxLength;
end

---
-- 设置当用户输入文本的时候，调用的回调函数.
-- 
-- 在回调的时候，会执行 ```func(obj)```。
-- 
-- @param self  
-- @param obj 任意lua值。
-- @param #function func 回调函数。
EditTextView.setOnTextChange = function(self, obj, func)
    self.m_textChangeCallback.obj = obj;
    self.m_textChangeCallback.func = func;
end

---
-- 调用事件回调函数。详见@{#EditTextView.setOnTextChange}。
--
-- @param self
EditTextView.onTextChange = function(self)
    if self.m_textChangeCallback.func then
        self.m_textChangeCallback.func(self.m_textChangeCallback.obj,EditTextView.getText(self));
    end
end

---
--析构函数.
--
-- @param self
EditTextView.dtor = function(self)
    ime_close_edit();
end

---------------------------------private functions-----------------------------------------

---
-- 控件提供给  @{core.drawing#DrawingBase.setEventTouch} 的回调函数.
-- 
-- **注：该函数被标记为“private function”，不建议直接调用该函数。**
-- 
-- @param self
-- @param #number finger_action See @{core.drawing#DrawingBase.setEventTouch}.
-- @param #number x See @{core.drawing#DrawingBase.setEventTouch}.
-- @param #number y See @{core.drawing#DrawingBase.setEventTouch}.
-- @param #number drawing_id_first See @{core.drawing#DrawingBase.setEventTouch}.
-- @param #number drawing_id_current See @{core.drawing#DrawingBase.setEventTouch}.
-- @param #number event_time 当前事件的触发时间(单位：毫秒)。
EditTextView.onEventTouch = function(self, finger_action, x, y, drawing_id_first, drawing_id_current,event_time)
    TextView.onEventTouch(self,finger_action,x,y,drawing_id_first,drawing_id_current,event_time);
    if finger_action == kFingerDown then
        self.m_startX = x;
        self.m_startY = y;
        self.m_touching = true;
    elseif finger_action == kFingerUp then
        if not self.m_touching then return end;

        self.m_touching = false;

        local diffX = math.abs(x - self.m_startX);
        local diffY = math.abs(y - self.m_startY);
        if diffX > self.m_maxClickOffset
            or diffY > self.m_maxClickOffset
            or (not self.m_enable)
            or (drawing_id_first ~= drawing_id_current) then
            return
        end


        EditTextViewGlobal = self;


        local x,y = self:getAbsolutePos();
        local actualX= x * System.getLayoutScale();
        local actualY= y * System.getLayoutScale();

        local w,h = self:getSize();
        local actualW= w * System.getLayoutScale();
        --local actualH= h * System.getLayoutScale();
        local actualH = 0;
        if System.getPlatform() == kPlatformAndroid then 
	   		actualH = (h+12) * System.getLayoutScale();
		else 
	        actualH = h * System.getLayoutScale();
		end
        self:setVisible(false);
       
	    local textStr=EditTextView.getText(self)
        if textStr == " " then
            textStr = ""
        end

        -- inputeModel,inputFlag,returnType
		dict_set_int(EditText.s_ex_dict_table_name,"inputMode",self.m_inputMode);
		dict_set_int(EditText.s_ex_dict_table_name,"inputFlag",self.m_inputFlag);
		dict_set_int(EditText.s_ex_dict_table_name,"returnType", kKeyboardReturnTypeDone);
		ime_open_edit(textStr,

			"",
			self.m_inputMode,
			self.m_inputFlag,
			kKeyboardReturnTypeDone,
			self.m_maxLength or -1,"global_view",self.m_fontName or "",(self.m_res.m_fontSize or 24)* System.getLayoutScale(),

            self.m_textColorR,self.m_textColorG,self.m_textColorB,
            actualX,actualY,actualW,actualH);
		EditTextViewGlobal.setText(EditTextViewGlobal,"");


    end
end

---                                          
-- 用于 [```event_ime_close_global```](#event_ime_close_global) 的一个全局变量.
-- 
-- 其值为一个 @{#EditTextView} 对象。
--
-- @field [parent=#global] #EditTextView EditTextViewGlobal 

---
-- 按钮提供给 ```ime_open_edit``` 的回调函数，用于将系统输入的信息显示到控件上. 
-- 
-- **注：该函数被标记为“private function”，不建议直接调用该函数。**
-- 
-- @param #string strNewValue 用户输入的信息。
-- @param #number flag 若为1，则更新输入，并调用相应事件。
function event_ime_close_global_view(strNewValue, flag)

    if EditTextViewGlobal then
          EditTextViewGlobal:setVisible(true)
        EditTextViewGlobal.setText(EditTextViewGlobal,strNewValue);
        if (not strNewValue) or strNewValue == "" or strNewValue == EditTextViewGlobal.m_hintText then
            EditTextViewGlobal.setText(EditTextViewGlobal,EditTextViewGlobal.m_hintText,nil,nil,EditTextViewGlobal.m_hintTextColorR,EditTextViewGlobal.m_hintTextColorG,EditTextViewGlobal.m_hintTextColorB);
        else

            EditTextViewGlobal.setText(EditTextViewGlobal,strNewValue,nil,nil,EditTextViewGlobal.m_textColorR,EditTextViewGlobal.m_textColorG,EditTextViewGlobal.m_textColorB);
        end

        EditTextViewGlobal.onTextChange(EditTextViewGlobal);
    end
    EditTextViewGlobal = nil;
end



end
        

package.preload[ "ui.editTextView" ] = function( ... )
    return require('ui/editTextView')
end
            

package.preload[ "ui/gridView" ] = function( ... )
-- gridView.lua
-- Author: Vicent.Gong
-- Date: 2013-08-01
-- Last modification : 2013-08-01
-- Description: Implemented gridView

--------------------------------------------------------------------------------
-- GridView是一个可以放入多个控件的可滚动的容器.
-- 内部内容被自动排列为Grid(多行多列)的形式。
-- @module ui.gridView
-- @return #nil 
-- @usage  require("ui/gridView")



require("core/object");
require("ui/tableView");

---
-- @type GridView
-- @extends ui.tableView#Tableview
GridView = class(TableView,false);


---
-- 默认的滚动条的宽度.
-- 
-- @field [parent=#GridView] #number s_scrollBarWidth

---
-- 默认的最大点击距离.
-- 
-- @field [parent=#GridView] #number s_maxClickOffset


---
-- 设置默认的滚动条的宽度.
--
-- @param #number width 滚动条的宽度。
GridView.setDefaultScrollBarWidth = function(width)
    GridView.s_scrollBarWidth = width or TableView.s_defaultScrollBarWidth;
end

---
-- 设置最大点击距离。
-- 详见: @{ui.tableView#TableView.setDefaultMaxClickOffset} .
--
-- @param #number maxClickOffset 最大点击距离。
GridView.setDefaultMaxClickOffset = function(maxClickOffset)
    GridView.s_maxClickOffset = maxClickOffset or TableView.s_defaultMaxClickOffset;
end

---
-- 构造函数.
--
-- @param self
-- @param #number x 控件相对于父节点的位置X坐标。详见：<a href="core.drawing.html#006">**引擎的子节点与父节点九种对齐方式和其相对位置.**</a>
-- @param #number y 控件相对于父节点的位置Y坐标。详见：<a href="core.drawing.html#006">**引擎的子节点与父节点九种对齐方式和其相对位置.**</a>
-- @param #number w 宽度。GridView会自动根据内部item的大小来决定每一行可以放的item数量。
-- @param #number h 高度。
GridView.ctor = function(self, x, y, w, h)
    super(self,x,y,w,h,false,true);
end
end
        

package.preload[ "ui.gridView" ] = function( ... )
    return require('ui/gridView')
end
            

package.preload[ "ui/groupNode" ] = function( ... )
-- groupNode.lua
-- Author: Vicent.Gong
-- Date: 2013-06-03
-- Last modification : 2013-07-05
-- Description: The base implement of RadioButton and CheckBox

--------------------------------------------------------------------------------
-- 为“多个一组的控件”(如单选框、多选框)提供基本的封装.
-- @module ui.groupNode
-- @return #nil 
-- @usage require("ui/groupNode")


require("core/object");
require("core/global");
require("ui/node");
require("ui/images");


---
-- "一组控件"中的某一项.
--
-- @type GroupItem
-- @extends ui.images#Images
GroupItem = class(Images)

---
-- 构造方法.
--
-- @param self
-- @param #table fileNameArray  一个包含图片的路径的lua数组。详见：@{ui.images#Images.ctor}
-- @param #number fmt 图片的纹理像素格式. 详见：@{ui.images#Images.ctor}
-- @param #number filter 图片的纹理过滤方式.详见：@{ui.images#Images.ctor}
-- @param #number leftWidth 图片九宫拉伸的左边宽度。详见：@{ui.images#Images.ctor}
-- @param #number rightWidth 图片九宫拉伸的右边宽度。详见：@{ui.images#Images.ctor}
-- @param #number topWidth 图片九宫拉伸的顶部宽度。详见：@{ui.images#Images.ctor}
-- @param #number bottomWidth 图片九宫拉伸的底部宽度。详见：@{ui.images#Images.ctor}
GroupItem.ctor = function(self, fileNameArray, fmt, filter, leftWidth, rightWidth, topWidth, bottomWidth)
    GroupItem.setEventTouch(self,self,self.onEventTouch);

    self.m_enable = true;
    self.m_checked = false;
end

---
-- 添加一个子节点.
--
-- @param self
-- @param core.drawing#DrawingBase child 节点。
GroupItem.addChild = function(self, child)
    Images.addChild(self,child);
    child:setEventTouch(self,self.onEventTouch);
end

---
-- 为这个item设置他所属的"组"控件.
-- **注：该函数被标记为“private function”，不建议直接调用该函数。**
--
-- @param self
-- @param #GroupNode group 组。
GroupItem.setGroup = function(self, group)
    self.m_group = group;
end

---
-- 设置条目是否被选中.
--
-- @param self
-- @param #boolean checked  条目是否被选中。checked为true则为选中，否则不选中。
GroupItem.setChecked = function(self, checked)
    if self.m_checked == checked then
        return
    end

    self.m_checked = checked;
    GroupItem.setImageIndex(self,checked and 1 or 0);
end

---
-- 这个条目是否被选中.
--
-- @param self
-- @return #boolean 条目是否被选中。返回true则条目被选中，返回false则条目不选中。
GroupItem.isChecked = function(self)
    return self.m_checked;
end

---
-- 析构函数.
-- @param self
GroupItem.dtor = function(self)

end

---
-- 设置是否可用.
-- 
-- @param self
-- @param #boolean enable 如果为false，则不可用。此item不会影响点击事件.
GroupItem.setEnable = function(self, enable)
    self.m_enable = enable;
end

---------------------------------private functions-----------------------------------------

---
-- 处理触摸事件.
-- **注：该函数被标记为“private function”，不建议直接调用该函数。**
--
-- @param self
-- @param #number finger_action 手指事件。详见： <a href="core.drawing.html#008">**8.触摸机制回调函数的参数的意义。**</a>
-- @param #number x 是手指触摸时的全局横坐标。
-- @param #number y 是手指触摸时的全局纵坐标。
-- @param #number drawing_id_first 是[```kFingerDown```](core.constants.html#kFingerDown)时拾取到的drawing可绘制对象的id。
-- @param #number drawing_id_current 是引擎根据当前坐标拾取到的drawing可绘制对象的id。
-- @param #number event_time 当前事件的触发时间(单位：毫秒)。
GroupItem.onEventTouch = function(self, finger_action, x, y, drawing_id_first, drawing_id_current,event_time)
    if not self.m_enable then return end;

    if finger_action == kFingerUp then
        if self.m_group then
            self.m_group.onItemClick(self.m_group,self);
        end
    end
end



---
-- 一"组"控件.
-- @type GroupNode
-- @extends ui.node#Node
GroupNode = class(Node);

---
-- 构造函数.
--
-- @param self
GroupNode.ctor = function(self)
    self.m_items = {};
    self.m_eventCallback = {};
end

---
-- 添加一个子控件.
-- 子控件的位置需要自行指定。
--
-- @param self
-- @param #GroupItem item 子控件节点。
GroupNode.addChild = function(self, item)
    if not typeof(item,GroupItem) then
        FwLog("The child adding to GroupNode is not a GroupItem");
        return
    end

    self.m_items[#self.m_items+1] = item;
    Node.addChild(self,item);
    item:setGroup(self);
end

---
-- 移除一个子控件.
--
-- @param self
-- @param #GroupItem item 子控件节点。
-- @param #boolean doCleanup 是否对item执行delete操作。doCleanup为true则执行；否则，不执行。
GroupNode.removeChild = function(self, item, doCleanup)
    local index = GroupNode.getItemIndex(self,item);
    if index then
        item:setGroup(nil);
        Node.removeChild(self,item,doCleanup);
        table.remove(self.m_items,index);
    end
end

---
-- 添加一个子控件.
-- 完全等价于 @{#GroupNode.addChild}。
--
-- @param self
-- @param #GroupItem item 子控件节点。
GroupNode.addItem = function(self, item)
    GroupNode.addChild(self,item);
end

---
-- 移除一个子控件.
-- 完全等价于@{#GroupNode.removeChild}
--
-- @param self
-- @param #GroupItem item 子控件节点。
-- @param #boolean doCleanup 是否对item执行delete操作。doCleanup为true则执行；否则，不执行。
GroupNode.removeItem = function(self, item, doCleanup)
    GroupNode.removeChild(self,item,doCleanup);
end

---
-- 根据索引移除一个子控件.
--
-- @param self
-- @param #number index 子控件的index。
-- 子控件按先后添加顺序从1，2依次排序，移除一个后，后面的前移补上空缺.
--
-- @param #number index 索引值。
-- @param #boolean doCleanup 是否对这个移除的控件执行delete操作。若doCleanup为true则执行，否则不执行。
GroupNode.removeItemByIndex = function(self, index, doCleanup)
    if not (index and self.m_items[index]) then
        return
    end

    local ret = self.m_items[index];
    GroupNode.removeChild(self,self.m_items[index],doCleanup);
    return (not doCleanup) and ret or nil;
end

---
-- 查询某个子控件的index.
--
-- @param self
-- @param #GroupItem item 子控件。
-- @return #number 索引值。
GroupNode.getItemIndex = function(self, item)
    for k,v in ipairs(self.m_items) do
        if v == item then
            return k;
        end
    end
end

---
-- 通过索引值查找某个子控件.
-- @param self
-- @param #number index 索引值。
-- @return #GroupItem  查找到的item，如果不存在，则返回nil。
GroupNode.getItem = function(self, index)
    if index then
        return self.m_items[index];
    end
end

---
-- 得到选择结果.
-- 虚方法，应由子类实现。
--
-- @param self
GroupNode.getResult = function(self)
    error("Derived classes must implement this function");
end

---
-- 清除所有选择.
-- 将所有子控件设置为未选中状态.
--
-- @param self
GroupNode.clear = function(self)
    for _,item in pairs(self.m_items) do
        item:setChecked(false);
    end
end

---
-- 设置可用状态.
--
-- @param self
-- @param #boolean enable 是否可用，如果不可用，则所有子控件都不可点击。enable为true则可用；否则，不可用。
GroupNode.setEnable = function(self, enable)
    for _,item in pairs(self.m_items) do
        item:setEnable(enable);
    end
end

---
-- 设置状态改变的回调.
--
-- @param self
-- @param obj 任意类型。
-- @param #function func 回调函数，具体回调的实现由子类实现.
GroupNode.setOnChange = function(self, obj, func)
    self.m_eventCallback.obj = obj;
    self.m_eventCallback.func = func;
end

---
-- 某一个子控件被点击.
-- **注：该函数被标记为“private function”，不建议直接调用该函数。**
-- @param self
-- @param #GroupItem item 条目。
GroupNode.onItemClick = function(self, item)
    error("Derived classes must implement this function");
end

---
-- 析构函数.
--
-- @param self
GroupNode.dtor = function(self)
    self.m_items = nil;
    self.m_eventCallback = nil;
end
end
        

package.preload[ "ui.groupNode" ] = function( ... )
    return require('ui/groupNode')
end
            

package.preload[ "ui/image" ] = function( ... )
-- image.lua
-- Author: Vicent Gong
-- Date: 2012-09-24
-- Last modification : 2013-06-25
-- Description: Wrap a class to create a image quickly

--------------------------------------------------------------------------------
-- 封装了一个图片控件.
-- @module ui.image
-- @return #nil 
-- @usage require("ui/image")


require("core/object");
require("core/res");
require("core/drawing");

---
-- 
-- 该类封装了一个图片控件.
--
-- @{#Image} 提供了创建图片的快捷方式，对用 @{core.res#ResImage} 和 @{core.drawing#DrawingImage} 创建可见图片做了简单封装。
--
-- @type Image
-- @extends core.drawing#DrawingImage 
Image = class(DrawingImage,false);


---
-- 构造函数.
-- 
-- 在创建控件的时候，必须指定对应的图片。在创建过程中，会创建对应的 
-- @{core.res#ResImage} 对象，并关联起来。
-- 
-- 所有的参数都直接传给 @{core.res#ResImage.ctor} 或 @{core.drawing#DrawingImage.ctor}。
-- 
-- @param self
-- @param file 文件路径。详见: @{core.res#ResImage.ctor}.
-- @param fmt 纹理的像素格式。详见： @{core.res#ResImage.ctor}.
-- @param filter 纹理的过滤方式。详见： @{core.res#ResImage.ctor}.
-- @param leftWidth 图片九宫拉伸的左边宽度。详见： @{core.drawing#DrawingImage.ctor}.
-- @param rightWidth 图片九宫拉伸的右边宽度。详见： @{core.drawing#DrawingImage.ctor}.
-- @param topWidth 图片九宫拉伸的顶部宽度。详见： @{core.drawing#DrawingImage.ctor}.
-- @param bottomWidth 图片九宫拉伸的底部宽度。详见： @{core.drawing#DrawingImage.ctor}.
Image.ctor = function(self, file, fmt, filter, leftWidth, rightWidth, topWidth, bottomWidth)
    self.m_res = new(ResImage,file,fmt,filter);
    super(self,self.m_res,leftWidth,rightWidth,topWidth,bottomWidth);
end

---
-- 重新设置图片资源.
-- 
-- 该函数通过 @{core.res#ResImage.setFile} 重设资源，并重设资源的位置和大小。
-- 
-- @param self
-- @param file 文件路径。详见： @{core.res#ResImage.setFile}.
Image.setFile = function(self, file)
    self.m_res:setFile(file);
    Image.setResRect(self,0,self.m_res);
    Image.setResTrimAndRotate(self,0,self.m_res);
end


---
-- 析构函数。对应的 res 也会被释放。
-- 
-- @param self
Image.dtor = function(self)
    delete(self.m_res);
    self.m_res = nil;
end

Image.isValid = function(self)
    return self.m_res and self.m_res:isValid()
end

end
        

package.preload[ "ui.image" ] = function( ... )
    return require('ui/image')
end
            

package.preload[ "ui/images" ] = function( ... )
-- images.lua
-- Author: Vicent Gong
-- Date: 2012-09-24
-- Last modification : 2013-06-25
-- Description: Implement Images

--------------------------------------------------------------------------------
-- 对Image的扩充，包含多个图片可以切换显示.
-- @module ui.images
-- @return #nil 
-- @usage require("ui/images")


require("core/object");
require("core/global");
require("ui/image");

---
-- 
-- 该类封装了一个图片控件，图片可以随时切换.
--
-- @{#Images} 封装了一个图片序列，传入一个图片路径数组可以创建一个 @{#Images} ，
-- 这样就可以通过 @{#Images.setImageIndex} 切换图片。
--
-- @type Images
-- @extends ui.image#Image 
Images = class(Image,false);

---
-- 构造函数.
--
-- 在创建的时候，通过 filenameArray 将一组图片传递进来并加载。其它参数同 @{ui.image#Image.ctor} 。
-- 在创建完后，数组中的第 1 张图片会被显示。
--
-- @param self
-- @param #list<#string> filenameArray 一个包含图片的路径的lua数组。数组元素个数必须 >= 2。
-- @param fmt 纹理的像素格式。详见： @{ui.image#Image.ctor}.
-- @param filter 纹理的过滤方式。详见： @{ui.image#Image.ctor}.
-- @param leftWidth 图片九宫拉伸的左边宽度。详见： @{ui.image#Image.ctor}.
-- @param rightWidth 图片九宫拉伸的右边宽度。详见： @{ui.image#Image.ctor}.
-- @param topWidth 图片九宫拉伸的顶部宽度。详见： @{ui.image#Image.ctor}.
-- @param bottomWidth 图片九宫拉伸的底部宽度。详见： @{ui.image#Image.ctor}.
Images.ctor = function(self, filenameArray, fmt, filter, leftWidth, rightWidth, topWidth, bottomWidth)
    super(self,filenameArray[1],fmt,filter,leftWidth,rightWidth,topWidth,bottomWidth);

    self.m_reses = {};
    for i=2,#filenameArray do
        local res = new(ResImage,filenameArray[i],fmt,filter);
        Images.addImage(self,res,i-1);
        self.m_reses[i-1] = res;
    end
end

---
-- 设置当前显示的图片.
-- 
-- 指定 index 以后，第 index 张图片会被显示出来。若 index 超出取值范围，则仅打印日志，不做其它事情。
-- 
-- @param self
-- @param #number index 指定要显示哪张图片。
Images.setImageIndex = function(self, index)
   if self.m_reses ==nil then return end

    if index < 0 or index > #self.m_reses then
        FwLog("Imgaes setIndex , index < 0 or index > resCounts");
        return
    end

    Image.setImageIndex(self,index);
end

---
-- 析构函数.
-- 
-- 所有关联的图片 res 都会被 delete()。
--
-- @param self
Images.dtor = function(self)
  if self.m_reses ==nil then return end

    for _,v in pairs(self.m_reses) do
        delete(v);
    end

    self.m_reses = nil;
end

end
        

package.preload[ "ui.images" ] = function( ... )
    return require('ui/images')
end
            

package.preload[ "ui/listView" ] = function( ... )
-- listView.lua
-- Author: Vicent.Gong
-- Date: 2012-09-27
-- Last modification : 2013-06-25
-- Description: Implemented listview

--------------------------------------------------------------------------------
-- ListView，单列滚动容器.
-- @module ui.listView
-- @return #nil 
-- @usage require("ui/listView")


require("core/object");
require("ui/tableView");

---
-- @type ListView
-- @extends ui.tableView#TableView
ListView = class(TableView);

---
-- 默认的滚动条的宽度.
-- 
-- @field [parent=#ListView] #number s_scrollBarWidth

---
-- 默认的最大点击距离.
-- 
-- @field [parent=#ListView] #number s_maxClickOffset

---
-- 设置默认的滚动条宽度.
-- 
-- @param #number width 滚动条的宽度。
ListView.setDefaultScrollBarWidth = function(width)
    ListView.s_scrollBarWidth = width or TableView.s_defaultScrollBarWidth;
end

---
-- 设置最大点击距离。
-- 详见: @{ui.tableView#TableView.setDefaultMaxClickOffset} .
--
-- @param #number maxClickOffset 最大点击距离。
ListView.setDefaultMaxClickOffset = function(maxClickOffset)
    ListView.s_maxClickOffset = maxClickOffset or TableView.s_defaultMaxClickOffset;
end

---
-- 构造函数.
--
-- @param self
-- @param #number x 控件相对于父节点的位置X坐标。详见：<a href="core.drawing.html#006">**引擎的子节点与父节点九种对齐方式和其相对位置.**</a>
-- @param #number y 控件相对于父节点的位置Y坐标。详见：<a href="core.drawing.html#006">**引擎的子节点与父节点九种对齐方式和其相对位置.**</a>
-- @param #number w 宽度。
-- @param #number h 高度。
ListView.ctor = function(self, x, y, w, h)

end
end
        

package.preload[ "ui.listView" ] = function( ... )
    return require('ui/listView')
end
            

package.preload[ "ui/node" ] = function( ... )
-- Node.lua
-- Author: Vicent Gong
-- Date: 2012-10-18
-- Last modification : 2012-10-22

--------------------------------------------------------------------------------
-- 这个文件实现了Node类.
-- 
-- @module ui.node
-- @return #nil 
-- @usage require("ui/node")

require("core/object");
require("core/drawing");

---
-- 全局变量Node提供了操作Node类型对象的方法.
--
-- 类的每一个实例是一个空节点。
-- 
-- @type Node
-- @extends core.drawing#DrawingEmpty
Node = class(DrawingEmpty);

---
-- Node类的构造函数。
Node.ctor = function(self)

end

---
-- Node类的析构函数。
Node.dtor = function(self)

end

end
        

package.preload[ "ui.node" ] = function( ... )
    return require('ui/node')
end
            

package.preload[ "ui/radioButton" ] = function( ... )
-- radioButton.lua
-- Author: Vicent.Gong
-- Date: 2012-09-26
-- Last modification : 2013-07-05
-- Description: Implemented radio button

--------------------------------------------------------------------------------
-- 提供单选按钮，和按钮组.
-- @module ui.radioButton
-- @return #nil 
-- @usage require("ui/radioButton")


require("core/object");
require("core/global");
require("ui/groupNode");

---------------------------------------------------------------------------------------------
-----------------------------------[CLASS] RadioButtonGroup----------------------------------
---------------------------------------------------------------------------------------------

---
-- 单选按钮组.
--
-- @type RadioButtonGroup
-- @extends ui.groupNode#GroupNode
RadioButtonGroup = class(GroupNode);

---
-- 添加一个单选按钮.
--
-- @param self
-- @param #RadioButton item 单选按钮。
RadioButtonGroup.addChild = function(self, item)
    GroupNode.addChild(self,item);
    if item:isChecked() then
        RadioButtonGroup.setSelected(self,RadioButtonGroup.getButtonIndex(self,item));
    end
end

---
-- 添加一个单选按钮.
--
-- @param self
-- @param #RadioButton button 单选按钮。
RadioButtonGroup.addButton = function(self, button)
    return RadioButtonGroup.addItem(self,button);
end

---
-- 移除一个单选按钮.
--
-- @param self
-- @param #RadioButton button 单选按钮。
-- @param #boolean doCleanup 是否对单选按钮执行delete()操作.若doCleanup为true则执行，否则不执行。
RadioButtonGroup.removeButton = function(self, button, doCleanup)
    return RadioButtonGroup.removeItem(self,button,doCleanup);
end

---
-- 根据索引移除一个单选按钮.
--
-- @param self
-- @param #number index 需要移除的单选按钮的index。
-- index按照添加顺序从1，2开始依次排列，移除中间的某个后，后面的会前移补上空缺.
-- @param #boolean doCleanup 是否对移除的按钮执行delete()操作。若doCleanup为true则执行，否则不执行。
RadioButtonGroup.removeButtonByIndex = function(self, index, doCleanup)
    return RadioButtonGroup.removeItemByIndex(self,index,doCleanup);
end

---
-- 获取单选按钮的索引值.
-- 
-- @param self
-- @param #RadioButton button 单选按钮。
-- @return #number 单选按钮索引值。
RadioButtonGroup.getButtonIndex = function(self, button)
    return RadioButtonGroup.getItemIndex(self,button);
end


---
-- 通过index查找单选按钮.
--
-- @param self
-- @param #number index 单选按钮的索引值。
-- @return #RadioButton 单选按钮。
RadioButtonGroup.getButton = function(self, index)
    return RadioButtonGroup.getItem(self,index);
end


---
-- 设置单选按钮为选中状态.
--
-- @param self
-- @param #number index 单选按钮的索引。
RadioButtonGroup.setSelected = function(self, index)
    if not (index and self.m_items[index]) then
        return false;
    end

    local button = self.m_items[index];

    if (self.m_checkedButton == button) or (not button) then
        return false;
    end

    if self.m_checkedButton then
        self.m_checkedButton:setChecked(false);
    end
    button:setChecked(true);

    self.m_checkedButton = button;

    return true;
end

---
-- 判断某一个单选按钮是否被选中.
--
-- @param self
-- @param #number index 单选按钮的索引。
-- @return #boolean 是否被选中。返回true则被选中；否则，未被选中。
RadioButtonGroup.isSelected = function(self, index)
    if not (index and self.m_items[index]) then
        return
    end

    self.m_items[index]:isChecked();
end

---
-- 得到被选中的单选按钮.
--
-- @param self
-- @return #number 返回被选中的单选按钮的索引值。
RadioButtonGroup.getResult = function(self)
    for k,button in ipairs(self.m_items) do
        if button:isChecked() then
            return k;
        end
    end
end


---
-- 清除所有选择.
-- 将所有子控件设置为未选中状态.
--
-- @param self
RadioButtonGroup.clear = function(self)
    GroupNode.clear(self);
    self.m_checkedButton = nil;
end

---
-- 某一个选择框的状态发生改变的回调函数.
-- **注：该函数被标记为“private function”，不建议直接调用该函数。**
--
-- @param self
-- @param #RadioButton button 单选按钮。
RadioButtonGroup.onItemClick = function(self, button)
    local lastCheckButton = self.m_checkedButton;
    local index = RadioButtonGroup.getButtonIndex(self,button);
    local doSucceed = RadioButtonGroup.setSelected(self,index);

    if doSucceed and self.m_eventCallback.func then
        self.m_eventCallback.func(self.m_eventCallback.obj,
             index,RadioButtonGroup.getButtonIndex(self,lastCheckButton));
    end
end


---------------------------------------------------------------------------------------------
-----------------------------------[CLASS] RadioButton---------------------------------------
---------------------------------------------------------------------------------------------

---
-- 单选按钮.
-- @type RadioButton
-- @extends ui.groupNode#GroupItem
RadioButton = class(GroupItem,false);


---默认的默认图片样式。
RadioButton.s_defaultImages = {"ui/radioButton1.png","ui/radioButton2.png"};


---
-- 默认的图片样式.
-- 
-- @field [parent=#RadioButton] #number s_images

---
-- 设置默认图片样式.
--
-- @param #table images 默认图片，格式如：`{"unselected.png", "selected.png"}`
RadioButton.setDefaultImages = function(images)
    RadioButton.s_images = images or RadioButton.s_defaultImages;
end

---
-- 构造方法.
-- 
-- @param self
-- @param #table fileNameArray 图片样式，格式：`{"unselected.png", "selected.png"}`，如果未提供，则使用默认图片样式.
-- @param #number fmt 图片的纹理像素格式。详见： @{ui.groupNode#GroupItem.ctor}.
-- @param #number filter 图片的纹理过滤方式。详见： @{ui.groupNode#GroupItem.ctor}.
-- @param #number leftWidth 图片九宫拉伸的左边宽度。详见： @{ui.groupNode#GroupItem.ctor}.
-- @param #number rightWidth 图片九宫拉伸的右边宽度。详见： @{ui.groupNode#GroupItem.ctor}.
-- @param #number topWidth 图片九宫拉伸的顶部宽度。详见： @{ui.groupNode#GroupItem.ctor}.
-- @param #number bottomWidth 图片九宫拉伸的底部宽度。详见： @{ui.groupNode#GroupItem.ctor}.
RadioButton.ctor = function(self, fileNameArray, fmt, filter, leftWidth, rightWidth, topWidth, bottomWidth)
    local array = fileNameArray or self.s_images or RadioButton.s_defaultImages;
    super(self,array,fmt,filter,leftWidth,rightWidth,topWidth,bottomWidth);
end

---
-- 设置是否选中.
--
-- @param self
-- @param #boolean checked 是否选中.checked为true则选中，checked为false则未选中。
RadioButton.setChecked = function(self, checked)
    if self.m_checked == checked then
        return
    end

    GroupItem.setChecked(self,checked);

    if self.m_group then
        self.m_group:setSelected(self.m_group:getButtonIndex(self));
    end
end

end
        

package.preload[ "ui.radioButton" ] = function( ... )
    return require('ui/radioButton')
end
            

package.preload[ "ui/scrollableNode" ] = function( ... )
-- scrollableNode.lua
-- Author: Vicent Gong
-- Date: 2013-06-17
-- Last modification : 2013-07-05
-- Description: Implement a base class for all scrollable views

--------------------------------------------------------------------------------
-- 提供一个带滚动的容器控件框架，为其它带滚动效果的容器控件的基类。
-- @module ui.scrollableNode
-- @return #nil 
-- @usage require("ui/scrollableNode")



require("core/constants");
require("core/object");
require("ui/node");
require("ui/scroller");
require("ui/scrollBar");

---
-- @{#ScrollableNode} 提供一个带滚动的容器控件框架。为其它带滚动效果的容器控件的基类。
--  
-- @{#ScrollableNode}假设使用它的是一个容器控件，该容器控件本身是一个节点（@{ui.node#Node}的对象），
-- 且拥有一个子节点（@{ui.node#Node}的对象），该子节点的子节点为该容器控件的子控件，
-- 这些子控件随着子节点的移动而移动。子节点的移动只能在上下或左右移动。
-- 
-- 关于该容器控件的模型设定，具体可以参考 @{ui.scroller#Scroller}，它们对容器控件模型有着一致的设定。 
--
-- 注意：
-- 
-- * @{#ScrollableNode} 对象并不自带子节点。子节点由继承 @{#ScrollableNode}的类提供。 
-- * @{#ScrollableNode} 自带滚动条，子节点无需自己再设置。
-- * 子控件的移动行为， 由@{ui.scroller#Scroller}控制，相关概念和术语参考@{ui.scroller#Scroller}。
-- 
-- @type ScrollableNode
-- @extends ui.node#Node 
ScrollableNode = class(Node);

---
-- 构造函数.
-- 
-- @param self
-- @param #number direction 子节点移动方向。
-- 若为  [```kVertical```](core.constants.html#kVertical) ，则子节点为上下移动；若为 [```kHorizontal```](core.constants.html#kHorizontal) ，则为左右移动。若为 nil 或 false，则默认为 [```kVertcal```](core.constants.html#kVertcal)。
-- @param #number scrollBarWidth 滚动条粗细。
ScrollableNode.ctor = function(self, direction, scrollBarWidth)
    ScrollableNode.setDirection(self,direction);
    self.m_scrollBarWidth = scrollBarWidth;

    self.m_margrinReboudingCallback = {};
end

---
-- 设置“边缘回弹”时开始和结束时的回调函数.
-- 
-- 在“边缘回弹”时开始和结束时，会调用```func(obj, status, align)```。
-- 其中参数如下：
-- 
-- * ```obj```
--      * 调用@{#ScrollableNode.setOnMarginRebounding}时传进来的参数```obj```。
-- * ```status```
--      * 状态。其值为 [```kScrollerStatusStart```](core.constants.html#kScrollerStatusStart) 
--      或 [```kScrollerStatusStop```](core.constants.html#kScrollerStatusStop)。 
-- * ```align```
--      * 其值为以下4个之一。用于指定“边缘回弹”发生在哪个边缘。
--          * 若为 [```kAlignTop```](core.constants.html#kAlignTop) ，则发生在上边缘。
--          * 若为 [```kAlignLeft```](core.constants.html#kAlignLeft) ，则发生在左边缘。
--          * 若为 [```kAlignBottom```](core.constants.html#kAlignBottom) ，则发生在下边缘。
--          * 若为 [```kAlignRight```](core.constants.html#kAlignRight) ，则发生在右边缘。
-- 
-- @param self
-- @param obj 任意lua值。
-- @param #function func 回调函数。
ScrollableNode.setOnMarginRebounding = function(self, obj, func)
    self.m_margrinReboudingCallback.obj = obj;
    self.m_margrinReboudingCallback.func = func;
end

--virtual functions

--- 
-- 返回容器控件的长度.
-- 
-- 这个函数希望被override。若直接调用，则仅仅打印一句话，不返回。
ScrollableNode.getFrameLength = function(self)
    error("Derived class must implement this function");
end

--- 
-- 返回子节点的长度.
-- 
-- 这个函数希望被override。若直接调用，则仅仅打印一句话，不返回。
ScrollableNode.getViewLength = function(self)
    error("Derived class must implement this function");
end

--- 
-- 返回单元的长度.
-- 
-- 这个函数希望被override。若直接调用，则仅仅打印一句话，不返回。
ScrollableNode.getUnitLength = function(self)
    error("Derived class must implement this function");
end

---
-- 返回滚动条的起始位置.
-- 
-- 这个函数希望被override。若直接调用，则仅仅打印一句话，不返回。
ScrollableNode.getFrameOffset = function(self)
    error("Derived class must implement this function");
end

--- 
-- 返回是否需要通过 @{#ui.scroller#Scroller}来控制子节点的行为.
-- 
-- 这个函数希望被override。若直接调用，则仅仅打印一句话，不返回。
ScrollableNode.needScroller = function(self)
    error("Derived class must implement this function");
end

---
-- 返回是否需要滚动条。
-- 
-- @return #boolean 若为true，则需要滚动条；否则不需要滚动条。
ScrollableNode.needScrollBar = function(self)
    return self.m_scrollBarWidth and self.m_scrollBarWidth >= 1;
end

---
-- 设置子节点的移动方向.
-- 
-- @param self
-- @param #number direction 子节点移动方向。
-- 若为  [```kVertical```](core.constants.html#kVertical) ，则子节点为上下移动；若为 [```kHorizontal```](core.constants.html#kHorizontal) ，则为左右移动。若为 nil 或 false，则默认为 [```kVertcal```](core.constants.html#kVertcal)。
ScrollableNode.setDirection = function(self, direction)
    self.m_direction = direction;

    ScrollableNode.recreate(self);
end

---
-- 设置滚动条宽度（粗细）.
-- 
-- @param self
-- @param #number width 滚动条宽度（粗细）。
ScrollableNode.setScrollBarWidth = function(self, width)
    self.m_scrollBarWidth = width;
    ScrollableNode.updateScrollBar(self);
    ScrollableNode.updateScrollBarPosAndSize(self);
end

---
-- 返回正在使用的@{ui.scroller#Scroller}.
-- 
-- @return ui.scroller#Scroller 当前正在使用的@{ui.scroller#Scroller}。若无，则返回nil。
ScrollableNode.getScroller = function(self)
    return self.m_scroller;
end

---
-- 返回正在使用的滚动条.
-- 
-- @return ui.scrollbar#ScrollerBar 当前正在使用的滚动条。若无，则返回nil。
ScrollableNode.getScrollBar = function(self)
    return self.m_scrollBar;
end

---
-- 更新控件。
ScrollableNode.update = function(self)
    ScrollableNode.updateScroller(self);
    ScrollableNode.updateScrollBar(self);
end

---
-- 停止当前正在进行的滚动。
ScrollableNode.stop = function(self)
    ScrollableNode.stopScroller(self);
end

---
-- 重新创建滚动条和@{ui.scroller#Scroller}。
ScrollableNode.recreate = function(self)
    ScrollableNode.releaseScroller(self);
    ScrollableNode.releaseScrollBar(self);

    ScrollableNode.updateScroller(self);
    ScrollableNode.updateScrollBar(self);
end

---
-- Override @{core.drawing#DrawingBase.setVisible}.
-- 
-- @param self
-- @param #boolean visible 设置是否可见。详见： @{core.drawing#DrawingBase.setVisible}.
ScrollableNode.setVisible = function(self, visible)
    ScrollableNode.stopScroller(self);
    Node.setVisible(self,visible);
    ScrollableNode.setScrollbarInvisible(self);
end

---
-- Override @{core.drawing#DrawingBase.setPos}.
-- 
-- @param self
-- @param #number x 相对于父drawing的横坐标。详见： @{core.drawing#DrawingBase.setPos}.
-- @param #number y 相对于父drawing的纵坐标。详见： @{core.drawing#DrawingBase.setPos}.
ScrollableNode.setPos = function(self, x, y)
    Node.setPos(self,x,y);
    local x,y = ScrollableNode.getUnalignPos(self);
    local w,h = ScrollableNode.getSize(self);
	ScrollableNode.setClip(self,x,y,w,h);
end

---
-- Override @{core.drawing#DrawingBase.setSize}.
-- 
-- @param self
-- @param #number w 宽度。详见： @{core.drawing#DrawingBase.setSize}.
-- @param #number h 高度。详见： @{core.drawing#DrawingBase.setSize}.
ScrollableNode.setSize = function(self, w, h)
    Node.setSize(self,w,h);
    local x,y = ScrollableNode.getUnalignPos(self);
    local w,h = ScrollableNode.getSize(self);
	ScrollableNode.setClip(self,x,y,w,h);
    ScrollableNode.update(self);
end

---
-- Override @{core.drawing#DrawingBase.setAlign}.
-- 
-- @param self
-- @param #number align 相对于父drawing的对齐方式。详见： @{core.drawing#DrawingBase.setAlign}.
ScrollableNode.setAlign = function(self, align)
    Node.setAlign(self,align);
    local x,y = ScrollableNode.getUnalignPos(self);
    local w,h = ScrollableNode.getSize(self);
	ScrollableNode.setClip(self,x,y,w,h);
end

---
-- Override @{core.drawing#DrawingBase.setFillRegion}.
-- 
-- @param self
-- @param #boolean doFill 是否填充。详见： @{core.drawing#DrawingBase.setFillRegion}.
-- @param #number topLeftX 左边的边距。详见： @{core.drawing#DrawingBase.setFillRegion}.
-- @param #number topLeftY 上边的边距。详见： @{core.drawing#DrawingBase.setFillRegion}.
-- @param #number bottomRightX 右边的边距。详见： @{core.drawing#DrawingBase.setFillRegion}.
-- @param #number bottomRightY 下边的边距。详见： @{core.drawing#DrawingBase.setFillRegion}.
ScrollableNode.setFillRegion = function(self, doFill, topLeftX, topLeftY, bottomRightX, bottomRightY)
    Node.setFillRegion(self,doFill,topLeftX,topLeftY,bottomRightX,bottomRightY);
    local x,y = ScrollableNode.getUnalignPos(self);
    local w,h = ScrollableNode.getSize(self);
	ScrollableNode.setClip(self,x,y,w,h);
    ScrollableNode.update(self);
end

---
-- Override @{core.drawing#DrawingBase.setFillParent}.
-- 
-- @param self
-- @param doFillParentWidth 横向是否填充父节点(与父节点同样宽度)。详见： @{core.drawing#DrawingBase.setFillParent}.
-- @param doFillParentHeight 纵向是否填充父节点(与父节点同样高度)。详见： @{core.drawing#DrawingBase.setFillParent}.
ScrollableNode.setFillParent = function(self, doFillParentWidth, doFillParentHeight)
    Node.setFillParent(self,doFillParentWidth,doFillParentHeight);
    local x,y = ScrollableNode.getUnalignPos(self);
    local w,h = ScrollableNode.getSize(self);
	ScrollableNode.setClip(self,x,y,w,h);
    ScrollableNode.update(self);
end

---
-- 让子节点移动到容器控件顶部.
-- 
-- @param self
ScrollableNode.gotoTop = function(self)
    if self:hasScroller() then
        self.m_scroller:scrollToTop();
    end
end

---
-- 让子节点移动到容器控件底部.
-- 
-- @param self
ScrollableNode.gotoBottom = function(self)
    if self:hasScroller() then
        self.m_scroller:scrollToBottom();
    end
end

---
-- 析构函数.
-- 
ScrollableNode.dtor = function(self)
    ScrollableNode.releaseScroller(self);
end


---
-- Override @{core.drawing#DrawingBase.reviseSize}.
-- 
-- @param self
ScrollableNode.reviseSize = function(self)
    Node.reviseSize(self);
    local x,y = ScrollableNode.getUnalignPos(self);
    local w,h = ScrollableNode.getSize(self);
	ScrollableNode.setClip(self,x,y,w,h);
    ScrollableNode.update(self);
end

---
-- Override @{core.drawing#DrawingBase.revisePos}.
-- 
-- @param self
ScrollableNode.revisePos = function(self)
    Node.revisePos(self);
    local x,y = ScrollableNode.getUnalignPos(self);
    local w,h = ScrollableNode.getSize(self);
	ScrollableNode.setClip(self,x,y,w,h);
    ScrollableNode.update(self);
end

---------------------------------private functions-----------------------------------------

---
-- 返回是否正在使用@{#ui.scroller#Scroller}.
-- 
-- **注：该函数被标记为“private function”，不建议直接调用该函数。**
--
-- @param self
-- @return #boolean 若当前正在使用@{#ui.scroller#Scroller}，则返回true；否则，返回false。
ScrollableNode.hasScroller = function(self)
    return self.m_scroller ~= nil;
end

---
-- 创建新的@{#ui.scroller#Scroller}.
-- 
-- **注：该函数被标记为“private function”，不建议直接调用该函数。**
--
-- @param self
ScrollableNode.createScroller = function(self)
    local frameLength = self:getFrameLength();
    local viewLength = self:getViewLength();
    local unitLength = self:getUnitLength();

    self.m_scroller = new(Scroller,self.m_direction,frameLength,viewLength,unitLength);
    self.m_scroller:setScrollCallback(self,self.onScroll);
end

---
-- 释放当前正在使用的@{#ui.scroller#Scroller}.
-- 
-- **注：该函数被标记为“private function”，不建议直接调用该函数。**
--
-- @param self
ScrollableNode.releaseScroller = function(self)
    delete(self.m_scroller);
    self.m_scroller = nil;
end

---
-- 让当前正在使用的@{#ui.scroller#Scroller}停下来.
-- 
-- **注：该函数被标记为“private function”，不建议直接调用该函数。**
--
-- @param self
ScrollableNode.stopScroller = function(self)
    if ScrollableNode.hasScroller(self) then
        self.m_scroller:stop();
    end
end

---
-- 根据当前实际情况更新（创建/释放）@{#ui.scroller#Scroller}.
-- 
-- **注：该函数被标记为“private function”，不建议直接调用该函数。**
--
-- @param self
ScrollableNode.updateScroller = function(self)
    if not (self:needScroller()
        and ScrollableNode.isAllLengthVaild(self)
        and ScrollableNode.isViewBiggerThanFrame(self)) then

        ScrollableNode.releaseScroller(self);
        return
    end

    if ScrollableNode.hasScroller(self) then
        local frameLength = self:getFrameLength();
        local viewLength = self:getViewLength();
        local unitLength = self:getUnitLength();
        self.m_scroller:setFrameLength(frameLength);
        self.m_scroller:setViewLength(viewLength);
        self.m_scroller:setUnitLength(unitLength);
        self.m_scroller:stopMarginRebounding();
    else
        ScrollableNode.createScroller(self);
    end
end

---
-- 返回是否正在使用滚动条.
-- 
-- **注：该函数被标记为“private function”，不建议直接调用该函数。**
--
-- @param self
-- @return #boolean 若当前正在使用滚动条，则返回true；否则，返回false。
ScrollableNode.hasScrollBar = function(self)
    return self.m_scrollBar ~= nil;
end

---
-- 创建滚动条.
-- 
-- **注：该函数被标记为“private function”，不建议直接调用该函数。**
--
-- @param self
ScrollableNode.createScrollBar = function(self)
    local frameLength = self:getFrameLength();
    local viewLength = self:getViewLength();

    self.m_scrollBar = new(ScrollBar,self.m_direction,frameLength,viewLength);
    ScrollableNode.addChild(self,self.m_scrollBar);
    self.m_scrollBar:setStartPos(self:getFrameOffset());
    ScrollableNode.updateScrollBarPosAndSize(self);
    self.m_scrollBar:setLevel(1);
    self.m_scrollBar:setVisibleImmediately(false);
end

---
-- 释放滚动条.
-- 
-- **注：该函数被标记为“private function”，不建议直接调用该函数。**
--
-- @param self
ScrollableNode.releaseScrollBar = function(self)
    if ScrollableNode.hasScrollBar(self) then
        ScrollableNode.removeChild(self,self.m_scrollBar);
        delete(self.m_scrollBar);
        self.m_scrollBar = nil;
    end
end

---
-- 根据当前实际情况更新（创建/释放）滚动条.
-- 
-- **注：该函数被标记为“private function”，不建议直接调用该函数。**
--
-- @param self
ScrollableNode.updateScrollBar = function(self)
    if not (self:needScrollBar()
        and ScrollableNode.isAllLengthVaild(self)
        and ScrollableNode.isViewBiggerThanFrame(self)) then

        ScrollableNode.releaseScrollBar(self);
        return
    end

    if ScrollableNode.hasScrollBar(self) then
        self.m_scrollBar:setFrameLength(self:getFrameLength());
           self.m_scrollBar:setViewLength(self:getViewLength());
           self.m_scrollBar:setStartPos(self:getFrameOffset());
       else
           ScrollableNode.createScrollBar(self);
       end
end

---
-- 隐藏滚动条.
-- 
-- **注：该函数被标记为“private function”，不建议直接调用该函数。**
--
-- @param self
ScrollableNode.setScrollbarInvisible = function(self)
    if ScrollableNode.hasScrollBar(self) then
        self.m_scrollBar:setVisibleImmediately(false);
    end
end

---
-- 更新滚动条的位置和大小.
-- 
-- **注：该函数被标记为“private function”，不建议直接调用该函数。**
--
-- @param self
ScrollableNode.updateScrollBarPosAndSize = function(self)
    if not ScrollableNode.needScrollBar(self) then
        ScrollableNode.releaseScrollBar(self);
        return
    end

    if not ScrollableNode.hasScrollBar(self) then
        return
    end

    if self.m_direction == kVertical then
        self.m_scrollBar:setAlign(kAlignTopRight);
        self.m_scrollBar:setPos(0,0);
        self.m_scrollBar:setSize(self.m_scrollBarWidth,nil);
    else
        self.m_scrollBar:setAlign(kAlignBottomLeft);
        self.m_scrollBar:setPos(0,0);
        self.m_scrollBar:setSize(nil,self.m_scrollBarWidth);
    end
end

---
-- 判断 容器控件长度、子节点长度、单元长度 是否都是合法值.
-- 
-- **注：该函数被标记为“private function”，不建议直接调用该函数。**
--
-- @param self
-- @return #boolean 若都合法，则返回true；否则，返回false。
ScrollableNode.isAllLengthVaild = function(self)
    local frameLength = self:getFrameLength();
    local viewLength = self:getViewLength();
    local unitLength = self:getUnitLength();

    return frameLength and viewLength and unitLength and
        frameLength > 0 and viewLength > 0 and unitLength > 0;
end

---
-- 判断 子节点长度 是否大于 容器控件长度.
-- 
-- **注：该函数被标记为“private function”，不建议直接调用该函数。**
--
-- @param self
-- @return #boolean 若子节点长度 大于 容器控件长度，则返回true；否则，返回false。
ScrollableNode.isViewBiggerThanFrame = function(self)
    local frameLength = self:getFrameLength();
    local viewLength = self:getViewLength();
    return viewLength > frameLength;
end

---
-- 用于@{ui.scroller#Scroller.setScrollCallback}的回调函数.
-- 
-- **注：该函数被标记为“private function”，不建议直接调用该函数。**
--
-- @param self
-- @param #number scroll_status See @{ui.scroller#Scroller.setScrollCallback}.
-- @param #number diff See @{ui.scroller#Scroller.setScrollCallback}.
-- @param #number totalOffset See @{ui.scroller#Scroller.setScrollCallback}.
-- @param #boolean isMarginRebounding See @{ui.scroller#Scroller.setScrollCallback}.
ScrollableNode.onScroll = function(self, scroll_status, diff, totalOffset, isMarginRebounding)
    if ScrollableNode.hasScrollBar(self) and (not isMarginRebounding) then
        self.m_scrollBar:setScrollPos(totalOffset);
    end

    if kScrollerStatusStop == scroll_status then
        if ScrollableNode.hasScrollBar(self) then
            self.m_scrollBar:setVisible(false);
        end
    end

    --ugly , refactor later
    if isMarginRebounding then
        local align;
        if totalOffset >= 0 then
            if self.m_direction == kVertical then
                align = kAlignTop;
            else
                align = kAlignLeft;
            end
        else
            if self.m_direction == kVertical then
                align = kAlignBottom;
            else
                align = kAlignRight;
            end
        end
        if kScrollerStatusMoving == scroll_status and (not self.m_lastIsMarginRebouding) then
            if self.m_margrinReboudingCallback.func then
                self.m_margrinReboudingCallback.func(self.m_margrinReboudingCallback.obj,kScrollerStatusStart,align);
            end
        elseif kScrollerStatusStop == scroll_status then
            if self.m_margrinReboudingCallback.func then
                self.m_margrinReboudingCallback.func(self.m_margrinReboudingCallback.obj,kScrollerStatusStop,align);
            end
        end
    end
    self.m_lastIsMarginRebouding = isMarginRebounding;
end

end
        

package.preload[ "ui.scrollableNode" ] = function( ... )
    return require('ui/scrollableNode')
end
            

package.preload[ "ui/scrollBar" ] = function( ... )
-- scorllBar.lua
-- Author: Vicent.Gong
-- Date: 2012-09-26
-- Last modification : 2013-07-05
-- Description: Implemented scorll bar

--------------------------------------------------------------------------------
-- 滚动条的封装
-- @module ui.scrollBar
-- @return #nil 
-- @usage require("ui/scrollBar")

require("core/object");
require("core/global");
require("ui/image");

---
--  @{#ScrollBar}提供了一个滚动条的封装.
--  
--  @{#ScrollBar}假设使用它的是一个容器控件，该容器控件本身是一个节点（@{ui.node#Node}的对象），
-- 且拥有一个子节点（@{ui.node#Node}的对象），该子节点的子节点为该容器控件的子控件，
-- 这些子控件随着子节点的移动而移动。子节点的移动只能在上下或左右移动。
-- 
-- 关于该容器控件的模型设定，具体可以参考 @{ui.scroller#Scroller}，它们对容器控件模型有着一致的设定。 
--
-- 注意：
-- 
-- * 子节点在移动方向上的长度，必须大于容器控件的长度。
--
-- @type ScrollBar
-- @extends ui.image#Image 
ScrollBar = class(Image,false);

---
-- 默认的默认背景图片。
ScrollBar.s_defaultBgImage = "ui/scroll.png";

---
-- 默认的默认消失时间，单位：毫秒.
-- 
-- 也就是，滚动条自动淡出消失的时间。
-- 
ScrollBar.s_defaultInvisibleTime = 300;

---
-- 默认的默认滚动条最小长度。
-- 
ScrollBar.s_defaultSmallestLength = 8;

---
-- 默认背景图片。
-- 
-- @field [parent=#ScrollBar] #string s_bgImage

---
-- 设置默认背景图片。
-- 
-- @param #string filePath 默认背景图片。
-- 若 filePath 为 nil 或者 false，则@{#ScrollBar.s_bgImage}被设置成@{#ScrollBar.s_defaultBgImage}。
-- 否则，@{#ScrollBar.s_bgImage}被设置成 filePath 。
ScrollBar.setDefaultImage = function(filePath)
    ScrollBar.s_bgImage = filePath or ScrollBar.s_defaultBgImage;
end

---
-- 默认消失时间。
-- 
-- @field [parent=#ScrollBar] #number s_invisibleTime

---
-- 设置默认消失时间。
-- 
-- @param #number time 默认消失时间，单位：毫秒。
-- 若 time 为 nil 或者 false，则@{#ScrollBar.s_invisibleTime}被设置成@{#ScrollBar.s_defaultInvisibleTime}。
-- 否则，@{#ScrollBar.s_invisibleTime}被设置成 time 。
ScrollBar.setDefaultInvisibleTime = function(time)
    ScrollBar.s_invisibleTime = time or ScrollBar.s_defaultInvisibleTime;
end

---
-- 默认滚动条最小长度。
-- 
-- @field [parent=#ScrollBar] #number s_smallestLength

---
-- 设置默认滚动条最小长度。
-- 
-- @param #number smallestLength 滚动条最小长度。
-- 若 smallestLength 为 nil 或者 false，则@{#ScrollBar.s_smallestLength}被设置成@{#ScrollBar.s_defaultSmallestLength}。
-- 否则，@{#ScrollBar.s_smallestLength}被设置成 smallestLength 。
ScrollBar.setDefaultSmallestLength = function(smallestLength)
    ScrollBar.s_smallestLength = smallestLength or ScrollBar.s_defaultSmallestLength;
end

---
-- 构造函数.
-- 
-- @param self
-- @param #number direction 子节点移动方向。
-- 若为  [```kVertical```](core.constants.html#kVertical) ，则子节点为上下移动；若为 [```kHorizontal```](core.constants.html#kHorizontal) ，则为左右移动。若为 nil 或 false，则默认为 [```kVertcal```](core.constants.html#kVertcal)。
-- @param #number frameLength 容器控件的大小（由 direction 所决定的对应轴上的尺寸，视情况通常是宽度或高度）。
-- @param #number viewLength 子节点的大小（由 direction 所决定的对应轴上的尺寸，视情况通常是宽度或高度）。
ScrollBar.ctor = function(self, direction, frameLength, viewLength)
    local file = ScrollBar.s_bgImage or ScrollBar.s_defaultBgImage;
    if direction ~= kHorizontal then
        super(self,file,nil,nil,2,2,4,4);
    else
        super(self,file,nil,nil,4,4,2,2);
    end

    self.m_direction = direction or kVertical;
    self.m_frameLength = frameLength or 1;
    self.m_viewLength = viewLength or 1;

    self.m_normalLength = frameLength^2 / viewLength;
    self.m_scrollPos = 0;
    self.m_startPos = 0;

    self.m_invisibleTime = ScrollBar.s_invisibleTime or ScrollBar.s_defaultInvisibleTime;
    self.m_smallestLength = ScrollBar.s_smallestLength or ScrollBar.s_defaultSmallestLength;
end

---
-- 设置背景图片.
-- 
-- Override @{ui.image#Image.setFile}.
-- 
-- @param self
-- @param file 图片路径。详见： @{ui.image#Image.setFile}.
ScrollBar.setFile = function(self, file)
    Image.setFile(self,file
                    or ScrollBar.s_bgImage
                    or ScrollBar.s_defaultBgImage);
end

---
-- 设置 消失时间.
-- 
-- @param self
-- @param #number invisibleTime 消失时间。单位：毫秒。
-- 
-- 消失时间 会被设置成  invisibleTime, @{#ScrollBar.s_invisibleTime}, @{#ScrollBar.s_defaultInvisibleTime} 
-- 中第一个不为 nil 或 false 的。若均为 nil 或 false ，则被设置成  @{#ScrollBar.s_defaultInvisibleTime}。
ScrollBar.setInvisibleTime = function(self, invisibleTime)
    self.m_invisibleTime = invisibleTime
                        or ScrollBar.s_invisibleTime
                        or ScrollBar.s_defaultInvisibleTime;
end

---
-- 设置 滚动条最小长度.
-- 
-- @param self
-- @param #number smallestLength 滚动条最小长度。
-- 
-- 滚动条最小长度 会被设置成  smallestLength, @{#ScrollBar.s_smallestLength}, @{#ScrollBar.s_defaultSmallestLength} 
-- 中第一个不为 nil 或 false 的。若均为 nil 或 false ，则被设置成  @{#ScrollBar.s_defaultSmallestLength}。
ScrollBar.setSmallestLength = function(self, smallestLength)
    self.m_smallestLength = smallestLength
                        or ScrollBar.s_smallestLength
                        or ScrollBar.s_defaultSmallestLength;
end

---
-- 设置容器控件的大小.
-- 
-- **此接口在滚动中设置可能会使滚动条出现跳动。**
--
-- @param self 
-- @param #number frameLength 容器控件的大小。 
ScrollBar.setFrameLength = function(self, frameLength)
    self.m_frameLength = frameLength or self.m_frameLength;
    self.m_normalLength = self.m_frameLength^2 / self.m_viewLength;

    ScrollBar.forceUpdate(self);
    ScrollBar.setVisibleImmediately(self);
end

---
-- 设置子节点的大小.
-- 
-- **此接口在滚动中设置可能会使滚动条出现跳动。**
--
-- @param self 
-- @param #number viewLength 子节点的大小。 
ScrollBar.setViewLength = function(self, viewLength)
    self.m_viewLength = viewLength or self.m_viewLength;
    self.m_normalLength = self.m_frameLength^2 / self.m_viewLength;

    ScrollBar.forceUpdate(self);
    ScrollBar.setVisibleImmediately(self);
end

---
-- 设置滚动条的起始位置。
-- 
-- @param self
-- @param #number pos 滚动条的起始位置。若为 nil 或 false，则保持原来的起始位置。 
ScrollBar.setStartPos = function(self, pos)
    self.m_startPos = pos or self.m_startPos;
    ScrollBar.forceUpdate(self);
end

---
-- 设置滚动条的滚动位置。
-- 
-- @param self
-- @param #number scrollPos 滚动位置。 
ScrollBar.setScrollPos = function(self, scrollPos)
    self.m_scrollPos = scrollPos;

    scrollPos = -scrollPos;

    local posInFrame = scrollPos / self.m_viewLength * self.m_frameLength;
    local length = self.m_normalLength;

    if posInFrame < 0 then
        length = self.m_normalLength + posInFrame;
        length = length < self.m_smallestLength and self.m_smallestLength or length;
        posInFrame = 0;
    elseif posInFrame + self.m_normalLength > self.m_frameLength then
        length = self.m_frameLength - posInFrame;
        if length < self.m_smallestLength then
            posInFrame = self.m_frameLength - self.m_smallestLength;
            length = self.m_smallestLength;
        end
    end

    if self.m_direction == kVertical then
        ScrollBar.setPos(self,nil,self.m_startPos+posInFrame);
        ScrollBar.setSize(self,nil,length);
    else
        ScrollBar.setPos(self,self.m_startPos+posInFrame,nil);
        ScrollBar.setSize(self,length,nil);
    end

    ScrollBar.setVisible(self,true);
end

---
-- Override @{core.drawing#DrawingBase.setVisible}.
-- 
-- @param self
-- @param #boolean isVisible 若为 true，则在合适的时候会显示滚动条；否则，逐渐隐藏隐藏滚动条。
ScrollBar.setVisible = function(self, isVisible)
    isVisible = (self.m_frameLength < self.m_viewLength) and isVisible;
    ScrollBar.removFadeout(self);
    if isVisible then
        Image.setVisible(self,isVisible);
    else
        ScrollBar.addFadeout(self);
    end
end

---
-- 设置滚动条是否可见.
-- 
-- 这个函数和@{#ScrollBar.setVisible}基本一样，不同的是，这个函数是直接显示和隐藏，并没有动画。
-- 
-- @param self
-- @param #boolean isVisible 若为 true，则在合适的时候会显示；否则，隐藏滚动条。
ScrollBar.setVisibleImmediately = function(self, isVisible)
    isVisible = (self.m_frameLength < self.m_viewLength) and isVisible;
    ScrollBar.removFadeout(self);
    Image.setVisible(self,isVisible);
end

---
-- 析构函数.
ScrollBar.dtor = function(self)

end

---------------------------------private functions-----------------------------------------

---
-- 强制刷新滚动条.
-- 
-- **注：该函数被标记为“private function”，不建议直接调用该函数。**
--
-- @param self
ScrollBar.forceUpdate = function(self)
    ScrollBar.setScrollPos(self,self.m_scrollPos);
end

---
-- 为滚动条添加消失动画.
-- 
-- **注：该函数被标记为“private function”，不建议直接调用该函数。**
--
-- @param self
ScrollBar.addFadeout = function(self)
    ScrollBar.removFadeout(self);
    self.m_hasFadeout = true;
    ScrollBar.addPropTransparency(self,0,kAnimNormal,self.m_invisibleTime,-1,1,0);
end

---
-- 移除滚动条的消失动画.
-- 
-- **注：该函数被标记为“private function”，不建议直接调用该函数。**
--
-- @param self
ScrollBar.removFadeout = function(self)
    if self.m_hasFadeout then
        ScrollBar.removeProp(self,0);
        self.m_hasFadeout = false;
    end
end



end
        

package.preload[ "ui.scrollBar" ] = function( ... )
    return require('ui/scrollBar')
end
            

package.preload[ "ui/scroller" ] = function( ... )
-- scroller.lua
-- Author: Vicent.Gong
-- Date: 2012-09-24
-- Last modification : 2013-07-25
-- Description: Implemented a scorller

-- TODO “子节点”这个词用的不对。

--------------------------------------------------------------------------------
-- 这个模块提供了 @{ui.scroller#Scroller}，一套滚动逻辑。
--
-- @module ui.scroller
-- @return #nil 
-- @usage require("ui/scroller")


require("core/constants");
require("core/object");
require("core/global");
require("core/anim");

---
--  @{#Scroller} 类封装了一个常规滚动，将当前接受到的手指事件位置等信息传入此类的对象中，它会做出相应的回应.
-- 
--  @{#Scroller} 假设在一个容器控件（通常是一个@{ui.node#Node}对象）中，有一个只在上下（或左右）两个方向移动的子节点（@{ui.node#Node}对象），该子节点在所移动坐标轴上的长度大于容器控件在所移动坐标轴上的长度。
-- 把子节点的手指事件等信息传给 @{#Scroller}，由@{#Scroller}来控制子节点的上下（或左右）移动。
-- 在整个过程中，只考虑单个坐标轴的坐标。并且假设开始时子节点的坐标位置为0。
-- 
-- 子节点又可以分成多个在方向上长度相等的小单元，称为“单元”。每个单元有自己的长度。
-- 
-- 注意：
-- 
-- * 容器控件在其子节点接收到手指事件的时候，必须主动调用 @{#Scroller.onEventTouch}，由它来控制子节点的移动。
-- * 若使用@{#Scroller}控制子节点的移动，则不要手动改变子节点的位置。若要改变子节点的位置，可以使用@{#Scroller.setOffset}。
-- 
-- ---
--
-- ### 术语
-- 
-- * 滑动停止点
-- 
--      一个数字。默认0.3。
-- 
-- * 停止点
-- 
--      一个数字。
--      
--      定义：```停止点 = 滑动停止点 * 容器控件长度```。
--      
--      子节点的位置范围，若允许回弹，则为```[容器控件长度 - 子节点长度 - 停止点, 停止点]```。
--      若不允许回弹，则为```[容器控件长度 - 子节点长度, 0]```，这个范围也是子节点静止时的位置范围。
--      
-- * 滑动速度因子
-- 
--      一个数字。其值会对惯性滚动的速度产生影响。默认0.01。
--      
-- * 单元调整因子 
-- 
--      一个数字。默认为0.35。     
--      
-- * 对齐单元
-- 
--      一个数字。
--      
--      定义：```对齐单元 = 单元调整因子 * 单元长度```。
--     
-- * 对齐位置     
-- 
--      每一个“对齐位置”的坐标为 ```对齐单元 * i```(i为整数）。
-- 
--      每次惯性滚动后，都会停在某个“对齐位置”上。      
--
-- * 普通回弹
-- 
--      在手指抬起后，若子节点“拉扯”到容器控件的某边缘，则子节点会向边缘移动，直到回到容器控件的边缘。
--      
-- * 边缘回弹
-- 
--      同“普通回弹”类似。在手指抬起后，若子节点“拉扯”到“虚拟边缘”，则会移动到相应的“虚拟边缘”。
--
-- * 回弹
-- 
--      “普通回弹”和“边缘回弹”的统称。
-- 
-- * 虚拟边缘
-- 
--      用于“边缘回弹”的专用边缘。
-- 
-- ---
--
-- ### 结构示意图
-- 
-- 一个应用于竖直容器控件的@{#Scroller}，其基本模型如下图所示。
-- 
-- ![](http://engine.by.com:8080/hosting/data/1442895909533_6847638408763215740.png)
-- 
-- ---
--
-- @type Scroller
Scroller = class();

---
-- 默认的默认惯性滚动帧数。
-- 
Scroller.s_defaultFlippingFrames = 20;

---
-- 默认的默认滑动速度因子。
Scroller.s_defalutFlippingSpeedFactor = 0.01;

---
-- 默认的默认滑动停止点。
Scroller.s_defaultFlippingOverFactor = 0.3;

---
-- 默认的默认回弹帧数。
Scroller.s_defaultReboundFrames = 20;

---
-- 默认的默认单元调整因子。
Scroller.s_defaultUnitTurningFactor = 0.35;
 
---
-- 默认惯性滚动帧数。
--
-- @field [parent=#Scroller] #number s_flippingFrames 

---
-- 设置默认惯性滚动帧数.
-- 
-- 若 ```flippingFrames``` 为 nil 或 false，则@{#Scroller.s_flippingFrames}被设置成@{#Scroller.s_defaultFlippingFrames}。
-- 否则，@{#Scroller.s_flippingFrames}被设置成 ```flippingFrames``` 。
-- 
-- @param #number flippingFrames 惯性滚动帧数。
Scroller.setDefaultFlippingFrames = function(flippingFrames)
    Scroller.s_flippingFrames = flippingFrames or Scroller.s_defaultFlippingFrames;
end

---
-- 默认滑动速度因子.
--
-- @field [parent=#Scroller] #number s_flippingSpeedFactor 

---
-- 设置默认滑动速度因子.
-- 
-- 若 ```flippingSpeedFactor``` 为 nil 或 false，则@{#Scroller.s_flippingSpeedFactor}被设置成@{#Scroller.s_defalutFlippingSpeedFactor}。
-- 否则，@{#Scroller.s_flippingSpeedFactor}被设置成 ```flippingSpeedFactor``` 。
-- 
-- @param #number flippingSpeedFactor 滑动速度因子。
Scroller.setDefaultFlippingSpeedFactor = function(flippingSpeedFactor)
    Scroller.s_flippingSpeedFactor = flippingSpeedFactor or Scroller.s_defalutFlippingSpeedFactor;
end

---
-- 默认滑动停止点。
--
-- @field [parent=#Scroller] #number s_flippingOverFactor 

---
-- 设置默认滑动停止点.
-- 
-- 若 ```flippingOverFactor``` 为 nil 或 false，则@{#Scroller.s_flippingOverFactor}被设置成@{#Scroller.s_defaultFlippingOverFactor}。
-- 否则，@{#Scroller.s_flippingOverFactor}被设置成 ```flippingOverFactor``` 。
-- 
-- @param #number flippingOverFactor 滑动停止点。
Scroller.setDefaultFlippingOverFactor = function(flippingOverFactor)
    Scroller.s_flippingOverFactor = flippingOverFactor or Scorller.s_defaultFlippingOverFactor;
end

---
-- 默认回弹帧数。
--
-- @field [parent=#Scroller] #number s_reboundFrames 

---
-- 设置默认回弹帧数.
-- 
-- 若 ```reboundFrames``` 为 nil 或 false，则@{#Scroller.s_reboundFrames}被设置成@{#Scroller.s_defaultReboundFrames}。
-- 否则，@{#Scroller.s_reboundFrames}被设置成 ```reboundFrames``` 。
-- 
-- @param #number reboundFrames 回弹帧数。
Scroller.setDefaultReboundFrames = function(reboundFrames)
    Scroller.s_reboundFrames = reboundFrames or Scroller.s_defaultReboundFrames;
end




---
-- 默认单元调整因子。
--
-- @field [parent=#Scroller] #number s_unitTurningFactor 

---
-- 设置默认单元调整因子.
-- 
-- 若 ```unitTurningFactor``` 为 nil 或 false，则@{#Scroller.s_unitTurningFactor}被设置成@{#Scroller.s_defaultUnitTurningFactor}。
-- 否则，@{#Scroller.s_unitTurningFactor}被设置成 ```unitTurningFactor``` 。
-- 
-- @param #number unitTurningFactor 单元调整因子。
Scroller.setDefaultUnitTurningFactor = function(unitTurningFactor)
    Scroller.s_unitTurningFactor = unitTurningFactor or Scroller.s_defaultUnitTurningFactor;
end

---
-- 构造函数.
-- 
-- @param self
-- @param #number direction 子节点移动方向。
-- 若为  [```kVertical```](core.constants.html#kVertical) ，则子节点为上下移动；若为 [```kHorizontal```](core.constants.html#kHorizontal) ，则为左右移动。若为 nil 或 false，则默认为 [```kVertcal```](core.constants.html#kVertcal)。
-- @param #number frameLength 容器控件的大小（由 direction 所决定的对应轴上的尺寸，视情况通常是宽度或高度）。
-- @param #number viewLength 子节点的大小（由 direction 所决定的对应轴上的尺寸，视情况通常是宽度或高度）。
-- @param #number unitLength 单元长度。若为nil或false，则默认为1。
Scroller.ctor = function(self, direction, frameLength, viewLength, unitLength)
    self.m_direction = direction or kVertical;
    self.m_frameLength = frameLength or 1;
    self.m_viewLength = viewLength or 1;
    self.m_unitLength = unitLength or 1;

    self.m_flippingFrames = Scroller.s_flippingFrames or Scroller.s_defaultFlippingFrames;
    self.m_flippingSpeedFactor = Scroller.s_flippingSpeedFactor or Scroller.s_defalutFlippingSpeedFactor;
    self.m_flippingOverFactor = Scroller.s_flippingOverFactor or Scroller.s_defaultFlippingOverFactor;
    self.m_reboundFrames = Scroller.s_reboundFrames or Scroller.s_defaultReboundFrames;
    self.m_unitTurningFactor = Scroller.s_unitTurningFactor or Scroller.s_defaultUnitTurningFactor;

    self.m_reboundForwardMargin = 0;
    self.m_reboundBackwardMargin = 0;

    self.m_offset = 0;
    self.m_status = kScrollerStatusStop;

    self.m_eventCallback = {};
end

---
-- 设置惯性滚动帧数.
-- 
-- 惯性滚动帧数 被设置成 ```frames``` , @{#Scroller.s_flippingFrames}, @{#Scroller.s_defaultFlippingFrames}
-- 中第一个不为nil或者false的值。若均为nil或false，则设置成 @{#Scroller.s_defaultFlippingFrames}。
-- 
-- **请谨慎调用，建议只用于重新初始化。否则可能出现未定义行为。**
--
-- @param self
-- @param #number frames 惯性滚动帧数。
Scroller.setFlippingFrames = function(self, frames)
    self.m_flippingFrames = frames
                            or Scroller.s_flippingFrames
                            or Scroller.s_defaultFlippingFrames;
end

---
-- 设置滑动速度因子.
-- 
-- 滑动速度因子 被设置成 ```factor``` , @{#Scroller.s_flippingSpeedFactor}, @{#Scroller.s_defalutFlippingSpeedFactor}
-- 中第一个不为nil或者false的值。若均为nil或false，则设置成 @{#Scroller.s_defalutFlippingSpeedFactor}。
-- 
-- **请谨慎调用，建议只用于重新初始化。否则可能出现未定义行为。**
--
-- @param self
-- @param #number factor 滑动速度因子。
Scroller.setFlippingSpeedFactor = function(self, factor)
    self.m_flippingSpeedFactor = factor
                                or Scroller.s_flippingSpeedFactor
                                or Scroller.s_defalutFlippingSpeedFactor;
end

---
-- 设置滑动停止点.
-- 
-- 滑动停止点 被设置成 ```factor``` , @{#Scroller.s_flippingOverFactor}, @{#Scroller.s_defaultFlippingOverFactor}
-- 中第一个不为nil或者false的值。若均为nil或false，则设置成 @{#Scroller.s_defaultFlippingOverFactor}。
-- 
-- **请谨慎调用，建议只用于重新初始化。否则可能出现未定义行为。**
--
-- @param self
-- @param #number factor 滑动停止点。
Scroller.setFlippingOverFactor = function(self, factor)
    self.m_flippingOverFactor = factor
                                or Scroller.s_flippingOverFactor
                                or Scorller.s_defaultFlippingOverFactor;
end

---
-- 设置回弹帧数.
-- 
-- 滑动停止点 被设置成 ```frames``` , @{#Scroller.s_reboundFrames}, @{#Scroller.s_defaultReboundFrames}
-- 中第一个不为nil或者false的值。若均为nil或false，则设置成 @{#Scroller.s_defaultReboundFrames}。
-- 
-- **请谨慎调用，建议只用于重新初始化。否则可能出现未定义行为。**
--
-- @param self
-- @param #number frames 回弹帧数。
Scroller.setReboundFrames = function(self, frames)
    self.m_reboundFrames = frames
                        or Scroller.s_reboundFrames
                        or Scroller.s_defaultReboundFrames;
end

---
-- 设置单元调整因子.
-- 
-- 单元调整因子 被设置成 ```factor``` , @{#Scroller.s_unitTurningFactor}, @{#Scroller.s_defaultUnitTurningFactor}
-- 中第一个不为nil或者false的值。若均为nil或false，则设置成 @{#Scroller.s_defaultUnitTurningFactor}。
-- 
-- **请谨慎调用，建议只用于重新初始化。否则可能出现未定义行为。**
--
-- @param self
-- @param #number factor 单元调整因子。
Scroller.setUnitTurningFactor = function(self, factor)
    self.m_unitTurningFactor = factor
                            or Scroller.s_unitTurningFactor
                            or Scroller.s_defaultUnitTurningFactor;
end

---
-- 设置虚拟边缘坐标，用于边缘回弹.
--
-- 定义如下：
-- 
-- * ```上虚拟边缘 = 上边缘坐标（0） + 上虚拟边缘坐标差异```
-- * ```下虚拟边缘 = 下边缘坐标 - 下虚拟边缘坐标差异```
-- 
-- **请谨慎调用，建议只用于重新初始化。否则可能出现未定义行为。**
--
-- @param self
-- @param #number forwardMargin 下虚拟边缘坐标差异。
-- 若为正整数，则在“边缘回弹”后还能再“普通回弹”到下边缘。若为0，则只有“普通回弹”。若为负数 ，则无法“普通回弹”到下边缘。
-- @param #number backwardMargin 上虚拟边缘坐标差异。
-- 若为正整数，则在“边缘回弹”后还能再“普通回弹”到上边缘。若为0，则只有“普通回弹”。若为负数 ，则无法“普通回弹”到上边缘。
Scroller.setReboundMargin = function(self, forwardMargin, backwardMargin)
    self.m_reboundBackwardMargin = backwardMargin;
    self.m_reboundForwardMargin = forwardMargin;
end

---
-- 在“边缘回弹”结束后，调用这个函数来继续“普通回弹”到边缘。
Scroller.stopMarginRebounding = function(self)
    local reboundLength = Scroller.calcReboundLength(self,self.m_offset,true);
    if self:isReboundEnable() and reboundLength ~= 0 then
        Scroller.addRebound(self,reboundLength);
    end
end

---
-- 将子节点移动到 offset 所指定的坐标处，并调用相应的回调函数.
-- 
-- **请谨慎调用，建议只用于重新初始化。否则可能出现未定义行为。**
--
-- @param self 
-- @param #number offset 新的子节点坐标。
Scroller.setOffset = function(self, offset)
    local diff = offset - self.m_offset;
    self.m_offset = offset;

    Scroller.changeStatusAndCallBack(self,kScrollerStatusStart,diff);
    Scroller.changeStatusAndCallBack(self,kScrollerStatusStop,0);
end

---
-- 设置容器控件的大小.
-- 
-- **请谨慎调用，建议只用于重新初始化。否则可能出现未定义行为。**
--
-- @param self 
-- @param #number frameLength 容器控件的大小。 
Scroller.setFrameLength = function(self, frameLength)
    self.m_frameLength = frameLength;
end

---
-- 设置子节点的大小.
-- 
-- **请谨慎调用，建议只用于重新初始化。否则可能出现未定义行为。**
--
-- @param self 
-- @param #number viewLength 子节点的大小。 
Scroller.setViewLength = function(self, viewLength)
    self.m_viewLength = viewLength;
end

---
-- 设置单元长度.
-- 
-- **请谨慎调用，建议只用于重新初始化。否则可能出现未定义行为。**
--
-- @param self 
-- @param #number unitLength 单元长度。 
Scroller.setUnitLength = function(self, unitLength)
    self.m_unitLength = unitLength;
end

---
-- 设置滚动回调函数.
-- 
-- 通常，该回调函数用于实际控制子节点的移动。
-- 
-- 在回调的时候，会执行 ```func(obj, status, diff, offset, isMarginRebounding)```。
-- 
-- 其中：
-- 
-- * ```#number status``` 状态值，其取值可以是下面其中一个。
-- 
--      * [```kScrollerStatusStart```](core.constants.html#kScrollerStatusStart)
--      * [```kScrollerStatusMoving```](core.constants.html#kScrollerStatusMoving)
--      * [```kScrollerStatusStop```](core.constants.html#kScrollerStatusStop)
-- 
-- * ```#number diff``` 偏移量。
-- * ```#number offset``` 通过将子节点的坐标设置成```offset```来实现移动。
-- * ```#boolean isMarginRebounding``` 若为 true，则表明当前正在进行“边缘回弹”；否则，为false。
-- 
-- @param self  
-- @param obj 任意lua值。
-- @param #function func 回调函数。
Scroller.setScrollCallback = function(self, obj, func)
    self.m_eventCallback.func = func;
    self.m_eventCallback.obj = obj;
end

---
-- 停止滚动，并调用相应的回调函数。
-- 
Scroller.stop = function(self)
    local diff = 0;
    Scroller.removeFlipping(self);
    Scroller.removeRebound(self);

    if Scroller.isFlipping(self) then
        diff = self.m_flippingSpeed;
    elseif Scroller.isRebounding(self) then
        diff = self.m_reboundSpeed;
    else
        return
    end

    local newOffset = Scroller.clipOffsetToRegularOffsetRange(self,self.m_offset);
    newOffset = Scroller.clipOffsetToUnitEdge(self,newOffset,diff);
    diff = newOffset - self.m_offset;
    self.m_offset = newOffset;

    Scroller.changeStatusAndCallBack(self,kScrollerStatusStart,diff);
    Scroller.changeStatusAndCallBack(self,kScrollerStatusStop,0);
end

---
-- 滚动到顶部，并触发相应事件。
-- 
Scroller.scrollToTop = function(self)
    local min,max = self:getRegularOffsetRange();
    local diff = max-self.m_offset;
    self.m_offset = max;
    Scroller.changeStatusAndCallBack(self,kScrollerStatusStart,max-self.m_offset);
    Scroller.changeStatusAndCallBack(self,kScrollerStatusStop,0);
end

---
-- 滚动到底部，并触发相应事件。
-- 
Scroller.scrollToBottom = function(self)
    local min,max = self:getRegularOffsetRange();
    local diff = min-self.m_offset;
    self.m_offset = min;
    Scroller.changeStatusAndCallBack(self,kScrollerStatusStart,min-self.m_offset);
    Scroller.changeStatusAndCallBack(self,kScrollerStatusStop,0);
end

---
-- 析构函数.
-- 
Scroller.dtor = function(self)
    Scroller.stop(self);
end

---------------------------------private functions-----------------------------------------

---
-- 根据总位移量和总帧数计算移动初速度和加速度.
-- 
-- 注：该函数被标记为“private function”，不建议直接调用该函数。
-- 
-- @param self
-- @param #number offset 总位移量。
-- @param #number frames 总帧数。
-- @return #number,#number 第一个返回值是初速度，第二个返回值是加速度。 
Scroller.calcSpeedAndAcceleration = function(self, offset, frames)
    if frames < 1 then
        return -offset,0;
    else
        local acceleration = -2 * offset / (frames^2);
        local speed = -acceleration * frames;

        return speed,acceleration;
    end
end

---
-- 判断子节点位置是否超出范围.
-- 
-- 注：该函数被标记为“private function”，不建议直接调用该函数。
-- 
-- @param self
-- @param #number offset 子节点位置。
-- @param #number minOffset 范围下限。
-- @param #number maxOffset 范围上限。
-- @return #boolean 若超出范围，则返回 true；否则，返回false。
Scroller.isOffsetOverRange = function(self, offset, minOffset, maxOffset)
    if offset < minOffset then
        return true;
    elseif offset > maxOffset then
        return true;
    else
        return false;
    end
end

---
-- 将子节点位置限制在范围内.
-- 
-- 注：该函数被标记为“private function”，不建议直接调用该函数。
-- 
-- @param self
-- @param #number offset 子节点位置。
-- @param #number minOffset 范围下限。
-- @param #number maxOffset 范围上限。
-- @return #number 返回新的子节点位置，该位置必然在范围 [minOffset, maxOffset] 中。
Scroller.clipOffsetToRange = function(self, offset, minOffset, maxOffset)
    if offset > maxOffset then
        offset = maxOffset;
    elseif offset < minOffset then
        offset = minOffset;
    end

    return offset;
end

---
-- 获得静止状态下子节点的位置范围.
-- 
-- 注：该函数被标记为“private function”，不建议直接调用该函数。
--
-- @return #number,#number 第一个返回值是范围的下限，第二个返回值是上限。 
Scroller.getRegularOffsetRange = function(self)
    return math.min(self.m_frameLength - self.m_viewLength,0),0;
end

---
-- 返回“边缘回弹”后的子节点位置范围.
-- 
-- 注：该函数被标记为“private function”，不建议直接调用该函数。
--
-- @return #number,#number 第一个返回值是范围的下限，第二个返回值是上限。 
Scroller.getMarginOffsetRange = function(self)
    local regularOffsetMin,regularOffsetMax = self:getRegularOffsetRange();
    return regularOffsetMin - self.m_reboundForwardMargin, regularOffsetMax + self.m_reboundBackwardMargin;
end

---
-- 将子节点位置限值在静止时的允许范围内.
-- 
-- 注：该函数被标记为“private function”，不建议直接调用该函数。
--
-- @param self
-- @param #number offset 子节点位置。
-- @return #number 被限值在范围内的子节点位置。 
Scroller.clipOffsetToRegularOffsetRange = function(self, offset)
    local minOffset,maxOffset = Scroller.getRegularOffsetRange(self);
    return Scroller.clipOffsetToRange(self,offset,minOffset,maxOffset);
end

---
-- 将子节点位置限值在“边缘回弹”后的目标范围内.
-- 
-- 注：该函数被标记为“private function”，不建议直接调用该函数。
--
-- @param self
-- @param #number offset 子节点位置。
-- @return #number 被限值在范围内的子节点位置。 
Scroller.clipOffsetToMarginOffsetRange = function(self, offset)
    local minOffset,maxOffset = Scroller.getMarginOffsetRange(self);
    return Scroller.clipOffsetToRange(self,offset,minOffset,maxOffset);
end

---
-- 获得惯性滚动的“停止点”.
-- 
-- 注：该函数被标记为“private function”，不建议直接调用该函数。
--
-- @return #number 惯性滚动的“停止点”。 
Scroller.getFlippingExtraOffset = function(self)
    return self.m_frameLength*self.m_flippingOverFactor;
end

---
-- 获得惯性滚动时子节点位置的允许范围（用于允许回弹的情况）.
-- 
-- 注：该函数被标记为“private function”，不建议直接调用该函数。
-- 
-- @param self
-- @return #number,#number 第一个返回值是范围的下限，第二个是范围的上限。
Scroller.getFlippingOffsetRange = function(self)
    local regularMinOffset,regularMaxOffset = Scroller.getRegularOffsetRange(self);

    local flippingExtraOffset = Scroller.getFlippingExtraOffset(self);

    local flippingMinOffset = regularMinOffset - flippingExtraOffset;
    local flippingMaxOffset = regularMaxOffset + flippingExtraOffset;

    return flippingMinOffset,flippingMaxOffset;
end

---
-- 将惯性滚动时子节点位置限值在允许范围内（用于允许回弹的情况）.
-- 
-- 注：该函数被标记为“private function”，不建议直接调用该函数。
--
-- @param self
-- @param #number offset 子节点位置。
-- @return #number 被限制在范围内的子节点位置。 
Scroller.clipOffsetToFlippingOffsetRange = function(self, offset)
    local minOffset,maxOffset = Scroller.getFlippingOffsetRange(self);
    return Scroller.clipOffsetToRange(self,offset,minOffset,maxOffset);
end

---
-- 将移动后的子节点位置调整到附近的对齐位置.
-- 
-- 注：该函数被标记为“private function”，不建议直接调用该函数。
-- 
-- @param self
-- @param #number offset 子节点在移动前的位置。
-- @param #number diff 子节点要移动的偏移量。
-- @return #number 调整到的对齐位置。
Scroller.clipOffsetToUnitEdge = function(self, offset, diff)
    local offset = offset + diff;
    local remainder = math.abs(offset) % self.m_unitLength;

    local minUnitTurningOffset;
    if diff < 0 then
        minUnitTurningOffset = self.m_unitTurningFactor * self.m_unitLength;
    else
        minUnitTurningOffset = (1-self.m_unitTurningFactor) * self.m_unitLength;
    end

    local patch;
    if remainder >= minUnitTurningOffset then
        patch = remainder - self.m_unitLength ;
    else
        patch = remainder;
    end

    if offset > 0 then
        offset = offset - patch;
    else
        offset = offset + patch;
    end

    return offset;
end

---
-- 计算“回弹”或“惯性滚动”后的位置.
-- 
-- 注：该函数被标记为“private function”，不建议直接调用该函数。
--
-- @param self 
-- @param #number offset 当前子节点位置。
-- @param #number diff 子节点要进行的位移。
-- @return #number “回弹”或“惯性滚动”后的位置。
Scroller.calcOffset = function(self, offset, diff)
    offset = offset + diff;

    if not Scroller.isReboundEnable(self) then
        return Scroller.clipOffsetToRegularOffsetRange(self,offset);
    else
        return Scroller.clipOffsetToFlippingOffsetRange(self,offset);
    end
end

--Flip

---
-- 在可以进入“惯性滚动”状态的时候，调用此函数，判断是否可以进行惯性滚动.
-- 
-- 注：该函数被标记为“private function”，不建议直接调用该函数。
-- 
-- @return #boolean 若可以进行惯性滚动，则返回true；否则，返回false。
Scroller.isFlippingEnable = function(self)
    return self.m_flippingFrames >= 1;
end

---
-- 判断当前是否处于“惯性滚动”状态.
-- 
-- 注：该函数被标记为“private function”，不建议直接调用该函数。
-- 
-- @param self
-- @return #boolean 若当前处于“惯性滚动”状态，则返回true；否则，返回false。
Scroller.isFlipping = function(self)
    return self.m_flippingAnim ~= nil;
end




---
-- 判断惯性滚动时子节点位置是否超过允许范围（用于允许回弹的情况）.
-- 
-- 注：该函数被标记为“private function”，不建议直接调用该函数。
--
-- @param self
-- @param #number offset 子节点位置。
-- @return #boolean 若超过允许范围，则返回true；否则，返回false。
Scroller.isFlippingOver = function(self, offset)
    local flippingMinOffset,flippingMaxOffset = Scroller.getFlippingOffsetRange(self);
    return Scroller.isOffsetOverRange(self,offset,flippingMinOffset,flippingMaxOffset);
end

---
-- 计算惯性滚动的总位移.
-- 
-- 注：该函数被标记为“private function”，不建议直接调用该函数。
-- 
-- @param self
-- @param #number totalOffset 在开始惯性滚动前，手指的总位移。
-- @param #number timeDiff 从手指按下到放开所经历的总时间。
-- @return #number 惯性滚动的总位移量。
Scroller.calcFlippingLength = function(self, totalOffset, timeDiff)
    local speed = totalOffset / timeDiff * self.m_flippingSpeedFactor;
    local acceleration = -speed / self.m_flippingFrames;

    local timeSquare = self.m_flippingFrames * self.m_flippingFrames;

    local totalFlippingOffset = -acceleration * timeSquare /2;
    local afterFlippingOffset = totalFlippingOffset + self.m_offset;

    local clipingOffset = afterFlippingOffset;
    if not Scroller.isReboundEnable(self) then
        clipingOffset = Scroller.clipOffsetToRegularOffsetRange(self,afterFlippingOffset);
    elseif Scroller.isFlippingOver(self,afterFlippingOffset) then
        clipingOffset = Scroller.clipOffsetToFlippingOffsetRange(self,afterFlippingOffset);
    end

    if not Scroller.isFlippingOver(self,afterFlippingOffset) then
        clipingOffset = Scroller.clipOffsetToUnitEdge(self,self.m_offset,clipingOffset - self.m_offset);
    end

    if totalFlippingOffset * (clipingOffset - self.m_offset) > 0 then
        totalFlippingOffset = clipingOffset - self.m_offset;
    else
        totalFlippingOffset = 0;
    end

    return totalFlippingOffset;
end

---
-- 添加惯性滚动动画.
-- 
-- 注：该函数被标记为“private function”，不建议直接调用该函数。
-- 
-- @param self
-- @param #number flippingLength 惯性滚动的距离，正负代表滚动方向。
Scroller.addFlipping = function(self, flippingLength)
    self.m_afterFlippingOffset = self.m_offset + flippingLength;
    self.m_flippingSpeed,self.m_flippingAcceleration
        = Scroller.calcSpeedAndAcceleration(self,flippingLength,self.m_flippingFrames);

    self.m_flippingTimerCount = 0;
    self.m_flippingAnim = new(AnimDouble,kAnimRepeat,0.0,1.0,1);
    self.m_flippingAnim:setEvent(self,self.onFlippingTimer);
end

---
-- 移除惯性滚动动画.
-- 
-- 注：该函数被标记为“private function”，不建议直接调用该函数。
-- 
Scroller.removeFlipping = function(self)
    delete(self.m_flippingAnim);
    self.m_flippingAnim = nil;
    self.m_flippingTimerCount = 0;
end

---
-- 惯性滚动动画过程中，用于@{core.anim#AnimBase.setEvent}的回调函数.
-- 
-- 注：该函数被标记为“private function”，不建议直接调用该函数。
-- 
-- @param self
-- @param anim_type See @{core.anim#AnimBase.setEvent}.
-- @param anim_id See @{core.anim#AnimBase.setEvent}.
-- @param repeat_or_loop_num See @{core.anim#AnimBase.setEvent}.
Scroller.onFlippingTimer = function(self, anim_type, anim_id, repeat_or_loop_num)
    self.m_flippingTimerCount = self.m_flippingTimerCount + 1;
    local lastOffset = self.m_offset;
    self.m_offset = self.m_offset + self.m_flippingSpeed;
    local speed = self.m_flippingSpeed + self.m_flippingAcceleration;

    if speed * self.m_flippingSpeed <= 0
        or self.m_flippingTimerCount >= self.m_flippingFrames then

        self.m_offset = self.m_afterFlippingOffset;

        local reboundLength = Scroller.calcReboundLength(self,self.m_offset - lastOffset);
        if reboundLength ~= 0 then
            Scroller.addRebound(self,reboundLength);
            Scroller.changeStatusAndCallBack(self,kScrollerStatusMoving,self.m_offset - lastOffset);
        else
            Scroller.changeStatusAndCallBack(self,kScrollerStatusStop,self.m_offset - lastOffset);
        end

        Scroller.removeFlipping(self);
    else
        Scroller.changeStatusAndCallBack(self,kScrollerStatusMoving,self.m_flippingSpeed);
        self.m_flippingSpeed = speed;
    end
end

--Rebound

---
-- 返回当前是否正在回弹.
-- 
-- 注：该函数被标记为“private function”，不建议直接调用该函数。
-- 
-- @return #boolean 若当前正在回弹，则返回true；否则，返回false。
Scroller.isRebounding = function(self)
    return self.m_reboundAnim ~= nil;
end

---
-- 返回是否启用回弹.
-- 
-- 注：该函数被标记为“private function”，不建议直接调用该函数。
-- 
-- @param self
-- @return #boolean 若启用回弹，则返回true；否则，返回false。
Scroller.isReboundEnable = function(self)
    return self.m_reboundFrames >= 1;
end

---
-- 判断子节点位置是否在静止允许范围内.
-- 
-- 注：该函数被标记为“private function”，不建议直接调用该函数。
--
-- @param self
-- @param #number offset 子节点位置。
-- @return #boolean 若超过允许范围，则返回true；否则，返回false。
Scroller.isBoundOver = function(self, offset)
    local minOffset,maxOffset = Scroller.getRegularOffsetRange(self);
    return Scroller.isOffsetOverRange(self,offset,minOffset,maxOffset);
end

---
-- 根据子节点位置，计算回弹的位移.
-- 
-- 注：该函数被标记为“private function”，不建议直接调用该函数。
--
-- @param self
-- @param #number offset 子节点位置。
-- @param #boolean ignoreMarginRebounding 是否忽略“边缘回弹”。
-- 若为true，即便判断该进行“边缘回弹”，也当成是“普通回弹”进行处理。
-- 若为false或nil，则根据具体情况决定回弹类型。
-- @return #number “普通回弹”或“边缘回弹”的位移。是该“普通回弹”，还是该“边缘回弹”，由本函数根据offset来决定。
Scroller.getBoundOverLength = function(self, offset, ignoreMarginRebounding)
    local newOffset = Scroller.clipOffsetToRegularOffsetRange(self,offset);
    local regularReboundLength = newOffset - offset;

    newOffset = Scroller.clipOffsetToMarginOffsetRange(self,offset);
    local marginReboundLength = newOffset - offset;

    if marginReboundLength * regularReboundLength > 0 and (not ignoreMarginRebounding) then
        self.m_isMarginRebounding = true;
        return marginReboundLength;
    else
        self.m_isMarginRebounding = false;
        return regularReboundLength;
    end
end

---
-- 计算回弹的总位移.
-- 
-- 注：该函数被标记为“private function”，不建议直接调用该函数。
--
-- @param self
-- @param #number diff 回弹前的手指事件结束和开始的位移差。
-- @param #boolean ignoreMarginRebounding 是否禁止“边缘回弹”。若不提供，则根据当前子节点坐标决定是否进行“边缘回弹”。
-- @return #number
-- 若允许回弹，则为回弹的总位移。
-- 否则，则为到附近“对齐位置”的总位移。
Scroller.calcReboundLength = function(self, diff, ignoreMarginRebounding)
    local reboundLength = 0;
    if Scroller.isReboundEnable(self) and Scroller.isBoundOver(self,self.m_offset) then
        reboundLength = Scroller.getBoundOverLength(self,self.m_offset,ignoreMarginRebounding);
    else
        local newOffset = Scroller.clipOffsetToUnitEdge(self,self.m_offset - diff,diff);
        reboundLength = newOffset - self.m_offset;
    end

    return reboundLength;
end

---
-- 开始回弹动画.
-- 
-- 注：该函数被标记为“private function”，不建议直接调用该函数。
--
-- @param self
-- @param #number reboundLength 回弹总位移。
Scroller.addRebound = function(self, reboundLength)
    Scroller.removeRebound(self);

    self.m_afterReboundingOffset = self.m_offset + reboundLength;
    self.m_reboundSpeed,self.m_reboundAcceleration =
        Scroller.calcSpeedAndAcceleration(self,reboundLength,self.m_reboundFrames);

    self.m_reboundTimerCount = 0;
    self.m_reboundAnim = new(AnimDouble,kAnimRepeat,0.0,1.0,1);
    self.m_reboundAnim:setEvent(self,self.onReboundTimer);
end

---
-- 结束回弹动画。
-- 
-- 注：该函数被标记为“private function”，不建议直接调用该函数。
-- 
Scroller.removeRebound = function(self)
     delete(self.m_reboundAnim);
     self.m_reboundAnim = nil;
     self.m_reboundTimerCount = 0;
end

---
-- 回弹动画过程中，用于@{core.anim#AnimBase.setEvent}的回调函数.
-- 
-- 注：该函数被标记为“private function”，不建议直接调用该函数。
-- 
-- @param self
-- @param anim_type See @{core.anim#AnimBase.setEvent}.
-- @param anim_id See @{core.anim#AnimBase.setEvent}.
-- @param repeat_or_loop_num See @{core.anim#AnimBase.setEvent}.
Scroller.onReboundTimer = function(self, anim_type, anim_id, repeat_or_loop_num)
    self.m_reboundTimerCount = self.m_reboundTimerCount + 1;

    local lastOffset = self.m_offset;
    self.m_offset = self.m_offset + self.m_reboundSpeed;

    local reboundEnd = false;
    local speed = self.m_reboundSpeed + self.m_reboundAcceleration;

    if self.m_reboundTimerCount >= self.m_reboundFrames
        or speed*self.m_reboundSpeed <= 0
        or (self.m_offset - self.m_afterReboundingOffset) * (lastOffset - self.m_afterReboundingOffset) <= 0 then

        self.m_offset = self.m_afterReboundingOffset;
        reboundEnd = true;
    else
        self.m_reboundSpeed = speed;
    end

    if reboundEnd then
        Scroller.removeRebound(self);
        Scroller.changeStatusAndCallBack(self,kScrollerStatusStop,self.m_offset - lastOffset);
    else
        Scroller.changeStatusAndCallBack(self,kScrollerStatusMoving,self.m_offset - lastOffset);
    end
end

---
-- 容器控件接收到手指事件（通过@{core.drawing#DrawingBase.setEventTouch}或
-- @{core.drawing#DrawingBase.setEventDrag}设置的回调函数）的时候，调用此函数，
-- 传入接收到的函数，由该函数来控制子节点的移动.
-- 
-- 注：该函数被标记为“private function”，不建议直接调用该函数。
-- 
-- @param self
-- @param #number finger_action See @{core.drawing#DrawingBase.setEventTouch}.
-- @param #number x See @{core.drawing#DrawingBase.setEventTouch}.
-- @param #number y See @{core.drawing#DrawingBase.setEventTouch}.
-- @param #number drawing_id_first See @{core.drawing#DrawingBase.setEventTouch}.
-- @param #number drawing_id_current See @{core.drawing#DrawingBase.setEventTouch}.
Scroller.onEventTouch = function(self, finger_action, x, y, drawing_id_first, drawing_id_current)
    local curPos = (self.m_direction == kVertical) and y or x;

    if kFingerDown == finger_action then
        Scroller.stop(self);

        self.m_startTime = os.clock();
        self.m_lastPos = curPos;
        self.m_startPos = curPos;
        self.m_lastDiff = 0;

        self.m_touching = true;
        self.m_isMarginRebounding = false;
    elseif self.m_touching then

        local diff = curPos - self.m_lastPos;
        self.m_lastPos = curPos;

        local offset = Scroller.calcOffset(self,self.m_offset,diff);
        diff = offset - self.m_offset;
        self.m_offset = offset;

        if self.m_status == kScrollerStatusStop then
            Scroller.changeStatusAndCallBack(self,kScrollerStatusStart,diff);
        else
            Scroller.changeStatusAndCallBack(self,kScrollerStatusMoving,diff);
        end

        if kFingerMove ~= finger_action then
            self.m_touching = false;

            local timeDiff = os.clock() - self.m_startTime;

            --Not need flipping
            if not Scroller.isFlippingEnable(self) --set not to flip
                or Scroller.isFlippingOver(self,offset)
                or timeDiff <=  0.001 -- time is too short
                or math.abs(self.m_lastDiff) <= 8 -- scroll region is too short
                or self.m_lastDiff * diff < 0
                or (curPos-self.m_startPos)*diff < 0 then -- change direction in scrolling

                local reboundLength = Scroller.calcReboundLength(self,curPos-self.m_startPos);
                if reboundLength ~= 0 then
                    if self:isReboundEnable() then
                        Scroller.addRebound(self,reboundLength);
                    else
                        Scroller.changeStatusAndCallBack(self,kScrollerStatusStop,reboundLength);
                    end
                else
                    Scroller.changeStatusAndCallBack(self,kScrollerStatusStop,0);
                end
            else
                --flipping
                local offset = curPos - self.m_startPos;
                local flippingLength = Scroller.calcFlippingLength(self,offset,timeDiff);
                local reboundLength = Scroller.calcReboundLength(self,curPos-self.m_startPos);
                if math.abs(flippingLength) > 1 and math.abs(reboundLength) < 1 then
                    Scroller.addFlipping(self,flippingLength);
                else
                    if reboundLength ~= 0 then
                        if self:isReboundEnable() then
                            Scroller.addRebound(self,reboundLength);
                        else
                            Scroller.changeStatusAndCallBack(self,kScrollerStatusStop,reboundLength);
                        end
                    else
                        Scroller.changeStatusAndCallBack(self,kScrollerStatusStop,0);
                    end
                end
            end
        end

        self.m_lastDiff = diff;
    end
end

---
-- 修改scroller内部状态并调用回调函数。
-- 
-- 注：该函数被标记为“private function”，不建议直接调用该函数。
-- 
-- @param self
-- @param #number status 新的状态值。
-- @param #number diff 变化量。
Scroller.changeStatusAndCallBack = function(self, status, diff)
    self.m_status = status;
    if self.m_eventCallback.func then
        self.m_eventCallback.func(self.m_eventCallback.obj,self.m_status,diff,self.m_offset,self.m_isMarginRebounding);
    end
end

end
        

package.preload[ "ui.scroller" ] = function( ... )
    return require('ui/scroller')
end
            

package.preload[ "ui/scrollView" ] = function( ... )
-- scrollView.lua
-- Author: Vicent.Gong
-- Date: 2012-10-08
-- Last modification : 2013-07-05
-- Description: Implemented ScrollView

--------------------------------------------------------------------------------
-- 滚动控件.
-- 此控件相对灵活，可以自行安排容器内控件的位置.
-- @module ui.scrollView
-- @return #nil 
-- @usage
-- require("ui/scrollView")
-- require("ui/image")
-- local list = new(ScrollView, 50, 50, 220, 400, false)
-- for i=1,10 do
--     local img = new(Image,"ddz.png")
--     img:setSize(100,130)
--     img:setPos(math.mod(i,2)==0 and 110 or 0, math.floor((i-1)/2)*140)
--     list:addChild(img)
-- end
-- list:addToRoot()



require("core/constants");
require("core/object");
require("core/global");
require("ui/scrollableNode");

---
-- @{#ScrollView}提供一个带滚动效果的空白容器控件，可以往该控件中添加任意内容。
--
-- @type ScrollView
-- @extends ui.scrollableNode#ScrollableNode 
ScrollView = class(ScrollableNode,false);

---
-- 默认的默认滚动条宽度。
-- 
ScrollView.s_defaultScrollBarWidth = 8;

---
-- 默认的滚动条宽度.
-- 
-- @field [parent=#ScrollView] #number s_scrollBarWidth

---
-- 设置默认的滚动条宽度.
-- 
-- 若 width 为nil或者false，则 @{#ScrollView.s_scrollBarWidth} 被设置成
-- @{#ScrollView.s_defaultScrollBarWidth}。否则，@{#ScrollView.s_scrollBarWidth}
-- 被设置成 width 。
-- 
-- @param #number width 默认滚动条宽度。
ScrollView.setDefaultScrollBarWidth = function(width)
    ScrollView.s_scrollBarWidth = width or ScrollView.s_defaultScrollBarWidth;
end

---
-- 构造函数.
-- 
-- @param self
-- @param #number x 控件相对于父节点的位置X坐标。详见：<a href="core.drawing.html#006">**引擎的子节点与父节点九种对齐方式和其相对位置**</a>
-- @param #number y 控件相对于父节点的位置Y坐标。详见：<a href="core.drawing.html#006">**引擎的子节点与父节点九种对齐方式和其相对位置**</a>
-- @param #number w 控件宽度。
-- @param #number h 控件高度。
-- @param #boolean autoPositionChildren 若为true，则每当调用@{#ScrollView.addChild}的时候，会自动安排child的位置。
ScrollView.ctor = function(self, x, y, w, h, autoPositionChildren)
    super(self,kVertical,ScrollView.s_scrollBarWidth or ScrollView.s_defaultScrollBarWidth);

    ScrollableNode.setPos(self,x,y);
    ScrollableNode.setSize(self,w or 1,h or 1);
    local x,y = ScrollView.getUnalignPos(self);
    local w,h = ScrollView.getSize(self);
	ScrollView.setClip(self,x,y,w,h);

    ScrollView.setEventTouch(self,self,self.onEventTouch);
    ScrollView.setEventDrag(self,self,self.onEventDrag);

    self.m_autoPositionChildren = autoPositionChildren;

    self.m_mainNode = new(Node);
    self.m_mainNode:setSize(ScrollView.getSize(self));
    ScrollableNode.addChild(self,self.m_mainNode);
    self.m_nodeW = 0;
    self.m_nodeH = 0;

    ScrollView.update(self);
end

---
-- 设置滚动条的宽度.
-- 
-- Override @{ui.scrollableNode#ScrollableNode.setScrollBarWidth}.
-- 
-- @param self
-- @param #number width 滚动条宽度。
-- 
-- 滚动条宽度 会被设置成 width, @{#ScrollView.s_scrollBarWidth},
-- @{#ScrollView.s_defaultScrollBarWidth} 中第一个不为 nil 或 false 的值。
-- 若都为 nil 或 false ， 则 滚动条宽度 会被设置成 @{#ScrollView.s_defaultScrollBarWidth}。
-- 
ScrollView.setScrollBarWidth = function(self, width)
    width = width
        or ScrollView.s_scrollBarWidth
        or ScrollView.s_defaultScrollBarWidth;

    ScrollableNode.setScrollBarWidth(self,width);
end

---
-- Override @{ui.scrollableNode#ScrollableNode.setDirection}.
-- 
-- @param self
-- @param direction 子节点移动方向。详见： @{ui.scrollableNode#ScrollableNode.setDirection}.
ScrollView.setDirection = function(self, direction)
    if (not direction) or self.m_direction == direction then
        return
    end

    ScrollableNode.setDirection(self,direction);
end

---
-- Override @{ui.scrollableNode#ScrollableNode.setSize}.
-- 
-- @param self
-- @param #number w 宽度。详见： @{ui.scrollableNode#ScrollableNode.setSize}.
-- @param #number h 高度。详见： @{ui.scrollableNode#ScrollableNode.setSize}.
ScrollView.setSize = function(self, w, h)
    ScrollableNode.setSize(self,w,h);
    self.m_mainNode:setSize(ScrollView.getSize(self));
end

---
-- Override @{core.drawing#DrawingBase.getChildByName}.
-- 
-- @param self
-- @param name 节点的名字。详见： @{core.drawing#DrawingBase.getChildByName}.
ScrollView.getChildByName = function(self, name)
    return self.m_mainNode:getChildByName(name);
end

---
-- Override @{core.drawing#DrawingBase.getChildren}.
-- 
-- @param self
ScrollView.getChildren = function(self)
    return self.m_mainNode:getChildren();
end

---
-- Override @{core.drawing#DrawingBase.addChild}.
-- 
-- @param self
-- @param child 子节点对象。详见： @{core.drawing#DrawingBase.addChild}.
ScrollView.addChild = function(self, child)
    self.m_mainNode:addChild(child);

    if self.m_autoPositionChildren then
        child:setAlign(kAlignTopLeft);
        child:setPos(self.m_nodeW,self.m_nodeH);
        local w,h = child:getSize();
        if self.m_direction == kVertical then
            self.m_nodeH = self.m_nodeH + h;
        else
            self.m_nodeW = self.m_nodeW + w;
        end
    else
        local x,y = child:getUnalignPos();
        local w,h = child:getSize();

        if self.m_direction == kVertical then
            self.m_nodeH = (self.m_nodeH > y + h) and self.m_nodeH or (y + h);
        else
            self.m_nodeW = (self.m_nodeW > x + w) and self.m_nodeW or (x + w);
        end
    end

    ScrollView.update(self);
end

---
-- Override @{core.drawing#DrawingBase.removeChild}.
-- 
-- @param self
-- @param child 需要被移除的子节点。详见： @{core.drawing#DrawingBase.removeChild}.
-- @param doCleanup 是否需要对该child执行资源清除操作。详见： @{core.drawing#DrawingBase.removeChild}.
ScrollView.removeChild = function(self, child, doCleanup)
    if self.m_autoPositionChildren then
        local w,h = child:getSize();
        if self.m_direction == kVertical then
            self.m_nodeH = self.m_nodeH - h;
        else
            self.m_nodeW = self.m_nodeW - w;
        end
    end
    return self.m_mainNode:removeChild(child,doCleanup);
end

---
-- Override @{core.drawing#DrawingBase.removeAllChildren}.
-- 
-- @param self
-- @param doCleanup 是否对所有子节点执行delete()操作。详见： @{core.drawing#DrawingBase.removeAllChildren}.
ScrollView.removeAllChildren = function(self, doCleanup)
    if self.m_autoPositionChildren then
        self.m_nodeW = 0;
        self.m_nodeH = 0;
    end
    return self.m_mainNode:removeAllChildren(doCleanup);
end

---
-- 析构函数.
ScrollView.dtor = function(self)

end

---------------------------------private functions-----------------------------------------

---
-- Override @{ui.scrollableNode#ScrollableNode.getFrameLength}.
-- 
-- **注：该函数被标记为“private function”，不建议直接调用该函数。**
--
-- @param self
-- @return #number 容器控件的长度。详见： @{ui.scrollableNode#ScrollableNode.getFrameLength}.
ScrollView.getFrameLength = function(self)
    local w,h = ScrollView.getSize(self);
    if self.m_direction == kVertical then
        return h;
    else
        return w;
    end
end

---
-- Override @{ui.scrollableNode#ScrollableNode.getViewLength}.
-- 
-- **注：该函数被标记为“private function”，不建议直接调用该函数。**
--
-- @param self
-- @return #number 子节点的长度。详见： @{ui.scrollableNode#ScrollableNode.getViewLength}.
ScrollView.getViewLength = function(self)
    if self.m_direction == kVertical then
        return self.m_nodeH;
    else
        return self.m_nodeW;
    end
end

---
-- Override @{ui.scrollableNode#ScrollableNode.getUnitLength}.
-- 
-- **注：该函数被标记为“private function”，不建议直接调用该函数。**
--
-- @param self
-- @return #number 单元的长度。详见： @{ui.scrollableNode#ScrollableNode.getUnitLength}.
ScrollView.getUnitLength = function(self)
    return 1;
end

---
-- Override @{ui.scrollableNode#ScrollableNode.needScroller}.
-- 
-- **注：该函数被标记为“private function”，不建议直接调用该函数。**
--
-- @param self
-- @return #boolean 是否需要通过 @{#ui.scroller#Scroller}来控制子节点的行为。详见： @{ui.scrollableNode#ScrollableNode.needScroller}.
ScrollView.needScroller = function(self)
    return true;
end

---
-- Override @{ui.scrollableNode#ScrollableNode.getFrameOffset}.
-- 
-- **注：该函数被标记为“private function”，不建议直接调用该函数。**
--
-- @param self
-- @return 滚动条的起始位置。详见： @{ui.scrollableNode#ScrollableNode.getFrameOffset}.
ScrollView.getFrameOffset = function(self)
    return 0;
end

---
-- Override @{core.drawing#DrawingBase.onEventTouch}.
-- 
-- 然而该函数什么都不做。
-- 
-- **注：该函数被标记为“private function”，不建议直接调用该函数。**
--
-- @param self
-- @param finger_action 手指事件。详见： @{core.drawing#DrawingBase.onEventTouch}.
-- @param x 是手指触摸时的全局横坐标。详见： @{core.drawing#DrawingBase.onEventTouch}.
-- @param y 是手指触摸时的全局纵坐标。详见： @{core.drawing#DrawingBase.onEventTouch}.
-- @param drawing_id_first 是[```kFingerDown```](core.constants.html#kFingerDown)时拾取到的drawing可绘制对象的id。详见： @{core.drawing#DrawingBase.onEventTouch}.
-- @param drawing_id_current 是引擎根据当前坐标拾取到的drawing可绘制对象的id。详见： @{core.drawing#DrawingBase.onEventTouch}.
-- @param #number event_time 当前事件的触发时间(单位：毫秒)。
ScrollView.onEventTouch =  function(self, finger_action, x, y, drawing_id_first, drawing_id_current,event_time)

end

---
-- Override @{core.drawing#DrawingBase.onEventDrag}.
-- 
-- **注：该函数被标记为“private function”，不建议直接调用该函数。**
--
-- @param self
-- @param finger_action 手指事件。详见： @{core.drawing#DrawingBase.onEventDrag}.
-- @param x 是手指触摸时的全局横坐标。详见： @{core.drawing#DrawingBase.onEventDrag}.
-- @param y See @{core.drawing#DrawingBase.onEventDrag}.
-- @param drawing_id_first 是[```kFingerDown```](core.constants.html#kFingerDown)时拾取到的drawing可绘制对象的id。详见： @{core.drawing#DrawingBase.onEventDrag}.
-- @param drawing_id_current 是引擎根据当前坐标拾取到的drawing可绘制对象的id。详见： @{core.drawing#DrawingBase.onEventDrag}.
-- @param #number event_time 当前事件的触发时间(单位：毫秒)。
ScrollView.onEventDrag =  function(self, finger_action, x, y,drawing_id_first, drawing_id_current,event_time)
    if not ScrollView.hasScroller(self) then return end

    self.m_scroller:onEventTouch(finger_action,x,y,drawing_id_first,drawing_id_current,event_time);
end

---
-- Override @{ui.scrollableNode#ScrollableNode.onScroll}.
-- 
-- **注：该函数被标记为“private function”，不建议直接调用该函数。**
--
-- @param self
-- @param scroll_status See @{ui.scrollableNode#ScrollableNode.onScroll}.
-- @param diffY See @{ui.scrollableNode#ScrollableNode.onScroll}.
-- @param totalOffset See @{ui.scrollableNode#ScrollableNode.onScroll}.
-- @param isMarginRebounding See @{ui.scrollableNode#ScrollableNode.onScroll}.
ScrollView.onScroll = function(self, scroll_status, diffY, totalOffset,isMarginRebounding)
    ScrollableNode.onScroll(self,scroll_status,diffY,totalOffset,isMarginRebounding);

    if self.m_direction == kVertical then
        self.m_mainNode:setPos(nil,totalOffset);
    else
        self.m_mainNode:setPos(totalOffset,nil);
    end
end

end
        

package.preload[ "ui.scrollView" ] = function( ... )
    return require('ui/scrollView')
end
            

package.preload[ "ui/slider" ] = function( ... )
-- slider.lua
-- Author: Vicent.Gong
-- Date: 2012-09-24
-- Last modification : 2012-06-25
-- Description: Implemented slider

--------------------------------------------------------------------------------
-- 一个slider控件(可手动调节的进度条).
-- @module ui.slider
-- @return #nil 
-- @usage require("ui/slider")



require("core/constants");
require("core/object");
require("ui/node");
require("ui/image");

---
-- 一个slider控件.
-- 
-- 控件通过一个调节钮，来调整进度。通常，可以用于调节音量等场合。
-- 当前音量大小可以用“当前值”来表示，“当前值”决定了按钮的位置。
-- 在控件创建后，“当前值”为0。
--
-- @type Slider
-- @extends ui.node#Node
Slider = class(Node);

---
-- 默认的默认背景图片的路径。
Slider.s_defaultBgImage = "ui/sliderBg.png";

---
-- 默认的默认前景图片的路径。
Slider.s_defaultFgImage = "ui/sliderFg.png";

---
-- 默认的默认按钮图片的路径。
Slider.s_defaultButtonImage = "ui/sliderBtn.png";

---
-- 
-- 默认背景图片的路径。在调用 @{#Slider.setDefaultImages}以前，该值为nil。
-- 
-- @field [parent=#Slider] #string s_bgImage 

---
-- 
-- 默认前景图片的路径。在调用 @{#Slider.setDefaultImages}以前，该值为nil。
-- 
-- @field [parent=#Slider] #string s_fgImage 

---
-- 
-- 默认按钮图片的路径。在调用 @{#Slider.setDefaultImages}以前，该值为nil。
-- 
-- @field [parent=#Slider] #string s_buttonImage 

---
-- 设置默认图片路径。
-- 
-- @param #string bgImage 背景图片路径。若为 nil或false ，则 @{#Slider.s_bgImage} 被设置为 @{#Slider.s_defaultBgImage} 。
-- @param #string fgImage 前景图片路径。若为 nil或false ，则 @{#Slider.s_fgImage} 被设置为 @{#Slider.s_defaultFgImage} 。
-- @param #string buttonImage 按钮图片路径。若为 nil或false ，则 @{#Slider.s_buttonImage} 被设置为 @{#Slider.s_defaultButtonImage} 。
Slider.setDefaultImages = function(bgImage, fgImage, buttonImage)
    Slider.s_bgImage = bgImage or Slider.s_defaultBgImage;
    Slider.s_fgImage = fgImage or Slider.s_defaultFgImage;
    Slider.s_buttonImage = buttonImage or Slider.s_defaultButtonImage;
end

---
-- 构造函数.
-- 
-- @param self
-- @param #number width 宽。若为nil或false，或者 < 1，则忽略这个参数，根据背景图片设置宽度。
-- @param #number height 高。若为nil或false，或者 < 1，则忽略这个参数，根据背景图片设置高度。
-- @param #string bgImage 背景图片路径。
-- 
--  若 @{#Slider.s_bgImage} 不为nil或false，则背景图片为 @{#Slider.s_bgImage}。否则，背景图片为 @{#Slider.s_defaultBgImage}
-- 
-- @param #string fgImage 前景图片路径。
-- 
--  若 @{#Slider.s_fgImage} 不为nil或false，则前景图片为 @{#Slider.s_fgImage}。否则，背景图片为 @{#Slider.s_defaultFgImage}
-- 
-- @param #string buttonImage 按钮图片路径。
-- 
--  若 @{#Slider.s_buttonImage} 不为nil或false，则按钮图片为 @{#Slider.s_buttonImage}。否则，背景图片为 @{#Slider.s_defaultButtonImage}
--  
-- @param #number leftWidth 9-Grid规范的贴图的左边缘的宽度。详见:@{#core.drawing#DrawingBase}。
-- @param #number rightWidth 9-Grid规范的贴图的右边缘的宽度。详见: @{core.drawing#DrawingBase}。
-- @param #number topWidth 9-Grid规范的贴图的上边缘的宽度。详见: @{core.drawing#DrawingBase}。
-- @param #number bottomWidth 9-Grid规范的贴图的下边缘的宽度。详见: @{core.drawing#DrawingBase}。
Slider.ctor = function(self, width, height, bgImage, fgImage, buttonImage, leftWidth, rightWidth, topWidth, bottomWidth)
    self.m_bgImage = bgImage or Slider.s_bgImage or Slider.s_defaultBgImage;
    self.m_fgImage = fgImage or Slider.s_fgImage or Slider.s_defaultFgImage;
    self.m_buttonImage = buttonImage or Slider.s_buttonImage or Slider.s_defaultButtonImage;

    self.m_bg = new(Image,self.m_bgImage,nil,nil,leftWidth,rightWidth,topWidth,bottomWidth);
    width = (width and width >= 1) and width or self.m_bg:getSize();
    height = (height and height >= 1) and height or select(2,self.m_bg:getSize());

    Slider.setSize(self,width,height);

    Slider.addChild(self,self.m_bg);
    self.m_bg:setFillParent(true,true);

    self.m_fg = new(Image,self.m_fgImage,nil,nil,leftWidth,rightWidth,topWidth,bottomWidth);

    Slider.addChild(self,self.m_fg);
    self.m_fg:setFillParent(true,true);
    self.m_bg:setEventTouch(self,self.onBackgroundEventTouch);
    
    self.m_button = new(Image,self.m_buttonImage);
    Slider.addChild(self,self.m_button);
    self.m_button:setAlign(kAlignLeft);
    self.m_button:setPos(0,0);
    self.m_button:setEventTouch(self,self.onEventTouch);

    self.m_width = width;
    Slider.setProgress(self,1.0);

    self.m_changeCallback = {};
end

---
-- 同时设置前景、背景、按钮图片。
-- 
-- @param self
-- @param #string bgImage 背景图片路径。
-- 
--  背景图片会被设置成  bgImage、@{#Slider.s_bgImage} 中第一个不为nil或false的。
--  
--  若 bgImage、@{#Slider.s_bgImage} 都为 nil 或 false，则设置成 @{#Slider.s_defaultBgImage} 的值。
--  
-- @param #string fgImage 前景图片路径。
-- 
--  背景图片会被设置成  fgImage、@{#Slider.s_fgImage} 中第一个不为nil或false的。
--  
--  若 fgImage、@{#Slider.s_fgImage} 都为 nil 或 false，则设置成 @{#Slider.s_defaultFgImage} 的值。
-- 
-- @param #string buttonImage 按钮图片路径。
-- 
--  背景图片会被设置成  buttonImage、@{#Slider.s_buttonImage} 中第一个不为nil或false的。
--  
--  若 buttonImage、@{#Slider.s_buttonImage} 都为 nil 或 false，则设置成 @{#Slider.s_defaultButtonImage} 的值。
Slider.setImages = function(self, bgImage, fgImage, buttonImage)
    self.m_bgImage = bgImage or Slider.s_bgImage or Slider.s_defaultBgImage;
    self.m_fgImage = fgImage or Slider.s_fgImage or Slider.s_defaultFgImage;
    self.m_buttonImage = buttonImage or Slider.s_buttonImage or Slider.s_defaultButtonImage;

    self.m_bg:setFile(self.m_bgImage);
    self.m_fg:setFile(self.m_fgImage);
    self.m_button:setFile(self.m_buttonImage);
end

---
-- 设置当前值.
-- 
-- 当前值的范围在0和1之间。
-- 
-- @param self
-- @param #number progress 当前值。范围[0,1]。
-- 若  progress > 1，则当前值被设置成1；若 progress < 0，则当前值被设置成0。
Slider.setProgress = function(self, progress)
    progress = progress > 1 and 1 or progress;
    progress = progress < 0 and 0 or progress;
    self.m_progress = progress;

    local buttonW,buttonH = self.m_button:getSize();
    local buttonX = self.m_progress*self.m_width - buttonW/2;
    self.m_button:setPos(buttonX);
	self.m_fg:setClip(0,0,self.m_width*self.m_progress,buttonH);
end

---
-- 获得当前值。
-- 
-- @return #number 当前值。
Slider.getProgress = function(self)
    return self.m_progress;
end

---
-- 设置按钮是否可点击.
-- 
-- @param self
-- @param #boolean enable 若为true，则按钮可点击。否则，按钮不可点击。
Slider.setEnable = function(self, enable)
    self.m_button:setPickable(enable);
end

---
-- 设置是否显示按钮.
-- 
-- 若按钮不可见，则 @{#Slider} 可用作进度条。
-- 
-- @param self
-- @param #boolean visible 若为true，则按钮可见。否则，按钮不可见。
Slider.setButtonVisible = function(self, visible)
    self.m_button:setVisible(visible);
end

---
-- 设置当手指拖动按钮时的事件回调函数.
-- 
-- 当  @{#Slider} 的按钮接收到除“手指按下”以外的手指事件的时候，调用 ```func(obj)```。
-- 
-- @param self
-- @param obj 任意lua值。
-- @param #function func 回调函数。
Slider.setOnChange = function(self, obj, func)
    self.m_changeCallback.obj = obj;
    self.m_changeCallback.func = func;
end

---
-- 析构函数.
Slider.dtor = function(self)

end

---------------------------------private functions-----------------------------------------

---
-- 按钮的 @{core.drawing#DrawingBase.setEventTouch} 事件的回调函数.
-- 
-- 注：该函数被标记为“private function”，不建议直接调用该函数。
-- 
-- @param self
-- @param #number finger_action 手指事件。 详见： @{core.drawing#DrawingBase.setEventTouch}.
-- @param #number x 是手指触摸时的全局横坐标。详见： @{core.drawing#DrawingBase.setEventTouch}.
-- @param #number y 是手指触摸时的全局纵坐标。详见: @{core.drawing#DrawingBase.setEventTouch}.
-- @param #number drawing_id_first 是[```kFingerDown```](core.constants.html#kFingerDown)时拾取到的drawing可绘制对象的id。详见： @{core.drawing#DrawingBase.setEventTouch}.
-- @param #number drawing_id_current 是引擎根据当前触摸的坐标拾取到的drawing可绘制对象的id。详见： @{core.drawing#DrawingBase.setEventTouch}.
-- @param #number event_time 当前事件的触发时间(单位：毫秒)。
Slider.onEventTouch = function(self, finger_action, x, y, drawing_id_first, drawing_id_current,event_time)
    if finger_action == kFingerDown then
        self.m_dragingX = x;
        self.m_button:setColor(128,128,128);
    else 
        local bgX, bgY = self:getAbsolutePos();

        local notifyChange = function ()
            if self.m_changeCallback.func then
                self.m_changeCallback.func(self.m_changeCallback.obj,self.m_progress);
            end 
        end

        if (bgX <= x) and (self.m_width + bgX >= x) then 
            local diffX = x - self.m_dragingX;
            local progress = self.m_progress + diffX/self.m_width;
            Slider.setProgress(self,progress);
            self.m_dragingX = x;
        
            notifyChange();
        elseif (x < bgX) and (self.m_progress > 0) then 
            -- 移动太快，刚跳出边界时，校正下。
            Slider.setProgress(self,0);
            self.m_dragingX = bgX;
        
            notifyChange();
        elseif (x > self.m_width + bgX) and (self.m_progress < 1) then 
            -- 移动太快，刚跳出边界时，校正下。
            Slider.setProgress(self,1);
            self.m_dragingX = self.m_width + bgX;
        
            notifyChange();
        end 

        if finger_action ~= kFingerMove then
            self.m_button:setColor(255,255,255);
        end
    end
end

---
-- 按钮的 @{core.drawing#DrawingBase.setEventTouch} 事件的回调函数.
-- 
-- 注：该函数被标记为“private function”，不建议直接调用该函数。
-- 
-- @param self
-- @param #number finger_action 手指事件。 详见： @{core.drawing#DrawingBase.setEventTouch}.
-- @param #number x 是手指触摸时的全局横坐标。详见： @{core.drawing#DrawingBase.setEventTouch}.
-- @param #number y 是手指触摸时的全局纵坐标。详见: @{core.drawing#DrawingBase.setEventTouch}.
-- @param #number drawing_id_first 是[```kFingerDown```](core.constants.html#kFingerDown)时拾取到的drawing可绘制对象的id。详见： @{core.drawing#DrawingBase.setEventTouch}.
-- @param #number drawing_id_current 是引擎根据当前触摸的坐标拾取到的drawing可绘制对象的id。详见： @{core.drawing#DrawingBase.setEventTouch}.
-- @param #number event_time 当前事件的触发时间(单位：毫秒)。
Slider.onBackgroundEventTouch = function(self, finger_action, x, y, drawing_id_first, drawing_id_current,event_time)
    if finger_action == kFingerDown then
        local bgX, bgY = self:getAbsolutePos();
        local deltaX = x - bgX;
        local progress = deltaX/self.m_width;

        Slider.setProgress(self,progress);
    end 

    self:onEventTouch(finger_action, x, y, drawing_id_first, drawing_id_current,event_time);
end

end
        

package.preload[ "ui.slider" ] = function( ... )
    return require('ui/slider')
end
            

package.preload[ "ui/switch" ] = function( ... )
-- Author: 
--   Xiaofeng Yang      2015
--   Vicent.Gong        2013
-- Last modification : 2015-04-21
-- Description: 
--   Switch是一个用于在“开”、“关”状态切换的控件。“开”、“关”状态由一个背景图片和一个左右移动的切换按钮构成，单击该控件即可实现“开”、“关”状态之间的切换。
-- 控件在“开”、“关”状态之间的切换的过程中，可以设置是否播放切换按钮移动动画。对于切换过程耗时的情况，可以选择在单击时进入pending状态。待任务处理完以后，
-- 调用restore()来恢复到目标状态。
-- 
-- 一些说明：
--     除了按钮图片，其它图片大小应该保持一致。
--     状态切换动画在完成前不接收手指指令。
--     pending状态完成前不接收手指指令，也无法修改状态。
--     setChecked可以随时切换状态并生效，但是没有动画效果。如果当前正处于状态切换动画，那么先停止动画，再执行切换。pending状态是例外，在该状态下无法通过setChecked来切换。
--     如果当前处于pending状态，那么直到pending状态结束前，以上手指、setChecked()等命令无效。
--     为了保持向下兼容，onChange仅仅在用手操作的情况下会通知。为了保持和原有控件行为的一致性，pending结束后若改变开关状态，也会调用onChange。
--     pending状态的动画可以选择是否在原背景图的基础上叠加。
--


--------------------------------------------------------------------------------
-- Switch(功能类似于单个的选择框，左右滑动操作).
-- 
-- @module ui.switch
-- @return #nil 
-- @usage require("ui/switch")

require("core/constants");
require("core/object");
require("core/global");
require("ui/node");
require("ui/image");
require("ui/images");


---
-- @{#Switch} 实现了一个开关控件.
-- 
-- 使用该控件需要提供3个不同的图片，分别用于“开”“关”状态的背景图片，以及按钮图片。
-- 每一种图片都已经有默认值。
-- 
-- 开关切换，通过拖动按钮的来实现。
-- 
-- @type Switch
-- @extends ui.node#Node 
Switch = class(Node);


---
-- 默认的默认“开”状态的背景图片。
Switch.s_defaultOnFile = "ui/switchOn.png";

---
-- 默认的默认“关”状态的背景图片。
Switch.s_defaultOffFile = "ui/switchOff.png";

---
-- 默认的默认按钮图片。
Switch.s_defaultButtonFile = "ui/switchButton.png";


---
-- 默认“开”状态的背景图片。
-- 
-- @field [parent=#Switch] #string s_onFile 

---
-- 默认“关”状态的背景图片。
-- 
-- @field [parent=#Switch] #string s_offFile 

---
-- 默认按钮图片。
-- 
-- @field [parent=#Switch] #string s_buttonFile 

---
-- 设置3个默认的图片。
-- 
-- @param #string onFile “开”状态的背景图片。
-- 
-- 若 onFile 为 nil 或者 false，则 @{#Switch.s_onFile}被设置成@{#Switch.s_defaultOnFile}；
-- 否则， @{#Switch.s_onFile}被设置成onFile。
-- 
-- @param #string offFile “关”状态的背景图片。
-- 
-- 若 offFile 为 nil 或者 false，则 @{#Switch.s_offFile}被设置成@{#Switch.s_defaultOffFile}；
-- 否则， @{#Switch.s_offFile}被设置成offFile。
-- 
-- @param #string buttonFile 按钮图片。
-- 
-- 若 buttonFile 为 nil 或者 false，则 @{#Switch.s_buttonFile}被设置成@{#Switch.s_defaultButtonFile}；
-- 否则， @{#Switch.s_buttonFile}被设置成 buttonFile 。
-- 
Switch.setDefaultImages = function(onFile, offFile, buttonFile)
    Switch.s_onFile = onFile or Switch.s_defaultOnFile;
    Switch.s_offFile = offFile or Switch.s_defaultOffFile;
    Switch.s_buttonFile = buttonFile or Switch.s_defaultButtonFile;
end

--- 状态切换动画的默认总时长。单位：毫秒。
Switch.s_defaultAnimationLength = 150; 

--- 设置状态切换动画的默认总时长。单位：毫秒。
-- @param #number value 新的总时长。
Switch.setDefaultAnimationLength = function (value)
    Switch.s_defaultAnimationLength = value;
end

--- 动画版pending默认的每一帧图片。这是一个数组，每个元素是一个字符串，对应相应的图片文件。
Switch.s_defaultPendingAnimationImages = (function ()
    local images = {};

    for i = 1, 8 do 
        images[i] = 'ui/switchPendingImages/' .. i .. '.png';
    end

    return images
end)()

--- 设置动画版pending默认的每一帧图片。
-- @param #table value 新的默认每一帧图片。
Switch.setDefaultPendingAnimationImages = function (value)  
    Switch.s_defaultPendingAnimationImages = value;
end

--- 动画版pending的每两帧图片之间的默认间隔时间。单位：毫秒。
Switch.s_defaultPendingAnimationImagesInterval = 60;

--- 设置动画版pending的每两帧图片之间的默认间隔时间。单位：毫秒。
-- @param #number value 新的间隔时间。
Switch.setDefaultPendingAnimationImagesInterval = function (value)
    Switch.s_defaultPendingAnimationImagesInterval = value;
end


--- 静态图片版pending的默认图片。
Switch.s_defaultStaticPendingAnimationImage = 'ui/switchPendingImages/static.png';

--- 设置静态图片版pending的默认图片。
-- @param #string value 新的图片文件。
Switch.setDefaultStaticPendingAnimationImage = function (value)
    Switch.s_defaultStaticPendingAnimationImage = value;
end

---
-- 构造函数.
-- 
-- @param self
-- @param #number width 宽。
-- 
-- 背景图片会根据宽高进行缩放。
-- 
-- @param #number height 高。
-- 
-- 背景图片会根据宽高进行缩放。
--
-- @param #string onFile “开”状态的背景图片。
-- 
-- 实际图片是 ```onFile```、@{#Switch.s_onFile} 中第一个不为 nil 或 false 的值；
-- 若都为 nil 或 false， 则实际图片是 @{#Switch.s_defaultOnFile} 。 
-- 
-- @param #string offFile “关”状态的背景图片。
-- 
-- 实际图片是 ```offFile```、@{#Switch.s_offFile} 中第一个不为 nil 或 false 的值；
-- 若都为 nil 或 false， 则实际图片是 @{#Switch.s_defaultOffFile} 。 
-- 
-- @param #string buttonFile 按钮图片。
-- 
-- 实际图片是 ```buttonFile```、@{#Switch.s_buttonFile} 中第一个不为 nil 或 false 的值；
-- 若都为 nil 或 false， 则实际图片是 @{#Switch.s_defaultButtonFile} 。 
-- 
Switch.ctor = function(self, width, height, onFile, offFile, buttonFile, pendingAnimationImages, staticPendingAnimationImage)
    onFile = onFile or Switch.s_onFile or Switch.s_defaultOnFile;
    offFile = offFile or Switch.s_offFile or Switch.s_defaultOffFile;
    buttonFile = buttonFile or Switch.s_buttonFile or Switch.s_defaultButtonFile;

    self.m_needAnimation = false;
    self:setPendingCallback(nil, nil);
    self.m_animationProp = nil;
    self.m_pendingAnim = nil;
    self.m_animationLength = Switch.s_defaultAnimationLength;
    self.m_pendingState = false;
    self.m_pendingImagesArray = pendingAnimationImages or Switch.s_defaultPendingAnimationImages;
    self.m_staticPendingImageFile = staticPendingAnimationImage or Switch.s_defaultStaticPendingAnimationImage;
    self.m_pendingAnimationImagesInterval = Switch.s_defaultPendingAnimationImagesInterval;
    self.m_pendingOverlay = false;

    self.m_onImage = new(Image,onFile);
    self.m_offImage = new(Image,offFile);
    self.m_buttonImage = new(Image,buttonFile);
    self.m_buttonImage:setAlign(kAlignLeft);
    self.m_staticPendingImage = new(Image, self.m_staticPendingImageFile);

    self.m_pendingImages = new(Images, self.m_pendingImagesArray);
    self.m_pendingImages:setImageIndex(0);

    local onWidth,onHeight = self.m_onImage:getSize();
    local scale = Switch.calculateScale(self,width,height,onWidth,onHeight);

    width,height = Switch.calculateSize(self,self.m_onImage,scale);
    self.m_buttonWidth,self.m_buttonHeight = Switch.calculateSize(self,self.m_buttonImage,scale);

    self.m_onImage:setSize(width,height);
    self.m_offImage:setSize(width,height);
    self.m_pendingImages:setSize(width,height);
    self.m_staticPendingImage:setSize(width,height);
    self.m_buttonImage:setSize(self.m_buttonWidth,self.m_buttonHeight);
    Switch.addChild(self,self.m_onImage);
    Switch.addChild(self,self.m_offImage);
    Switch.addChild(self,self.m_buttonImage);
    Switch.addChild(self,self.m_pendingImages);
    Switch.addChild(self,self.m_staticPendingImage);

    self.m_pendingImages:setVisible(false);
    self.m_staticPendingImage:setVisible(false);

    Node.setSize(self,width,height);
    Node.setClip(self,self.m_x,self.m_y,self.m_width,self.m_height);

    self:setEventTouch(self,self.onButtonClick);

    Switch.setOn(self);

    self.m_eventCallback = {};
end


---
-- Override @{core.drawing#DrawingBase.setPos}.
-- 
-- @param self
-- @param #number x 相对于父drawing的横坐标。详见：@{core.drawing#DrawingBase.setPos}.
-- @param #number y 相对于父drawing的纵坐标。详见：@{core.drawing#DrawingBase.setPos}.
Switch.setPos = function(self, x, y)
    Node.setPos(self,x,y);
    Node.setClip(self,self.m_x,self.m_y,self.m_width,self.m_height);
end

---
-- Override @{core.drawing#DrawingBase.setSize}.
-- 
-- **注：该函数什么都不做。**
-- 
-- @param self
-- @param #number width 宽度。详见： @{core.drawing#DrawingBase.setSize}.
-- @param #number height 高度。详见： @{core.drawing#DrawingBase.setSize}.
Switch.setSize = function(self, width, height)

end

---
-- Override @{core.drawing#DrawingBase.setAlign}.
-- 
-- @param self
-- @param #number align 对齐方式。详见： @{core.drawing#DrawingBase.setAlign}.
Switch.setAlign = function(self, align)
    Node.setAlign(self,align);
    Node.setClip(self,self.m_x,self.m_y,self.m_width,self.m_height);
end


---
-- Override @{core.drawing#DrawingBase.setClip}.
-- 
-- **注：该函数什么都不做。**
-- 
-- @param self
-- @param #number x 矩形裁剪区域相对于父drawing左上角x轴坐标。详见： @{core.drawing#DrawingBase.setClip}.
-- @param #number y 矩形裁剪区域相对于父drawing左上角y轴坐标。详见： @{core.drawing#DrawingBase.setClip}.
-- @param #number w 矩形裁剪区域的宽。详见： @{core.drawing#DrawingBase.setClip}.
-- @param #number h 矩形裁剪区域的高。详见： @{core.drawing#DrawingBase.setClip}.
Switch.setClip = function(self, x, y, w, h)

end


---
-- Override @{core.drawing#DrawingBase.setClip2}.
-- 
-- **注：该函数什么都不做。**
-- 
-- @param self
-- @param #boolean enable enable为true，则启用裁减；enable为false，不启用裁减。
-- @param #number x 矩形裁剪区域相对于此drawing左上角x轴坐标。详见： @{core.drawing#DrawingBase.setClip2}.
-- @param #number y 矩形裁剪区域相对于此drawing左上角y轴坐标。详见： @{core.drawing#DrawingBase.setClip2}.
-- @param #number w 矩形裁剪区域的宽。详见： @{core.drawing#DrawingBase.setClip2}.
-- @param #number h 矩形裁剪区域的高。详见： @{core.drawing#DrawingBase.setClip2}.
Switch.setClip2 = function(self, enable, x, y, w, h)

end

--- 
-- 设置当前开关状态。
-- 
-- @param self
-- @param #boolean checked 若为 true ，则设置成“开”状态；否则，设置成“关”状态。
Switch.setChecked = function(self,checked)
    if self:isPending() then 
        return        
    end

    if self.m_animationProp then 
        self:removeAnimationPropIfPossible();
    else 
        if self.m_state == checked then
            return
        end
    end 

    self:updateChecked(checked);
end

--- 
-- 返回当前的开关状态。
-- 
-- @return #boolean 若当前是“开”状态，则返回 true；否则，返回 false。
Switch.isChecked = function(self)
    return self.m_state
end

--- 
-- 返回是否启用动画效果。
-- 
-- @return #boolean 若启用，则返回 true；否则，返回 false。
Switch.isNeedAnimation = function (self)
    return self.m_needAnimation
end

--- 设置是否启用动画效果。在动画的过程中设置该值，会在下次操作时生效。
-- @param self 
-- @param #boolean value 新的值。
Switch.setNeedAnimation = function (self, value)
    self.m_needAnimation = value;
end

--- 
-- 设置pending的回调.
-- 在刚进入pending状态的时候，会调用func(obj, newChecked)，newChecked为boolean类型，表示目标开关状态。
-- func(obj, newChecked)返回一个boolean值，若返回false，则不进入pending状态，继续播放animation动画；
-- 返回true则会进入pending状态，进入pending状态后通过调用restore来进入目标状态。
-- 用这个函数来设置func和obj。若func为nil，则pending过程不会开始。
-- @param self 
-- @param obj 传给func的值，类型任意。
-- @param #function func 刚进入pending的时候的回调函数。
Switch.setPendingCallback = function (self, obj, func)
    if func then 
        self.m_pendingCallback = function (newChecked)
            return func(obj, newChecked)
        end
    else 
        self.m_pendingCallback = function (...)
            return false
        end
    end 
end

---
-- 判断当前是否正在pending状态。若在pending状态，必须restore()以后才能继续进行操作。
Switch.isPending = function (self)
    return self.m_pendingState    
end

--- 
-- 返回状态切换动画的总时长。
-- 
-- @return #number 状态切换动画的总时长。
Switch.getAnimationLength = function (self)
    return self.m_animationLength
end

--- 设置状态切换动画的总时长。在动画的过程中设置该值，会在下次操作时生效。
-- @param self 
-- @param #number value 新的值。
Switch.setAnimationLength = function (self, value)
    self.m_animationLength = value;
end

--- 设置动画版pending的每两帧图片之间的间隔时间。单位：毫秒。
-- @param  self 
-- @param #number value 新的间隔时间。
Switch.setPendingAnimationImagesInterval = function (self, value)
    self.m_pendingAnimationImagesInterval = value;
end


--- 设置pending时的图片是否叠加放在开关图片的上面。
-- 若在pending的过程中设置该值，会在下次操作时生效。
-- @param self 
-- @param #boolean value 是否形成一个叠加层。若为true，则pending时的图片叠加放在开关图片上面；否则，pending时只显示pending动画。
Switch.setPendingOverlay = function (self, value)
    self.m_pendingOverlay = value;
end 

--- 
-- 返回pending时的图片是否叠加放在开关图片的上面。
-- 
-- @return #boolean 是否形成一个叠加层。若为true，则pending时的图片叠加放在开关图片上面；否则，pending时只显示pending动画。
Switch.isPendingOverlay = function (self)
    return self.m_pendingOverlay
end 

--- 从pending状态返回到正常状态。并且设置目标开关状态为newChecked。
-- @param self
-- @param #boolean newChecked 目标开关状态。
Switch.restore = function (self, newChecked) 
    if not self:isPending() then 
        return
    end

    if self.m_pendingAnim then 
        delete(self.m_pendingAnim);
        self.m_pendingAnim = nil;
    end 

    self.m_pendingImages:setVisible(false);
    self.m_staticPendingImage:setVisible(false);

    self.m_pendingState = false;
    
    local invokeStateChange = true;
    if newChecked == self.m_state then 
        invokeStateChange = false;
    end 

    self:updateChecked(newChecked); 

    if invokeStateChange then 
        if self.m_eventCallback.func then
            self.m_eventCallback.func(self.m_eventCallback.obj,self.m_state);
        end
    end 

end

---
-- 设置当开关状态变化时的回调函数.
-- 
-- 当开关状态变化时，调用 ```func(obj, state)``` 。
-- 其中，若变成“开”状态，则```state == true```；若变成“关”状态，则```state == false```。
-- 
-- @param self
-- @param obj 任意lua值。
-- @param #function func 回调函数。
Switch.setOnChange = function(self, obj, func)
    self.m_eventCallback.obj = obj;
    self.m_eventCallback.func = func;
end


---
-- 析构函数.
-- 
Switch.dtor = function(self)
    self:removeAnimationPropIfPossible();

    if self.m_pendingAnim then
        delete(self.m_pendingAnim);
        self.m_pendingAnim = nil;
    end
end

---------------------------------private functions-----------------------------------------

---
-- Override @{core.drawing#DrawingBase.setParent}.
-- 
-- **注：该函数被标记为“private function”，不建议直接调用该函数。**
-- @param self
-- @param core.drawing#DrawingBase parent 详见： @{core.drawing#DrawingBase.setParent}.
Switch.setParent = function(self, parent)
    Node.setParent(self,parent);
    Node.setClip(self,self.m_x,self.m_y,self.m_width,self.m_height);
end

---
-- 按钮的 @{core.drawing#DrawingBase.setEventTouch} 事件的回调函数.
-- 
-- **注：该函数被标记为“private function”，不建议直接调用该函数。**
-- 
-- @param self
-- @param #number finger_action 手指事件。 详见： @{core.drawing#DrawingBase.setEventTouch}.
-- @param #number x 是手指触摸时的全局横坐标。详见： @{core.drawing#DrawingBase.setEventTouch}.
-- @param #number y 是手指触摸时的全局纵坐标。详见: @{core.drawing#DrawingBase.setEventTouch}.
-- @param #number drawing_id_first 是[```kFingerDown```](core.constants.html#kFingerDown)时拾取到的drawing可绘制对象的id。详见： @{core.drawing#DrawingBase.setEventTouch}.
-- @param #number drawing_id_current 是引擎根据当前触摸的坐标拾取到的drawing可绘制对象的id。详见： @{core.drawing#DrawingBase.setEventTouch}.
-- @param #number event_time 当前事件的触发时间(单位：毫秒)。
Switch.onButtonClick = function(self, finger_action, x, y, drawing_id_first, drawing_id_current,event_time)
    if self.m_animationProp then 
        return
    end 

    if self.m_pendingState then 
        return
    end

    if finger_action == kFingerDown then
        if self.m_pendingCallback(not self.m_state) then 
            -- enter pending state

            if not self.m_pendingOverlay then 
                self.m_onImage:setVisible(false);
                self.m_offImage:setVisible(false);
                self.m_buttonImage:setVisible(false);
            end

            if self.m_needAnimation then 
                self.m_pendingImages:setVisible(true);
                self.m_staticPendingImage:setVisible(false);

                self.m_pendingAnim = (function ()
                    local index = 0;
                    local imageCount = #(self.m_pendingImagesArray);
                    local anim = new(AnimDouble,kAnimRepeat,0,0,self.m_pendingAnimationImagesInterval,0);        
                    anim:setEvent(nil, function ()
                        index = (index + 1) % imageCount;
                        self.m_pendingImages:setImageIndex( index );
                    end)
                    return anim
                end)()
            else
                self.m_pendingImages:setVisible(false);
                self.m_staticPendingImage:setVisible(true);
            end  

            self.m_pendingState = true;
        else 
            if self.m_needAnimation then 
                self:setWithAnimation(not self.m_state);
            else 
                Switch.setChecked(self,not self.m_state);
                if self.m_eventCallback.func then
                    self.m_eventCallback.func(self.m_eventCallback.obj,self.m_state);
                end
            end 
        end 
    end
end

---
-- 根据“开”状态图片的尺寸和传入的宽高，计算缩放比例.
-- 
-- **注：该函数被标记为“private function”，不建议直接调用该函数。**
-- 
-- @param self
-- @param #number width 构造函数中传入的宽度。
-- @param #number height 构造函数中传入的高度。
-- @param #number onWidth “开”状态图片的宽度。
-- @param #number onHeight “关”状态图片的宽度。
-- @return #number 缩放比例。
Switch.calculateScale = function(self, width, height, onWidth, onHeight)
    width = (width and width > 0) and width or onWidth;
    height = (height and height > 0) and height or onHeight;

    local scaleW = width / onWidth;
    local scaleH = height / onHeight;
    local scale = scaleW > scaleH and scaleW or scaleH;

    return scale
end


---
-- 根据图片大小和缩放比例，返回新的宽高.
-- 
-- **注：该函数被标记为“private function”，不建议直接调用该函数。**
-- 
-- @param self
-- @param ui.image#Image image 图片。
-- @param #number scale 缩放比例。
-- @return #number, #number 新的宽度, 新的高度。 
Switch.calculateSize = function(self, image, scale)
    local width,height = image:getSize();

    width = width * scale;
    height = height * scale;

    return width, height
end

---
-- 移除动画属性.
-- 
-- **注：该函数被标记为“private function”，不建议直接调用该函数。**
Switch.removeAnimationPropIfPossible = function (self)
    if self.m_animationProp then 
        self.m_animationProp = nil;
        self.m_buttonImage:removeProp(0);
    end
end

---
-- 设置成“开”状态的外观.
-- 
-- **注：该函数被标记为“private function”，不建议直接调用该函数。**
Switch.setOn = function(self)
    self.m_buttonImage:setVisible(true);
    self.m_buttonImage:setPos(self.m_width - self.m_buttonWidth);
    self.m_offImage:setVisible(false);
    self.m_onImage:setVisible(true);
end


---
-- 设置成“关”状态的外观.
-- 
-- **注：该函数被标记为“private function”，不建议直接调用该函数。**
-- 
-- @param self
Switch.setOff = function(self)
    self.m_buttonImage:setVisible(true);
    self.m_buttonImage:setPos(0);
    self.m_onImage:setVisible(false);
    self.m_offImage:setVisible(true);
end


--- 
-- 设置伴随动画.
-- 
-- **注：该函数被标记为“private function”，不建议直接调用该函数。**
-- @param self
-- @param #boolean targetState 目标状态。若为 true ，则为“开”状态；否则，为“关”状态。
Switch.setWithAnimation = function (self, targetState)
    local offX = self.m_width - self.m_buttonWidth;

    if not targetState then 
        offX = - offX;
    end

    self.m_animationProp = self.m_buttonImage:addPropTranslate(
            0,                     
            kAnimNormal,           
            self.m_animationLength,                  
            0,                     
            0,                     
            offX,                  
            0,                     
            0                      
        );

    self.m_animationProp:setEvent(nil, function ()         
        self:removeAnimationPropIfPossible();
        
        if targetState then 
            self:setOn();
        else 
            self:setOff();
        end

        self.m_state = targetState;
        
        if self.m_eventCallback.func then
            self.m_eventCallback.func(self.m_eventCallback.obj,self.m_state);
        end
    end)        
end

--- 
-- 更新开关状态.
-- 
-- **注：该函数被标记为“private function”，不建议直接调用该函数。**
-- @param self
-- @param #boolean checked 若为 true ，则设置成“开”状态；否则，设置成“关”状态。
Switch.updateChecked = function(self,checked)
    self.m_state = checked;

    if self.m_state then
        Switch.setOn(self, false);
    else
        Switch.setOff(self, false);
    end
end

end
        

package.preload[ "ui.switch" ] = function( ... )
    return require('ui/switch')
end
            

package.preload[ "ui/tableView" ] = function( ... )
-- listView.lua
-- Author: Vicent.Gong
-- Date: 2012-09-27
-- Last modification : 2013-08-01
-- Description: Implemented tableView

--------------------------------------------------------------------------------
-- 提供一个带滚动效果的空白容器控件，可以往该控件中添加任意内容。
-- @module ui.tableView
-- @return #nil 
-- @usage require("ui/tableView")


require("core/constants");
require("core/object");
require("core/global");
require("ui/scrollableNode");

---
-- @{#TableView}提供一个带滚动效果的空白容器控件，可以往该控件中添加任意内容。
-- 
-- 和@{ui.scrollView#ScrollView}不同，往@{#TableView}添加的子控件，必须在滚动的轴上大小一致。
-- 并且，这些子控件的位置完全受@{#TableView}安排，而无需自己手动设置。
-- 
-- @{#TableView}的数据和子控件，由@{#ui.adapter#Adapter}提供和管理。
--
-- @type TableView
-- @extends ui.scrollableNode#ScrollableNode 
TableView = class(ScrollableNode,false);

---
-- 默认的默认滚动条宽度。
-- 
TableView.s_defaultScrollBarWidth = 8;

---
-- 默认的默认最大点击距离。详见：@{#TableView.setDefaultMaxClickOffset}.
TableView.s_defaultMaxClickOffset = 5;

---
-- 默认的滚动条宽度.
-- 
-- @field [parent=#TableView] #number s_scrollBarWidth

---
-- 设置默认的滚动条宽度.
-- 
-- 若 width 为nil或者false，则 @{#TableView.s_scrollBarWidth} 被设置成
-- @{#TableView.s_defaultScrollBarWidth}。否则，@{#TableView.s_scrollBarWidth}
-- 被设置成 width 。
-- 
-- @param #number width 默认滚动条宽度。
TableView.setDefaultScrollBarWidth = function(width)
    TableView.s_scrollBarWidth = width or TableView.s_defaultScrollBarWidth;
end

---
-- 默认最大点击距离.
-- 
-- @field [parent=#TableView] #number s_maxClickOffset

---
-- 设置默认最大点击距离.
-- 
-- 最大点击距离：当接收到手指事件完结的时候，若当前手指坐标和刚按下手指坐标在两个坐标轴上的距离差都小于 
-- 最大点击距离 ，则回调 @{#TableView.setOnItemClick} 所设置的回调函数。
--
-- 若 ```maxClickOffset``` 为nil或者false，则 @{#TableView.s_maxClickOffset} 被设置成
-- @{#TableView.s_defaultMaxClickOffset}。否则，@{#TableView.s_maxClickOffset}
-- 被设置成  ```maxClickOffset``` 。 
-- 
-- @param #number maxClickOffset 最大点击距离。
TableView.setDefaultMaxClickOffset = function(maxClickOffset)
    TableView.s_maxClickOffset = maxClickOffset or TableView.s_defaultMaxClickOffset;
end

---
-- 构造函数.
-- 
-- @param self
-- @param #number x 控件相对于父节点的位置X坐标。详见：<a href="core.drawing.html#006">**引擎的子节点与父节点九种对齐方式和其相对位置.**</a>
-- @param #number y 控件相对于父节点的位置Y坐标。详见：<a href="core.drawing.html#006">**引擎的子节点与父节点九种对齐方式和其相对位置.**</a>
-- @param #number w 控件宽度。
-- @param #number h 控件高度。
-- @param #boolean autoAlignToItemEdge 是否自动对齐到子控件边缘。
-- 若为true，则滚动停止时，会自动对齐到子控件的边缘。
-- @param #boolean isMultiItems 若为true，则控件会有多列，具体列数根据控件大小和子控件大小来决定。
-- 若为false，则控件只有一列。
TableView.ctor = function(self, x, y, w, h, autoAlignToItemEdge, isMultiItems)
    super(self,kVertical,self.s_scrollBarWidth or self.s_defaultScrollBarWidth);
    self.m_autoAlignToItemEdge = autoAlignToItemEdge;
    self.m_isMultiItem = isMultiItems;

    self.m_diff = 0;
    self.m_views = {};
    self.m_adapter = nil;
    self.m_itemLength = 0;
    self.m_itemEdgeLength = 0;
    self.m_nShowLines = 0;
    self.m_nTotalLines = 0;
    self.m_nItemsPerLine = 1;

    self.m_maxClickOffset = self.s_maxClickOffset or self.s_defaultMaxClickOffset;

    ScrollableNode.setPos(self,x,y);
    ScrollableNode.setSize(self,w or 1,h or 1);
    TableView.setClip(self);

    TableView.setEventDrag(self,self,self.onEventDrag);
    TableView.setEventTouch(self,self,self.onEventTouch);

    self.m_itemEventCallback = {};
    self.m_scrollCallback = {};
end

---
-- 设置最大点击距离。
-- 
-- @param self
-- @param #number offset 最大点击距离。
-- 
-- 最大点击距离 会被设置成 ```offset```, @{#TableView.s_maxClickOffset}, 
-- @{#TableView.s_defaultMaxClickOffset} 中第一个不为 nil 或 false 的值。
-- 若均为 nil 或 false，则 最大点击距离 会被设置成 @{#TableView.s_defaultMaxClickOffset}。 
-- 
TableView.setMaxClickOffset = function(self, offset)
    self.m_maxClickOffset = offset
                        or self.s_maxClickOffset
                        or self.s_defaultMaxClickOffset;
end

---
-- 设置滚动条宽度。
-- 
-- @param self
-- @param #number width 滚动条宽度。
-- 
-- 滚动条宽度 会被设置成 ```width```, @{#TableView.s_scrollBarWidth}, 
-- @{#TableView.s_defaultScrollBarWidth} 中第一个不为 nil 或 false 的值。
-- 若均为 nil 或 false，则 滚动条宽度 会被设置成 @{#TableView.s_defaultScrollBarWidth}。 
TableView.setScrollBarWidth = function(self, width)
    width = width
            or self.s_scrollBarWidth
            or self.s_defaultScrollBarWidth;

    ScrollableNode.setScrollBarWidth(self,width);
end

---
-- Override @{ui.scrollableNode#ScrollableNode.setDirection}.
-- 
-- @param self
-- @param direction 子节点移动方向。详见： @{ui.scrollableNode#ScrollableNode.setDirection}.
TableView.setDirection = function(self, direction)
    if (not direction) or self.m_direction == direction then
        return
    end

    self.m_direction = direction;

    TableView.updateItemLength(self);
    TableView.updateLineInfo(self);
    TableView.setClip(self);
    ScrollableNode.setDirection(self,self.m_direction);
    TableView.releaseAllViews(self);
    TableView.initViews(self);
end

---
-- Override @{ui.scrollableNode#ScrollableNode.setPos}.
-- 
-- @param self
-- @param x 相对于父drawing的横坐标。详见： @{ui.scrollableNode#ScrollableNode.setPos}.
-- @param y 相对于父drawing的纵坐标。详见： @{ui.scrollableNode#ScrollableNode.setPos}.
TableView.setPos = function(self, x, y)
    ScrollableNode.setPos(self,x,y);
    TableView.setClip(self);
end

---
-- Override @{ui.scrollableNode#ScrollableNode.setSize}.
-- 
-- @param self
-- @param w 宽度。详见： @{ui.scrollableNode#ScrollableNode.setSize}.
-- @param h 高度。详见： @{ui.scrollableNode#ScrollableNode.setSize}.
TableView.setSize = function(self, w, h)
    ScrollableNode.setSize(self,w,h);
    TableView.setClip(self);
    TableView.updateLineInfo(self);
    TableView.requireAndShowViews(self,self.m_diff);
end

---
-- Override @{ui.scrollableNode#ScrollableNode.setAlign}.
-- 
-- @param self
-- @param align 对齐方式。详见： @{ui.scrollableNode#ScrollableNode.setAlign}.
TableView.setAlign = function(self, align)
    ScrollableNode.setAlign(self,align);
    TableView.setClip(self);
end

---
-- Override @{ui.scrollableNode#ScrollableNode.setFillRegion}.
-- 
-- @param self
-- @param #boolean doFill 是否填充。详见： @{ui.scrollableNode#ScrollableNode.setFillRegion}.
-- @param #number topLeftX 左边的边距。详见：@{ui.scrollableNode#ScrollableNode.setFillRegion}.
-- @param #number topLeftY 上边的边距。详见： @{ui.scrollableNode#ScrollableNode.setFillRegion}.
-- @param #number bottomRightX 右边的边距。详见：@{ui.scrollableNode#ScrollableNode.setFillRegion}.
-- @param #number bottomRightY 下边的边距。详见：@{ui.scrollableNode#ScrollableNode.setFillRegion}.
TableView.setFillRegion = function(self, doFill, topLeftX, topLeftY, bottomRightX, bottomRightY)
    ScrollableNode.setFillRegion(self, doFill, topLeftX, topLeftY, bottomRightX, bottomRightY);
    TableView.setClip(self);
end

---
-- Override @{ui.scrollableNode#ScrollableNode.setFillParent}.
-- 
-- @param self
-- @param doFillParentWidth 横向是否填充父节点(与父节点同样宽度)。详见： @{ui.scrollableNode#ScrollableNode.setFillParent}.
-- @param doFillParentHeight 纵向是否填充父节点(与父节点同样高度)。详见： @{ui.scrollableNode#ScrollableNode.setFillParent}.
TableView.setFillParent = function(self, doFillParentWidth, doFillParentHeight)
    ScrollableNode.setFillParent(self,doFillParentWidth,doFillParentHeight);
    TableView.setClip(self);
end

---
-- Override @{core.drawing#DrawingBase.setClip}.
-- 
-- @param self
TableView.setClip = function(self)
    local clipX,clipY,clipW,clipH;
    local x,y = TableView.getUnalignPos(self);
    local width,height = TableView.getSize(self);
    if TableView.hasAdapter(self) then
        if self.m_direction == kVertical then
            if self.m_autoAlignToItemEdge then
                clipH = TableView.getFrameLength(self);
                clipY = y + (height - clipH)/2;
            else
                clipH = height;
                clipY = y;
            end

            if self.m_isMultiItem then
                clipW = width;
                clipX = x + (width - clipW)/2;
            else
                clipW = width;
                clipX = x;
            end
        else
            if self.m_autoAlignToItemEdge then
                clipW = TableView.getFrameLength(self);
                clipX = x + (width - clipW)/2;
            else
                clipW = width;
                clipX = x;
            end

            if self.m_isMultiItem then
                clipH = height;
                clipY = y + (height - clipH)/2;
            else
                clipH = height;
                clipY = y;
            end
        end
    else
        clipX = x;
        clipY = y;
        clipW = width;
        clipH = height;
    end

	ScrollableNode.setClip(self,clipX,clipY,clipW,clipH);
end

---
-- 设置新的@{ui.adapter#Adapter}对象.
--
-- 所有内容都会被重置。
--  
-- @param self
-- @param ui.adapter#Adapter adapter 新的@{ui.adapter#Adapter}对象。
TableView.setAdapter = function(self, adapter)
    TableView.releaseAllViews(self);

    if self.m_adapter ~= adapter then
        delete(self.m_adapter);
        self.m_adapter = adapter;
    end

    if not adapter then
        return
    end

    if not typeof(adapter,Adapter) then
        FwLog("The param must be an Adapter in setAdapter");
        return
    end

    adapter:setEventListener(self);

    --The following calls must be in order
    TableView.updateItemLength(self);
    TableView.updateLineInfo(self);
    TableView.setClip(self);
       ScrollableNode.recreate(self);
    TableView.initViews(self);
end

---
-- 返回当前的@{ui.adapter#Adapter}对象。
-- 
-- @return ui.adapter#Adapter 当前的@{ui.adapter#Adapter}对象。
TableView.getAdapter = function(self)
    return self.m_adapter;
end

---
-- 用于  @{ui.adapter#Adapter.appendData} 的回调函数。 
TableView.onAppendData = function(self)
    TableView.updateLineInfo(self);
    TableView.update(self);
    TableView.requireAndShowViews(self,self.m_diff);
end

---
-- 用于  @{ui.adapter#Adapter.changeData} 的回调函数。 
TableView.onChangeData = function(self)
    TableView.releaseAllViews(self);
    TableView.updateItemLength(self);
    TableView.updateLineInfo(self);
    TableView.setClip(self);
       ScrollableNode.recreate(self);
    TableView.initViews(self);
end

---
-- 用于  @{ui.adapter#Adapter.updateData} 的回调函数。
-- 
-- @param self
-- @param index 其值为 @{#Adapter.updateData} 的index参数。详见： @{ui.adapter#Adapter.updateData}. 
TableView.onUpdateData = function(self, index)
    local i = index - self.m_beginIndex;
    if not self.m_views[i] then
        return
    end

    local x,y = self.m_views[i]:getPos();
    TableView.removeChild(self,self.m_views[i]);
    self.m_adapter:releaseView(self.m_views[i]);

    self.m_views[i] = self.m_adapter:getView(index);
    self.m_views[i]:setPos(x,y);
    TableView.addChild(self,self.m_views[i]);
end

---
-- 设置手指事件完成时，若手指两个坐标轴上的位移都在 最大点击距离内，调用的回调函数.
--
-- ```func```的参数为```func(obj, adapter, view, index, viewX, viewY)```。
-- 其中：
-- 
-- * ```obj```
--      * 调用@{#TableView.setOnItemClick}时传进来的参数```obj```。
-- * ```adapter```
--      * @{#TableView}当前正在使用的@{ui.adapter#Adapter}。
-- * ```view```      
--      * 手指离开时，手指所处位置的子控件。
-- * ```index```
--      * ```view```在```adapter```中的索引。
-- * ```viewX```
--      * 手指离开时，手指X轴坐标（相对于```view```）。
-- * ```viewY```
--      * 手指离开时，手指Y轴坐标（相对于```view```）。
-- 
-- @param self
-- @param obj 任意lua值。
-- @param #function func 回调函数。
TableView.setOnItemClick = function(self, obj, func)
    self.m_itemEventCallback.obj = obj;
    self.m_itemEventCallback.func = func;
end

---
-- 设置当@{#TableView.onScroll}被调用时的回调函数.
-- 
-- 当@{#TableView.onScroll}被调用时，会调用
-- ```func(obj, scroll_status, itemIndex, views, diff, totalOffset)```。
-- 其中：
-- 
-- * ```obj``` 调用@{#TableView.setOnItemClick}时传进来的参数```obj```。
-- * ```#number scroll_status``` 状态值，其取值可以是下面其中一个。
-- 
--      * [```kScrollerStatusStart```](core.constants.html#kScrollerStatusStart)
--      * [```kScrollerStatusMoving```](core.constants.html#kScrollerStatusMoving)
--      * [```kScrollerStatusStop```](core.constants.html#kScrollerStatusStop)
--
--      详见:@{ui.scrollableNode#ScrollableNode.onScroll}。
--      
-- * ```#number itemIndex``` 当前子控件索引。
-- * ```#list<core.drawing#DrawingBase> views``` 一个数组。当前所有的子控件。
-- * ```#number diff``` 详见:@{ui.scrollableNode#ScrollableNode.onScroll}。
-- * ```#number totalOffset``` 详见@{ui.scrollableNode#ScrollableNode.onScroll}。
-- @param self
-- @param obj  任意类型。
-- @param func 回调函数。
TableView.setOnScroll = function(self, obj, func)
    self.m_scrollCallback.obj = obj;
    self.m_scrollCallback.func = func;
end

---
-- 设置当前显示哪一项.
-- 使用此方向可以让TableView滚动到指定位置.
--
-- @param self
-- @param #number index 要显示的那一项的索引。
TableView.setShowingIndex = function(self, index)
    local frameOffsetX,frameOffsetY = self:getFrameOffset();
    local lineIndex = math.ceil(index/self.m_nItemsPerLine) - 1;

    if self:hasScroller() then
        self:getScroller():setReboundFrames(0);
    end

    if self.m_direction == kVertical then
        local destDiff = lineIndex * self.m_itemLength + frameOffsetY;
        self:onEventDrag(kFingerDown, 0, self.m_diff, 0, 0);
        self:onEventDrag(KfingerUp, 0, -destDiff, 0, 0);
    else
        local destDiff = lineIndex * self.m_itemLength + frameOffsetX;
        self:onEventDrag(kFingerDown,self.m_diff, 0, 0, 0);
        self:onEventDrag(KfingerUp,-destDiff, 0, 0, 0);
    end

    if self:hasScroller() then
        self:getScroller():setReboundFrames();
    end
end

---
-- 析构函数.
-- 
-- 所有创建的节点、设置的adapter、都会被delete()。
-- 
TableView.dtor = function(self)
    TableView.releaseAllViews(self);

    delete(self.m_adapter);
    self.m_adapter = nil;
end

---------------------------------private functions-----------------------------------------

--virtual

---
-- Override @{ui.scrollableNode#ScrollableNode.reviseSize}.
-- 
-- **注：该函数被标记为“private function”，不建议直接调用该函数。**
--
-- @param self
TableView.reviseSize = function(self)
    ScrollableNode.reviseSize(self);
    TableView.setClip(self);
    TableView.requireAndShowViews(self,0);
end

---
-- Override @{ui.scrollableNode#ScrollableNode.revisePos}.
-- 
-- **注：该函数被标记为“private function”，不建议直接调用该函数。**
--
-- @param self
TableView.revisePos = function(self)
    ScrollableNode.revisePos(self);
    TableView.setClip(self);
end

---
-- Override @{ui.scrollableNode#ScrollableNode.getFrameLength}.
-- 
-- **注：该函数被标记为“private function”，不建议直接调用该函数。**
--
-- @param self
-- @return 返回容器控件的长度.详见： @{ui.scrollableNode#ScrollableNode.getFrameLength}.
TableView.getFrameLength = function(self)
    local unitLength = TableView.getUnitLength(self);
    local width,height = TableView.getSize(self);

    if self.m_direction == kVertical then
        return height - height % unitLength;
    else
        return width - width % unitLength;
    end
end

---
-- Override @{ui.scrollableNode#ScrollableNode.getViewLength}.
-- 
-- **注：该函数被标记为“private function”，不建议直接调用该函数。**
--
-- @param self
-- @return 返回子节点的长度.详见： @{ui.scrollableNode#ScrollableNode.getViewLength}.
TableView.getViewLength = function(self)
    return self.m_nTotalLines * self.m_itemLength;
end

---
-- Override @{ui.scrollableNode#ScrollableNode.getUnitLength}.
-- 
-- **注：该函数被标记为“private function”，不建议直接调用该函数。**
--
-- @param self
-- @return 返回单元的长度.详见： @{ui.scrollableNode#ScrollableNode.getUnitLength}.
TableView.getUnitLength = function(self)
    return self.m_autoAlignToItemEdge and self.m_itemLength or 1;
end

---
-- Override @{ui.scrollableNode#ScrollableNode.getFrameOffset}.
-- 
-- **注：该函数被标记为“private function”，不建议直接调用该函数。**
--
-- @param self
-- @return 返回滚动条的起始位置.详见： @{ui.scrollableNode#ScrollableNode.getFrameOffset}.
TableView.getFrameOffset = function(self)
    local width,height = TableView.getSize(self);
    if self.m_direction == kVertical then
        return (width - self.m_nItemsPerLine*self.m_itemEdgeLength)/2,
            (height - TableView.getFrameLength(self))/2;
    else
        return (width - TableView.getFrameLength(self))/2,
            (height - self.m_nItemsPerLine*self.m_itemEdgeLength)/2;
    end
end

---
-- Override @{ui.scrollableNode#ScrollableNode.needScroller}.
-- 
-- **注：该函数被标记为“private function”，不建议直接调用该函数。**
--
-- @param self
-- @return 返回是否需要通过 @{#ui.scroller#Scroller}来控制子节点的行为.详见： @{ui.scrollableNode#ScrollableNode.needScroller}.
TableView.needScroller = function(self)
    return TableView.hasAdapter(self);
end

---
-- 内容被改变或更改方向后重新计算每一项的高度.
-- **注：该函数被标记为“private function”，不建议直接调用该函数。**
--
-- @param self
TableView.updateItemLength = function(self)
    if not TableView.hasAdapter(self) then
        self.m_itemLength = 0;
        self.m_itemEdgeLength = 0;
        return
    end

    local view = self.m_adapter:getView(1);
    local itemWidth ,itemHeight = view:getSize();
    self.m_adapter:releaseView(view);

    if self.m_direction == kVertical then
        self.m_itemLength = itemHeight;
        self.m_itemEdgeLength = itemWidth;
    else
        self.m_itemLength = itemWidth;
        self.m_itemEdgeLength = itemHeight;
    end
end

---
-- 返回当前是否拥有@{ui.adapter#Adapter}对象.
-- 
-- **注：该函数被标记为“private function”，不建议直接调用该函数。**
--
-- @return #boolean 若当前拥有@{ui.adapter#Adapter}对象，则返回true；否则，返回false。
TableView.hasAdapter = function(self)
    return self.m_adapter ~= nil;
end

---
-- 回到初始状态，显示第一行控件.
-- 刚装入数据或方向改变后被调用.
--
-- **注：该函数被标记为“private function”，不建议直接调用该函数。**
--
-- @param self
TableView.initViews = function(self)
    self.m_views = {};
    self.m_beginIndex = 0;
    self.m_offset = 0;

    TableView.requireAndShowViews(self,0);
end

---
-- 把通过@{ui.adapter#Adapter}创建的所有子控件删除.
-- 
-- **注：该函数被标记为“private function”，不建议直接调用该函数。**
--
TableView.releaseAllViews = function(self)
    for _,v in ipairs(self.m_views) do
        TableView.removeChild(self,v);
        self.m_adapter:releaseView(v);
    end

    self.m_views = {};
end

---
-- 内容被改变或更改方向后重新计算行列信息.
-- **注：该函数被标记为“private function”，不建议直接调用该函数。**
--
-- @param self
TableView.updateLineInfo = function(self)
    if not TableView.hasAdapter(self) then
        self.m_nShowLines = 0;
        self.m_nItemsPerLine = 1;
        return
    end

    local width,height = TableView.getSize(self);
    self.m_nShowLines = math.ceil(TableView.getFrameLength(self) / self.m_itemLength);

    if self.m_isMultiItem then
        if self.m_direction == kVertical then
            self.m_nItemsPerLine = math.floor(width / self.m_itemEdgeLength);
        else
            self.m_nItemsPerLine = math.floor(height / self.m_itemEdgeLength);
        end
    else
        self.m_nItemsPerLine = 1;
    end

    local count = self.m_adapter:getCount();
    self.m_nTotalLines = math.ceil(count / self.m_nItemsPerLine);
    self.m_nShowLines = self.m_nTotalLines > self.m_nShowLines and self.m_nShowLines or self.m_nTotalLines;
end

---
-- 创建需要显示的view并显示出来.
-- **注：该函数被标记为“private function”，不建议直接调用该函数。**
-- 
-- @param self
-- @param #number diff 滑动的距离。
TableView.requireAndShowViews = function(self, diff)
    if not TableView.hasAdapter(self) then
        return
    end

    TableView.requestViews(self,diff);
    TableView.show(self);
end

---
-- 返回所给坐标位置所对应的子控件和在@{ui.adapter#Adapter}中的索引.
-- 
-- **注：该函数被标记为“private function”，不建议直接调用该函数。**
-- 
-- @param self
-- @param #number x X轴坐标（相对于@{#TableView}）。
-- @param #number y Y轴坐标（相对于@{#TableView}）。
-- @return ui.node#Node,#number 
--  第一个返回值，是(x,y)处的子控件；第二个返回值，是该子控件在@{ui.adapter#Adapter}中的索引。
TableView.getCurTouchViewAndIndex = function(self, x, y)
    local frameLength = self:getFrameLength();
    local frameOffsetX,frameOffsetY = self:getFrameOffset();
    local width,height = TableView.getSize(self);

    if x < frameOffsetX or y < frameOffsetY or x > width - frameOffsetX or y > height - frameOffsetY then
        return
    end

    local curPos = (self.m_direction == kVertical) and y or x;
    local frameOffset = (self.m_direction == kVertical) and frameOffsetY or frameOffsetX;
    local itemOffset = (self.m_direction == kVertical) and x or y;

    local diff = curPos - frameOffset - self.m_diff;
    if curPos < 0 or curPos > frameLength then
        return
    end

    local lineIndex = math.ceil(diff / self.m_itemLength);
    local itemIndex = math.ceil( (itemOffset - (frameOffsetX + frameOffsetY - frameOffset)) / self.m_itemEdgeLength);
    local index = (lineIndex-1)*self.m_nItemsPerLine + itemIndex;
    local view = self.m_views[index-self.m_beginIndex*self.m_nItemsPerLine];
    return view,index;
end

---
-- 生成需要显示的view.
-- **注：该函数被标记为“private function”，不建议直接调用该函数。**
--
-- @param self
-- @param #number diff 滚动的距离.
TableView.requestViews = function(self, diff)
    if self.m_nShowLines == 0 then
        return
    end

    local frameLength = self:getFrameLength();
    local viewLength = self:getViewLength();
    local itemLength = self.m_itemLength;

    self.m_diff = diff;

    local nShowLines = self.m_nShowLines;

    local index;
    if diff >= 0 then
        index = 0;
        self.m_offset = diff;
    elseif diff < frameLength - viewLength then
        index = self.m_nTotalLines - nShowLines;
        self.m_offset = diff + (self.m_nTotalLines- nShowLines)*itemLength;
    else
        index = math.floor(-diff/itemLength);
        self.m_offset = diff + index * itemLength;
        if index + nShowLines < self.m_nTotalLines then
            nShowLines = nShowLines +1;
        end
    end

    if index == self.m_beginIndex and math.ceil(#self.m_views/self.m_nItemsPerLine) == nShowLines then
        return
    end

    local itemDiff = (index - self.m_beginIndex) * self.m_nItemsPerLine;
    self.m_beginIndex = index;
    local beginItemIndex = index * self.m_nItemsPerLine;
    local nShowItems = nShowLines*self.m_nItemsPerLine;
    local temp = self.m_views;
    self.m_views = {};
    if itemDiff >= 0 then
        for i=itemDiff+1,#temp do
            self.m_views[i-itemDiff] = temp[i];
            temp[i] = nil;
        end
        for i=#self.m_views+1,nShowItems do
            self.m_views[i] = self.m_adapter:getView(i+beginItemIndex);
            if not self.m_views[i] then
                break;
            end
            TableView.addChild(self,self.m_views[i]);
        end
    else
        for i=1,nShowItems+itemDiff >= #temp and #temp or nShowItems+itemDiff do
            self.m_views[i-itemDiff] = temp[i];
            temp[i] = nil;
        end
        for i=1,-itemDiff do
            self.m_views[i] = self.m_adapter:getView(i+beginItemIndex);
            if not self.m_views[i] then
                break;
            end
            TableView.addChild(self,self.m_views[i]);
        end
        for i=#self.m_views+1,nShowItems do
            self.m_views[i] = self.m_adapter:getView(i+beginItemIndex);
            if not self.m_views[i] then
                break;
            end
            TableView.addChild(self,self.m_views[i]);
        end
    end
    for _,v in pairs(temp) do
        TableView.removeChild(self,v);
        self.m_adapter:releaseView(v);
    end
end

---
-- 刷新界面显示.
-- **注：该函数被标记为“private function”，不建议直接调用该函数。**
--
-- @param self
TableView.show = function(self)
    local frameOffsetX,frameOffsetY = self:getFrameOffset();

    local getScrollDirectionPos = function(i)
        return self.m_offset + self.m_itemLength*math.floor((i-1)/self.m_nItemsPerLine)
    end

    local getFixDirectionPos = function(i)
        return (i-1)%self.m_nItemsPerLine*self.m_itemEdgeLength;
    end

    if self.m_direction == kVertical then
        for i,view in ipairs(self.m_views) do
            view:setPos(frameOffsetX + getFixDirectionPos(i),
                frameOffsetY + getScrollDirectionPos(i));
        end
    else
        for i,view in ipairs(self.m_views) do
            view:setPos(frameOffsetX + getScrollDirectionPos(i),
                frameOffsetY + getFixDirectionPos(i));
        end
    end
end

---
-- Override @{core.drawing#DrawingBase.onEventTouch}.
-- 
-- 然而该函数什么都不做。
-- 
-- **注：该函数被标记为“private function”，不建议直接调用该函数。**
-- 
TableView.onEventTouch = function()

end

---
-- Override @{core.drawing#DrawingBase.onEventDrag}.
-- 
-- **注：该函数被标记为“private function”，不建议直接调用该函数。**
--
-- @param self
-- @param finger_action See @{core.drawing#DrawingBase.onEventDrag}.
-- @param x See @{core.drawing#DrawingBase.onEventDrag}.
-- @param y See @{core.drawing#DrawingBase.onEventDrag}.
-- @param drawing_id_first See @{core.drawing#DrawingBase.onEventDrag}.
-- @param drawing_id_current See @{core.drawing#DrawingBase.onEventDrag}.
-- @param #number event_time 当前事件的触发时间(单位：毫秒)。
TableView.onEventDrag =  function(self, finger_action, x, y, drawing_id_first, drawing_id_current,event_time)
    if TableView.hasScroller(self) then
        self.m_scroller:onEventTouch(finger_action,x,y,drawing_id_first,drawing_id_current,event_time);
    end

    if finger_action == kFingerDown then
        self.m_startX = x;
        self.m_startY = y;
    elseif finger_action ~= kFingerMove then
        if     math.abs(y-self.m_startY) < self.m_maxClickOffset
            and math.abs(x-self.m_startX) < self.m_maxClickOffset then

            if self.m_itemEventCallback.func and TableView.hasAdapter(self) then
                local localX,localY = TableView.convertSurfacePointToView(self,x,y);
                local view,index = TableView.getCurTouchViewAndIndex(self,localX,localY);

                if view then
                    local viewX,viewY = view:convertSurfacePointToView(x,y);
                    self.m_itemEventCallback.func(self.m_itemEventCallback.obj,self.m_adapter,view,index,viewX,viewY);
                end
            end
        end
    end
end

---
-- Override @{ui.scrollableNode#ScrollableNode.onScroll}.
-- 
-- **注：该函数被标记为“private function”，不建议直接调用该函数。**
--
-- @param self
-- @param scroll_status See @{ui.scrollableNode#ScrollableNode.onScroll}.
-- @param diff See @{ui.scrollableNode#ScrollableNode.onScroll}.
-- @param totalOffset See @{ui.scrollableNode#ScrollableNode.onScroll}.
-- @param isMarginRebounding See @{ui.scrollableNode#ScrollableNode.onScroll}.
TableView.onScroll = function(self, scroll_status, diff, totalOffset, isMarginRebounding)
    ScrollableNode.onScroll(self, scroll_status, diff, totalOffset, isMarginRebounding);

    TableView.requireAndShowViews(self,totalOffset);

    if self.m_scrollCallback.func then
        local itemIndex = self.m_beginIndex*self.m_nItemsPerLine + 1;
        self.m_scrollCallback.func(self.m_scrollCallback.obj,scroll_status,itemIndex,#self.m_views,diff,totalOffset);
    end
end

end
        

package.preload[ "ui.tableView" ] = function( ... )
    return require('ui/tableView')
end
            

package.preload[ "ui/tabView" ] = function( ... )
-- tabView.lua
-- Author: Vicent.Gong
-- Date: 2013-08-01
-- Last modification : 2013-08-05
-- Description: Implemented tabView

--------------------------------------------------------------------------------
-- TabView是一个可滚动的容器，
-- 内部使用单行或单列形式排列，每次显示一个，通过滑动操作显示下一个.
-- @module ui.tabView
-- @return #nil 
-- @usage require("ui/tabView")




require("core/constants");
require("core/object");
require("core/global");
require("ui/node");
require("ui/scrollableNode");

---
-- @type TabView
-- @extends ui.scrollableNode#ScrollableNode
TabView = class(ScrollableNode);

---
-- 构造函数.
--
-- @param self
-- @param #number x 容器相对于父节点的位置X坐标。详见：<a href="core.drawing.html#006">**引擎的子节点与父节点九种对齐方式和其相对位置.**</a>
-- @param #number y 容器相对于父节点的位置Y坐标。详见：<a href="core.drawing.html#006">**引擎的子节点与父节点九种对齐方式和其相对位置.**</a>
-- @param #number w 容器的宽度.不建议小于内部每一个tab的大小.
-- @param #number h 容器的高度.
TabView.ctor = function(self, x, y, w, h)
    super(self,kVertical,0);

    TabView.setPos(self,x,y);

    self.m_mainNode = new(Node);
    ScrollableNode.addChild(self,self.m_mainNode);

    TabView.setPos(self,x,y);
    TabView.setSize(self,w,h);

    TabView.setEventDrag(self,self,self.onEventDrag);
    TabView.setEventTouch(self,self,self.onEventTouch);

    self.m_tabs = {};
    self.m_curIndex = 1;
    self.m_tabChangedCallback = {};
end

---
-- 析构函数.
--
-- @param self
TabView.dtor = function(self)
    self.m_tabs = nil;
    self.m_mainNode = nil;
    self.m_tabChangedCallback = nil;
end

---
-- 添加一个tabItem.完全等同于@{#TabView.addChild}
--
-- @param self
-- @param core.drawing#DrawingBase node 节点。
TabView.addTab = function(self, node)
    TabView.addChild(self,node);
end

---
-- 移除一个tabItem.
--
-- @param self
-- @param core.drawing#DrawingBase node 要移除的tabItem。
TabView.removeTab = function(self, node)
    TabView.removeChild(self,node);
end

---
-- 通过name查找并移除一个tabItem.
-- 这个name是通过setName设置的.
--
-- @param self
-- @param #string name 节点名字。
TabView.removeTabByName = function(self, name)
    local node = TabView.getTabByName(self,name);
    if not node then
        return
    end
    TabView.removeTab(node);
end

---
-- 通过name查找一个tabItem.
--
-- @param self
-- @param #string name 节点名字。
-- @return core.drawing#DrawingBase 节点。
TabView.getTabByName = function(self, name)
    return TabView.getChildByName(self,name);
end

---
-- 通过index查找一个tabItem.
--
-- @param self
-- @param #number index 索引值。
-- @return core.drawing#DrawingBase 节点。
TabView.getTab = function(self, index)
    return self.m_tabs[index];
end

---
-- 设置一个tabItem切换的回调.
--
-- @param self
-- @param obj 任意类型。
-- @param #function func 回调函数，传入参数为```(obj, newIndex, oldIndex)```
-- 
-- * ```obj``` :调用的时候传入进来的参数。
-- 
-- * ```newIndex```:为当前选中的tabItem的index。
-- 
-- * ```oldIndex```:为改变之前的上一个index.
TabView.setTabChangedCallback = function(self, obj, func)
    self.m_tabChangedCallback.func = func;
    self.m_tabChangedCallback.obj = obj;
end

---
-- 获得当前选中的tab的index.
--
-- @param self
-- @param #number index 索引值。
TabView.getCurIndex = function(self)
    return self.m_curIndex;
end

---
-- Override @{ui.scrollableNode#ScrollableNode.setDirection}.
-- 
-- @param self
-- @param direction 子节点移动方向。详见： @{ui.scrollableNode#ScrollableNode.setDirection}.
TabView.setDirection = function(self, direction)
    if self.m_direction == direction then
        return
    end

    local frameLength = self:getFrameLength();
    if direction == kVertical then
        for i,v in ipairs(self.m_tabs) do
            v:setPos(0,(i-1)*frameLength);
        end
    else
        for i,v in ipairs(self.m_tabs) do
            v:setPos((i-1)*frameLength,0);
        end
    end

    ScrollableNode.setDirection(self,direction);
end

---
-- 完全等同于 @{#TabView.addTab}.
--
-- @param self
-- @param core.drawing#DrawingBase child 节点。
TabView.addChild = function(self, child)
    if not child then
        return
    end

    if self.m_direction == kVertical then
        child:setPos(0,self:getViewLength());
    else
        child:setPos(self:getViewLength(),0);
    end

    self.m_mainNode:addChild(child);
    local nTabs = #self.m_tabs;
    self.m_tabs[nTabs+1] = child;

    ScrollableNode.update(self);
    return nTabs + 1;
end

---
-- 完全等同于 @{#TabView.removeTab}.
--
-- @param self
-- @param core.drawing#DrawingBase child 节点。
TabView.removeChild = function(self, child)
    if not child then
        return
    end

    local index = TabView.getTabIndex(self, child);

    if not index then
        return
    end

    self.m_mainNode:removeChild(child);
    table.remove(self.m_tabs,index);

    if self.m_direction == kVertical then
        for i=index,#self.m_tabs do
            self.m_tabs[i]:setPos(0,(i-1)*self:getFrameLength());
        end
    else
        for i=index,#self.m_tabs do
            self.m_tabs[i]:setPos((i-1)*self:getFrameLength(),0);
        end
    end

    TabView.updateByRemoveChild(self);
end

---
-- 完全等同于 @{#TabView.getTabByName}.
--
-- @param self
-- @param #string child 需要查找的tabItem的名字。
-- @return core.drawing#DrawingBase 节点。
TabView.getChildByName = function(self, child)
    return self.m_mainNode:getChildByName(child);
end

---
-- 移除所有tabItem.
--
-- @param self
-- @param #boolean doCleanup 是否对所有tabItem执行delete操作.若doCleanup为true则执行；否则，不执行。
TabView.removeAllChildren = function(self, doCleanup)
    self.m_tabs = {};
    return self.m_mainNode:removeAllChildren(doCleanup);
end

---
-- 得到所有的tabItem.
--
-- @param self
-- @return #table 一个包含其所有tabItem的lua数组。
TabView.getChildren = function(self)
    return self.m_mainNode:getChildren();
end

---
-- 返回容器控件的长度..
-- **注：该函数被标记为“private function”，不建议直接调用该函数。**
--
-- @param self
-- @return #number 容器控件的长度。
TabView.getFrameLength = function(self)
    if self.m_direction == kVertical then
        return self.m_height;
    else
        return self.m_width;
    end
end

---
-- 返回子节点的长度.
-- **注：该函数被标记为“private function”，不建议直接调用该函数。**
--
-- @param self
-- @return #number 子节点长度。
TabView.getViewLength = function(self)
    if self.m_tabs then
        return #self.m_tabs * self:getFrameLength();
    else
        return 0;
    end
end

---
-- 完全等同于 @{#TabView.getFrameLength}。
--
-- @param self
-- @return #number 容器控件的长度.
TabView.getUnitLength = function(self)
    return self:getFrameLength();
end

---
-- 得到每项的间距.
-- 这里直接返回0。
--
-- @param self
-- @return #number 直接返回0.
TabView.getFrameOffset = function(self)
    return 0;
end

---
-- 需要滚动.
--
-- @param self
-- @return #boolean 直接返回true。
TabView.needScroller = function(self)
    return true;
end

---
-- 不需要滚动条.
--
-- @param self
-- @return #boolean 直接返回false。
TabView.needScrollBar = function(self)
    return false;
end

---------------------------------private functions-----------------------------------------

---
-- 通过tabItem得到index.
-- **注：该函数被标记为“private function”，不建议直接调用该函数。**
--
-- @param self
-- @param core.drawing#DrawingBase node 节点。
-- @return #number 索引值。
TabView.getTabIndex = function(self, node)
    local index;
    for k,v in pairs(self.m_tabs) do
        if v == node then
            index = k;
            break;
        end
    end

    return index;
end

---
-- 通过name查找tabItem的index.
--
-- @param self
-- @param #string name 要查找的tabItem的name。
-- @return #number index 索引值。
TabView.getTabIndexByName = function(self, name)
    local node = TabView.getChildByName(name);
    if not node then
        return nil;
    end

    return TabView.getTabIndex(self,node);
end

---
-- 处理触摸事件.
-- **注：该函数被标记为“private function”，不建议直接调用该函数。**
TabView.onEventTouch = function()

end

---
-- 处理触摸事件.
-- **注：该函数被标记为“private function”，不建议直接调用该函数。**
-- @param self
-- @param #number finger_action 手指事件 。取值：[```kFingerDown```](core.constants.html#kFingerDown)（手指下压事件）、[```kFingerMove```](core.constants.html#kFingerMove)（手指移动事件）、[```kFingerUp```](core.constants.html#kFingerUp)（手指抬起事件）、[```kFingerCancel```](core.constants.html#kFingerCancel)（特殊情况）。
-- @param #number x 屏幕x绝对坐标。
-- @param #number y 屏幕y绝对坐标。
-- @param #number drawing_id_first 手指按下时选中的drawing的id。
-- @param #number drawing_id_current 当前手指按下的drawing的id。
-- @param #number event_time 当前事件的触发时间(单位：毫秒)。
TabView.onEventDrag =  function(self, finger_action, x, y, drawing_id_first, drawing_id_current,event_time)
    if TableView.hasScroller(self) then
        self.m_scroller:onEventTouch(finger_action,x,y,drawing_id_first,drawing_id_current,event_time);
    end
end

---
-- 处理触摸事件.
-- 覆盖 @{ui.scrollableNode#ScrollableNode.onScroll}
--
-- **注：该函数被标记为“private function”，不建议直接调用该函数。**
--
-- @param self
-- @param #number scroll_status See @{ui.scroller#Scroller.setScrollCallback}.
-- @param #number diff See @{ui.scroller#Scroller.setScrollCallback}.
-- @param #number totalOffset See @{ui.scroller#Scroller.setScrollCallback}.
-- @param #boolean isMarginRebounding See @{ui.scroller#Scroller.setScrollCallback}.
TabView.onScroll = function(self, scroll_status, diff, totalOffset)
    ScrollableNode.onScroll(self, scroll_status, diff, totalOffset);

    if self.m_direction == kVertical then
        self.m_mainNode:setPos(0,totalOffset);
    else
        self.m_mainNode:setPos(totalOffset,0);
    end

    if scroll_status == kScrollerStatusStop then
        local lastIndex = self.m_curIndex;
        self.m_curIndex = math.floor(totalOffset/self:getFrameLength()) + 1;
        if self.m_tabChangedCallback.func then
            self.m_tabChangedCallback.func(self.m_tabChangedCallback.obj,
                                        self.m_curIndex,lastIndex);
        end
    end
end



---
-- 删除一个child后更新滚动节点.
-- 
-- **注：该函数被标记为“private function”，不建议直接调用该函数。**
TabView.updateByRemoveChild = function (self)
    local frameLength = self:getFrameLength();
    local viewLength = self:getViewLength();

    if not (self:needScroller()
        and ScrollableNode.isAllLengthVaild(self)
        and viewLength >= frameLength) then
       
        ScrollableNode.releaseScroller(self);
        return
    end

    if ScrollableNode.hasScroller(self) then
        local frameLength = self:getFrameLength();
        local viewLength = self:getViewLength();
        local unitLength = self:getUnitLength();
        self.m_scroller:setFrameLength(frameLength);
        self.m_scroller:setViewLength(viewLength);
        self.m_scroller:setUnitLength(unitLength);
        self.m_scroller:stopMarginRebounding();
    else
        ScrollableNode.createScroller(self);
    end

    ScrollableNode.updateScrollBar(self);
end

end
        

package.preload[ "ui.tabView" ] = function( ... )
    return require('ui/tabView')
end
            

package.preload[ "ui/text" ] = function( ... )
-- text.lua
-- Author: Vicent Gong
-- Date: 2012-09-24
-- Last modification : 2013-06-24
-- Description: Implement a single line text

--------------------------------------------------------------------------------
-- 这个模块提供了单行文本控件的实现。
--
-- @module ui.text
-- @return #nil 
-- @usage require("ui/text")


require("core/constants");
require("core/object");
require("core/res");
require("core/drawing");
require("core/gameString");

---
-- @{#Text} 为单行文本控件，通过本类创建的文本强制为单行，指定宽高不足时会自动扩展到文本显示所需宽高.
-- 
-- @type Text
-- @extends core.drawing#DrawingImage
Text = class(DrawingImage,false);

---
--
-- 构造函数.
--
-- @param self
-- @param #string str 要显示的文本。
-- @param #number width 宽。若为nil或false，则默认为0。
-- @param #number height 高。若为nil或false，则默认为0。
-- @param #number align 文本的对齐方式，其值可以是以下的任意一个：
--
-- * [```kAlignCenter```](core.constants.html#kAlignCenter) 
-- * [```kAlignTop```](core.constants.html#kAlignTop) 
-- * [```kAlignTopRight```](core.constants.html#kAlignTopRight)
-- * [```kAlignRight```](core.constants.html#kAlignRight)
-- * [```kAlignBottomRight```](core.constants.html#kAlignBottomRight)
-- * [```kAlignBottom```](core.constants.html#kAlignBottom)
-- * [```kAlignBottomLeft```](core.constants.html#kAlignBottomLeft)
-- * [```kAlignLeft```](core.constants.html#kAlignLeft)
-- * [```kAlignTopLeft```](core.constants.html#kAlignTopLeft)
-- 
-- @param #string fontName 字体名称。
-- @param #number fontSize 文字大小。
-- @param #number r 文字颜色，RGB的R分量。范围0-255。
-- @param #number g 文字颜色，RGB的G分量。范围0-255。
-- @param #number b 文字颜色，RGB的B分量。范围0-255。
Text.ctor = function(self, str, width, height, align, fontName, fontSize, r, g, b)
    self.m_str = Text.convert2SafeString(self,str);
    local platformstr = Text.convert2SafePlatformString(self,self.m_str);

    width = width or 0;
    height = height or 0;

    self.m_res = new(ResText,platformstr,width,height,align,fontName,fontSize,r,g,b,kTextSingleLine);
    super(self,self.m_res);
end

---
-- 替换当前的文字.
-- 
-- 当前控件的大小也跟着文字大小进行变化。
-- 
-- @param self
-- @param #string str 要替换的新文字。
-- @param #number width 为文字指定默认的宽。
-- @param #number height 为文字指定默认的高。
-- @param #number r 文字颜色，RGB的R分量。范围0-255。
-- @param #number g 文字颜色，RGB的G分量。范围0-255。
-- @param #number b 文字颜色，RGB的B分量。范围0-255。
Text.setText = function(self, str, width, height, r, g, b)
    self.m_str = Text.convert2SafeString(self,str);
    local platformstr = Text.convert2SafePlatformString(self, self.m_str);

    self.m_res:setText(platformstr,width,height,r,g,b);
    Text.addImage(self,self.m_res,0); 
    Text.setSize(self,self.m_res:getWidth(),self.m_res:getHeight());
end

--- 
-- 返回当前文字。
-- 
-- @return #string 当前文字。
Text.getText = function(self)
    return self.m_str;
end

---
-- 析构函数.
Text.dtor = function(self)
    delete(self.m_res);
    self.m_res = nil;
end


---------------------------------private functions-----------------------------------------

---
-- 根据情况返回一个字符串.
-- 
-- **注：该函数被标记为“private function”，不建议直接调用该函数。**
-- 
-- @param self
-- @param #string str 一个字符串。
-- @return #string 若 str 为空字符串，或者为 false，或者为 nil，则返回 ```" "```；否则，返回 ```str```。
Text.convert2SafeString = function(self, str)
    str = (str == "" or not str) and " " or str;
    return str;
end

---
-- 将字符串转换为当前平台“安全”的字符串.
-- 
-- **注：该函数被标记为“private function”，不建议直接调用该函数。**
-- @param self
-- @param #string str 一个字符串。
-- @return #string 平台安全的字符串。若为空字符串，或者为 false，或者为 nil，则返回 ```" "```。
Text.convert2SafePlatformString = function(self, str)
    str = (str == "" or not str) and " " or str;
    local platformStr = GameString.convert2Platform(str);
    platformStr = (platformStr == "" or not platformStr) and " " or platformStr;

    return platformStr;
end

Text.isValid = function(self)
    return self.m_res and self.m_res:isValid()
end

end
        

package.preload[ "ui.text" ] = function( ... )
    return require('ui/text')
end
            

package.preload[ "ui/textView" ] = function( ... )
-- textView.lua
-- Author: Vicent Gong
-- Date: 2012-09-24
-- Last modification : 2013-07-05
-- Description: Implement a multi-line text,if needed it will scroll

--------------------------------------------------------------------------------
-- 可滚动的多行文本.
-- @module ui.textView
-- @return #nil 
-- @usage require("ui/textView")


require("core/constants");
require("core/object");
require("core/res");
require("core/drawing");
require("core/gameString");
require("ui/scrollableNode");

---
-- TextView是一个可以滚动的多行文本.
-- 
-- @type TextView
-- @extends ui.scrollableNode#ScrollableNode
TextView = class(ScrollableNode,false);

---默认的默认滚动条宽度的值。
TextView.s_defaultScrollBarWidth = 8;


---
-- 默认的滚动条宽度.
-- 
-- @field [parent=#TextView] #number s_scrollBarWidth

---
-- 设置滚动条的宽度的默认值.
--
-- @param #number width 滚动条的宽度。
TextView.setDefaultScrollBarWidth = function(width)
    TextView.s_scrollBarWidth = width or TextView.s_defaultScrollBarWidth;
end

---
-- 构造函数.
--
-- @param self
-- @param #string str 要显示的文本。
-- @param #number width 宽度.若为nil或false，则默认为0。
-- @param #number height 高度.若为nil或false，则默认为0。
-- @param #number align 文本的对齐方式，其值可以是以下的任意一个：
--
-- * [```kAlignCenter```](core.constants.html#kAlignCenter) 
-- * [```kAlignTop```](core.constants.html#kAlignTop) 
-- * [```kAlignTopRight```](core.constants.html#kAlignTopRight)
-- * [```kAlignRight```](core.constants.html#kAlignRight)
-- * [```kAlignBottomRight```](core.constants.html#kAlignBottomRight)
-- * [```kAlignBottom```](core.constants.html#kAlignBottom)
-- * [```kAlignBottomLeft```](core.constants.html#kAlignBottomLeft)
-- * [```kAlignLeft```](core.constants.html#kAlignLeft)
-- * [```kAlignTopLeft```](core.constants.html#kAlignTopLeft)
-- 
-- @param #string fontName 字体名称。
-- @param #number fontSize 文字大小。
-- @param #number r 文字颜色，RGB的R分量。范围0-255。
-- @param #number g 文字颜色，RGB的G分量。范围0-255。
-- @param #number b 文字颜色，RGB的B分量。范围0-255。
TextView.ctor = function(self, str, width, height, align, fontName, fontSize, r, g, b)
    super(self,kVertical,self.s_scrollBarWidth or self.s_defaultScrollBarWidth)

    self.m_str = TextView.convert2SafeString(self,str);
    local platformstr = TextView.convert2SafePlatformString(self,self.m_str);

    self.m_res = new(ResText,platformstr,width or 0, height or 0,align,fontName,fontSize,r,g,b,kTextMultiLines);
    self.m_drawing = new(DrawingImage,self.m_res);

    local drawingW,drawingH = self.m_drawing:getSize();

    TextView.setSize(self,width or drawingW,(not height or height == 0) and drawingH or height);

    TextView.addChild(self,self.m_drawing);

    TextView.setEventTouch(self,self,self.onEventTouch);

    TextView.update(self);
end

---
-- 设置滚动条的宽度.
--
-- @param self
-- @param #number width 滚动条的宽度。
TextView.setScrollBarWidth = function(self, width)
    width = width
            or self.s_scrollBarWidth
            or self.s_defaultScrollBarWidth;

    ScrollableNode.setScrollBarWidth(self,width);
end

---
-- 替换当前的文字.
-- @param self
-- @param #string str 要替换的新文字。 以下参数均为可选，如果传入nil，则使用当前值.
-- @param #number width 为文字指定默认的宽。
-- @param #number height 为文字指定默认的高。
-- @param #number r 文字颜色，RGB的R分量。范围0-255。
-- @param #number g 文字颜色，RGB的G分量。范围0-255。
-- @param #number b 文字颜色，RGB的B分量。范围0-255。
TextView.setText = function(self, str, width, height, r, g, b)
    self.m_str = TextView.convert2SafeString(self,str);
    local platformstr = TextView.convert2SafePlatformString(self,self.m_str);
    local w,h = TextView.getSize(self);

    width = width or w;
    height = height or h;

    self.m_res:setText(platformstr,width,height,r,g,b);
    self.m_drawing.addImage(self.m_drawing,self.m_res,0);
    self.m_drawing:setSize(self.m_res:getWidth(),self.m_res:getHeight());

    local drawingW,drawingH = self.m_drawing:getSize();
    TextView.setSize(self,width,(height == 0) and drawingH or height);
    local x,y = TextView.getUnalignPos(self);
    local w,h = TextView.getSize(self);
	TextView.setClip(self,x,y,w,h);

    TextView.update(self);
end

---
-- 获得文字内容.
--
-- @param self
-- @return #string 当前的文字内容。
TextView.getText = function(self)
    return self.m_str;
end

---
-- 析构函数.
-- 
-- @param self
TextView.dtor = function(self)
    delete(self.m_res);
    self.m_res = nil;
end

-------------------------------private functions ----------------------------------------------------
--virtual

---
-- Override @{ui.scrollableNode#ScrollableNode.getFrameLength}.
-- 
-- **注：该函数被标记为“private function”，不建议直接调用该函数。**
--
-- @param self
-- @return #number 容器控件的长度。
TextView.getFrameLength = function(self)
    local w,h = TextView.getSize(self);
    if self.m_direction == kVertical then
        return h;
    else
        return w;
    end
end

---
-- Override  @{ui.scrollableNode#ScrollableNode.getViewLength}.
-- **注：该函数被标记为“private function”，不建议直接调用该函数。**
--
-- @param self
-- @return #number 子节点的长度。
TextView.getViewLength = function(self)
    if not self.m_drawing then
        return 0;
    end

    local dw,dh = self.m_drawing:getSize();

    if self.m_direction == kVertical then
        return dh;
    else
        return dw;
    end
end

---
-- Override  @{ui.scrollableNode#ScrollableNode.getUnitLength}.
-- **注：该函数被标记为“private function”，不建议直接调用该函数。**
-- 
-- @param self
-- @return number 单元的长度。
TextView.getUnitLength = function(self)
    return 1;
end

---
-- Override  @{ui.scrollableNode#ScrollableNode.needScroller}.
-- **注：该函数被标记为“private function”，不建议直接调用该函数。**
--
-- @param self
-- @return #boolean 是否需要通过 @{#ui.scroller#Scroller}来控制子节点的行为。
TextView.needScroller = function(self)
    return true;
end

---
-- Override  @{ui.scrollableNode#ScrollableNode.getFrameOffset}.
-- **注：该函数被标记为“private function”，不建议直接调用该函数。**
--
-- @param self
-- @return #number  滚动条的起始位置。
TextView.getFrameOffset = function(self)
    return 0;
end

---
-- Override  @{ui.scrollableNode#ScrollableNode.getFrameOffset}.
-- **注：该函数被标记为“private function”，不建议直接调用该函数。**
-- 
-- @param self
-- @param #number scroll_status See @{ui.scroller#Scroller.setScrollCallback}.
-- @param #number diffY See @{ui.scroller#Scroller.setScrollCallback}.
-- @param #number totalOffset See @{ui.scroller#Scroller.setScrollCallback}.
TextView.onScroll = function(self, scroll_status, diffY, totalOffset)
    ScrollableNode.onScroll(self,scroll_status,diffY,totalOffset);

    self.m_drawing:setPos(nil,totalOffset);
end

---
-- 处理触摸事件.
-- **注：该函数被标记为“private function”，不建议直接调用该函数。**
-- 
-- @param self
-- @param #number finger_action 手指事件 。取值：[```kFingerDown```](core.constants.html#kFingerDown)（手指下压事件）、[```kFingerMove```](core.constants.html#kFingerMove)（手指移动事件）、[```kFingerUp```](core.constants.html#kFingerUp)（手指抬起事件）、[```kFingerCancel```](core.constants.html#kFingerCancel)（特殊情况）。
-- @param #number x 屏幕x绝对坐标。
-- @param #number y 屏幕y绝对坐标。
-- @param #number drawing_id_first 手指按下时选中的drawing的id。
-- @param #number drawing_id_current 当前手指按下的drawing的id。
-- @param #number event_time 当前事件的触发时间(单位：毫秒)。
TextView.onEventTouch =  function(self, finger_action, x, y, drawing_id_first, drawing_id_current,event_time)
    if not TextView.hasScroller(self) then return end
    self.m_scroller:onEventTouch(finger_action,x,y,drawing_id_first,drawing_id_current,event_time);
end

---
-- 为了可靠性，过滤掉值为nil的string.
-- **注：该函数被标记为“private function”，不建议直接调用该函数。**
--
-- @param self
-- @param #string str 需要过滤掉nil的string。
-- @return #string 已过滤掉nil的string。
TextView.convert2SafeString = function(self, str)
    str = (str == "" or not str) and " " or str;
    return str;
end

---
-- 将字符串转换为对应平台的编码.
-- **注：该函数被标记为“private function”，不建议直接调用该函数。**
--
-- @param self
-- @param #string str 需要做转换的字符串。
-- @return #string 转码后的文字.
TextView.convert2SafePlatformString = function(self, str)
    str = (str == "" or not str) and " " or str;
    local platformStr = GameString.convert2Platform(str);
    platformStr = (platformStr == "" or not platformStr) and " " or platformStr;

    return platformStr;
end

end
        

package.preload[ "ui.textView" ] = function( ... )
    return require('ui/textView')
end
            

package.preload[ "ui/toast" ] = function( ... )
-- toast.lua
-- Author: Vicent.Gong
-- Date: 2013-08-01
-- Last modification : 2013-08-01
-- Description: Implemented toast

--------------------------------------------------------------------------------
-- 一个轻量级的文字提示框.
-- @module ui.toast
-- @return #nil 
-- @usage require("ui/toast")



require("core/object");
require("ui/text");
require("ui/textView");
require("core/anim");

---
-- Taost是一个简单的文字提示框.
-- 显示在屏幕中间，一段时间后消失，类似于Android里的Toast
-- 
-- @type Toast
Toast = class();

---
--默认的默认显示时长.
Toast.s_defaultDisplayTime = 1500; -- millsecond

---
--默认的默认背景图。
Toast.s_defaultBgImage = "ui/toast_bg.png";

---
--默认的留白宽度。
Toast.s_defaultSpaceW = 20;

---
--默认的留白高度。
Toast.s_defaultSpaceH = 10;

local s_instance = nil

---
-- 获得单例.
--
-- @return #Toast
Toast.getInstance = function()
    if not s_instance then
        s_instance = new(Toast);
    end
    return s_instance;
end

---
-- 释放单例.
Toast.releaseInstance = function()
    delete(s_instance);
    s_instance = nil;
end

---
-- 默认显示时长。
-- 
-- @field [parent=#Toast] #number s_displayTime 

---
-- 设置默认显示时长.
-- 
-- @param #number millsecond 显示时长(毫秒)。
Toast.setDefaultDisplayTime = function(millsecond)
    Toast.s_displayTime = millsecond or Toast.s_defaultDisplayTime;
end

---
-- 默认字体名字。
-- 
-- @field [parent=#Toast] #string s_fontName 

---
-- 默认字体字号。
-- 
-- @field [parent=#Toast] #number s_fontSize 

---
-- 设置默认文字字体和字号.
--
-- @param #string fontName 字体名字。
-- @param #number fontSize 字体字号。
Toast.setDefaultFontNameAndSize = function(fontName, fontSize)
    Toast.s_fontName = fontName;
    Toast.s_fontSize = fontSize;
end

---
-- 默认文字颜色，RGB的R分量.
-- 
-- @field [parent=#Toast] #number s_r 

---
-- 默认文字颜色，RGB的G分量.
-- 
-- @field [parent=#Toast] #number s_g 

--- 
-- 文字颜色，RGB的B分量.
-- 
-- @field [parent=#Toast] #number s_b 

---
-- 设置默认文字颜色.
--
-- @param #number r 文字颜色，RGB的R分量。范围0-255。
-- @param #number g 文字颜色，RGB的G分量。范围0-255。
-- @param #number b 文字颜色，RGB的B分量。范围0-255。
Toast.setDefaultColor = function(r, g, b)
    Toast.s_r = r;
    Toast.s_g = g;
    Toast.s_b = b;
end

---
-- 设置默认背景图片.
-- 如果不设置，默认值为 `ui/toast_bg.png`。
--
-- @param #string bgImg 背景图片地址。
Toast.setDefaultImage = function(bgImg)
    Toast.s_defaultBgImage = bgImg or Toast.s_defaultBgImage;
end

---
-- 构造函数.
--
-- @param self
Toast.ctor = function(self)
    self.m_typeMap = {};
end

---
-- 显示单行文字.
--
-- @param self
-- @param #string str 要显示的文本。
-- @param #number width 宽。
-- @param #number height 高。 
-- @param #number align 文本的对齐方式，其值可以是以下的任意一个：
--
-- * [```kAlignCenter```](core.constants.html#kAlignCenter) 
-- * [```kAlignTop```](core.constants.html#kAlignTop) 
-- * [```kAlignTopRight```](core.constants.html#kAlignTopRight)
-- * [```kAlignRight```](core.constants.html#kAlignRight)
-- * [```kAlignBottomRight```](core.constants.html#kAlignBottomRight)
-- * [```kAlignBottom```](core.constants.html#kAlignBottom)
-- * [```kAlignBottomLeft```](core.constants.html#kAlignBottomLeft)
-- * [```kAlignLeft```](core.constants.html#kAlignLeft)
-- * [```kAlignTopLeft```](core.constants.html#kAlignTopLeft)
-- 
-- @param #string fontName 字体名称。
-- @param #number fontSize 文字大小。
-- @param #number r 文字颜色，RGB的R分量。范围0-255。
-- @param #number g 文字颜色，RGB的G分量。范围0-255。
-- @param #number b 文字颜色，RGB的B分量。范围0-255。
Toast.showText = function(self, str, width, height, align, fontName, fontSize, r, g, b)
    local view = new(Text,str,width,height,align or kAlignLeft,
        fontName or Toast.s_fontName,fontSize or Toast.s_fontSize,
        r or Toast.s_r,g or Toast.s_g,b or Toast.s_b);

    local w,h = view:getSize();
    local bg = self:loadTextBg(w,h);
    bg:addChild(view);
    view:setAlign(kAlignCenter);

    Toast.show(self,bg);
end


---
-- 显示多行文字.
--
-- @param self
-- @param #string str 要显示的文本。
-- @param #number width 宽。
-- @param #number height 高。 
-- @param #number align 文本的对齐方式，其值可以是以下的任意一个：
--
-- * [```kAlignCenter```](core.constants.html#kAlignCenter) 
-- * [```kAlignTop```](core.constants.html#kAlignTop) 
-- * [```kAlignTopRight```](core.constants.html#kAlignTopRight)
-- * [```kAlignRight```](core.constants.html#kAlignRight)
-- * [```kAlignBottomRight```](core.constants.html#kAlignBottomRight)
-- * [```kAlignBottom```](core.constants.html#kAlignBottom)
-- * [```kAlignBottomLeft```](core.constants.html#kAlignBottomLeft)
-- * [```kAlignLeft```](core.constants.html#kAlignLeft)
-- * [```kAlignTopLeft```](core.constants.html#kAlignTopLeft)
-- 
-- @param #string fontName 字体名称。
-- @param #number fontSize 文字大小。
-- @param #number r 文字颜色，RGB的R分量。范围0-255。
-- @param #number g 文字颜色，RGB的G分量。范围0-255。
-- @param #number b 文字颜色，RGB的B分量。范围0-255。
Toast.showTextView = function(self, str, width, height, align, fontName, fontSize, r, g, b)
    local view = new(TextView,str,width,height,align,fontName,fontSize,r,g,b);

    local bg = self:loadTextBg(width, height);
    bg:addChild(view);
    view:setAlign(kAlignCenter);

    Toast.show(self,bg);
end

---
-- 显示一个自定义view.
-- 注册自定义view见 @{#Toast.registerView}.
--
-- @param self
-- @param viewType view的类型，传入与 @{#Toast.registerView} 注册时相同的值.
-- @param ... 创建view的需要的参数。
Toast.showView = function(self, viewType, ...)
    if not (viewType and self.m_typeMap[viewType]) then
        Toast.hidden(self);
        return
    end

    local view = self.m_typeMap[viewType](...);
    Toast.show(self,view);
end

---
-- 注册一个自定义view.
--
-- @param self
-- @param viewType view的类型，可以是任意值，但建议使用string或class.
-- @param #function viewFunc 通过此函数来创建一个view的实例.例：
--
--      Toast.getInstance():registerView("Image", function(file)
--          return new(Image,file)
--      end)
--
--      Toast.getInstance():showView("Image", "commmon/ddz.png")
Toast.registerView = function(self, viewType, viewFunc)
    if not (viewType and viewFunc) then
        return
    end
    self.m_typeMap[viewType] = viewFunc;
end

---
-- 隐藏toast.
--
-- @param self
Toast.hidden = function(self)
    Toast.stopTimer(self);

    delete(self.m_view);
    self.m_view = nil;
end

---
-- 析构函数.
-- 
-- @param self
Toast.dtor = function(self)
    self.m_typeMap = nil;
end

-------------------------------private functions ----------------------------------------------------

---
-- 开始显示.
-- **注：该函数被标记为“private function”，不建议直接调用该函数。**
--
-- @param self
-- @param core.drawing#DrawingBase view 节点。
Toast.show = function(self, view)
    Toast.hidden(self);

    if not view then
        return
    end

    self.m_view = view;
    self.m_view:addToRoot();
    self.m_view:setAlign(kAlignCenter);
    Toast.startTimer(self);
end

---
-- 启动一个定时器，结束后删除view.
-- **注：该函数被标记为“private function”，不建议直接调用该函数。**
--
-- @@param self
Toast.startTimer = function(self)
    self.m_timer = new(AnimDouble,kAnimNormal,0,1,Toast.s_displayTime or Toast.s_defaultDisplayTime,-1);
    self.m_timer:setEvent(self,Toast.onTimer);
end

---
-- 停止计时器.
-- **注：该函数被标记为“private function”，不建议直接调用该函数。**
--
-- @param self
Toast.stopTimer = function(self)
    delete(self.m_timer);
    self.m_timer = nil;
end

---
-- 定时器被触发.
-- **注：该函数被标记为“private function”，不建议直接调用该函数。**
--
-- @param self
Toast.onTimer = function(self)
    Toast.hidden(self);
end

---
-- 加载文字背景.
-- **注：该函数被标记为“private function”，不建议直接调用该函数。**
--
-- @param self
-- @param #number w 背景宽度。
-- @param #number h 背景高度。
Toast.loadTextBg = function(self,w,h)
    local bg = new(Image,Toast.s_defaultBgImage,nil,nil,25,25,0,0);
    local bg_w,bg_h = bg:getSize();
    local tempW,tempH = w+Toast.s_defaultSpaceW*2,h+Toast.s_defaultSpaceH*2;

    bg_w = tempW > bg_w and tempW or bg_w;
    bg_h = tempH > bg_h and tempH or bg_h;
    bg:setSize(bg_w,bg_h);

    return bg;
end

end
        

package.preload[ "ui.toast" ] = function( ... )
    return require('ui/toast')
end
            

package.preload[ "ui/uiConfig" ] = function( ... )
-- uiConfig.lua
-- Author: Vicent Gong
-- Date: 2013-06-27
-- Last modification : 2013-06-27
-- Description: Global configs for ui

--------------------------------------------------------------------------------
-- 用于对ui的一些默认选项进行设置.
-- @module ui.uiConfig
-- @return #nil 
-- @usage require("ui/uiConfig")



require("core/object");

require("ui/checkBox");
require("ui/radioButton");
require("ui/editText");
require("ui/editTextView");
require("ui/tableView");
require("ui/viewPager");
require("ui/listView");
require("ui/scrollView");
require("ui/scrollBar");
require("ui/scroller");
require("ui/slider");
require("ui/switch");

---
-- @type UIConfig
UIConfig = class();

---
-- 设置checkbox的默认图片.
-- 同@{ui.checkBox#CheckBox.setDefaultImages}
--
-- @param #string unCheckedFile 未选中状态.
-- @param #string checkedFile 选中状态.
UIConfig.setCheckBoxImages = function(unCheckedFile, checkedFile)
    CheckBox.setDefaultImages({unCheckedFile,checkedFile});
end

---
-- 设置radiobutton的默认图片.
-- 同@{ui.radioButton#RadioButton.setDefaultImages}.
--
-- @param #string unCheckedFile 未选中状态.
-- @param #string checkedFile 选中状态.
UIConfig.setRadioButtonImages = function(unCheckedFile, checkedFile)
    RadioButton.setDefaultImages({unCheckedFile,checkedFile});
end


---
-- 设置输入框的默认提示文字.
-- 同@{ui.editText#EditText.setDefaultHintText}
-- 
-- @param #string hintText 提示文字的颜色。
-- @param #number r 提示文字的RGB颜色的R分量。
-- @param #number g 提示文字的RGB颜色的G分量。
-- @param #number b 提示文字的RGB颜色的B分量。
UIConfig.setEditTextHintText = function(hintText, r, g, b)
    EditText.setDefaultHintText(hintText,r,g,b);
end

---
-- 设置输入框设置默认最大点击距离.
-- 同@{ui.editText#EditText.setDefaultMaxClickOffset}
-- 
-- @param #number maxClickOffset 默认最大点击距离。
UIConfig.setEditTextMaxClickOffset = function(maxClickOffset)
    EditText.setDefaultMaxClickOffset(maxClickOffset);
end

---
-- 设置EditTextView的默认提示文字极其颜色.
-- 同@{ui.editTextView#EditTextView.setDefaultHintText}
-- @param #string hintText 提示文字的颜色。
-- @param #number r 提示文字的RGB颜色的R分量。
-- @param #number g 提示文字的RGB颜色的G分量。
-- @param #number b 提示文字的RGB颜色的B分量。
UIConfig.setEditTextViewHintText = function(hintText, r, g, b)
    EditTextView.setDefaultHintText(hintText,r,g,b);
end

---
-- 设置EditTextView默认最大点击距离.
-- 同@{ui.editTextView#EditTextView.setDefaultMaxClickOffset}
-- 
-- @param #number maxClickOffset 默认最大点击距离。
UIConfig.setEditTextViewMaxClickOffset = function(maxClickOffset)
    EditTextView.setDefaultMaxClickOffset(maxClickOffset);
end

---
-- 设置TableView默认的滚动条宽度.
-- 同@{ui.tableView#TableView.setDefaultScrollBarWidth}
-- 
-- @param #number width 默认滚动条宽度。
UIConfig.setTableViewScorllBarWidth = function(width)
    TableView.setDefaultScrollBarWidth(width);
end

---
-- 设置TableView的默认最大点击距离.
-- 同@{ui.tableView#TableView.setDefaultMaxClickOffset}
--
-- @param #number maxClickOffset 最大点击距离。
UIConfig.setTableViewMaxClickOffset = function(maxClickOffset)
    TableView.setDefaultMaxClickOffset(maxClickOffset);
end

---
-- 设置ListView默认的滚动条宽度.
-- 同@{ui.listView#ListView.setDefaultScrollBarWidth}
-- 
-- @param #number width 滚动条的宽度。
UIConfig.setListViewScrollBarWidth = function(width)
    ListView.setDefaultScrollBarWidth(width);
end

---
-- 设置ListView的最大点击距离.
-- 同@{ui.listView#ListView.setDefaultMaxClickOffset}
--
-- @param #number maxClickOffset 最大点击距离。
UIConfig.setListViewMaxClickOffset = function(maxClickOffset)
    ListView.setDefaultMaxClickOffset(maxClickOffset);
end

---
-- 设置ViewPager的默认滚动条宽度.
-- 同@{ui.viewPager#ViewPager.setDefaultScrollBarWidth}
-- 
-- @param #number width 宽度的默认值.
UIConfig.setViewPagerScrollBarWidth = function(width)
    ViewPager.setDefaultScrollBarWidth(width);
end

---
-- 设置ViewPaer的默认最大点击距离.
-- 同@{ui.viewPager#ViewPager.setDefaultMaxClickOffset}
--
-- @param #number maxClickOffset 最大点击距离。
UIConfig.setViewPagerMaxClickOffset = function(maxClickOffset)
    ViewPager.setDefaultMaxClickOffset(maxClickOffset);
end

---
-- 设置ScrollView的默认的滚动条宽度.
-- 同@{ui.scrollView#ScrollView.setDefaultScrollBarWidth}
--
-- @param #number width 默认滚动条宽度。
UIConfig.setScrollViewScrollBarWidth = function(width)
    ScrollView.setDefaultScrollBarWidth(width);
end


---
-- 设置滚动条默认背景图片.
-- 同 @{ui.scrollBar#ScrollBar.setDefaultImage}
--
-- @param #string filePath 图片路径。
UIConfig.setScrollBarImage = function(filePath)
    ScrollBar.setDefaultImage(filePath);
end

---
-- 设置滚动条默认消失时间.
-- 同 @{ui.scrollBar#ScrollBar.setDefaultInvisibleTime}
--
-- @param #number time 显示时间。
UIConfig.setScrollBarInvisibleTime = function(time)
    ScrollBar.setDefaultInvisibleTime(time);
end

---
-- 设置滚动条的默认最小长度.
-- 同@{ui.scrollBar#ScrollBar.setDefaultSmallestLength}
--
-- @param #number smallestLength 滚动条最小长度。
UIConfig.setScrollBarSmallestLength = function(smallestLength)
    ScrollBar.setDefaultSmallestLength(smallestLength);
end

---
-- 设置默认惯性滚动的帧数.
-- 同@{ui.scroller#Scroller.setDefaultFlippingFrames}
--
-- @param #number flippingFrames 惯性滚动帧数。
UIConfig.setScrollerFlippingFrames = function(flippingFrames)
    Scroller.setDefaultFlippingFrame(flippingFrames);
end

---
-- 设置滑动速度因子.
-- 同@{ui.scroller#Scroller.setDefaultFlippingSpeedFactor}
--
-- @param #number flippingSpeedFactor 滑动速度因子。
UIConfig.setScrollerFlippingSpeedFactor = function(flippingSpeedFactor)
    Scroller.setDefaultFlippingSpeedFactor(flippingSpeedFactor);
end

---
-- 设置滚动默认滑动停止点.
-- 同@{ui.scroller#Scroller.setDefaultFlippingOverFactor}
--
-- @param #number flippingOverFactor 滑动停止点。
UIConfig.setScrollerFlippingOverFactor = function(flippingOverFactor)
    Scroller.setDefaultFlippingOverFactor(flippingOverFactor);
end

---
-- 设置默认回弹帧数.
-- 同@{ui.scroller#Scroller.setDefaultReboundFrames}
--
-- @param #number reboundFrames 回弹帧数。
UIConfig.setScrollerReboundFrames = function(reboundFrames)
    Scroller.setDefaultReboundFrames(reboundFrames);
end

---
-- 设置默认单元调整因子.
-- 同@{ui.scroller#Scroller.setDefaultUnitTurningFactor}
--
-- @param #number unitTurningFactor 单元调整因子。
UIConfig.setScrollerUnitTurningFactor = function(unitTurningFactor)
    Scroller.setDefaultUnitTurningFactor(unitTurningFactor);
end

---
-- 设置slider的图片.
-- 同@{ui.slider#Slider.setDefaultImages}
--
-- @param #string bgImage 背景图片路径。
-- @param #string fgImage 前景图片路径。
-- @param #string buttonImage 按钮图片路径。
UIConfig.setSliderImages = function(bgImage, fgImage, buttonImage)
    Slider.setDefaultImages(bgImage,fgImage,buttonImage);
end

---
-- 设置switch的图片.
-- 同@{ui.switch#Switch.setDefaultImages}
--
-- @param #string onFile “开”状态的背景图片。
-- @param #string offFile “关”状态的背景图片。
-- @param #string buttonFile 按钮图片。
UIConfig.setSwitchImages = function(onFile, offFile, buttonFile)
    Switch.setDefaultImages(onFile,offFile,buttonFile);
end

end
        

package.preload[ "ui.uiConfig" ] = function( ... )
    return require('ui/uiConfig')
end
            

package.preload[ "ui/version" ] = function( ... )
--返回UI版本号

return '3.0(b61e11d1c4593980b5e0532fe0ea2ac0aa204be0)'

end
        

package.preload[ "ui.version" ] = function( ... )
    return require('ui/version')
end
            

package.preload[ "ui/viewPager" ] = function( ... )
-- ViewPager.lua
-- Author: Vicent.Gong
-- Date: 2012-09-27
-- Last modification : 2013-07-01
-- Description: Implemented ViewPager

--------------------------------------------------------------------------------
-- ViewPager是一个单页的滚动控件.
-- @module ui.viewPager
-- @return #nil 
-- @usage require("ui/viewPager")


require("core/constants");
require("core/object");
require("ui/tableView");

---
-- 
-- @type ViewPager
-- @extends ui.tableView#TableView
ViewPager = class(TableView,false);

---
-- 默认的滚动条的宽度.
-- 
-- @field [parent=#ViewPager] #number s_scrollBarWidth

---
-- 默认的最大点击距离.
-- 
-- @field [parent=#ViewPager] #number s_maxClickOffset

---
-- 设置滚动条宽度的默认值.
-- 
-- @param #number width 宽度的默认值.
ViewPager.setDefaultScrollBarWidth = function(width)
    ViewPager.s_scrollBarWidth = width or TableView.s_defaultScrollBarWidth;
end

---
-- 设置最大点击距离。
-- 详见: @{ui.tableView#TableView.setDefaultMaxClickOffset} .
--
-- @param #number maxClickOffset 最大点击距离。
ViewPager.setDefaultMaxClickOffset = function(maxClickOffset)
    ViewPager.s_maxClickOffset = maxClickOffset or TableView.s_defaultMaxClickOffset;
end

---
-- 构造函数.
-- @param self
-- @param #number x 控件相对于父节点的位置X坐标。详见：<a href="core.drawing.html#006">**引擎的子节点与父节点九种对齐方式和其相对位置.**</a>
-- @param #number y 控件相对于父节点的位置Y坐标。详见：<a href="core.drawing.html#006">**引擎的子节点与父节点九种对齐方式和其相对位置.**</a>
-- @param #number w 容器的宽.宽和高应该大于内部内容每一项的大小，否则内容将显示不全.
-- @param #number h 容器的高.
ViewPager.ctor = function(self, x, y, w, h)
    ViewPager.setDefaultScrollBarWidth(0);
    super(self,x,y,w,h,true);
    ViewPager.setDirection(self,kHorizontal);

    self.m_curPage = 0;
    TableView.setOnScroll(self,self,self.onViewScroll);

    self.m_pageChangedCallback = {};
end

---
-- 设置当前显示哪一页.
--
-- @param self
-- @param #number pageIndex 页的索引。
ViewPager.setPage = function(self, pageIndex)
    if not pageIndex or pageIndex < 0 or self.m_curPage == pageIndex then
        return
    end
    local pageLength = self:getUnitLength(self);
    local scroller = ViewPager.getScroller(self);
    scroller:setOffset(-pageLength * (pageIndex-1));
end

---
-- 获得当前显示的页码号.
--
-- @param self
-- @return #number currentIndex 页的索引值。
ViewPager.getCurPage = function(self)
    return self.m_curPage;
end

---
-- 设置一个页面改变的回调.
--
-- @param self
-- @param obj 任意类型。
-- @param #function func 回调函数，传入参数为```(obj, currentIndex, lastIndex)```
-- 
-- * ```obj``` :调用的时候传入进来的参数。
-- 
-- * ```currentIndex```:为当前选中的tabItem的index。
-- 
-- * ```lastIndex```:为改变之前的上一个index.
ViewPager.setOnPageChanged = function(self,obj,func)
    self.m_pageChangedCallback.obj = obj;
    self.m_pageChangedCallback.func = func;
end


---------------------------------private functions-----------------------------------------


---
-- 空方法体，无任何效果.
-- 此方法是为了禁止调用者重新设置onScroll监听。
--
-- **注：该函数被标记为“private function”，不建议直接调用该函数。**
ViewPager.setOnScroll = function(self)

end

---
-- 处理滚动事件.
-- **注：该函数被标记为“private function”，不建议直接调用该函数。**
-- @param self
-- @param scroll_status See @{ui.scrollableNode#ScrollableNode.onScroll}.
-- @param beginIndex 开始滑动时的index.
-- @param nViews 子控件节点.
-- @param nFrameViews 容器节点.
ViewPager.onViewScroll = function(self, scroll_status, beginIndex, nViews, nFrameViews)
    if scroll_status ~= kScrollerStatusStop then
        return
    end

    if beginIndex == self.m_curPage then
        return
    end

    local lastPage = self.m_curPage;
    self.m_curPage = beginIndex;

    if self.m_pageChangedCallback.func then
        self.m_pageChangedCallback.func(self.m_pageChangedCallback.obj,self.m_curPage,lastPage);
    end
end

end
        

package.preload[ "ui.viewPager" ] = function( ... )
    return require('ui/viewPager')
end
            
require("ui.adapter");
require("ui.button");
require("ui.checkBox");
require("ui.editText");
require("ui.editTextView");
require("ui.gridView");
require("ui.groupNode");
require("ui.image");
require("ui.images");
require("ui.listView");
require("ui.node");
require("ui.radioButton");
require("ui.scrollableNode");
require("ui.scrollBar");
require("ui.scroller");
require("ui.scrollView");
require("ui.slider");
require("ui.switch");
require("ui.tableView");
require("ui.tabView");
require("ui.text");
require("ui.textView");
require("ui.toast");
require("ui.uiConfig");
require("ui.version");
require("ui.viewPager");