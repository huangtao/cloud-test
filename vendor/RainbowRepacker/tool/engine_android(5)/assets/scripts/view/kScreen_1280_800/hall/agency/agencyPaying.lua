local agency_pin_map = require("qnFiles/qnPlist/hall/agency_pin");
local agencyPaying=
{
	name="agencyPaying",type=0,typeName="View",time=0,report=0,x=0,y=0,width=1280,height=800,visible=1,fillParentWidth=1,fillParentHeight=1,nodeAlign=kAlignTopLeft,
	{
		name="bg",type=1,typeName="Image",time=80708540,report=0,x=0,y=0,width=20,height=20,visible=1,fillParentWidth=1,fillParentHeight=1,nodeAlign=kAlignTopLeft,file=agency_pin_map['bg.png']
	},
	{
		name="top",type=1,typeName="Image",time=80707821,report=0,x=0,y=0,width=1280,height=90,visible=1,fillParentWidth=1,fillParentHeight=0,nodeAlign=kAlignTop,file=agency_pin_map['top_bar.png'],gridLeft=1,gridRight=1,gridTop=1,gridBottom=1,
		{
			name="title",type=4,typeName="Text",time=80708211,report=0,x=0,y=0,width=10,height=10,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignCenter,fontSize=48,textAlign=kAlignCenter,colorRed=255,colorGreen=255,colorBlue=255,string=[[请稍候]]
		}
	},
	{
		name="contentView",type=0,typeName="View",time=80708312,report=0,x=0,y=255,width=200,height=300,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTop,
		{
			name="loading",type=1,typeName="Image",time=80708613,report=0,x=0,y=0,width=75,height=75,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTop,file=agency_pin_map['loading_icon.png']
		},
		{
			name="Text1",type=4,typeName="Text",time=80708651,report=0,x=0,y=140,width=10,height=50,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTop,fontSize=32,textAlign=kAlignLeft,colorRed=69,colorGreen=173,colorBlue=41,string=[[您的订单已提交]]
		},
		{
			name="Text2",type=4,typeName="Text",time=80708700,report=0,x=0,y=200,width=10,height=50,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTop,fontSize=24,textAlign=kAlignLeft,colorRed=0,colorGreen=123,colorBlue=182,string=[[...请等待系统确认结果...]]
		}
	}
}
return agencyPaying;