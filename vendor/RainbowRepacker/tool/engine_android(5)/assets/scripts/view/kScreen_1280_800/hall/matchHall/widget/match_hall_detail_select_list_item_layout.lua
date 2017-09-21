local match_hall_pin_map = require("qnFiles/qnPlist/hall/match_hall_pin");
local match_hall_detail_select_list_item_layout=
{
	name="match_hall_detail_select_list_item_layout",type=0,typeName="View",time=0,x=0,y=0,width=300,height=52,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTopLeft,
	{
		name="bg",type=1,typeName="Image",time=0,x=0,y=0,width=300,height=52,visible=1,fillParentWidth=1,fillParentHeight=0,nodeAlign=kAlignTopLeft,file="hall/common/bg_blank.png",gridLeft=10,gridRight=10,gridTop=10,gridBottom=10,
		{
			name="str",type=4,typeName="Text",time=0,x=25,y=0,width=72,height=52,visible=0,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignLeft,fontSize=24,textAlign=kAlignLeft,colorRed=125,colorGreen=73,colorBlue=12,colorA=1,string=[[报名费]]
		},
		{
			name="icon",type=1,typeName="Image",time=0,x=109,y=0,width=44,height=44,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignLeft,file="ui/blank.png"
		},
		{
			name="text",type=4,typeName="Text",time=0,x=154,y=0,width=100,height=52,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignLeft,fontSize=24,textAlign=kAlignLeft,colorRed=125,colorGreen=73,colorBlue=12,colorA=1
		},
		{
			name="direction",type=1,typeName="Image",time=0,x=15,y=0,width=27,height=20,visible=0,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignRight,file=match_hall_pin_map['down.png']
		}
	},
	{
		name="line",type=1,typeName="Image",time=0,x=0,y=0,width=175,height=1,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignBottom,file=match_hall_pin_map['select_line.png']
	}
}
return match_hall_detail_select_list_item_layout;