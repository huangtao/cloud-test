local privateRoom_pin_map = require("qnFiles/qnPlist/hall/privateRoom_pin");
local popList=
{
	name="popList",type=0,typeName="View",time=0,report=0,x=0,y=0,width=229,height=62,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTopLeft,
	{
		name="clickBg",type=1,typeName="Image",time=92543518,report=0,x=0,y=0,width=1280,height=720,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTopLeft,file="hall/common/bg_blank.png"
	},
	{
		name="nameArea",type=1,typeName="Image",time=90555867,report=0,x=0,y=0,width=229,height=60,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTop,file=privateRoom_pin_map['game_sel_bg.png'],gridLeft=25,gridRight=25,gridTop=25,gridBottom=25,
		{
			name="contentView",type=0,typeName="View",time=91961393,report=0,x=15,y=0,width=159,height=60,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignLeft,
			{
				name="name",type=4,typeName="Text",time=0,x=0,y=0,width=159,height=40,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignLeft,fontSize=32,textAlign=kAlignLeft,colorRed=118,colorGreen=72,colorBlue=18,colorA=1
			}
		},
		{
			name="toggleImg",type=1,typeName="Image",time=91005845,report=0,x=10,y=15,width=41,height=30,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTopRight,file=privateRoom_pin_map['arrow_down.png']
		},
		{
			name="listView",type=0,typeName="View",time=0,x=0,y=0,width=229,height=60,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTopLeft
		}
	}
}
return popList;