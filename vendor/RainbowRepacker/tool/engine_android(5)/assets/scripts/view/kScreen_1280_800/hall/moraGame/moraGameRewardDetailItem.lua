local moraGame_pin_map = require("qnFiles/qnPlist/hall/moraGame_pin");
local moraGameRewardDetailItem=
{
	name="moraGameRewardDetailItem",type=0,typeName="View",time=0,x=0,y=0,width=240,height=42,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTopLeft,
	{
		name="itemView",type=0,typeName="View",time=0,x=0,y=0,width=240,height=42,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTopLeft,
		{
			name="tips0",type=4,typeName="Text",time=0,x=0,y=0,width=100,height=42,visible=1,fillParentWidth=0,fillParentHeight=1,nodeAlign=kAlignLeft,fontSize=24,textAlign=kAlignLeft,colorRed=187,colorGreen=188,colorBlue=251,string=[[我出]],colorA=1
		},
		{
			name="moraIcon",type=1,typeName="Image",time=0,x=48,y=0,width=31,height=39,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignLeft,file=moraGame_pin_map['hisMora_0.png']
		},
		{
			name="tips1",type=4,typeName="Text",time=0,x=81,y=0,width=100,height=42,visible=1,fillParentWidth=0,fillParentHeight=1,nodeAlign=kAlignLeft,fontSize=24,textAlign=kAlignLeft,colorRed=255,colorGreen=235,colorBlue=12,string=[[赢取]],colorA=1
		},
		{
			name="moneyIcon",type=1,typeName="Image",time=0,x=131,y=0,width=31,height=39,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignLeft,file=moraGame_pin_map['hisGoldBarIcon.png']
		},
		{
			name="tips2",type=4,typeName="Text",time=0,x=167,y=0,width=100,height=42,visible=1,fillParentWidth=0,fillParentHeight=1,nodeAlign=kAlignLeft,fontSize=24,textAlign=kAlignLeft,colorRed=255,colorGreen=235,colorBlue=12,string=[[-10000]],colorA=1
		}
	}
}
return moraGameRewardDetailItem;