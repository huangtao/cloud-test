require("core/drawing");

WidgetBase.s_root = nil;

WidgetBase.s_rootNodes = {

};

local drawing_delete_all_ex = drawing_delete_all;
drawing_delete_all = function()
    drawing_delete_all_ex();
    WidgetBase.s_root = nil;
    WidgetBase.s_rootNodes = {};
end

local addToRoot = WidgetBase.addToRoot;
WidgetBase.__createRootNode = function()
    if not WidgetBase.s_root then
        WidgetBase.s_root = new(Node);
        WidgetBase.s_root:setSize(System.getScreenScaleWidth(), System.getScreenScaleHeight());
        table.insert(WidgetBase.s_rootNodes, WidgetBase.s_root);
        --WidgetBase.s_root:setParent();
		addToRoot(WidgetBase.s_root)
    end
end

WidgetBase.getRootNode = function()
    WidgetBase.__createRootNode();
    return WidgetBase.s_root;
end

WidgetBase.refreshRootNodeSize = function()
	WidgetBase.__createRootNode();
	WidgetBase.s_root:setSize(System.getScreenScaleWidth(), System.getScreenScaleHeight());
	WidgetBase.s_root:setPos(0,0);
end


local dtor = WidgetBase.dtor;
WidgetBase.dtor = function(self)
	if not self.m_parent then
        self:removeChildFromRoot(self);   
	end
    dtor(self);
end

--local addToRoot = WidgetBase.addToRoot;
WidgetBase.addToRoot = function(self)
	--addToRoot(self);
    WidgetBase.__createRootNode();
	WidgetBase.addChild(WidgetBase.s_root,self)
end

local addChild = WidgetBase.addChild;
WidgetBase.addChild = function(self, child)
	if not child then
		return
	end
	if not child.m_parent then
        self:removeChildFromRoot(child);   
    end
	addChild(self, child);
end


WidgetBase.removeChildFromRoot = function(self, child)
    local keys = {};
    for k, v in pairs(WidgetBase.s_rootNodes) do 
        if v == child then
            keys[1+#keys] = k;
        end
    end
    for i, key in pairs(keys) do 
        WidgetBase.s_rootNodes[key] = nil;
    end
end

local DrawingBaseDtor = DrawingBase.dtor;
DrawingBase.dtor = function(self)
    DrawingBaseDtor(self);
    self.m_outerPropsArr = nil; --此处不进行删除 只将其置为空 (如果这里删除会导致重复删除 会出问题！@@！@@@)
end

DrawingBase.getAlign = function(self)
	return self.m_align or kAlignTopLeft;
end

DrawingBase.setDebugNameByPropAndAnim = function(self, sequence , name)
	name = name or "";
	if self.m_props[sequence] then
		local prop = self.m_props[sequence]["prop"];
		if prop then
			prop:setDebugName(name);
			for _,v in pairs(self.m_props[sequence]["anim"]) do 
				if v then
					v:setDebugName(name);
				end
			end
		end
	end
end

DrawingBase.doAddProp = function(self, prop, sequence, ...)
    local anims = {select(1,...)};

    local ret = drawing_prop_add(self.m_drawingID, prop:getID(), sequence);
    if ret == 0 then 
        self.m_props[sequence] = {["prop"] = prop;["anim"] = anims};
        return true;
    else
        delete(prop);
        for _,v in pairs(anims) do 
            delete(v);
        end
        return false;
    end
end

DrawingBase.addProp = function(self, prop, sequence)
    self.m_outerPropsArr = self.m_outerPropsArr or {};
    table.insert(self.m_outerPropsArr, prop);

    local ret = drawing_prop_add(self.m_drawingID, prop:getID(), sequence);
    return ret == 0;
end

local grayShader = require("libEffect/shaders/grayScale")

DrawingImage.setGray = function (self, isGray)
	if isGray then
		grayShader.applyToDrawing(self, {intensity=0})
	else
		grayShader.applyToDrawing(self, {intensity=1})
	end
end

DrawingImage.addPropImageIndex = function(self, sequence, animType, duration, delay, startValue, endValue)
    return DrawingBase.addAnimProp(self, sequence, PropImageIndex, nil, nil, nil, animType, duration, delay, startValue, endValue);
end

DrawingImage.addPropClip = function(self, sequence, animType, duration, delay, startX, endX, startY, endY, startW, endW, startH, endH)
    return DrawingBase.addAnimProp(self, sequence, PropClip, nil, nil, nil, animType, duration, delay, startX, endX, startY, endY, startW, endW, startH, endH);
end
