local market_pin_map = require("qnFiles/qnPlist/hall/market_pin");
local rechargeTopAd=
{
	name="rechargeTopAd",type=0,typeName="View",time=0,report=0,x=0,y=0,width=1280,height=720,visible=1,fillParentWidth=1,fillParentHeight=1,nodeAlign=kAlignTop,
	{
		name="commonLayer",type=0,typeName="View",time=105705540,x=0,y=100,width=1280,height=70,nodeAlign=kAlignTop,visible=1,fillParentWidth=1,fillParentHeight=0,
		{
			name="ad_bg",type=0,typeName="Image",time=105705753,x=51,y=-81,width=1178,height=32,nodeAlign=kAlignCenter,visible=1,fillParentWidth=0,fillParentHeight=0,file=market_pin_map['ad_bg.png'],fillTopLeftX=51,fillTopLeftY=19,fillBottomRightY=19,fillBottomRightX=51,gridLeft=5,gridRight=5,gridTop=5,gridBottom=5,
			{
				name="adView",type=0,typeName="View",time=105725697,x=0,y=0,width=998,height=32,nodeAlign=kAlignTopLeft,visible=1,fillParentWidth=0,fillParentHeight=0,fillTopLeftY=0,fillBottomRightY=0,fillTopLeftX=20,fillBottomRightX=160,
				{
					name="adText",type=0,typeName="Text",time=105725599,x=0,y=0,width=1,height=30,nodeAlign=kAlignLeft,visible=1,fillParentWidth=0,fillParentHeight=0,fontSize=20,textAlign=kAlignLeft,colorRed=255,colorGreen=238,colorBlue=193
				}
			}
		},
		{
			name="bagBtn",type=0,typeName="Button",time=105705971,x=50,y=-5,width=180,height=50,nodeAlign=kAlignRight,visible=1,fillParentWidth=0,fillParentHeight=0,file="isolater/bg_blank.png",
			{
				name="img",type=0,typeName="Image",time=105706050,x=3,y=3,width=184,height=53,nodeAlign=kAlignCenter,visible=1,fillParentWidth=0,fillParentHeight=0,file=market_pin_map['btn_bag.png']
			}
		}
	}
}
return rechargeTopAd;