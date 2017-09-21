local invitational_pin_map = require("qnFiles/qnPlist/hall/invitational_pin");
local invitational_create_option_item=
{
	name="invitational_create_option_item",type=0,typeName="View",time=0,x=0,y=0,width=640,height=72,visible=1,nodeAlign=kAlignCenter,fillParentWidth=0,fillParentHeight=0,
	{
		name="str",type=4,typeName="Text",time=0,x=37,y=-2,width=200,height=32,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignLeft,fontSize=24,textAlign=kAlignRight,colorRed=133,colorGreen=74,colorBlue=5,colorA=1
	},
	{
		name="btn",type=1,typeName="Button",time=0,x=250,y=-2,width=280,height=50,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignLeft,file=invitational_pin_map['option_bg.png'],gridLeft=10,gridRight=10,gridTop=10,gridBottom=10,
		{
			name="val",type=4,typeName="Text",time=0,x=0,y=0,width=210,height=32,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignCenter,fontSize=28,textAlign=kAlignCenter,colorRed=145,colorGreen=93,colorBlue=26,colorA=1
		},
		{
			name="arrow",type=1,typeName="Image",time=0,x=20,y=0,width=12,height=20,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignRight,file=invitational_pin_map['option_arrow.png']
		}
	},
	{
		name="line",type=1,typeName="Image",time=0,x=0,y=0,width=506,height=2,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignBottom,file="hall/invitational/option_line.png"
	}
}
return invitational_create_option_item;