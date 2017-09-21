local record_envelope_qn_pin_map = require("qnFiles/qnPlist/hall/record_envelope_qn_pin");
local config_item=
{
	name="config_item",type=0,typeName="View",time=0,x=-532,y=-201,width=216,height=318,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignCenter,
	{
		name="Button_selected",type=1,typeName="Button",time=0,x=0,y=0,width=216,height=318,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTopLeft,file=record_envelope_qn_pin_map['red_envelope_sendBg.png'],varname="Button_selected",callbackfunc="onBindToSelected",
		{
			name="Text_num",type=4,typeName="Text",time=0,x=0,y=49,width=56,height=33,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignCenter,fontSize=28,textAlign=kAlignCenter,colorRed=250,colorGreen=236,colorBlue=31,string=[[8个]],colorA=1,varname="Text_num"
		},
		{
			name="Image_congratulation",type=1,typeName="Image",time=0,x=0,y=0,width=138,height=38,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignCenter,file="hall/redEnvelope/red_envelope_congratulation2.png",varname="Image_congratulation"
		},
		{
			name="View5",type=0,typeName="View",time=0,x=0,y=105,width=170,height=40,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignCenter,
			{
				name="Image_gold_icon",type=1,typeName="Image",time=0,x=0,y=0,width=50,height=50,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignLeft,file="isolater/gold.png",varname="Image_gold_icon"
			},
			{
				name="Text_gold_num",type=4,typeName="Text",time=0,x=15,y=0,width=36,height=27,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignCenter,fontSize=24,textAlign=kAlignCenter,colorRed=250,colorGreen=236,colorBlue=31,string=[[666]],colorA=1,varname="Text_gold_num"
			}
		}
	}
}
return config_item;