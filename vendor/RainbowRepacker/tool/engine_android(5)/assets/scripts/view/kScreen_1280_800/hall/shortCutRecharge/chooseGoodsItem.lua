local shortCutRecharge_pin_map = require("qnFiles/qnPlist/hall/shortCutRecharge_pin");
local chooseGoodsItem=
{
	name="chooseGoodsItem",type=0,typeName="View",time=0,report=0,x=0,y=0,width=226,height=267,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignCenter,
	{
		name="itemBg",type=2,typeName="Button",time=77873120,report=0,x=0,y=0,width=254,height=311,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignCenter,file=shortCutRecharge_pin_map['coin_bg.png'],
		{
			name="title",type=4,typeName="Text",time=65266378,report=0,x=0,y=22,width=87,height=35,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTop,fontSize=30,textAlign=kAlignCenter,colorRed=156,colorGreen=47,colorBlue=3
		},
		{
			name="image",type=1,typeName="Image",time=65266381,report=0,x=0,y=60,width=128,height=109,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTop,file="hall/common/goodIcon.png"
		},
		{
			name="info",type=4,typeName="Text",time=65266387,report=0,x=0,y=70,width=0,height=0,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignBottom,fontSize=28,textAlign=kAlignCenter,colorRed=255,colorGreen=250,colorBlue=200
		},
		{
			name="money",type=4,typeName="Text",time=65266388,report=0,x=0,y=16,width=0,height=0,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignBottom,fontSize=34,textAlign=kAlignCenter,colorRed=255,colorGreen=222,colorBlue=104
		},
		{
			name="eventIcon",type=1,typeName="Image",time=76823507,report=0,x=0,y=0,width=62,height=62,visible=0,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTopLeft,file="hall/common/bg_blank.png"
		}
	}
}
return chooseGoodsItem;