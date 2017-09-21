
package.preload[ "editorRT/sceneLoader" ] = function( ... )
SceneLoader = class();

SceneLoader.registLoadFunc = function(name, func)
	SceneLoader.loadFuncMap[name] = func;
end

SceneLoader.load = function(t)
	if type(t) ~= "table" then
		return;
	end

	local root;
	local isPreset = t.isPreset;
	root = SceneLoader.loadUI(t);
	if isPreset ~= 1 then
		for _,v in ipairs(t) do
			local node = SceneLoader.load(v);
			root:addChild(node);
		end
	end

	root:addToRoot();
	-- root:addToRoot();
	return root;
end


----------------------------private functions, don't use these functions in your code ------------------------

SceneLoader.loadUI = function(t)
	if t.isPreset == 1 then
		return SceneLoader.loadFuncMap["Preset"](t);
	end

	local node = SceneLoader.loadFuncMap[t.typeName](t);
	if node ~= nil and t.effect ~= nil and typeof(node, DrawingImage) then
		if t.effect["shader"] == "mirror" then
			if t.effect["mirrorType"] == 0 then
				node:setMirror(true,true);
			elseif t.effect["mirrorType"] == 1 then
				node:setMirror(true,false);
			elseif t.effect["mirrorType"] == 2 then
				node:setMirror(false,true);
			end
		elseif t.effect["shader"] == "gray" then
			local grayScale = require("libEffect.shaders.grayScale");
			grayScale.applyToDrawing(node,{intensity = 0});
		end
	end
	return node;
end

SceneLoader.loadButton = function(t)
	local node = new(Button,SceneLoader.getResPath(t,t.file),SceneLoader.getResPath(t,t.file2),nil,nil,t.gridLeft,t.gridRight,t.gridTop,t.gridBottom);
	SceneLoader.setBaseInfo(node,t);
	return node;
end

SceneLoader.loadImage = function(t)
	local node = new(Image,SceneLoader.getResPath(t,t.file),nil,nil,t.gridLeft,t.gridRight,t.gridTop,t.gridBottom);
	SceneLoader.setBaseInfo(node,t);
	return node;
end

SceneLoader.loadText = function(t)
	local node = new(Text,t.string,t.width,t.height,t.textAlign or t.align,"",t.fontSize,t.colorRed,t.colorGreen,t.colorBlue);
	node:setName(t.name or "");
	node:setDebugName(t.typeName);
	node:setPos(t.x,t.y);
	node:setAlign(t.nodeAlign);
	node:setVisible(t.visible==1 and true or false);
	return node;
end

SceneLoader.loadTextView = function(t)
	local node = new(TextView,t.string,t.width,t.height,t.textAlign or t.align,"",t.fontSize,t.colorRed,t.colorGreen,t.colorBlue);
	node:setName(t.name or "");
	node:setDebugName(t.typeName);
	node:setPos(t.x,t.y);
	node:setAlign(t.nodeAlign);
	node:setVisible(t.visible==1 and true or false);
	return node;
end

SceneLoader.loadEditText = function(t)
	local node = new(EditText,t.string,t.width,t.height,t.textAlign or t.align,"",t.fontSize,t.colorRed,t.colorGreen,t.colorBlue);
	node:setName(t.name or "");
	node:setDebugName(t.typeName);
	node:setPos(t.x,t.y);
	node:setAlign(t.nodeAlign);
	node:setVisible(t.visible==1 and true or false);
	return node;
end

SceneLoader.loadEditTextView = function(t)
	local node = new(EditTextView,t.string,t.width,t.height,t.textAlign or t.align,"",t.fontSize,t.colorRed,t.colorGreen,t.colorBlue);
	node:setName(t.name or "");
	node:setDebugName(t.typeName);
	node:setPos(t.x,t.y);
	node:setAlign(t.nodeAlign);
	node:setVisible(t.visible==1 and true or false);
	return node;
end

SceneLoader.loadNilNode = function(t)
	local node = new(Node);
	SceneLoader.setBaseInfo(node,t);
	return node;
end

SceneLoader.loadCheckBoxGroup = function(t)
	local node = new(CheckBoxGroup);
	SceneLoader.setBaseInfo(node,t);
	return node;
end

SceneLoader.loadCheckBox = function(t)
	local param;
	if t.file and t.file2 then
		param = {t.file,t.file2};
	end
	local node = new(CheckBox,param);
	SceneLoader.setBaseInfo(node,t);
	return node;
end

SceneLoader.loadRadioButtonGroup = function(t)
	local node = new(RadioButtonGroup);
	SceneLoader.setBaseInfo(node,t);
	return node;
end

SceneLoader.loadRadioButton = function(t)
	local param;
	if t.file and t.file2 then
		param = {t.file,t.file2};
	end
	local node = new(RadioButton,param);
	SceneLoader.setBaseInfo(node,t);
	return node;
end

SceneLoader.loadAutoScrollView = function(t)
	local node = new(ScrollView,t.x,t.y,t.width,t.height,true);
	SceneLoader.setBaseInfo(node,t);
	return node;
end

SceneLoader.loadScrollView = function(t)
	local node = new(ScrollView,t.x,t.y,t.width,t.height);
	SceneLoader.setBaseInfo(node,t);
	return node;
end

