--Created by the QnEditor,do not modify.If not,you will die very nankan!
local MAP = {
	var = {
		Button_close = 1,
		View_listBottom = 2,
		Image_select_flag = 3,
		Button_rank = 4,
		Button_record = 5,
		Button_send = 6,
		Text_send = 7,
	},
	ui = {
		[1] = {"Image_bg","Button_close"},
		[2] = {"Image_bg","Image_list_bg","View_listBottom"},
		[3] = {"Image_bg","Image_select_flag"},
		[4] = {"Image_bg","Button_rank"},
		[5] = {"Image_bg","Button_record"},
		[6] = {"Image_bg","Button_send"},
		[7] = {"Image_bg","Button_send","Text_send"},
	},
	func = {
		[1] = "onBindToClose",
		[4] = "onBindToRank",
		[5] = "onBindToRecord",
		[6] = "onBindToSend",
	},
}
return MAP;