local market_pin_map = require("qnFiles/qnPlist/hall/market_pin");
local userInfo_pin_map = require("qnFiles/qnPlist/hall/userInfo_pin");
local vipTypeItem=
{
	name="vipTypeItem",type=0,typeName="View",time=0,report=0,x=0,y=0,width=304,height=200,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTopLeft,
	{
		name="bg",type=1,typeName="Image",time=79687029,report=0,x=0,y=0,width=223,height=142,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTop,file=market_pin_map['vip_month_icon.png'],
		{
			name="overflow",type=1,typeName="Image",time=82112623,report=0,x=3,y=0,width=74,height=77,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTopRight,file=userInfo_pin_map['overflow.png']
		}
	},
	{
		name="selectImg",type=0,typeName="Image",time=117823027,x=90,y=144,width=40,height=41,nodeAlign=kAlignTopLeft,visible=1,fillParentWidth=0,fillParentHeight=0,file=userInfo_pin_map['checkBox_checked.png']
	},
	{
		name="num",type=0,typeName="Text",time=117823135,x=135,y=132,width=64,height=64,nodeAlign=kAlignTopLeft,visible=1,fillParentWidth=0,fillParentHeight=0,string=[[￥12元]],fontSize=30,textAlign=kAlignLeft,colorRed=143,colorGreen=92,colorBlue=31
	}
}
return vipTypeItem;