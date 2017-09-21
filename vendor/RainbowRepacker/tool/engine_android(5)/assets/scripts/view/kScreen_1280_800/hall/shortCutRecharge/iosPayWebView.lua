local iosPayWebView=
{
	name="iosPayWebView",type=0,typeName="View",time=0,report=0,x=0,y=0,width=0,height=0,visible=1,fillParentWidth=1,fillParentHeight=1,nodeAlign=kAlignTopLeft,
	{
		name="bg",type=0,typeName="Image",time=96545409,x=0,y=0,width=1280,height=720,nodeAlign=kAlignTopLeft,visible=1,fillParentWidth=0,fillParentHeight=0,file="hall/common/bg_blank.png"
	},
	{
		name="top_bg",type=1,typeName="Image",time=58534888,report=0,x=0,y=0,width=1280,height=123,visible=1,fillParentWidth=1,fillParentHeight=0,nodeAlign=kAlignTop,file="hall/common/scene_top.png"
	},
	{
		name="ground_bg",type=1,typeName="Image",time=58534931,report=0,x=0,y=90,width=1280,height=710,fillTopLeftX=0,fillTopLeftY=90,fillBottomRightX=0,fillBottomRightY=0,visible=1,fillParentWidth=1,fillParentHeight=0,nodeAlign=kAlignTopLeft,file="hall/common/scene_bg.png"
	},
	{
		name="topView",type=0,typeName="View",time=58534969,report=0,x=0,y=0,width=1280,height=100,visible=1,fillParentWidth=1,fillParentHeight=0,nodeAlign=kAlignTopLeft,
		{
			name="returnBtn",type=2,typeName="Button",time=58534970,report=0,x=26,y=14,width=71,height=71,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTopLeft,file="hall/common/btn_return.png"
		}
	},
	{
		name="content",type=0,typeName="View",time=58535657,report=0,x=20,y=109,width=1240,height=675,fillTopLeftX=20,fillTopLeftY=110,fillBottomRightX=20,fillBottomRightY=15,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTopLeft
	}
}
return iosPayWebView;