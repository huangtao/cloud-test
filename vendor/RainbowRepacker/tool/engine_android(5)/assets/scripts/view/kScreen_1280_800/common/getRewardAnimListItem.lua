local userInfo_pin_map = require("qnFiles/qnPlist/hall/userInfo_pin");
local getRewardAnimListItem=
{
	name="getRewardAnimListItem",type=0,typeName="View",time=0,report=0,x=0,y=0,width=148,height=212,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTopLeft,
	{
		name="icon_view",type=0,typeName="View",time=110975039,width=148,height=212,nodeAlign=kAlignTopLeft,visible=1,fillParentWidth=0,fillParentHeight=0,
		{
			name="bg_light",type=1,typeName="Image",time=89266125,report=0,x=0,y=0,width=148,height=148,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTop,file="hall/getRewardAnim/goodsIcon.png",
			{
				name="icon",type=0,typeName="Image",time=116524337,x=0,y=0,width=92,height=96,nodeAlign=kAlignCenter,visible=1,fillParentWidth=0,fillParentHeight=0,file=userInfo_pin_map['default_icon.png']
			}
		},
		{
			name="numView",type=0,typeName="View",time=120251950,x=0,y=4,width=170,height=60,nodeAlign=kAlignBottom,visible=1,fillParentWidth=0,fillParentHeight=0
		}
	}
}
return getRewardAnimListItem;