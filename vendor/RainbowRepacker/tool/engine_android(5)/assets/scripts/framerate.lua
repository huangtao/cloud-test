-- framerate.lua
-- Description: require this lua file to show fps in left-top screen.

require("core/constants");
require("core/system")


local Framerate = {}

local __show = function (fps)
	local resNum = System.getResNum();
	local animNum = System.getAnimNum();
	local propNum = System.getPropNum();
	local drawingNum = System.getDrawingNum();
	local textureMemory = System.getTextureMemory(); --所有纹理大小
	local memorySize = System.getMemory(); --内存大小

	local color_tag = Color(255,0,0);
	local color_num = Color(0,0,255);
    if not Framerate.s_label then
        return;
    end
	Framerate.s_label:set_data{
		{
			text = "fps:",
			color = color_tag;
		},
		{
			text = fps,
			color = color_num;
		},
		-- {
		-- 	text = "animNum:",
		-- 	color = color_tag;
		-- },
		-- {
		-- 	text = animNum,
		-- 	color = color_num;
		-- },
		-- {
		-- 	text = "propNum:",
		-- 	color = color_tag;
		-- },
		-- {
		-- 	text = string.concat(propNum, "\n"),
		-- 	color = color_num,
		-- },
		{
			text = "drawingNum:",
			color = color_tag;
		},
		{
			text = drawingNum,
			color = color_num;
		},
		{
			text = "textureMemory:",
			color = color_tag;
		},
		{
			text =  string.format("%dM", math.ceil(textureMemory/1024/1024)),
			color = color_num;
		},
		{
			text = "memorySize:",
			color = color_tag;
		},
		{
			text = string.format("%dM", math.ceil(memorySize/1024/1024)),
			color = color_num,
		},
		{
			text = "LuaMemory:",
			color = color_tag;
		},
		{
			text = string.format("%dM", collectgarbage("count")/1024),
			color = color_num,
		},
	}
end

function Framerate.show_fps(_DEBUG)
	if not _DEBUG then
		return;
	end

    if not Framerate.s_label then
        Framerate.s_label = Label();
        Window.instance().root:add(Framerate.s_label);
    end
	local fps = 0;
	local time = 0;
	Clock.instance():schedule( function(dt) 
	 	time = time + dt;
        fps = fps + 1;
	 	if time > 2 then
            __show(0);
	 		fps = 0;
            time = 0;
            return;
	 	end
	 	if time > 1 then
            __show(fps);
            time = time - 1;
            fps = 0;
	 	end
	 end);
end

return Framerate;
