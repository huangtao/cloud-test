local privateRoom_pin_map = require("qnFiles/qnPlist/hall/privateRoom_pin");
local privateRoomQrCode=
{
	name="privateRoomQrCode",type=0,typeName="View",time=0,x=0,y=0,width=1280,height=720,visible=1,nodeAlign=kAlignTopLeft,fillParentWidth=1,fillParentHeight=1,
	{
		name="content",type=0,typeName="View",time=106930309,x=0,y=0,width=250,height=250,nodeAlign=kAlignCenter,visible=1,fillParentWidth=0,fillParentHeight=0,
		{
			name="bg",type=0,typeName="Image",time=106931865,x=0,y=-17,width=248,height=267,nodeAlign=kAlignTopLeft,visible=1,fillParentWidth=0,fillParentHeight=0,file=privateRoom_pin_map['qrCodeBg.png']
		},
		{
			name="qrCode",type=0,typeName="Image",time=106930386,x=0,y=-8,width=180,height=180,nodeAlign=kAlignCenter,visible=1,fillParentWidth=0,fillParentHeight=0,file="games/common/match/qrcode.png"
		},
		{
			name="text",type=0,typeName="Text",time=106930954,x=0,y=2,width=64,height=40,nodeAlign=kAlignBottom,visible=1,fillParentWidth=0,fillParentHeight=0,string=[[扫码下载游戏！]],fontSize=24,textAlign=kAlignCenter,colorRed=255,colorGreen=244,colorBlue=204
		}
	}
}
return privateRoomQrCode;