local diamondShop_pin_map = require("qnFiles/qnPlist/hall/diamondShop_pin");
local diamondShopGoodsItem=
{
	name="diamondShopGoodsItem",type=0,typeName="View",time=0,report=0,x=0,y=0,width=460,height=300,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTopLeft,
	{
		name="view1",type=0,typeName="View",time=68972168,report=0,x=0,y=0,width=433,height=286,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignCenter,
		{
			name="contentBg",type=1,typeName="Image",time=68972629,report=0,x=0,y=0,width=433,height=286,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignCenter,file="hall/diamondshop/diamond_single_bg.png",gridLeft=20,gridRight=20,gridTop=20,gridBottom=20
		},
		{
			name="topView",type=0,typeName="View",time=77423925,report=0,x=0,y=0,width=433,height=60,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTop,
			{
				name="title",type=4,typeName="Text",time=68972561,report=0,x=0,y=0,width=440,height=55,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignCenter,fontSize=32,textAlign=kAlignCenter,colorRed=255,colorGreen=235,colorBlue=186,string=[[10元话费]]
			}
		},
		{
			name="goodsImage",type=1,typeName="Image",time=68972740,report=0,x=10,y=25,width=262,height=200,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignLeft,file=diamondShop_pin_map['default.png']
		},
		{
			name="priceBg",type=1,typeName="Image",time=68972936,report=0,x=35,y=80,width=160,height=54,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTopRight,file=diamondShop_pin_map['diamond_price_bg_l10_r10_t10_b10.png'],gridLeft=10,gridRight=10,gridTop=10,gridBottom=10,
			{
				name="icon",type=1,typeName="Image",time=68972994,report=0,x=10,y=0,width=50,height=50,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignLeft,file="hall/common/diamond.png"
			},
			{
				name="needDiamond",type=4,typeName="Text",time=68973058,report=0,x=60,y=0,width=120,height=40,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignLeft,fontSize=30,textAlign=kAlignLeft,colorRed=255,colorGreen=252,colorBlue=0,string=[[x1000]]
			}
		},
		{
			name="leftView",type=0,typeName="View",time=77447963,report=0,x=15,y=130,width=205,height=40,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTopRight,
			{
				name="Text1",type=4,typeName="Text",time=68973163,report=0,x=22,y=0,width=126,height=40,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignLeft,fontSize=26,textAlign=kAlignLeft,colorRed=118,colorGreen=72,colorBlue=18,string=[[剩余个数:]]
			},
			{
				name="leftNum",type=4,typeName="Text",time=68973204,report=0,x=140,y=0,width=61,height=40,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignLeft,fontSize=26,textAlign=kAlignLeft,colorRed=255,colorGreen=255,colorBlue=0,string=[[10个]]
			}
		},
		{
			name="exchangeBtn",type=2,typeName="Button",time=68973237,report=0,x=22,y=30,width=180,height=89,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignBottomRight,file="hall/common/btns/btn_green_164x89_l25_r25_t25_b25.png",gridLeft=25,gridRight=25,gridTop=25,gridBottom=25,
			{
				name="Text3",type=4,typeName="Text",time=68973331,report=0,x=0,y=0,width=100,height=43,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignCenter,fontSize=36,textAlign=kAlignCenter,colorRed=255,colorGreen=235,colorBlue=186,string=[[兑 换]]
			}
		}
	}
}
return diamondShopGoodsItem;