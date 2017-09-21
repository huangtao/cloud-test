local match_hall_pin_map = require("qnFiles/qnPlist/hall/match_hall_pin");
local match_hall_detail_help_layout=
{
	name="match_hall_detail_help_layout",type=0,typeName="View",time=0,x=0,y=0,width=1280,height=720,visible=1,nodeAlign=kAlignTopLeft,fillParentWidth=1,fillParentHeight=1,
	{
		name="contentBg",type=0,typeName="Image",time=112986323,x=0,y=0,width=262,height=72,nodeAlign=kAlignCenter,visible=1,fillParentWidth=0,fillParentHeight=0,file=match_hall_pin_map['help_bg.png'],gridLeft=25,gridRight=25,gridTop=25,gridBottom=30,
		{
			name="contentView",type=0,typeName="View",time=112986626,x=0,y=0,width=64,height=64,nodeAlign=kAlignTopLeft,visible=1,fillParentWidth=0,fillParentHeight=0,fillTopLeftX=10,fillTopLeftY=10,fillBottomRightX=10,fillBottomRightY=16
		}
	}
}
return match_hall_detail_help_layout;