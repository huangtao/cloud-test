local dailyReward_map = require("qnFiles/qnPlist/hall/dailyReward");
local dayTaskItem=
{
	name="dayTaskItem",type=0,typeName="View",time=0,report=0,x=0,y=0,width=684,height=135,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTopLeft,
	{
		name="bg",type=1,typeName="Image",time=58623324,report=0,x=0,y=0,width=686,height=134,visible=1,fillParentWidth=1,fillParentHeight=0,nodeAlign=kAlignTop,file=dailyReward_map['task_tab_t20_b20_l20_r20.png'],gridLeft=20,gridRight=20,gridTop=20,gridBottom=20,
		{
			name="taskIcon",type=1,typeName="Image",time=58623471,report=0,x=15,y=0,width=110,height=110,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignLeft,file="hall/activity/activity_gift_icon.png",gridLeft=20,gridRight=20,gridTop=20,gridBottom=20
		},
		{
			name="btn",type=2,typeName="Button",time=58623716,report=0,x=15,y=0,width=200,height=85,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignRight,file="hall/common/btns/btn_green_164x89_l25_r25_t25_b25.png",gridLeft=25,gridRight=25,gridTop=25,gridBottom=25,
			{
				name="doTask",type=4,typeName="Text",time=58623804,report=0,x=0,y=0,width=148,height=43,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignCenter,fontSize=36,textAlign=kAlignCenter,colorRed=255,colorGreen=235,colorBlue=186,string=[[立即领取]]
			}
		},
		{
			name="taskName",type=4,typeName="Text",time=58623927,report=0,x=147,y=-25,width=132,height=37,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignLeft,fontSize=32,textAlign=kAlignLeft,colorRed=118,colorGreen=72,colorBlue=18,string=[[麻将任务]]
		},
		{
			name="progress",type=4,typeName="Text",time=60398856,report=0,x=230,y=-25,width=50,height=35,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignRight,fontSize=30,textAlign=kAlignLeft,colorRed=234,colorGreen=72,colorBlue=40,string=[[0/1]]
		},
		{
			name="rewardArea",type=0,typeName="View",time=58624221,report=0,x=147,y=25,width=300,height=39,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignLeft,
			{
				name="Text1",type=4,typeName="Text",time=58624061,report=0,x=0,y=0,width=81,height=30,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignLeft,fontSize=26,textAlign=kAlignLeft,colorRed=118,colorGreen=72,colorBlue=18,string=[[奖励：]]
			},
			{
				name="Image2",type=1,typeName="Image",time=58624166,report=0,x=70,y=0,width=65,height=56,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignLeft,file="isolater/gold_big.png"
			},
			{
				name="rewardNum",type=0,typeName="View",time=90470620,report=0,x=145,y=0,width=180,height=40,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTopLeft
			}
		}
	}
}
return dayTaskItem;