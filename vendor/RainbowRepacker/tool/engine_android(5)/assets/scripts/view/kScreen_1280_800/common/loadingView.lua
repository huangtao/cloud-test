local loadingView=
{
	name="loadingView",type=0,typeName="View",time=0,report=0,x=0,y=0,width=1050,height=515,visible=1,fillParentWidth=1,fillParentHeight=1,nodeAlign=kAlignTopLeft,
	{
		name="sheild",type=1,typeName="Image",time=34141721,report=0,x=0,y=0,width=1280,height=800,visible=0,fillParentWidth=1,fillParentHeight=1,nodeAlign=kAlignTopLeft,file="hall/common/bg_shiled.png"
	},
	{
		name="view_bg",type=0,typeName="View",time=40628075,report=0,x=0,y=0,width=1280,height=800,visible=1,fillParentWidth=1,fillParentHeight=1,nodeAlign=kAlignTopLeft
	},
	{
		name="loading",type=0,typeName="View",time=40542402,report=0,x=0,y=-16,width=420,height=80,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignCenter,
		{
			name="bg",type=1,typeName="Image",time=40558242,report=0,x=0,y=0,width=420,height=80,visible=1,fillParentWidth=1,fillParentHeight=1,nodeAlign=kAlignTopLeft,file="hall/common/loading_bg.png",gridLeft=15,gridRight=15,gridTop=15,gridBottom=15
		},
		{
			name="indicator",type=1,typeName="Image",time=40542403,report=0,x=19,y=0,width=42,height=42,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignLeft,file="hall/common/loading.png"
		}
	}
}
return loadingView;