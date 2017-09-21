local bankrupt_pin_map = require("qnFiles/qnPlist/hall/bankrupt_pin");
local brokeAllowanceItemImLayer=
{
	name="brokeAllowanceItemImLayer",type=0,typeName="View",time=0,report=0,x=0,y=0,width=480,height=150,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTopLeft,
	{
		name="content",type=2,typeName="Button",time=42959233,report=0,x=0,y=0,width=470,height=122,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignCenter,file="hall/common/buy_redbg.png",
		{
			name="leftIcon",type=1,typeName="Image",time=42953525,report=0,x=5,y=-3,width=105,height=90,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignLeft,file=bankrupt_pin_map['coin_1.png']
		},
		{
			name="rightView",type=0,typeName="View",time=42954421,report=0,x=103,y=10,width=360,height=60,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTopLeft
		},
		{
			name="recIcon",type=1,typeName="Image",time=33634089,report=0,x=2,y=2,width=77,height=77,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTopLeft,file="hall/common/bg_blank.png"
		},
		{
			name="priceBg",type=1,typeName="Image",time=90056809,report=0,x=55,y=20,width=213,height=28,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignBottom,file="hall/common/price_star.png",
			{
				name="price",type=4,typeName="Text",time=61005217,report=0,x=0,y=0,width=102,height=45,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignCenter,fontSize=32,textAlign=kAlignCenter,colorRed=255,colorGreen=252,colorBlue=0
			}
		}
	}
}
return brokeAllowanceItemImLayer;