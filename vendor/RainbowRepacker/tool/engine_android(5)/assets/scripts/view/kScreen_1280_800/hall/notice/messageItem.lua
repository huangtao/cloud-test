local message_pin_map = require("qnFiles/qnPlist/hall/message_pin");
local messageItem=
{
	name="messageItem",type=0,typeName="View",time=0,report=0,x=0,y=0,width=1250,height=130,visible=1,fillParentWidth=1,fillParentHeight=0,nodeAlign=kAlignTop,
	{
		name="itemBtn",type=2,typeName="Button",time=79673259,report=0,x=0,y=0,width=1280,height=125,visible=1,fillParentWidth=1,fillParentHeight=0,nodeAlign=kAlignCenter,file="hall/common/bg_blank.png",gridLeft=30,gridRight=30,gridTop=30,gridBottom=30,
		{
			name="itemView",type=0,typeName="View",time=79697354,report=0,x=0,y=0,width=1250,height=140,fillTopLeftX=10,fillTopLeftY=5,fillBottomRightX=10,fillBottomRightY=5,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTop,
			{
				name="date_label",type=4,typeName="Text",time=79697447,report=0,x=0,y=0,width=162,height=45,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignRight,fontSize=32,textAlign=kAlignRight,colorRed=118,colorGreen=72,colorBlue=18,string=[[2013/12/26]]
			},
			{
				name="title_label",type=4,typeName="Text",time=79697494,report=0,x=25,y=15,width=429,height=37,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTopLeft,fontSize=32,textAlign=kAlignLeft,colorRed=118,colorGreen=72,colorBlue=18,string=[[新活动《一球成名》上线啦！]]
			},
			{
				name="content",type=4,typeName="Text",time=79697595,report=0,x=25,y=25,width=864,height=30,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignBottomLeft,fontSize=26,textAlign=kAlignLeft,colorRed=118,colorGreen=72,colorBlue=18,string=[[标题内容标题内容标题内容标题内容标题内容标题内容标题内容标题内容]]
			},
			{
				name="attachment",type=1,typeName="Image",time=80277557,report=0,x=180,y=0,width=123,height=73,visible=0,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignRight,file=message_pin_map['msg_attachment.png']
			},
			{
				name="envelope",type=1,typeName="Image",time=92806743,report=0,x=180,y=0,width=123,height=73,visible=0,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignRight,file=message_pin_map['read_icon.png']
			}
		}
	},
	{
		name="line",type=1,typeName="Image",time=89206299,report=0,x=0,y=0,width=1280,height=2,fillTopLeftX=10,fillTopLeftY=128,fillBottomRightX=10,fillBottomRightY=0,visible=1,fillParentWidth=1,fillParentHeight=0,nodeAlign=kAlignBottom,file="hall/common/line.png"
	}
}
return messageItem;