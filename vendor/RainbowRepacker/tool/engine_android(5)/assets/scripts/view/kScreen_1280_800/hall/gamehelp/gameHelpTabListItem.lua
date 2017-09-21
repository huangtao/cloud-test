local diamondShop_pin_map = require("qnFiles/qnPlist/hall/diamondShop_pin");
local gameHelpTabListItem=
{
	name="gameHelpTabListItem",type=0,typeName="View",time=0,report=0,x=0,y=0,width=330,height=120,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTopLeft,
	{
		name="left_tab_btn",type=2,typeName="Button",time=77357163,report=0,x=0,y=0,width=330,height=110,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignLeft,file="hall/common/bg_blank.png",
		{
			name="selImg",type=1,typeName="Image",time=90129643,report=0,x=0,y=0,width=344,height=196,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignLeft,file=diamondShop_pin_map['diamondshop_tab_seleted.png']
		},
		{
			name="left_tab_text",type=4,typeName="Text",time=90129696,report=0,x=0,y=0,width=88,height=40,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignCenter,fontSize=34,textAlign=kAlignCenter,colorRed=255,colorGreen=245,colorBlue=204,string=[[通  用]]
		}
	},
	{
		name="line",type=1,typeName="Image",time=90130484,report=0,x=0,y=0,width=696,height=2,fillTopLeftX=30,fillTopLeftY=118,fillBottomRightX=40,fillBottomRightY=0,visible=1,fillParentWidth=1,fillParentHeight=0,nodeAlign=kAlignBottom,file="hall/common/line.png"
	}
}
return gameHelpTabListItem;