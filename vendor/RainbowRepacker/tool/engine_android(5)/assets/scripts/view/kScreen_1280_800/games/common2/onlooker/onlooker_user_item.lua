local onlooker_chat_user_pin_map = require("qnFiles/qnPlist/games/onlooker_chat_user_pin");
local onlooker_user_item=
{
	name="onlooker_user_item",type=0,typeName="View",time=0,x=0,y=0,width=315,height=94,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTopLeft,
	{
		name="head",type=1,typeName="Image",time=0,x=0,y=0,width=74,height=74,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignLeft,file="isolater/bg_blank.png",
		{
			name="icon_vip",type=1,typeName="Image",time=0,x=0,y=0,width=30,height=24,visible=0,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTopLeft,file=onlooker_chat_user_pin_map['icon_vip.png']
		}
	},
	{
		name="icon_friend",type=1,typeName="Image",time=0,x=86,y=20,width=64,height=24,visible=0,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTopLeft,file=onlooker_chat_user_pin_map['icon_friend.png']
	},
	{
		name="nick",type=4,typeName="Text",time=0,x=86,y=44,width=144,height=27,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTopLeft,fontSize=24,textAlign=kAlignLeft,colorRed=238,colorGreen=206,colorBlue=144,string=[[玩家六字昵称]],colorA=1
	}
}
return onlooker_user_item;