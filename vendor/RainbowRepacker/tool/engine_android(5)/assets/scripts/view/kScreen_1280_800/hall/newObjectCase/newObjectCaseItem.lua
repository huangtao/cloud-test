local backpack_qn_pin_map = require("qnFiles/qnPlist/hall/backpack_qn_pin");
local newObjectCaseItem=
{
	name="newObjectCaseItem",type=0,typeName="View",time=0,x=0,y=0,width=200,height=203,visible=1,nodeAlign=kAlignTopLeft,fillParentWidth=0,fillParentHeight=0,
	{
		name="frameBack",type=0,typeName="Button",time=107349860,x=0,y=0,width=200,height=203,nodeAlign=kAlignCenter,visible=1,fillParentWidth=0,fillParentHeight=0,file="hall/backpack/backpack_box2.png",varname="frameBack",callbackfunc="onBindToCommonInfo",
		{
			name="iconImageBg",type=0,typeName="Image",time=107349970,x=0,y=-20,width=120,height=120,nodeAlign=kAlignCenter,visible=1,fillParentWidth=0,fillParentHeight=0,file="hall/common/bg_blank.png",varname="iconImageBg"
		}
	},
	{
		name="numFrameBack",type=0,typeName="Image",time=107350018,x=5,y=5,width=59,height=25,nodeAlign=kAlignTopRight,visible=1,fillParentWidth=0,fillParentHeight=0,file=backpack_qn_pin_map['backpack_corner_num_bg.png'],varname="numFrameBack",
		{
			name="numText",type=0,typeName="Text",time=107350019,x=0,y=0,width=34,height=25,nodeAlign=kAlignCenter,visible=1,fillParentWidth=0,fillParentHeight=0,string=[[99+]],fontSize=21,textAlign=kAlignCenter,colorRed=253,colorGreen=244,colorBlue=231,colorA=1,varname="numText"
		}
	},
	{
		name="Image_name",type=1,typeName="Image",time=0,x=0,y=0,width=186,height=48,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignBottom,file="hall/common/bg_blank.png",varname="Image_name",
		{
			name="Text_name",type=4,typeName="Text",time=0,x=0,y=-3,width=182,height=29,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignCenter,fontSize=26,textAlign=kAlignCenter,colorRed=114,colorGreen=60,colorBlue=16,colorA=1,varname="Text_name"
		}
	},
	{
		name="Image_past_day",type=1,typeName="Image",time=0,x=-27,y=18,width=128,height=36,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTopLeft,file=backpack_qn_pin_map['backpack_leftTop_corner.png'],varname="Image_past_day",
		{
			name="Text_past_day",type=4,typeName="Text",time=0,x=0,y=-3,width=72,height=20,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignCenter,fontSize=18,textAlign=kAlignCenter,colorRed=252,colorGreen=255,colorBlue=186,string=[[10天到期]],colorA=1,varname="Text_past_day"
		}
	}
}
return newObjectCaseItem;