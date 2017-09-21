roomFriendApplyPop2=
{
	name="roomFriendApplyPop2",type=0,typeName="View",time=0,report=0,x=0,y=0,width=1280,height=720,visible=1,fillParentWidth=1,fillParentHeight=1,nodeAlign=kAlignTop,
	{
		name="bg",type=0,typeName="Image",time=119556800,x=0,y=0,width=622,height=93,nodeAlign=kAlignTop,visible=1,fillParentWidth=0,fillParentHeight=0,file="games/common/animation/messagefly/apply_bg.png",gridTop=15,gridBottom=15,gridLeft=15,gridRight=15,
		{
			name="headFrame",type=0,typeName="Image",time=119557039,x=10,y=0,width=74,height=74,nodeAlign=kAlignLeft,visible=1,fillParentWidth=0,fillParentHeight=0,file="hall/common/head_bg_74.png"
		},
		{
			name="infoView",type=0,typeName="View",time=119617643,x=90,y=0,width=230,height=70,nodeAlign=kAlignLeft,visible=1,fillParentWidth=0,fillParentHeight=0,
			{
				name="userName",type=0,typeName="Text",time=119617636,x=2,y=0,width=132,height=33,nodeAlign=kAlignTopLeft,visible=1,fillParentWidth=0,fillParentHeight=0,string=[[playerName]],fontSize=28,textAlign=kAlignLeft,colorRed=255,colorGreen=255,colorBlue=255
			},
			{
				name="tips",type=0,typeName="Text",time=119617715,x=0,y=0,width=224,height=33,nodeAlign=kAlignBottomLeft,visible=1,fillParentWidth=0,fillParentHeight=0,string=[[想要添加你为好友]],fontSize=28,textAlign=kAlignLeft,colorRed=230,colorGreen=211,colorBlue=0
			}
		},
		{
			name="btnAgree",type=2,typeName="Button",time=66998613,report=0,x=10,y=1,width=147,height=80,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignRight,file="isolater/btns/btn_green_164x89_l25_r25_t25_b25.png",
			{
				name="Text1",type=4,typeName="Text",time=66998724,report=0,x=0,y=-2,width=68,height=40,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignCenter,fontSize=30,textAlign=kAlignLeft,colorRed=255,colorGreen=235,colorBlue=186,string=[[同 意]]
			}
		},
		{
			name="btn_refuse",type=2,typeName="Button",time=66998783,report=0,x=157,y=1,width=147,height=80,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignRight,file="isolater/btns/btn_orange_164x89_l25_r25_t25_b25.png",gridLeft=25,gridRight=25,gridTop=25,gridBottom=25,
			{
				name="Text2",type=4,typeName="Text",time=66998875,report=0,x=0,y=0,width=68,height=34,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignCenter,fontSize=30,textAlign=kAlignLeft,colorRed=255,colorGreen=235,colorBlue=186,string=[[拒 绝]]
			}
		}
	}
}
return roomFriendApplyPop2;