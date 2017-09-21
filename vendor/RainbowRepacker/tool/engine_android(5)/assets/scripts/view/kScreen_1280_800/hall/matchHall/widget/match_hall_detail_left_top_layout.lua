local match_wait_pin_map = require("qnFiles/qnPlist/games/match_wait_pin");
local match_hall_pin_map = require("qnFiles/qnPlist/hall/match_hall_pin");
local match_hall_detail_left_top_layout=
{
	name="match_hall_detail_left_top_layout",type=0,typeName="View",time=0,x=0,y=0,width=449,height=245,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignCenter,
	{
		name="bg3",type=1,typeName="Image",time=0,x=273,y=9,width=176,height=235,visible=0,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTopLeft,file=match_hall_pin_map['bronze.png'],
		{
			name="rankItem3",type=1,typeName="Image",time=0,x=11,y=30,width=140,height=120,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTop,file=match_wait_pin_map['icon_reward_3.png']
		},
		{
			name="rankText3",type=5,typeName="TextView",time=0,x=11,y=49,width=130,height=45,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignBottom,fontSize=20,textAlign=kAlignBottom,colorRed=255,colorGreen=255,colorBlue=255,colorA=1
		}
	},
	{
		name="bg2",type=1,typeName="Image",time=0,x=0,y=9,width=176,height=235,visible=0,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTopLeft,file=match_hall_pin_map['secondPlace.png'],
		{
			name="rankItem2",type=1,typeName="Image",time=0,x=-12,y=30,width=140,height=120,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTop,file=match_wait_pin_map['icon_reward_2.png']
		},
		{
			name="rankText2",type=5,typeName="TextView",time=0,x=-10,y=49,width=130,height=45,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignBottom,fontSize=20,textAlign=kAlignBottom,colorRed=255,colorGreen=255,colorBlue=255,colorA=1
		}
	},
	{
		name="bg1",type=1,typeName="Image",time=0,x=135,y=-2,width=176,height=235,visible=0,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTopLeft,file=match_hall_pin_map['champion.png'],
		{
			name="rankItem1",type=1,typeName="Image",time=0,x=2,y=35,width=150,height=128,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTop,file=match_wait_pin_map['icon_reward_1.png']
		},
		{
			name="rankText1",type=5,typeName="TextView",time=0,x=0,y=38,width=152,height=45,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignBottom,fontSize=20,textAlign=kAlignBottom,colorRed=255,colorGreen=255,colorBlue=255,colorA=1
		}
	}
}
return match_hall_detail_left_top_layout;