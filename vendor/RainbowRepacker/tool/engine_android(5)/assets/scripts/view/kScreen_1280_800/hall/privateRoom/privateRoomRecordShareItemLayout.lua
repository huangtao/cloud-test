local privateRoom_pin_map = require("qnFiles/qnPlist/hall/privateRoom_pin");
local privateRoomRecordShareItemLayout=
{
	name="privateRoomRecordShareItemLayout",type=0,typeName="View",time=0,x=0,y=0,width=550,height=102,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignCenter,
	{
		name="bg",type=1,typeName="Image",time=0,x=0,y=0,width=550,height=108,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTop,file=privateRoom_pin_map['item_bg.png']
	},
	{
		name="number",type=1,typeName="Image",time=0,x=25,y=0,width=34,height=34,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignLeft,file=privateRoom_pin_map['player_1.png']
	},
	{
		name="winer",type=1,typeName="Image",time=0,x=-13,y=-24,width=105,height=141,visible=0,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTopLeft,file=privateRoom_pin_map['tag_winer.png']
	},
	{
		name="head",type=0,typeName="View",time=0,x=75,y=0,width=76,height=76,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignLeft,
		{
			name="shadow",type=1,typeName="Image",time=0,x=0,y=-18,width=80,height=47,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignBottom,file=privateRoom_pin_map['head_shadow.png']
		}
	},
	{
		name="name",type=4,typeName="Text",time=0,x=160,y=-15,width=100,height=30,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignLeft,fontSize=24,textAlign=kAlignLeft,colorRed=163,colorGreen=131,colorBlue=82,colorA=1
	},
	{
		name="winCount",type=4,typeName="Text",time=0,x=160,y=15,width=100,height=30,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignLeft,fontSize=24,textAlign=kAlignLeft,colorRed=163,colorGreen=131,colorBlue=82,colorA=1
	},
	{
		name="text",type=4,typeName="Text",time=0,x=340,y=15,width=72,height=30,visible=0,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignLeft,fontSize=24,textAlign=kAlignLeft,colorRed=163,colorGreen=131,colorBlue=82,colorA=1,string=[[战绩：]]
	},
	{
		name="scoreView",type=0,typeName="View",time=0,x=15,y=0,width=125,height=102,visible=1,fillParentWidth=0,fillParentHeight=1,nodeAlign=kAlignRight
	}
}
return privateRoomRecordShareItemLayout;