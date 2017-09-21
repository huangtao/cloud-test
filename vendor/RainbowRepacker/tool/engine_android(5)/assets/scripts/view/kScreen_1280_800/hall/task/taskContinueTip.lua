local dailyReward_map = require("qnFiles/qnPlist/hall/dailyReward");
local userInfo_pin_map = require("qnFiles/qnPlist/hall/userInfo_pin");
local taskContinueTip=
{
	name="taskContinueTip",type=0,typeName="View",time=0,report=0,x=0,y=0,width=1280,height=800,visible=1,fillParentWidth=1,fillParentHeight=1,nodeAlign=kAlignTopLeft,
	{
		name="subView",type=1,typeName="Image",time=71397467,report=0,x=1,y=0,width=1280,height=800,visible=1,fillParentWidth=1,fillParentHeight=1,nodeAlign=kAlignCenter,file="hall/common/bg_shiled.png"
	},
	{
		name="bg",type=1,typeName="Image",time=71397602,report=0,x=0,y=0,width=680,height=465,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignCenter,file="hall/common/popupWindow/popupWindow_bg_55_55_55_55.png",gridLeft=55,gridRight=55,gridTop=55,gridBottom=55,
		{
			name="titleBg",type=1,typeName="Image",time=77958725,report=0,x=0,y=-55,width=617,height=190,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTop,file="hall/common/popupWindow/popupWindow_title.png",
			{
				name="title",type=4,typeName="Text",time=77958726,report=0,x=0,y=-8,width=105,height=50,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignCenter,fontSize=34,textAlign=kAlignCenter,colorRed=255,colorGreen=235,colorBlue=186,string=[[小提示]]
			}
		},
		{
			name="numText",type=4,typeName="Text",time=71397673,report=0,x=0,y=-120,width=317,height=50,visible=1,fillParentWidth=1,fillParentHeight=0,nodeAlign=kAlignCenter,fontSize=34,textAlign=kAlignLeft,colorRed=118,colorGreen=72,colorBlue=18,string=[[恭喜你连续签到 7 天]]
		},
		{
			name="nameText",type=4,typeName="Text",time=71399500,report=0,x=50,y=-70,width=200,height=50,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignCenter,fontSize=34,textAlign=kAlignLeft,colorRed=234,colorGreen=72,colorBlue=40,string=[[银币10000]]
		},
		{
			name="Text1",type=4,typeName="Text",time=71399604,report=0,x=-92,y=-70,width=70,height=50,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignCenter,fontSize=34,textAlign=kAlignLeft,colorRed=118,colorGreen=72,colorBlue=18,string=[[获得]]
		},
		{
			name="Image1",type=1,typeName="Image",time=71399312,report=0,x=0,y=45,width=148,height=148,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignCenter,file=userInfo_pin_map['quality_yellow.png'],gridLeft=25,gridRight=25,gridTop=25,gridBottom=25,
			{
				name="rewardImage",type=1,typeName="Image",time=71399846,report=0,x=0,y=0,width=80,height=69,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignCenter,file=dailyReward_map['sign_gold.png']
			}
		},
		{
			name="okBtn",type=2,typeName="Button",time=71399765,report=0,x=0,y=12,width=200,height=85,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignBottom,file="hall/common/btns/btn_green_164x89_l25_r25_t25_b25.png",gridLeft=25,gridRight=25,gridTop=25,gridBottom=25,
			{
				name="Text2",type=4,typeName="Text",time=71399973,report=0,x=0,y=0,width=200,height=50,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignCenter,fontSize=36,textAlign=kAlignCenter,colorRed=255,colorGreen=235,colorBlue=186,string=[[确  定]]
			}
		},
		{
			name="closeBtn",type=2,typeName="Button",time=77958727,report=0,x=-15,y=-15,width=60,height=60,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTopRight,file="hall/common/popupWindow/popupWindow_close.png"
		}
	}
}
return taskContinueTip;