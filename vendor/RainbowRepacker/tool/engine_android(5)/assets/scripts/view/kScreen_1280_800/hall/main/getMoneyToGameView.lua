local roomLevels_pin_map = require("qnFiles/qnPlist/hall/roomLevels_pin");
local getMoneyToGameView=
{
	name="getMoneyToGameView",type=0,typeName="View",time=0,report=0,x=0,y=0,width=1280,height=720,visible=1,fillParentWidth=1,fillParentHeight=1,nodeAlign=kAlignTopLeft,
	{
		name="maskView",type=1,typeName="Image",time=77791700,report=0,x=0,y=0,width=1280,height=720,visible=1,fillParentWidth=1,fillParentHeight=1,nodeAlign=kAlignTopLeft,file="hall/common/bg_shiled.png"
	},
	{
		name="bg",type=1,typeName="Image",time=59463769,report=0,x=0,y=0,width=800,height=450,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignCenter,file="hall/common/popupWindow/popupWindow_bg_55_55_55_55.png",gridLeft=55,gridRight=55,gridTop=55,gridBottom=55,
		{
			name="Image1",type=1,typeName="Image",time=77791772,report=0,x=0,y=-55,width=617,height=190,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTop,file="hall/common/popupWindow/popupWindow_title.png",
			{
				name="Text2",type=4,typeName="Text",time=77792366,report=0,x=0,y=-8,width=136,height=50,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignCenter,fontSize=34,textAlign=kAlignLeft,colorRed=255,colorGreen=235,colorBlue=186,string=[[温馨提示]]
			}
		},
		{
			name="closeBtn",type=0,typeName="Button",time=114619864,x=-15,y=-15,width=60,height=60,nodeAlign=kAlignTopRight,visible=1,fillParentWidth=0,fillParentHeight=0,file="hall/common/popupWindow/popupWindow_close.png"
		},
		{
			name="getMoneyBtn",type=0,typeName="Button",time=114619742,x=0,y=70,width=386,height=91,nodeAlign=kAlignBottom,visible=1,fillParentWidth=0,fillParentHeight=0,file="hall/common/btns/btn_green_164x89_l25_r25_t25_b25.png",gridLeft=25,gridRight=25,gridTop=25,gridBottom=25,
			{
				name="Text1",type=0,typeName="Text",time=114619743,x=75,y=0,width=136,height=64,nodeAlign=kAlignRight,visible=1,fillParentWidth=0,fillParentHeight=0,string=[[取钱入场]],fontSize=34,textAlign=kAlignCenter,colorRed=255,colorGreen=235,colorBlue=186
			},
			{
				name="Image1",type=0,typeName="Image",time=114621247,x=70,y=0,width=60,height=57,nodeAlign=kAlignLeft,visible=1,fillParentWidth=0,fillParentHeight=0,file=roomLevels_pin_map['safeBoxIcon.png']
			}
		},
		{
			name="desView",type=0,typeName="View",time=114622750,x=0,y=140,width=64,height=64,nodeAlign=kAlignTop,visible=1,fillParentWidth=0,fillParentHeight=0
		},
		{
			name="tipsText",type=0,typeName="Text",time=114622836,x=0,y=190,width=360,height=64,nodeAlign=kAlignTop,visible=1,fillParentWidth=0,fillParentHeight=0,string=[[土豪，你的保险箱里有大把银币！]],fontSize=24,textAlign=kAlignCenter,colorRed=160,colorGreen=139,colorBlue=98,colorA=1
		}
	}
}
return getMoneyToGameView;