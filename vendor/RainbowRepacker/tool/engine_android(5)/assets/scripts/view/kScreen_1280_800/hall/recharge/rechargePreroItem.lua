local market_pin_map = require("qnFiles/qnPlist/hall/market_pin");
local rechargePreroItem=
{
	name="rechargePreroItem",type=0,typeName="View",time=0,report=0,x=0,y=0,width=170,height=165,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTopLeft,
	{
		name="item",type=0,typeName="View",time=65086324,report=0,x=0,y=0,width=160,height=140,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignCenter,
		{
			name="bg",type=1,typeName="Image",time=65086331,report=0,x=0,y=0,width=101,height=113,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTop,file=market_pin_map['prop_default.png']
		},
		{
			name="info",type=4,typeName="Text",time=65086534,report=0,x=0,y=0,width=162,height=30,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignBottom,fontSize=26,textAlign=kAlignCenter,colorRed=118,colorGreen=72,colorBlue=18,string=[[踢人踢人踢人]]
		}
	}
}
return rechargePreroItem;