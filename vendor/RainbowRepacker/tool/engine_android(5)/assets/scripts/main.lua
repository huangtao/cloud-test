function event_load(width,height)
    print_string("event_load", "width = ", width, " height = ", height);
	require("mainHandle");
	mainHandle(width,height);
end

function event_lua_error(width,height)
	require("errorHandle");
	errorHandle(width,height);
end 
