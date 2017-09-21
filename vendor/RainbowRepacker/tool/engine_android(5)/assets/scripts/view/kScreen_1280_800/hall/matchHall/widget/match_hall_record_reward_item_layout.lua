local match_record_pin_map = require("qnFiles/qnPlist/hall/match_record_pin");
local match_hall_record_reward_item_layout=
{
	name="match_hall_record_reward_item_layout",type=0,typeName="View",time=0,x=0,y=0,width=142,height=134,visible=1,nodeAlign=kAlignCenter,fillParentWidth=0,fillParentHeight=0,
	{
		name="line",type=0,typeName="Image",time=115732760,x=-1,y=0,width=2,height=91,nodeAlign=kAlignRight,visible=1,fillParentWidth=0,fillParentHeight=0,file=match_record_pin_map['reward_line.png']
	},
	{
		name="icon",type=0,typeName="Image",time=115405979,x=0,y=5,width=90,height=90,nodeAlign=kAlignTop,visible=1,fillParentWidth=0,fillParentHeight=0,file="isolater/bg_blank.png"
	},
	{
		name="btn",type=0,typeName="Button",time=116437081,x=0,y=0,width=2,height=2,nodeAlign=kAlignTopLeft,visible=1,fillParentWidth=1,fillParentHeight=1,file="hall/common/bg_blank.png",
		{
			name="infoView",type=0,typeName="View",time=115406182,x=0,y=0,width=64,height=44,nodeAlign=kAlignBottom,visible=1,fillParentWidth=1,fillParentHeight=0,
			{
				name="img",type=0,typeName="Image",time=115406417,x=0,y=0,width=86,height=35,nodeAlign=kAlignCenter,visible=1,fillParentWidth=0,fillParentHeight=0,file=match_record_pin_map['btn_reward.png'],
				{
					name="text",type=0,typeName="Text",time=116437548,x=0,y=-2,width=1,height=40,nodeAlign=kAlignCenter,visible=1,fillParentWidth=0,fillParentHeight=0,fontSize=22,textAlign=kAlignCenter,colorRed=255,colorGreen=238,colorBlue=202
				}
			},
			{
				name="text",type=0,typeName="Text",time=115730085,x=0,y=0,width=1,height=40,nodeAlign=kAlignCenter,visible=1,fillParentWidth=0,fillParentHeight=0,fontSize=22,textAlign=kAlignCenter,colorRed=143,colorGreen=92,colorBlue=31
			}
		}
	}
}
return match_hall_record_reward_item_layout;