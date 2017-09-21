local floatBallDiskItem=
{
	name="floatBallDiskItem",type=0,typeName="View",time=0,x=0,y=0,width=454,height=267,visible=1,nodeAlign=kAlignTopLeft,fillParentWidth=0,fillParentHeight=0,
	{
		name="Image_bg",type=1,typeName="Image",time=0,x=0,y=0,width=454,height=267,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTopLeft,file="hall/floatBall/floatBallDiskItem_bg.png",varname="Image_bg"
	},
	{
		name="Image_ads",type=1,typeName="Image",time=0,x=0,y=0,width=454,height=267,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTopLeft,file="hall/common/bg_blank.png",varname="Image_ads",callbackfunc="onItemBoxBtnClick"
	},
	{
		name="Image_light",type=1,typeName="Image",time=0,x=0,y=0,width=454,height=267,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTopLeft,file="hall/floatBall/floatBallDiskItem_sel.png",varname="Image_light"
	}
}
return floatBallDiskItem;