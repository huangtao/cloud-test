--Created by the QnEditor,do not modify.If not,you will die very nankan!
local MAP = {
	var = {
		Text_num = 1,
		Image_gold_icon = 2,
		Text_time = 3,
		Text_status = 4,
		Button_look = 5,
	},
	ui = {
		[1] = {"Image2","Text_num"},
		[2] = {"Image2","Image_gold_icon"},
		[3] = {"Text_time"},
		[4] = {"Text_status"},
		[5] = {"Button_look"},
	},
	func = {
		[5] = "onBindLook",
	},
}
return MAP;