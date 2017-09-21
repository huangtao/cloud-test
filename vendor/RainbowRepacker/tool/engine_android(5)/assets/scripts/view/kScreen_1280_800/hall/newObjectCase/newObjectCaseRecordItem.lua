local newObjectCaseRecordItem=
{
	name="newObjectCaseRecordItem",type=0,typeName="View",time=0,x=0,y=0,width=600,height=75,visible=1,nodeAlign=kAlignTopLeft,fillParentWidth=0,fillParentHeight=0,
	{
		name="Image1",type=0,typeName="Image",time=108248533,x=0,y=0,width=600,height=2,nodeAlign=kAlignBottom,visible=1,fillParentWidth=1,fillParentHeight=0,file="hall/common/line_h2.png"
	},
	{
		name="Text_prizeName",type=0,typeName="Text",time=107602246,x=0,y=0,width=117,height=64,nodeAlign=kAlignLeft,visible=1,fillParentWidth=0,fillParentHeight=0,string=[[100元话费]],fontSize=26,textAlign=kAlignLeft,colorRed=143,colorGreen=92,colorBlue=31,colorA=1,varname="Text_prizeName"
	},
	{
		name="Text_date",type=0,typeName="Text",time=107602321,x=292,y=0,width=117,height=64,nodeAlign=kAlignLeft,visible=1,fillParentWidth=0,fillParentHeight=0,string=[[100元话费]],fontSize=26,textAlign=kAlignLeft,colorRed=143,colorGreen=92,colorBlue=31,varname="Text_date",colorA=1
	},
	{
		name="Text_state",type=0,typeName="Text",time=107602330,x=505,y=0,width=78,height=64,nodeAlign=kAlignLeft,visible=1,fillParentWidth=0,fillParentHeight=0,string=[[审核中]],fontSize=26,textAlign=kAlignLeft,colorRed=56,colorGreen=142,colorBlue=84,varname="Text_state",colorA=1
	},
	{
		name="Button_root",type=1,typeName="Button",time=0,x=409,y=353,width=600,height=75,visible=1,fillParentWidth=1,fillParentHeight=1,nodeAlign=kAlignTopLeft,file="hall/common/bg_blank.png",varname="Button_root",callbackfunc="onBindToShare"
	}
}
return newObjectCaseRecordItem;