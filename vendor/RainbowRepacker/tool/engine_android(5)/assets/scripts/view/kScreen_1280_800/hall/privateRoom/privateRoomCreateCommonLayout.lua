local privateRoom_pin_map = require("qnFiles/qnPlist/hall/privateRoom_pin");
local privateRoomCreateCommonLayout=
{
	name="privateRoomCreateCommonLayout",type=0,typeName="View",time=0,x=0,y=0,width=1280,height=720,visible=1,fillParentWidth=1,fillParentHeight=1,nodeAlign=kAlignTopLeft,
	{
		name="bg",type=1,typeName="Image",time=0,x=0,y=0,width=1280,height=720,visible=1,fillParentWidth=1,fillParentHeight=1,nodeAlign=kAlignTopLeft,file="hall/privateRoom/private_room_bg.jpg"
	},
	{
		name="customView",type=0,typeName="View",time=0,x=0,y=0,width=1280,height=720,visible=1,fillParentWidth=1,fillParentHeight=1,nodeAlign=kAlignTopLeft
	},
	{
		name="gameListView",type=0,typeName="View",time=0,x=0,y=0,width=1280,height=61,visible=1,fillParentWidth=1,fillParentHeight=0,nodeAlign=kAlignTop
	},
	{
		name="returnBtn",type=1,typeName="Button",time=0,x=0,y=0,width=110,height=88,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTopLeft,file=privateRoom_pin_map['btn_return.png']
	}
}
return privateRoomCreateCommonLayout;