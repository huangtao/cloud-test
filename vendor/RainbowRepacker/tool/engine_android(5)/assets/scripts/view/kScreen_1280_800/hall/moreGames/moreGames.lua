local moreGames_pin_map = require("qnFiles/qnPlist/hall/moreGames_pin");
local moreGames=
{
	name="moreGames",type=0,typeName="View",time=0,report=0,x=0,y=0,width=1280,height=720,visible=1,fillParentWidth=1,fillParentHeight=1,nodeAlign=kAlignTopLeft,
	{
		name="top_bg",type=1,typeName="Image",time=89260144,report=0,x=0,y=0,width=1280,height=123,visible=1,fillParentWidth=1,fillParentHeight=0,nodeAlign=kAlignTop,file="hall/common/scene_top.png"
	},
	{
		name="content_bg",type=1,typeName="Image",time=89261984,report=0,x=0,y=0,width=1280,height=635,fillTopLeftX=0,fillTopLeftY=83,fillBottomRightX=0,fillBottomRightY=0,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignBottom,file="hall/common/scene_bg.png"
	},
	{
		name="topView",type=0,typeName="View",time=89261878,report=0,x=0,y=0,width=0,height=97,visible=1,fillParentWidth=1,fillParentHeight=0,nodeAlign=kAlignTop,
		{
			name="returnBtn",type=2,typeName="Button",time=89261879,report=0,x=23,y=14,width=71,height=71,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTopLeft,file="hall/common/btn_return.png"
		},
		{
			name="titleBg",type=1,typeName="Image",time=89261881,report=0,x=3,y=-45,width=430,height=147,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTop,file="hall/common/title_bg.png",
			{
				name="title",type=1,typeName="Image",time=89261882,report=0,x=-3,y=65,width=200,height=52,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTop,file=moreGames_pin_map['more_games.png']
			}
		}
	},
	{
		name="contentView",type=0,typeName="View",time=89261946,report=0,x=6,y=127,width=1268,height=643,fillTopLeftX=6,fillTopLeftY=100,fillBottomRightX=6,fillBottomRightY=0,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTopLeft,
		{
			name="gameListView",type=0,typeName="View",time=89261952,report=0,x=0,y=0,width=1268,height=600,visible=1,fillParentWidth=1,fillParentHeight=1,nodeAlign=kAlignCenter
		}
	}
}
return moreGames;