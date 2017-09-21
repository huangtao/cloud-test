require("core/anim")
require("core/constants")  
require("core/dict")  
require("core/drawing")  
require("core/eventDispatcher")  
require("core/gameString")  
require("core/global")  
require("core/http")  
require("core/object")  
require("core/prop")  
require("core/res")   
require("core/socket")  
require("core/sound")   
require("core/system")
require("tmp")
require("custom")
require("util/TableLib")


function event_load ( width, height )
	anim_delete_group(-1);
	res_delete_group(-1);
	prop_delete_group(-1);
	drawing_delete_all();

	--regist load custom control function
	SceneLoader.registLoadFunc("CustomControl",editor_newCustom);

	SceneLoader.load(root);
end

function event_touch_raw ( finger_action, x, y, drawing_id)	  
 
end	  


-------------------------------------DrawingBase Interface---------------------------------------

function editor_setPos(obj, x, y)
	obj:setPos(x, y);
end

function editor_setSize(obj, w, h)
	obj:setSize(w, h);
end

function editor_setFillRegion(obj, doFill, topLeftX, topLeftY, bottomRightX, bottomRightY)
	obj:setFillRegion(doFill, topLeftX, topLeftY, bottomRightX, bottomRightY);
end

function editor_setAlign(obj,align)
	obj:setAlign(align);
end

function editor_setFillParent(obj, doFillParentWidth, doFillParentHeight)
	obj:setFillParent(doFillParentWidth, doFillParentHeight);
end

function editor_setColor(obj, r, g, b)
	obj:setColor(r, g, b);
end

function editor_setTransparency(obj, val)
	obj:setTransparency(val);
end

function editor_setVisible(obj, visible)
	obj:setVisible(visible);
end

function editor_setName(obj, name)
	obj:setName(name);
end

function editor_setLevel(obj, level)
	obj:setLevel(level);
end

function editor_addChild(obj, childObj)
	obj:addChild(childObj);
end

function editor_removeChild(obj,childObj)
	obj:removeChild(childObj,true);
end

-------------------------------------DrawingImage Interface--------------------------------------

function editor_setResRectPlain(obj, index, x, y, w, h)
	obj:setResRectPlain(index, x, y, w, h);
end

-------------------------------------Image Interface---------------------------------------------

function editor_setFile(obj, file, packFile)
	local t = {};
	if not(not packFile or packFile == "") then
		t.packFile = packFile;
	end

	local resPath = SceneLoader.getResPath(t,file);
	obj:setFile(resPath);
end

-------------------------------------Text Interface----------------------------------------------
function editor_setText(obj, str, width, height, r, g, b)
	obj:setText(str, width, height, r, g, b);
end


-------------------------------------RadioButtonGroup Interface----------------------------------
RadioButtonGroup.removeChild = function(self, item, doCleanup)
	if item == self.m_checkedButton then
		self.m_checkedButton = nil;
	end
	GroupNode.removeChild(self, item, doCleanup);
end
------------------------------------- C call function -------------------------------------------
-- 计算移动后坐标位置 参照DrawingBase.revisePos函数，逆计算
-- name:当前节点名称
-- moveX,moveY:屏幕显示相对父节点的相对坐标
-- return:实际相对父节点的相对坐标
function editor_calcSetPos(name, moveX, moveY)
	local node = _G[name];

	if node.m_fillRegion then-- or (node.m_fillParentWidth or node.m_fillParentHeight) then
		return moveX,moveY;
	end

	local parentW,parentH;

	local parent = DrawingBase.getParent(node);
	if not parent then
		parentW = System.getScreenWidth();
		parentH = System.getScreenHeight();
	else
		parentW,parentH = DrawingBase.getRealSize(parent);
	end

	local w,h = DrawingBase.getRealSize(node);

	local newX = moveX;
	local newY = moveY;

	if node.m_align == kAlignTopLeft then
	elseif node.m_align == kAlignLeft then
		newY = moveY - (parentH - h)/2;
	elseif node.m_align == kAlignBottomLeft then
		newY = -moveY + (parentH - h);
	elseif node.m_align == kAlignTopRight then
		newX = -moveX + (parentW - w);
	elseif node.m_align == kAlignRight then
		newX = -moveX + (parentW - w);
		newY = moveY - (parentH - h)/2;
	elseif node.m_align == kAlignBottomRight then
		newX = -moveX + (parentW - w);
		newY = -moveY + (parentH - h);
	elseif node.m_align == kAlignTop then
		newX = moveX - (parentW - w)/2;
	elseif node.m_align == kAlignCenter then
		newX = moveX - (parentW - w)/2;
		newY = moveY - (parentH - h)/2;
	elseif node.m_align == kAlignBottom then
		newX = moveX - (parentW - w)/2;
		newY = -moveY + (parentH - h);
	end

	return newX,newY;
end


-------------------------------------new Class Interface-----------------------------------------

function editor_newClass(t)
	if type(t) ~= "table" then
		return;
	end

	local node;
	if t.type > 0 then
		node = SceneLoader.loadUI(t);
	else
		node = SceneLoader.loadView(t);
	end

	local name = "editor" .. t.time;
	_G[name] = node;

	return node;
end


function editor_recreateClass(obj,t)
	local node = editor_newClass(t);

	local allChildren = obj:removeAllChildren(false);
	for _,v in pairs(allChildren) do 
		node:addChild(v);
	end

	local parent = DrawingBase.getParent(obj);
	if parent ~= nil then
		editor_removeChild(parent,obj);
		editor_addChild(parent,node);
	end

	return node;
end

function editor_newCustom(t)
	if type(t) ~= "table" then
		return;
	end

	local node;
	node = editor_loadCustom(t);

	local name = "editor" .. t.time;
	_G[name] = node;

	return node;
end

--bugfix, fix me with a better way
SceneLoader.load = function(t)
	if type(t) ~= "table" then
		return;
	end

	local root;
	if t.type > 0 then
		root = SceneLoader.loadUI(t);
	else
		root = SceneLoader.loadView(t);
	end

	local name = "editor" .. t.time;
	_G[name] = root;

	for _,v in ipairs(t) do
		local node = SceneLoader.load(v);
		root:addChild(node);
	end
	root:addToRoot();
	return root;
end