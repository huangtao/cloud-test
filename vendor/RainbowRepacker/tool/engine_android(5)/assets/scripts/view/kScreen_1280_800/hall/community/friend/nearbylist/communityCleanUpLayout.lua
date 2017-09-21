local communityCleanUpLayout=
{
	name="communityCleanUpLayout",type=0,typeName="View",time=0,report=0,x=0,y=0,width=1280,height=720,visible=1,fillParentWidth=1,fillParentHeight=1,nodeAlign=kAlignTopLeft,
	{
		name="cleanUplocal",type=1,typeName="Image",time=91600158,report=0,x=0,y=0,width=1280,height=720,visible=1,fillParentWidth=1,fillParentHeight=1,nodeAlign=kAlignTopLeft,file="hall/common/bg_shiled.png",
		{
			name="cleanupBg",type=1,typeName="Image",time=91600159,report=0,x=0,y=-12,width=735,height=500,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignCenter,file="hall/common/popupWindow/popupWindow_bg_55_55_55_55.png",gridLeft=55,gridRight=55,gridTop=55,gridBottom=55,
			{
				name="titleBg",type=1,typeName="Image",time=91600160,report=0,x=0,y=-55,width=617,height=190,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTop,file="hall/common/popupWindow/popupWindow_title.png",gridLeft=25,gridRight=25,
				{
					name="Text3",type=4,typeName="Text",time=91600161,report=0,x=0,y=-5,width=105,height=40,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignCenter,fontSize=34,textAlign=kAlignCenter,colorRed=255,colorGreen=245,colorBlue=204,string=[[确认清除]]
				}
			},
			{
				name="closeBtn",type=2,typeName="Button",time=91600162,report=0,x=-15,y=-15,width=60,height=60,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTopRight,file="hall/common/popupWindow/popupWindow_close.png"
			},
			{
				name="confirmBtn",type=2,typeName="Button",time=91600163,report=0,x=120,y=25,width=200,height=85,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignBottomRight,file="hall/common/btns/btn_green_164x89_l25_r25_t25_b25.png",gridLeft=25,gridRight=25,gridTop=25,gridBottom=25,
				{
					name="Text6",type=4,typeName="Text",time=91600164,report=0,x=0,y=0,width=200,height=80,visible=1,fillParentWidth=1,fillParentHeight=0,nodeAlign=kAlignTopLeft,fontSize=34,textAlign=kAlignCenter,colorRed=255,colorGreen=245,colorBlue=204,string=[[确 定]]
				}
			},
			{
				name="btnCancel",type=2,typeName="Button",time=91600165,report=0,x=120,y=25,width=200,height=85,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignBottomLeft,file="hall/common/btns/btn_orange_164x89_l25_r25_t25_b25.png",gridLeft=25,gridRight=25,gridTop=25,gridBottom=25,
				{
					name="Text7",type=4,typeName="Text",time=91600166,report=0,x=0,y=0,width=200,height=84,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTopLeft,fontSize=34,textAlign=kAlignCenter,colorRed=255,colorGreen=245,colorBlue=204,string=[[取 消]]
				}
			},
			{
				name="Text4",type=4,typeName="Text",time=91600167,report=0,x=0,y=-70,width=491,height=45,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignCenter,fontSize=32,textAlign=kAlignCenter,colorRed=118,colorGreen=72,colorBlue=18,string=[[确认清除地理位置信息？]]
			},
			{
				name="Text41",type=4,typeName="Text",time=102272902,report=0,x=0,y=30,width=491,height=45,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignCenter,fontSize=24,textAlign=kAlignCenter,colorRed=118,colorGreen=72,colorBlue=18,string=[[清除位置信息后，其他玩家将不能找到你、跟你一起玩哦~]]
			}
		}
	}
}
return communityCleanUpLayout;