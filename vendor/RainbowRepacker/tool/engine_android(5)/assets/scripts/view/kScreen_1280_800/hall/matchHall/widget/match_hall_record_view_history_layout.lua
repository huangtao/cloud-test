local match_hall_record_view_history_layout=
{
	name="match_hall_record_view_history_layout",type=0,typeName="View",time=0,x=0,y=-10,width=600,height=480,visible=1,nodeAlign=kAlignCenter,fillParentWidth=0,fillParentHeight=0,
	{
		name="emptyView",type=0,typeName="View",time=114951200,x=0,y=0,width=64,height=64,nodeAlign=kAlignTopLeft,visible=1,fillParentWidth=1,fillParentHeight=1,
		{
			name="tips",type=0,typeName="TextView",time=114951201,x=0,y=-60,width=500,height=350,nodeAlign=kAlignCenter,visible=1,fillParentWidth=0,fillParentHeight=0,string=[[您还未参加比赛~]],fontSize=40,textAlign=kAlignCenter,colorRed=143,colorGreen=92,colorBlue=31
		},
		{
			name="signupBtn",type=0,typeName="Button",time=114951204,x=0,y=30,width=250,height=89,nodeAlign=kAlignBottom,visible=1,fillParentWidth=0,fillParentHeight=0,file="hall/common/btns/btn_green_164x89_l25_r25_t25_b25.png",gridLeft=25,gridRight=25,gridTop=25,gridBottom=25,
			{
				name="text",type=4,typeName="Text",time=114951205,report=0,x=0,y=0,width=100,height=50,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignCenter,fontSize=32,textAlign=kAlignCenter,colorRed=255,colorGreen=245,colorBlue=204,string=[[马上报名]]
			}
		}
	},
	{
		name="contentView",type=0,typeName="View",time=116187639,x=0,y=0,width=64,height=64,nodeAlign=kAlignTopLeft,visible=1,fillParentWidth=1,fillParentHeight=1,
		{
			name="loadingView",type=0,typeName="View",time=116418109,x=0,y=-60,width=64,height=60,nodeAlign=kAlignBottom,visible=1,fillParentWidth=1,fillParentHeight=0
		}
	}
}
return match_hall_record_view_history_layout;