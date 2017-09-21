local backpack_qn_pin_map = require("qnFiles/qnPlist/backpack_qn_pin");
local newObjectCaseCompoundItem=
{
	name="newObjectCaseCompoundItem",type=0,typeName="View",time=0,x=0,y=0,width=492,height=76,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTopLeft,
	{
		name="Button_use",type=1,typeName="Button",time=0,x=0,y=0,width=492,height=76,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignCenter,file=backpack_qn_pin_map['backpack_compound_bg.png'],file2=backpack_qn_pin_map['backpack_compound_bg2.png'],varname="Button_use",callbackfunc="onBindToCompound"
	},
	{
		name="Text_compound_des",type=4,typeName="Text",time=0,x=0,y=0,width=0,height=0,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignCenter,fontSize=26,textAlign=kAlignCenter,colorRed=143,colorGreen=92,colorBlue=31,colorA=1,varname="Text_compound_des"
	}
}
return newObjectCaseCompoundItem;