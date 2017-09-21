local floatBallDisk=
{
	name="floatBallDisk",type=0,typeName="View",time=0,x=0,y=0,width=1280,height=720,visible=1,fillParentWidth=1,fillParentHeight=1,nodeAlign=kAlignTopLeft,
	{
		name="View_disk",type=0,typeName="View",time=0,x=0,y=0,width=521,height=720,visible=1,fillParentWidth=0,fillParentHeight=1,nodeAlign=kAlignRight,varname="View_disk",
		{
			name="Image_bg",type=1,typeName="Image",time=0,x=-759,y=273,width=521,height=720,visible=1,fillParentWidth=1,fillParentHeight=1,nodeAlign=kAlignTopLeft,file="hall/floatBall/floatBallDisk_bg.png",varname="Image_bg"
		},
		{
			name="Image_nothing",type=1,typeName="Image",time=0,x=-35,y=-14,width=611,height=92,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignCenter,file="hall/floatBall/floatBall_nothing.png",varname="Image_nothing"
		}
	}
}
return floatBallDisk;