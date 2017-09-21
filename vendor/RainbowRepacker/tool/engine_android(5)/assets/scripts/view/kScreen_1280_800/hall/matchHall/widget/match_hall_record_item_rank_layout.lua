local match_record_pin_map = require("qnFiles/qnPlist/hall/match_record_pin");
local ranklist_pin_map = require("qnFiles/qnPlist/hall/ranklist_pin");
local match_hall_record_item_rank_layout=
{
	name="match_hall_record_item_rank_layout",type=0,typeName="View",time=0,x=0,y=0,width=565,height=70,visible=1,nodeAlign=kAlignCenter,fillParentWidth=0,fillParentHeight=0,
	{
		name="line",type=0,typeName="Image",time=114953617,x=0,y=0,width=565,height=2,nodeAlign=kAlignBottom,visible=1,fillParentWidth=0,fillParentHeight=0,file=match_record_pin_map['record_line.png']
	},
	{
		name="number",type=0,typeName="Text",time=114953821,x=0,y=0,width=1,height=40,nodeAlign=kAlignLeft,visible=1,fillParentWidth=0,fillParentHeight=0,fontSize=24,textAlign=kAlignLeft,colorRed=143,colorGreen=92,colorBlue=31
	},
	{
		name="name",type=0,typeName="Text",time=114962962,x=0,y=0,width=1,height=40,nodeAlign=kAlignLeft,visible=1,fillParentWidth=0,fillParentHeight=0,fontSize=24,textAlign=kAlignLeft,colorRed=27,colorGreen=136,colorBlue=94
	},
	{
		name="score",type=0,typeName="Text",time=114962986,x=0,y=0,width=1,height=40,nodeAlign=kAlignRight,visible=1,fillParentWidth=0,fillParentHeight=0,fontSize=24,textAlign=kAlignRight,colorRed=143,colorGreen=92,colorBlue=31
	},
	{
		name="levelBg",type=0,typeName="Image",time=114963015,x=0,y=0,width=105,height=55,nodeAlign=kAlignLeft,visible=1,fillParentWidth=0,fillParentHeight=0,file=match_record_pin_map['rank_level_bg.png'],
		{
			name="contentView",type=0,typeName="View",time=114963089,x=0,y=0,width=50,height=30,nodeAlign=kAlignCenter,visible=1,fillParentWidth=0,fillParentHeight=0,
			{
				name="img",type=0,typeName="Image",time=115409393,x=0,y=0,width=25,height=16,nodeAlign=kAlignLeft,visible=1,fillParentWidth=0,fillParentHeight=0,file=match_record_pin_map['icon_lv.png']
			},
			{
				name="levelView",type=0,typeName="View",time=115409538,x=26,y=0,width=10,height=18,nodeAlign=kAlignLeft,visible=1,fillParentWidth=0,fillParentHeight=0
			}
		}
	},
	{
		name="numberImg",type=0,typeName="Image",time=116683010,x=-15,y=0,width=48,height=44,nodeAlign=kAlignLeft,visible=1,fillParentWidth=0,fillParentHeight=0,file=ranklist_pin_map['rank_1.png']
	}
}
return match_hall_record_item_rank_layout;