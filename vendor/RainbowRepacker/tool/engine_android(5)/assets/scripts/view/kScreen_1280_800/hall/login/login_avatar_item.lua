local login_pin_map = require("qnFiles/qnPlist/hall/login_pin");
local login_avatar_item=
{
	name="login_avatar_item",type=0,typeName="View",time=0,report=0,x=0,y=0,width=174,height=174,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTopLeft,
	{
		name="avatar",type=1,typeName="Image",time=90472650,report=0,x=0,y=0,width=157,height=157,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignCenter,file=login_pin_map['default_icon.png']
	},
	{
		name="selected",type=1,typeName="Image",time=90472676,report=0,x=0,y=0,width=200,height=192,visible=0,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignCenter,file=login_pin_map['icon_selected.png']
	}
}
return login_avatar_item;