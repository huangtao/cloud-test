local dailyReward_map = require("qnFiles/qnPlist/hall/dailyReward");
local dayCalendarItem=
{
	name="dayCalendarItem",type=0,typeName="View",time=0,report=0,x=0,y=0,width=97,height=46,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTopLeft,
	{
		name="day",type=4,typeName="Text",time=77873405,report=0,x=0,y=0,width=10,height=30,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignCenter,fontSize=28,textAlign=kAlignCenter,colorRed=118,colorGreen=72,colorBlue=18
	},
	{
		name="bu",type=1,typeName="Image",time=77873406,report=0,x=0,y=0,width=39,height=39,visible=0,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignCenter,file=dailyReward_map['bu.png']
	},
	{
		name="signed",type=1,typeName="Image",time=77873407,report=0,x=0,y=0,width=39,height=39,visible=0,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignCenter,file=dailyReward_map['signed_icon.png']
	}
}
return dayCalendarItem;