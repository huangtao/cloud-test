local onlooker_barrage_pin_map = require("qnFiles/qnPlist/games/onlooker_barrage_pin");
local onlooker_barrage_layout=
{
	name="onlooker_barrage_layout",type=0,typeName="View",time=0,x=0,y=0,width=1280,height=720,visible=1,fillParentWidth=1,fillParentHeight=1,nodeAlign=kAlignTopLeft,
	{
		name="info_View",type=0,typeName="View",time=0,x=0,y=100,width=1280,height=300,visible=1,fillParentWidth=1,fillParentHeight=0,nodeAlign=kAlignTopLeft,
		{
			name="line1",type=0,typeName="View",time=0,x=0,y=0,width=1280,height=60,visible=1,fillParentWidth=1,fillParentHeight=0,nodeAlign=kAlignTopLeft
		},
		{
			name="line2",type=0,typeName="View",time=0,x=0,y=60,width=1280,height=60,visible=1,fillParentWidth=1,fillParentHeight=0,nodeAlign=kAlignTopLeft
		},
		{
			name="line3",type=0,typeName="View",time=0,x=0,y=120,width=1280,height=60,visible=1,fillParentWidth=1,fillParentHeight=0,nodeAlign=kAlignTopLeft
		},
		{
			name="line4",type=0,typeName="View",time=0,x=0,y=180,width=1280,height=60,visible=1,fillParentWidth=1,fillParentHeight=0,nodeAlign=kAlignTopLeft
		},
		{
			name="line5",type=0,typeName="View",time=0,x=0,y=240,width=1280,height=60,visible=1,fillParentWidth=1,fillParentHeight=0,nodeAlign=kAlignTopLeft
		}
	},
	{
		name="msg_btn",type=1,typeName="Button",time=0,x=15,y=320,width=80,height=80,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignBottomRight,file=onlooker_barrage_pin_map['btn_msg.png']
	}
}
return onlooker_barrage_layout;