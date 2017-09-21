local message_pin_map = require("qnFiles/qnPlist/hall/message_pin");
local userInfo_pin_map = require("qnFiles/qnPlist/hall/userInfo_pin");
local messageItemInfo=
{
	name="messageItemInfo",type=0,typeName="View",time=0,report=0,x=0,y=0,width=168,height=200,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTopLeft,
	{
		name="bg",type=1,typeName="Image",time=79687029,report=0,x=0,y=2,width=148,height=148,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTop,file=userInfo_pin_map['quality_yellow.png']
	},
	{
		name="havegot",type=1,typeName="Image",time=82112623,report=0,x=0,y=24,width=90,height=50,visible=0,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTop,file=message_pin_map['msg_havegot.png']
	},
	{
		name="count",type=5,typeName="TextView",time=0,x=0,y=0,width=168,height=50,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignBottom,fontSize=22,textAlign=kAlignCenter,colorRed=118,colorGreen=72,colorBlue=18,string=[[五粮液歪嘴酒（套装珍藏版）]],colorA=1
	}
}
return messageItemInfo;