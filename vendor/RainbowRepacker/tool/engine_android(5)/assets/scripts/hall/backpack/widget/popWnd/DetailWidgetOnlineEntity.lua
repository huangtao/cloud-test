-- DetailWidgetOnlineEntity.lua
-- Author:Demon
-- Date:2016/3/9
-- Last modification:
-- Description:线上实物详细信息界面
-- Note:
require("hall/backpack/data/backpackDataInterface");

local hallLayerBaseWithName = require("hall/widget/hallLayerBaseWithName")
local DetailWidgetOnlineEntity = class(hallLayerBaseWithName,false);
DetailWidgetOnlineEntity.s_layerName = "case_detail_online_entity";


DetailWidgetOnlineEntity.ctor = function(self,p_data)	
    local __layout = require(ViewPath .. "hall/newObjectCase/newObjectCaseOnlineEntity");
    super(self,__layout,nil,DetailWidgetOnlineEntity.s_layerName );
    self:declareLayoutVar(ViewPath.."hall/newObjectCase/newObjectCaseOnlineEntity".."_layout_var");
 
    self.m_data = p_data;
    self.m_localData = new(LocalPlayerInfoDict);

	self:setFillParent(true, true);
    self:addToRoot();

    self.m_maxLengthForEdit = 11;

    self:getHandle();
	self:init();
    self:setListenBackEvent(true);
end

DetailWidgetOnlineEntity.dtor = function(self)	

	delete(self.m_localData);

end

--得到相关句柄
DetailWidgetOnlineEntity.getHandle = function(self)
    self:getComponent();
    self:runUiAction(UiAnimConfig.ACTION.BEGIN, self.mm_ImageBack);
end	

DetailWidgetOnlineEntity.init = function(self)
	ImageCache.getInstance():request(self.m_data.iconPath,self,self.onGetImage);
    self.mm_Text_name:setText(self.m_data.name);
    local __commonFunction = require("hall/backpack/commonFunction/commonFunction");
    local __timeString = __commonFunction.getTimeString(self.m_data.expiresSec);
    self.mm_Text_day:setText(__timeString);
    
    local __phoneWidget = __commonFunction.createClientPhoneWidget();
    if not __phoneWidget then
        self.mm_View_clientPhone:setVisible(false);
    else
        self.mm_View_phoneNumber:addChild(__phoneWidget);
        local __w,__ = __phoneWidget:getSize();
        self.mm_phoneLogo:setPos(__w+5 ,nil);
    end

    --用历史手机号码赋值
    self:initEditTextByRecord();
end

--用历史记录的值给输入框赋值。
DetailWidgetOnlineEntity.initEditTextByRecord = function(self)
 
    local initEdit = function(p_edit,p_mode,p_length,p_record)
       p_edit:setInputMode(p_mode);
       p_edit:setMaxLength(p_length);
       --self.mm_EditText_phoneNum:setHintText(215,171,127);    
       p_edit:setText(p_record);
    end

    local record = self.m_localData:getValue("entity_name");   
    initEdit(self.mm_EditText_Name,kEditBoxInputModeSingleLine,18,record);

    local record = self.m_localData:getValue("entity_phone"); 
    initEdit(self.mm_EditText_Phone,kEditBoxInputModePhoneNumber,11,record);

    local record = self.m_localData:getValue("entity_addess"); 
    initEdit(self.mm_EditTextView_Address,kEditBoxInputModeSingleLine,36,record);
 
end

--检查输入的值是否符合要求
DetailWidgetOnlineEntity.checkAndGetPhoneNumber = function(self)
    
    local name = self.mm_EditText_Name:getText();
    name = string.trim(name," ");
    if name == "" or name == nil then
        local msg = "请输入正确的姓名";
	    Toast.getInstance():showText(msg, 50, 30, kAliginCenter, "", 24, 255, 255, 255);
		return false;
    end

    local phoneNumber = self.mm_EditText_Phone:getText();
    phoneNumber = string.trim(phoneNumber," ");
    if not (string.checkPhoneNumber(phoneNumber)) then
        local msg = "请输入正确的手机号码";
	    Toast.getInstance():showText(msg, 50, 30, kAliginCenter, "", 24, 255, 255, 255);
		return false;
    end

    local address = self.mm_EditTextView_Address:getText();
    address = string.trim(address," ");
    if address == "" or address == nil then
        local msg = "请输入正确的地址";
	    Toast.getInstance():showText(msg, 50, 30, kAliginCenter, "", 24, 255, 255, 255);
		return false;
    end

    self.m_localData:setValue("entity_phone",phoneNumber);
    self.m_localData:setValue("entity_name",name);
    self.m_localData:setValue("entity_addess",address);

    return name,address,phoneNumber;

end

DetailWidgetOnlineEntity.onGetImage = function(self,url,imagePath)
    local icon = UIFactory.createImage(imagePath);
    if icon then
        local w,h = self.mm_Image_icon:getSize();
        local iconW , iconH = icon:getSize();
        local scaleW = iconW>iconH and w or h*iconW/iconH;
        local scaleH = iconW>iconH and w*iconH/iconW or h;
        icon:setSize(scaleW,scaleH);
        icon:setAlign(kAlignCenter);
        self.mm_iconFrame:removeChild(self.mm_Image_icon,true);
        self.mm_iconFrame:addChild(icon);
        self.mm_Image_icon = icon;
    end
end



DetailWidgetOnlineEntity.oncloseBtnClick = function(self)
    self:close();
end

DetailWidgetOnlineEntity.onuseBtnClick = function(self)
    
    local name,phoneNumber,address = self:checkAndGetPhoneNumber();

    if name then
        --存下有效数据
        
        BackpackDataInterface.getInstance():getOnlineEntity(self.m_data);
        --self:oncloseBtnClick();
    end
end

 --调用拨打电话接口
DetailWidgetOnlineEntity.onBindToCallPhone = function(self,finger_action,x,y,drawing_id_first,drawing_id_current, event_time)
    if finger_action ==  kFingerUp then
        BackpackDataInterface.getInstance():callHotline();
    end
end




return DetailWidgetOnlineEntity;