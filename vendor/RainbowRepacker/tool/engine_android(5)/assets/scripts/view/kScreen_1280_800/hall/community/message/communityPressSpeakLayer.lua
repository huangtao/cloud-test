local community_pin_map = require("qnFiles/qnPlist/hall/community_pin");
local communityPressSpeakLayer=
{
	name="communityPressSpeakLayer",type=0,typeName="View",time=0,x=0,y=0,width=1280,height=720,visible=1,nodeAlign=kAlignTopLeft,fillParentWidth=1,fillParentHeight=1,
	{
		name="bg",type=0,typeName="Image",time=96650513,x=0,y=0,width=280,height=280,nodeAlign=kAlignCenter,visible=1,fillParentWidth=0,fillParentHeight=0,file=community_pin_map['recordBg.png'],
		{
			name="microphoneView",type=0,typeName="View",time=96659652,x=0,y=-35,width=80,height=105,nodeAlign=kAlignCenter,visible=1,fillParentWidth=0,fillParentHeight=0,
			{
				name="microphoneBg",type=0,typeName="Image",time=96653594,x=0,y=0,width=80,height=115,nodeAlign=kAlignCenter,visible=1,fillParentWidth=0,fillParentHeight=0,file=community_pin_map['recordFull.png']
			},
			{
				name="microphone",type=0,typeName="Image",time=96653787,x=0,y=0,width=80,height=115,nodeAlign=kAlignCenter,visible=1,fillParentWidth=0,fillParentHeight=0,file=community_pin_map['record.png']
			}
		},
		{
			name="loadingView",type=0,typeName="View",time=97087093,x=0,y=0,width=64,height=64,nodeAlign=kAlignCenter,visible=0,fillParentWidth=0,fillParentHeight=0,
			{
				name="loadingImg",type=0,typeName="Image",time=97087108,x=0,y=0,width=42,height=42,nodeAlign=kAlignCenter,visible=1,fillParentWidth=0,fillParentHeight=0,file="hall/common/loading.png"
			}
		},
		{
			name="hintTextView",type=0,typeName="TextView",time=102510858,x=0,y=60,width=110,height=64,nodeAlign=kAlignCenter,visible=1,fillParentWidth=0,fillParentHeight=0,string=[[手指上滑取消发送]],fontSize=24,textAlign=kAlignCenter,colorRed=255,colorGreen=255,colorBlue=255
		}
	}
}
return communityPressSpeakLayer;