local onlooker_spinner_pin_map = require("qnFiles/qnPlist/games/onlooker_spinner_pin");
local onlooker_spinner_item=
{
	name="onlooker_spinner_item",type=0,typeName="View",time=0,x=0,y=0,width=130,height=37,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTopLeft,
	{
		name="name",type=4,typeName="Text",time=0,x=0,y=0,width=80,height=27,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignLeft,fontSize=20,textAlign=kAlignLeft,colorRed=238,colorGreen=206,colorBlue=144,string=[[四个字哈]],colorA=1
	},
	{
		name="icon_friend",type=1,typeName="Image",time=0,x=80,y=0,width=25,height=25,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignLeft,file=onlooker_spinner_pin_map['icon_friend.png']
	}
}
return onlooker_spinner_item;