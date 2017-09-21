local invitational_pin_map = require("qnFiles/qnPlist/hall/invitational_pin");
local invitational_create_slide_keyboard=
{
	name="invitational_create_slide_keyboard",type=0,typeName="View",time=0,x=0,y=0,width=1280,height=720,visible=1,fillParentWidth=1,fillParentHeight=1,nodeAlign=kAlignCenter,
	{
		name="shieldBg",type=1,typeName="Image",time=0,x=-42,y=464,width=1280,height=720,visible=1,fillParentWidth=1,fillParentHeight=1,nodeAlign=kAlignTopLeft,file="hall/common/bg_shiled.png"
	},
	{
		name="contentView",type=0,typeName="View",time=0,x=-2,y=0,width=626,height=720,visible=1,fillParentWidth=0,fillParentHeight=1,nodeAlign=kAlignRight,
		{
			name="bg",type=1,typeName="Image",time=0,x=0,y=0,width=626,height=720,visible=1,fillParentWidth=1,fillParentHeight=1,nodeAlign=kAlignRight,file="hall/common/slide_bg.png"
		},
		{
			name="titleBg",type=1,typeName="Image",time=0,x=0,y=0,width=601,height=82,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTopRight,file=invitational_pin_map['tab_normal_bg.png'],
			{
				name="title",type=4,typeName="Text",time=0,x=0,y=0,width=601,height=82,visible=1,fillParentWidth=1,fillParentHeight=1,nodeAlign=kAlignCenter,fontSize=32,textAlign=kAlignCenter,colorRed=157,colorGreen=115,colorBlue=55,string=[[输入密码]],colorA=1
			}
		},
		{
			name="content",type=0,typeName="View",time=0,x=0,y=0,width=626,height=645,visible=1,fillParentWidth=1,fillParentHeight=0,nodeAlign=kAlignBottom,fillTopLeftY=75,fillTopLeftX=0,fillBottomRightX=0,fillBottomRightY=0
		}
	}
}
return invitational_create_slide_keyboard;