local num_online_pin_map = require("qnFiles/qnPlist/hall/num_online_pin");
local roomLevels_pin_map = require("qnFiles/qnPlist/hall/roomLevels_pin");
local hall_game_list_item=
{
	name="hall_game_list_item",type=0,typeName="View",time=0,report=0,x=0,y=0,width=296,height=370,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTopLeft,
	{
		name="bg",type=1,typeName="Image",time=58011102,report=0,x=0,y=0,width=277,height=372,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignCenter,file="hall/hall/hall_gameBg.png",
		{
			name="logo",type=1,typeName="Image",time=72520518,report=0,x=0,y=-10,width=245,height=340,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignCenter,file="hall/common/bg_blank.png",
			{
				name="onlineNumView",type=0,typeName="View",time=88854795,report=0,x=0,y=3,width=245,height=30,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignBottom,
				{
					name="word",type=1,typeName="Image",time=90408443,report=0,x=0,y=0,width=52,height=23,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignLeft,file=num_online_pin_map['word_online.png']
				}
			},
			{
				name="gameStatusView",type=0,typeName="View",time=94649113,x=0,y=3,width=245,height=30,nodeAlign=kAlignBottom,visible=1,fillParentWidth=0,fillParentHeight=0,
				{
					name="newGamesIcon",type=0,typeName="Image",time=94648694,x=0,y=0,width=95,height=23,nodeAlign=kAlignCenter,visible=0,fillParentWidth=0,fillParentHeight=0,file=roomLevels_pin_map['newGamesIcon.png']
				}
			},
			{
				name="moreGamesView",type=0,typeName="View",time=110475801,x=0,y=-38,width=213,height=207,nodeAlign=kAlignCenter,visible=1,fillParentWidth=0,fillParentHeight=0
			},
			{
				name="redDot",type=0,typeName="Image",time=111258134,x=0,y=0,width=32,height=32,nodeAlign=kAlignTopRight,visible=0,fillParentWidth=0,fillParentHeight=0,file="hall/common/msg_icon.png"
			}
		}
	}
}
return hall_game_list_item;