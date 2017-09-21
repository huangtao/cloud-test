local match_record_pin_map = require("qnFiles/qnPlist/hall/match_record_pin");
local match_hall_record_item_contacts_layout=
{
	name="match_hall_record_item_contacts_layout",type=0,typeName="View",time=0,x=0,y=0,width=538,height=70,visible=1,nodeAlign=kAlignCenter,fillParentWidth=0,fillParentHeight=0,
	{
		name="line",type=0,typeName="Image",time=116086440,x=0,y=-2,width=538,height=2,nodeAlign=kAlignBottom,visible=1,fillParentWidth=0,fillParentHeight=0,file=match_record_pin_map['record_line.png']
	},
	{
		name="name",type=0,typeName="Text",time=116086592,x=0,y=0,width=144,height=40,nodeAlign=kAlignLeft,visible=1,fillParentWidth=0,fillParentHeight=0,fontSize=24,textAlign=kAlignLeft,colorRed=143,colorGreen=92,colorBlue=31
	},
	{
		name="number",type=0,typeName="Text",time=116086670,x=168,y=0,width=1,height=40,nodeAlign=kAlignLeft,visible=1,fillParentWidth=0,fillParentHeight=0,fontSize=24,textAlign=kAlignLeft,colorRed=143,colorGreen=92,colorBlue=31
	},
	{
		name="inviteBtn",type=0,typeName="Button",time=116086684,x=0,y=0,width=110,height=65,nodeAlign=kAlignRight,visible=1,fillParentWidth=0,fillParentHeight=0,file="hall/common/btns/btn_green_164x89_l25_r25_t25_b25.png",gridLeft=25,gridRight=25,gridTop=25,gridBottom=25,file2="hall/common/btns/btn_gray_163x89_l25_r25_t25_b25.png",
		{
			name="text",type=4,typeName="Text",time=115989721,report=0,x=0,y=0,width=100,height=50,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignCenter,fontSize=24,textAlign=kAlignCenter,colorRed=255,colorGreen=245,colorBlue=204,string=[[邀请]]
		}
	}
}
return match_hall_record_item_contacts_layout;