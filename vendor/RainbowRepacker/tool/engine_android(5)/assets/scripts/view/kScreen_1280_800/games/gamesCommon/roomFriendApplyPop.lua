local popup_map = require("qnFiles/qnPlist/games/popup");
roomFriendApplyPop=
{
	name="roomFriendApplyPop",type=0,typeName="View",time=0,report=0,x=0,y=0,width=12800,height=800,visible=1,fillParentWidth=1,fillParentHeight=1,nodeAlign=kAlignTopLeft,
	{
		name="maskBg",type=1,typeName="Image",time=66998185,report=0,x=0,y=0,width=1280,height=800,visible=1,fillParentWidth=1,fillParentHeight=1,nodeAlign=kAlignTopLeft,file="isolater/bg_shiled.png"
	},
	{
		name="bg",type=1,typeName="Image",time=66998262,report=0,x=0,y=0,width=582,height=316,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignCenter,file="games/common/animation/messagefly/envelop_big.png",
		{
			name="headFrame",type=1,typeName="Image",time=66998344,report=0,x=0,y=9,width=99,height=98,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTop,file="games/common/animation/messagefly/headFrame.png",
			{
				name="head",type=1,typeName="Image",time=66998426,report=0,x=0,y=0,width=76,height=72,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignCenter,file="isolater/female_head.png"
			}
		},
		{
			name="msg",type=4,typeName="Text",time=66998499,report=0,x=0,y=-22,width=289,height=34,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignCenter,fontSize=32,textAlign=kAlignLeft,colorRed=128,colorGreen=64,colorBlue=0,string=[[xxx请求加你为好友]]
		},
		{
			name="btnAgree",type=2,typeName="Button",time=66998613,report=0,x=55,y=45,width=200,height=85,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignBottomLeft,file="isolater/btns/200x85_green.png",
			{
				name="Text1",type=4,typeName="Text",time=66998724,report=0,x=0,y=-2,width=100,height=40,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignCenter,fontSize=40,textAlign=kAlignLeft,colorRed=255,colorGreen=255,colorBlue=232,string=[[同 意]]
			}
		},
		{
			name="btn_refuse",type=2,typeName="Button",time=66998783,report=0,x=55,y=45,width=200,height=85,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignBottomRight,file="games/common/btns/200x85_blue.png",
			{
				name="Text2",type=4,typeName="Text",time=66998875,report=0,x=0,y=0,width=60,height=24,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignCenter,fontSize=40,textAlign=kAlignLeft,colorRed=255,colorGreen=255,colorBlue=225,string=[[拒 绝]]
			}
		},
		{
			name="closeBtn",type=2,typeName="Button",time=67510030,report=0,x=500,y=10,width=52,height=52,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTopLeft,file=popup_map['btn_close.png']
		}
	}
}
return roomFriendApplyPop;