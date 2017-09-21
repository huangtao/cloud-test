local community_pin_map = require("qnFiles/qnPlist/hall/community_pin");
local communityRankTypeList=
{
	name="communityRankTypeList",type=0,typeName="View",time=0,x=0,y=0,width=220,height=54,visible=1,nodeAlign=kAlignTopLeft,fillParentWidth=0,fillParentHeight=0,
	{
		name="clickBg",type=0,typeName="Image",time=96747644,x=0,y=0,width=2,height=2,nodeAlign=kAlignTopLeft,visible=1,fillParentWidth=0,fillParentHeight=0,file="hall/common/bg_blank.png"
	},
	{
		name="rankTypeBg",type=0,typeName="Image",time=96747742,x=0,y=0,width=220,height=54,nodeAlign=kAlignTopLeft,visible=1,fillParentWidth=0,fillParentHeight=0,file=community_pin_map['rankType_select.png'],gridLeft=20,gridRight=20,gridTop=20,gridBottom=20,
		{
			name="contentView",type=0,typeName="View",time=96747852,x=0,y=0,width=220,height=54,nodeAlign=kAlignTopLeft,visible=1,fillParentWidth=0,fillParentHeight=0,
			{
				name="listView",type=0,typeName="ListView",time=96747896,x=0,y=0,width=220,height=54,nodeAlign=kAlignTopLeft,visible=1,fillParentWidth=0,fillParentHeight=0
			},
			{
				name="clickIcon",type=0,typeName="Image",time=102596022,x=0,y=0,width=220,height=54,nodeAlign=kAlignTopLeft,visible=0,fillParentWidth=0,fillParentHeight=0,file=community_pin_map['rankType_select.png']
			}
		},
		{
			name="arrow",type=0,typeName="Image",time=96747986,x=10,y=13,width=40,height=33,nodeAlign=kAlignTopRight,visible=1,fillParentWidth=0,fillParentHeight=0,file=community_pin_map['up.png']
		}
	}
}
return communityRankTypeList;