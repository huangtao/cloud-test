local match_record_pin_map = require("qnFiles/qnPlist/hall/match_record_pin");
local match_hall_record_item_history_layout=
{
	name="match_hall_record_item_history_layout",type=0,typeName="View",time=0,x=0,y=0,width=565,height=70,visible=1,nodeAlign=kAlignCenter,fillParentWidth=0,fillParentHeight=0,
	{
		name="line",type=0,typeName="Image",time=114953617,x=0,y=0,width=565,height=2,nodeAlign=kAlignBottom,visible=1,fillParentWidth=0,fillParentHeight=0,file=match_record_pin_map['record_line.png']
	},
	{
		name="time",type=0,typeName="Text",time=114953821,x=0,y=0,width=1,height=40,nodeAlign=kAlignLeft,visible=1,fillParentWidth=0,fillParentHeight=0,fontSize=24,textAlign=kAlignLeft,colorRed=143,colorGreen=92,colorBlue=31
	},
	{
		name="name",type=0,typeName="Text",time=114963662,x=0,y=0,width=1,height=40,nodeAlign=kAlignCenter,visible=1,fillParentWidth=0,fillParentHeight=0,fontSize=24,textAlign=kAlignCenter,colorRed=27,colorGreen=136,colorBlue=94
	},
	{
		name="rank",type=0,typeName="Text",time=114963667,x=30,y=0,width=1,height=40,nodeAlign=kAlignRight,visible=1,fillParentWidth=0,fillParentHeight=0,fontSize=24,textAlign=kAlignRight,colorRed=143,colorGreen=92,colorBlue=31
	},
	{
		name="arrowRight",type=0,typeName="Image",time=114963714,x=0,y=0,width=23,height=23,nodeAlign=kAlignRight,visible=1,fillParentWidth=0,fillParentHeight=0,file=match_record_pin_map['arrow_right.png']
	},
	{
		name="arrowDown",type=0,typeName="Image",time=115913213,x=0,y=0,width=23,height=23,nodeAlign=kAlignRight,visible=1,fillParentWidth=0,fillParentHeight=0,file=match_record_pin_map['arrow_down.png']
	},
	{
		name="arrowUp",type=0,typeName="Image",time=116705539,x=0,y=0,width=23,height=23,nodeAlign=kAlignRight,visible=1,fillParentWidth=0,fillParentHeight=0,file=match_record_pin_map['arrow_up.png']
	}
}
return match_hall_record_item_history_layout;