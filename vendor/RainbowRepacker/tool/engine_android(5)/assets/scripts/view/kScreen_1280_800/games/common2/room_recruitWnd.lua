local popup_map = require("qnFiles/qnPlist/games/popup");
room_recruitWnd=
{
	name="room_recruitWnd",type=0,typeName="View",time=0,report=0,x=0,y=0,width=0,height=0,visible=1,fillParentWidth=1,fillParentHeight=1,nodeAlign=kAlignCenter,
	{
		name="mask",type=1,typeName="Image",time=80213488,report=0,x=174,y=124,width=64,height=64,visible=1,fillParentWidth=1,fillParentHeight=1,nodeAlign=kAlignTopLeft,file="isolater/bg_shiled.png"
	},
	{
		name="inviteInputView",type=0,typeName="View",time=63451667,report=0,x=0,y=0,width=661,height=358,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignCenter,
		{
			name="bg",type=1,typeName="Image",time=63451060,report=0,x=0,y=0,width=98,height=96,visible=1,fillParentWidth=1,fillParentHeight=1,nodeAlign=kAlignCenter,file=popup_map['bg_blue_t25_b25_l25_r25.png'],gridLeft=25,gridRight=25,gridTop=25,gridBottom=25
		},
		{
			name="editBg",type=1,typeName="Image",time=63451125,report=0,x=0,y=23,width=613,height=234,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTop,file="isolater/input_bg_l25_r25.png",gridLeft=25,gridRight=25,gridTop=25,gridBottom=25,
			{
				name="editText",type=7,typeName="EditTextView",time=63454059,report=0,x=0,y=0,width=580,height=200,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignCenter,fontSize=28,textAlign=kAlignTopLeft,colorRed=32,colorGreen=137,colorBlue=204,string=[[二七十私人房(20141015)三缺一，密码123456]]
			}
		},
		{
			name="tips",type=4,typeName="Text",time=63451308,report=0,x=0,y=20,width=613,height=35,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignBottom,fontSize=28,textAlign=kAlignLeft,colorRed=133,colorGreen=207,colorBlue=255,string=[[发送广播将扣除300银币]]
		},
		{
			name="sendBtn",type=2,typeName="Button",time=63451471,report=0,x=17,y=8,width=200,height=85,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignBottomRight,file="games/common/btns/200x85_blue.png",gridLeft=20,gridRight=20,gridTop=20,gridBottom=20,
			{
				name="sendBtnText",type=4,typeName="Text",time=63451552,report=0,x=0,y=0,width=0,height=0,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignCenter,fontSize=36,textAlign=kAlignLeft,colorRed=255,colorGreen=250,colorBlue=200,string=[[发 送]]
			}
		}
	}
}
return room_recruitWnd;