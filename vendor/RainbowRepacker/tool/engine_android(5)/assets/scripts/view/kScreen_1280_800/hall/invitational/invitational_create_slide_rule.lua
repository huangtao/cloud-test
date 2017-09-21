local invitational_pin_map = require("qnFiles/qnPlist/hall/invitational_pin");
local invitational_create_slide_rule=
{
	name="invitational_create_slide_rule",type=0,typeName="View",time=0,x=0,y=0,width=1280,height=720,visible=1,fillParentWidth=1,fillParentHeight=1,nodeAlign=kAlignCenter,
	{
		name="shieldBg",type=1,typeName="Image",time=0,x=383,y=348,width=1280,height=720,visible=1,fillParentWidth=1,fillParentHeight=1,nodeAlign=kAlignTopLeft,file="hall/common/bg_shiled.png"
	},
	{
		name="contentView",type=0,typeName="View",time=0,x=-2,y=0,width=624,height=720,visible=1,fillParentWidth=0,fillParentHeight=1,nodeAlign=kAlignRight,
		{
			name="contentBg",type=1,typeName="Image",time=0,x=0,y=0,width=624,height=720,visible=1,fillParentWidth=1,fillParentHeight=1,nodeAlign=kAlignRight,file="hall/common/slide_bg.png"
		},
		{
			name="titleBg",type=1,typeName="Image",time=0,x=0,y=0,width=599,height=82,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTopRight,file=invitational_pin_map['tab_normal_bg.png'],
			{
				name="title",type=4,typeName="Text",time=0,x=0,y=0,width=599,height=82,visible=1,fillParentWidth=1,fillParentHeight=1,nodeAlign=kAlignCenter,fontSize=32,textAlign=kAlignCenter,string=[[赛制规则]],colorA=1,colorRed=157,colorGreen=115,colorBlue=55
			}
		},
		{
			name="bg",type=1,typeName="Image",time=0,x=0,y=0,width=508,height=580,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignBottom,file="hall/common/bg_blank.png",gridLeft=10,gridRight=10,gridTop=10,gridBottom=10,fillTopLeftX=70,fillBottomRightX=046,fillTopLeftY=110,fillBottomRightY=30,
			{
				name="tips",type=4,typeName="Text",time=0,x=0,y=0,width=285,height=100,visible=0,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignCenter,fontSize=30,textAlign=kAlignCenter,colorRed=143,colorGreen=92,colorBlue=31,string=[[正加载中，请稍候...]],colorA=1
			},
			{
				name="content",type=0,typeName="View",time=0,x=0,y=0,width=488,height=560,visible=1,fillParentWidth=1,fillParentHeight=1,nodeAlign=kAlignCenter,fillTopLeftX=10,fillBottomRightX=10,fillTopLeftY=10,fillBottomRightY=10
			}
		}
	}
}
return invitational_create_slide_rule;