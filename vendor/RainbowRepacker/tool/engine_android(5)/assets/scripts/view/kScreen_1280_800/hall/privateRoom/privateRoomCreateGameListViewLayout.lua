local privateRoom_pin_map = require("qnFiles/qnPlist/hall/privateRoom_pin");
local privateRoomCreateGameListViewLayout=
{
	name="privateRoomCreateGameListViewLayout",type=0,typeName="View",time=0,x=0,y=0,width=416,height=67,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTopLeft,
	{
		name="clickBg",type=1,typeName="Image",time=92543518,report=0,x=0,y=0,width=1280,height=720,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTopLeft,file="hall/common/bg_blank.png"
	},
	{
		name="nameArea",type=1,typeName="Image",time=0,x=0,y=0,width=416,height=87,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTop,file="hall/privateRoom/create_title_bg.png",gridLeft=38,gridRight=38,gridTop=5,gridBottom=38,
		{
			name="contentView",type=0,typeName="View",time=91961393,report=0,x=9,y=0,width=416,height=67,visible=1,fillParentWidth=1,fillParentHeight=0,nodeAlign=kAlignTop,
			{
				name="name",type=4,typeName="Text",time=0,x=0,y=0,width=159,height=40,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignCenter,fontSize=32,textAlign=kAlignCenter,colorRed=255,colorGreen=254,colorBlue=162,colorA=1
			}
		},
		{
			name="toggleImg",type=1,typeName="Image",time=91005845,report=0,x=30,y=18,width=23,height=22,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTopRight,file=privateRoom_pin_map['arrow_down2.png']
		},
		{
			name="listView",type=0,typeName="ListView",time=0,x=0,y=0,width=405,height=67,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTop
		}
	}
}
return privateRoomCreateGameListViewLayout;