local match_record_pin_map = require("qnFiles/qnPlist/hall/match_record_pin");
local match_hall_record_reward_tips_layout=
{
	name="match_hall_record_reward_tips_layout",type=0,typeName="View",time=0,x=0,y=0,width=1280,height=720,visible=1,nodeAlign=kAlignTopLeft,fillParentWidth=1,fillParentHeight=1,
	{
		name="contentBg",type=0,typeName="Image",time=115322370,x=0,y=0,width=342,height=72,nodeAlign=kAlignCenter,visible=1,fillParentWidth=0,fillParentHeight=0,file=match_record_pin_map['reward_tips_bg.png'],gridLeft=15,gridRight=15,gridTop=15,gridBottom=15,
		{
			name="textView",type=0,typeName="TextView",time=115322624,x=0,y=-3,width=312,height=44,nodeAlign=kAlignCenter,visible=1,fillParentWidth=0,fillParentHeight=0,fontSize=24,textAlign=kAlignLeft,colorRed=255,colorGreen=255,colorBlue=255
		}
	}
}
return match_hall_record_reward_tips_layout;