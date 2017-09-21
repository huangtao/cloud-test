-- DetailWidgetOnlineVirtual.lua
-- Author:Demon
-- Date:2016/3/9
-- Last modification:
-- Description:线上虚拟物品详细信息界面
-- Note:
require("hall/backpack/data/backpackDataInterface")

local hallLayerBaseWithName = require("hall/widget/hallLayerBaseWithName")
local DetailWidgetOnlineVirtual = class(hallLayerBaseWithName,false);
DetailWidgetOnlineVirtual.s_layerName = "case_detail_online_virtual";


DetailWidgetOnlineVirtual.ctor = function(self,p_data)	

    local __layout = require(ViewPath .. "hall/newObjectCase/newObjectCaseOnlineVirtual");
    super(self,__layout,nil,DetailWidgetOnlineVirtual.s_layerName );
    self:declareLayoutVar(ViewPath.."hall/newObjectCase/newObjectCaseOnlineVirtual".."_layout_var");
    self.m_data = p_data;
    self.m_localData = new(LocalPlayerInfoDict);

	self:setFillParent(true, true);
    self:addToRoot();

    self.m_maxLengthForEdit = 11;

    self:getHandle();
	self:init();
    self:setListenBackEvent(true);
end

DetailWidgetOnlineVirtual.dtor = function(self)	

	delete(self.m_localData);

end

--得到相关句柄
DetailWidgetOnlineVirtual.getHandle = function(self)
    self:getComponent();
    self:runUiAction(UiAnimConfig.ACTION.BEGIN, self.mm_ImageBack);
end	

DetailWidgetOnlineVirtual.init = function(self)
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
DetailWidgetOnlineVirtual.initEditTextByRecord = function(self)
    self.mm_EditText_phoneNum:setInputMode(kEditBoxInputModeNumeric);
    self.mm_EditText_phoneNum:setMaxLength(self.m_maxLengthForEdit);  
    local textPhoneNumber = self.m_localData:getValue("virtual_phone");      
    self.mm_EditText_phoneNum:setText(textPhoneNumber);

    self.mm_EditText_PhoneNumAgain:setInputMode(kEditBoxInputModeNumeric);
    self.mm_EditText_PhoneNumAgain:setMaxLength(self.m_maxLengthForEdit);   
    local textPhoneNumber = self.m_localData:getValue("virtual_phone");      
    self.mm_EditText_PhoneNumAgain:setText(textPhoneNumber);
end

--检查输入的值是否符合要求
DetailWidgetOnlineVirtual.checkAndGetPhoneNumber = function(self)
 
    --检查值本身是否正确
    local checkFormat = function(p_edit,msg_arg)
        local telStr = string.trim(p_edit:getText()," ");
       
        if telStr ~= "" then
		    local n = tonumber(telStr);
		    if not n then
			    local msg = msg_arg[1];
			    Toast.getInstance():showText(msg, 50, 30, kAliginCenter, "", 24, 255, 255, 255);
			    return false;
		    end

		    if not (string.checkPhoneNumber(telStr))  then
			    local msg = msg_arg[2];
			    Toast.getInstance():showText(msg, 50, 30, kAliginCenter, "", 24, 255, 255, 255);
		 	    return false;
		    end
            return telStr;
	    end
        local msg = msg_arg[3];
			Toast.getInstance():showText(msg, 50, 30, kAliginCenter, "", 24, 255, 255, 255);
        return false;
    end

    local msgFirst = {"请您输入数字","请输入11位中国大陆手机号","请输入11位中国大陆手机号"};
    local checkResult1 = checkFormat(self.mm_EditText_phoneNum,msgFirst);
    if not checkResult1 then
        return false;
    end

    local msgSecond = {"请您输入数字","请输入11位中国大陆手机号","请您再次输入"};
    local checkResult2 = checkFormat(self.mm_EditText_PhoneNumAgain,msgSecond);
    if not checkResult2 then
        return false;
    end

    --两次输入是否相同
    if checkResult1 ~= checkResult2 then
        local msg = "两次号码不一致，请重新输入";
		Toast.getInstance():showText(msg, 50, 30, kAliginCenter, "", 24, 255, 255, 255);
		return false;
    end

    --保存正确的数据
    self.m_localData:setValue("virtual_phone",checkResult1);

	return checkResult1;
end


DetailWidgetOnlineVirtual.onGetImage = function(self,url,imagePath)
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



DetailWidgetOnlineVirtual.oncloseBtnClick = function(self)
    self:close();
end

DetailWidgetOnlineVirtual.onuseBtnClick = function(self)
    
    local phoneNumber = self:checkAndGetPhoneNumber();

    if phoneNumber then
         BackpackDataInterface.getInstance():getPhoneCharge(self.m_data);
         --self:oncloseBtnClick();
    end
end

 --调用拨打电话接口
DetailWidgetOnlineVirtual.onBindToCallPhone = function(self,finger_action,x,y,drawing_id_first,drawing_id_current, event_time)

   if finger_action ==  kFingerUp then
        BackpackDataInterface.getInstance():callHotline();
   end
end


return DetailWidgetOnlineVirtual;
