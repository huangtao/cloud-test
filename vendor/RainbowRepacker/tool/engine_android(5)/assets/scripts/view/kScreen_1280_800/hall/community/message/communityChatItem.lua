local community_pin_map = require("qnFiles/qnPlist/hall/community_pin");
local communityChatItem=
{
	name="communityChatItem",type=0,typeName="View",time=0,x=0,y=0,width=1280,height=80,visible=1,nodeAlign=kAlignTopLeft,fillParentWidth=1,fillParentHeight=0,
	{
		name="view",type=0,typeName="View",time=96474372,x=0,y=0,width=1280,height=80,nodeAlign=kAlignTopLeft,visible=1,fillParentWidth=1,fillParentHeight=0,
		{
			name="chatBg",type=0,typeName="Image",time=98728429,x=0,y=-5,width=102,height=73,nodeAlign=kAlignBottomRight,visible=1,fillParentWidth=0,fillParentHeight=0,file=community_pin_map['oneself_speak.png'],gridLeft=30,gridRight=30,gridTop=40,gridBottom=15,
			{
				name="tagImage",type=0,typeName="Image",time=96474404,x=-80,y=0,width=42,height=42,nodeAlign=kAlignLeft,visible=1,fillParentWidth=0,fillParentHeight=0,file="hall/common/loading.png"
			},
			{
				name="voiceView",type=0,typeName="View",time=98814096,x=10,y=0,width=64,height=64,nodeAlign=kAlignRight,visible=1,fillParentWidth=0,fillParentHeight=0,
				{
					name="voice",type=0,typeName="Image",time=98814115,x=0,y=0,width=27,height=38,nodeAlign=kAlignCenter,visible=1,fillParentWidth=0,fillParentHeight=0,file=community_pin_map['myself3.png']
				}
			},
			{
				name="time",type=0,typeName="Text",time=99604661,x=-50,y=0,width=64,height=64,nodeAlign=kAlignLeft,visible=0,fillParentWidth=0,fillParentHeight=0,string=[["]],fontSize=24,textAlign=kAlignCenter,colorRed=124,colorGreen=207,colorBlue=164
			},
			{
				name="redRot",type=0,typeName="Image",time=102187189,x=-60,y=0,width=32,height=32,nodeAlign=kAlignLeft,visible=0,fillParentWidth=0,fillParentHeight=0,file="hall/common/msg_icon.png"
			}
		},
		{
			name="headBg",type=0,typeName="View",time=99850211,x=10,y=-2,width=70,height=70,nodeAlign=kAlignLeft,visible=1,fillParentWidth=0,fillParentHeight=0,
			{
				name="head_frame",type=1,typeName="Image",time=0,x=0,y=0,width=72,height=72,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignCenter,file=community_pin_map['head_frame.png']
			}
		}
	}
}
return communityChatItem;