local bankrupt_pin_map = require("qnFiles/qnPlist/hall/bankrupt_pin");
local brokeAllowance=
{
	name="brokeAllowance",type=0,typeName="View",time=0,report=0,x=0,y=0,width=0,height=0,visible=1,fillParentWidth=1,fillParentHeight=1,nodeAlign=kAlignTopLeft,
	{
		name="shiled",type=1,typeName="Image",time=33715720,report=0,x=0,y=0,width=1280,height=720,visible=1,fillParentWidth=1,fillParentHeight=1,nodeAlign=kAlignTopLeft,file="hall/common/bg_shiled.png"
	},
	{
		name="centerView",type=0,typeName="View",time=33618746,report=0,x=0,y=0,width=970,height=617,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignCenter,
		{
			name="bg",type=1,typeName="Image",time=33618809,report=0,x=0,y=0,width=98,height=96,visible=1,fillParentWidth=1,fillParentHeight=1,nodeAlign=kAlignTopLeft,file="hall/common/popupWindow/popupWindow_bg_55_55_55_55.png",gridLeft=55,gridRight=55,gridTop=55,gridBottom=55
		},
		{
			name="leftView",type=0,typeName="View",time=33625809,report=0,x=5,y=95,width=438,height=450,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTopLeft,
			{
				name="loading_text",type=4,typeName="Text",time=43212698,report=0,x=0,y=-48,width=0,height=0,visible=0,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignCenter,fontSize=30,textAlign=kAlignCenter,colorRed=198,colorGreen=84,colorBlue=0,string=[[正在加载破产信息...]]
			},
			{
				name="vipView",type=0,typeName="View",time=65154652,report=0,x=0,y=-50,width=430,height=50,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignBottom,
				{
					name="vipTip",type=4,typeName="Text",time=65154813,report=0,x=7,y=0,width=300,height=50,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTopLeft,fontSize=24,textAlign=kAlignCenter,colorRed=235,colorGreen=73,colorBlue=41,string=[[VIP领取救济金无需等待]]
				},
				{
					name="vipButton",type=2,typeName="Button",time=65155099,report=0,x=10,y=0,width=110,height=44,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignRight,file="hall/common/btns/btnRed.png",gridLeft=25,gridRight=25,gridTop=19,gridBottom=19,
					{
						name="vipButtonText",type=4,typeName="Text",time=65155173,report=0,x=0,y=0,width=0,height=0,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignCenter,fontSize=22,textAlign=kAlignCenter,colorRed=253,colorGreen=223,colorBlue=192,string=[[开通VIP]]
					}
				}
			},
			{
				name="sepLine",type=1,typeName="Image",time=33625902,report=0,x=0,y=10,width=3,height=500,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignRight,file="hall/common/split_line_v.png"
			}
		},
		{
			name="rightView",type=0,typeName="View",time=33625824,report=0,x=5,y=95,width=520,height=450,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTopRight,
			{
				name="listView",type=0,typeName="ListView",time=42956672,report=0,x=0,y=0,width=480,height=460,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTop
			},
			{
				name="loading_text",type=4,typeName="Text",time=43212473,report=0,x=0,y=0,width=195,height=30,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignCenter,fontSize=30,textAlign=kAlignCenter,colorRed=85,colorGreen=85,colorBlue=85,string=[[商品加载中...]]
			}
		},
		{
			name="topView",type=0,typeName="View",time=42796326,report=0,x=0,y=0,width=970,height=95,visible=1,fillParentWidth=1,fillParentHeight=0,nodeAlign=kAlignTop,
			{
				name="top_bg",type=1,typeName="Image",time=61001954,report=0,x=0,y=-45,width=919,height=155,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTop,file="hall/bankrupt/title.png",
				{
					name="Text1",type=4,typeName="Text",time=61002618,report=0,x=0,y=-5,width=454,height=41,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignCenter,fontSize=35,textAlign=kAlignCenter,colorRed=255,colorGreen=235,colorBlue=186,string=[[居然没钱啦]]
				}
			}
		},
		{
			name="closeBtn",type=2,typeName="Button",time=33626370,report=0,x=-15,y=-15,width=60,height=60,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTopRight,file="hall/common/popupWindow/popupWindow_close.png"
		},
		{
			name="moreGold",type=4,typeName="Text",time=33629294,report=0,x=70,y=20,width=148,height=33,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignBottomRight,fontSize=28,textAlign=kAlignCenter,colorRed=143,colorGreen=92,colorBlue=31,string=[[更多商品>>]]
		},
		{
			name="leaf1",type=1,typeName="Image",time=90055326,report=0,x=-87,y=545,width=108,height=65,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTopLeft,file=bankrupt_pin_map['leaf1.png']
		},
		{
			name="leaf2",type=1,typeName="Image",time=90055390,report=0,x=-143,y=462,width=90,height=55,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTopLeft,file=bankrupt_pin_map['leaf1.png']
		},
		{
			name="leaf3",type=1,typeName="Image",time=90055561,report=0,x=599,y=594,width=108,height=65,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTopLeft,file=bankrupt_pin_map['leaf1.png']
		},
		{
			name="leaf4",type=1,typeName="Image",time=90055587,report=0,x=951,y=437,width=163,height=146,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTopLeft,file=bankrupt_pin_map['leaf2.png']
		}
	}
}
return brokeAllowance;