SceneLoader.loadSlider = function(t)
	local node = new(Slider,t.width,t.height,t.bgFile,t.fgFile,t.buttonFile);
	SceneLoader.setBaseInfo(node,t);
	return node;
end

SceneLoader.loadSwitch = function(t)
	local node = new(Switch,t.width,t.height,t.onFile,t.offFile,t.buttonFile);
	SceneLoader.setBaseInfo(node,t);
	return node;
end

SceneLoader.loadListView = function(t)
	local node = new(ListView,t.x,t.y,t.width,t.height);
	SceneLoader.setBaseInfo(node,t);
	return node;
end

SceneLoader.loadViewPager = function(t)
	local node = new(ViewPager,t.x,t.y,t.width,t.height);
	SceneLoader.setBaseInfo(node,t);
	return node;
end

SceneLoader.loadSwf = function(t)
	local swfInfoLua = require(t.swfInfoLua);
	local swfPinLua = require(t.swfPinLua);
	local node = new(SwfPlayer,swfInfoLua,swfPinLua);
	if t.swfAuto==1 then
		node:play(t.swfFrame,t.swfKeep == 1,t.swfRepeat,t.swfDelay,t.swfAutoClean==1);
	end
	SceneLoader.setBaseInfo(node,t);
	return node;
end

SceneLoader.loadPreset = function(t)
	t.isPreset = 0;
	local node;
	local success, fn = pcall(function () 
    	return require(t.preLuaPath)
	end)
	if success == true then
		node = fn(t);
	elseif t.preLuaPath ~= nil then
		t.isPreset = 1;
		error("get error at require "..t.preLuaPath)
	else
		node = SceneLoader.load(t);
	end
	t.isPreset = 1;
	return node;
end

SceneLoader.getResPath = function(t, filename)
	if not filename then
		return filename;
	end

	if type(filename) == "table" then
		return filename;
	end

	if not t.packFile then
		return filename;
	end

	local findName = function(str)
		local pos;
		local found = 0;
		while found do
			pos = found;
			found = string.find(str,"/",pos+1,true);
		end

		if not pos then
			pos = 0;
		end
		return string.sub(str,pos+1);
	end

	local tb = require(t.packFile);
	if type(tb) == "boolean" then
		local packFile = string.sub(t.packFile,1,string.find(t.packFile,".",1,true)-1);
		require(packFile);
		local pitchName = findName(filename);
		local packName = findName(packFile);
		return _G[string.format("%s_map",packName)][pitchName];
	end

	return tb[findName(filename)];
end

SceneLoader.getWH = function(t)
	local w = t.width and t.width>0 and t.width or nil;
	local h = t.height and t.height>0 and t.height or nil;
	return w,h;
end

SceneLoader.setBaseInfo = function(node, t)
	node:setDebugName(t.typeName);
	node:setName(t.name or "");
	local w = Widget.get_by_id(node.m_drawingID)
    if w then
        w.name = t.name;
		w.tag = t.typeName;
        print_string('w.name : ' .. tostring(w.name))
		print_string('w.typeName : ' .. tostring(t.typeName))
    end
	node:setFillParent(t.fillParentWidth==1 and true or false,
						t.fillParentHeight==1 and true or false);
	if t.fillTopLeftX or t.fillTopLeftY 
		or t.fillBottomRightX or t.fillBottomRightY then
		node:setFillRegion(true,t.fillTopLeftX or 0,t.fillTopLeftY or 0,
			t.fillBottomRightX or 0,t.fillBottomRightY or 0);
	end
	node:setPos(t.x,t.y);
	node:setAlign(t.nodeAlign);
	node:setSize(SceneLoader.getWH(t));
	node:setVisible(t.visible==1 and true or false);
end

SceneLoader.loadFuncMap = {
	["View"]				= SceneLoader.loadNilNode;
	["Button"]				= SceneLoader.loadButton;
	["Image"]				= SceneLoader.loadImage;
	["Text"]				= SceneLoader.loadText;
	["TextView"]			= SceneLoader.loadTextView;
	["EditText"]			= SceneLoader.loadEditText;
	["EditTextView"]		= SceneLoader.loadEditTextView;
	["CheckBoxGroup"]		= SceneLoader.loadCheckBoxGroup;
	["CheckBox"]			= SceneLoader.loadCheckBox;
	["RadioButtonGroup"]	= SceneLoader.loadRadioButtonGroup;
	["RadioButton"]			= SceneLoader.loadRadioButton;
	["AutoScrollView"]		= SceneLoader.loadAutoScrollView;
	["ScrollView"]			= SceneLoader.loadScrollView;
	["Slider"]				= SceneLoader.loadSlider;
	["Switch"]				= SceneLoader.loadSwitch;
	["ListView"]			= SceneLoader.loadListView;
	["ViewPager"]			= SceneLoader.loadViewPager;
	["Swf"]					= SceneLoader.loadSwf;
	["Preset"]              = SceneLoader.loadPreset;
};


end
        

package.preload[ "editorRT.sceneLoader" ] = function( ... )
    return require('editorRT/sceneLoader')
end
            

package.preload[ "editorRT/version" ] = function( ... )
--返回EditorRT版本号

return '3.0(b61e11d1c4593980b5e0532fe0ea2ac0aa204be0)'

end
        

package.preload[ "editorRT.version" ] = function( ... )
    return require('editorRT/version')
end
            
require("editorRT.sceneLoader");
require("editorRT.version");