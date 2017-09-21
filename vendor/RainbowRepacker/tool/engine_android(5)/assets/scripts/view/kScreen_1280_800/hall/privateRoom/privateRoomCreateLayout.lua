local privateRoomCreateLayout=
{
	name="privateRoomCreateLayout",type=0,typeName="View",time=0,x=0,y=0,width=1280,height=720,visible=1,fillParentWidth=1,fillParentHeight=1,nodeAlign=kAlignTopLeft,
	{
		name="bg",type=1,typeName="Image",time=0,x=0,y=0,width=1280,height=720,visible=1,fillParentWidth=1,fillParentHeight=1,nodeAlign=kAlignTopLeft,file="hall/privateRoom/private_room_bg.jpg"
	},
	{
		name="centerView",type=0,typeName="View",time=0,x=0,y=-30,width=1280,height=360,visible=1,fillParentWidth=1,fillParentHeight=0,nodeAlign=kAlignCenter,
		{
			name="content",type=1,typeName="Image",time=0,x=0,y=0,width=1079,height=360,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignCenter,file="hall/common/popupWindow/popupWindow_bg_55_55_55_55.png",gridLeft=55,gridRight=55,gridTop=55,gridBottom=55,
			{
				name="confirmBtn",type=2,typeName="Button",time=90644656,report=0,x=0,y=-150,width=220,height=80,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignBottom,file="hall/common/btns/btn_green_164x89_l25_r25_t25_b25.png",gridLeft=25,gridRight=25,gridTop=25,gridBottom=25,
				{
					name="text",type=4,typeName="Text",time=90644657,report=0,x=0,y=0,width=91.25,height=41,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignCenter,fontSize=36,textAlign=kAlignCenter,colorRed=255,colorGreen=250,colorBlue=200,string=[[开 房]],colorA=1
				}
			}
		},
		{
			name="contentView",type=0,typeName="View",time=0,x=0,y=0,width=1280,height=300,visible=1,fillParentWidth=1,fillParentHeight=0,nodeAlign=kAlignCenter,
			{
				name="customView",type=0,typeName="View",time=0,x=0,y=0,width=1280,height=300,visible=1,fillParentWidth=1,fillParentHeight=0,nodeAlign=kAlignCenter
			}
		}
	}
}
return privateRoomCreateLayout;