local invitational_invite_qr=
{
	name="invitational_invite_qr",type=0,typeName="View",time=0,x=0,y=0,width=1280,height=720,visible=1,fillParentWidth=1,fillParentHeight=1,nodeAlign=kAlignCenter,
	{
		name="content",type=0,typeName="View",time=0,x=0,y=0,width=606,height=720,visible=1,fillParentWidth=0,fillParentHeight=1,nodeAlign=kAlignRight,
		{
			name="bg",type=1,typeName="Image",time=0,x=0,y=0,width=623,height=720,visible=1,fillParentWidth=0,fillParentHeight=1,nodeAlign=kAlignRight,file="hall/invitational/invite_content_bg.png"
		},
		{
			name="titleView",type=0,typeName="View",time=0,x=0,y=0,width=606,height=78,visible=1,fillParentWidth=1,fillParentHeight=0,nodeAlign=kAlignTop,
			{
				name="title",type=4,typeName="Text",time=0,x=0,y=0,width=128,height=36,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignCenter,fontSize=32,textAlign=kAlignCenter,colorRed=159,colorGreen=115,colorBlue=50,colorA=1,string=[[扫二维码]]
			}
		},
		{
			name="contentView",type=0,typeName="View",time=0,x=0,y=0,width=606,height=642,visible=1,fillParentWidth=1,fillParentHeight=0,nodeAlign=kAlignBottom,
			{
				name="qrView",type=0,typeName="View",time=116697089,x=0,y=0,width=606,height=642,nodeAlign=kAlignTopLeft,visible=1,fillParentWidth=1,fillParentHeight=1,
				{
					name="qrImage",type=0,typeName="Image",time=116713230,x=0,y=-20,width=267,height=267,nodeAlign=kAlignCenter,visible=1,fillParentWidth=0,fillParentHeight=0,file="hall/common/bg_blank.png",varname="qrImage"
				},
				{
					name="qrTips",type=0,typeName="TextView",time=116700923,x=10,y=193,width=388,height=86,nodeAlign=kAlignCenter,visible=1,fillParentWidth=0,fillParentHeight=0,string=[[用“扫一扫”功能扫描二维码 ，立即加入邀请赛]],fontSize=26,textAlign=kAlignLeft,colorRed=143,colorGreen=92,colorBlue=31,colorA=1,varname="qrTips"
				},
				{
					name="errorTips",type=0,typeName="Text",time=116712986,x=0,y=-20,width=308,height=64,nodeAlign=kAlignCenter,visible=0,fillParentWidth=0,fillParentHeight=0,string=[[亲，创建二维码失败了！]],fontSize=24,textAlign=kAlignCenter,colorRed=143,colorGreen=92,colorBlue=31,colorA=1
				},
				{
					name="topTips",type=0,typeName="Text",time=116712986,x=0,y=-220,width=264,height=64,nodeAlign=kAlignCenter,visible=1,fillParentWidth=0,fillParentHeight=0,string=[[比赛二维码]],fontSize=28,textAlign=kAlignCenter,colorRed=143,colorGreen=92,colorBlue=31,colorA=1
				}
			},
			{
				name="tips",type=4,typeName="Text",time=0,x=0,y=-40,width=285,height=100,visible=0,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignCenter,fontSize=30,textAlign=kAlignCenter,colorRed=143,colorGreen=92,colorBlue=31,string=[[正加载中，请稍候...]],colorA=1,varname="tips"
			}
		}
	}
}
return invitational_invite_qr;