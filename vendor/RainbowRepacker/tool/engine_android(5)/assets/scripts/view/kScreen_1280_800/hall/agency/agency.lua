local agency_pin_map = require("qnFiles/qnPlist/hall/agency_pin");
local agency=
{
	name="agency",type=0,typeName="View",time=0,report=0,x=0,y=0,width=0,height=0,visible=1,fillParentWidth=1,fillParentHeight=1,nodeAlign=kAlignTopLeft,
	{
		name="contentView",type=0,typeName="View",time=80722301,report=0,x=0,y=0,width=200,height=150,visible=1,fillParentWidth=1,fillParentHeight=1,nodeAlign=kAlignTopLeft,
		{
			name="bg",type=1,typeName="Image",time=80718439,report=0,x=0,y=0,width=20,height=20,visible=1,fillParentWidth=1,fillParentHeight=1,nodeAlign=kAlignTopLeft,file=agency_pin_map['bg.png'],gridLeft=4,gridRight=4,gridTop=4,gridBottom=4
		},
		{
			name="top",type=1,typeName="Image",time=80718440,report=0,x=0,y=0,width=4,height=90,visible=1,fillParentWidth=1,fillParentHeight=0,nodeAlign=kAlignTop,file=agency_pin_map['top_bar.png'],gridLeft=1,gridRight=1,gridTop=1,gridBottom=1,
			{
				name="returnBtn",type=2,typeName="Button",time=80740743,report=0,x=0,y=0,width=120,height=64,visible=1,fillParentWidth=0,fillParentHeight=1,nodeAlign=kAlignLeft,file="hall/common/bg_blank.png",
				{
					name="Image1",type=1,typeName="Image",time=80740768,report=0,x=10,y=0,width=29,height=45,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignLeft,file=agency_pin_map['back.png']
				}
			}
		}
	},
	{
		name="htmlView",type=0,typeName="View",time=80712310,report=0,x=0,y=0,width=1280,height=800,visible=1,fillParentWidth=1,fillParentHeight=1,nodeAlign=kAlignTopLeft
	}
}
return agency;