local historySuggestionListItem=
{
	name="historySuggestionListItem",type=0,typeName="View",time=0,report=0,x=0,y=0,width=1200,height=140,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTopLeft,
	{
		name="childFrameView",type=0,typeName="View",time=42965586,report=0,x=0,y=0,width=1200,height=140,visible=1,fillParentWidth=1,fillParentHeight=1,nodeAlign=kAlignCenter,
		{
			name="question_icon",type=1,typeName="Image",time=77772363,report=0,x=25,y=10,width=50,height=50,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTopLeft,file="hall/common/bg_blank.png",
			{
				name="Text1",type=4,typeName="Text",time=77772451,report=0,x=-15,y=0,width=37,height=50,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignRight,fontSize=26,textAlign=kAlignLeft,colorRed=118,colorGreen=72,colorBlue=18,string=[[问:]]
			}
		},
		{
			name="question",type=5,typeName="TextView",time=42861265,report=0,x=95,y=0,width=830,height=70,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTopLeft,fontSize=26,textAlign=kAlignLeft,colorRed=118,colorGreen=72,colorBlue=18
		},
		{
			name="answer_icon",type=1,typeName="Image",time=77772602,report=0,x=25,y=10,width=50,height=50,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignBottomLeft,file="hall/common/bg_blank.png",
			{
				name="Text2",type=4,typeName="Text",time=77772721,report=0,x=-15,y=0,width=37,height=50,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignRight,fontSize=26,textAlign=kAlignLeft,colorRed=20,colorGreen=126,colorBlue=64,string=[[答:]]
			}
		},
		{
			name="answer",type=5,typeName="TextView",time=42369253,report=0,x=95,y=0,width=1105,height=70,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignBottomLeft,fontSize=26,textAlign=kAlignLeft,colorRed=20,colorGreen=126,colorBlue=64
		},
		{
			name="separateLine",type=1,typeName="Image",time=42616757,report=0,x=0,y=0,width=696,height=2,visible=1,fillParentWidth=1,fillParentHeight=0,nodeAlign=kAlignBottom,file="hall/common/line.png"
		},
		{
			name="time",type=4,typeName="Text",time=90139732,report=0,x=0,y=0,width=241,height=71,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTopRight,fontSize=26,textAlign=kAlignRight,colorRed=118,colorGreen=72,colorBlue=18,string=[[2015-00-00 10:00:00]]
		}
	}
}
return historySuggestionListItem;