local rechargeCard=
{
	name="rechargeCard",type=0,typeName="View",time=0,report=0,x=0,y=0,width=0,height=0,visible=1,fillParentWidth=1,fillParentHeight=1,nodeAlign=kAlignTopLeft,
	{
		name="top_bg",type=1,typeName="Image",time=58534888,report=0,x=0,y=0,width=1280,height=123,visible=1,fillParentWidth=1,fillParentHeight=0,nodeAlign=kAlignTop,file="hall/common/scene_top.png"
	},
	{
		name="ground_bg",type=1,typeName="Image",time=58534931,report=0,x=100,y=94,width=1280,height=635,fillTopLeftX=0,fillTopLeftY=90,fillBottomRightX=0,fillBottomRightY=0,visible=1,fillParentWidth=1,fillParentHeight=0,nodeAlign=kAlignTopLeft,file="hall/common/scene_bg.png"
	},
	{
		name="topView",type=0,typeName="View",time=58534969,report=0,x=0,y=0,width=1280,height=100,visible=1,fillParentWidth=1,fillParentHeight=0,nodeAlign=kAlignTopLeft,
		{
			name="returnBtn",type=2,typeName="Button",time=58534970,report=0,x=26,y=14,width=71,height=71,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTopLeft,file="hall/common/btn_return.png"
		}
	},
	{
		name="contentView",type=0,typeName="ScrollView",time=58536020,report=0,x=64,y=274,width=1280,height=800,visible=0,fillParentWidth=1,fillParentHeight=1,nodeAlign=kAlignCenter
	},
	{
		name="errorInfo",type=4,typeName="Text",time=58536154,report=0,x=0,y=0,width=240,height=30,visible=0,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignCenter,fontSize=36,textAlign=kAlignCenter,colorRed=255,colorGreen=250,colorBlue=200,string=[[充值卡页面加载失败]]
	}
}
return rechargeCard;