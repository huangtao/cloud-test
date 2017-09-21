local match_hall_pin_map = require("qnFiles/qnPlist/hall/match_hall_pin");
local match_hall_detail_popup_layout=
{
	name="match_hall_detail_popup_layout",type=0,typeName="View",time=0,x=0,y=0,width=1280,height=720,visible=1,nodeAlign=kAlignTopLeft,fillParentWidth=1,fillParentHeight=1,
	{
		name="contentBg",type=0,typeName="Image",time=103127199,x=0,y=0,width=929,height=519,nodeAlign=kAlignCenter,visible=1,fillParentWidth=0,fillParentHeight=0,file=match_hall_pin_map['rule_bg.png'],gridTop=10,gridLeft=10,gridRight=10,gridBottom=10,
		{
			name="returnBtn",type=0,typeName="Button",time=114359014,x=-15,y=-11,width=60,height=60,nodeAlign=kAlignTopRight,visible=1,fillParentWidth=0,fillParentHeight=0,file="isolater/popupWindow/popupWindow_close.png"
		},
		{
			name="contentView",type=0,typeName="View",time=113420265,x=70,y=99,width=774,height=459,nodeAlign=kAlignTopLeft,visible=1,fillParentWidth=0,fillParentHeight=0,fillTopLeftX=85,fillTopLeftY=30,fillBottomRightX=70,fillBottomRightY=30
		}
	}
}
return match_hall_detail_popup_layout;