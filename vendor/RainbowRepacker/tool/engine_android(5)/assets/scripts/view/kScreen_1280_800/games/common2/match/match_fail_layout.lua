local match_fail_layout=
{
	name="match_fail_layout",type=0,typeName="View",time=0,x=0,y=0,width=1280,height=720,visible=1,fillParentWidth=1,fillParentHeight=1,nodeAlign=kAlignTopLeft,
	{
		name="shiled",type=1,typeName="Image",time=0,x=482,y=368,width=1280,height=720,visible=1,fillParentWidth=1,fillParentHeight=1,nodeAlign=kAlignTopLeft,file="isolater/bg_shiled.png"
	},
	{
		name="bg",type=1,typeName="Image",time=0,x=0,y=0,width=870,height=250,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignCenter,file="games/common/match/fail_tips_bg_20_20_20_20.png",gridLeft=20,gridRight=20,gridTop=20,gridBottom=20,
		{
			name="tips",type=4,typeName="Text",time=0,x=0,y=50,width=736,height=40,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTop,fontSize=30,textAlign=kAlignTop,colorRed=255,colorGreen=246,colorBlue=108,string=[[由于报名人数不足,比赛已经取消,请选择其他比赛报名。]],colorA=1
		},
		{
			name="confirmBtn",type=1,typeName="Button",time=0,x=0,y=45,width=276,height=80,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignBottom,file="isolater/btns/btn_green_164x89_l25_r25_t25_b25.png",gridLeft=25,gridRight=25,gridTop=25,gridBottom=25,
			{
				name="Text11",type=4,typeName="Text",time=0,x=0,y=0,width=102,height=39,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignCenter,fontSize=34,textAlign=kAlignLeft,colorRed=255,colorGreen=235,colorBlue=186,string=[[知道了]],colorA=1
			}
		}
	}
}
return match_fail_layout;