vipPropLayer=
{
	name="vipPropLayer",type=0,typeName="View",time=0,report=0,x=0,y=0,width=1280,height=800,visible=1,fillParentWidth=1,fillParentHeight=1,nodeAlign=kAlignTopLeft,
	{
		name="bg",type=1,typeName="Image",time=65181389,report=0,x=20,y=111,width=380,height=205,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignRight,file="isolater/white_main_bg.png",gridLeft=30,gridRight=30,gridTop=30,gridBottom=30,
		{
			name="vipContent",type=5,typeName="TextView",time=65181654,report=0,x=10,y=30,width=340,height=75,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTop,fontSize=27,textAlign=kAlignLeft,colorRed=0,colorGreen=58,colorBlue=120,string=[[您的VIP资格已经到期，立即续费吧！]]
		},
		{
			name="vipBuyBtn",type=2,typeName="Button",time=65181655,report=0,x=0,y=20,width=305,height=80,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignBottom,file="games/common/btns/300x130_green.png",gridLeft=20,gridRight=20,gridTop=20,gridBottom=20,
			{
				name="vipBuyBtnText",type=4,typeName="Text",time=65181656,report=0,x=0,y=0,width=0,height=0,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignCenter,fontSize=32,textAlign=kAlignLeft,colorRed=255,colorGreen=235,colorBlue=186,string=[[续 费]]
			}
		}
	}
}
return vipPropLayer;