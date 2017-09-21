local diamondShop_pin_map = require("qnFiles/qnPlist/hall/diamondShop_pin");
local diamondTabItem=
{
	name="diamondTabItem",type=0,typeName="View",time=0,report=0,x=0,y=0,width=344,height=100,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTopLeft,
	{
		name="bg",type=1,typeName="Image",time=68887284,report=0,x=0,y=0,width=344,height=100,visible=1,fillParentWidth=1,fillParentHeight=1,nodeAlign=kAlignLeft,file="hall/common/bg_blank.png",
		{
			name="tabType",type=1,typeName="Image",time=89371614,report=0,x=0,y=0,width=300,height=3,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignBottom,file=diamondShop_pin_map['gradual_line.png']
		},
		{
			name="choosedBg",type=1,typeName="Image",time=68888281,report=0,x=0,y=0,width=344,height=196,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignLeft,file=diamondShop_pin_map['diamondshop_tab_seleted.png']
		},
		{
			name="nameImage",type=1,typeName="Image",time=68887333,report=0,x=0,y=-10,width=176,height=49,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignCenter,file="hall/common/bg_blank.png"
		},
		{
			name="hotImage",type=1,typeName="Image",time=68887450,report=0,x=20,y=-10,width=79,height=46,visible=0,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignRight,file=diamondShop_pin_map['hot.png']
		},
		{
			name="timeText",type=4,typeName="Text",time=68887593,report=0,x=0,y=10,width=200,height=24,visible=1,fillParentWidth=1,fillParentHeight=0,nodeAlign=kAlignBottom,fontSize=20,textAlign=kAlignCenter,colorRed=255,colorGreen=255,colorBlue=255
		}
	}
}
return diamondTabItem;