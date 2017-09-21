local record_envelope_qn_pin_map = require("qnFiles/qnPlist/hall/record_envelope_qn_pin");
local detail_item=
{
	name="detail_item",type=0,typeName="View",time=0,x=0,y=0,width=270,height=45,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTopLeft,
	{
		name="Image_line",type=1,typeName="Image",time=0,x=0,y=0,width=270,height=-1,visible=1,fillParentWidth=1,fillParentHeight=0,nodeAlign=kAlignBottom,file=record_envelope_qn_pin_map['redEnvelope_line2.png'],varname="Image_line"
	},
	{
		name="Button_info",type=1,typeName="Button",time=0,x=0,y=0,width=270,height=45,visible=1,fillParentWidth=1,fillParentHeight=1,nodeAlign=kAlignTopLeft,file="hall/common/bg_blank.png",varname="Button_info",callbackfunc="onBindInfo"
	},
	{
		name="Text_nickname",type=4,typeName="Text",time=0,x=0,y=0,width=144,height=25,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignLeft,fontSize=20,textAlign=kAlignLeft,colorRed=255,colorGreen=255,colorBlue=255,string=[[昵称有六个字]],colorA=1,varname="Text_nickname"
	},
	{
		name="Image_money",type=1,typeName="Image",time=0,x=170,y=0,width=30,height=30,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignLeft,file="isolater/gold.png",varname="Image_money"
	},
	{
		name="Text_num",type=4,typeName="Text",time=0,x=200,y=0,width=100,height=100,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignLeft,fontSize=20,textAlign=kAlignLeft,colorRed=255,colorGreen=255,colorBlue=255,string=[[666666]],varname="Text_num"
	}
}
return detail_item;