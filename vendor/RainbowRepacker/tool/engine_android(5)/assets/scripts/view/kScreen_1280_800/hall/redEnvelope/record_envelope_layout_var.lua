--Created by the QnEditor,do not modify.If not,you will die very nankan!
local MAP = {
	var = {
		Button_close = 1,
		View_listBottom = 2,
		Text_tip = 3,
		Button_rank = 4,
		Button_to_send = 5,
	},
	ui = {
		[1] = {"Image_bg","Button_close"},
		[2] = {"Image_bg","Image_list_bg","View_listBottom"},
		[3] = {"Image_bg","Image_list_bg","Text_tip"},
		[4] = {"Image_bg","Button_rank"},
		[5] = {"Image_bg","Button_to_send"},
	},
	func = {
		[1] = "onBindToClose",
		[4] = "onBindToRank",
		[5] = "onBindToSend",
	},
}
return MAP;