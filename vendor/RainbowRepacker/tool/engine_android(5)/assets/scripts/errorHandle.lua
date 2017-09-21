-- Data:2013-9-4
-- Description:程序入口 
-- Note:

require("coreex/systemex");
require("globalConfig");
require("core/sound");
local error = require(ViewPath.."common/error");
require("globalConstant");
require("util/log.lua");
function errorHandle(width,height)
	
	socket_room_close(-1);
	res_delete_group(-1);
	anim_delete_group(-1);
	prop_delete_group(-1);
	drawing_delete_all();
	Clock.instance():cancel_all();
	
	Sound.pauseMusic();
	System.setLayoutWidth(1280);
    System.setLayoutHeight(720);
	local errorScene = SceneLoader.load(error);
	local errorContent = errorScene:getChildByName("errorContent")
    local logBtn = errorScene:getChildByName("log_btn");
    local panda = errorScene:getChildByName("panda");
    local context1 = errorScene:getChildByName("context1");
    local context2 = errorScene:getChildByName("context2");
    local str = System.getLuaError();
    Log.writeLuaCrashError(str);
	errorContent:setText(str);
	if _DEBUG then
	    logBtn:setVisible(false);
	    panda:setVisible(false);
    	context1:setVisible(false);
    	context2:setVisible(false);
    else	
        errorContent:setVisible(false);
	end
	local errorBtn = errorScene:getChildByName("return_btn");
	errorBtn:setOnClick(nil,function()
        to_lua("main.lua");
	end);
    logBtn:setOnClick(nil,function()
        errorContent:setVisible(true);
    end)
end 