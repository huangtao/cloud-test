local onlooker_barrage_pin_map = require("qnFiles/qnPlist/games/onlooker_barrage_pin");
local onlooker_barrage_item=
{
	name="onlooker_barrage_item",type=0,typeName="View",time=0,x=0,y=0,width=200,height=60,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTopLeft,
	{
		name="bg_props",type=1,typeName="Image",time=0,x=0,y=0,width=200,height=54,visible=0,fillParentWidth=1,fillParentHeight=0,nodeAlign=kAlignLeft,file=onlooker_barrage_pin_map['bg_props.png'],gridLeft=32,gridRight=32,gridTop=25,gridBottom=25,
		{
			name="props",type=1,typeName="Image",time=0,x=15,y=-5,width=57,height=60,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignRight,file="isolater/prop/default_icon.png"
		}
	},
	{
		name="bg_mine",type=1,typeName="Image",time=0,x=0,y=0,width=200,height=48,visible=0,fillParentWidth=1,fillParentHeight=0,nodeAlign=kAlignLeft,file=onlooker_barrage_pin_map['bg_mine.png'],gridLeft=6,gridRight=6,gridTop=20,gridBottom=20
	},
	{
		name="info",type=4,typeName="Text",time=0,x=15,y=0,width=170,height=40,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignLeft,fontSize=30,textAlign=kAlignCenter,colorRed=255,colorGreen=255,colorBlue=255,string=[[这是弹幕123]],colorA=1
	}
}
return onlooker_barrage_item;