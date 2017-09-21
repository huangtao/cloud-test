local market_pin_map = require("qnFiles/qnPlist/hall/market_pin");
local rechargeVipItem=
{
	name="rechargeVipItem",type=0,typeName="View",time=0,report=0,x=0,y=0,width=400,height=420,visible=1,fillParentWidth=0,fillParentHeight=1,nodeAlign=kAlignTopLeft,
	{
		name="itemBtn",type=2,typeName="Button",time=65772809,report=0,x=0,y=0,width=304,height=351,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignCenter,file=market_pin_map['vip_good_bg.png'],
		{
			name="vip_name",type=4,typeName="Text",time=78061266,report=0,x=0,y=20,width=131,height=43,visible=0,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTop,fontSize=36,textAlign=kAlignLeft,colorRed=255,colorGreen=245,colorBlue=204,string=[[VIP月卡]]
		},
		{
			name="vip_img",type=1,typeName="Image",time=89525261,report=0,x=0,y=20,width=165,height=38,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTop,file=market_pin_map['vip_month_title.png']
		},
		{
			name="vip_type",type=1,typeName="Image",time=89525296,report=0,x=0,y=72,width=223,height=142,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTop,file=market_pin_map['vip_month_icon.png']
		},
		{
			name="vip_price_bg",type=0,typeName="View",time=89525300,report=0,x=0,y=102,width=201,height=50,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignBottom,
			{
				name="vip_price_bg",type=0,typeName="Image",time=105705023,x=0,y=0,width=213,height=28,nodeAlign=kAlignCenter,visible=1,fillParentWidth=0,fillParentHeight=0,file="hall/common/price_star.png"
			},
			{
				name="vip_price_img",type=1,typeName="Image",time=89525301,report=0,x=0,y=0,width=165,height=38,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignCenter,file=market_pin_map['price_2.png']
			},
			{
				name="vip_price_txt",type=4,typeName="Text",time=89525302,report=0,x=0,y=0,width=0,height=0,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignCenter,fontSize=28,textAlign=kAlignLeft,colorRed=255,colorGreen=245,colorBlue=204
			}
		},
		{
			name="vip_desc_bg",type=0,typeName="View",time=89525304,report=0,x=0,y=7,width=280,height=90,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignBottom,
			{
				name="vip_info_txt",type=5,typeName="TextView",time=89525305,report=0,x=0,y=-2,width=280,height=63,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignCenter,fontSize=22,textAlign=kAlignCenter,colorRed=255,colorGreen=245,colorBlue=204
			}
		}
	}
}
return rechargeVipItem;