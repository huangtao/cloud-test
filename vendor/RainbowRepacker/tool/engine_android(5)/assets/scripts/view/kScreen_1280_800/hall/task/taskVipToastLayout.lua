local taskVipToastLayout=
{
	name="taskVipToastLayout",type=0,typeName="View",time=0,report=0,x=0,y=0,width=1280,height=720,visible=1,fillParentWidth=1,fillParentHeight=1,nodeAlign=kAlignTopLeft,
	{
		name="bg",type=1,typeName="Image",time=66277032,report=0,x=0,y=0,width=400,height=40,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignCenter,file="hall/common/loading_bg.png",gridLeft=25,gridRight=25,
		{
			name="text",type=4,typeName="Text",time=66277173,report=0,x=0,y=0,width=400,height=40,visible=1,fillParentWidth=1,fillParentHeight=1,nodeAlign=kAlignCenter,fontSize=24,textAlign=kAlignCenter,colorRed=240,colorGreen=248,colorBlue=255,string=[[您已经成功领取100银币]]
		}
	},
	{
		name="bg1",type=1,typeName="Image",time=66291936,report=0,x=0,y=0,width=400,height=40,visible=0,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignCenter,file="hall/common/loading_bg.png",gridLeft=25,gridRight=25,
		{
			name="text1",type=4,typeName="Text",time=66292006,report=0,x=0,y=0,width=264,height=40,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignCenter,fontSize=24,textAlign=kAlignCenter,colorRed=240,colorGreen=248,colorBlue=255,string=[[您已经成功领取100银币]]
		}
	}
}
return taskVipToastLayout;