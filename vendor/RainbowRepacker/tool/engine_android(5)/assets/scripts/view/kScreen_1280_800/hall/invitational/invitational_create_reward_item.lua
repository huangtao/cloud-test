local invitational_pin_map = require("qnFiles/qnPlist/hall/invitational_pin");
local invitational_create_reward_item=
{
	name="invitational_create_reward_item",type=0,typeName="View",time=0,x=0,y=0,width=430,height=60,visible=1,nodeAlign=kAlignCenter,fillParentWidth=0,fillParentHeight=0,
	{
		name="line",type=1,typeName="Image",time=0,x=0,y=0,width=400,height=1,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignBottom,file="hall/invitational/champion_line.png"
	},
	{
		name="icon",type=1,typeName="Image",time=0,x=30,y=0,width=48,height=38,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignLeft,file=invitational_pin_map['icon_champion.png']
	},
	{
		name="rank",type=4,typeName="Text",time=0,x=85,y=0,width=140,height=25,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignLeft,fontSize=24,textAlign=kAlignLeft,colorRed=127,colorGreen=78,colorBlue=0,colorA=1
	},
	{
		name="count",type=4,typeName="Text",time=0,x=75,y=0,width=132,height=25,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignRight,fontSize=24,textAlign=kAlignRight,colorRed=127,colorGreen=78,colorBlue=0,colorA=1
	},
	{
		name="money",type=1,typeName="Image",time=0,x=20,y=0,width=46,height=36,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignRight,file=invitational_pin_map['icon_crystal.png']
	}
}
return invitational_create_reward_item;