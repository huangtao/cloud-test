local hallNotice_layout=
{
	name="hallNotice_layout",type=0,typeName="View",time=0,report=0,x=0,y=0,width=1280,height=720,visible=1,fillParentWidth=1,fillParentHeight=1,nodeAlign=kAlignTopLeft,
	{
		name="stripsMessageBG",type=1,typeName="Image",time=55479518,report=0,x=-20,y=116,width=949,height=39,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTop,file="hall/broadcast/broadcast_strip.png",
		{
			name="sendStripsBtn",type=2,typeName="Button",time=55480012,report=0,x=0,y=0,width=973,height=39,visible=1,fillParentWidth=0,fillParentHeight=1,nodeAlign=kAlignLeft,file="hall/common/bg_blank.png"
		},
		{
			name="rotatingView",type=0,typeName="View",time=92907174,report=0,x=0,y=0,width=880,height=39,visible=1,fillParentWidth=0,fillParentHeight=1,nodeAlign=kAlignRight
		},
		{
			name="speaker",type=1,typeName="Image",time=92907142,report=0,x=0,y=0,width=61,height=56,visible=0,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignRight,file="hall/broadcast/icon_talk.png"
		}
	},
	{
		name="talkBtn",type=0,typeName="Button",time=114609064,x=90,y=110,width=57,height=53,nodeAlign=kAlignTopLeft,visible=1,fillParentWidth=0,fillParentHeight=0,file="hall/hall/hall_broadcastIcon.png"
	},
	{
		name="scanningBtn",type=0,typeName="Button",time=118405843,x=55,y=111,width=60,height=66,nodeAlign=kAlignTopRight,visible=0,fillParentWidth=0,fillParentHeight=0,file="hall/broadcast/scanning.png"
	}
}
return hallNotice_layout;