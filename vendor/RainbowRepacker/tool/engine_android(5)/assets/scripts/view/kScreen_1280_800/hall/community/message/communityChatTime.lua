local communityChatTime=
{
	name="communityChatTime",type=0,typeName="View",time=0,x=0,y=0,width=1006,height=100,visible=1,nodeAlign=kAlignTopLeft,fillParentWidth=0,fillParentHeight=0,
	{
		name="leftLine",type=0,typeName="Image",time=96206526,x=-330,y=0,width=421,height=1,nodeAlign=kAlignCenter,visible=1,fillParentWidth=0,fillParentHeight=0,file="hall/community/time_split.png",effect={}
	},
	{
		name="rightLine",type=0,typeName="Image",time=117645700,x=330,y=0,width=421,height=1,nodeAlign=kAlignCenter,visible=1,fillParentWidth=0,fillParentHeight=0,file="hall/community/time_split.png",effect={shader="mirror",mirrorType=1}
	},
	{
		name="time",type=0,typeName="Text",time=96206544,x=0,y=0,width=64,height=64,nodeAlign=kAlignCenter,visible=1,fillParentWidth=0,fillParentHeight=0,string=[[2013年15月24日 04:28]],fontSize=24,textAlign=kAlignCenter,colorRed=180,colorGreen=180,colorBlue=180
	}
}
return communityChatTime;