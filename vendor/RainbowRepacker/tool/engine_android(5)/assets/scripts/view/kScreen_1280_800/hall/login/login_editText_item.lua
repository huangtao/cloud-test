local login_pin_map = require("qnFiles/qnPlist/hall/login_pin");
local login_editText_item=
{
	name="login_editText_item",type=0,typeName="View",time=0,report=0,x=0,y=0,width=380,height=70,visible=1,fillParentWidth=1,fillParentHeight=1,nodeAlign=kAlignCenter,
	{
		name="lineIcon",type=1,typeName="Image",time=48158266,report=0,x=0,y=0,width=64,height=1,visible=1,fillParentWidth=1,fillParentHeight=0,nodeAlign=kAlignBottom,file="hall/common/split_line_h.png"
	},
	{
		name="selectIcon",type=1,typeName="Image",time=48158479,report=0,x=10,y=0,width=30,height=30,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignLeft,file=login_pin_map['select_icon.png']
	},
	{
		name="deleteIcon",type=1,typeName="Image",time=48158588,report=0,x=10,y=0,width=35,height=34,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignRight,file=login_pin_map['delete.png']
	},
	{
		name="phoneNumber",type=4,typeName="Text",time=48158737,report=0,x=50,y=0,width=143,height=29,visible=1,fillParentWidth=0,fillParentHeight=1,nodeAlign=kAlignLeft,fontSize=30,textAlign=kAlignLeft,colorRed=255,colorGreen=235,colorBlue=186,string=[[13652369465]]
	},
	{
		name="leftBtn",type=2,typeName="Button",time=48159364,report=0,x=0,y=0,width=1280,height=800,visible=1,fillParentWidth=1,fillParentHeight=1,nodeAlign=kAlignRight,file="hall/common/bg_blank.png"
	},
	{
		name="rightBtn",type=2,typeName="Button",time=48159583,report=0,x=0,y=0,width=50,height=800,visible=1,fillParentWidth=0,fillParentHeight=1,nodeAlign=kAlignRight,file="hall/common/bg_blank.png"
	}
}
return login_editText_item;