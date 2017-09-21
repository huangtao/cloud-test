local record_envelope_qn_pin_map = require("qnFiles/qnPlist/hall/record_envelope_qn_pin");
local anim_send=
{
	name="anim_send",type=0,typeName="View",time=0,x=0,y=0,width=1280,height=720,visible=1,fillParentWidth=1,fillParentHeight=1,nodeAlign=kAlignTopLeft,
	{
		name="Image_mask",type=1,typeName="Image",time=0,x=672,y=135,width=1280,height=720,visible=1,fillParentWidth=1,fillParentHeight=1,nodeAlign=kAlignTopLeft,file="hall/common/bg_shiled.png"
	},
	{
		name="Image_envelope",type=1,typeName="Image",time=0,x=0,y=0,width=216,height=318,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTopLeft,file=record_envelope_qn_pin_map['red_envelope_sendBg.png'],varname="Image_envelope"
	},
	{
		name="View_for_targetPos",type=0,typeName="View",time=0,x=561,y=260,width=158,height=189,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTopLeft,varname="View_for_targetPos"
	},
	{
		name="Swf_send",type=0,typeName="Swf",time=0,x=0,y=0,width=1280,height=720,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTopLeft,swfFrame=1,swfKeep=1,swfRepeat=-1,swfDelay=0,swfAuto=1,swfAutoClean=1,swfInfoLua="qnFiles/qnSwfRes/sfw/red_envelope_send_swf_info",swfPinLua="qnFiles/qnSwfRes/sfw/red_envelope_send_swf_pin",varname="Swf_send"
	}
}
return anim_send;