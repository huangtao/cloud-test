local match_hall_pin_map = require("qnFiles/qnPlist/hall/match_hall_pin");
local match_hall_detail_left_item_layout=
{
	name="match_hall_detail_left_item_layout",type=0,typeName="View",time=0,x=0,y=0,width=380,height=60,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignCenter,
	{
		name="bg",type=1,typeName="Image",time=0,x=0,y=0,width=380,height=60,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTopLeft,file="hall/common/bg_blank.png"
	},
	{
		name="line",type=1,typeName="Image",time=0,x=0,y=0,width=297,height=1,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignBottom,file=match_hall_pin_map['ranking_line.png']
	},
	{
		name="ranking",type=4,typeName="Text",time=0,x=242,y=0,width=138,height=50,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignRight,fontSize=24,textAlign=kAlignRight,colorRed=125,colorGreen=73,colorBlue=12,colorA=1
	},
	{
		name="reward",type=4,typeName="Text",time=0,x=145,y=0,width=235,height=50,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignLeft,fontSize=24,textAlign=kAlignLeft,colorRed=125,colorGreen=73,colorBlue=12,colorA=1
	},
	{
		name="textView",type=5,typeName="TextView",time=0,x=0,y=0,width=361,height=50,visible=0,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignCenter,fontSize=24,textAlign=kAlignCenter,colorRed=125,colorGreen=73,colorBlue=12,colorA=1
	}
}
return match_hall_detail_left_item_layout;