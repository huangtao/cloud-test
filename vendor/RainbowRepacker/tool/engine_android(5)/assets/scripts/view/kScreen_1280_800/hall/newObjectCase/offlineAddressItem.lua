local newObjectCase_pin_map = require("qnFiles/qnPlist/hall/newObjectCase_pin");
local offlineAddressItem=
{
	name="offlineAddressItem",type=0,typeName="View",time=0,x=0,y=0,width=580,height=120,visible=1,nodeAlign=kAlignTopLeft,fillParentWidth=0,fillParentHeight=0,
	{
		name="View_address",type=0,typeName="View",time=0,x=0,y=0,width=580,height=50,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTopLeft,varname="View_address",
		{
			name="icon1",type=0,typeName="Image",time=115760345,x=20,y=2,width=18,height=24,nodeAlign=kAlignLeft,visible=1,fillParentWidth=0,fillParentHeight=0,file=newObjectCase_pin_map['newCase_iconAddress.png']
		},
		{
			name="Text13",type=4,typeName="Text",time=0,x=60,y=0,width=120,height=27,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignLeft,fontSize=24,textAlign=kAlignLeft,colorRed=164,colorGreen=92,colorBlue=22,colorA=1,string=[[兑换地址：]]
		},
		{
			name="View_address_bg",type=0,typeName="View",time=0,x=180,y=14,width=375,height=30,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTopLeft,varname="View_address_bg"
		}
	},
	{
		name="View_phone",type=0,typeName="View",time=0,x=0,y=20,width=580,height=50,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignBottomLeft,varname="View_phone",callbackfunc="onBindToCall",
		{
			name="icon2",type=0,typeName="Image",time=115760509,x=20,y=2,width=20,height=20,nodeAlign=kAlignLeft,visible=1,fillParentWidth=0,fillParentHeight=0,file=newObjectCase_pin_map['newCase_iconPhone.png']
		},
		{
			name="Text11",type=4,typeName="Text",time=0,x=60,y=0,width=120,height=27,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignLeft,fontSize=24,textAlign=kAlignLeft,colorRed=164,colorGreen=92,colorBlue=22,colorA=1,string=[[联系方式：]]
		},
		{
			name="Text_phoneNum",type=4,typeName="Text",time=0,x=180,y=0,width=44,height=27,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignLeft,textAlign=kAlignLeft,colorRed=164,colorGreen=92,colorBlue=22,colorA=1,varname="Text_phoneNum",fontSize=24
		}
	},
	{
		name="Image_line",type=0,typeName="Image",time=115760895,x=0,y=0,width=580,height=2,nodeAlign=kAlignBottom,visible=1,fillParentWidth=0,fillParentHeight=0,file=newObjectCase_pin_map['newCase_lineAddress.png'],varname="Image_line"
	}
}
return offlineAddressItem;