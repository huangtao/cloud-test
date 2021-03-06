local newObjectCase_pin_map = require("qnFiles/qnPlist/hall/newObjectCase_pin");
local newObjectCaseShareNotice=
{
	name="newObjectCaseShareNotice",type=0,typeName="View",time=0,x=1280,y=720,width=1280,height=720,visible=1,nodeAlign=kAlignTopLeft,fillParentWidth=1,fillParentHeight=1,
	{
		name="mask",type=0,typeName="Image",time=107701257,x=0,y=0,width=1280,height=720,nodeAlign=kAlignTopLeft,visible=1,fillParentWidth=1,fillParentHeight=1,file="hall/common/bg_shiled80.png"
	},
	{
		name="View1",type=0,typeName="View",time=107701475,x=0,y=0,width=150,height=150,nodeAlign=kAlignCenter,visible=1,fillParentWidth=0,fillParentHeight=0,
		{
			name="Image_light",type=0,typeName="Image",time=107701485,x=0,y=0,width=533,height=533,nodeAlign=kAlignCenter,visible=1,fillParentWidth=0,fillParentHeight=0,file="hall/backpack/newCase_shareLight.png"
		},
		{
			name="Image_iconFrame",type=0,typeName="Image",time=107701490,x=0,y=0,width=168,height=168,nodeAlign=kAlignCenter,visible=1,fillParentWidth=0,fillParentHeight=0,file=newObjectCase_pin_map['newCaseObject_Frame.png'],
			{
				name="Image_icon",type=0,typeName="Image",time=107701494,x=0,y=0,width=150,height=150,nodeAlign=kAlignCenter,visible=1,fillParentWidth=0,fillParentHeight=0,file="hall/common/bg_blank.png"
			}
		}
	},
	{
		name="Image_Name",type=0,typeName="Image",time=107701502,x=0,y=210,width=380,height=50,nodeAlign=kAlignBottom,visible=1,fillParentWidth=0,fillParentHeight=0,file=newObjectCase_pin_map['newCase_successFrame.png'],
		{
			name="Text_Name",type=0,typeName="Text",time=107701508,x=0,y=0,width=150,height=64,nodeAlign=kAlignCenter,visible=1,fillParentWidth=0,fillParentHeight=0,string=[[兑奖券名称]],fontSize=30,textAlign=kAlignCenter,colorRed=255,colorGreen=213,colorBlue=56
		}
	},
	{
		name="Button_sure",type=0,typeName="Button",time=107701516,x=0,y=60,width=250,height=89,nodeAlign=kAlignBottom,visible=1,fillParentWidth=0,fillParentHeight=0,file="hall/common/btns/btn_orange_164x89_l25_r25_t25_b25.png",gridLeft=25,gridRight=25,gridTop=25,gridBottom=25,
		{
			name="_Text_sure",type=0,typeName="Text",time=107701523,x=0,y=0,width=64,height=64,nodeAlign=kAlignCenter,visible=1,fillParentWidth=0,fillParentHeight=0,string=[[确认]],fontSize=30,textAlign=kAlignCenter,colorRed=255,colorGreen=232,colorBlue=164
		}
	},
	{
		name="Image_compoundSuccess",type=0,typeName="Image",time=107701425,x=0,y=80,width=531,height=151,nodeAlign=kAlignTop,visible=0,fillParentWidth=0,fillParentHeight=0,file=newObjectCase_pin_map['newCase_compoundSuccess.png']
	},
	{
		name="Image_getSuccess",type=0,typeName="Image",time=107701435,x=0,y=80,width=531,height=151,nodeAlign=kAlignTop,visible=1,fillParentWidth=0,fillParentHeight=0,file=newObjectCase_pin_map['newCase_getSuccess.png']
	}
}
return newObjectCaseShareNotice;