local roomLevels_pin_map = require("qnFiles/qnPlist/hall/roomLevels_pin");
local gameRoomLevelItem=
{
	name="gameRoomLevelItem",type=0,typeName="View",time=0,report=0,x=0,y=0,width=552,height=165,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignCenter,
	{
		name="button",type=2,typeName="Button",time=51875607,report=0,x=0,y=0,width=552,height=165,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTopLeft,file=roomLevels_pin_map['levelIcon_12.png'],
		{
			name="contentView",type=0,typeName="View",time=95079604,x=190,y=101,width=160,height=40,nodeAlign=kAlignTopLeft,visible=1,fillParentWidth=0,fillParentHeight=0,
			{
				name="baseChipView",type=0,typeName="View",time=95341384,x=0,y=0,width=128,height=40,nodeAlign=kAlignLeft,visible=1,fillParentWidth=0,fillParentHeight=0
			},
			{
				name="baseChipIcon",type=0,typeName="Image",time=114371955,x=0,y=6,width=56,height=28,nodeAlign=kAlignTopLeft,visible=1,fillParentWidth=0,fillParentHeight=0,file=roomLevels_pin_map['baseChip.png']
			}
		},
		{
			name="onlineNumView",type=0,typeName="View",time=95341246,x=36,y=26,width=90,height=36,nodeAlign=kAlignBottomRight,visible=1,fillParentWidth=0,fillParentHeight=0,
			{
				name="onlineText",type=0,typeName="Text",time=114372614,x=0,y=0,width=90,height=36,nodeAlign=kAlignLeft,visible=1,fillParentWidth=0,fillParentHeight=0,string=[[1233223人]],fontSize=22,textAlign=kAlignLeft,colorRed=179,colorGreen=108,colorBlue=17
			}
		},
		{
			name="cheat_icon",type=0,typeName="Image",time=114372168,x=2,y=0,width=138,height=54,nodeAlign=kAlignTopRight,visible=1,fillParentWidth=0,fillParentHeight=0,file=roomLevels_pin_map['cheat_icon.png']
		}
	}
}
return gameRoomLevelItem;