local login_pin_map = require("qnFiles/qnPlist/hall/login_pin");
local login_editText=
{
	name="login_editText",type=0,typeName="View",time=0,report=0,x=0,y=0,width=380,height=250,visible=1,fillParentWidth=1,fillParentHeight=1,nodeAlign=kAlignCenter,
	{
		name="editBg",type=1,typeName="Image",time=48156907,report=0,x=0,y=0,width=112,height=65,visible=1,fillParentWidth=1,fillParentHeight=0,nodeAlign=kAlignTopLeft,file="hall/common/input_bg_l25_r25_t25_b25.png",gridLeft=25,gridRight=25,gridTop=25,gridBottom=25,
		{
			name="phoneNum",type=6,typeName="EditText",time=48222468,report=0,x=20,y=0,width=300,height=60,visible=1,fillParentWidth=0,fillParentHeight=1,nodeAlign=kAlignLeft,fontSize=34,textAlign=kAlignLeft,colorRed=220,colorGreen=180,colorBlue=140
		}
	},
	{
		name="pullView",type=0,typeName="View",time=77341713,report=0,x=0,y=0,width=380,height=245,visible=1,fillParentWidth=1,fillParentHeight=0,nodeAlign=kAlignTop,
		{
			name="bg",type=1,typeName="Image",time=77341395,report=0,x=0,y=42,width=442,height=197,visible=1,fillParentWidth=1,fillParentHeight=0,nodeAlign=kAlignTopLeft,file=login_pin_map['pull_down_bg.png']
		},
		{
			name="listView",type=0,typeName="ListView",time=48225533,report=0,x=0,y=72,width=380,height=170,visible=1,fillParentWidth=1,fillParentHeight=0,nodeAlign=kAlignTopLeft
		}
	},
	{
		name="rightView",type=0,typeName="View",time=48678065,report=0,x=0,y=0,width=110,height=70,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTopRight,
		{
			name="deleteText",type=1,typeName="Image",time=48674712,report=0,x=0,y=0,width=35,height=34,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignLeft,file=login_pin_map['delete_s.png']
		},
		{
			name="deleteBtn",type=2,typeName="Button",time=48674840,report=0,x=0,y=0,width=55,height=70,visible=1,fillParentWidth=0,fillParentHeight=1,nodeAlign=kAlignLeft,file="hall/common/bg_blank.png"
		},
		{
			name="packUp",type=1,typeName="Image",time=48157053,report=0,x=65,y=0,width=32,height=23,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignLeft,file=login_pin_map['expand.png']
		},
		{
			name="triangleBtn",type=2,typeName="Button",time=48157410,report=0,x=55,y=0,width=55,height=55,visible=1,fillParentWidth=0,fillParentHeight=1,nodeAlign=kAlignLeft,file="hall/common/bg_blank.png"
		}
	}
}
return login_editText;