local invitational_pin_map = require("qnFiles/qnPlist/hall/invitational_pin");
local invitational_system_info=
{
	name="invitational_system_info",type=0,typeName="View",time=0,x=0,y=0,width=177,height=56,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTopLeft,
	{
		name="info_view",type=0,typeName="View",time=92557434,report=0,x=0,y=0,width=177,height=56,visible=1,fillParentWidth=1,fillParentHeight=1,nodeAlign=kAlignTopLeft,
		{
			name="bg",type=1,typeName="Image",time=92557475,report=0,x=0,y=0,width=177,height=56,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignCenter,file="hall/common/bg_blank.png",gridLeft=88,gridRight=88
		},
		{
			name="battery",type=1,typeName="Image",time=92557493,report=0,x=75,y=5,width=39,height=18,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignRight,file=invitational_pin_map['battery_4.png'],varname="battery"
		},
		{
			name="timeText",type=4,typeName="Text",time=92557573,report=0,x=0,y=4,width=65,height=24,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignRight,fontSize=24,textAlign=kAlignLeft,colorRed=138,colorGreen=91,colorBlue=40,colorA=1,varname="time"
		}
	}
}
return invitational_system_info;