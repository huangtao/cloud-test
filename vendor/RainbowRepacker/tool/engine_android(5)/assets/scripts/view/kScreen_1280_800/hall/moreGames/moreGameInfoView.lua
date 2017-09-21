local moreGames_pin_map = require("qnFiles/qnPlist/hall/moreGames_pin");
local moreGameInfoView=
{
	name="moreGameInfoView",type=0,typeName="View",time=0,x=0,y=0,width=566,height=360,visible=1,nodeAlign=kAlignLeft,fillParentWidth=0,fillParentHeight=0,
	{
		name="info_bg",type=0,typeName="Image",time=110975581,x=0,y=0,width=566,height=360,nodeAlign=kAlignCenter,visible=1,fillParentWidth=0,fillParentHeight=0,file=moreGames_pin_map['download_view.png'],
		{
			name="close_btn",type=0,typeName="Button",time=110975894,x=-15,y=-10,width=60,height=60,nodeAlign=kAlignTopRight,visible=1,fillParentWidth=0,fillParentHeight=0,file="isolater/popupWindow/popupWindow_close.png"
		},
		{
			name="content_view",type=0,typeName="View",time=110975796,x=35,y=6,width=258,height=290,nodeAlign=kAlignRight,visible=1,fillParentWidth=0,fillParentHeight=0,
			{
				name="game_name",type=0,typeName="Text",time=110975997,x=0,y=0,width=64,height=45,nodeAlign=kAlignTopLeft,visible=1,fillParentWidth=0,fillParentHeight=0,fontSize=28,textAlign=kAlignLeft,colorRed=143,colorGreen=92,colorBlue=31
			},
			{
				name="game_info",type=0,typeName="TextView",time=110976118,x=0,y=45,width=260,height=105,nodeAlign=kAlignTopLeft,visible=1,fillParentWidth=0,fillParentHeight=0,fontSize=20,textAlign=kAlignTopLeft,colorRed=157,colorGreen=117,colorBlue=74
			},
			{
				name="download_btn",type=0,typeName="Button",time=110976304,x=0,y=0,width=275,height=89,nodeAlign=kAlignBottom,visible=1,fillParentWidth=0,fillParentHeight=0,file="isolater/btns/btn_green_164x89_l25_r25_t25_b25.png",gridLeft=25,gridRight=25,gridTop=25,gridBottom=25,
				{
					name="text",type=4,typeName="Text",time=59554585,report=0,x=0,y=0,width=120,height=40,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignCenter,fontSize=32,textAlign=kAlignCenter,colorRed=255,colorGreen=245,colorBlue=204,string=[[立刻下载]]
				}
			},
			{
				name="size_bg",type=0,typeName="Image",time=110976626,x=0,y=100,width=258,height=32,nodeAlign=kAlignBottom,visible=1,fillParentWidth=1,fillParentHeight=0,file=moreGames_pin_map['size_bg.png'],gridLeft=8,gridRight=8,gridTop=8,gridBottom=8,
				{
					name="size",type=4,typeName="Text",time=110976822,report=0,x=13,y=0,width=174,height=36,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignLeft,fontSize=20,textAlign=kAlignLeft,colorRed=157,colorGreen=117,colorBlue=74
				}
			}
		}
	}
}
return moreGameInfoView;