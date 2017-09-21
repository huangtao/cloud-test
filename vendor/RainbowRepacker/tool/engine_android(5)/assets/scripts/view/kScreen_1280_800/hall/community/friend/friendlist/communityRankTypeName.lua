local community_pin_map = require("qnFiles/qnPlist/hall/community_pin");
local communityRankTypeName=
{
	name="communityRankTypeName",type=0,typeName="View",time=0,x=0,y=0,width=220,height=54,visible=1,nodeAlign=kAlignTopLeft,fillParentWidth=0,fillParentHeight=0,
	{
		name="name",type=0,typeName="Text",time=96748253,x=0,y=0,width=64,height=64,nodeAlign=kAlignCenter,visible=1,fillParentWidth=0,fillParentHeight=0,string=[[银币]],fontSize=32,textAlign=kAlignCenter,colorRed=255,colorGreen=255,colorBlue=255
	},
	{
		name="line",type=0,typeName="Image",time=96748262,x=0,y=54,width=220,height=1,nodeAlign=kAlignTopLeft,visible=1,fillParentWidth=0,fillParentHeight=0,file=community_pin_map['select_split.png']
	}
}
return communityRankTypeName;