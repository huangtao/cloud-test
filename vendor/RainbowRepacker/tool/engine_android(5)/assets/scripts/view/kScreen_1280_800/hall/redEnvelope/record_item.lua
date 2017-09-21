local record_envelope_qn_pin_map = require("qnFiles/qnPlist/hall/record_envelope_qn_pin");
local record_item=
{
	name="record_item",type=0,typeName="View",time=0,x=0,y=0,width=800,height=60,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignCenter,
	{
		name="Image8",type=1,typeName="Image",time=0,x=0,y=0,width=800,height=-1,visible=1,fillParentWidth=1,fillParentHeight=0,nodeAlign=kAlignBottom,file=record_envelope_qn_pin_map['redEnvelope_line.png']
	},
	{
		name="Image2",type=1,typeName="Image",time=0,x=0,y=0,width=182,height=50,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignLeft,file=record_envelope_qn_pin_map['red_envelope_record_num_bg.png'],
		{
			name="Text_num",type=4,typeName="Text",time=0,x=0,y=0,width=44,height=27,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignCenter,fontSize=24,textAlign=kAlignCenter,colorRed=236,colorGreen=217,colorBlue=183,string=[[666]],colorA=1,varname="Text_num"
		},
		{
			name="Image_gold_icon",type=1,typeName="Image",time=0,x=0,y=0,width=35,height=35,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignRight,file="isolater/gold.png",varname="Image_gold_icon"
		}
	},
	{
		name="Text_time",type=4,typeName="Text",time=0,x=300,y=0,width=108,height=27,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignLeft,fontSize=24,textAlign=kAlignLeft,colorRed=143,colorGreen=92,colorBlue=31,string=[[今天9：47]],colorA=1,varname="Text_time"
	},
	{
		name="Text_status",type=4,typeName="Text",time=0,x=520,y=0,width=115,height=27,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignLeft,fontSize=24,textAlign=kAlignLeft,colorRed=235,colorGreen=73,colorBlue=41,string=[[领取18/188]],colorA=1,varname="Text_status"
	},
	{
		name="Button_look",type=1,typeName="Button",time=0,x=0,y=0,width=100,height=44,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignRight,file=record_envelope_qn_pin_map['red_envelope_look.png'],varname="Button_look",callbackfunc="onBindLook"
	}
}
return record_item;