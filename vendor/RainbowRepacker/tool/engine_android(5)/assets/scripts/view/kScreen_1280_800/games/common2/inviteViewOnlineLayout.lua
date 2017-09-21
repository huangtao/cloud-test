local inviteViewOnlineLayout=
{
	name="inviteViewOnlineLayout",type=0,typeName="View",time=0,x=0,y=0,width=1280,height=720,visible=1,fillParentWidth=1,fillParentHeight=1,nodeAlign=kAlignTopLeft,
	{
		name="content",type=0,typeName="View",time=106939128,x=0,y=0,width=606,height=720,nodeAlign=kAlignRight,visible=1,fillParentWidth=0,fillParentHeight=1,
		{
			name="onlineView",type=0,typeName="View",time=106941292,x=0,y=0,width=598,height=720,nodeAlign=kAlignRight,visible=1,fillParentWidth=0,fillParentHeight=1,
			{
				name="bg",type=1,typeName="Image",time=0,x=0,y=0,width=623,height=720,visible=1,fillParentWidth=0,fillParentHeight=1,nodeAlign=kAlignRight,file="games/common/friend/invite_content_bg.png"
			},
			{
				name="titleView",type=0,typeName="View",time=0,x=0,y=0,width=598,height=78,visible=1,fillParentWidth=1,fillParentHeight=0,nodeAlign=kAlignTop,
				{
					name="title",type=4,typeName="Text",time=0,x=0,y=0,width=128,height=36,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignCenter,fontSize=32,textAlign=kAlignCenter,colorRed=159,colorGreen=115,colorBlue=50,colorA=1,string=[[在线好友]]
				}
			},
			{
				name="contentView",type=0,typeName="View",time=0,x=0,y=0,width=598,height=642,visible=1,fillParentWidth=1,fillParentHeight=0,nodeAlign=kAlignBottomLeft,
				{
					name="listView",type=0,typeName="ListView",time=106941524,x=0,y=-70,width=518,height=431,nodeAlign=kAlignCenter,visible=1,fillParentWidth=0,fillParentHeight=0
				},
				{
					name="inviteBtn",type=2,typeName="Button",time=67141150,report=0,x=0,y=236,width=235,height=89,visible=0,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignCenter,file="isolater/btns/btn_green_164x89_l25_r25_t25_b25.png",file2="isolater/btns/btn_gray_163x89_l25_r25_t25_b25.png",gridLeft=25,gridRight=25,gridTop=25,gridBottom=25,
					{
						name="text",type=4,typeName="Text",time=67141249,report=0,x=0,y=0,width=96,height=40,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignCenter,fontSize=32,textAlign=kAlignCenter,colorRed=255,colorGreen=255,colorBlue=200,string=[[邀  请]],colorA=1
					}
				},
				{
					name="emptyImg",type=1,typeName="Image",time=0,x=0,y=-75,width=200,height=177,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignCenter,file="games/common/friend/invite_icon_online.png"
				},
				{
					name="emptyTips",type=4,typeName="Text",time=0,x=0,y=78,width=350,height=60,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignCenter,fontSize=26,textAlign=kAlignCenter,colorRed=143,colorGreen=92,colorBlue=31,colorA=1
				}
			}
		}
	}
}
return inviteViewOnlineLayout;