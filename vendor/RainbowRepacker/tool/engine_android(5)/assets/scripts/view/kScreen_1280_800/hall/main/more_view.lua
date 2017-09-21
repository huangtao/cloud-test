local hall_qn_pin_map = require("qnFiles/qnPlist/hall/hall_qn_pin");
local more_view=
{
	name="more_view",type=0,typeName="View",time=0,x=0,y=0,width=1280,height=720,visible=1,fillParentWidth=1,fillParentHeight=1,nodeAlign=kAlignTopLeft,
	{
		name="Image_more_bg",type=1,typeName="Image",time=0,x=10,y=95,width=230,height=140,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTopRight,file=hall_qn_pin_map['hall_moreBg.png'],gridLeft=25,gridRight=25,gridTop=25,gridBottom=25
	}
}
return more_view;