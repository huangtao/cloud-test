local match_record_pin_map = require("qnFiles/qnPlist/hall/match_record_pin");
local match_hall_record_share_layout=
{
	name="match_hall_record_share_layout",type=0,typeName="View",time=0,x=0,y=0,width=1280,height=720,visible=1,nodeAlign=kAlignTopLeft,fillParentWidth=1,fillParentHeight=1,
	{
		name="contentBg",type=0,typeName="Image",time=103372243,x=0,y=0,width=260,height=249,nodeAlign=kAlignCenter,visible=1,fillParentWidth=0,fillParentHeight=0,file="hall/common/popup_bg.png",gridLeft=25,gridRight=25,gridTop=25,gridBottom=25,
		{
			name="momentBtn",type=0,typeName="Button",time=103372339,x=0,y=0,width=2,height=83,nodeAlign=kAlignTop,visible=1,fillParentWidth=1,fillParentHeight=0,file="isolater/bg_blank.png",
			{
				name="img",type=0,typeName="Image",time=115905307,x=-50,y=0,width=50,height=43,nodeAlign=kAlignCenter,visible=1,fillParentWidth=0,fillParentHeight=0,file=match_record_pin_map['share_moment.png'],
				{
					name="text",type=0,typeName="Text",time=115905308,x=55,y=0,width=1,height=40,nodeAlign=kAlignLeft,visible=1,fillParentWidth=0,fillParentHeight=0,string=[[ 朋友圈 ]],fontSize=24,textAlign=kAlignLeft,colorRed=255,colorGreen=240,colorBlue=219
				}
			}
		},
		{
			name="wechatBtn",type=0,typeName="Button",time=103372503,x=0,y=0,width=2,height=83,nodeAlign=kAlignCenter,visible=1,fillParentWidth=1,fillParentHeight=0,file="isolater/bg_blank.png",
			{
				name="img",type=0,typeName="Image",time=115905294,x=-50,y=0,width=50,height=43,nodeAlign=kAlignCenter,visible=1,fillParentWidth=0,fillParentHeight=0,file=match_record_pin_map['share_wechat.png'],
				{
					name="text",type=0,typeName="Text",time=115905295,x=55,y=0,width=1,height=40,nodeAlign=kAlignLeft,visible=1,fillParentWidth=0,fillParentHeight=0,string=[[微信好友]],fontSize=24,textAlign=kAlignLeft,colorRed=255,colorGreen=240,colorBlue=219
				}
			}
		},
		{
			name="gameBtn",type=0,typeName="Button",time=103372505,x=0,y=0,width=2,height=83,nodeAlign=kAlignBottom,visible=1,fillParentWidth=1,fillParentHeight=0,file="isolater/bg_blank.png",
			{
				name="img",type=0,typeName="Image",time=115905362,x=-50,y=0,width=50,height=43,nodeAlign=kAlignCenter,visible=1,fillParentWidth=0,fillParentHeight=0,file=match_record_pin_map['share_game.png'],
				{
					name="text",type=0,typeName="Text",time=115905363,x=50,y=0,width=1,height=40,nodeAlign=kAlignLeft,visible=1,fillParentWidth=0,fillParentHeight=0,string=[[游戏好友]],fontSize=24,textAlign=kAlignLeft,colorRed=255,colorGreen=240,colorBlue=219
				}
			}
		},
		{
			name="lineView",type=0,typeName="View",time=110115261,x=0,y=0,width=64,height=64,nodeAlign=kAlignTopLeft,visible=1,fillParentWidth=0,fillParentHeight=0,fillTopLeftX=5,fillBottomRightX=5,fillBottomRightY=0,fillTopLeftY=0,
			{
				name="line1",type=0,typeName="Image",time=110031596,x=0,y=84,width=483,height=2,nodeAlign=kAlignTop,visible=1,fillParentWidth=1,fillParentHeight=0,file="hall/common/popup_line.png"
			},
			{
				name="line2",type=0,typeName="Image",time=110031698,x=0,y=84,width=483,height=2,nodeAlign=kAlignBottom,visible=1,fillParentWidth=1,fillParentHeight=0,file="hall/common/popup_line.png"
			}
		}
	}
}
return match_hall_record_share_layout;