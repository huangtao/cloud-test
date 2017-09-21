local match_hall_detail_verification_layout=
{
	name="match_hall_detail_verification_layout",type=0,typeName="View",time=0,x=0,y=0,width=1280,height=720,visible=1,nodeAlign=kAlignTopLeft,fillParentWidth=1,fillParentHeight=1,
	{
		name="bg",type=1,typeName="Image",time=0,x=0,y=0,width=1280,height=720,visible=1,fillParentWidth=1,fillParentHeight=1,nodeAlign=kAlignCenter,file="hall/common/bg_shiled.png"
	},
	{
		name="content",type=0,typeName="Image",time=114602562,x=0,y=0,width=828,height=512,nodeAlign=kAlignCenter,visible=1,fillParentWidth=0,fillParentHeight=0,file="hall/common/popupWindow/popupWindow_bg_55_55_55_55.png",gridLeft=55,gridRight=55,gridTop=55,gridBottom=55,
		{
			name="titleBg",type=0,typeName="Image",time=98552510,x=0,y=-55,width=617,height=190,nodeAlign=kAlignTop,visible=1,fillParentWidth=0,fillParentHeight=0,file="hall/common/popupWindow/popupWindow_title.png",
			{
				name="txtTitle",type=4,typeName="Text",time=72841867,report=0,x=0,y=-8,width=396,height=50,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignCenter,fontSize=36,textAlign=kAlignCenter,colorRed=255,colorGreen=245,colorBlue=204,string=[[输入邀请码，开启比赛！]],colorA=1
			}
		},
		{
			name="closeBtn",type=0,typeName="Button",time=98552463,x=-15,y=-15,width=60,height=60,nodeAlign=kAlignTopRight,visible=1,fillParentWidth=0,fillParentHeight=0,file="isolater/popupWindow/popupWindow_close.png"
		},
		{
			name="editorBg",type=0,typeName="Image",time=114602797,x=0,y=-110,width=580,height=65,nodeAlign=kAlignCenter,visible=1,fillParentWidth=0,fillParentHeight=0,file="hall/common/input_bg_l25_r25_t25_b25.png",gridLeft=25,gridRight=25,gridTop=25,gridBottom=25,
			{
				name="editor",type=0,typeName="EditText",time=114602895,x=0,y=0,width=550,height=64,nodeAlign=kAlignCenter,visible=1,fillParentWidth=0,fillParentHeight=0,fontSize=24,textAlign=kAlignLeft,colorRed=215,colorGreen=171,colorBlue=127
			}
		},
		{
			name="infoBg",type=0,typeName="Image",time=114603000,x=0,y=30,width=580,height=160,nodeAlign=kAlignCenter,visible=1,fillParentWidth=0,fillParentHeight=0,file="hall/common/popupWindow/popupWindow_describe_bg_25_25_25_25.png",gridLeft=25,gridRight=25,gridTop=25,gridBottom=25,
			{
				name="info",type=0,typeName="TextView",time=114603054,x=0,y=0,width=550,height=130,nodeAlign=kAlignCenter,visible=1,fillParentWidth=0,fillParentHeight=0,fontSize=24,textAlign=kAlignTopLeft,colorRed=150,colorGreen=111,colorBlue=72
			}
		},
		{
			name="confirmBtn",type=0,typeName="Button",time=114603174,x=0,y=170,width=240,height=80,nodeAlign=kAlignCenter,visible=1,fillParentWidth=0,fillParentHeight=0,file="hall/common/btns/btn_green_164x89_l25_r25_t25_b25.png",gridLeft=25,gridRight=25,gridTop=25,gridBottom=25,
			{
				name="text",type=4,typeName="Text",time=59554585,report=0,x=0,y=0,width=120,height=40,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignCenter,fontSize=36,textAlign=kAlignCenter,colorRed=255,colorGreen=245,colorBlue=204,string=[[确 定]]
			}
		}
	}
}
return match_hall_detail_verification_layout;