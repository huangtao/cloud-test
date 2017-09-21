local payChannelIcons_pin_map = require("qnFiles/qnPlist/hall/payChannelIcons_pin");
local shortCutRecharge_pin_map = require("qnFiles/qnPlist/hall/shortCutRecharge_pin");
local rechargeModeItem=
{
	name="rechargeModeItem",type=0,typeName="View",time=0,report=0,x=0,y=0,width=289,height=147,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTopLeft,
	{
		name="modeItem",type=2,typeName="Button",time=82558126,report=0,x=0,y=0,width=258,height=135,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignCenter,file=shortCutRecharge_pin_map['payChoiceItem.png'],
		{
			name="icon",type=1,typeName="Image",time=82558224,report=0,x=30,y=0,width=66,height=66,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignLeft,file=payChannelIcons_pin_map['pmode_0.png']
		},
		{
			name="name",type=0,typeName="TextView",time=99143823,x=113,y=0,width=125,height=90,nodeAlign=kAlignLeft,visible=1,fillParentWidth=0,fillParentHeight=0,fontSize=30,textAlign=kAlignLeft,colorRed=255,colorGreen=255,colorBlue=255
		},
		{
			name="recommended",type=1,typeName="Image",time=90413363,report=0,x=181,y=3,width=74,height=77,visible=0,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTopLeft,file=shortCutRecharge_pin_map['recommend.png']
		},
		{
			name="cornerMarkView",type=0,typeName="View",time=103206814,x=0,y=0,width=74,height=77,nodeAlign=kAlignTopRight,visible=1,fillParentWidth=0,fillParentHeight=0
		}
	}
}
return rechargeModeItem;