local match_record_pin_map = require("qnFiles/qnPlist/hall/match_record_pin");
local match_hall_record_master_desc_layout=
{
	name="match_hall_record_master_desc_layout",type=0,typeName="View",time=0,x=0,y=0,width=1280,height=720,visible=1,nodeAlign=kAlignTopLeft,fillParentWidth=1,fillParentHeight=1,
	{
		name="contentBg",type=0,typeName="Image",time=115322370,x=0,y=0,width=553,height=166,nodeAlign=kAlignCenter,visible=1,fillParentWidth=0,fillParentHeight=0,file=match_record_pin_map['black_bg.png'],
		{
			name="textView",type=0,typeName="TextView",time=115322624,x=0,y=0,width=500,height=120,nodeAlign=kAlignCenter,visible=1,fillParentWidth=0,fillParentHeight=0,fontSize=20,textAlign=kAlignLeft,colorRed=215,colorGreen=171,colorBlue=127
		}
	}
}
return match_hall_record_master_desc_layout;