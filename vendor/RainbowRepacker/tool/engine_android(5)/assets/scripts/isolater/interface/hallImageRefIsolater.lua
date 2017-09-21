
HallImageRefIsolater = class(DataInterfaceBase);

HallImageRefIsolater.getInstance = function()
    if not HallImageRefIsolater.s_instance then
        HallImageRefIsolater.s_instance = new(HallImageRefIsolater); 
    end
    return HallImageRefIsolater.s_instance;
end


--@brief 获取应用icon
HallImageRefIsolater.getAppIcon = function(self)
    return "hall/aboutus/logo.png";
end



