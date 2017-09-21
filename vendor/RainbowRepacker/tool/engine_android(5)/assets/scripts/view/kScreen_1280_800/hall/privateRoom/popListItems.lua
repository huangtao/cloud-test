local privateRoom_pin_map = require("qnFiles/qnPlist/hall/privateRoom_pin");
local popListItems=
{
	name="popListItems",type=0,typeName="View",time=0,report=0,x=0,y=0,width=400,height=200,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTopLeft,
	{
		name="contentBg",type=1,typeName="Image",time=0,x=0,y=0,width=400,height=200,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTopLeft,file=privateRoom_pin_map['game_sel_bg.png'],gridLeft=25,gridRight=25,gridTop=25,gridBottom=25,effect={shader="mirror",mirrorType=0},
		{
			name="group",type=0,typeName="RadioButtonGroup",time=0,x=0,y=0,width=360,height=200,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTopLeft,fillTopLeftX=20,fillBottomRightX=20,fillTopLeftY=0,fillBottomRightY=0
		},
		{
			name="lineView",type=0,typeName="View",time=0,x=0,y=0,width=380,height=200,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTopLeft,fillTopLeftX=10,fillBottomRightX=10,fillTopLeftY=0,fillBottomRightY=0
		}
	}
}
return popListItems;